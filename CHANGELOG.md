# CHANGELOG

All significant changes to this project will be documented in this file.

## [8.9.4] - 2021-10-27 U

### Fixed

- Search bar edit box was not receiving keyboard input:
  - Caused by a custom function that removes "Delphi 7 hidden form trickery," which made the edit box always focused but locked at startup.
  - You can now hit the **TAB** key to alternate between the main games list and the search bar edit box.
- Games list "out of focus" at startup:
  - Fixed by moving the `HideAppFormTaskBarButton` function from the `OnActivate` event to the `OnShow` event of the main form. "Thank you" for this bug, Delphi 7!
- Splash screen no longer appears on top of other applications when creating/scanning a games list:
  - You can safely use other applications without the Emu Loader splash screen popping up on top of them.
  - This fix only works if you create/scan the games list manually after the frontend's main window shows up (Games List window).
  - On a clean install, the splash screen still sticks on top of other applications; I am still trying to find a workaround for it.
- Splash screen now displays properly in the Windows taskbar's "thumbnail preview."
- Visibility checkup for the splash screen to prevent the timer from resetting in the middle of a function with multiple tasks.
- The following panels/windows no longer appear on top of other applications:
  - "Games list filter" message panel.
  - "MAMu_ Icons Manager" window.

### Changed

- Replaced the `TNotebook` component with `TPanelEx` in the "Run MAME Game (Extra)" screen for easier source code maintenance and future improvements.
- Updates to my **ColorBoxEx** drop-down button:
  - Moving the mouse over it doesn't make the button flicker anymore.
  - Replaced the mega-useless "down arrow button" with an **RGB picker button** (you can still click anywhere in the button to open the colors listbox).
  - Minor drawing tweaks.
- Updates to my **ComboBox2Ex** drop-down button:
  - Moving the mouse over it doesn't make the button flicker anymore.
  - Minor drawing tweaks.
- Tweaks to the startup process; it is now a little faster.
- Removed the `.exe` file extension requirement for emulators; any file extension can be used (except batch files!) or none at all.
- **"Show Image Layout Dimensions" improvements (Images popup menu):**
  - Panel colors are always in Night Mode.
  - No more floating window; the panel is now fixed on the games list (top-right position) and cannot be moved.
  - *Note:* The floating window was always on top of other applications, just like the splash screen. This feature is intended for fine-tuning image panel sizes and is not meant to be always visible.
- If `mame_listxml.xml` or `hbmame_listxml.xml` already exists in the `\temp\` folder, Emu Loader won't regenerate the file when creating MAME/HBMAME games lists.
  - After the games list is created, the XML file is deleted to prevent leftovers and allow for new MAME builds.

### Removed

- **Batch files support completely removed** from the project (`.bat`, `.cmd`).
- Checkboxes "Use Large Icons" / "Use Large Text" in several screens (no longer needed).
- Checkbox "Small Icons" in the "Select Emulators" toolbar button is gone.
- Minor source code cleaning; some deprecated functions have been deleted.
- Font size setting in the "Favorites Manager" screen is no longer needed.

### Added

- **New "RGB Color Picker":**
  - My newest creation, made from scratch!
  - Fast, lightweight, and includes a **HEX edit box** to enter colors in HEX format.
  - Used as a replacement for the "jurassic" Windows color picker in ColorBox drop-down buttons.
  - Features:
    - 16 basic colors panel for easy picking.
    - 16 or 64 shades of color; enabling these buttons shows shades of the selected color from white to black.
    - Click the "current" color box to reset.
    - Full Night Mode and 4K layout support.
  - New icon `resources\ColorPickerEx-marker.ico` for the marker cursor (mostly for 4K mode). An internal icon is used if the file is missing.
  - *Note:* You can modify the "Alpha" channel, but Emu Loader does not use it yet.
- The "RGB Quick Edit" feature is gone, as it is no longer required (previously in the colorbox buttons popup menu).
- **Support for new MAME software list tags (MAME 0.237 minimum):**
  - "Alternate title" (`alt_title`), currently visible only in the "Game Details" screen.
  - "Notes", currently visible only in the "Game Details" screen.
  - *Note:* You must re-create MAME software games lists (Overwrite Mode) to see this new info.

## [8.9.3] - 2021-09-29 U

### Fixed

- Set fonts to default was not validating font size in Night Mode / 4K Mode.
- Search bar was not filtering games correctly with the "Have/Miss" toolbar filter.
- Settings "Show Border" and "Border Color" were not updating when clicking the "Update" button in "Thumbnails Settings".
- View mode menu options "Game Icon Size" and "Tiles View Cell Size" were not properly initialized at startup.
- Edit boxes not resizing correctly in "Supermodel Settings" screen (4K mode).

### Changed

- Tiles view "Ultra Large" cell width increased to 550 pixels.

### Removed

- Custom component RichEditURL no longer needed.
- Redundant label "Filter by" removed from search bar caption text.
- Unused icon files from "\resources\main_icons\": savetofile.ico, savestate.ico, toolbar.ico, reserved.ico.

### Added

- New "Audio Compressor" setting in mame.ini ("MAME Settings" screen, Audio panel).

## [8.9.2] - 2021-09-01 U

### Fixed

- Several popup menus were not resizing correctly to 4K resolution.
- Failed to detect feature tags "sound", "graphic", "palette" for MAME device and bios sets when creating a games list (-listxml output).
- Columns sorting in "Select Machine To Run Game" screen was borked (games popup menu).
- Emulator title not showing in "Run Confirmation Dialog" message box when the emulator filename is not found (console/computer emulators).

### Changed

- Improved system icons in `\console_computer\system_icons\` folder:
  - Some icons were outdated and needed a refresh.
  - Added 256x256 resolution support; these might be used in thumbnails view when no thumb image is shown, if the thumb cell is big enough.
- If needed, game info top bar expands to show more details in message boxes (game name/game file + emulator + usage tips).
- Main menu icons are now 16x16 when not in 4K mode (previously 24x24), using an existing icons list (TImageList) to reduce RAM usage.
- Tweaks to preview image hint box; in 4K mode, icon size is increased to 32x32.
- Tiles view "details text" font size changed to 16 pixels when tiles cell size is set to "Insane 128x128" ("View Mode" tool bar button).
- Split `mameinfo.dat` and `messinfo.dat` content into two separate StringLists ("Show MAME Game Documents" feature):
  - Game info / driver info is first read from `mameinfo.dat`; if not found, it then looks for data in `messinfo.dat`.
  - This prevents showing wrong info due to duplicate game entries (avoiding merged lists).
  - Added "(source).dat file info" after the text type title to identify the source.
  - Minor tweaks to parsing routines.

### Removed

- Files `usagerules.ico` and `savestate.ico` are no longer used (`resources\main_icons\` folder).
- Setting "Larger Font Size" in "Image Hint Box" is gone ("Night Mode Settings" screen and Preferences screen).
- Removed a couple of redundant TImageList containers with duplicate icons being loaded into RAM.

### Added

- MAME/HBMAME sets additional info (requires creating a new MAME games list):
  - Cocktail mode support and cocktail status, shown in "Game Details" screen.
  - Driver "protection" tag, shown in "Game Details" screen.
  - "requiresartwork" tag to list all games that need external artwork to function properly.
  - "lan" tag for future frontend improvements; shows "Local Network" info in "Game Details" screen.
  - New "Arcade Misc Filters": "Cocktail Mode" and "Artwork Required" (tool bar buttons).
- Support for several `mame.ini` settings:
  - Directory To Share With Emulated Machines (`-share`).
  - Path To Loose Software (`-swpath`).
  - Path For LUA Plugins To Store Data, Read/Write (`-share_directory`).
- Support for `ramoption` tag in -listxml output for future frontend improvements (MAME/HBMAME only):
  - New file `\arcade\games\mame_ramsize.ini`.
  - Used in MAME machine custom settings for machines that support RAM settings.
  - Replaced manual edit box with a combo box showing only valid options.
- New games list files `mame_listslots.txt` and `mame_listmedia.txt` when creating MAME games list (MAME v0.162 minimum).
- New "Machine Slots / Media Info" panel in "Custom Parameters" screen:
  - Minimum screen resolution supported: 1024x768 (1600x900 recommended).
  - Shows slot and/or media options for the selected software list machine.
  - Custom command modification supported in the machines edit box.
  - "Run Command" button executes MAME and creates a "pipe" to capture console output text ("stdout") directly, without external temp files.

## [8.9.1] - 2021-08-13 U

### Fixed

- Enabled PNG compression in console/computer system icons (`\console_computer\system_icons\` folder).
- Fixed visibility of "Video 3" panels (BGFX, HLSL, GLSL) which were not showing up.
- Included updated and tweaked splash `logo.png` for standard resolution (`\resources\images\` folder).
- Requirements for a software list game no longer appear empty when the required item is a machine device that must be attached in a slot.
- Several tweaks to software/device requirements detection used by software list games.

### Changed

- New and improved "Nintendo Wii U" system icon (`\console_computer\system_icons\`).

### Removed

- Support for the following JAVA emulators (as they require JAVA installed and only run via .bat files):
  - Java PSP emulator "jpcsp".
  - Java Apple Computer Emulator "JACE".
  - *Note: The frontend is moving away from .bat / .cmd files for emulator filenames.*

### Added

- New "Don't Show This Again" checkbox in message boxes to disable the "Run Game Confirmation Dialog".
- Support for "microM8 Apple II Emulator" (Apple II computer system).
- Support for "GSplus" Apple IIgs Emulator (Win32 and SDL builds).
- New icon `resources\main_icons\terminal.ico` used in games popup menu for "Custom Parameters" feature.
- New "Select Machine [machine_name]" item for "Select Set" sub-menu (for software lists).
- **New Feature: Custom Parameters (MAME only):**
  - Accessible via games popup menu; always enabled.
  - Create custom strings to attach devices into slots.
  - Support for software list games, software lists, and MAME machines.
  - Media parameters and game names are added automatically.
  - Files located in `\arcade\custom_params\mame\` and sub-folders.
  - Search order: `gamename.txt` -> `parent_gamename.txt` -> `softwarelist_name.txt` -> `machinename.txt`.
- Added "DirectX 12" and "Vulkan" options to "BGFX Backend" setting (MAME v0.235+)
  - for the upcoming MAME v0.235 (got them from MAME github)
  - DirectX 12 requires Windows 10 / Windows 11
  - replaced options texts with detailed ones

## [8.9] - 2021-08-04 U

### Fixed

- Some top bar labels were invisible in message boxes, caused by the new 4K mode (oopsie!).
- Heavy flickering when selecting text with mouse on my TEditEx control (it's a component bug, not a frontend bug).
- "Arcade Systems" selector colors in main menu "View" / "Arcade ROMs Folders" were not properly set in night mode.
- Some artwork checkbox settings in "MAME Settings" screen were still enabled even though MAME doesn't support them anymore.
- Nasty bug: Every time the message box was called, "Night Mode" checkbox component would trigger the night mode's initialization function, resetting interface colors and components appearances; it's been there ever since night mode was implemented... D'OH!
- Added "Atari 2600" to the "cassette tape" supported systems list (oopsie!):
  - This makes it possible to run MAME cassette tape games with "Stella" Atari 2600 emulator.
  - Added `Stella CASSETTE="%s"` entry in "emulator_parameters[default].ini" file.
- Fixes and improvements to my custom components "TComboBoxEx2" and "TColorBoxEx" (Night Mode only):
  - Finally found a way to draw Win10 dark scroll bars, using "GetComboBoxInfo()" WinAPI to access the component's internal drop-down list handle (HWND).
  - Fixed a repaint issue not triggering after mouse hover "on/off".
  - Fixed an issue where the drop-down arrow was not vertically centered.
- Unicode game names and titles were not working correctly for Console/Computer/Handheld systems (ported from EmuCon):
  - The frontend will decode strings when parsing entries from games ".el" files and set the "IsUnicode" tag directly.
  - The "IsUnicode" tag in .el files is no longer necessary (files in "\console_computer\games\" folder).
  - Games were displaying incorrect Unicode titles and filenames in the games list.
- Console/Computer/Handheld games lists were being tagged as "updated with new games" if "Create a New List" checkbox was ticked, even though no new games were found.
- **Frontend's button in Windows taskbar not showing up at startup:**
  - A small code is executed at startup to remove the "double taskbar button" in Windows Vista and newer, caused by the Delphi 7 compiler, but it makes the taskbar button disappear until the main form shows up.
  - To mitigate this issue, that code is executed right before the main form is shown (this is the point where the taskbar button doubles itself).
- Fixed the bottom color of emulator/game top bars in several screens while in light mode.
- Text color in systems list panels was not properly painted when the panel was out of focus and when a system was disabled/unchecked.
- Not all games were being added in "Scan MAME/HBMAME Game Samples" feature (main menu "Games List").
- Fixed a bug that would crash the frontend when trying to update "played info" .ini files after exiting a game:
  - If the frontend still crashes after exiting a game, you'll need to clear its played info ("Reset Selected Game Info" menu in games popup menu).
- Changing "Tiles View Cell Size" setting in "View Mode" toolbar button now changes the icon size properly (48x48; 68x68; 128x128).
- Modifying the following settings does not reset "MAMu_ icons" cache if the view mode is not the correct one ("Game Icon Size", "Tiles View Cell Size").

### Changed

- New "Show Grayscale Icon In Game With Missing ROMs/CHDs" setting (Preferences screen, "Games List" panel):
  - By default, available games with missing ROMs/CHDs will show colored icons from now on.
  - These sets have a custom font to help you see the "have with missing ROMs" status.
  - Why should a gray icon be displayed for sets you have, but there might be ONE tiny ROM missing? It looks better this way; I myself confuse them with "missing sets" (sets you don't have) quite a lot.
  - For arcade systems only, including MAME software lists.
  - You can go back to the old gray icon by ticking the new checkbox setting in the Preferences screen.
- Color of "disabled" button state updated with darker colors and a black font; the old one was too bright (Night Mode).
- Massive frontend icons update (`\resources\main_icons\` folder tree):
  - Added 128x128 resolution icons for the 4K mode (and some 256x256 icons for future use... maybe).
  - Icons text color changed to white as default: "image category", "layout category", "toolbar filters", "arcade filters" icons.
  - Overlay icons for "image category" and "layout category" are no longer required; no need for this trickery anymore as the frontend can change the text font color of .ico files on the fly! (folder `main_icons\overlay\img_dark\` and its files are no longer required).
  - "Background band" behind texts in toolbar icons is no longer needed.
  - Replaced text silver pixels with 25% opaque pixels in 32x32 and 48x48 toolbar filter icons.
  - Image category 32x24 icons are no more; they haven't been used in quite a while.
  - Image category 32x32 icon new size; it's used in the images toolbar and in 4K mode.
  - All frontend icons must be 32-bit color depth or hell will break loose (crashes all around and all kinds of weird behavior).
  - If the .ico file doesn't have the requested icon resolution, icons are automatically upscaled thanks to the `PrivateExtractIcons()` WinAPI.
- Proper 10 pixels border for game info/emu info top bar (4K mode).
- Disabled systems are now painted with 25% blend; it makes them easier to spot in systems lists (EasyListView).
- Thumbnail view updates and fixes:
  - Support for 48x48 system background icons when thumb cell is smaller than 68x68.
  - Minor tweaks and fixes in the thumb generation/loading functions.
  - Painting bug fix in EasyListView if the thumbnail cell is too small.
  - Minor tweaks to fix misaligned overlay icons, especially if you use overlays of different sizes.
- Moved checkbox "Create a New List" to the center of the lower bar so it's easier to spot ("Create Console/Computer/Handheld Games List").
- Removed "IsUnicode" tag from games list files (Console/Computer/Handheld systems):
  - This tag is now validated and set at runtime (tag might be removed in a future build).
  - The following files will be updated automatically at startup (done only once):
    - Games files in `\console_computer\games\` folder.
    - Played games files in `\console_computer\played_games\` folder.
    - Games extra info files in `\console_computer\games_extra_data\` folder.
- Modified TntCustomEdit component to fix heavy flickering when selecting text with the mouse (TNT Unicode Delphi Components Pack):
  - The same fix as my TEditEx component was applied here.
- Source code files for all 4K mode forms are stored in `source\4K\` folder:
  - RAM usage will not increase since forms are initialized only when used, then freed from RAM on exit.
  - Files not used by the project but used for layout designs are stored in `source\4K\designs\` folder.
- Library "unitExIcon.pas" has been replaced by Microsoft's "forbidden" WinAPI `PrivateExtractIcons()`:
  - There's a weird bug in the ExIcon unit that causes an "out of resources" error under Windows 10... this unit is so old; great, but old. (I've been using this unit for many years and never had any problems until I started using Windows 10!).
  - The API `PrivateExtractIcons()` can extract icons of any resolution from 16x16 to 512x512 with just a couple of lines of code and is much easier to use than the ExIcon library; I hope Microsoft doesn't remove this API from Windows. (Why Microsoft never created an "official" WinAPI capable of doing this job is beyond me!).
  - "Load MAMu_ icons" functions are still using TExIcon; it requires a rewrite.
- Game Details updates:
  - Fixed a crash when calling this feature for the same game twice in a row (open/close details screen, open it again... BOOM!).
  - Other minor fixes and tweaks here and there.
- A couple more tweaks to "MAME Game Docs" parsing routines; they are 12ms faster.
- New "TNT Unicode" component "TntEditEx", based on "TntEdit" but with custom frame drawing, just like my "EditEx" component:
  - An edit box that can display Unicode texts, used in "Rename Game Image" feature for console/computer games.
  - New "TntEditEx.pas" file added to the TNT's "runtime" package (same package as "TntStdCtrls.pas", easier to compile and cleaner code).
  - This component was made for the "Night Mode".
  - Better to create a new component and leave the original "TntEdit" unmodified.
- Several edit boxes replaced by the `TTntEditEx` component in the project to accept Unicode texts (English / Non-English mixed).
- Changes, updates, and fixes to Delphi components (TAdvOfficeCheckBoxEx / TAdvOfficeRadioButtonEx / TEasyListView):
  - Added support for 23x23 HD CheckBox/RadioButton icons, used by the new 4K mode (it looks so pretty...).
  - New component property "CustomEnableIconHD" to toggle "HD icons" on/off (NOT available as a frontend setting). (This only works with external icons, not with Windows-themed ones).
  - Fixed CheckBox/RadioButton vertical alignment code in the EasyListView component so "HD icons" align correctly.
  - Icons are now extracted from .ico files using the `PrivateExtractIcons()` WinAPI.
  - New component properties "CustomIconsImages" and "CustomIconImagesHD" to assign external TImageLists, so the same CheckBox/RadioButton icons set can be shared by hundreds of controls in the same TForm using a single TImageList (one for regular 13x13 icons and one for HD 23x23 icons). (This prevents every control from loading the same set of .ico files; imagine a TForm with 50 CheckBox components in it... loading the same 12 icons!).
  - Added a small tutorial text in "TAdvOfficeCheckBox" source code with instructions on how to use custom icons and the new external TImageList properties.
  - All .ico files from the `resources\checkbox_radiobutton\` folder tree updated with the new 23x23 icons.
- Tons of source code optimizations and removal of duplicate functions.
- Custom CheckBox / RadioButton default profile changed to "Night Mode 1 Black" (as it should have been from day 1).
- Custom CheckBox icons set in "Customize Night Mode" and "Customize SplashScreen" changed from "Night Mode 1" to "Night Mode 1 Black"; it looks better (cannot be customized).
- Custom CheckBox/RadioButton "Night Mode 1" icons profile is gone (folder `\resources\checkbox_radiobutton\`).
- Updates/changes to "Night Mode Settings":
  - Setting "Use Windows 10 Dark Scroll Bar in Games List" removed.
  - Removed "Floating Panel" / "Caption Font" setting from "Search Games Panel Colors".
  - Source code optimizations, some internal fixes, and improved stability.
- Splash screen optimizations:
  - Form is now created directly in the project's DPR file before anything else, including the main Form. It should show up faster.
  - Some functions moved from the main unit file to the splash screen's unit file.
  - Moved splash settings from `ini_files\lightmode.ini` into a new `ini_files\splash.ini` file (done once at startup if "splash.ini" is not found).
  - Settings are the same for normal mode, 4K mode, and "4K extra" mode, except "Version Info" label position and "Shadow Distance" settings.
  - You can drag and drop the version info text with the mouse instead of using the Left/Top position bars (experimental).
  - You can drag the splash screen around with the mouse now.
  - Logo image updated with new sprites and some minor tweaking.
  - Simplified the initialization code.
- Updates and fixes to "View Missing ROMs/CHDs" feature (previously known as "Arcade Scan Results"):
  - Some ROM types were not detected correctly; fixed the ROM/CHD types validation list and included "vgmplay" software list detection. (Games scan/validation routine was not affected by this when creating a games list).
  - Fixed flicker on systems toolbar buttons.
  - Added new checkboxes filtering options:
    - "CHDs Only": show/hide sets with CHDs, with or without ROMs (HDD, CD, Flash Card, VHS).
    - "Device ROMs": show/hide sets that have device ROMs.
    - "Bios ROMs": show/hide sets that have bios ROMs.
    - NOTE: unchecking "ROMs" filter will hide sets that only have game ROMs (no CHDs, devices, bios).
  - Renamed options in "MAME set type drop-down" filter to "Arcade Games" and "Software List Games".
- The following toolbar filter settings were moved from `EmuLoader.ini` to `ini_files\games_filters.ini`:
  - Thumbnail view settings; "Machines/Systems Filter"; "Systems Quick Filter"; "MAME/Arcade Games Filter"; "Misc Filters".
  - This way you don't lose them in a clean install or if `EmuLoader.ini` gets deleted.
  - Filters moved into proper sections so they are not all mixed up into a single section.
  - This process is done once at startup if `games_filters.ini` is not found.
  - Improved: toolbar settings are saved into the .ini file right after you change them (Safe Mode ON).
- Updates to "Arcade Controller Layout" images ("Browse Games With..." sub-menu in main menu "Games List"):
  - Files moved to a new `\images\browse_controls\` folder.
  - File format changed from JPG to PNG because they just look better: `X-Arcade.png`, `HotRodSE.png`, `SlikStik.png`, `Devastator2.png`.
  - Images updated; some buttons captions were wrong and/or no longer assigned to anything.
- Main menu "View" removed to prevent clutter; its items moved to proper sub-menus.

### Added

- Support for "PNG compression" tag in .ico files; the `PrivateExtractIcons()` WinAPI supports this:
  - 256x256 / 128x128 / 68x68 icons in .ico files now have the "PNG compression" tag enabled.
  - .ico file sizes reduced quite a bit; some file sizes are now half of what they used to be.
  - No loss of quality since the PNG format is lossless.
  - Icons loading speed remains the same (from my tests).
- Added "Network Board" options to "Supermodel 3 Emulator Settings" screen:
  - You need to create the Supermodel3 games list again.
  - No support in custom game settings yet since this is an emulator WIP feature.
- Added "merge" ROM tag detection for Demul; you don't need to have parent ROMs in the clone set anymore (just like MAME):
  - It requires the latest WIP Demul build 180428 (date: April 28, 2018).
  - You need to create the Demul games list again.
  - This feature was quietly implemented in the frontend a while ago, but now it's official.
- New TEasyItem property "ReportFirstColumnIndent":
  - For the TEasyListView component, it will add a blank space in the first column when in report view mode.
  - Huge improvement for grouped view mode; no more blank icon trickery to indent clone games.
  - Favorite icons can finally be displayed in grouped view mode.
  - This property only works in "report view".
- New "Mega Large" (68x68) game icons size for details and grouped view modes:
  - For the 4K mode and "multi-line captions" in the games list when the game font size is 16 or bigger.
  - Internal indexes for "Game Icon Size" have changed; you must change this setting again (View Mode toolbar button).
  - This also makes it a lot easier (and faster) to display arcade/console/computer/handheld 68x68 system icons in TImage components, used everywhere.
- New "Ultra Large" (128x128) game icons size for tiles view mode:
  - Useful for 4K mode and "multi-line captions" in the games list when the game font size is 16 or bigger.
  - Internal indexes for "Tile View Cell Size" have changed; you must change this setting again (View Mode toolbar button).
  - This also makes it a lot easier (and faster) to display arcade/console/computer/handheld 128x128 system icons in TImage components, used everywhere.
- Implemented 4K layouts in all screens:
  - Setting "Enable 4K Mode" is no more; 4K layouts are now integrated into the project and used by default.
  - Minimum screen resolution required is 3840x2160 (anything lower will disable the 4K feature completely).
  - If your Windows DPI screen scale is higher than 100%, either disable DPI scale for "EmuLoader.exe" properties in Windows (recommended) or disable 4K mode in the frontend (main menu)... or set DPI scale to 100% in Windows.
  - Image hint panel settings, image category type, and image resolution were adapted to show larger texts and icons (Night Mode settings and Preferences "Light Mode"). (When in 4K mode, hint always uses large font sizes and a large icon, even if the setting "Large Font Size" in "Image Hint Box" is disabled).
  - 4K screen layouts might look different than standard layouts.
  - There's a "Disable 4K Mode" setting in the main menu if you insist on not using the awesome 4K layouts... WHY!?
  - Some screens require you to restart the frontend after disabling 4K mode ("Preferences" screen, "Customize Night Mode").
- 4K splash screen!
  - Big logo image 1960x1200 with adjustments and tweaks to sprites and background scenario.
  - New "4K Ultra Size x2" setting; HUGE splash screen with a 2940x1800 logo image (insane mode).
  - A few sprites were remade from high-resolution sources and are a lot more detailed. :)
  - Most small sprites were resampled to high resolution without distortion or loss of quality (no image filters were used).
  - 4K logo file: `resources\images\logo-4K.png`.
  - 4K "insane" logo file: `resources\images\logo-4K_extra.png`.
  - Alternate image files are also supported: `logo2-4K.png` or `logo2-4K_extra.png`.
  - If you're not going to use 4K mode, files `logo-4K.png` and `logo-4K_extra.png` can be safely renamed/moved/deleted.
- New "Mega Large (68x68) System Icon" for thumbnails view ("System" icon size selector in "Customize Thumbnails").
- New "Available + Missing ROMs/CHDs" games filter option ("Have/Miss Filter" toolbar button):
  - So you can view available games and games with missing ROMs/CHDs at the same time.
  - New file `filter3_05_have_and_missroms.ico` (folder `resources\main_icons\toolbar_filters\`).
  - File `filter3_05_miss_and_missroms.ico` renamed to `filter3_06_miss_and_missroms.ico` (folder `resources\main_icons\toolbar_filters\`).
- Support for "Ryujinx: Nintendo Switch Emulator":
  - There is no command line or emulator setting to auto-exit after clicking the ESC key (I think).
  - Emulator must be configured before using it with the frontend.
  - Website: <https://ryujinx.org>
  - GitHub: <https://github.com/Ryujinx>
- Added a new "VersionHelpers.pas" unit to the project to detect the Windows version properly:
  - Old code used the deprecated `GetVersionEx()` WinAPI.
  - Minimum supported Windows version is now Windows Vista (frontend will NOT run on WinXP, no matter what you do).
- **Validation code runs BEFORE the application initialization commands.**

## [8.8.8] - 2021-03-09 U

### Fixed

- RichEdit controls had garbage RTF text in some screens
- Natural sorting of "Version Info" column was not working as it should

### Changed

- RichEditURL component replaced by the Unicode ready "TntRichEdit" (from "Tnt Delphi Unicode Controls" library)
  - show Unicode texts (English and non-English mixed together)... as long as you have a proper richedit20.dll file "richedit20.dll" v5.50.99.2010 file is supplied with the frontend, from the freeware "Microsoft Word Viewer" (if you have Microsoft Office 2010 or newer installed, this file might not be needed)
  - MAME game docs can display non-English texts correctly now (mameinfo; history)
  - message boxes can display non-English filenames in "command line" texts; mostly for console/computer games (not from MAME softlists)
  - component class "TTntCustomRichEdit" modified by me to support "URL click" event, and other minor updates (TntComCtrls.pas)
- Command line texts in "Run Game Confirmation Dialog" now show a "run>" tag prefix
  - it's a cosmetic feature and to look cute
  - but it also fixes a weird "auto-font" bug from "RichEdit20W" class, depending on the .dll you're using (blaim our dear Microsoft for that!)
- function uCommon.CallShellExecute() updated to support UTF-16 WideString URLs; using ShellExecuteW() WinAPI
- Rewrite/optimization of functions to parse game docs dat files (mameinfo, history)
  - game entry detection from "history.xml" is now blazing fast... no more 2 seconds lag when selecting games with "Game Docs" feature enabled
    - ("history.xml" is now the preferred file and should be used instead of "history.dat")
- Text and text color tweaks to "Run Game Configuration Dialog" feature (on/off in main menu)

### Removed

- RichEditURL component is no longer needed, removed from the entire project, replaced by TntRichEdit

### Added

- Updated Atari800 cartridge mappers list to include new entries; for .rom raw cart files without "cart header" (for Altirra, Atari800 only)
- New setting: "Enable 4K Mode (2160p)"
  - Larger fonts, buttons, icons and other controls
  - only message boxes are supported for now
  - feature intended for monitors with 4K resolution (3840x2160) and screen DPI scale of 100%
  - in the future, some screens/dialogs will be so much bigger than current implementation and will only fit in a 4K screen resolution (crazy mode on)   (this is my personal "dream come true" feature) :) :)

## [8.8.7] - 2021-02-25 U

### Fixed

- Nasty bug causing the frontend to not find .ico files and icon.zip if you have multiple icon folders set in MAME's "ui.ini" file
- White square bug between horizontal and vertical scroll bars (bottom/right) on night mode, when both scroll bars are visible (EasyListView bug)

### Changed

- Toggle Favorites ON/OFF with single click (tool bar button)
  - easier to enable favorites
  - use mouse right-click to call the popup menu with more options; this info shows up in button's hint on mouse hover
  - fixed a bug not making button state "pressed" at startup if favorites is enabled
- Toggle MAMu_ icons ON/OFF with single click (tool bar button)
  - easier to enable game icons
  - use mouse right-click to call the popup menu with more options; this info shows up in button's hint on mouse hover
  - fixed a bug not making button state "pressed" at startup if MAMu_ icons is enabled
- Minor color tweaks in night mode:
  - game title label colors; lighter green (good games) and lighter red (games with missing ROMs)
  - scan mode labels color, from light blue to light gray
- Optimizations in "Show Game Docs" feature
  - function to add text in RichEdit rewritten for future expansion
  - better handling of Unicode strings (no proper multi-language support yet)
  - removal of duplicated code to speed things up
  - URL links in history.xml / history.dat were outdated, incorrect and not working
  - updated TCustomRichEdit base class to use richedit20.dll (v2 / v3) instead of the old richedit32.dll (v1)
  - increased RichEdit's text length limit to 16MB; it was causing crashes for some games

## [8.8.6] - 2021-01-28 U

### Fixed

- Splash screen's image was not loaded on a clean install
- I forgot to remove a beep sound when loading a game MAMu_ icon

### Changed

- Night mode setting "Use Windows 10 Dark Scroll Bar in Games List" is now enabled by default; only works on Win10 build 1903 (May 2019 update) and newer (this setting might be removed in a future build)

### Added

- Per image category "no image found" added back. You can have different PNG files once again instead of Emu Loader's "orb" image
  - 17 category files, PNG format on a new "img_missing" folder ("resources\images\img_missing\")
  - filenames are as follow:
    - Title Snapshot: title.png
    - Game Snapshot.: ingame.png
    - Marquee.......: marquee.png
    - Flyer.........: flyer.png
    - Cabinet.......: cabinet.png
    - Control Panel.: controlpanel.png
    - Software Cover: softwarecover.png
    - PCB...........: pcb.png
    - Game Artwork..: ingameartwork.png
    - End...........: end.png
    - Boss..........: boss.png
    - Logo..........: logo.png
    - Score.........: score.png
    - Versus........: versus.png
    - Game Over.....: gameover.png
    - How to Play...: howtoplay.png
    - Select........: select.png
  - if the new file is not found "resources\images\emuloader.png" will be used instead (as before)
- Support for MAME's new "history.xml" file format
  - if both "history.dat" (old format) and "history.xml" are found, the frontend will use the .XML as default
  - the first line cannot be empty as the "< ?xml " string is used to validate the XML file (otherwise the frontend will handle that file as the one with old .dat format)
  - only english text is supported (TRichEdit limitation)
  - internet links might not work if they have "%20" char as spaces (and other coded chars)

## [8.8.5] - 2020-09-30 U

### Fixed

- Changing between image categories / image layouts in a fast pace was causing the frontend to crash; "previous/next" buttons are now disabled until the process finishes
- A StringList variable was initializing twice and the 2nd ".Create" call was using wrong HashedStringList format. "FATALITY!"
  - feature affected: parse MAME multiple folders into a StringList, used by many functions ("mame.ini" and "ui.ini")
- MAMu_ icons folder could be set to "empty" in Preferences screen; MAME requires a default folder named "icons"
- ShellTreeView Win10 dark theme fix on "Browse for Folder" dialog (selection bar, text color, scroll bar)

### Changed

- New "Skip" button in "Clean Install" dialog so you can skip it and go straight to frontend's main screen
- Renamed a few source code filenames (.pas files)

### Removed

- Animated GIF in clean install dialog is kaput! It was just an experiment
  - replaced by a static "clean_install.png", like in splash screen and about screen
  - minor font color tweaks

### Added

- Multiple paths scan support for zipped images, MAMu_ icons, video previews and thumbnails view mode (MAME/HBMAME only)
  - I forgot about this completely... oopsie!
  - only the first path was used by the frontend
  - zipped images (snaps, titles, cabinets, etc)
  - thumbnails view: not even unzipped images were supported
  - video snaps: only the first path was scanned; also, videos in "\snap\" folder were not detected correctly (mixed with images)
  - MAMu_ icons: only the first path was scanned
  - updated "MAME Images Manager" to scan all paths and fixed a "dusty" bug on "Scan Invalid Images": valid images were added to the list (DUH!)
  - updated "MAMu_ Icons Manager" to scan multiple paths
  - updates to "Delete MAME and Arcade Clone Images":
    - scan multiple paths
    - resizeable window and image panel
    - folders scan function was incomplete
    - code optimizations
- Support MAME 0.225 new "mame.ini" settings
  - "beam_dot_size" - "speaker_report" - "debugger_font" - "debugger_font_size"
- Support MAME 0.225 new "ui.ini" settings (emulator default settings only)

## [8.8.4] - 2020-05-21 U

### Fixed

- Frontend crash due to unsupported " " HTML entry in game "colasm" from "cgenie_cass.xml" software list
- Since Emu Loader cannot show multi-lines "usage tips" texts, all those entries will be replaced by an empty space... for now

## [8.8.3] - 2019-12-07 U

### Fixed

- 4th image panel internal vars not emptied when no image is showing
- Word wrap was not working on image filename label (Rename/Delete Game Image screen)
- Proper word wrap on labels, specially very long and spaceless CHD filenames (Game Details screen, left panel)

### Changed

- Added a new "WordWrapSpaceless" property to my TShadowLabel component
  - word wrap works properly on long texts with no spaces
  - this is done by using "DT_EDITCONTROL" flag in the DrawTextW() WinAPI
  - it even works with Unicode texts
  - for this to work, "WordWrap" property must be enabled and "AutoSize" property must be disabled
- Updates to "MAMu_ Icons Manager"
  - buttons bar use same colors as games filters tool bar
  - replaced all buttons by my custom TBitBtnEx and TSpeedButtonEx components
  - removed bottom status bar and moved its contents to top bar
  - updated missing games list to use same font colors and selection ribbon colors of main games list
  - added support for night mode colors
  - several source code tweaks and updates
- Tweaks to selection bar's inactive colors on EasyListView controls (night mode only)

### Added

- Support for new "mame.ini" setting: "Low Latency" ("MAME Settings" screen)
  - located in "Video 2" tab, "Performance" box
  - only enabled if setting is found in "mame.ini"

## [8.8.2] - 2019-09-30 U

### Fixed

- Setting "Use Image Single Background Color" not restored at startup
- Screens "MAME Driver Filter" and "Miscellaneous Filters" not updated when changing between night mode profiles
- Font color of hint texts not restored when switching back to light mode ("Miscellaneous Filters" tool bar button)
- Several CheckBox and RadioButton controls still had shadow text enabled in night mode
- A nasty bug in my TCheckBoxEx / TRadioButtonEx components: the icon area was not cleared when drawing new icon states, overlapping existing icons and causing a "left-over" pixels effect, mostly noticeable in "RadioButton"
- Startup crash when validating emulator binary if the .exe file is missing
- Screen "Machine Type and System Filters" was not resizing correctly for resolutions lower than 1920x1080 (tool bar button)
- Ansi WinAPI FileAge() doesn't work well on Windows 10, replaced by the Unicode API FileAgeW()
- Play video preview feature was not working at all for the past 10 months... HOORAY!
- Text of selected game was black color when editing fields directly in EasyListView controls (night mode only)
- Game thumbnails fail to load in thumbnails view even if game snapshot file exists
- No auto-update game thumbnails after changing game snapshot folders in "Image Category Settings" screen (thumbnails view only)

### Changed

- Tweaks to "Delete/Copy/Move Selected Games"
  - size of "Delete" and "Cancel" buttons reduced
  - size of "Destination Folder" edit box increased
  - if less than 13 files are selected, only one column is shown to prevent waste of space
  - checkboxes "Overwrite Files" and "Add System Folder" moved above "Destination Folder edit box"
  - fixed controls alignment in bottom bar
- Darker color tweak to gradient bottom bars in night mode
- Removed italic font style from texts in help message boxes
- Text fonts tweak in several screens
  - reduced size to 9 pixels
  - changed fonts from "Segoe UI" to "Trebuchet MS" with "bold" style and removed "italic" style
  - color tweaks in night mode
- Replaced all "ExTrackBar" controls by "XiTrackBar" from the "XiControls" pack; thanks "Eugene Genev"
  - no more flickering
  - colors customized for night mode
  - used in "Customize Thumbnails", "MAME Settings" and "RGB Quick Edit" screens
  - I've made some minor tweaks to XiTrackBar component, you need my modified version to compile the frontend
- New layout for "RGB Quick Edit"
  - replaced TShape components by my flicker-free TPanelEx component (new color/current color boxes)
  - added XiTrackBar controls for easier RGB color editing
  - added form caller title to the caption bar so you know what screen you're currently editing
  - internal code tweaks

### Removed

- Shadow font setting of labels in "Search Games Panel Colors" is no more ("Customize Night Mode" screen)

### Added

- Custom CheckBox and RadioButton icons for night mode ("Customize Night Mode" screen)
  - you can use custom icon files instead of Windows themed ones
  - icons sets are located in "frontend_path\resources\checkbox_radiobutton\" folder
  - each set must be placed in its own sub-folder and the folder name is used as the set's title (no Unicode folder name support)
  - icons must be 13x13 pixels but can be at any color depth
  - each night mode profile can have a different CheckBox / RadioButton set
  - icons are applied to CheckBoxEx / RadioButtonEx / GroupBoxEx / EasyListView controls
  - if an icon filename is missing, the Windows themed icon will be used instead
- New "Use Windows 10 Dark Scroll Bar in Games List" checkbox setting ("Customize Night Mode" screen)
  - this is a hack to force Win10 dark themed scroll bars by using the Win10 API "SetWindowTheme(hWnd, 'DarkMode_Explorer', null)"
  - dark scroll bars can be used even if Windows 10 is not setup with a dark theme
  - it currently works on ListView, RichEdit, Memo, WebBrowser controls
  - no support for ComboBox, ColorBox dropdown buttons as there's no way to access the ListBox control used internally (still working on this)
  - horizontal scroll bar colors are bugged and it's caused by Windows 10, not the frontend
  - there's a white box painting bug if both horizontal and vertical scroll bars are visible (fix your sh@t, Microsoft!)
  - only Windows 10 build 1809 and newer builds are supported
- Customize splash screen (main menu "Customize Splash Screen")
  - change font color of each text
  - text shadow colors are now "black", it looks better
  - remove text shadows with "Enable Text Shadows" checkbox (untick)
  - new left-aligned texts layout with "Use Alternate Layout" checkbox
  - use an alternate logo image with "Use Logo2 File" checkbox; filename must be "logo2.png" and located in "resources\images\" folder
  - change version info text position (text is right-aligned); useful when using a different logo image
  - progress bar replaced by the new XiProgressBar component to allow custom colors
  - customize progress bar colors with several pre-defined color schemes or create your own color scheme (minimum resolution required 1280x720 / 1336x768)
  - settings are in the right side of the splash screen
  - close the splash screen with the "Close" button at bottom/right or with ESC key
  - drag the splash screen with the mouse
  - fixed "Lucida Console" font to match the font size of "Terminal" font
- NOTE: the "Terminal" font used in Emu Loader is the "vgaoem.fon" file from Windows 7; Windows 10 doesn't have this font
- Support MAME v0.214 new "mame.ini" settings

## [8.8.1] - 2019-08-18 U

### Fixed

- Icons in web info tool bar buttons were not loaded as disabled; font colors of disable buttons were wrong in night mode
- Function to delete/copy/move files was in debug mode, not working... again

## [8.8] - 2019-08-14 U

### Fixed

- Fixed a bug in "TCustomColorBox" Delphi 7 class, "SetSelected()" procedure
  - it was not repainting the control properly, and it was not caused by the frontend (damn you Delphi 7!)
  - my custom TColorBoxEx component was also affected due to this "Delphi 7" bug
  - the fix was taken from "Code Gear Delphi 2010" source code ("vlc\ExtCtrls.pas")
- Event "OnSelect()" was not properly executed on TColorBoxEx components (color dropdown buttons)
- A few default settings in "EmuLoader.ini" and "nightmode.ini" were causing problems on a clean install
- Colors for "Game Docs Status Bar" not updated when switching between light mode and night mode
- Fixes for the night mode
  - search bar background had gradient always enabled even if the gradient setting was not ticked
  - floating panel gradient background colors were not properly set, specially at startup
  - TColorBoxEx were resetting to default colors at frontend startup when viewing the "2 pages" in night mode screen
- Hint box colors and style not updated when switching between light mode and night mode
- Control "Buttons" was listed twice in "Game Details" screen when a game have multiple controls + buttons
- Game selection bar colors and font colors were not correctly set in several screens, including in "Customize Game Fonts"
- Font of column header was not properly set when night mode is enabled (MAME Machines Filter Panel)
- My custom component TEditEx was not repainting the frame color when required
- Pressed button custom colors were not applied to buttons in night mode
- Font "Terminal" is used in a few places and if it's not installed in Windows, it will be replaced by "Lucida Console" (Windows 7 users don't have to worry about this)
- App crash when trying to show game images if image category folders are not successfully loaded
- Updates to my TAdvCheckBoxEx and TAdvRadioGroupEx components
  - fixed icons positions as they were not drawn at the same position on Windows 7 and Windows 10
  - RadioGroup icon updated with a 13x13 sized image when working with Delphi 7 in design time (easier to align controls)
  - added a couple commands to get the correct CheckBox/RadioGroup icon sizes from Windows theme
- Metadata files are no longer used when mounting images on a "virtual drive" app (.cue, etc...) even if "use .cue" tool bar button is enabled (console/computer games)
- Game image files failed to mount on a virtual drive, returning an error to the user (console/computer games)

### Changed

- Night mode is now enabled by default on a clean install or if "EmuLoader.ini" file is missing
- Shadow texts are disabled in light mode for panel texts, tool bar panels, floating panels; it looks better this way
- Improvements to night mode settings (night mode screen)
  - added "Shadow Enabled" checkboxes for texts in "Search Games Panel Colors", so you can disable shadow texts
  - added "Shadow Enabled" checkboxes for texts in "Panels Colors", so you can disable shadow texts
  - added preview panels (click the "Preview" buttons) so you can see your color customizations
    - Games List Selection Bar
    - Panels Colors
    - Image Hint Box
    - Search Games Panel Colors
  - tweaks to the layout
- Rounded corners in GroupBox frames are disabled for night mode
- The overlay folder "Dark Gray" is no longer needed, these icons are now the default for night mode ("\resources\main_icons\overlay\Dark Gray\" folder can be deleted)
- Blue overlay icons moved to a new "Blue" folder ("\resources\main_icons\overlay\Blue\")
- If overlay files of a sub-folder are not found, the "Tool Bar Overlay Icons Folder" setting will reset to "Default" (night mode screen)
- Improvements to "Image Hint Box" (preferences screen, night mode screen)
  - setting "Show Unzipped/Zipped Icon" is gone, the icon is now mandatory
  - added a "Italic" font style checkbox, so you can disable the italic style (disabled by default)
  - text font size reduced to 10 pixels
  - added a new "image resolution (image type)" text below the image category title; only font color can be customized
  - added a "Larger Font Size" checkbox, for a 14 pixels font size like it was before (disabled by default)
  - added a "Box Position" setting to choose where the hint box will appear; default position is "Middle/Left"
  - fixed "middle vertical" position, it was not taking the hint box height into account
- Selection bar of menus/popup menus is a little darker, around 10%
- Moved settings panel to a popup menu ("Favorites Manager" settings button)
- Game details screen changes
  - removed shadow of texts in the left panel (night mode)
  - removed dual border from ROMs list
  - minor improvements to make sure border spaces are pixel perfect
- Removed shadow of texts in system title bars and replaced yellow font color by orange, on all screens (night mode only)
- Removed shadow of texts from labels and checkboxes in almost all screens (night mode)
- Color tweaks to texts font colors in "Delete/Rename Game Image File" screens (night mode)
- Several source code optimizations to remove redundant duplicates, mostly for the night mode
- Modified my TShadowLabel component to not show the shadow text if component is in "disabled" state and the "ShadowEnabled" property is unchecked
- If a "Label", "CheckBox", "RadioButton", "GroupBox" component is in disabled state and the "ShadowEnabled" property is unchecked, the shadow text is no longer displayed
  - it looks a lot better in night mode
  - in light mode, the "3D effect" no longer applies, but texts still look good
- Games list in "Delete Multiple Games Files" screen now uses the same colors / background image as the main games list
- Replaced "Consolas" font by "Calibri" in "MAME Game Docs" panel
- Tons of interface tweaks, specially texts and their colors
- New interface for preferences screen
  - cleaner and easy to navigate, also to prevent waste of blank space
  - page 1 is for frontend settings, page 2 is mostly for colors
  - tweaks to existing settings so they are better aligned with panels
- Several settings moved from "EmuLoader.ini" to a new "\ini_files\LightMode.ini" file (preferences screen, mostly)
  - they are all exclusive to the light mode
  - now you can do a clean install and restore these settings easily
  - most key names in .ini file were renamed to match key names from night mode preset files, you must modify your light mode settings again (sorry)
  - some "MAME Game Docs" settings moved from "el_extras.ini" file into "LightMode.ini"

### Removed

- The following is removed to simplify the interface
  - frames of games list panel, images panel and game docs panel is kaput!
  - setting "Games List Frame Colors" (preferences screen, night mode settings screen)
  - setting "Games List Status Bar, Inner/Outer Frame" (preferences screen, night mode settings screen)
  - setting "Games List Status Bar, Font Shadow Color" (preferences screen, night mode settings screen)
  - setting "Game Docs Splitter Style / Colors"; same style/colors as image splitters is used, as it was before (preferences screen, night mode screen)
  - setting "Image Panel Frame Colors" (preferences screen, night mode settings screen)
  - setting "Enable Edit Box Custom Frame Color" is no more; custom frame is always enabled in night mode (night mode screen)
  - setting "Games List Splitter" style is gone for night mode; only a single color is supported (night mode screen)
  - setting "Tool Bar Inner/Outer Frame" is no more (night mode screen)

### Added

- New games list background images, for both night mode and light mode ("\resources\images\")... thank you Fabian for the new images
- New setting "Disable Aspect Ratio", to stretch the image on the entire image panel; requires "Image Stretch" setting to be enabled (popup menu "Images")
- New setting "Round Corners" to "Games List Selection Bar" colors (preferences screen, night mode screen)
- Night mode colors support for arcade emulator setup screens: MAME, HBMAME, Supermodel, Daphne, SEGA Model 2, ZiNc
- New "Left Align Emulators Info and Games Info" setting to show message box texts aligned to the left instead of centered (preferences screen, "General" panel)
- New setting to customize games filters tool bar in light mode (preferences screen)
  - you can use gradient or solid colors
  - new "Windows Theme" checkbox, so you can disable Windows themed tool bar painting
- Support for multiple night mode profiles
  - change profiles with the new "Night Mode Profiles" box ("Customize Night Mode" screen, access thru main menu)
  - all profiles are now stored in "frontend_path\nightmode\" folder
  - file "nightmode.ini" moved to the new "\nightmode\" sub-folder and renamed to "Default.ini"
  - setting "Tool Bar Overlay Icons Folder" can be different for each profile
  - setting "Menus / Popup Menus" frame color can be different for each profile
  - current profile is automatically saved to .ini file when switching between profiles or when closing the "Customize Night Mode" screen
- New "RGB Quick Edit" for color dropdown boxes "TColorBoxEx" (popup menu, mouse right-click)
  - for an easy and quick way to select a RGB color manually
  - screens that support this new popup menu
    - Customize Night Mode
    - Image Category Settings
    - Customize Game Fonts
    - Customize Thumbnails
    - Preferences screen
- Added "Show Font Name" setting in "Customize Game Fonts" screen
  - access in popup menu (disabled by default)
  - useful for high resolution screens (1080p or higher)
- Added a custom game fonts set for night mode, split from light mode
  - have a set of game fonts for light mode and another for night mode
  - light mode filename: "\ini_files\sysgamecustomfont.ini"
  - night mode filename: "\ini_files\sysgamecustomfont_nightmode.ini"
  - updated "Customize Game Fonts" screen to load the night mode font settings if this mode is active (games popup menu, main menu "Games List")
  - if file "sysgamecustomfont_nightmode.ini" doesn't exist, it is generated from "sysgamecustomfont.ini" at startup (useful for night mode)
- New "Use A Single Background Color" setting for image categories
  - select a background color that will be used for all image categories ("Image Category Settings" screen)
  - you no longer need to select the same color on each category if you want to use the same color for all of them
  - toggle setting in main menu "Images", images popup menu or in "Image Category Settings" screen (disabled by default)
- Added options to customize games list header colors in night mode
  - text font
  - column background color, hot color, disabled color, pressed color
  - settings in Night Mode screen, "Games List Column Header" panel
- MAME v0.212 support

## [8.7.8] - 2019-06-24 US

### Fixed

- Event "OnChange()" was not executed in "TFontDialog" component after frontend recent changes
- Black frame painted in tool bar filters background when gradient setting is disabled
- Severe painting problems in my TPanelEx since last component update... damn you BitBlt()!

### Changed

- Icons of disabled menu items are now drawn with 50% blending effect instead of a grayscale icon, which looked terrible
  - Delphi's TImageList component messes up with the icon's alpha channel
  - source files "ImgList.pas" and "CommCtrl.pas" updated with new constants and functions for better support on Windows 7 and newer
- Replaced TToolBar + TToolButton controls by my custom TSpeedButtonEx so the buttons can have white font in night mode ("Favorites Manager" screen)
- More tweaks to popup menus draw routine
- Modified "TRangeBar" / "TGaugeBar" components from "Graphics32" library to add a custom color for the arrow, it was using the same color as the border color
- Night mode updates
  - moved all settings from preferences screen to its own window and updated its interface with dark colors; you'll find it on main menu "Customize Night Mode Colors"
  - added new settings so you can have different ones from the light mode
    - games list splitter colors
    - images splitter colors
    - game docs colors and splitters
    - image background color and image
  - new layout showing all settings without pages; high resolution only: 1280x1024 and higher
  - added a new "Show Preview" button, showing a new floating window so you can see you customizations in real time
    - "Games List Selection Bar"
    - "Panels Colors"
    - "Image Hint Box"

### Added

- Game Docs status bar (preferences screen, "Game Docs" page)
  - for those who go berzerk on the fact that the bottom of the game docs panel is not aligned with the games list panel
  - there's no useful info displayed there yet

## [8.7.7] - 2019-06-07 US

### Fixed

- Popup menus can now display Unicode texts, but this implementation is far from perfect
- Copy/move/delete game ROMs was not working due to an "Exit" command I forgot to remove, preventing further code from executing
- Removed some beeps playing while creating games lists
- Fixed bad Windows theme painting in my TPanelEx component, affecting all components in it... highly noticeable in light mode
- Hint text of separator lines were missing in popup menus

### Changed

- Improvements to my TBitBtnEx component
  - font color is forced to black if button is not in "custom mode" and Windows theme is enabled
  - BitBlt() function used to paint bitmap buffer into button canvas instead of Canvas.Draw() function
  - replaced "Glyph" property by "Images" (TImageList container), for 32-bit+alpha channel icons (.ico)
- Improvements to my TSpeedButtonEx component
  - font color is not changed when clicked (only applies if button style is set to "flat")
  - font color is forced to black if button is not in "custom mode" and Windows theme is enabled
  - BitBlt() function used to paint bitmap buffer into button canvas instead of Canvas.Draw() function
  - replaced "Glyph" property by "Images" (TImageList container), for 32-bit+alpha channel icons (.ico)

### Added

- Custom border for menu/popup menus
  - night mode only
  - you can customize the border color in preferences screen "Night Mode 2" page
  - experimental feature, might be buggy on Windows 10

## [8.7.6] - 2019-05-31 U

### Fixed

- Crash caused by my custom TBitBtnEx / TSpeedButtonEx components when frontend is in light mode (default theme)

## [8.7.5] - 2019-05-30 UA

### Fixed

- Buttons font color was black when in night mode

## [8.7.4] - 2019-05-29 UM

### Fixed

- Media type of Daphne games was not set to "Disc"
- Game icons/systems TImageList containers were not emptied before reloading icons
- Hint box colors of image panel #4 were not updated after exiting preferences screen
- Game files of many MAME software list games were not recognized, tagging the game as "Game With No ROMs" ("a800.xml" software list for one)
- Tweaks to prevent splash screen from hiding/showing multiple times when creating games / auditing games; this fix also prevents the timer from resetting

### Changed

- First atempt to set the correct media type icon for MAME arcade games with CHD files (HDD, Disc, Compact Flash Card, Game Video Tape VHS)
  - added an extra "ArcadeCHD_MediaType" game info tag just for this; tag is set when loading the ROMs database
  - the new media type icons are used everywhere: game status bar, run game dialog, last played games, delete game snapshot dialog, thumbnails view and others
  - HDD media type is set for games with multiple CHD files (HDD, CD, flash card) if at least one of them is HDD
  - you must re-create MAME games list to update the frontend ROMs database files
- Improvements to the thumbnails view
  - icons are no longer drawn in the thumb image
  - icons are handled as overlays and, from now on, they are drawn in the top/left or top/right of the cell (depending on the "align" setting)
  - added a "Media Type Icon" to the mix
  - The system icon for MAME software lists is now the UME icon ("emu_ume.ico"), so you know that it's a MAME game but not arcade
  - when changing icons settings but not the thumb cell dimensions, only the icons are updated in main games list; thumbnails already created no longer have to be re-created
  - new setting "Show Icons With No Thumbnail", will display the overlay icons (system, game, media, favorite) even if no thumbnail is available
  - Media type icon is now drawn after the system icon, moved the game icon below it
  - new media/game/favorite icon size drop-down selection, no more fixed 24x24 size
- Further tweaks to the night mode

### Added

- New alternate sub-folders for frontend icons, arcade/console/computer systems and arcade games icons so you don't have to replace frontend's default icons
  - toggle alternate icons on/off with the new "Use Alternate Frontend Icons" setting in main menu
  - console/computer system icons go in a new "frontend_dir\console_computer\system_icons\alternate\" folder
  - frontend icons and arcade system icons go in a new "frontend_dir\resources\main_icons\alternate\" folder
  - arcade game icons go in a new "frontend_dir\resources\gameslist_icons\alternate\" folder
  - message box icons go in a new "frontend_dir\resources\main_icons\msgbox_icons\alternate\" folder
- NOTES:
  - tool bar filter icons, image category icons and image layout icons are not supported (basically all icons that use overlay icons)
  - all icons must be 32-bits color depth (RGB + alpha channel)
  - all required resolution icons must be added to the .ico file, or the frontend will show an "icon not found" error message
  - if you enable alternate icons without having them, the frontend will load the default ones
- New media type: "Video Game Music"
  - initially used in MAME's "VGM Player" software list
  - new icon file "resources\main_icons\media_videogamemusic.ico"
- New feature: "Special" tag
  - you can tag a game for any reason: finished games, games you want to play, games you hate, games you are playing, games you want to hide...
  - games list is stored in a new "\ini_files\special.txt" file and the file format is the same as favorites files so if you are using favorites list for things like this, you can safely copy and rename the favorite profile to this new filename
  - there's a new column in details/grouped view named "Special"
  - add/remove games to/from special list in games popup menu (below "Add/Remove Favorite" menu items)
  - filter the games list with the new drop-down filter "Special List" in "Miscellaneous" tool bar filter
  - you can enable/disable the special icon for thumbnails view ("thumbnail settings" screen)
  - you can modify this new icon to your needs ("\resources\main_icons\special.ico" file)
- Night colors support for image hint boxes (preferences screen, "Night Mode 2" page)
  - separate colors from light mode
  - settings saved in "nightmode.ini" file

## [8.7.3] - 2019-04-30 US

### Fixed

- Parent .ico file not showing up in clone sets if clonename.ico doesn't exist ("MAMu_ icons" feature)
- Buttons "OK" / "Cancel" were invisible when viewing the simpler "arcade system select" dialog
- Wrong read/write of game info "playtime" / "last played" / "times played" if your have multiple games in the same system with same zipped filename but of different media types
  - example: 2 files named "Elevator Action (1995) (Nidecom).zip", both MSX1 games, one is cartridge media type and the other is floppy disk
  - wrong game info written in played games files after exiting a console/computer game
  - wrong game info read from played games files when loading games lists at startup
  - the media type was missing when searching for the game entry
  - bugs related to files located in "\console_computer\played_games\" folder
  - arcade systems and MAME software lists do not suffer from this bug
- Wrong "extra game info" data parsing for "Games Editor" (main menu "Console/Computer")
- Night mode was not toggled on/off correctly with the checkbox in messages dialog
- PaneEx "inner border color" was not set correctly in procedure uCommon.SetPanelNightColors() causing it to be the same as outer border color
- MAME arcade input files were not handled correctly in "Run Game (Extra Parameters)" screen
  - files "arcade_name.inp" in the "inp" root folder were not added to the files list, only "inp\gamename\*.inp" files
  - for arcade games only, excluding MAME softlist games
- MAME save state files were not handled correctly in "Run Game (Extra Parameters)" screen
  - files from "sta\machine_name\softwarename\gamename\" folder were completely ignored
  - for MAME software list games only, excluding arcade games
- The image layout currently in use could be disabled in "Layout Settings" screen, causing corruption in layouts .ini file read/write routine
- Extra title/machine type text color of selected systems were hard to read in night mode; light gray color replaced by dark gray
- Selection bar was not red color for CHDs with bad checksum ("Arcade Audit Results" screen)
- "CPU Filter" edit box was not correctly painted in night mode
- Search games floating panel was not showing up at startup

### Changed

- Improvements to "version info" detection in "Arcade Emulators Setup" screen and at frontend startup
- Changes and tweaks to AlterMAME feature
  - RAM variables were not initialized at startup, it could cause the frontend to crash
  - added a second AlterMAME slot so you can use two alternate emulators to run MAME games ("Arcade Emulators Setup" screen)
    - new "Autorun Game With AlterMAME 2" checkbox ("Arcade Emulators Setup" screen and games popup menu)
    - if game cannot be run with "AlterMAME 1", it will try again with "AlterMAME 2"
    - new "Run Game With AlterMAME 2" option in games popup menu to run games directly with AlterMAME 2
  - added proper detection for "FinalBurn Alpha" and "Raine" emulators in "Arcade Emulators Setup" screen and when running games
    - FBA website: <https://www.fbalpha.com>
    - Raine website: <http://raine.1emulation.com>
    - for Raine emulator, the "-nogui" parameter is added automatically to the execution command line and there's no way to toggle it off
  - better handling of CreateProcessW() exit codes "0, 1, 2, 5" after exiting emulators
  - Tweaks and fixes to texts in "run game confirmation" and "execution error" dialogs
- Renamed file "image_category_overlay.ico" to "image_category_overlay_light.ico" ("\resources\main_icons\overlay\" folder)
- Image category/layout icons updated to support overlay icons ("resources\main_icons\" folder)
- Icon files "option_check.ico" and "option_radiogroup_on.ico" replaced by better versions, suitable for light and dark backgrounds ("resources\main_icons\" folder)
- Changes and fixes to menu/popupmenu drawing colors
  - fixed a couple painting bugs in the selection bar outer border
  - fixed unreadable shortcut text color in selected items
  - added "help text" and "selected help text" in the colors array, changed them to "gray" to fix unreadable texts
  - added inner frame color to the selected items, slightly darker than menu background color
- Replaced TEdit standard component by my custom "TEditEx" component, to be used in "night mode"
  - new properties: "Color Frame", "Color Frame Focused", "Color Frame Disabled", "Round Frame"
  - property "Use Custom Border" for an easy on/off toggle when changing between light/dark backgrounds; this property if OFF by default
  - allow custom frame colors instead of the fixed Windows themed frame
  - remove the fixed white inner frame when setting edit box background color to anything other than white
- Improvements to my custom "TShadowLabel" component for dark backgrounds compatibility
  - added new "Disabled Font Color" and "Disabled Font Shadow Color" properties so you can change font colors when the component is in "not enabled" state
  - added new "Use Disabled Font Color" property for an easy on/off toggle when changing between light/dark backgrounds; this property is OFF by default
- Modified image category/layout .ico files, removed monitor frames / texts to use with overlay .ico files ("resources\main_icons\" folder)
- Moved "Tool Bar Overlay Icons Folder" setting to "Night Mode" page since this feature is not for the light mode (preferences screen)

### Removed

- All code related to "AlterMAME Default Emulator Settings" and "AlterMAME custom ini settings" completely removed from the source code

### Added

- New night mode .ico overlay files for image categories/layouts ("resources\main_icons\overlay\img_dark" folder)
- Support custom game icons for MAME software list games; "MAMu_ Icons" feature
  - file "\softwarename\gamename.ico" in arcade "icons.zip" is no longer supported
  - zipped icons for each software list must be in:   - "user_mame_icons_path\softwarename\icons.zip" filename or
    - "user_mame_icons_path\softwarename.zip" filename (alternate .zip name, exclusive Emu Loader feature!)
  - unzipped icons must be in:
    - "user_mame_icons_path\softwarename\gamename.ico" or
    - "user_mame_icons_path\icons\softwarename\gamename.ico"
  - minor tweaks to improve RAM usage and .zip files handling
  - don't know what this is ? see this thread in MAMEWorld's "News" forum:

    ```text
    http://www.mameworld.info/ubbthreads/showthreaded.php?Cat=&Number;=380709&page;=1&view;=collapsed&sb;=5&o;=&fpart;=1&vc;=1&new;=1549010727
    ```

- New setting "Show MAME Machines Status Bar" so you can hide the status bar of the machines list panel (setting is in machines list popup menu)
- Night mode colors for several dialogs and screens; colors are fixed and cannot be customizable
- Custom frame color settings for the edit box in search bar (preferences screen, "Night Mode" page, "Search Games Panel Colors" group box)
- New handheld system to the "Console/Computer" list: "Nintendo Switch"
  - only Yuzu emulator is supported: <https://yuzu-emu.org>
  - you must use "yuzu-cmd.exe" file
- Tool bar menus, filter dialogs and popup menus in dark colors for the night mode
  - you can disable the dark menu with "Show Dark Menu in Night Mode" setting in main menu if you prefer light colors
  - colors cannot be customized
  - tweaks to selection bar, made it a bit darker
  - fixed function uMain.AddDefaultIcons(), it was not reloading overlay icons properly when switching between light/night modes and when changing "ToolBar Overlay Icons Folder" setting in preferences screen
- New setting "Use Italic Font Style in System Title Bars" so you can disable italic fonts in system title bars (enabled by default)
- Added support for "VisualBoyAdvance-M" emulator and updated "\console_computer\emulator_parameters[default].ini" file

## [8.7.2] - 2018-12-07 U

### Fixed

- Commented ROM / DISK entries were added as game files when creating MAME software games lists (softwarename.xml files)
  - ROM or DISK entries ending with "-->" tag will not be added ("rocnrope" from "msx1_cart.xml" is one of the affected games)
  - you must create MAME software list games again to fix this bug (main menu "Arcade", "Create MAME Software Games List")

### Changed

- PDF game manual updates
  - support for MAME software lists
  - scan support for a sub-folder "\manuals\" added at the end of your selected PDF folder
- File "\console_computer\mame_systems_softwarelist.ini" updated to MAME .204

### Removed

- Some code cleanup, mostly commented out and deprecated

### Added

- "Search game" bar in "View Missing ROMs/CHDs" screen (audit results)
  - the frontend searches the entered string in game title and then game name if title is not a match
  - it works like the incremental search in the main games list, partial strings supported
  - you can press ENTER key in the edit box instead of clicking the "search" button
  - if there's no match, the edit box blinks red

## [8.7.1] - 2018-12-02 U

### Fixed

- Minor adjustment in the audit system; some clone games fell thru the cracks
- ROMs info in Game Details screen was not correct for some ROMs

## [8.7] - 2018-12-02 U

### Fixed

- Audit system hotfix, round 2
  - clone games you don't have wrongly tagged as "missing ROMs/CHDs"
  - games with CHDs and no game ROMs were deleted from "arcade\games\mame.miss", not listing them in "View Missing ROMs/CHDs" screen (scan results)
  - some good games were not removed from "arcade\games\mame.miss", listing them in "View Missing ROMs/CHDs" screen (scan results)
  - wrong "gamename.zip found" info shown in "View Missing ROMs/CHDs" screen for sets with no game ROMs (scan results)

### Changed

- Audit system adapted to scan clone sets the right way (and fixing some master games in the process)
  - from now on, if one clone game ROM is found, merged into parent set and "clonegamename.zip" is not found, it will be tagged as "missing ROMs/CHDs"
  - if no game ROMs/CHDs are found, but bios/device ROMs are present, the set is still tagged as "missing" (bios/device ROMs are not game ROMs)
  - if you have all clone ROMs merged into parent set but have parent ROMs missing, the clone set is still tagged as "merged" (crazy mode ON)...

## [8.6.9] - 2018-11-30 U

### Fixed

- Audit system was tagging clone games you don't have as "missing ROMs/CHDs", if you have the parent set
- Merged tag is now properly displayed in "View Missing ROMs/CHDs" screen

## [8.6.8] - 2018-11-29 U

### Fixed

- Setting "Add Leading Zero to Version Info Column" was always running after close preferences screen, even if you don't change it
- Fixes and tweaks to MAME/HBMAME audit system; you must re-create MAME/HBMAME games lists to apply, no way around it
  - merged tag was not set in several clones
  - added two new fields in the game info to improve clone sets audit; generated in RAM while loading ROMs database "mame.elrom":
    - "Set with all game ROMs "nodump" state: just for the game ROMs (exclude bios/device ROMs and parent ROMs)
    - "Set with all parent game ROMs "nodump" state: check if parent set have only "nodump" ROMs (excludes bios/device ROMs and clone ROMs)
  - several MAME sets that have game ROMs were tagged as "set with no game ROMs"
    - filter "Games With No Main Set" was showing games that shouldn't be there
    - games audit system was also affected, specially if clone sets were merged into their parent
    - most affected: games in "Konami System 573" and several other MAME machines with similar ROMs/CHDs configuration
  - several MAME clone sets were not audited correctly because all game ROMs from parent set are tagged as "nodump" and the frontend could not finding "parentsetname.zip" file (not required by MAME when all ROMs are tagged as "nodump")
  - sets were all game ROMs have "nodump" tags but also have CHD files were not audited correctly, showing up as "missing"
  - Sega Chihiro games are now properly audited; SHA-1 checksum for "seganetw" device set wasn't handled correctly due missing to "CRC32 collision" tags
- Games popup menus "Select Set" were not working properly for bios/device sets

### Changed

- Tweaks to "Game Details" screen
  - "Game Files" section now shows a green text if clone game is merged into parent set
  - sets with all game ROMs tagged as "nodump" now show in green with a "(nodump)" text
  - the ROMs list panel now shows "have/miss" proper info and icon even on "missing" games
  - other minor tweaks
- Games list font settings do not change anymore when using "available/missing filter" in tool bar buttons

### Added

- Added "Arcade Italia" URL links to the "Internet Game Info" feature (Preferences screen, "General" tab)
- Support for MAME PDF manuals (.pdf files)
  - select a folder in MAME Settings screen, "Folders" tab or in Preferences screen, "MAME Game Docs" tab
  - no zipped files support, .pdf files must be unzipped
  - relative path support (relative to MAME base directory)
  - default folder is "manuals"
  - parent set manual can be opened with clone games
  - files are opened with the Windows associated application for .pdf files (external utility)
  - setting saved in "arcade\sysimagefolders_arcade.ini" file, "manuals_directory" entry in [MAME] section, but it's not part of the image categories
  - access in games popup menu and in images tool bar buttons
  Support for "scores3.htm" so you can view MARP info again in "MAME Game Docs" feature
  - you must download "<http://replay.marpirc.net/txt/scores3.htm>" link from internet and put file into MAME's "\dats\" folder or the folder you selected for data files
  - the frontend will try to read the file and show the scores info
  - file "marp.dat" is still supported, but cannot be used not together with "scores3.htm"... pick one

## [8.6.7] - 2018-11-06 U

### Fixed

- Renamed "Namco Super System 22" to proper "Namco System Super 22"
- Fixes to MAME Settings screen
  - "Select" button for "Path to BGFX Files" was doing nothing
  - "Select" button for "BGFX Shadow Mask Texture" filename was assigned to a different TEdit control
- Audit fix: bios ROMs in game sets were not tagged as bios ROMs in case the ROM name in game set is different than ROM name in bios set, causing them to appear as missing ROMs

### Changed

- Updated madExcept library to v4.0.20
  - for some weird reason, error dialogs show Windows 8 as the OS instead of Windows 10

### Added

- Support for Supermodel SVN 741
  - added new "Enable Quad Rendering" setting
  - initial code for "NET" support; since this is preliminary emulator feature, not much can be done
- Support for MAME .202
  - "Namco System 21" has been split into mulitple drivers, arcade filtering was not working anymore
- Support for MAME .203
  - added "BGFX LUT Texture Name" setting
  - added "HLSL Bloom LUT" settings
- Video previews for arcade games can be in an extra "\videosnaps\" sub-folder
  - for arcade games only, MAME software lists and EmuCon systems are not supported
  - you can select "d:\myvideos-mame-folder\" as your main vids folder; EL will automatically search videos in "d:\myvideos-mame-folder\videosnaps\")
  - no support for multiple paths

## [8.6.6] - 2018-08-31 U

### Fixed

- Wrong "Panels Colors" settings at startup, "Title Font/Shadow", "Title 2 Font/Shadow", "Text Font/Shadow" ("Night Mode" page, Preferences screen)
- Wrong "Search Games Panel Colors" settings at startup, "Filter Font/Shadow" ("Night Mode" page, Preferences screen)

### Changed

- Modified the scope of "Ignore Exit Code 1: Invalid Function" setting to support all console/computer emulators
  - "KEGA Fusion" is no longer the only emulator returning exit code of "one" on exit
  - this error might be related to a missing and/or incompatible plugin or badly configured emulator
  - even when nothing is wrong, the emulator might give you "code 1" as an exit code :(
- NOTE: this exit code is caused by the emulators, not the frontend
Updates to "Cleanse" feature in "Favorites Manager" screen
  - a list of all entries to be removed from the favorite profile is shown for review
  - you can remove entries from that list so they are not deleted from the profile .ini
  - there's no way to show titles, only game names and/or filenames and the system they belong to

### Added

- Requested setting "Add Leading Zero to Version Info Column (MAME)" so you can have "0.200" text in the version info column instead of ".200"
- Multiple paths support for MAME preview images
  - MAME and HBMAME only
  - all image categories are supported: snaps, titles, covers, flyers, etc...
  - you can have define as many image directories you want
  - MAME softlist .zip files don't have to be in the same place as the arcade .zip files anymore, you can have "snap.zip" in one folder and "snap_sl.zip" in another
- Support for MAME .201
  - vgmplay software list is now correctly detected and sets are correctly loaded by the frontend
  - new filter to hide vgmplay softlist entries from the games list: "Hide Video Game Music Files" ("Arcade Misc Filter" tool bar button)

## [8.6.5] - 2018-08-04 US

### Fixed

- "Machines List Filter" implementation is complete
  - if you hide the parent set, all clone will hide as well
  - forgot to link the code for checkbox "Show Parent Sets Only" in "Customize Machines List" screen
  - window width increases if screen width is 1280 pixels or higher so all columns are visible without showing a horizontal scrollbar
  - proper colors in night mode
- Machines list wrong font colors in "MAME Machines Filter Panel"
- Icon alpha blending bug in "Machine Types And Systems Filters" screen when items are unchecked (tool bar button filter)

### Changed

- Renamed "MachinesList_SidePanel" section to "MAMEMachinesFilterPanel", for consistency
- Renamed "Game Font Settings" to "Customize Game Fonts" in games popup menu and main menu "Games List"

### Removed

- Colors array vars of games selection bar are no more; colors are taken from ColorBoxes in Preferences screen

### Added

- Games list selection bar colors customization (Preferences screen)
  - customize background color, frame color and font color
  - there are two bar settings for MAME and arcade, one for available games (default blue color) and one for games with missing ROMs/CHDs (default red color)
  - re-added "Gradient Bar" setting
  - two separate sets, one for light mode in "Games List" page and another for the night mode in "Night Mode" page
  - light mode settings are saved in "EmuLoader.ini"
  - night mode settings are saved in "nightmode.ini"
  - affected features so far: main games list, MAME Machines Filter Panel, "Customize Game Fonts" screen, "Customize Thumbnails" screen
- NOTE: frame cannot be removed but it can be masked with "alpha blending" and frame colors like black or white
- Night mode custom user colors support in a couple more screens (no more forced blue frames)
- New "Slot Machines" catver.ini filter added to "Arcade Miscellaneous Filters" screen

## [8.6.4] - 2018-08-01 U

### Fixed

- Oh darn... I forgot to delete some beep/ding sound commands when initializing game zipped images lists
- Re-added support to generate zipped snapshot thumbs in thumbnails view
  - the code was removed by mistake more than a year ago when EmuCon was merged with Emu Loader, and nobody noticed, not even me
  - all arcade systems are supported, "snap.zip" file; MAME also support "softwarename.zip" and "snap_sl.zip"
  - Console/computer systems from EmuCon were Ok
- Games list was not focused after a manual switch between light and night mode (main menu)

### Changed

- Minor optimizations to save some RAM when handling game image folders and improve game images preview search
- Changes to "Image Category Settings" screen
  - button "Default" folder was doing nothing
  - category folders are now read directly from config files and not from RAM vars, which might contain different data
  - relative paths in console/computer systems (from EmuCon) are now relative to the frontend root path since you can have multiple emulators per system
  - minor code tweaks

### Added

- New "Machines List Filter" filter for "MAME Machines Filter Panel" (machines list popup menu)
  - you can customize what machines appear in the list
  - it works like the "Customize MAME Software List" feature
  - excluded machines list is saved in "\arcade\mame_machines_exclude.txt" file
  - machines are only hidden from the list, not disabled
  - it's only for the machines filter panel, not for the main games list
- Support for "all-in-one" zipped image files (MAME software lists only)
  - you can have snaps for all MAME softlist games combined into one humongous file instead of separate "softwarename.zip" files
  - filename is the same as MAME's image .zip filenames, plus a "_sl" suffix
  - filename format: "snap_sl.zip", "titles_sl.zip", "covers_sl.zip", etc (all categories are supported)
  - files must be located in the same place as their "arcade/machine" files (snap.zip, titles.zip, etc)
  - you can use "softwarename.zip" files together with these new files
  - they will be scanned after "softwarename.zip"
  - easy to use, just drop files in them proper folders and start the frontend
- Mulitple image paths detection (MAME only)
  - only the first path will be used, ignoring everything else after the ; char (snaps, titles, cabinets, covers, etc)
  - removal of surrouning quotes, just to be safe (first and last char on the string)
- NOTE: there is no multi directories scan to show game preview images!
- Added "\videosnaps_sl\" sub-folder scanning for video preview, MAME software lists

## [8.6.3] - 2018-07-19 U

### Fixed

- Heavy tool bar flickering when resizing main screen / images panel
  - caused by the tool bar's "repaint" internal event (not accessible by the user)
  - tool bar "DoubleBuffer" property is now always enabled
- Frontend crash when clicking "All Visible" button in "Customize Tool Bar" (games filters tool bar)
- Image category icon in images tool bar was showing the night mode overlay while in light mode
- Frontend crash when detecting "Atari 800" cartridge type from an unzipped game Unicode filename

### Changed

- "Search Games" panel is back in the games filters tool bar
  - floating panel is still available as an option (access in "Settings" button)
  - games list attached panel is gone
  - new "Use Small 16x16 Icons" option , access in "Settings" button (default 24x24 icons)
  - new "Show Filter Labels in Small Tool Bar" option to show labels, "small tool bar" mode only
  - the "Search" tool bar button is visible only for the floating panel
  - the floating panel "enabled" state is no longer restored at startup
- "Games List Status Bar" colors limited to the light mode (Preferences screen, "Games List" page)
- Setting "Panel Outer Frame Color (7 Pixels)" renamed to "Image 7 Pixels Border Color" to avoid confusion with night mode (Preferences screen, "Games List" page)
- Behavior of panel frames have changed, two options to choose from:
  - "Outer Frame": enable this to use a single frame
  - "Inner Frame": enable this to use a double frame; "outer frame" must also be enabled
  - disabling both settings or just "outer frame" removes the panel border completely
  - tool bars updated to support the new setings
- Message box now show top bar color and labels colors according to game's set status
  - green bar for available games
  - red bar for available games with missing ROMs/CHDs
  - gray bar for missing games

### Added

- New "Show Game Documents 7 Pixels Border" checkbox and "Border Color" settings, to align the panel with images panel (Preference screen, "Game Docs" page)
- Night mode improvements ("Night Mode" page in Preferences screen)
  - "Search Games" panel colors customization expanded to include the edit box
  - customize games list frame color and visibility
  - tick the new "Use Windows Themed Border" to disable games custom frame color; it shows a single border
  - the frame in games filters tool bar is now drawn outside the client area, and it can be set to disabled, single or double frame
  - customize images panel frame colors and visibility
  - images tool bar height aligned with games filters "small tool bar", frame is now drawn outside the client area
  - "Customize Games List Status Bar Colors" settings for the night mode (colors box in "Games List" page is now only for the light mode)
- New "Panels Colors" general settings for the night mode, so you can change frame colors, background color, font color and shadow font color
  - "Apply Filters" message box
  - "Initialize Zipped Images Contents" message box
  - Game Details
  - Select a Machine to Run Game
  - Load Multi-Slot MAME Games
  - Load Console/Computer Multi Floppy Disk Games
  - Search Games floating panel
  - Rename/Delete Game Images
  - Customize MAME Software List
- NOTE 1: not all texts can have custom colors (font color and shadow font color)
- NOTE 2: background color is it's not widely applied; only for a few panels
- New setting "Tool Bar Overlay Icons Folder" (preferences screen, "Games List" page)
  - you don't have to overwrite frontend's overlay icons anymore, just create a sub-folder with your custom icons and select it in the drop-down box
  - sub-folder must be inside "frontend_dir\resources\main_icons\overlay\" base folder
  - for both light mode and night mode
  - use ANSI directory names only, no Unicode support
  - you only need to add icons that are different than the ones from the base folder
  - if an icon doesn't exist in the sub-folder, the overlay icon from the base folder will be used
  - overlay icons are used in games filters tool bar and images tool bar (so far...)
  - folder name is used as the icons set title
  - added a "Dark Grey" icons set for the night mode; thanks to "Fabian" for creating the icons

## [8.6.2] - 2018-07-06 U

## Fixed

- Forgot to include the updated file "\arcade\filters\mame_filters.ini" for "Arcade Games Filters" tool bar button
  - some filters were renamed
  - one filter slip in two for easier games filtering
  - the frontend was crashing without this updated file

### Changed

- Color tweaks to night mode
- Tweaks to "Delete/Rename Game Image File" screen
- "Search Games" panel expanded, 3 view modes:
  1. floating panel: default behavior, located just below the search button in filters tool bar
  2. panel attached to the bottom of the games list: slim panel with 40 pixels height
  3. panel attached to the top of the games list: slim panel with 40 pixels height
  - to switch between modes, click the new "tool bar" button next to the close button
  - you can customize "Night Mode" colors of the attached panel, "Night Mode" page in preferences screen
  - floating panel still have fixed colors - in light mode, colors are fixed
- "Search Games" panel "enabled" state is now restored on a frontend restart

### Removed

- Minor source code cleanup

## [8.6.1] - 2018-07-02 US

### Fixed

- Non-game files were added to a MAME software list games
  - some games have "rom" entries (battery backup, NVRAM, etc) but are not game files and should not be added ("hash\nes.xml", "hash\msx_cart.xml", others)
  - you must re-create all your MAME software list games lists again, either delete all files in "frontend_dir\arcade\mame_softwarelist_games\" folder (easier) or select "Enable: Overwrite Mode" when choosing the arcade scan mode
- FATALITY! When validating multiple selected games, bios/device sets were not validated at all (works fine with scall all games, scan single game)
- FINISH HIM! Games of "SEGA Model 2 Emulator" were not validated correctly, "model2.zip" board ROMs completely ignored
- When running single MAME arcade games, frontend was trying to detect the "machine title", intended for multi-slot machines ("uMain.GetTitleMachineToUse" function)
- Timer freeze when applying games filters on grouped view mode
- Button "Default Grid Size" and "Show Game Title" were not repainting thumb preview images (Thumbnail Settings)
- Font style was set to game filename instead of game title in "Delete Multiple Selected Games Files" screen
- Some messages were not showing up in splash screen when creating games lists, specially for "SEGA Model 2"
- CRC-32 / SHA-1 checksums of unzipped game files failed to be generated
  - some games could not be added to the games list (console/computer systems only)
  - most noticeable in "Game Details" screen
  - mostly for Unicode filenames
  - console/computer games only (ported from EmuCon)
  - some internal functions updated to support "WideString" parameters and slightly modified to fix this bug
- Frontend crash when trying to open a .zip / .7z Unicode filename in "Game Details" screen (console/computer games from EmuCon) ... this bug is almost 2 years old!
- Megatons of drawing bugs thru the entire project

### Changed

- Changes and improvements to games tool bar:
  - resized large icons from 44x40 to 48x48
  - resized small icons from 28x22 to 30x24
  - added 68x68 icons size support, useful for 2K (2560x1440) and 4K (3840x2160) screen resolutions
  - added a white background in the lower text so it's visible in night mode
  - several icons were completely remade
  - split the icon outer frame from current icons into separate overlay icons, located in a new "resources\main_icons\overlay\" folder
    - overlay icons are painted on top of the icon, alpha blend support
    - overlay icons can be customized to your liking without altering the filter icons
  - replaced the "Search" tool bar by a simple button; edit box and buttons are now placed in a new floating panel below the main tool bar
    - you can move the panel around by dragging it with the title bar
  - finally removed the dreadful "TCoolBar" control; tool bar background colors can now be customized (night mode only)
  - Renamed settings entries in "EmuLoader.ini", you need to customize buttons again in "Customize Tool Bar"
- Improvements to "Arcade Games Filters" screen (tool bar button)
  - if filter icon not found, the "no icon" was not set correctly
  - added support for 68x68 and 30x24 icon sizes, found in "resources\main_icon\arcade_filters\" folder
  - choose an icon size to browse the filters list: "Extra Large (68x68)", "Large (48x48)", "Small (30x24)"
  - additional tweaks
- Moved "Tool Bar Buttons" menu options from "View" to "Games List" main menu, renamed "Small Tool Bar" to "Icon Size" and expanded to:
  - Extra Large (68x68)
  - Large (48x48)
  - Small (30x24)
- Changes to "Customize Tool Bar"
  - replaced "Small Tool Bar" checkbox by a "Set Icon Size" buttons group: "Very Large (68x68)", "Large (48x48)", "Small (30x24)"
  - removed "Search Games Bar" checkbox since it's now listed with the other buttons
  - renamed "Hide Tool Bar" to "Show Tool Bar", so it's the same title as the checkbox option in main menu
  - additional tweaks
- Moved "Show Games Status Bar" setting from "View" to "Games List" main menu, where is belongs
- Changes to Preferences screen
  - size increased to 850x600 to give its contents more breathing room
  - moved "Internet Game Info" panel from "Images" to "General" page
  - renamed TSlitter component names of games list and images to avoid overlap settings; you must customize splitters again as "EmuLoader.ini" entries were also renamed
  - additional interface tweaks (still needs work)
  Changes and fixes to "Supermodel 3 Emulator" features
  - entries in file "frontend_dir\arcade\emulator_ini\supermodel_ini\Supermodel.ini" have changed to avoid settings overlap
  - NOTE 1: you must re-configure AND save the emulator default settings to update the .ini file
  - NOTE 2: settings key names are the same as emulator's "Supermodel.ini" file, but not all of them
  - game custom setting files changed as well (change/save emulator default settings first!)
    NOTE: you must re-configure AND save the game custom settings again to update the .ini file
  - additional interface updates
  - FATALITY! game custom settings were not added properly to command line when running games (nobody noticed this ?!)
    - custom settings and emulator default settings were added twice to command line
    - new behavior: emulator settings is now loaded first, followed by game custom settings file (just like MAME)
    - if game setting is the same as emulator setting, it's no longer added in "ganename.ini" file (just like MAME)
  - when running emulator in full screen, if the custom resolution is not valid, current desktop resolution will be used automatically
  - if game filename is not found, emulator will not run; it was causing the "Error: Invalid Function 1" message on emulator exit
- Replaced the "Main CPU MAME Filter" bar by a floating panel
  - it was wasting too much space above the main games list
  - the "enabled" filter state is now restored on a frontend restart ("Arcade Misc" filters tool bar button)
  - panel position is always at the top left corner of the games list
  - you can move the panel around by dragging it with the title bar
  - limited the games search pattern to MAME / HBMAME as it's useless for other systems
  - added support for night mode
- Several tweaks to "Delete Multiple Selected Games" screen; also added "night mode" support
- Changes and fixes to "Arcade Scan Games Results" screen ("View Missing ROMs/CHDs" in games popup menu)
  - added a Device column to easily identify game sets with device ROMs
  - added a file size column (you must create all arcade games lists to see this info)
  - MAME CHD file sizes are detected "on the fly" while scan results list is being generated
  - missing files texts are now painted in a dark gray color (light mode) and silver color (night mode)
    - status columns text is painted in red color; much easier to spot missing files
  - device ROMs were not properly tagged as device ROMs; weird bug as it was working fine for games with multiple device sets
  - parent ROMs/CHDs were not properly tagged as parent files, making it not show "Parent" text in status column
  - moved controls from bottom bar to top bar, reducing waste of space
  - increased selected system icon size and font size of emulator/games list version texts to keep in sync with other screens
  - window now have a fixed width size of 1015 pixels
  - when viewing a single game, the window height will be shortened to avoid waste of space
  - removed the redundant Close button since you can close it with the caption bar "close" button (or ESC key)
  - "filename.zip found" and "filename.zip not found" texts are now in "green" and "red" color for easier reading
  - status texts are now properly separated by comma; it gives a whole new meaning to the texts being shown
  - support for night mode; visibility on this mode is much nicer and detailed than light mode
  Tweaks to "Game Details" screen (access in games popup menu or "Shift+I" shortcut)
  - missing files texts are now painted in a dark grey color (light mode) and silver color (night mode)
  - file size column added to game files list
  - MAME CHD file sizes are detected "on the fly" while files list is being generated
  - if a CHD filename text is larger than the label dimensions, the hint text will be enabled, hover mouse on it to see it
- Since MAME can load Unicode filenames directly from command line, Emu Loader will no longer convert them to DOS 8.3 format (run custom EmuCon console/computer games with MAME)

### Added

- Tool bar colors settings for night mode in the new "Night Mode" page, Preferences screen
  - for games tool bar filters, images tool bar and other "captionless" tool bars in the future
  - support custom gradient background; gradient can be disabled to use a single color
  - frame color is customizable; it can also be disabled
  - tool bars with button caption enabled cannot be customized (TToolBar component limitation)
- Added a "Splitter" setting for "Game Documents" panel so you can customize it (Preferences screen, "Game Docs" page)
- Added a "Splitter Style" setting for image splitters, default to "Single Color" (Preferences screen, "Images" page)
- Support for Supermodel 3 Emulator SVN 735 ("Supermodel 3 Emulator Default Settings" screen)
  - new settings: "scroll fog shaders", "tile map shaders", "stretch"
  - added a "Use Custom [1-1000]" checkbox so you can enable/disable custom "PowerPC Bus Frequency (PPC)" frequency at will
Added save states support for "Supermodel 3 Emulator"
- select a save state file before loading the game
- valid filenames are "gamename.st?" (state slots go from 0 to 9)
- save state folder is fixed by the Supermodel emulator and cannot be changed ("emudir\Saves\")
ROM/CHD size info added to arcade and MAME software list sets
- games validation system do not use it, it's for information only
- ROM size info can be viewed in "Game Details" and "Games Scan Results" screens (games popup menu)
- you need to create new games lists for all arcade systems and MAME software lists to see this info, but frontend works fine without it
- games of Supermodel 3 emulator doesn't have ROM size info in "emudir\Config\games.xml"
- games of console/computer systems already have file size info (systems ported from EmuCon Frontend)

## [8.6] - 2018-05-30 U

### Fixed

- Several drawing bugs in games lists, top bars and icons
- Top bar lower gradient color was silver instead of white in "Delete/Rename Game Snapshot"
- Empty space in multi-floppy games list panel if games of different systems are selected in main games list ("Load Multi Floppy Disks Game" screen)
- Set default font was not working in "Game Font Settings" (games popup menu)
- Arcade game font was not set correctly on several screens if game status is tagged "found with missing ROMs" and game driver is tagged "preliminary"
- Main games list not focused after exiting "Favorites Manager"
- Main games list not focused after exiting "Last Played Games (MRU)"

### Changed

- Minimum required resolution bumped to 1024x768 / 1280x720; plus, dialogs and screens will no longer auto-resize to fit in lower resolutions
- Changes and fixes to Mustangpeak's "EasyListView" component (EasyListView.pas)
  - it was drawing "State Images" in normal mode when TEasyItem is ghosted and/or not enabled; TEasyViewItem.PaintImage() function
  - icon top border was not properly set if cell size if larger than icon size; "large icons view" only
    - to fix this I added a new "IconViewAdjustIconTopBorder" property in "TEasyPaintInfoBasic" class, used in TEasyViewIconItem.ItemRectArray() procedure
- Improvements to my "TPanelEx" component
  - added a "Inner Border Color" property for a cool neon effect, and a property to enable/disable it
  - added a "Enable Custom Border" property to create a dual color border in the "non-client area"
    - border colors are customizable
    - no more drawing borders over the client area, covering 2 pixels at all sides of the panel!
    - it cannot be used with "Border Style" and/or "Bevel Kind" properties
    - "Frames" property is still available but it paints in the client area
  - fixed paint flickering when enable/disable frames and/or borders
  - code clean up ("Border Style" and "Bevel" properties will eventually be removed from the component)
- Improved my custom TGroupBox component, added "Dual Color" border style for a cool neon effect (see "Delete Games Files" screen in night mode)
- Interface changes to "Console/Computer Emulators Setup" and "Console/Computer Games Folders Settings"
  - default system icons size is now 68x68 (resolution 1280x800 and higher)
  - 48x48 icons are used for 1280x720 / 1024x768 resolutions
  - left some room in systems panel for the future (just in case)
  - additional tweaks
- Minor tweaks to "Game Details" screen
- Interface changes to several screens
  - 48x48 game icon replaced by 68x68 size (top bar)
  - 16x16 system / media type icon replaced by 24x24 size (top bar)
  - increased game title font size from 8 to 10 (top bar)
  - increased game name+extra info font size from 7 to 8 for easier reading (top bar)
  - removed ListView border (Windows theme forced painting), replaced by a custom panel with dual colors so night mode can be applied
  - additional tweaks

### Removed

- Full screen mode is gone. It's an ugly hack, it causes the dreadful "out of focus" bug at startup and it doesn't work correctly under Windows 10

### Added

- Updates to "Night Mode"
  - Setting "Enable Night Mode" added to main menu for easy access; you can still change it in the message box
  - added support for several screens
  - added support for images tool bar buttons
  - added support for images panel border color
  - coded some functions to change colors with ease: panels, labels, check boxes, radio groups, group boxes, forms
  - the following controls are incompatible with dark themes, due to Windows theme forced painting or zero customization properties:
    edit box, combo box, button, main menu, popup menu, tool bar button text
  - additional tweaks to avoid flickering, highly noticeable in night mode
- New "Board Game" catver.ini filter added to "Arcade Miscellaneous Filter" (below "Mechanical" filter)
- New screen with 128x128 monster icons for "Arcade Files Versions" if screen resolution is 1024x768 and up (main menu "View")
- Interface changes to "Arcade Emulators Setup" and "View Arcade ROMs Folders" screens
  - added monster 128x128 icons to systems list
  - use checkbox "Large Icons" in bottom bar to enable the big system icons (disabled by default)
  - additional tweaks

## [8.5.7] - 2018-05-07 U

### Fixed

- Severe memory leaks after closing the clean install dialog (1 thousand memory blocks), caused by two TStringList vars
- All selected Neo-Geo MSV games are listed in "Run Game Confirmation Dialog" if you select a Neo-Geo machine with less cart slots

### Changed

- Remade some console/computer system icons so they can be properly used with dark backgrounds

### Added

- Dark themed message box... lights out!
  - just tick the new "Night Mode" checkbox in the dialog's lower left corner
  - since the RichEdit text colors cannot be changed "on-the-fly", it will only take effect next time the dialog appears
- "Multi-slot Machine" text added to show the selected "Neo-Geo MVS" machine before listing the games ("Run Game Configirmation Dialog")

## [8.5.6] - 2018-05-02 U

### Fixed

- Holy crap-a-monium! Fix losing arcade emulator filename from "\arcade\emulators.ini" at startup, take three
  - the info will be saved in .ini file only if emulator date/time stamp has changed
  - whatever happens, current emulator info entries and system sections are no longer deleted from .ini file (garbage entries mode ON)
  - only at "Arcade Emulator Setup" screen "emulators.ini" will change (add/delete entries and sections)
- MAMu_ icons folder path saving twice to "mame\ui.ini" after exiting "Preferences" screen
- MAMu_ icons folder path read from MAME and then read again from HBMAME (only MAME's "ui.ini" is used)

### Changed

- Reverted back some function calls in main screen's OnShow() event to OnActivate() event like it was in EL v8.4.7 as the newer tweaks were causing weird problems

## [8.5.5] - 2018-05-01 U

### Fixed

- Obscure bug: after updating arcade emulator version info at startup, the filename with full path is somehow deleted from "\arcade\emulators.ini"; filename is no longer updated, just file date/time and version info
- Out of focus bug at startup still haunts us, so the new init zip images form is replaced by a simple panel directly in the main screen

### Changed

- The window "Layout Dimensions" will no longer be restored at startup to avoid the dreadul "out of focus" bug (accessible in images popup menu)

## [8.5.4] - 2018-04-30 U

### Fixed

- Image layout splitters not restored correctly at startup for triple/quad layouts
- Zipped images contents list for MAME software lists not initializing correctly, causing them to not show up in preview images panel
- Image layout splitters not restoring to current positions after exiting "Image Category Settings" and "Image Layout Settings" screens
- Image category was not properly set to in-game snapshot at startup causing several problems:
  - image panel settings not initialized correctly
  - image hint panel settings not initialized correctly
  - arcade emulator game snapshot folder setting was not being read from emulator config file
  - zipped images was not initialized
- Fixes to clean install mode
  - arcade emulator config file was not read/initialized
  - arcade image folder paths were not being read/initialized
  - tons of memory leaks caused by two vars that were not freed from RAM

### Changed

- Interface tweaks in "Arcade Emulators Setup" screen
  - button "Update System" renamed to "Reset System" and its help text changed to reflect what it actually does
  - lowered dialog height and merged all buttons in the bottom bar where they belong
  - aligned "Ok" and "Cancel" buttons to the right side of the dialog
  - "MAME Ash" build label link removed since it's no longer updated, replaced by HomeBrew MAME
  - changed font of "Autorun Game With AlterMAME" to the same as other labels and simplified its help text to be more clear
- "Delete/Rename Preview Image" screen
  - added "Dimensions: 0000x0000" label to show the image's resolution
  - replaced category icon by a 68x68 sized monster and removed category title text
  - interface tweaks
- Optimized uMain.DestroyImageLayoutControls function and removed fixed indexes of panels/splitters count
- Deleted "destroy controls" code in "uMain.SetImageLayout" function since it's an exact copy from uMain.DestroyImageLayoutControls function
- Replaced "image category selector" and "image layout selector" quick popup menus by improved dialogs in images tool bar buttons
  - popup lists were too big for screen resolutions lower than 1080p
  - 68x68 monster sized icons for easier navigation
  - disabled categories/layouts do not appear in the list
  - select a category/layout with mouse double-click or ENTER key or "Ok" button
  - abort operation with ESC key or "Cancel" button
  - reduced RAM usage and code tweaks for future improvements
- Startup tweaks
  - double-checked function calls to prevent them executing more than once
  - moved some code from uMain.OnActivate() event to uMain.OnShow() event to help mitigate the "out of focus" bug
  - fixed a really weird "out of focus" bug that prevents scrolling games with mouse wheel after games list is loaded
  - remove a few function calls trying to set focus to the main games list without populating it first
- Replaced zipped images initialization messages in splash screen by a darn cute small msgbox below the images tool bar
  - way easier to spot categoy/layout changes
  - centered on main screen window in thumbnails view
  - message texts no longer sent to splash screen
  - action text and visual improvements are now possible
- Image layout splitters now update the image panel while dragging them instead of just show a pattern line (experimental)
- Clean install dialog interface changed to a dark theme (old light theme is gone)

### Removed

- 2 TImageList components with 24x24 sized image categories/layouts icons and a TImageList with 68x68 arcade systems icons are no longer necessary as they are loaded on demand, directly from .ico files

### Added

- Quad Image Layouts
  - 18 new image layouts to display 4 game preview images at the same time
  - image panels cannot be hidden due to layouts mount complexity
  - layout 1 have two modes: horizontal and vertical
    - hor: a single horizontal splitter that separates up and down panels
    - vert: a single vertical splitter that separates left and right panels
  - hide layouts you don't want to use
  - "Image Layout Settings" interface updated, 1024x768 / 1280x720 minimum screen resolution required
- New image layout setting "Use Custom Category for Console/Computer" ("Image Layout Settings" screen)
  - define alternate image categories for MAME software games / console / computer systems
  - dual / triple / quad layouts only; no point in doing this for single layout
  - disabled by default, you can enable this setting in "Image Layout Settings" screen only - categories can be assigned to any panel
  - unzipped and zipped images support
  - image hint box in images preview panel is updated only when hovering the mouse on top of image panels, to maintain games scrolling high speed
  - category background color is ignored to avoid heavy flickering while scrolling games
  - useful to show "software cover" in place of "arcade flyer"
- Support new "Neo-Geo MVS" machines for MAME v0.197
  - you can choose what Neo-Geo MVS machine to use when running multi-slot arcade games
  - new file "arcade\mame_multislot_machines.txt" containing the valid list of machines; it can be manually updated when needed
  - last used machine is restored next time you run multi-slot games
  - when changing the machine to be used, games that exceed slot count are grayed out but can still be moved up/down in the list

## [8.5.3] - 2018-04-04 U

### Fixed

- Supermodel3 emulator settings screen was not centered in the desktop
- The "Select" button for "BGFX Shadow Mask" file was not implemented
- Calling "set emulator default settings" from "Arcade Emulators Setup" was not passing the correct emulator filename parameter, resulting in bogus "full_path\emu_cfg_filename.ini" and causing frontend to crash when saving emu default settings

### Changed

- Enabled "Save to File" button in madExcept settings (bug report crash dialog)
- Send bug report will no longer zip the .txt; .png files (madExcept)

## [8.5.2] - 2018-04-02 U

### Fixed

- "Image Category Settings" bug fixes (left-overs from old code)
  - "Select" category was disabled and its folder selections was never saved on exit
  - zipped images cache wasn't rebuilt on exit while in multiple images layouts, causing selected game images to not load
- Frontend crash if you try to use "Select" image category
- Auditing multiple selected games was not working if any of them use device or bios sets
- Wrong system selected in "single system selection" mode (Arcade system selection dialog)

### Changed

- Preview images panel color/splitter settings moved from "EmuLoader.ini" to "\ini_files\image_category.ini"; no more losing image splitter settings on a fresh install
- You can select scan mode and software list build mode when using "Create MAME Software Games List" in main menu "Arcade"

### Added

- Customize "preview images hint box" appearance (Preferences screen, "Images" tab)
  - the hint box shows up when hovering the mouse on top on images panel
  - box background color, box frame color and visibility, text color, text shadow color and visibility
  - box opacity level (255 is opaque, 0 is transparent)
  - settings saved in "\ini_files\image_category.ini" file to avoid loss on a clean install
  - new setting "Show Unzipped/Zipped Icon" that display an "image icon" for unzipped images and "zip icon" for zipped images
    - (easier to spot if the loaded image is unzipped or zipped when hovering the mouse on top of it)
- Moved "Update Favorites Profiles" from main menu to "Help" sub-menu since its usefulness has passed; but if you're late into the frontend party, it's still available

## [8.5.1] - 2018-03-29 U

### Fixed

- OH NO! Software lists were not audited after creating games lists in "update" mode

### Removed

- Removed a couple "[.zip; .7z]" strings from the splash screen's messages when auditing MAME/HBMAME games since it include CHD files, which are not zipped

## [8.5] - 2018-03-28 U

### Fixed

- Bios/device ROMs showing as "Parent Bios" / "Parent Device" in game sets ("Arcade Scan Results" screen)
- Message panel not showing up when applying quick systems filter in grouped view mode
- MAME software list games not audited correctly if set has no main "gamename.zip" file but have CHD files
- Setting "MAMU_ Icons Folder" was not saved in .ini file when closing "Preferences" screen
- TEdit was in read-only mode; you can rename files in "Rename Image" dialog again
- Background color of single image layout was not restored at startup and not set after closing "Image Category Settings" screen
- Create ZiNc games list was setting bios ROMs as "parent ROM" on games sets

### Changed

- File "\arcade\image_categories.ini" renamed to "\arcade\sysimagefolders_arcade.ini" (done at startup)
- Image category background color/visibility settings moved out of "EmuLoader.ini" into a new "\ini_files\image_category.ini" file (done at startup)
  - from now on, file is updated only when you change settings in "Image Category Settings" screen
  - settings are no longer lost on a frontend crash or clean install
- Image layout visibility settings moved out of "EmuLoader.ini" into "\ini_files\screenshot_layouts.ini", where they belong (done at startup)
  - from now on, file is updated only when you change settings in "Image Layout Settings" screen
  - settings are no longer lost on a frontend crash or clean install
- Changes and fixes to "Game Details" screen
  - CHD files of software list games were not correctly detected, "software name" parameter was missing
  - added "extra required set" info for software list games
  - bios set filename not shown in "Game Files" section (left panel)
  - several tweaks
- Tweaks to "Create MAME Games List"
- Changes/fixes to "MAME Software List Games"
  - detection of "sharedfeat requirement" tags in .xml files when creating games lists; highly experimental!
    - some games require an extra set to run properly; Atari 2600 cassette, PC-Engine CD, others (info shown in "Game Details" screen)
    - if a game doesn't run and you're sure you have all game files, look for this extra info above the "Games Files" section, left panel
    - requirement data stored in a new "arcade\games\mame.elsoftlistreq" file
    - the extra parameter is added before the gamename parameter
  - expanded options to create software lists (new "update" mode)
    - "Disable": do not create software lists and delete current games list files
    - "Enable: Update": create new lists and update existing ones only if CRC32 checksum of "mamedir\hash\softwarename.xml" file has changed (XML file updated)
    - "Enable: Overwrite": create new lists and overwrite existing ones even if CRC32 checksum match
    - NOTE: settings can be found in the screen to select systems when creating MAME games list and in "Scan Games Mode" screen
  - new "xmlfile_crc32" entry in "frontenddir\arcade\mame_softwarelist_games\softname.el" to compare with MAME "softname.xml" (for "update" mode only)
- Interface changes to Select Arcade System" dialog
  - added new software list modes
  - systems list moved to a left panel
  - option "For This Task Only" is unchecked by default
  - info texts improved
- Changes to "Arcade Miscellaneous Filters" (main tool bar buttons)
  - renamed "Device" drop-down list to "Device ROMs" since this filter is not exclusive to device sets
  - renamed "BIOS" drop-down list do "BIOS ROMs" since this filter is not exclusive to bios sets
  - renamed texts from "Sets" to "ROMs" in "Device ROMs" and "Bios ROMs" drop-down filters since they are related to particular ROMs, not the entire set
  - renamed "Filter by Main CPU Filter" to "Enable Main CPU Filter Bar"
  - renamed "Games with ROMs (any set)" to "Games With ROMs (any ROM)" in "Game ROMs" drop-down list since this filter includes device/bios ROMs
  - renamed "Games with no ROMs" to "Games With no ROMs/CHDs" in "Game ROMs" drop-down list to reflect what the filter actually does
  - new category filter "Music" for sets like "VGM Player" (vgmplay)
  - minor interface tweaks
- Renamed several "function" code blocks to "procedure" since they don't need to return a result
- Minor interface tweaks to Preferences screen, and removal of texts with "7 pixel" font size
- If screen resolution is smaller than the dialog, scroll bars will be added to the TForm so you can see everything (experimental!)
  - for screen resolutions smaller than 1280x1024 and because some dialogs just can't be scaled down
  - supported dialogs: "MAME Settings", "Game Details"
- NOTE: minimum screen resolution for Emu Loader is 1024x768 / 1280x720 but some dialogs still fit on 640x480 resolution

### Removed

- Masssive source code cleanup (commented/not used code)

### Added

- Search .chd files in "\softlist_name\" sub-folder for MAME software lists
- Support to search .chd file in "\parent_gamename\" sub-folder; MAME supports this; "romspath\parent_gamename\clonename_file.chd"
  - now you can have clone CHD files in the parent folder
  - for MAME arcade, MAME software list, Demul
- New file "arcade\filters\supermodelsegamodel3_control_type.ini"
  - a list of control tags and descriptions, extracted from Supermodel3 source code
  - for now, it only show controls list in "Game Details" screen; not used anywhere else
- File header detection for "Atari 800" cartridges before running games (highy experimental, used by all Atari800 emulators, except MAME)
  - the first 4 bytes of file will be read, looking for 'C' 'A' 'R' 'T'
  - if tag is found, Emu Loader will no longer add the cartridge type in the full command line
  - any file extension is supported for unzipped game files
  - for zipped game files, Emu Loader will unzip it to a TMemoryStream and validate the tag; only ".bin; .car; .rom" file extensions are supported
    (if there's more than one file inside .zip, the first one found with any of the 3 supported extensions will be used)
- HBMAME Software List support, to be used in the distant future, in a galaxy far, far way... what works:
  - create games list
  - audit games files
  - show softlist games in main games list
  - run games
  - for everything else, they are handled as MAME softlist games (for now)
- Setting "Restore Internet Game Info at Startup", to restore the last state of internet game info button at startup ("Preferences" screen, "General" tab)
- Setting "Disable Threaded Preview Image Loading" in "Preferences" screen / "Images" page, to prevent images loading delay and "Invalid pointer operation" error
- Support for MAME 0.196
  - new comm setting: "Syncronize Frames" in "Input" tab

## [8.4.7] - 2018-02-22 U

### Fixed

- Proper detection of "Board ROMs" on game sets that use "model2" ROMs; "SEGA Model 2" system
  - you must re-create games list fix this
  - this is a cosmetic fix, ROMs validation is not affected
- Fixes and tweaks to Game Details screen
  - missing parent setname text not showing in left panel if parent zip file is not found
  - SHA-1 checksum generated for zipped EmuCon console/computer games (32 MegaBytes max file size)
  - bios/device icon indexes were switched in left column
  - "Bios CHD" file was tagged as "Device CHD"; cosmetic fix

### Changed

- "Create MAME/HBMAME/Demul Games List" updates
  - improved detection of sets with CRC32 collisions, a new file created "arcade\games\systemname_crc32collision.txt"
  - added a "devicename" tag for each device ROM entry for proper SHA-1 validation (MAME)
  - added "feature patelle" tag detection in -listxml output to fix missing "color status" (MAME v0.194 and newer)
  - optimizations and code cleanup
- MAME and arcade games files validation system changes and fixes (games audit)
  - device sets not scanned correctly when auditing a single game (MAME) - device ROMs are now properly validated and game sets are no longer tagged as "available" if a device ROM is missing (MAME)
  - device and bios zip file list contents (CRC32/SHA-1) are now loaded into RAM only once when validating multiple games, for faster access
  - CRC32 collision detection and SHA-1 validation for device/bios ROMs; game ROMs are not yet supported (MAME and Demul)
  - game files are unzipped directly into a "TMemoryStream" var (RAM), so SHA-1 checksums can be generated
  - several optimizations and code cleanup

### Removed

- Old commented code cleanup

## [8.4.6] - 2018-02-13 U

### Fixed

- A "beep" command was left in zipped images list chaching function
- Forgot to reindex the tab's internal indexes in MAME Settings screen

## [8.4.5] - 2018-02-12 U

### Fixed

- Previous/Next buttons events executing when "Internet Game Info" is enabled (images tool bar)
- Images panel canvas locked before loading "Layout Settings" screen, causing memory leaks and frontend freeze
- Current images layout settings was not saved when exiting the frontend
- Tool bar "Filter By Main CPU" was appearing above the main tool bar buttons (Arcade Miscellaneous Filters)

### Changed

- "Internet Game Info" tweaks
  - images tool bar buttons visibility are no longer changed as they cannot be used with web viewer
  - added a "Play Video Preview" button in the web panel's tool bar for easier access
- Changes to "Preview Images" feature
  - more tweaks to improve category selection events
  - removed remaining "Internet Game Info" code from main menu "Images"
  - added "image_category_dir\softlist\softlist.zip" path scan support for MAME software lists
    - now you can have your zipped images file in a "\softlist\" sub-folder (eg.: "snap\msx1_cart\msx1_cart.zip")
    - file "image_category_dir\softlist.zip" will be searched first (eg.: "snap\msx1_cart.zip")
    - not sure if MAME's internal frontend supports this... - tweaks to selected game's image file search function (tiny speed boost)
- Renamed "View Game Documents" to "Show MAME Game Documents" (games popup menu), as this is a MAME exclusive feature
- Tweaks in game documents feature to remove redundant selected game checks
- Minor improvement when switching Images on/off while in thumbnails view; StringList cache for zipped images is reloaded only when setting "Images" enabled (might need further tweaks)

### Removed

- Deleted several old commented code from source code

### Added

- New "Show Only Sets With CRC32 Collision" arcade misc filter (to help future games audit improvements)
  - useful filter to know what sets have same CRC32 checksum on different game files
  - if the set is a game (parent or clone) but the affected files are from a device or bios set, the game will NOT be tagged as "CRC32 collision"
  - so far, only two MAME sets have this: "segadimm" and "segasp"
- New feature: "Game Documents Display Mode"
  - wanna show game docs in a full panel without disabling images ? there are two settings:
    - "Images and Game Docs Single Panel": default frontend behavior and will show game docs together with preview images
    - "Images and Game Docs Tabbed Panels": use this to show images and game docs in separate panels (like MAME's internal UI)
  - to change it, go to Preferences screen (main menu) and select "Game Docs" page
- NOTES:
  - two new buttons added on images tool bar to switch between panels: "Images" / "Game Documents"
  - if images tab is selected, game docs for selected game will not load
  - if game docs tab is selected, images for selected game will not load
  - settings are saved in "el_extras.ini", "[GameDocuments]" section
  - if either images or game docs is disabled, a blank panel will be displayed (behavior may change later)
  - if both images and game docs features are disabled, no panel will be displayed

## [8.4.4] - 2018-02-05 U

### Fixed

- Function uMain.EncodeUnicodeString() was not converting WideString to UTF-8 correctly
- Timer frozen while loading MAME software list games at startup (splash screen)
- Fixed a bug in my TPanelEx component for proper Windows themed "Tool Bar" paint style
- Some calls to preferences screen were not redirected to "Preferences" main menu event
- Setting "http_root" in "mame.ini" was not implemented (it used to be "http_path")
- Total play time info corruption ("frontend_dir\arcade\played_games\" folder)
  - playing a game for 2 minutes was adding 4 hours or so
  - MAME softlist games are also affected
  - console/computer games were not affected (EmuCon frontend ported systems)
- Driver status not set to "Good" when creating Supermodel games list
  - "supermodel_dir\config\games.xml" doesn't have "driver status" entries
  - selecting a driver status filter other than "List All", makes Supermodel games not visible
  - you must create Supermodel games list again for proper games filtering

### Changed

- Changes to "Export Games List To File" feature (main menu "Games List")
  - exported file was not saved in UTF-8 format
  - expanded game info options; "Full Format" only
  - you can export the file to a format compatible with Microsoft Excel's "import file" feature, using the new "Microsoft Excel Format" checkbox; "Full Format" only
  - added a new "Use Games List Columns" checkbox to use current columns settings from main games list; "Full Format" only
  - added a couple help buttons with usage instructions
  - settings are saved in "el_extras.ini" so you won't have to change settings all over again
  - removal of dead code
  - several tweaks
- Changes and fixes to "Preview Images"
  - added a couple variables in "ImageDetails[]" array to keep track of last used image index (max 30 images per category)
  - several changes in uMain.LoadScreenshot() function for different image index per image panel
  - several changes in "Previous/Next Image" buttons for proper index detection on each image panel (images tool bar)
  - removed "Category Prev/Next Auto Switch" and "Layout Prev/Next Auto Switch" settings as they don't work anymore ("Images" main menu)
    (use "F11" / "F12" and "F9" / "Ctrl+F9" hotkeys to change categories and layouts... or prev/next category/layout buttons in images tool bar)
  - uMain.DisplayImage fuction tweaks to prevent memory leaks, leading to frontend crashes
  - feature "Image View Mode" is no more, only layouts are available from now on
    - classic view was using single image layout, it makes no sense keeping it
    - you can change image category only when in single image layout, with category buttons in images tool bar or in "Layout Settings" screen
    - fixed some bugs in load/save layout profiles
    - single image layout setting is now saved in "ini_files\screenshot_layouts.ini" file
  - tweaks, tweaks, tweaks!
- Removed "Internet Game Info" from image categories and made it standalone
  - access with a new button in images tool bar
  - if this panel is enabled, images and game docs of the selected game will not load
  - images tool bar is no longer visible in the internet browser panel; to go back into "images / game docs" just click "Exit Internet Game Info" button
  - it requires preview images to be enabled
  - renamed file "image_internet.ico" to "internet_gameinfo.ico" in "resources\main_icons\" folder
- Changes and tweaks to "MAME Settings" screen
  - renamed "Video 2" tab to "Video 3"
  - added a new "Video 2" tab and moved some settings into it ("Video" tab was getting extra cluttered)
    - "Performace" settings
    - "Screens" settings
    - "Monitor Provider" setting
  - UI tweaks in "Video 2" tab
    - "Render Options" panel
    - "Artwork" panel
    - "Snapshots / Movies" panel
  - new MAME v0.194 settings: "Fallback Artwork" and "Override Artwork" ("Video" tab)

### Removed

- The following files are no longer needed:
  - "resources\main_icons\ok.ico"
  - "resources\main_icons\image_viewmode.ico"
  - "resources\main_icons\chronometer.ico"

## [8.4.3] - 2018-01-05 U

### Fixed

- Oh boy... "Delete/Copy/Move Games Files" was not working at all (games popup menu)
  - copy/move operations not working even when game file exists
  - replaced action functions by Unicode ones: "CopyFileW()", "MoveFileW()", "DeleteFileW()"; they seem to work OK
  - the "\mame_softlist_folder_name\" folder was being added BEFORE "\system_folder_name\" folder... D'OH!

### Changed

- Changes to "Copy/Move Games Files"
  - games list screen is closed after moving files even with operation errors; after moving files you can't move them again anyway
  - when copying files, the games list screen stays open in case you want to copy them to another location (handy mode ON)
  - forgot to add support for "Video Tape (VHS)" media type in the "copy/move" dialog (MAME CHD files)
  - several tweaks
  - removal of ancient code

### Added

- Feature "Copy/Move Games Files" got a new checkbox setting, enabled by default: "Add System Folder"
  - what does it do ? It adds a "\system_name\" sub-folder at the end of the "Destination Path" you selected
  - in previous frontend builds this was enfoced, giving you no option to disable it
  - system names cannot be customized but are really easy to spot
  - for both single and multiple games selection dialogs
  - useful when you want to copy/move files of games from the same system and don't want them to be copied/moved to a "system" sub-folder
  - when multiple games of different systems are selected, this settings is always enabled, even if you uncheck it ("Crash 'n Burn" mode OFF)

## [8.4.2] - 2018-01-03 U

### Fixed

- Frontend crash if you select "All Systems" in the arcade systems select dialog, when ZERO systems are enabled ("Create Arcade Games List" / "Scan Games")
- You could select "All Systems" in the arcade systems select dialog even if ZERO systems are enabled, making the frontend crash
- System title and type text bar properly relocated for 1280x720 resolution; it was completely hidden in "Image Category Settings" screen

### Changed

- Memory card changes and fixes
  - finished implementing the file search routine, it was still only searching for "*.mc", "*.mc1", "*.mc2" files
  - all file extensions are now scanned and displayed in the memcard files list, no longer limited to MAME's file extensions from -listxml output
  - file search masks: "gamename.*" and "game title.*"
  - MAME's file extensions are only used to select files in the "open file dialog", used in slots "Select" buttons
  - fixed an error where softlist memcard files could not be located in the correct folder, which is "machine_to_run_foldername\softist_foldername\gamename_foldername\"
    - example of the corrected search fix: "mamedir\memcard\psu\psx\wildarms\*.*" ("psx" softlist folder name wasn't being added before)
  - for software list games, ALL files are scanned inside the "\gamename\" folder since you will only have memcard files for that game
  - more teaks are removal of dead code

### Added

- New "This system is not available" text in the system title bar below the systems list; for systems that are disabled ("Image Category Settings" and "Video Preview Settings")

## [8.4.1] - 2018-01-01 U

### Fixed

- FATALITY! Demul games with CHD files and ZiNc games with CDs were not being set as "Media Type = Disc" when creating games lists, messing up with games filtering and games files validation system; you MUST create games list for both systems again, it's the only way to fix it

### Changed

- Fixes and changes to "Filter Arcade Games by Main CPU" ("Miscellaneous Filters" tool bar button)
  - partial string support in TEdit box; you don't need to type the full CPU title anymore
  - files "arcade\games\mame_maincpu.ini" and "arcade\games\hbmame_maincpu.ini" were not being loaded to the combo box control, making it impossible to select a CPU to filter the list
  - selecting a CPU in the combo box list will automatic filter the games list... as it should have been!
  - the CPU TEdit box will be emptied when selecting a CPU in the combo box
  - moved the CPU combo box list to the left as it makes more sense
  - improved filtering speed when games list is in grouped view mode
  - tweaks to improve CPU names search speed
- Changes to the startup process
  - detailed messages in splash screen so you know what the frontend is actually doing
  - on a clean install (no arcade/console/computer games files found), the splash screen is closed to avoid being on top of the clean install dialog, making it look like the frontend is frozen, even though the timer is still running
  - if you have arcade emulators selected but the executable files are not found, the frontend will no longer ask you to select them again ... old code leftover, sorry
  - source code cleaning and some minor tweaks applied
- Changes to "Run Game (Extra Parameters)" (games popup menu)
  - added support to four (4) memory card slots; PGM2 games use it
  - detection of memory card file extensions (from -listxml output) so you can use MAME's supported file extensions per game/driver
    - (you need to create MAME/HBMAME games list again)
  - file extension filters in select file dialog changed to support any extension (.*)
  - mouse double-click on a listed memcard file will add it to "slot 1"
  - resize memcard files list panel according to slots count

### Removed

- Demul v0.582 and older is no longer supported!
  - games with GD-ROM files were never properly detected and were handled by the frontend in a extremely weird way
  - nobody probably use old Demul builds anyway because I haven't got a single bug report for the last 2 years
  - from now on, only Demul v0.7 and newer will be supported

### Added

- Detection of "ced_videodisc" disk region tag in -listxml output
  - for "disk" entries and MAME only
  - "CED VideoDisc" is handled as "Disc" (or "CD") media type
  - this is purely cosmetic and it doesn't alter the way Emu Loader validates CHD files
- New MAME CHD media type: "Video Tape"
  - detection of "vhs" region tag in -listxml output ("disk" entries only)
  - new game file IDs: "21 -> Game Video Tape"; "22 -> Device Video Tape"; "23 - Bios Video Tape"
  - this is purely cosmetic and it doesn't alter the way Emu Loader validates CHD files
- New "mediatype_tag" for MAME CHDs, Demul CHDs and ZiNc games
  - tags added when creating games lists
  - tags are listed in "arcade\games\system_name.elrom" files
  - only "Disc" media type have this new tag (CD, DVD, Laserdisc, GD-ROM, AudioCD, CED VideoDisc)
  - supported tags: "cdrom", "laserdisc", "gdrom", "audiocd", "ced_videodisc"
  - for a future improvement, and there won't be exclusive icons for them, only a general "disc" icon
  - MAME software lists "MIGHT" be supported in the future... maybe
  - this is purely cosmetic and it doesn't alter the way Emu Loader validates CHD files

## [8.4] - 2017-12-28 U

### Fixed

- Clicking "Abort" button in "Systems Quick Filter" was resetting the filter to the full filter... DUH!
- Search bar filter was not working with "Systems Quick Filter"
- Some detail texts were incomplete in search bar's settings popup menu (tool bar buttons)

### Changed

- Tweaks to "Arcade Misc Filters"
  - moved enable/disable filter code from main form to misc filters form
  - code cleaning and minor tweaks

### Added

- Support for AntoPISA's "mature.ini" file so you can filter out adult/mature games using "Arcade Miscellaneous Filters" tool bar button (thank you AntoPISA!)
  - to be used with "category.ini" which doesn't have adult or mature categories
  - the frontend will add a * Mature * string at the end of categories for proper display (only in RAM)
  - you'll find "mature.ini" file inside the "CatVer" package at <http://www.progettosnaps.net/catver/>
  - you can still use AntoPISA's "catver.ini" instead of "category.ini" + "mature.ini"
- New MAME v0.193 settings in "MAME Settings" screen, "Miscellaneous" tab
  - "Save NVRAM on Exit": to disable saving NVRAM on exit
  - "Enable Save State Rewind": to enable rewind save states
  - "Rewind Buffer Size": to set a rewind buffer size in megabytes
- NOTE: setting "Directory to Save States" is still in "Folders" tab

## [8.3.9] - 2017-12-21 U

### Fixed

- Fixes and changes to "Last Played Games (MRU)
  - bugged user interface if a console/computer game (from EmuCon) is selected in main games list (cosmetic fix)
  - button "Abort" renamed to "Close" since it doesn't reset to the last selected game in main games list if a new game is selected with "Select Game" button
  - the dialog was not resizing correctly, several adjustments were made; also, added proper support for resolutions lower than 1680x1050
- EmuCon system was not properly selected in "Console/Computer Games Folders Settings" dialog (main menu "Console/Computer" and "Select Games folders" button in "Console/Computer Emulators Setup" dialog

### Changed

- Changes to "Select a Machine to Run the Game With" dialog
  - display filename text below the game title for EmuCon games
  - minor tweaks to the user interface, both visual and loading speed
  - deleted a nasty message box that appears if the selected EmuCon system doesn't have assigned MAME software lists
- Neat new looks for the "Select Default Emulators to Play" dialog ("emulators" tool bar button); plus a few tweaks
- ... still, more cuteness tweaks required

## [8.3.8] - 2017-12-18 U

### Fixed

- Function ELV_SelectItem() was only handling ANSI strings, making it impossible to search for Unicode game titles
- Systems popup menu was not drawing correctly; mouse right-click ("Machine Type / Systems" full filter in tool bar buttons)

### Changed

- Changes and fixes to "Console/Computer Games Editor" (main menu "Console/Computer")
  - if a EmuCon game is selected in the main games list, the corresponding system and game is selected in this dialog
  - bug fix: when selecting another system, the games filter was not making the last selected game visible

### Added

- Changes to "Systems Quick Filter" (tool bar buttons)
  - added a popup menu in the Systems list to help select/unselect systems with ease (mouse right-click)
  - to avoid unselecting systems that are already selected, I recommend to move the mouse on top a selected system
  - added "[enabled]" and "[disabled]" texts in the filter caption bar so you know if it's currently enabled or not

## [8.3.7] - 2017-12-13 U

### Fixed

- A few bugs in the function to restore last selected game on a frontend restart or when changing the view mode (tool bar buttons)
  - wrong game selected if two games of the same system have the same file name but different media types
  - added support for console/computer games (from EmuCon frontend)
  - Unicode filenames was not handled correctly
  - settings stored in "EmuLoader.ini", "[Selected]" section have changed
  - code optimization
- The feature "Select Game at Startup" was not working properly (games popup menu)
  - added support for console/computer games, ported from EmuCon frontend
  - added detection of media type
  - settings stored in "EmuLoader.ini", "[SelectGameStartup]" section have changed
  - code optimization
- More general tweaks

## [8.3.6] - 2017-12-11 U

### Changed

- Initial work to expand media type indexes for MAME and arcade games
  - currently there is only "0 = ROM" and "1 = CHD"
  - future changes will include "Cartridge", "Floppy Disk", "Cassette Tape", "MAME CHD", "Hard Disk Drive", "Compact Flash Card", "Video Tape" (or "VHS")
- Changes to last played games (MRU)
  - added gamename / gamefile column to the games list
  - removed "title", "media" and "execparam" tags from .txt files (arcade games); they will be parsed from the main games list, if available
    - ("game name" is used as game title if not found in main games list)
  - several tweaks to the user interface and internal code
  - MAME software name column now shows the softlist title instead of softlist name
  - CHD media type for MAME and arcade games is still using general CHD index; no "disc", "hard disk drive" or "compact flash card" support yet
  - if screen resolution is 2560x1440 or higher, 68x68 icons are used in systems list and system title font changed to "Verdana" because the text is clearer than Tahoma
  - fixed a bug were the selected system was not updating internal variables and not showing the games list for the selected system

## [8.3.5] - 2017-12-05 U

### Fixed

- System type label was invisible in "Last Played Games" (MRU) screen
- Filters tool bar customize dialog changes
  - moved "Search Bar" from the list to the bottom since it's a different kind of filter
  - all tool bar filters are visible again

### Changed

- Fixes/changes to the games search bar panel (tool bar buttons)
  - removed the "down arrow" from the TEdit box and added a new "settings" button next to it
  - fixed a drawing bug related to that "fake" down arrow button inside the TEdit box
  - the TEdit box doesn't cut the right-end text anymore when scrolling the text
  - minor tweaks
- Changes to the "Systems Quick Filter"
  - renamed "Reset" button to "Reload" since it only re-select last used systems in the systems list
  - added a new "Reset To Default" button that disable quick filter and reset games filter to "Machine Type / Systems" full filter
    - (it works the same way as clicking "Apply" button in "Machine Type / Systems" dialog)
  - added new system selections: "All Arcade Systems", "All Console Systems", "All Computer Systems", "All Handheld Systems"
    - individual selected systems will remain selected even after exiting the quick filter dialog

## [8.3.4] - 2017-12-04 U

### Fixed

- Some icons were misplaced when "Small Tool Bar" buttons setting is enabled

### Changed

- More source code optimizations
- Changes to the Machine Type / Systems mega filter (tool bar buttons)
  - custom cell drawing with customized icons draw position
  - added a system type icon/text below the sytem title; now you know if a system is arcade, console, computer or handheld
  - fixed a bug were unchecked systems were not ghosting the system icon when opening the dialog

### Added

- Forgot to implement the "Read Usage Rules" viewer in games popup menu / "Run Console/Computer Game"... oopsie!
- New "Systems Quick Filter"
  - this filter allows you to quickly select one or more systems to show in the list without making changes to the "machine type / systems" main filter
  - it will bypass the settings from the "machine type / systems" completely but it will apply the settings from the other filter in the tool bar
  - the "MAME Machines Filter Panel" will be automatically disabled, even if MAME system is selected in this quick filter
  - if filter is active, an icon with a green stripe will be loaded in the tool bar button
  - if filter is disabled, an icon with a red stripe will be loaded in the tool bar button

## [8.3.3] - 2017-11-29 U

### Fixed

- No more crashes when fast scrolling games by holding down UP/DOWN keys; caused by the LoadScreenshot() function when "Images Layouts" view mode is enabled
- Games list was not reloaded after creating a games list for a single console/computer/handheld system
- Bugs in "Create Console/Computer/Handheld Games List" (main menu)
  - memory leak after creating games lists
  - from now on, the games list will only be reloaded if there are new games added (new games lists or existing games lists)
- Bugs in "Delete Multiple Selected Games Files" feature (games popup menu)
  - access violation if there are console/computer/handheld in the list due to a leftover code from the EmuCon port
  - if you disable "Delete Games Files From Disk", the game filename was still being validated for deletion (without actually deleting the file)
  - the delete/copy/move progress dialog was left open if zero files were processed

### Changed

- Several optimizations and source code cleanup; arcade related files also moved to a new "source\arcade\" folder

## [8.3.2] - 2017-11-27 U

### Added

- New game category filters in "Arcade Misc Filters" tool bar button... for MAME v0.191 and newer ("category.ini" or "catver.ini" required)
  - Calculator: for calculator machines
  - Educational: for educational machines
  - Electronic: for all electronic boards and devices
  - Utilities: misc utility machines/devices
  - Printers: for printer devices
  - Phones: for various phone devices
  - MAME Console Machines: for console machines (extracted from -listxml output)
  - MAME Computer Machines: for computer machines (extracted from -listxml output)
  - MAME Handheld Machines: for handheld machines (extracted from -listxml output)
- NOTE: the misc screen was enlarged to fit more filter options

## [8.3.1] - 2017-11-26 U

### Fixed

- Error message "The system name is blank" when trying to run bios sets with Demul emulator; the frontend will no longer allow to run bios sets with Demul
- Frontend crash due to a fatal "out of memory resources" error when in thumbnails view mode, if the thumb cell width and/or height are set to zero; this is a strange bug that might happen at startup
- I forgot to change the game icons to 68x68 if thumb image size is smaller than 128x128; thumbnails view mode only

## [8.3] - 2017-11-24 U

### Fixed

- ZiNc returning "Error Code 1: Invalid Function"
- WARNING: this is not a bugfix! If you get this error, make sure to install the "d3d-ogl12.zip" plugin and the problem WILL go away
- No more "new display type found" annoying messages when creting MAME/HBMAME games lists; warning messages will be displayed one ONCE at the end of the process!
- Selected game always moving position in the screen after running a game or changing preview image category/layout... "Don't get jittery!"
- FATALITY! Emulators executable info and ROMs folders info are deleted if a new emulator build is found at startup (file "eldir\arcade\emulators.ini")
- Path bug when searching unzipped preview images for software list games, resulting in existing images not showing... nobody noticed this ?
- ListView item height changed to 22 pixels when icon size is 16x16; icon/text vertical alignment was not centered
- Hitting ESC key would execute the "Apply" button instead of "Abort" button (Image Category/Layout Settings)
- Custom font for games with preliminary drivers added back (MAME/HBMAME)
- MAME software list games with no ROMs were not tagged as "Game with no ROMs", causing some problems when auditing and running games
- Setting "AutoRun Game With AlterMAME" was not restored at startup; moved setting from "eldir\arcade\emulators.ini" to "EmuLoader.ini" ("Arcade Emulators Setup" screen and games popup menu)
- EL was trying to run MAME software list games with AlterMAME when its build version is lower than 0.162
- EL was trying to run HBMAME games with AlterMAME
- The following settings were never read from mame.ini: "OSD Lightgun Input Provider", "OSD Joystick Input Provider" (MAME Settings screen)
- You could not select items by clicking outsize the text area ("Arcade Games Filter" tool bar button)
- Unicode strings were not decoded correctly for software list games
- Category and VersionAdded are now limited to MAME and HBMAME sets only; MAME software list games also excluded
- Option "Show/Hide All Categories" was not working properly (Image Categories Settings)
- Selecting an image category folder was changing internal vars even if you don't have a system and/or image category selected ("Image Category Settings")
- Frontend crash at startup if in thumbnails view with MAMu_ icons feature enabled
- Thumbnails grid size not properly set at startup, creating a larger thumb image on the last selected game; plus a couple optimizations to improve startup speed
- If system icon is disabled, game icon and favorite icon are painted outside the thumb image bounds, making them invisible (thumbnail view)
- Game snapshots panel is now cleared when switching to internet game info
- Setting "Hide Command Prompt Box" / "Run Game" disabled for all emulators except MAME/HBMAME; emulators do not work correctly if setting enabled (also causes ERROR 1 in ZiNc)
- Editing a field directly in EasyListView conponent was not showing the text if the font color is other than black (TEdit controls background color is always white...)
- Feature "Scan Games With Missing ROMs/CHDs" was not working at all (games popup menu, MAME and arcade emulators)
- Dialog "Select Arcade System" was default to "MAME" instead of "All Systems"
- Neo-Geo games with "neopcb" driver were not included in the "Neo-Geo" filter (MAME arcade only)
- Games popup menu option "Set Custom Options" for "arcade", "console", "computer", "othersys" doesn't show the current selected game in "MAME Settings" screen anymore
- YOU LOSE! Daphne game .zip files were not being searched at all when scanning for games; I guess NOBODY uses Daphne with Emu Loader because I've got ZERO bug reports for the past year!
- If the filename for games list background image doesn't exist, after a manual filename edit (edit box), the current loaded bk image was not cleared (preferences screen)
- Wrong media type for"disk" entries in games files for ZiNc games; they were detected as "Hard Disk Drive" when the correct media is "Disc"
- To fix this you need to re-create ZiNc games list. Not doing so will cause no harm to the way ZiNc games are handled (it's up to you)

### Changed

- MAME machines filter panel can have the same background color/image and font settings from main games list
- MAME/arcade emulators and MAME/arcade games lists are no longer required to use the frontend!
- Unavailable systems are now shown with a ghosted icon and gray text (systems selection panels), except for "Emulators Setup" screens
- EasyListView component changes and improvements:
  - New "TileCaptionLines" property (ItemPaintInfo) so you can change how many lines the main caption will be shown; normal behaviour is a two lines caption for tiles view; this change is used in the new game custom fonts dialog, to display a single line on the main caption
  - cosmetic fix: focus rect is now a solid frame
- Renamed "Delete Selected Games" to "Delete Selected Games Files" to avoid confusion (games popup menu); this option delete your game's ROMs/CHDs/CFGs/Cartridge/Floppy/Cassette...
- Renamed "Copy/Move Selected Games to Folder" to "Copy/Move Selected Games Files to Folder" to avoid confusion (games popup menu)
- Moved MAME softlist games list folder from "eldir\softwarelist\" to "eldir\arcade\mame_softwarelist_games\" since they belong to MAME emulator; EL will try to move this folder at startup
- From now on, setting "Show Favorite Icon in Games" is only for details view mode ("Favorites" tool bar button)
- ... to enable/disable favorite icon in thumbnails view, go to "Customize Thumbnails" screen ("View" tool bar button or "Thumbnails" sub-menu in games popup menu)
- Unicode WinAPI "CreateProcessW()" is now the default function to run emulator executables; better compatibility with Windows 10;
- also, the "StartF_UsePosition" flag is always enabled
- Moved arcade games list files from "el_dir\arcade\" to new folder "el_dir\arcade\games\"
- WARNING: you must move all files manually before using this build (or delete your current arcade game lists and start over)
- Moved "\ini_files\cpu.ini" file to "\arcade\games\" folder, renamed and split file in two: "mame_maincpu.ini" and "hbmame_maincpu.ini"
- WARNING: the frontend will not do this for you, you need to re-create MAME and HBMAME games lists
- Moved "ini_files\games_played.ini" to new folder "\arcade\played_games\", split file for each arcade emulator and renamed to "system_name.txt"
  - the frontend will try to move/split/rename "games_played.ini" at startup, no action required from your part
  - last played game is always moved/added at the top of the list (like it does in EmuCon frontend)
  - arcade files format has changed; added a "title" tag with the game title, a "media" tag with the media type index and a "execparam" tag with MAME softlist execution parameter
  - console/computer/handheld (EmuCon) files format has changed; "game" tag replaced by "file" tag
- Moved folder "\emulator_ini\" and all its files/sub-folders to "\arcade\emulator_ini\" new folder (you must move it manually)
- Moved files "emulators.ini" and "image_categories.ini" from "\ini_files\" folder to "\arcade\" folder (EL will move them at startup)
- Moved the following files from "\ini_files\" folder to "\arcade\" folder (you must move them manually before using this build)
  - mame_softlist_exclude.txt
  - el_mamu_exclude.ini
  - mame_machines_usercustom.ini
- Moved the following files from "\ini_files\" folder to "\arcade\filters\" new folder (you must move them manually)
  - category.ini
  - version.ini
  - catver.ini
  - mess.ini
  - nplayers.ini
  - languages.ini
- Moved "\ini_files\memcard_lastused\" folder and all its files/sub-folders to "\arcade\memcard_lastused\" (you must move the folder manually)
- Moved the following files from frontend's root folder to "\arcade\db_xml\" new folder; they were also updated (make sure to delete your current files from EL's root folder)
  - DICE_xml.dat
  - SEGAModel2_xml.dat
  - SEGAModel2-v1.0_xml.dat
  - SupermodelSEGAModel3_xml.dat
  - ZiNc_xml.dat
- Frontend logo changed to "Multiple Systems Frontend" since it's not just arcade systems anymore
- Minor hack in TFontDialog component to allow custom colors selection (first color in colors list); it's not perfect but it works
- Support for 3840x2160 resolution (4K) in "Scan Results" screen. ListView font sizes increased to 14 pixels and form width increased extra 500 pixels (squinty mode off)
- Removed the 1000 chars limitation from command line string... uMain.RunProcess() function
- Default MAME machines for softlist games is no more! Bugged feature. eg.: "Atari 400" machine was auto-assigned to "Atari 800" games... DUH!
- From now on, you will be prompt to select a MAME machine just before running a game... if a machine is not already selected
- Changed the scope of a few internal vars from global to local; no need to define them as global and waste RAM
- Updates to favorites profiles
  - filename extension changed from .ini to .txt as they are plain text files, either ANSI or UTF-8 format
  - merged profiles of same filename from Emu Loader frontend and EmuCon frontend into a single file
  - you must use fav profiles from EmuCon v2.7.6 or v2.7.7 (profiles of older EmuCon builds are NOT compatible)
  - moved arcade favorites profiles from "\ini_files\favorites\" folder to "eldir\favorites\" (DO NOT MOVE fav profiles manually!!!)
- IMPORTANT: profile files must be manually updated by you, using the new "Update Favorites Profiles" in main menu (AFTER updating EmuCon fav profiles, if you have them!)
- Updates to "Favorites Manager"
  - new "Settings" button in the buttons tool bar: "show small, medium, large fonts"
  - you can resize the window to any size
  - you can resize columns
  - better handling when renaming title/filename and when cleansing invalid game entries
  - button "Cleanse" modified to handle arcade and console/computer/handheld (EmuCon) games
  - dialog is now always centered on screen
- Updates to the customize main tool bar buttons
  - support for new "EmuCon" buttons
  - added new "MAME and Arcade" and "Console/Computer/Handheld" text tags on each button
  - auto-resize if resolution is 640x480
  - minor tweaks to the interface
- Changes to the thumbnails view and the "Customize Thumbnails" dialog
  - renamed "Keep Aspect Ratio" to "Maintain Aspect Ratio"
  - renamed "Grid Size" to "Cell Size" since you change the size of each cell not the entire grid
  - added support to customize width and height of the thumbnail
  - cell vertical size is not increased internally by the frontend if game title text setting is enabled... that's your job
  - if game title text is enabled, you must increase cell vertical size to accomodate text
  - new thumbnail preview panel so you can view changes on-the-fly without appling them to the main games list
  - new files "resources\images\thumbnail_preview_hor.png" and "resources\images\thumbnail_preview_vert.png" required
    - (vertical image is only used/viewed if your screen resolution is 1280x720 or higher!)
  - new "Image Size" text above thumb preview panel, for fine-tuning... if you want perfect square images when "Game Title" checkbox is enabled
    - (it won't work if you have custom game fonts of different sizes!)
  - game icon size 128x128 is now used if no snapshot is found
  - minimum thumbnail cell size changed to 120x120 pixels; 68x68 game icons will be used if cell size is smaller than 144x144 pixels
  - new settings "Left Align Icons" and "Right Align Icons"; align system/game/favorite icons to the left corver or the right corner of the thumbnail image
  - new "Cancel" button to restore last settings before entering custom thumbnail settings screen (even after using the "Update" button!)
  - main games list thumbnails are only refreshed if you actually change thumb settings when pressing "Update" or "Confirm" buttons
- Several changes, fixes and optimizations to frontend startup
  - the frontend will no longer complain if you have an emulator selected without a games list for it, or have a games list without an emulator selected
  - clean install has changed: it only validate frontend games list files (MAME/MAME software list/arcade/console/computer/handheld); emulator executables are only required to create MAME/arcade games lists
  - new "clean install" dialog with multiple choices for easier handling; self-explanatory with detailed information
  - some tweaking to prevent arcade emulators settings from loading twice (in some cases)
  - removed redundant validation code to decrease the startup time
- Split image category settings and image layout settings dialog into two dialogs to avoid confusion (and duplicate code)
- Changes to "Image Category Settings" feature
  - added support for console/computer/handheld systems ported from EmuCon
  - merged arcade/console/computer/handheld systems into one big list for easier access
  - minimum 1024x768 / 1280x720 resolution required
  - several tweaks
- Changes to "Game Video Preview" feature
  - moved settings from preferences screen to its own dialog, accessible in main menu "Images", images popup menu, and games popup menu
  - you can abort changes by clicking the "Cancel" button (safe mode)
  - added support for all console/computer/handheld systems ported from EmuCon
  - merged arcade/console/computer/handheld systems into one big list for easier access
  - minimum 1024x768 / 1280x720 resolution required
  - minor optimizations
- Games list font settings changes:
  - support console/computer/handheld systems ported from EmuCon
  - font settings saved on a new file "ini_files\sysgamecustomfont.ini" instead of "EmuLoader.ini" so you don't lose them on a clean frontend install
    - (you can copy this file from EmuCon before using this Emu Loader build)
  - new "All Systems" font setting added so EL can use it as a general systems font (arcade systems font settings are EXCLUDED from this)
  - added games list background color/image settings if you want to change those settings while choosing game fonts (settings are still in preferences screen)
  - huge UI facelift
  - access more settings in the popup menu (mouse right-click)
  - support various screen resolutions, including 4K (3840x2160)
- Tiles view mode changes:
  - new setting: "Tiles View Cell Size" (view mode tool bar buton); change this option if you're using large game fonts
  - details text font is now fixed to "Trebuchet MS", size 9 (size 12 for larger cell sizes)
  - details text font color is set automatically by the frontend depending on the games list background color (either black or white font color)... HIGHLY EXPERIMENTAL!
- Changes to "Delete/Copy/Move Multiple Selected Games"
  - support for console/computer/handheld systems from EmuCon
  - bios name set info removed (MAME and arcade systems)
  - the "Check Arcade File Types To Delete" box options are limited to MAME, MAME software list games and arcade systems
  - new settings for the console/computer/handheld systems (MAME and arcade are not supported)
    - "Delete Game From Games List"; you can delete a game from the main games list files (like in EmuCon)
    - "Delete Game Files From Disk"; checking this option will delete the game files (like in EmuCon)
  - gamename search bar removed; this was a ridiculously useless thing to have in there...
- Several files in "eldir\resources\main_icons\" renamed and moved to another folder

### Removed

- Last selected game per system is gone; if last selected game is no longer visible after a games filters change, the first visible game is selected
- File "resources\images\favicon_thumbnail.png" no longer required
- Machines filter tool bar button is no more (replaced by something a lot better)
- Arcade systems filter tool bar button is no more (replaced by something a lot better)
- The following icon files are no longer required, "\resources\main_icons\" folder: "filterarcade_00_listall.ico"; "filterarcade_00_multi_system.ico"; "filterarcade_01_mame.ico"; "filterarcade_02_supermodelsegamodel3.ico"; "filterarcade_03_daphne.ico"; "filterarcade_04_demul.ico"; "filterarcade_05_hbmame.ico"; "filterarcade_06_dice.ico"; "filterarcade_07_segamodel2.ico"; "filterarcade_08_zinc.ico"

### Added

- Support for latest Demul 0.7 WIP (November 11, 2017)
  - detection of "merge" tag and alternate filenames
  - fix bios titles to match MAME
- New "media type" status bar icon next to the game name / game filename for the main games list (preliminary feature!)
- Support new "Games.xml" file used in Supermodel 3 emulator SVN 592 and newer, so games list can be created from it
  - if this file is not found ("supermodel3_dir\Config\Games.xml"), the frontend "outdated" custom file will be used (frontend_dir\arcade\db_xml\SupermodelSEGAModel3_xml.dat)
  - support fully merged child sets (clone games); note that partially merged child sets are NOT supported by the "Supermodel 3 Emulator"... you either have all child ROMs in the parent set or all child ROMs in the child set!
- New options for screen view: "Cropped" and "Stretched" (MAME Settings screen)
- Support for MAME v0.183 and newer:
  - new "PortAudio" sound output mode ("Sound" tab); also extra settings: API, device, latency
  - new "UWP (Windows 10)" OSD Input Provider for keyboard and joystick; only supported in Windows 10
  - new "Hybrid DInput/XInput" in "OSD Joystick Input Provider"... hybrid DirectInput/XInput joystick, Windows only
- Support for MAME v0.190 and newer
  - detection of new "feature" entries from -listxml output ("sound" and "graphics" types only for now...)
    - "unemulated" entries are renamed to "preliminary"
  - detection of new "SVG" display type for MAME v0.191 and newer
- Added several Unicode functions in "source\uCommon.pas" for future improvements and better Windows 10 support
- Added detection of the "optional" tag in ROMs/CHDs (MAME/HBMAME), for future frontend improvements
- New console/computer/handheld systems and games lists (major port from EmuCon frontend!!!)
  - what ???! MAME calls them "loose software"; games that are not listed in software lists ("mamedir\hash\" folder)
  - in most features, handheld systems are included in "console" system
  - created two new main menu items to separate system types: "MAME/Arcade" and "Console/Computer"
  - new menu items to setup emulators, games folders, images folders (main menu "Console/Computer"):
    - Emulators Setup
      - select up to 4 emulators per system
    - Systems Folders Settings
      - select games folders for each system and media type (cartridge, floppy disk, cassette tape, disc, hard disk drive)
    - Systems Editor
      - assign MAME software lists to EmuCon systems; multiple software lists can be assigned to a single EmuCon system      ;  (this requires a MAME games list and a MAME/arcade emulator selected)
    - Games Editor
      - you can split games data: title, year, manufacturer, number of players (MAME and arcade games are not supported)
    - Create Games List
      - I wonder what this does. Humm... I've got it! It makes pudding :)
  - new "frontend_dir\console_computer\" sub-folder to store config files, games lists and extra stuff
  - column "Category" shows the system name + media type, just like MAME softlist games
  - play MAME software list games with custom emulators: BlueMSX, WinVICE, Win-UAE, FS-UAE, Snes9X, ZSNES, Altirra, Atari 800 Emulator, Stella, and many others
  - you can use MAME and AlterMAME emulators selected in the arcade front to play console/computer games from EmuCon (some games might not work)
  - you can still select MAME/MESS/UME binaries in "console/computer emulators setup" and use them to play games (to maintain EmuCon compatibility)
  - you can have two parameters for each emulator; to change between them, go to the new "Use Param" tool bar button
  - you can play a EmuCon game using different MAME machines, by using the new "Run Game With MAME" in games popup menu... thanks to the new "Systems Editor"
    - this setting is saved in "frontend_dir\console_computer\mame_systems_softwarelist.ini" file
      - eg.: "msx1_cart", "msx1_flop", "msx1_cass" MAME softlists are assigned to the "MSX" system; you can use any MSX/MSX2/MSX2+/MSX Turbo-R MAME machine to play games not found in MAME software lists
- settings from EmuCon frontend can be easily used in Emu Loader simply by copying some files into Emu Loader's new "\console_computer\" sub-folder
  - EmuCon files/folders to be copied to "el_root_dir\console_computer\" folder:
    - sysemulators.ini
    - sysgamefolders.ini
    - sysimagefolders.ini
    - emulator_parameters.ini
    - emulator_parameters[default].ini
    - ignore_extensions.txt
    - "\games\" folder and all its files
    - "\game_cfg\" folder and all its files
    - "\played_games\" folder and all its files
  - EmuCon favorites profiles must be copied to "el_root_dir\favorites\" new folder
  - NOTE: if you make changes to these files in Emu Loader, you can copy them back into EmuCon install dir and use them there without worries :)
  - NOTE: you must update favorites profiles manually using "Update Favorites Profiles" in main menu; after the update you can delete "frontend_dir\console_computer\favorites\" and "frontend_dir\ini_files\favorites\" folders
- New mega filter dialog for machine types and systems filters
  - all systems now have check boxes, make sure to tick them to select the desired systems
  - new "All Arcade Systems" and "All Console/Computer/Handheld Systems" options so you can quickly show or hide all available systems
    - individual systems checked status are no longer lost if you check "All Systems" options :) :) :) :)
  - machine types expanded:
    - "Arcade Systems": to hide/show all arcade systems (MAME softlist games excluded)
    - "Console Systems": to hide/show all console systems ported from EmuCon (MAME softlist games excluded)
    - "Computer Systems": to hide/show all computer systems ported from EmuCon (MAME softlist games excluded)
    - "Handheld Systems": to hide/show all handheld systems ported from EmuCon (MAME softlist games excluded)
    - "MAME Machines With Software Lists: to hide/show all MAME machines that have software lists (info from -listxml output)
    - "MAME Machines Without Software Lists: to hide/show all MAME machines that do not have software lists (AntoPISA's "mess.ini" file required)
    - "MAME Software List Games: to hide/show all softlist games from MAME (based on "mamedir\hash\*.xml" files
    - "Enable MAME Machines Filter Panel": filter MAME software list games by MAME machines (left side of main games list)
  - check more options in the systems popup menu (mouse right-click)
  - settings are saved in EmuLoader.ini when exiting the frontend
- Added a warning message in the "Run Game Confirmation" dialog for ZiNc; ZiNc returns "error 1: incorrect function" if don't have the "d3d-ogl12.zip" plugin installed in ZiNc
- Support AntoPISA's version info and category .ini files for HBMAME emulator
  - rename "version.ini" to "version_hb.ini" to avoid replacing MAME's "version.ini" file
  - rename "category.ini" to "category_hb.ini" to avoid replacing MAME's "category.ini"
  - only then, copy both .ini files to "eldir\arcade\filters\" folder

## [8.2.9] - 2016-11-26 U

### Fixed

- Frontend crash when switching to internet game info (images tool bar button) and if starting the frontend with "internet game info" selected
- Error detecting MAME driver .ini files if gamename and drivername are the same (games popup menu, custom game/driver settings)

## [8.2.8] - 2016-11-23 U

### Fixed

- Oopsie! Crash when trying to read "ini_files\image_categories.ini" when it doesn't exist

## [8.2.7] - 2016-11-23 U

### Changed

- Split "ini_files\folders_emulators.ini" in two: "emulators.ini" and "image_categories.ini"; to fix MAMu_ icons folder not updating to .ini file
  - this update will occur at startup, if file "folders_emulators.ini" still exists...

## [8.2.6] - 2016-11-22 U

### Fixed

- Select a media player and reset parameters buttons doesn't work; video preview, preferences screen
- Message box dialog doesn't display unicode game titles in the top bar
- Proper detection of PNG, JPG, GIF, BMP image types, to fix frontend freezes and crashes (unzipped and zipped)
- Memory leak when exiting the frontend; image panel controls were not destroyed properly
- If clicking button OK in "Emulators Setup" screen, emulators info are not updated correctly in "folders_emulators.ini" file
- Neo-Geo filter was broken; from now on, it is done by checking only the "neogeo" bios name instead of driver names
- Several fixes to preview images and EL's internal zip files cache system
  - memory leak when switching image categories in classic view mode; images zip cache was not properly terminated
  - memory leak when exiting the frontend if it was started directly in thumbnails view
  - images zip cache were initialized three times over if starting frontend directly in thumbnails view
  - when starting frontend directly in thumbnails view, after switching to another view mode, images zip files cache was not reinitializing; on images layout view, only game snapshots were showing
  - when switching to thumbnails view, image zip files cache was not cleared, wasting RAM... only game snapshot cache is needed
- Frontend crash while parsing LUA plugin info from "plugin.json" files... EL was not checking for empty lines, causing the crash (MAME settings screen)
- MAME snapshot name format was not scanned correctly for parent sets (snap\gamename\0000.png)
- Switching to "Internet Game Info" now clears the image zip files cache (image categories popup menu)
- Cycle image categories doesn't select "Internet Game Info" anymore (images tool bar button)
- Filter "Taito G-NET" was not working

### Changed

- Changes to thumbnails view
  - minimum size increased to 152 pixels
  - game icon size changed to 128x128 pixels
  - added system icon in thumbnails to separate similar games of different systems
  - added game icon so you know if game is parent, clone, available, missing
  - you can no longer delete game snapshots of multiple selected games; to prevent frontend corruption
  - setting "Show Images/Game Docs Panel" is no more, it was causing too many bugs; from now on, images panel is always enable in thumbs view
    - you must enable/disable images in main menu images, view mode button, games popup menu "Thumbnails" sub-menu or in Thumbnais Settings dialog
    - this also fixes a couple bugs related to game docs panel in thumbs view
  - UNFIXABLE bug: if you change games font (name/size), the thumbnail cell size doesn't update correctly; only a frontend restart fixes it
- Game name icon in games list status bar now show frontend's default game icon (system/have/miss icon status)
- From now on, driver ini files are only searched in "inidir\source\" folder, except for MAME builds older than v0.118
  - it fixes gamename.ini files from being deleted if driver name and game name are the same
  - starting MAME v0.179 there is no support for drivername.ini in "inidir\" folder
- No more gradient selection bar on games lists, and any other list that uses EasyListView; single color is enough
- Changes to "Delete single selected game dialog"
  - fixed a bug that was not calculating the total files listed, so dialog's width/height can be properly adjusted
  - extended width and height to support higher screen resolutions; 640x480 is still supported
- User interface tweaks/updates to "delete/rename game image"
- Split read/write routines of emulators binaries and images folders from the main ReadIniFile() / UpdateIniFile() functions
  - to update images paths settings (ui.ini; folders_emulators.ini) right after exiting "Image Categories Settings" screen; prevent loss of changes in case of an app crash... FINALLY!!!
- Tweaks to "Select Machine to Run Game" (software list games related)
  - show favorite icon in machines
  - support higher screen resolutions
- Load preview images with threads enabled by default... toggle button no longer available in images tool bar

### Removed

- Setting "Selected Game Dark Font" no longer needed; font is always in black color on selected games (preferences screen)
- Columns "Game Status" and "Software Info Tip" removed from the main games list
- IMPORTANT: make sure to delete "eldir\ini_files\columns_profile.ini" before starting the frontend or it might crash!

### Added

- Driver status icon info next to the game icon in games list status bar (useful in thumbnails view)
  - good = green; imperfect = yellow; preliminary = red
- Support MAME v0.179
- New security setting: Disable "Delete/Copy/Move Games Files"; to prevent kiddies from messing with your games files (preferences screen, "Games List" tab)
- NOTE: this setting is disabled by default; to protect your ROMs you must check the new setting
- Multi-slot arcade games loading support for HBMAME
  - systems: Neo-Geo, STV, MegaTech
  - new files: "arcade\hbmame_multicart_neogeo.ini"; "arcade\hbmame_multicart_stv.ini"
  - misc filters "Show Only Neo-Geo MVS" and "Show Only STV Multi-Slot" also include HBMAME games
- Software list games: new info "part name" / "part title" for games with multiple files (floppy disk/cassette)
  - EL can show you the title of the floppy disk (see game "aleste2" in "msx2_flop" softlist)... for future expansion
- Changes to preview images feature:
  - file "image_09_internet.ico" renamed to "image_internet.ico"
  - new categories: end, boss, logo, score, versus, game over, how to play, select
    - read/write folder paths in MAME's "ui.ini", if file found
    - only .png files are supported since these categories are from the actual game screen
    - see "docs\el-readme.txt" to find out what are the valid .zip filenames for each category (same as ClrMAME)
    - you can find these collections at Progetto-SNAPS (<http://www.progettosnaps.net>)
  - added a new image category custom hint box that doesn't disappear after 4 seconds (mouse hover over image)
  - maximum images per category increased from 10 to 30
- Support separate zip filenames for software list snapshots, so you don't have to put snapshots of all your software lists in "snap.zip"
  - files must be the in same folder as snap.zip (or same folder as titles.zip; marquees.zip; cabinets.zip; etc...)
  - zip filenames must be the same as software list names, for all image categories! (msx1_cart.zip; nes.zip; n64.zip; snes.zip; etc...)
  - filenames like "msx1_cart_titles.zip" or "a7800_titles.zip" are not supported
  - you can find these image packs in Progetto-SNAPS website (<http://www.progettosnaps.net>)
  - all image categories are supported
  - if you make changes to any .zip file, a frontend restart is required; Emu Loader uses a temporary cache system to avoid open/close .zip files for each selected game (abuse mode OFF)
  - these softlist zip files will be scanned before snap.zip
- Added icons size options for machines list side panel; "small (16x16)", "standard (24x24)", "large (32x32)", so you can use bigger game fonts (machines list popup menu)
- Setting "Multiline Captions" is alsos applied to machines list side panel (preferences screen, "Games List" tab)
- Machines list side panel background color and parent/clone font settings are now the same as main games list

## [8.2.5] - 2016-10-19 U

### Fixed

- Removed the "ding" sound if you press ENTER key in the select folder dialog
- No "ui.ini" detection when changing MAME/HBMAME binary; it was causing problems if "ui.ini" is missing
- ZiNc games failed to run, generating error code 1; frontend "LongToShortPath()" function was not working; it's replaced by "ExtractShortPathName()" function from Delphi XE 10 Seattle compiler, which works... YAY!

### Added

- Support "ui.ini" for HBMAME; v0.172 and newer required

## [8.2.4] - 2016-09-28 U

### Fixed

- Misc filter: Hide "nodump" Games was showing these sets and hiding everything else... sorry, my mistake!

### Added

- Support for MAME v0.178
  - games filters updates:
    - "Arcadia Systems": added "arsystems" driver to filter
    - "Capcom ZN-1": added "coh1000c" bios set to filter
    - "Capcom ZN-1": added "coh1000a" and "acpsx" bios sets to filter (Acclaim PSX)
    - "Capcom ZN-1": added "coh1000w" and "atpsx'" bios sets to filter (Atari PSX)
    - "Capcom ZN-1": added "coh1001l" and "atluspsx" bios sets to filter (Atlus PSX)
    - "Capcom ZN-1": added "coh1002e" and "psarc95" bios sets to filter (PS Arcade 95)
    - "Capcom ZN-1": added "coh1002m" and "tps" bios sets to filter (TPS Tecmo PSX)
    - "Capcom ZN-1": added "coh1002v" and "vspsx" bios sets to filter (Video System PSX)
    - "Capcom ZN-2": added "coh3002c" bios set to filter
    - new filter "Sega Chihiro", validated by driver name "chihiro"
  - new setting "Monitor Discovery Method: "auto'; 'win32"; "sdl" "dxgi" ("mame.ini"; MAME settings screen/Video 2 tab)
- New column for details/grouped views: "Software Name" (software list games only)

## [8.2.3] - 2016-09-27 U

### Fixed

- ROMs/CHDs validation system fixes
  - old Demul builds v5.8.2 was setting GD games available when they shouldn't (naomigd, naomigd2); they use .bin files instead of CHDs, and must be handled as ROMs; EL was wrongly detecting them as CHD files...
  - from now on, MAME games with all ROMs tagged "nodump" are set as "available", even if you don't have the "gamename.zip" file (excluding CHD files)
    - why ??? "nodump" ROMs can't be validated as they don't have CRC32 checksum and the frontend doesn't validate ROM names or ROM sizes; take "Taito Type-X" games, they have CHD files and all ROMs tagged "nodump"; if you have the CHD files, game should be set as available so you know you have the CHD files, even if you can't play (tagging those games as missing makes no sence)
  - sets with no ROMs/CHDs were being tagged as "all ROMs no dump", affecting set validation ("Atari 2600" and others)
  - sets with no ROMs but have CHDs, were being tagged as "all ROMs no dump", affecting set validation

### Changed

- Tweaks in the game details screen (ROMs/CHDs list)

### Added

- Support for ROM/CHD "baddump" status tag. This doesn't affect the audit system, it's for information only (game details screen, audit results screen). To see this info you must re-create the games list (MAME/HBMAME, Demul)

## [8.2.2] - 2016-09-24 U

### Fixed

- CHDs of bios/device sets were not being detected when deleting game files (single game selected or multiple selections)
- Frontend crash if destination path is empty (copy/move game files); Added an error message box to remind the user
- Version info was not being read from emulators other than MAME/HBMAME in "Emulators Setup" screen (oops!)
- The function to fix Demul bios titles was returning the set name instead of set title
- FATAL BUG: non-smooth list scrolling with UP/DOWN arrows; you couldn't select games from "middle to top"; ... the "MakeVisible(Middle)" function from EasyListView was causing horrible problems
- Renamed a few remaining "Control Panel Layout" texts to "Software Cover"

### Changed

- BIG update: Format of ROMs list files have changed (arcade\systemname.elrom)... again. This requires you to re-create the games list for ALL systems!
  - ROM/CHD filenames with equal sign ( = ) are no longer renamed; it was causing problems with some MAME .chd filenames
  - SHA-1 checksum included to separate the CRC32 from SHA-1 data
  - detection of CRC32 collisions within the same set (MAME/HBMAME v0.177 and newer, Demul)
  - detection of duplicate ROMs in the same set; they are no longer added when creating a games list (same name, same CRC32, same SHA-1)
  - File ID tag expanded to support cartridge, floppy disk, cassette tapes, hard disk, Disc (LD/CD/DVD/GD), Compact Flash Card file
    - see "docs\el-romsdatabaseformat.txt" file for details
  - Media type tag added to each file, to keep track of what kind of file it is (same as "    "0" for ROM/Cartrige/Floppy Disk/Cassette; "1" for CHDs (HDD, CD, Flash Card)
  - all features updated to use the new file format (delete games files, scan games, scan results, game details, and others
- Missing ROMs/CHDs file format update (arcade\systemname.miss)
  - file entries changed to "CRC32;SHA1=FileStatus"
  - CHD filenames are no longer used
  - ROMs tagged as "nodump" are not added to the miss file anymore
- Game details screen fixes and changes
  - added SHA-1 checksum in ROMs/CHDs list
  - added file type icon in the filename column
  - removed "ROM", "CHD" strings from the status column
  - changed ROMs list font to "Segoe UI" size 9 and checksum columns to "Consolas" size 9
  - made ROMs list columns header clickable so you can sort the files by checksum
  - weird bug where Delphi 7 compiler was seeing a local var as initialized when its NIL; fixed by moving the var into global scope
  - window would cut the CHD filename text in the left panel if the text uses more than 1 line
  - increased window size; required resolution is now 1024x768 / 1280x720 (lower resolutions will show horizontal and/or vertical scroll bars so you can view all the info)
- Fixes and changes to "delete selected games"
  - fixed a few bugs regarding files listing; affected systems: MAME/HBMAME
  - CHD files of clone sets were showing as "[Parent CHD]" (fixed)
  - two new CHD icons, "Disc" (LD/CD/DVD/GD) and "Compact Flash Card"
  - adjustments and tweaks to "view files list"; access it with popup menu in "Delete Multiple Files" dialog
  - many, many... many optimizations and code cleaning
- Split "last used memory card .ini" file to support different machines for the same game (MAME/HBMAME)
  - file "ini_files\mame_memcard_lastused.ini" is no more; this file didn't care what machine you were using
  - new files are now in "ini_files\memcard_lastused\mame\machine_name.ini"
    - ... the "machine_name" is replaced by the actual name of the machine you selected to run games
  - one game can have an unique memory card for EACH different machine (psu, psa, psj, pse)
- NOTE: the data on your current "ini_files\mame_memcard_lastused.ini" file cannot be used, sorry for the inconvenience
- Some texts were still using "Lucida Console" font instead of "Consolas"
- Replaced all "image not found" files by "resources\images\emuloader.png"; files in "resouces\images\no_image\" are no longer required
- Moved "novideo.avi" file from "resources\images\no_image\" to "resources\images\" folder

### Removed

- Replaced the "MachinesTitle" TStringList var by a optimized function, to retrieve the title of "machine to use" directly from the main list (for software list games); this var was only being used in the "Run Game Confirmation Dialog", wasting precious 20KBytes of RAM :D

### Added

- Internal var "buildHBMAME" to track the HBMAME version in use
  - needed for CRC32 collision checkups (HBMAME v0.177 and newer)
  - some features might require this version validation in the future, just like MAME does
- Support for the latest Demul v0.7 (August 18, 2016)
  - detection of new games and new machines to run them
  - support for MAME CHD files
  - detection and removal of duplicate ROMs
  - detection of CRC32 collisions ("dimm" set and perhaps others ?)
  - older Demul builds are still supported (minimum v0.57)
- New icons for cartrige, floppy disk, cassete tape, CHDs (CD and Flash Card)
  - files "media_Cartridge.ico", "media_FloppyDisk.ico", "media_CassetteTape.ico", "chd_cd.ico", "chd_cfcard.ico" ("\resources\main_icons\" folder)
  - used in game details screen, delete selected game files, show scan results

## [8.2.1] - 2016-09-05 U

### Fixed

- Record input was not working at all due to source code corruption; had to write some functions from scratch :(
- Reset record input filename was not selecting a valid file in the files list (if a match exist)

### Changed

- Changes and fixes for "Run MAME With Extra Parameters":
  - added a new "Reset to Title" button so you can reset the filename to the game title (Input File tab)
  - file "gamename.inp" is not always at the top anymore (Input File tab)
  - finished implementation of "Record Current Section to a Movie" (.avi; .wav; .mng)
    - default save folder for arcade/non-arcade machines is "mame_snapdir\record_video\gamename\"
    - default save folder for software lists is "mame_snapdir\record_video\softlistname\gamename\"
    - you can select a file in the list to overwrite it with a new recording

## [8.2] - 2016-09-01 U

### Fixed

- EL was trying to get emulator version info from batch files, something impossible; it only works if you select a .exe file as emulator filename
- Tweak: zipped image filenames are now the same as MAME's default image folder names; "uMain.GetImgZipFileName()" function
- Updated frontend docs files, specially "docs\el-quick-setup-quide.txt" that had wrong/missing information
- Parsing MAME .ini files array detection was a little bugged (mame.ini, drivername.ini, biosname.ini, gamename.ini, etc)
  - last file in the array was not being read at all... the most important file with final settings (MAME settings screen)
  - file "arcade.ini" was being read for software list games
  - files "console.ini", "computer.ini", "othersys.ini" were being read for arcade games/machines
  - added a "MaxIniCountMAME" constant for easier tracking
- Folder of record input files and the "-statename" parameter for software list games were wrong. They must be saved in a "machinename" sub-folder because an input file (and save state) from one machine is not compatible with a different machine
  - MSX1 machine name "expert11"; file "mame_inpdir\expert11\msx1_cart\gooniesb.inp" cannot be loaded in the MSX 1 machine "cf3300"
  - MSX1 machine name "expert11"; file "mame_savestatedir\expert11\msx1_cart\gooniesb\gooniesb-slot1.sta" cannot be loaded in the MSX 1 machine "cf3300"
- Menu item shortcut (right-align) was not aligned correctly due to shortcut text font being 1 pixel smaller than menu text

### Changed

- A bunch of "Date/Time" texts replaced by "Date Modified"
- From now on, if the MAME version cannot be extracted, EL will assume you're using the latest MAME build; this is necessary to prevent further frontend corruption
- When running software list games, the -snapname and -statename parameters on "mame.ini" are ignored and modified by the frontend, so game snapshots and save state files are created on proper folders... adding "\machine_name\softlist_name\gamename\" sub-folders to the full path, parsed from "mame.ini"
  - run game "gooniesb" from "msx1_cart" software list and "expert11" machine, save state files will be saved in "mame_statedir\expert11\msx1_cart\gooniesb\0.sta"
  - run same game above and take a screenshot, the file will be saved in "mame_snapdir\msx1_cart\gooniesb\0000.png"
  - this is only for software list games... arcade games don't need this as MAME save files in proper folders
  - there's no ON/OFF toggle, this feature is always enabled
- Changes to "Internet Game Info"
  - MAWS game info removed since it no longer exists
  - renamed "Progetto EMMA Game Info" to "Internet Game Info"
  - added edit boxes to customize internet link games and MAME software list games (preferences screen, "Images" tab)
- Changes to "Video Preview"
  - relative path is now bound to the emulator directory, not the frontend
  - new feature "Snap Dir Auto-search": videos will be searched in "emudir\videosnaps\", "snap\videosnaps\" and "snap" folders ("snap" folder parsed from emulator config file)
  - custom video folders are now optional due to the auto-search feature; you can leave them blank (preferences screen, "Video Preview" tab)
  - when searching videos in the "snap" folder, EL will try to ignore files with .png and .jpg extension
- Big changes to the image preview feature (snapshots, cabinets, flyers, etc...)
  - default folder for "In-Game Artwork" renamed from "snapartwork" to "artpreview"; to match MAME folder name
  - file "image_09_maws.ico" renamed to "image_09_internet.ico" ("eldir\resources\main_icons\" folder)
  - added support for MAME's filename format "\snap\gamename\0000.png" and "\snap\softlist_name\gamename\0000.png"
    - only in-game snapshot category is supported!
    - only unzipped files are scanned (zipped images will NOT be supported!)
  - replaced the zombie "Control Panel Layout" image category that nobody uses by "Software Cover"
  - MAME's new "ui.ini" file is now used to read/write image folder settings; if file not found, settings will be saved in frontend "\ini_files\folders_emulators.ini" file
  - added compatibility with ClrMAME: unzipped image files can be in extra sub-folders for each image category
    - game snapshot: custom_snapdir\snap\gamename.png
    - title snapshot: custom_titledir\titles\gamename.png
    - marquee:custom_marqueedir\marquees\gamename.png
    - flyer: custom_flyerdir\flyers\gamename.png
    - cabinet: custom_cabdir\cabinets\gamename.png
    - control panel: custom_ctrlpaneldir\cpanel\gamename.png
    - software cover: custom_softcoverdir\covers\gamename.png
    - pcb: custom_pcbdir\pcb\gamename.png
    - in-game artwork: custom_artpreviewdir\artpreview\gamename.png
    - NOTE 1: these extra folder names are hard-coded in MAME source code and cannot be changed!
    - NOTE 2: only MAME/HBMAME are supported!
  - image folder keyname entries in "eldir\ini_files\folders_emulators.ini" have changed to meet MAME setting names from "mamedir\ui.ini"
  - file scanning order changed to prioritize unzipped images
    1. custom_snapdir\gamename.png
    2. custom_snapdir\snap\gamename.png
    3. custom_snapdir\gamename\0000.png
    4. custom_snapdir\parent_gamename.png
    5. custom_snapdir\snap\parent_gamename.png
    6. custom_snapdir\snap\parent_gamename\0000.png
    7. gamename.png (from snap.zip)
    8. parent_gamename.png (from snap.zip)
- Changes to MAMu_ icons feature
  - MAME's new "ui.ini" file is now used to read/write icons folder setting; if not found, setting will be saved in "eldir\ini_files\folders_emulators.ini"
  - default icons folder is now "icons" since this is MAME's default folder
  - relative path is now bound to the emulator directory, not the frontend; this is the way it should've been from the start!
  - unzipped files can be on an extra "icons" sub-folder; "custom_iconsdir\icons\gamename.ico" (ClrMAME friendly)
  - HBMAME games also display MAMu_ icons, but there is no separate icons folder or icons.zip support for HBMAME; MAME game icon files are used
- File "ini_files\times_played.ini" renamed to "ini_files\played_games.ini" and the game name format of software list games
  - old format: 'gamename_softlistname=???"
  - new format: 'softlistname\gamename=???"
  - the file will be renamed and updated the first time you start Emu Loader
  - invalid game name entries will be deleted from the file
- Favorite profile files format has changed for software list game entries ("eldir\ini_files\favorites\" folder)
  - old format: 'gamename_softlistname=system_name"
  - new format: 'softlistname\gamename=system_name"
  - arcade games and MAME machine name entries have not changed
- NOTE: Emu Loader will NOT update favorites to avoid file corruption
- File "arcade\multicart_neogeo.ini" renamed to "arcade\mame_multicart_neogeo.ini"
- File "arcade\multicart_stv.ini" renamed to "arcade\mame_multicart_stv.ini"
- Speed up several operations with multiple selected games, specially in grouped view mode (50% faster)... games filtering is still slow
- The following functions were modified by me and optimized for multiple TEasyGroups usage (EasyListView.pas)
  - function TEasySelectionManager.First: TEasyItem;
  - function TEasySelectionManager.Next(Item: TEasyItem): TEasyItem;
- Load Multi-Slot Games dialog updates
  - UI adapted to avoid "squinty face" mode on high resolutions
  - font of all columns changed to "Segoe UI" size "9"
  - all column resize according to text length, except game title
  - for resolutions lower than 800x600, dialog resizes itself
- Big rewrite of "Run MAME with extra parameters" feature... games popup menu, "Run Game (Extra)" menu item
  - new feature: load memory card files; basically for Sony PlayStation (software list games) and Neo-Geo machines (arcade/console)
  - you can use "play/rec input files", "load save state", "load memory card" features all at the same time now!!!
  - menu items tree "Play Game (Extra)" removed, replaced by a single and more optimized "Play Game (Extra Parameters)" menu item (games popup menu)
  - new screen with tab pages so you can activate each feature (all disabled by default)
    - Playback/Record an Input File
    - Load a Save State
    - Insert Memory Card
  - you must check the "Enabled" checkbox to activate each feature you want to use
  - files lists are always sorted by newest date and the newest file is always selected by default
  - insert memory card details:
    - default folder is "mamedir\memcard\" even though MAME doesn't support "memcard_directory" entry anymore
    - you can select a file from any folder you want or choose a file listed in the "\memcard\" folder
    - if a relative path is used, the "mamedir\memcard"\ folder is used for the full path
    - only file extensions ".mc", ".mc1", '.mc2" are supported... let's not make a mess here!
    - machines that support memory cards are listed in a new file "\arcade\mame_memcard_support.ini"
    - EL will save and restore the last used files into a new "ini_files\mame_memcard_lastused.ini" for every game you play!
    - only 2 memcard slots are supported; if a machine support more slots, please let me know
- Some UI adjustments in MAME Settings screen (still not good enough)

### Added

- Support for MAME v0.176
  - support reading "plugin.ini" from MAME's root folder and/or "mamedir\ini\" sub-folder (root folder is searched first)
  - settings "Record Rendered Video Filename (AVI)" removed from both BGFX and HLSL features since they now support "auto" (it uses game name filenames automatically)
- Support for MAME v0.177
  - new "mame.ini" settings: "Uneven Stretch Vertical" and "Auto Uneven Stretch" (MAME settings screen)
- New "Save State" filter (machines popup menu) and new column in "MAME Machines List Side Panel" (Machines toolbar button)
- New columns "Clone of" and "Save State" in "Select Machine to Run Game" (games popup menu)... for software list games

## [8.1.7] - 2016-07-05 U

### Fixed

- Var "eThumbnailFileName" was not being cleared when reloading games data into the list or deleting selected game thumbnail
- Memory leak when exiting the frontend while in thumbnails view mode (selected game thumb var still in RAM)

### Changed

- Modified my custom "TGaugeBar2" component (Graphics32 library) to support "0.000" float values (three decimals)
- Whene deleting thumbnails, zipped thumbs are skipped since they cannot be deleted... to improve speed when deleting multiple thumbs

### Added

- Setting "Disable V-Sync" added back to Supermodel settings (requires emulator SVN 446 or newer)
- Support for MAME v0.175; also added new "Vector Post-Processing" settings in "Direct3D Post-Processing" page ("Video 2" tab)

## [8.1.6] - 2016-06-05 U

### Fixed

- Sega Model 2 ROMs paths were not being correcty read from "emulator.ini", making it impossible to validate games

### Changed

- Moved all category filters inside a group box; removed "Light Gun" category filter (Miscellaneous tool bar filters)
- Clicking "Reset" button, text in TEdit box is cleared (search bar)
- Pressing "ESC" key, the text in TEdit box is cleared (search bar)
- Changes to "Game Details" (games popup menu / Shift+I shortcut)
  - if save state is "unknown" (empty), info is not shown anymore
  - "Played" info renamed to "Last Played"
  - "times played" info moved from "Last Played" to "Playtime" info

## [8.1.5] - 2016-05-29 U

### Fixed

- Search bar was not working anymore after implementing controls search bar button
- Removed the annoying "ding" sound when pressing ENTER and ESC keys in the search bar TEdit control

### Changed

- Setting "Allow Only One Instance" is now enabled by default; to avoid problems and unwanted crashes, you shouldn't run more than one instance of the frontend from the same folder

### Added

- Added a separate setting "Include Tool Bar Filters" to the new controls search bar button (its setting can be different than the one from the search criteria!)

## [8.1.4] - 2016-05-26 U

### Fixed

- Neo-Geo filter was not showing all games for MAME v0.174; there is a new driver name: "neodriv"
- EL will also validate Neo-Geo game names by its bios set name...: "neogeo"

## [8.1.3] - 2016-05-25 U

### Fixed

- Control "none or empty" was not filtering the games list correctly ("MISC" main tool bar filter)
  - software list games should not be listed as they don't have control entries (mamedir\hash\*.xml files)

### Changed

- Renamed "\ini_files\control_type.ini" to "\ini_files\mame_control_type.ini" since this file is for MAME/HBMAME only

### Added

- New search bar filter: Controls
  - a quick way to filter games by controls (for MAME/HBMAME only)
  - the results are affected if "Include Tool Bar Filters" option is checked (search bar options button)
  - software list games are excluded from this filter since they don't have controls listed in "mamedir\hash\*.xml" files
  - this new filter ignores the search criteria and overwrites the controls filter selection in the miscellaneous filters ("MISC" main tool bar button)

## [8.1.2] - 2016-05-02 U

### Fixed

- Danger, Will Robinson. DANGER! Feature "Machine to Run Game" was resetting user custom machine names to their default values when creating a new MAME games list (games popup menu)
  - file file "mame_machineslast.ini" renamed to "mame_machines_usercustom.ini" and moved from "\arcade\" to "\ini_files\" folder
  - file "\arcade\mame_machines.ini" is now used to get default machine names for each softlist file
  - file "\ini_files\mame_machines_usercustom.ini" now only list machine names that differ from default machine names in "mame_machines.ini"
    (default is the first machine listed in each section... MAME has no default machine for software lists)
  - fixed a crash when a machine is not selected in the list and you click "Confirm" button
  - file "\ini_files\softlist_exclude.txt" renamed to "ini_files\mame_softlist_exclude.txt" ("Customize Software List" in main menu)

### Added

- Partial support for software lists in HBMAME; it might never be used by the emulator, but you never know...

## [8.1.1] - 2016-04-29 U

### Fixed

- Systems other than MAME and HBMAME were not showing in the list
- Detection of the new "neopcb.cpp" Neo-Geo driver name, so Neo-Geo filter works again

## [8.1] - 2016-04-28 U

### Fixed

- App crash when trying to read/write "language" setting in "mame.ini" (MAME Settings screen)
- Selected game docs texts were parsed twice at startup ("mameinfo.dat" and others); startup is 1 second faster...
- When the frontend is all setup (emulators already selected), if an emulator executable is not found at startup you couldn't select a new file, forcing you to edit "eldit\ini_files\folders_emulators.ini" manually or make a clean install
- Control Type filter was adding blank control names into the ComboBox (Miscellaneous filter, tool bar buttons)
- If "ini_files\folders_emulators.ini" read fails at startup, EL would re-write existing "EmuLoader.ini", changing some frontend settings to their default values

### Changed

- Deleted extra TPanel component from game docs panel (not needed); moved game docs panel below the image panel in project's source code
- Replaced a bunch of Pos() function calls by the faster asm optimized function PosEx()
- Grouped all controls and players info texts for easier reading ("Game Details" screen)
- File "ini_files\control_type.ini" updated to include new control tags for MAME v0.173; a bunch of unused entries were also removed
- madExcept library now shows error messages automatically

### Removed

- Support for MAME Plus! is no more... you can still use it to create a games list and play games, but do not use emulator/game settings or EL might crash and/or damage "mame.ini" contents

### Added

- MAME/HBMAME save state info is back; you must create a new games list to use this
  - to filter by save state, go to the "Miscellaneous" filter in main tool bar buttons
  - this info/filter is available for MAME/HBMAME only; other emulators are not supported
  - software lists are not supported since they can be used by different machines, and their save state values may differ
  - info is shown in "Game Details" screen, nowhere else
- Support for MAME v0.173
  - huge update to the "input" / "control" tags in -listxml output; future changes in the frontend might be necessary
  - the "buttons" tag is not separated by player; frontend's "buttons count fixed (do not merge all players buttons...)
  - buttons count for keyboards, keypad and other controls are now added to the buttons count info (might change in the future)
  - new settings

## [8.0.8] - 2016-04-23 U

### Fixed

- App crash due to a bug in the "ini_files\times_played.ini" file update function after exiting a game.

## [8.0.7] - 2016-04-23 U

### Fixed

- Fixed read/write Supermodel settings for good! Also, custom game settings that are the same as emulator settings are no longer added to .ini files

### Removed

- Setting "Disable V-Sync" removed since this setting doesn't exist in Supermodel emulator (Supermode Settings screen)

## [8.0.6] - 2016-04-21 U

### Fixed

- Extra bios names were added into the Bios List when changing MAME/HBMAME default settings
- The "New 3D Engine / Legacy 3D Engine" was not being correctly set in Supermodel settings screen, and when running games
- Renamed all "FileName" texts to "Filename" (cosmetic fix)

### Changed

- Added custom folders support for "View Game Docs" (mameinfo.dat; history.dat; etc); it requires MAME v0.172 minimum with "ui.ini" file and "historypath" entry
- Updated Supermodel XML games list file based on SVN 351 (Games.cpp), and added a new "controls" tag
- Changes to MAME settings screen
  - added support for Unicode title strings in LUA plugins list (just in case...)
  - BGFX / HLSL / GLSL post-processing settings split into their own sub-pages ("Video 2" tab)
  - moved "Video Output Mode" setting to "Video 2" tab
  - added a list of all available BGFX shader chain files for easier usage
    - all .json files from the "bgfx\chains\" folder will be read and added into a ListView (title, author, filename)
    - use button "Select" (or mouse double-click) to select a single shader and make active; use button "Add" to add multiple shaders to the Edit box
    - NOTE: you must make sure the selected shader appears in the Edit box... just selecting a shader in the list will not make it active!
  - new BGFX setting: "Record Rendered Video Filename (AVI)"; default key to save a video rendered by BGFX is Shift+F12 (same as HLSL and "record video" in MAME's internal UI)
  - new OSD output options: "OSD Provider" ("Input" tab)
  - more interface tweaks

### Added

- Link to the new MAME documentation in "Help" main menu: <http://docs.mamedev.org/index.html>

## [8.0.5] - 2016-04-11 U

### Fixed

- Daphne version info not showing up correctly in Daphne settings screen on a fresh install, or if changing exe filename in Emulator Setup screen
- Finished updating "LoadROMsFolders" function calls for all the non-MAME related emulators; added the custom emu exe filename parameter
- ROMs folders lists for all system were being loaded into RAM twice at startup (cosmetic fix)
- Some SEGA Model 2 games were missing screen orientation, resolution and refresh rate (need to re-create games list to fix this...)
- Some ZiNc games were missing screen orientation, resolution and refresh rate (need to re-create games list to fix this...)
- Filters were not applied after creating games list manually (main menu "Create Games List")

### Changed

- Finished updating some function calls, related to bugs fixed in EL v8.0.4
- More code cleaning
- Changes and improvements to MAME Settings screen
  - improved hint texts on some settings (hover mouse in them)
  - setting "HLSL Prescale Override Factor" is no more ("Video 2" tab, "Direct3D Post-Processing Effects" group box)
  - setting "Hardware Stretch" is gone; DirectDraw is gone from MAME and this setting is always enabled anyway
  - new setting "HLSL Oversampling" ("Video" tab, "Direct 3D Post-Processing Effects" group box)
  - moved all LUA related settings into a new "LUA" tab since MAME v0.172 have a bunch of new LUA settings
  - moved Audio settings to "LUA" page, renamed "Video and Audio" to "Video"
  - moved "Visual Effects Overlay File" from "Video 2" tab to "Game Screen" panel in "Video" tab
  - new setting "Integer Scale Overscan" (for MAME v0.173)
  - removed setting "Write Dummy Snapshot" since you need a MAME compile with debug enabled (and EL is all about playing games)
  - moved setting "Video Output Mode" to "Video 2" tab, to be placed with HLSL/GLSL/BGFX Pos-Processing Effects
  - fixed audio latency setting
  - several settings are now disabled if they are not present in "mame.ini" (emulator default settings file)
  - source code optimizations and removal of redundant code
  - UI tweaks to reduce waste of space between controls
- Updates to Supermodel emulator (settings screen, and games list)
  - minimum emulator version supported is now v0.3a SVN release 335
    - (using older emulator builds might cause problems)
  - added new video setting: "3D Engine"; you can select between the new engine by Ian Curtis or the old one (legacy)
  - updated "SupermodelSEGAModel3_xml.dat" file with new/changed games, based on source code v0.3a SVN R335
  - fixed missing screen resolution/refresh rate and driver name in some games

### Added

- Enabled support for AntoPISA's "gameinit.dat", not that's officially supported in MAME; to be used with "Game Docs" feature; place file in MAME's root folder
- <http://www.progettosnaps.net/gameinit>

## [8.0.4] - 2016-03-18 U

### Fixed

- Games list background image was not loading; there was a tiny 1 line code missing in the function to fix full paths when you use relative paths

## [8.0.3] - 2016-03-17 U

### Fixed

- Crash when changing MAME settings... this was a really old bug, introduced in my last MAME settings screen re-write
- MAME Artwork path was not being read from "mame.ini" correctly, causing EL to parse filenames list from a wrong directory
- MAME version info not showing up correctly in MAME settings screen on a fresh install, or if changing exe filename in Emulator Setup screen
- Wrong default config file was being used if you tried to set emulator default settings from "Emulator Setup" screen (all systems, not just MAME)
- Added emulator exe filename parameter in several functions to fix "file not found" and parse settings of the wrong default config file
- Crash when using "Scan Missing Audio Samples" (main menu "Games List'); scanning is also a lot faster now

### Changed

- MAME Artwork path is now parsed from "mame.ini" everytime it needs it (no more ArtworksDir[] array var stored in RAM):
  - "Run Game with Effect Overlay" (games popup menu)
  - changing MAME/HBMAME settings
  - select artwork files (frontend's custom "Select File" dialog)
- Input path is now parsed from "mame.ini" everytime it needs it (no more InputDir[] array var stored in RAM)

## [8.0.2] - 2016-03-15 U

### Fixed

- Added a validation check to prevent "Create Games List" from executing again while it's still running (main menu)
- Tag "compat" was not being read from softlist games files ("eldir\softwarelist\" folder)
- Software list counter label in splash screen was off by 1 (cosmetic)
- Frontend crash when using "Create Software List Games" main menu (weird Delphi 7 compiler bug!)
- Ultra slow game name searching in "systemname.elstatus" files when scanning for games; quick scan was the most affected
- Setting "# inipath" was not being correctly detected on old MAME builds, making impossible to set custom game settings
- Could not set media player file in preferences screen (video preview tab)
- Old bug... I guess people don't use ZiNc anymore! Setting "Texture Cache" was not being parsed correctly from "renderer.cfg" (ZiNc settings screen)

### Changed

- MAME/HBMAME emulators full title are no more; they are now simply "MAME" and "HBMAME: HomeBrew MAME"
- MAME build is detected before creating MAME games list; the "-listxml" output will only be used for MAME v0.70 and newer; this is to avoid EL trying to use "-listinfo" output on new MAME builds if the build number detection function fails
- Changed LUA scripts delay timer default's value from 2 secs to 0 secs; for MAME v0.172 (MAME settings, "Input" tab)
- Images manager updates and changes (main menu "Images")
  - window mode is now "modal" instead of "stay on top"; you can't access the main games list anymore
  - new feature: Search available images on missing games; easier to delete images of games you don't have
    - use button "Scan Not Used Images" for this new fuction
    - a new image preview floating panel will show the image of the selected game (its last position is saved/restored)
    - create a list of missing MAME games where images are found, so you can remove unwanted image files from your collection
    - software list games support
    - unzipped images only
  - new popup menu option: "Scan Arcade Games/Machines", to scan for arcade games/machines
  - the button "Scan Missing Images" updated to scan all games for missing image files
  - the button "Scan Invalid Images" updated to scan all image files and compare with MAME game names for unknown filenames
- NOTE: make sure to check the popup menu for some settings before scanning (mouse right-click)
  - minor tweaks and code optimizations
- AntoPISA's "category.ini" and "version.ini" have priority over "catver.ini"
- From now on, you need AntoPISA's "mess.ini" file to filter MAME non-arcade machines (found in "renameSet pack" or "version.ini pack"); if you still want to use "category_home.ini", rename the file to "mess.ini"
- UI tweaks in MAME settings screen to fit new settings
- UI tweaks in "SEGA Model 2" settings screen to fit on 640x480 resolution
- UI tweaks to remove the large and unnecessary 16 pixels borders in the following screens:
  - "MAME settings (Basic Mode)"
  - "Supermodel 3" settings
  - "Daphne" settings
  - "SEGA Model 2" settings
  - "ZiNc" settings
- Changes to ZiNc settings screen
  - grouped related settings next to each other
  - added new "Enable Keys" setting (renderer)
  - replaced "Manual Framerate" by a TEdit control and support values from 0 to 1000
  - UI tweaks to minimize the mess

### Removed

- Removed support for AntoPISA's "catver_full.ini"; rename the file to "catver.ini" if you still want to use it
- Removed support for AntoPISA's "category_home.ini"

### Added

- New HLSL settings: "Shadow Mask Tile Mode" and "Bloom Blend Mode" (MAME Settings screen, "Video 2" tab); for MAME v0.169 and up
- New "Sound Output Mode" option: "XAudio2" (MAME Settings screen, "Audio" tab); for MAME v0.170
- WARNING: Windows 8 or newer required!
- Support for MAME v0.171 new settings (MAME settings screen)
  - Plugins directory selector ("Folders" tab)
  - Languages directory selector ("Folders" tab)
  - Language selection for text localization in the emulator ("Miscellaneous" tab)
  - "Record an Input Timecode File" ("Input" tab)
  - "Exit Emulator After Input Playback" ("Input" tab)
  - "Type of User Interface" ("Miscellaneous" tab)
- Added a way to cancel changes in "Category / Layout Settings" (images main menu; images popup menu); you must click the "Apply" button to save and apply changes to categories and layouts

## [8.0.1] - 2015-12-26 U

### Fixed

- Forgot to update "docs\el-listformat" file with new games list format

### Added

- New MISC tool bar filter: Hide "No Dump" Games; it will hide games were all ROMs/CHDs are tagged as "nodump"

## [8.0] - 2015-12-09 U

### Changed

- Frontend games list files format have changed to use tags, to avoid problems with non-English code pages and localization ("\eldir\arcade\" folder). EL will try to convert your current games list files at startup; sadly, games list file sizes have doubled :(
- Additional changes were made to help reduce file sizes and to avoid adding pointless data
  - fields "emulation/color/sound/graphic status" are only added if driver status is "imperfect" or "preliminary"; no need to add them if driver status is "unknown" or "good" - field "game size" is only added if value different than 0 (zero)
  - following fields are only added if they appear in MAME's -listxml output: "buttons", "mechanical", "controls", "number of players", "screen type", "screen orientation", "screen resolution", "screen refresh rate"
- Updated softlist games list files format to match the new arcade list format; "softname.el" file sizes are smaller than before :)
- WARNING: you must manually delete all files from "eldir\softwarelist\" folder before using this build or the frontend will crash (no auto-update)!
- Updated "\ini_files\times_played.ini" to replace " ¬ " char by " ; " char to avoid problems with non-English Windows code pages and localization. File will be updated at startup if found and not already updated
- Replaced a bunch of Pos() calls by a faster assembler optimized PosEx() function (source\uCommon.pas)
- Note: PosEx() function doesn't work with Unicode strings (Delphi WideString)
- Disabled deprecated settings in MAME setting screen: "HTTP Server" and "Enable LUA Console" for MAME v0.168 and up

## [7.9.6] - 2015-11-07 U

### Fixed

- Emulator binary detection at startup was not updating emulator version info; also, the version info for MAME and AlterMAME was switched
- ...be aware that the new data is only saved to "ini_files\folders_emulators.ini" when exiting the frontend or accessing "Emulators Setup" screen

### Changed

- Changes to customize columns screen
  - added "Customize Header Font" and "Default Font" buttons for easier access
  - removed test/debug button
- Game custom settings (game, driver, screen type, etc...) is disabled if selected game is a MAME software list game (non-arcade). MAME doesn't support custom settings for software list games

### Removed

- Some source code cleanup
  - game info var "eUseDeviceROMs" no longer used... completely removed from the project
  - array "ListGamesDeviceROMs" no longer used... completely removed from the project
  - removed a couple disabled functions since they are no longer used

### Added

- Columns sub-menu in main menu to access the customize games list columns (sub-menu "Games List")
- Games list status bar color customization (preferences screen, "Games List" tab)
- Support "raster.ini"; "lcd.ini" screen type settings for MAME v0.167 (games popup menu, "Custom Settting" / "AlterMAME Custom Settings")

## [7.9.5] - 2015-11-01 U

### Fixed

- Export games list to .txt file fixes/changes (main menu "Games List")
  - new feature dialog with several options to choose from
  - full format was not listing all info; entries format changed a little bit
    - sys_name: game_title [softlist_name\gamename; cloneof parentname] - export to "MAME Content Manager Plus" was including software list games. MCM+ only support arcade/non-arcade machines from -listxml output and MAME/HBMAME emulators
- Fixes to delete/copy/move multiple games files
  - frontend frozen in an endless loop when trying to detect software list names, resulting in a crash
  - only MAME games were being processed, ignoring games from other systems
  - memory leak when processing software list games
  - some optimizations to improve speed
  - created an internal list of MAME games files to be processed so they won't have duplicate copies for other systems, in case MAME game files are being shared with different systems (MAME, HBMAME, ZiNc...)

### Changed

- File 'ini_files\videopreview.ini' is not available in the distribution pack anymore. It will be generated at startup if not found. This is to prevent overwriting your current video preview settings

### Added

- Support for new MAME v0.167 vector settings (MAME settings screen, "Vector" groupbox)... setting "beam" for older MAME builds is still supported
- New file "ini_files\videopreview[default].ini"

## [7.9.4] - 2015-10-13 U

### Fixed

- MAMu_ icon was not showing in the selected game at startup (old bug)
- Error message "28x22 icon could not be loaded" if changing arcade filters while "Small Tool Bar" setting is enabled (files in "resources\main_icons\arcade_filters\" folder don't have small icons, only 44x40 size)

### Changed

- Setting "Run Game Confirmation Dialog" is now disabled by default (main menu)... no more nagging dialog on a fresh install
- From now on, when a game is re-selected (filter change, view mode change, etc...), it will always appear in the middle of the list (vertically); it's easier to find this way

### Added

- New setting: "Allow Only One Instance"; prevent multiple instances of the frontend running at the same time (preferences screen)

## [7.9.3] - 2015-10-07 U

### Fixed

- Access to main menu from games popup menu was not possible while frontend in full screen mode
- Games list splitter and images splitter incorrectly set at startup

## [7.9.2] - 2015-10-05 U

### Fixed

- Creating HBMAME games list would corrupt MAME games list, deleting MAME software list files and multi-cart files ('eldir\arcade\' and 'eldir\softwarelist\' folders)
- Application crash after creating games list for multiple systems at once
- Main screen doesn't hide anymore when creating games list; it was creating too many problems

### Changed

- File 'ini_files\catver_full.ini' is now priority; file 'ini_files\catver.ini' is used if the other is not found (when loading games list)
- If you use 'ini_files\catver_full.ini', there's no need to use "version ini for MESS" pack (version.ini) as version added for non-arcade machines can be read from 'catve_full.ini'
- NOTE: you still need 'ini_files\category_home.ini' for proper non-arcade machines tagging! ("category ini for MESS" pack)

### Added

- New setting: "Images Panel Outer Frame Color", so you can change the color of the 7 pixels frame in the images panel (preferences screen, 'Images' tab)

## [7.9.1] - 2015-10-03 U

### Fixed

- Game icons weren't updated correctly after single/multi game audit (visual bug only)
- Application crash when trying to setup MAME default settings on a fresh install, while at Emulators Setup screen
- Apply filters message box was not centered on screen (grouped view mode)

### Changed

- If MAME build number can't be detected, full MAME settings mode will be used by default (if using old MAME builds, the frontend might crash)

## [7.9] - 2015-10-01 U

### Fixed

- Some sets with no game ROMs but with device ROMs were not audited correctly even when all device ROMs are found (I hope I didn't break anything else in EL's games validation system)
  - alto2: Alto-II
  - fds: Famicom (W/ Disk System add-on)
- Frontend crash at StrToInt() conversion if ROM size contains '????' instead of numbers
- Heavy text flickering in splash screen if they change too fast
- Old "Game Documents" bug (F3 hotkey; games popu menu): game entry detection function would continue to scan all the way to the end of the file even after the game info was found and loaded, resulting in slow text parsing and games browsing (mameinfo.dat; history.dat; story.dat; marp.dat; messinfo.dat);
- "quick access" menus in game documents popup menu were still visible for games without text to show
- Grouped view mode fixes:
  - search bar filtering was placing clone sets in wrong parent sets (main tool bar buttons)... nobody noticed this ?!!
  - tweaks when accessing group items; twice as fast when looping thru games so filters can be applied; this view mode is still slow as hell though
- NOTE: a new message panel appears when changing games filters, so you know the frontend is not frozen
- Changing game icons size was unnecessarily resetting icon indexes and reinitializing items, causing lag ("View Mode" tool bar button, "Game Icon Size" sub-menu... grouped/details view modes)
- Some categories were displaying HTML tags (function "uMain.HTMLDecode()" is now executed in 'category' field)
- Feature "Add Selected to Favorites" / "Delete Selected From Favorites" updated to check for the "IsFavorite" game tag before displaying games popup menu on a single game selected. Both menu items will appear if multiple games are selected
- Interface bugs in "Multi-Slot Games" dialog
- Memory leaks when switching in and out of thumbnails view mode
- Setting "Alternate Title Format [Game, The]" was not working when loading the games list (main menu "Games List")
- Atomiswave games not using the new "awave" machine name of Demul v0.7; Emu Loader now tries to detect Demul version to support older Demul builds
- Frontend crash when trying to select parent set with arcade controller, if current selected game is not a clone
- Emulators selections were not saved to "\ini_files\folders_emulators.ini" file after exiting "Emulators Setup" screen

### Changed

- Changes and optimizations to frontend's games list files
  - ROMs database files renamed from "systemname_roms.el" to "systemname.elrom" ('frontend_dir\arcade\' folder)
  - new "systemname.elstatus" file with "game ROM ID", "set status", "scan mode" and "is_merged"; moved from "systemname.el"; easier and faster to update game status info without altering game list files (arcade games; MESS software lists)
  - files "mame_merged.ini" and "hb_merged.ini" no longer required
  - audio samples files renamed from "systemname_samples.el" to "systemname.elsamples" (MAME/HBMAME)
  - detection of "softwarelist" entries from "-listxml" output, for MESS games (non-arcade)
  - the following machines are not included on software lists: neogeo, stv, megatech, playch10
  - new file: 'arcade\mame.elsoftlist' with software lists for each MESS machine
  - new file: 'arcade\mame_machines.ini' to list all supported machines for each software list
  - new file: 'arcade\mame_machineslast.ini' with the last used machine for each software list
  - minor code optimizations and removal of unused variable declarations
- Minor change to frontend's logo, now called "Emu Loader: MAME and Arcade Frontend"... because MAME is no longer an "arcade only" emulator
- Optimized MAME/HBMAME emulator version info detection
  - emulator version info no longer extracted from -listxml output
  - for MAME v0.119 and newer, version number is read from file details (Windows file properties); much faster than "mame -help" output
  - older MAME builds and builds with no file details falls back to "mame -help" output
  - emulator custom title is limited to "MAME Plus!" (*mamep*); "UME" (*ume*) and HqMAME (*hqmame*), and no longer extracted from file details or -help output
  - emulator MD5/version parsing message panel removed from emulators setup screen
  - new emulator binary detection is always done at startup and their info updated (all emulators)
- Moved "Export Games List" sub-menu from "File" to "Games List" main menu; deleted "File" main menu
- Optimized games list/ROMs list loading by adding game info + ROMs list in one pass instead of loading all games first and then ROMs lists separately
- Optimized games list filtering when in grouped view mode... it takes around 3 to 5 seconds now; still too slow for my taste since details view takes less than ONE second
- Renamed "Main Filters" tool bar button to "Main Arcade Filters" since they are for arcade games only
- Feature "Images Manager" is limited to MAME emulator only, other emulators are no longer supported! (main menu "Images"); software list games are partially supported
- Changes to "MAMu_ Icons Manager" feature
  - removed "Search Icons for Devices With No ROMs" option from missing icons, they are not runnable games!
  - New missing icons option "Search Icons for Device Sets", disabled by default ("Options", status bar button)
- Moved "Screen Orientation" filter tool bar button to MISC filters button
- Optimized frontend startup to avoid unnecessary function calls and speed things up a little bit :)
- Renamed "Show User Interface" to "Enable Partial Keyboard Emulation (UI Enabled)" to make it easier to understand (MAME Settings, "Input" tab)
- Scanning games list would call "ApplyFilters()" function repeatedly on every scanned system (MAME, ZiNc, Demul, MAME software list games, etc). If status of any game changed, EL was re-applying the games filters several times over. Now, ApplyFilters() function is called only once at the end of the scanning process
- Tweaks in "Run Game Confirmation Dialog" (main menu)
  - default font size reduced to size 9
  - added support to show info on software lists and non-arcade machines
  - replaced "Consolas" font by "Lucida Console" on full command line texts and reduced font size
  - games list version info and emulator version info texts merged into one line to reduce dialog height and to avoid waste of space
  - removed some redundant text to avoid confusion
  - added "usage" text below game name text (top bar) for software list games
  - machine name is now displayed below the machine title when running multi-slot machines (neogeo, megatech, stv, playch10)
  - renamed "Run Game" button to "Execute"
- Full scan games feature always close/re-open parent .zip sets now, to avoid validating ROMs of parent sets with no relationship to the clone set being scanned... huh, what did you say ? :D
- Screen "Select System" to create games list and scan games is properly resized to fit 640x480 resolution
- Screen "View ROMs Folders" properly resized to fit 640x480 resolution (main menu, "View" sub-menu)
- Feature "Scan MAME/HBMAME Missing Audio Samples" (main menu "Games List): multiple games using the same sample file are no longer listed, only the first found game
- You can select between different favorites profiles while favorites filter is enabled (main tool bar button). :)
- All other favorites functions are disabled!
- Tweaks to game details screen (games popup menu or "Shift+I" shortcut)
- Frontend's main screen now hides itself when creating a new games list using main menu "Create Games List", and it restores itself at the end

### Removed

- A few redundant messages were removed from the splash screen (and at startup) since they appear only for a split of a second
- Setting "New Emulator Detection" removed (preferences screen); no longer needed, now always enabled
- Setting "Games List Not Found" went kaput! (preferences screen); games lists will not be auto-created anymore, except on a clean install; use "Create Games List" option in main menu to create lists manually when updating your emulators executables
- Feature "Not Used Game Files" is no more; it was never 100% accurate, it always listed files that shouldn't be removed
- Feature "Auto Rename Snaps to EL Format" is gone. Emu Loader will no longer try to rename "snap\gamename\0000.png" files to "snap\gamename.png"... if you want to take MAME snapshots in "snap\gamename.png" format just change "snapname" entry to "%g" (without quotes) in "mame.ini"
- You can find this setting in MAME Settings screen, "Video 2" tab, "Snapshots/Movies panel", "Name Format" edit box
- Replaced all texts using the odd "Segoe UI Semibold" font by more common Windows fonts
- Replaced almost all texts with "Consolas" font by "Lucida Console" and "Verdana" fonts
- Image splitters style is gone, only solid style is avaiable from now on with customizable colors (preferences screen, "Images" tag)
- Feature "Images Manager" is disabled; adding software list games support broke this feature and it needs to be completely rewritten :_((
- Image effect "Scale 2x" is no more (main menu "Images" / "Resampler")

### Added

- New MAMu_ icons setting: "Enable Device Set Custom Icon". Enable this setting to use a single "deviceset.ico" file for all device set entries... only if "deviceset_name.ico" is not found!
- I'm sure MAMu_ will appreciate this setting as device sets are non-playable sets
- New library "SynFastWideString.pas"; better handling of WideString vars; this libary is a lot faster than WideString var from Delphi 7, and use FastMM v4 improved RAM manager
- Unicode strings support in games list; game title; manufacturer; category; language; and usage tip for softlist games
- New "Scan MAME Sets (v0.162 and newer)": choose what kind of MAME sets will be validated; located in "Scan Games Mode" screen (games popup menu) and select system dialog (create games list/scan games)
  - Scan All -> will validate both arcade/machines and software list games
  - Arcade/Machines -> will validate only arcade/machines sets, excluding software list games
  - Software List Games -> will validate only software list games, excluding arcade/machines sets
- Support for MAME software list games (home consoles, computers)
  - feature enabled by default, you can disable it when creating a new MAME games list (select system dialog)
  - for UME and MAME 0.162+ builds
  - game files must be placed in sub-folders with the same names as xml filenames from 'mamdir\hash' folder
  - DO NOT set folders for software lists in 'rompath' (mame.ini); MAME and Emu Loader search in 'roms\soflistname\' sub-folders automatically
  - games files must be zipped; except CHDs
  - detection of 'softwarelist' tags in MAME -listxml output
  - new status bar info text "xml file: softlist_name" (selected game)
  - XML files in 'mamedir\hash\' folder are required and NOT auto-created by the frontend
  - XML files in 'mamedir\hash\' folder not used by MAME's -listxml are not used by the frontend
  - basic games loading support only (no multi-floppy disk drives or multi-slot cartridges)
  - category column is used to display software list descriptions
  - new 'frontend_dir\softwarelist\' folder with all supported lists; for faster games list loading and auditing (direct XML parsing is too darn slow)
  - full scan games support (audit system)
  - preview snapshots and video previews use the softwarelist filename as a sub-folder (zipped images are supported); eg.: "mamedir\snap\msx1_cart\"
  - you can disable software lists you don't want when creating MAME games lists by using "Customize Software List" (main menu) or clicking the "custom" text in "Scan Games Mode" (games popup menu) or select system dialog
  - ...or manually delete the desired files in 'frontend_dir\softwarelist\' folder
  - internet game info support with new MESS pages from Progetto-SNAPS
- New "Machines" filter in main tool bar button
  - Filter games in the list the way you want; MAME arcade + machines + softlist games
  - Use the new "Machines List Side Panel" to filter games by a specific machine (all other machines filters are ignored)
    - (extra options can be found in the machines list popup menu)
- NOTE: To properly filter arcade and non-arcade machines you need "category_home.ini" file from "category.ini for MESS" pack made by AntoPISA
- New "Machine to Run Game" menu item in games popup menu
  - When machines list side panel is disabled, to run softlist games you can select what machine to use
- The latest selected machine for each softlist will be used if you hit ENTER or double click a softlist game... quick launch mode! :D
- New icons for software list games; so you know if a MAME game is arcade/machine or from software lists
  - MAMESoftwarelistParent.ico; MAMESoftwarelistClone.ico; UnMAMESoftwarelistParent.ico; UnMAMESoftwarelistClone.ico
- New column "Usage" for software list games; details/grouped view modes
- Support AntoPISA "catver_full.ini"; category and version added for arcade and non-arcade machines
- WARNING: this file will tag all non-arcade machines as arcade machines and the "MAME Machines Without Software Lists" filter will not work! ('Machines' filter)
- Support AntoPISA "category.ini for MESS" and "version.ini for MESS" so Emu Loader can separate MAME arcade from non-arcade (MESS) machines Put both files "category_home.ini" and "version.ini" in "frontend_dir\ini_files\" folder
  - for MAME 0.162 and newer / UME builds only; these files have no use on older MAME builds or MAME arcade builds
  - file 'version.ini' is optional and if using 'catver_full.ini' there's no need for this file
  - file 'catver.ini' or 'catver_full.ini" is still required for MAME arcade games
  - games from software lists are not supported since category is used to show softlist titles
- Get files in Progetto-SNAPS website (renameSet page): <http://www.progettosnaps.net/renameset/>
- WARNING: do not use "category_full.ini" file or the frontend will show incorrect categories for MAME arcade games and the frontend will not work properly!
- Support "History.dat" 0.162 to show info for software list games ($softlistname=rom1,rom2); sadly, Unicode texts are not displayed in the RichEdit control
- Support "messinfo.dat" created by AntoPISA; for non-arcade machines (MAME v0.162 and newer); put "messinfo.dat" in MAME's main folder (same as mameinfo.dat)
- favorites and playtime .ini files expanded to support software list games (MESS)... no updates required from your part
  - arcade: 'gamename=systemname'
  - softlist: 'gamename_softwarelist=systemname'
- Support new .ini files for MAME v0.162 and newer: arcade.ini; console.ini; computer.ini; othersys.ini (games popup menu, "Custom Settings" / "Extra")
- New setting: "Use Custom "snapname" To Take Snapshots" (main menu "Images")
- Disabled by default, it adds an extra "-snapname softlistname/gamename" parameter into MAME's command line so your snapshots for software list games can be correctly created in MAME: "snap\softlistname\gamename.png"
- Without this, you'll need to manually rename files and move them to proper folders
- eg.: "goonies" game for MSX 1 cartridge ("msx1_cart" softlist name) will have a "-snapname msx1_cart/goonies" parameter; the created screenshot filename will be "snap\msx1_cart\goonies.png" no matter what MSX machine you're using to play the game
- It makes taking snapshots a lot easier, using the actual software list name "msx1_cart" as a sub-folder instead of the machine name
- New games popup option "Main Menu" to access the main menu when tool bar filters is not visible
- New feature: "Multiline Captions"; Enable it to show "two line" captions in details/grouped view modes; 32x32 and 48x48 icons only (preferences screen, "Games List" tag)
- Support for zipped images in thumbnails view mode (finally!)
- New MISC filter: "Show Merged Sets Only"; what does it do ? make you a cup of coffee... :)
- New MISC filter: "Light Gun"; show/hide all games that use a light gun control; file "catver.ini" or "catver_full.ini" is required to detect "gun", "gallery" categories
- Preview images / game docs panel can be enabled while in thumbnails view mode, using the new "Show Images/Game Docs Panel" setting ("Thumbnails" sub-menu in view mode tool bar / games popup menu)
- Changes and updates to the video preview feature
  - new "experimental" setting: "Play Dummy Video to Stop Current Playback" in preferences screen; play a short video to stop current video playing if you select a new game that have no video to play
    - (also executed before starting a game and exiting the frontend)
  - new file "resources\images\no_image\novideo.avi"
  - minor optimizations to the CallPlayVideoPreview() function
- New favorites setting: "Show Favorite Icon In Games" (favorites tool bar button); show a fav icon in details view and add a fav image on top of thumb images (thumbnail view)
- New game status filter: "Missing + Missing ROMs/CHDs" ("available/missing" tool bar button)
  - this filter will show games with all files missing and found games with missing ROMs/CHDs
  - filter "Missing" changed to only show games with all files missing (games you don't have)

## [7.8.3] - 2015-06-04 U

### Fixed

- Create MAME games list was bugged, making tons of games not appear in final games list and generating errors in arcade\mame.el file; you must re-create MAME and HBMAME games lists to fix this

### Changed

- MD5 checksum detection for emulators executable files replaced by file modified date (Windows file properties); much faster specially on large files (50 MB+)
- Source code cleanup; some unused variable declarations and a couple deprecated functions

### Added

- Several unicode functions ported from Tnt Unicode Library to EL's uCommon.pas file; to handle non ANSI files and string/integer operations

## [7.8.2] - 2015-06-01 U

### Fixed

- Bios CHDs not searched if CHD file is in a 'biosname' sub-folder, tagging a few games as missing CHD files (Sega Lindbergh)
- Game details fixes:
  - bios name info listed when viewing a bios set... WHY?!
  - bios filename not listed when viewing a game with a bios set
  - parent filename listed when viewing a clone game with no ROMs

### Removed

- No more softwarelist tag detection in -listxml output. All MESS machines are added to the games list, even though you can't play them

## [7.8.1] - 2015-05-28 U

### Fixed

- Frontend crash when changing between image layouts too fast if "Load Image With Threads" button is enabled (images tool bar buttons)
- Component 'Graphics32' was missing 'fmShareDenyNone' parameter in TCustomBitmap32.LoadFromFile() function
- Number of players info overwritten in 'mame.el' and 'hbmame.el' files by the info from 'nplayers.ini' when games are validated
- Device ROM file sizes were not added to the total game size on games that use device ROMs (create MAME/HBMAME games list)
- MAME build number was not updated in '\ini_files\folders_emulators.ini' file, causing a MAME version detection error (create MAME games list, select MAME executable in Emulators Setup screen)

### Changed

- Optimized 'nplayers.ini' loading; no need to reload the file when toggle 'Show Players Info From nplayers.ini Only' on/off (main menu 'Games List')
- Updates and fixes for MAME v0.162 (creating MAME/HBMAME games list)
  - games were not being added to the main list; game tag changed from "game" to "machine" in -listxml
  - dirty-hack-mode ON: all machines with "softwarelist" tags in -listxml are no longer added to main list (mostly console/computer machines)
  - the following sets using software lists are still required: Neo-Geo; Sega Mega-Play; ST-V; Vectrex, Neo-Geo CD
  - new file "arcade\mame_softwarelist.txt" listing all game names excluded from the main list (documentation only)

### Removed

- Device sets with no ROMs are no longer added to the games list (Create MAME/HBMAME games list)
- Filter "Hide Device Sets With No ROMs" no longer needed ('Misc' filter in tool bar buttons)
- Options 'Debugger Font Name' and 'Debugger Font Size' are no more (MAME/HBMAME settings screen)

### Added

- New 'System Type' tag for games: 0 -> arcade; 1 -> console; 2 -> handheld; 3 -> computer
- for future expansion ?... only time will tell (feature disabled for now)

## [7.8] - 2015-04-14 U

### Fixed

- Search game function was not looking for HBMAME game names, only MAME (main menu "Games List" / "Scan Missing MAME/HBMAME Audio Samples")
- Frontend crash when loading a games list with no device sets (MAME/HBMAME)
- EL was not detecting game driver .ini in '\ini\' folder when calling games popup menu, only in '\ini\source\' folder

### Changed

- Updates to MAME/HBMAME Settings screen
  - minimum MAME version supported is v0.125; still, one or more settings might not be 100% compatible
  - corrected 'Prescale' limits to 1..3; values 4 to 8 are invalid ('Video and Audio' tab, 'Game Screen' box)
  - updated 'Use Bilinear Filter' hint text to include 'D3D / OpenGL / SDL2 Accel' for easier usage ('Video and Audio' tab, 'Output Mode' box)
  - added 'Dummy Write Snapshot' setting for MAME v0.160 ('Video 2' tab, 'Snapshots' panel)
  - adjusted the height of a few TEdit, TBitBtn, TComboBox controls; for consistency
  - added more HLSL settings: 'HLSL Prescale Override Factor'; 'HLSL Preset to Use'; 'Upscaled Snapshot Resolution'
  - 'resolution@refresh_rate' value would not be correctly saved in 'mame.ini' if screen resolution is 'auto' with a custom refresh rate
- Image category icons replaced by new and improved ones
- Image Category/Layout Settings screen interface update with new category icons and some layout changes
- Select image category dialog updated with new icons
- Interface minor tweaks
- Implemented "HideCaption" property on Tiles view and fixed a couple drawing bugs in TEasyListView component; required to use the new category icons without items captions showing up
- That's the third change/fix I've made in the now 'abandoned/discontinued' TEasyListView component... sorry Jim!
- 'View Missing ROMs/CHDs' now self-adapts to fit 640x480 resolution; and some layout changes to reduce visual pollution (games popup menu)
- Device sets .ini file ('mame_devicesets.ini'; 'hbmame_devicesets.ini') is now deleted after creating games list, if empty (MAME/HBMAME)
- Reduced main tool bar height by 1 pixel

### Added

- Support for old MAME builds; DOS MAME is not supported!
  - MAME v0.37 beta 15 (0.51) to v0.69 (-listinfo)
  - MAME 0.70 to latest version (-listxml)
  - not all game infos are available, but most are
  - parent+clone relationship
  - bios detection
  - CHD header v1 and v2 detection with MD5 checksum validation; v3 and up use SHA-1 checksum validation
  - full ROMs validation
  - wav samples detection
  - discrete audio detection
  - main CPU detection
  - controls
  - game size
  - auto-detection of the MAME build number (this is not the version info)
  - play game and record/playback input files; MAME build detection at work... :)
  - load the proper 'inipath' for MAME versions that do not have this setting in 'mame.ini'
  - set MAME default settings / game custom settings is extremely limited
    - full MAME settings is for MAME v0.125 and up; older MAME builds use the new 'basic mode'
    - custom game .ini files (game and driver) must be in MAME's root folder for MAME v0.37 to v0.60
    - driver .ini files in "\ini\source\" path is supported on v0.119 and up; v0.61 to v0.118 use '\ini\' path only
  - screen is built to fit 640x480 resolution
- The cannots for old builds:
  - record wav/video/mng
  - load save state
  - run game with effect overlay
  - I'm sure there are other stuff...

## [7.7.3] - 2015-03-16 U

### Fixed

- Tons of Neo-Geo games were left out of the 'Neo-Geo' filter for HBMAME as there are lots of different driver names for Neo-Geo hacks ('NeoGeo' device sets are not included!)
- Tons of CPS-1 games were left out of the 'CPS-1' filter for HBMAME; added support for 'cps1mis' driver name; CPS-1 hacks now appear in the list
- Some PGM 2 games were left out of the "PGM' filter; added 'pgm2.c' driver detection
- Windows themes disabled in checkboxes (SEGA Model 2 Settings screeen)
- Horizontal scroll bar visible when CHD files are shown (Game Details screen)
- Crazy flickering in TLabel controls when using with TGaugeBar controls
- If emu default settings file (mame.ini and others) for AlterMAME is not found, EL would not auto-create the file for AlterMAME, but for MAME (main menu "AlterMAME Default Settings" and games popup menu "AlterMAME Custom Settings)
- Bios entry '[Use Default]' was not sticking at the top of the list (MAME/HBMAME Settings screen, Miscellaneous tab)
- If you have multiple folders in 'inipath' entry (mame.ini), EL would force the use of 'mame_dir\ini\' no matter what. This is now fixed, but only the first folder will be used
  - eg.: inipath c:\emu\mame\mycustom_ini;.;ini
  - EL will use 'c:\emu\mame\mycustom_ini' as MAME's ini folder
  - eg.: inipath .;ini;c:\emu\mame\mycustom_ini
  - EL will fallback to 'mame_dir\ini\' as MAME's ini folder (no support for '.' folder path)
- Error 'Cannot focus an invisible window' when switching between grouped view and other view modes

### Changed

- Updates to Create MAME/HBMAME Games List:
  - detection of CHD files in bios/device sets, for MAME v0.159 and newer
  - detection of discrete audio type for bios/device sets
  - detection of samples entry for device sets
  - detection of display info for device sets
  - improved detection of discrete audio entries to maintain compatibility with older and new MAME builds
  - all games with driver name '???discrete???' will be tagged as discrete audio; for UME
  - some code optimization to remove duplicated code
- Catlist filter 'PinMAME' renamed to 'Mechanical' ('Misc' tool bar button), and catver.ini scan is now done by a 'mechanic' tag instead of 'pinmame' to maintain compatiblity with older and new Catlist files
- Catlist filter 'Fruit Machines' ('Misc' tool bar button) are now also filtered with categories that contain 'reel' tag (for Catlist v0.159 and newer); 'fruit' tag is still checked to maintain compatibility with older Catlist files
- Updates to the multi-games loading feature (select multiple games of the same system and run with MAME):
  - broken feature... now it works again
  - Neo-Geo compatible games list renamed from 'neogeo.ini' to 'multicart_neogeo.ini'
  - removed custom Neo-Geo and SEGA Mega-Tech message box icons ('resouces\main_icons\msgbox\' folder)
  - added support for ST-V system (4 games max); supported games listed in 'arcade\multicart_stv.ini'
  - new filter: 'Show Only ST-V Multi-Slot', to filter out games not compatible with multi-slot ('Misc' tool bar button)
  - added support for PlayChoice-10 system (10 games max), but MAME doesn't support multi-slot loading for this system yet
- Minor source code maintenance... for consistency

### Removed

- Create custom settings for device sets is disabled (pointless anyway). Custom settings for bios sets is still supported

### Added

- Changes to MAME/HBMAME Settings screen:
  - you can select multiple folders for .ini paths again; 'Folders' tab
  - screen layout seriously updated (... still need some work)
  - grouped the most important and most used settings in 'Video 1' tab
  - grouped HLSL and GLSL into 'Video 2' tab
  - renamed 'Video 1' tab to 'Video and Audio'
  - renamed 'Video 2 and Audio' to 'Video 2'
  - HLSL and GLSL auto-detection updated (mame.ini; ume.ini; sdlmame.ini; etc)
     -'Direct3D Post-Processing Effects' panel and its options will only be enabled if 'hlsl_enable' entry is found in the .ini file
     -'OpenGL Post-Processing Effects' panel and its options will only be enabled if 'gl_glsl' entry is found in the .ini file
  - new 'OpenGL' and 'BGFX' options in 'Video Output Mode'; MAME v0.159 minimum required
  - new 'SDL 2 Accel' and 'BGFX' options in 'Video Output Mode'; SDLMAME v0.159 minimum required
  - new setting: "Provider for UI Font" (Miscellaneous tab)
  - you can no longer customize folders for custom game settings (rom_path, ini_path, artwork_directory, etc...); only available on emulator default settings
  - when creating custom game settings, Emu Loader will read a list of config files, so settings from previous files are loaded and overwritten, just like MAME does when loading a game. From top to bottom:
    - mame.ini; ume.ini; hbmame.ini; emufilename.ini; etc...
    - debug.ini
    - vertical.ini (if game screen is vertical)
    - horizont.ini (if game screen is horizontal)
    - arcade.ini (UME only)
    - console.ini (UME only
    - computer.ini (UME only)
    - othersys.ini (UME only; this filename and its purpose is a mistery to me!)
    - vector.ini (if game is vector)
    - source\sourcefile.ini or sourcefile.ini
    - biosname.ini
    - parentgame.ini (if game is clone)
    - gamename.ini
  - Notes:
    - every time you click on "Reload Settings" button, all these files are reloaded, starting from mame.ini
    - if you create a custom settings for say... Vector games, files below vector.ini are ignored (as it should be...)
    - there's a new "Reset to Default" button, that reset settings to emulator default, ignoring all custom files
  - new feature 'Validate All Custom Files on Save': when saving custom settings back, EL will compare current settings with all previous files (if found), to make sure these settings are not duplicated and to keep custom files clean;
  - keep this setting disabled to validate settings only against emulator default settings (mame.ini; ume.ini; etc)
  - SDLMAME/SDLUME/SDLHBMAME auto-detection function updated to search for 'sdlvideofps' entry in 'sdlmame.ini'; 'sdlume.ini'; etc
  - select folder for fonts added back, multiple folders supported (Folders tab)
  - select folder for debugger comments added back (Folders tab)
  - replaced TListView by a regular TEdit control for 'Controllers Definitions' folder, 'Crosshair Files' folder, 'Sample Sets' folder; multiple folders are still supported
  - replaced TEdit control by TListView for 'Ini Files' folder; easier to move folders around...
  - removed "custom screen name" edit box as screen names in the format "\\.\DISPLAYn" are safe to use
- Driver 'timeplt' (Time Pilot), 'tp84' (Time Pilot '84), 'circusc' (Circus Charlie GX380) added to the 'Konami Old School 2 (80s)' filter
- Driver 'asterix' added to the 'Konami Old School 1 (90s)' filter

## [7.7.2] - 2014-11-27 U

### Added

- New MAME settings (MAME Settings screen):
  - Apply Bilinear Filter: create snapshot/movie with bilinear filter in "Video 1" tab / "Snapshots" panel
  - Write DRC UML Disassembly Log: "Miscellaneous" panel
  - Write DRC Native Disassembly Log: "Miscellaneous" panel

## [7.7.1] - 2014-10-17 U

### Fixed

- Proper grayscale icons on disabled menu items (experimental)

### Changed

- Tweaks in uMain.RunProcess() function reverted back to ANSI strings since all games are executed using game names... and they don't use Unicode... it was a pointless optimization anyway

### Added

- Added 'DirectSound' in Sound Method for SDLMAME / SDLUME (MAME Settings screen)

## [7.7] - 2014-08-24 U

### Fixed

- Atomiswave games not loading with Demul emulator due to wrong machine name call. It should be -run=atomiswave (with a "V")
- Daphne games was not being set as available even if gamename.zip is found. I forgot to set the game status tag. You must create Daphne games list again to fix this

### Changed

- Setting "Run Game Confirmation Dialog" enabled by default (main menu)
- Tweaks to the multi-slot screen

## [7.6.9] - 2014-08-17 U

### Fixed

- App crash if file '\arcade\neogeo.ini' is not found. Bug fixed by creating a globar var instead of a local var to handle this file (silly crash bug...)

## [7.6.8] - 2014-08-16 U

### Fixed

- Tasks executing twice when changing games view modes: reselect last selected game and reset thumbnails when switching to thumbnails view
- Status bar not updating if no games are visible/selected after filters change
- Detection of the new 'neogeo_noslot.c' driver from MAME v0.154. Neo-Geo games filter works again
- Horizontal scroll bar setting to last visible column if last games filter had no visible games
- If using '.;ini' or '.' in MAME's 'inipath' entry (mame.ini), EL will not change it to 'ini' (but only ONE ini path is supported by the frontend)

### Changed

- Major core change: function uMain.SetGameType() properly split into separate functions to prevent them executing 3 times over in the same task: change tool bar icons; auto-toggle settings ON/OFF; load games list; apply games filters; re-select last selected game; reload images / load game docs / load game video preview
- Extra optimizations/fixes:
  - several function calls are no longer necessary
  - a bunch of memory vars resetting multiple times in the same task
  - apply games filter executing multiple times when creating a new games list
  - select last game function executing multiple times when scanning/auditing multiple games at once (F5 or Shift+F5 shortcuts)
  - selecting between games too fast should not cause crashes anymore; when using tripple images layout view, load zipped images with threads enabled)
  - only the tool bar icon related to filter you change is reloaded (all icons were resetting on a single filter change...)
- Column header captions indent set to zero to align with game captions positions. Columns width can be 5 pixels smaller now, useful for driver status columns :)
- Column '# of Players' renamed to 'Players'
- Split 'MegaPlay / MegaTech' filter into two separate filters
- Replaced 'CreateProcess' WinAPI call by 'CreateProcessW' to work with Unicode and WideStrings
- More tweaks...

### Added

- Game details screen, if a game is tagged as 'Found With Missing ROMs/CHDs', all missing ROMs in the right panel will have a red text in the 'status' column for easier reading
- Support for Neo-Geo MVS multi-slot cartridge loading (MAME/UME v0.154 minimum required)
  - a list of supported games is in new '\arcade\neogeo.ini' file
  - supported games parsed from software list 'neogeo.xml' in MAME's 'hash' sub-folder (file must exist!)
    - if file neogeo.xml doesn't exist, no list is created (file is NOT created by Emu Loader!)
  - only available games are added to the list
  - you can choose what game goes in what slot before starting the emulator :)
  - not all cartridge combinations will work; this is a limitation of the arcade and/or the emulator
  - HBMAME is not yet supported (no software lists available)
- New games filter 'Show Only Neo-Geo MVS' to list only games compatible with Neo-Geo MVS multi-slot (misc filters tool bar button)
- Support for Sega Mega-Tech multi-slot cartridge loading (MAME/UME v0.154 minimum ? required)
  - no software list required as all games from MAME's Mega-Tech driver are supported
  - up to 8 cartridge slots can be used
  - only available games are added to the list
- New setting "Disable Natural Sorting (1, 2, 3, 10, 11, 20)" (preferences screen)
  - for the purists that want to enjoy the full ASCII sort glory (1, 10, 11, 2, 20, 3)!
    - also due to games with leading zero ('005') not being listed before games starting with '1' ("StrCmpLogicalW" API is to blame...)
  - all games lists are affected by this setting, not just the main games list
- Unicode baby steps #1: uMain.IsUnicodeStr() function to check for non-ASCII chars (char > 127)
  - this is necessary as Delphi 7 compiler is not Unicode friendly
  - so far, only 'f16mbeta' (from UME) have Unicode chars in game title; -listxml output
  - unicode strings must use UTf8Decode() function to show properly in games list

## [7.6.7] - 2014-07-27 U

### Fixed

- Fatality! Dirty fix mode ON. The following were executing 3 times over when creating a new games list with main menu "Create Games List"
- apply games filters; update tool bar filter icons, re-select last selected game; load selected game images; load/play selected game video preview
  - I really need to separate the single function that does all these processes into different functions for a proper fix

### Changed

- Restored 'Playtime' column title back to 'Total Playtime' and default width back to 110 pixels
- Minor optimization in the new sorting routine. Sort time is 100ms faster than is was before
- Improved startup process even further. Loading zipped images list to RAM was executing twice...

## [7.6.6] - 2014-07-24 U

### Fixed

- App crash when loading games list at startup or after creating a new list; related to MAME/HBMAME device sets
- Gold fix: games sorting was incorrect since... ever. Windows API "StrCmpLogicalW" is now used for sorting, applied to:
  - main game list columns: game "The King of Fighters '99" is now correctly listed BEFORE "The King of Fighters 2000"
  - Bios sets list in MAME/HBMAME Settings screen
  - Screen resolution list in SEGA Model 2 Settings screen
  - MAMu_ Icons Manager screen
  - Scan results screen
  - Custom frontend select file dialog
  - Zip Files Not Used screen
- NOTE: the new sorting routine is a little bit slower (300 milliseconds slower on my Core I7 3.4GHz)
- Select Scan Mode dialog was showing up more than once on a fresh install and/or at startup

### Changed

- Screen resolutions drop-down boxes are populated dynamically and properly sorted with the new "StrCmpLogicalW" API. EL will try to read all valid resolutions of your video card

### Added

- New sort options for not used icons in MAMu_ Icons Manager; popup menu, mouse right-click:
  - Sort List by Filename: regular filename sorting (ascending)
  - Sort List by Newest Date/Time: sort by date/time info (descending; newest to oldest)

## [7.6.5] - 2014-07-22 U

### Fixed

- Search bar function was executing even if edit box is empty
- Minor UI fixes:
  - Edit boxes/buttons in Emulators Setup screen were not aligned correctly
  - More tweaks for 640x480 resolution
  - Message box was not increasing its height with extremely long texts, showing the vertical scrollbar
- Crash when using "Clear History" button/menu item in MAMu_ Icons Manager

### Changed

- Game ROMs info improvement: internal TStringLists assinged to ROMs/CHDs are no longer initialized for games that do not have ROMs/CHDs *DUH!* This saves around 2MB of RAM (35000 games)... it's not much but it prevents EL from creating/initializing 2300++ TStringList vars in RAM!!!
- Moved menu items 'Customize Columns' and 'Customize Columns Header Font' from games popup menu / view mode menu to the new columns popup menu (mouse right-click in any column header). Much easier to rememeber...
- Custom title in font selection dialog (experimental)
- Column 'Total Playtime' renamed to 'Playtime'
- All date/time strings are now in 24 hours format (no more AM/PM). Removed 70 pixels from 'Playtime' column
- Message box icon size changed to 32x32. Icon size 48x48 is only used to display game icons and when gamename info label is visible
- Source code tweaks and cleanups... yet again

### Added

- New 'devices list' property for each game info, loaded in RAM. Usage around 2MB of RAM for 35000 MAME games (TStringList var). It makes some features much easier to work with and it prevents from loading 'arcade\mame_deviceset.ini' contents to RAM every time devices list is needed
- Game info property 'eUseDeviceROMs' removed as it's no longer needed
- New quick jump menu "Select Set" (mouse right-click in games popup menu)
  - 'Select Bios [bios name]': click on it to go directly to the bios set
  - 'Select Device [device name]': click on it to go directly to the device set(s)
  - Contents of this sub-menu change based on clone of, bios and device sets info; only when calling the popup menu
  - Similar to 'Select Parent Game' option... which is moved to the new 'Select Set' menu
  - Merged all related functions and simplified the code
  - All systems are supported, not just MAME/HBMAME
- Assigned a "Go To Parent Set" button to all arcade controllers; only X-Arcade was supporting this
- New settings: 'Hide Seconds in Last Played' / 'Hide Seconds in Playtime' columns. Check to show only hours/minutes (preferences screen)
- New games filter: "Global VR" (PC based hardware)... from 'globalvr.c' driver

## [7.6.4] - 2014-06-25 U

### Fixed

- Function to auto-create MAME/HBMAME default .ini file was not being called when using main menu 'Default Emulator Settings', 'AlterMAME Default Settings', 'Set Custom Game/Driver/Misc Settings' in games popup menu

### Added

- Support for MAME/UME/SDLMAME 0.153ex4 / ex5 settings changes (including a new HBMAME when released). Older MAME/UME/HBMAME builds are still supported
  - new setting 'Enable Emulator LUA Console'
  - added 'auto' to the video output dropdown list; populated dynamically based on MAME/UME/HBMAME or SDLMAME/SDLUME
  - replaced boolean 'Sound' setting by a dropdown list with string values; populated dynamically based on MAME/UME or SDLMAME/SDLUME
  - replaced boolean 'Internal Debugger' by 'Debugger To Use' dropdown list with string values; values dynamically adapt based on on MAME/UME or SDLMAME/SDLUME
- You can change MAME/UME/SDLMAME/SDLUME settings in Emu Loader again without app crashes :)
- Thanks to Haze for the updated builds...
- Detection of *sdlume* filenames for proper SDL U.M.E. emulator title
- Detection of *sdl* filenames for SDL HBMAME emulator title... if someday someone decides to create a SDL version for HBMAME :)

## [7.6.3] - 2014-06-24 U

### Fixed

- Yet another favorites fix. Game.eIsFavorite var was not updated in the selected games after exiting favorites profile manager
- Fatality! The last selected game along with game images and game docs were being loaded several times at startup. With video preview enabled, the same video was loading over and over... EmuCon have the same problem. Bad bug, B.A.D. B.U.G.!!!
- Finish Him! ROMs folders for ZiNc and Supermodel 3 were not being saved in "ini_files\folders_emulators.ini", making them reset on every frontend restart
- You Lose! Games sizes were doubled with game size + MAME game size; all systems except MAME and HBMAME. You must create games list to fix this (optional); all systems except MAME/HBMAME
- Watchdog setting on MAME debugger changed to a edit box so you can enter seconds; it's not a on/off setting...
- Backspace not working when typing in TEdit controls that only accept numbers

### Changed

- Splash screen is resized when using 720x480 / 640x480 resolutions; controls are resized to fix texts; even the image shrinks now and nothing is lost :)
- I can't test those resolutions, please let me know if texts are not readable
- Minor tweaks to the games popup menu
- Minor tweaks in MAME settings screen
- Delete game files (single game); dialog width is now fixed to 630 pixels. Removed waste of space and easier to maintain. Dialog height still adjusts according to screen resolution
- Main games filters updated with smaller texts and selection bar
- Game details form update
  - minimum resolution recommended for this feature is 1024x768
  - smaller text font (left panel) - dynamic form width and height according to text length and lines count (left panel)
  - if a game have up to 25 ROMs, form height changes based on ROMs count, if higher than left panel's text count
  - dynamic checksum column size; shorter for CRC32 and larger for MD5 checksum (CHD files, if not tagged as 'nodump')
  - if text in left panel is too big (more than 179 pixels), it breaks into two lines (word wrap)
  - form minimum width is 631 pixels

### Added

- SDLMAME for Windows support!
  - <http://forums.bannister.org/ubbthreads.php?ubb=postlist&Board;=8&page;=1>
  - detection of SDLMAME file (*sdl*.*) for proper emulator title
  - set default SDLMAME settings and game/bios/device settings; MAME settings screen
  - all unique mame.ini settings are in a new SDLMAME pages; MAME settings screen
  - in "Output Mode" setting, "Video 1" page, the valid options are dynamically added based on mame.ini ("gl_glsl" entry) or emulator filename (*sdl*.*)
  - OpenGL shaders support, SDLMAME page; MAME settings screen
  - Common MAME settings are blended in other pages: video, audio, input; MAME settings screen
  - HLSL settings are not supported by SDLMAME, they appear disabled if using an SDLMAME executable; MAME settings screen
  - SDL lightgun mapping (Xinput); SDL2 mouse mapping; SDL2 keyboard mapping settings are supported, but SDLMAME doesn't officially support them yet
- WARNING: SDLMAME will freeze on exit if you're using OpenGL video output and have either 'eVGA Precision X' or 'MSI Afterburner' running
- Set default emulator settings and game custom settings for AlterMAME (I hope I didn't miss anything) :)
  - default settings can be accessed in emulators setup screen or main menu "AlterMAME Default Settings"
  - custom game/driver/extra settings can be created/deleted in the new games popup menu item "AlterMAME Custom Settings"
  - only the 'inipath' entry is read from mame.ini and used to create emulator/game settings

## [7.6.2] - 2014-06-06 U

### Fixed

- Deleting a favorite profile not currently active would set the new selected profile active (favorites profile editor)
- Renaming the active favorites profile title was not updating the favorites menu item hint in main screen

## [7.6.1] - 2014-05-27 U

### Changed

- Changes to the thumbnails view mode; thanks to Fabian for reporting bugs on this feature and helping with beta testing
  - thumbnail cell resize when hiding game titles
  - if using game fonts of different sizes (parent font, clones font, preliminary font, etc) the thumbnail cell will update based to the biggest font, to fix screen garbage
  - thumbnail cell resize when editing game fonts (parent, clones, preliminary, etc)... no need to be in thumbnails view mode
  - thumbnails settings screen updated to include a "Confirm" button (apply settings and close dialog)
  - new setting "Keep Aspect Ratio", enabled by default. If you want the image to fill the entire thumbnail cell, uncheck this option
  - new generate thumbnail function to work with aspect ratio disabled; this one also does anti-aliasing... sharpening code from previous function actually made thumb images worse!!
  - fixed huge ammounts of memory leaks by placing GlobalThreadManager.FlushMessageCache() calls BEFORE reinitializing thumbnails... same fix for MAMu_ icons
- Search bar changes
  - removed fiter title bar; edit box hint now show the current filter title
  - a grayed out "Search games..." text is displayed if edit box is empty
  - buttons/icons size changed to match the edit box
  - removed filter search pattern button and replaced it by a small down arrow button inside the edit box (preliminary)
  - edit box width increased by 20 pixels

### Added

- New setting "Show Games Status Bar", enabled by default. Unckeck it to hide the status bar below the games list (main menu "View")

## [7.6] - 2014-05-21 U

### Fixed

- Game info and game icon displayed when editing MAME/HBMAME custom settings: horizont.ini; vertical.ini; debug.ini; vector.ini
- Hint texts not showing on some menu items
- Splash screen resize function for 740x480 / 640x480 resolutions was being executed on every FormShow() call. It should be executed only once
- Messages dialog height is bigger than Windows resolution if the text is too long. Fix for all resolutions, not just low res
- Minor interface tweaks

### Changed

- Moved driver status settings from customize columns dialog / View Mode tool bar button to preference screen, "Games List" page. It makes more sense. The customize columns dialog exists purely to change columns positions, visibility and their sizes (details/grouped view modes)
- Read/write settings also moved from [Configuration] to [Preferences] section (EmuLoader.ini)
- The following screens/dialogs automatically adapt their layouts to fit 640x480 / 720x480 resolutions (only when needed)
  - messages dialog
  - emulators setup screen
  - customize columns screen
  - select system dialog
  - delete/copy/move single game dialog
  - view file versions (redesigned, main menu "View")
- Preferences screen redesigned to fit 640x480 resolution... and to avoid waste of space
- The following screens/dialogs were resized to fit 640x480 /720x480 resolutions
  - frontend's select file custom dialog
  - frontend's select folder custom dialog
  - favorites manager dialog
- Images manager update (main menu "Images")
  - layout updated to maximize workspace and to fit 1024x768 resolution (minimum res required!)
  - proper image folder detection, in case the folder is defined but doesn't actually exist
  - removed the image category column as you can only scan one category at a time; category now shown at the top (missing icons list)
  - added all driver status fields; icons only, no texts (columns cannot be resized)
  - added driver name column
  - new scan option: "Scan Devices With No ROMs", disabled by default so you can eliminate device sets like "sound", "screen", "spc700", "5380 SCSI"
  - fixed a few bugs, internal and visual
- MAMu_ icons manager update (you should reset columns sizes in "Options" button, status bar)
  - layout updated to maximize workspace and to fit 800x600 resolution (minimum res required!)
  - proper folder detection, in case the folder is selected but doesn't actually exist
  - added all driver status fields; icons only, no texts (columns cannot be resized)
  - columns order changed for better viewing: game title; game name; clone of; bios name; driver name; driver status; emulation status; color status; sound status; graphic status; manufacturer; version added
  - new scan option: "Search Icons for Devices With No ROMs", disabled by default so you can eliminate device sets like "sound", "screen", "spc700", "5380 SCSI"
  - fixed a few bugs, internal and visual

### Added

- Support to read/write mame.ini in "emu_dir\ini\" sub-folder
- Detection of "drivername.ini" files in "emu_dir\ini\" folder along with "emu_dir\ini\source\" on set/delete custom driver options (MAME/HBMAME)
- Small tool bar buttons is back! Icons size used is 28x22 pixels (main menu "View" / "Tool Bar Buttons" or customize tool bar dialog)
- The main filter button only show the "all games" icon no matter what filter is selected
- Read/write support for "arcade.ini" config file, exclusive for UME v0.153ex2 and newer (games popup menu, Custom Settings sub-menu)
- Watch game video previews using a media player of your choise. This feature was created with "Media Player Classic Home Cinema" portability in mind... <http://mpc-hc.org>
  - any video/audio format is supported as long as you have the codec installed in Windows and/or an application to play them
  - only the first file found is played if there are multiple files with same gamename but different extensions (TSearchRec search pattern: gamename.*)
  - any media player application that load video/audio from the command line can be used
  - feature settings located in "Video Preview" page, preferences screen and saved in "el_dir\ini_files\video_preview.ini" file
  - command line parameters support for more control over the media player (switches)
  - a %1 tag is required so it can be replaced by the video/audio filename (no surrounding quotes required)
  - relative paths are relative to the frontend, not emulators
  - folder recursive scan is NOT supported to avoid dog-slow file search, excessive disk reading and pointless waste of RAM/CPU resources
  - executable or batch files can be used
  - media player parameters are saved based on the app filename, you can have as many media players setup as you want. Emu Loader will remember parameters for each of them :)
  - manual playback: "Shift-V" shortcut; "Play Video Preview" in games popup menu or button in images tool bar buttons; assigned button for arcade controllers
  - setting "AutoPlay" to play videos as you select games (disabled by default for safety reasons)
  - setting "Parent Game Video" to play video of parent game, if selected game is a clone and the video is not found (disabled by default)
  - setting "Play Videos Enabled" to toggle the feature ON/OFF in case you wish to completely disable this feature (enabled by default)
- Columns header custom font. That's right, now you can customize the header font in details/grouped view mode. Found in games popup menu and preferences screen, "Games List" page

## [7.5.8] - 2014-04-24 U

### Fixed

- Daphne games with missing ROMs sets were tagged as available
- Selecting games with USB editions of X-Arcade / HotRod SE controllers was not working due to NumLock key state. EL will try to detect NumPad key presses (arrow keys). No need to change NumLock key state anymore! :)
- Devastator II / SlikStik controllers don't require this as they use regular arrow keys for player 1 stick

### Added

- Added DICE v0.9 new games (DICE_xml.dat)

## [7.5.7] - 2014-04-08 U

### Fixed

- Setting "Show Game Snap if Artwork Not Found" was not working at all (main menu Images). Remember that only unzipped images are supported

### Changed

- New splash screen image. Dozens of characters in one scene :)
  - no more multiplexed alpha-blend irregular image. It used to look cool though
  - size increased to 768x450. If you're desktop is lower than 800x600 (720x480 or 640x480), the logo will be cutoff on the right to fit those resolutions
  - messages area improved for easier text reading
  - splash screen cannot be moved around anymore
- New about screen image. No more multiplexed alpha-blend image. Size increased to 640x450
- Frontend documentation updated. There were some typos and wrong info about frontend features

### Added

- New setting to show number of players info from nplayers.ini only, ignoring the info from MAME's -listxml (main menu "Games list" / "Show Players Info From nplayers.ini Only")

## [7.5.6] - 2014-03-21 U

### Fixed

- Set default settings button was disabled for SEGA Model 2 emulator in emulators setup screen

### Changed

- File \arcade\mame_listxml.xml is always deleted after creating MAME games list. File will be generated every time you create a MAME games list. It usually takes around 20 seconds
- Get version info function updated and improved to show similar string format on all emulators. To update the version info for both emulator and games list you need to create games list for all systems again
- View missing ROMs/CHDs screen updated, removing waste of screen space and to fit on 720x480 resolution (games popup menu / Shift+F8 or Shift+A hotkeys)
- Delete selected game screen updated. Minimized icons pollution, waste of screen space and adapted to fit on 720x480 resolution
- Delete multiple games screen updated
  - replaced buttons by a popup menu (mouse right-click) to remove pollution and waste of space
  - window height is dynamic now, depending on the games list count
  - if there are no listed games with CHDs, the CHD column is hidden
  - if there are no merged sets, the Merged column is hidden
  - if there are no games with bios sets, the Bios Name column is hidden
- Delete/rename image file updated. Removed icons pollution, waste of space and adjusted image panel
- Category / layout settings screen updated to remove very large icons pollution and made image categories selection easier to work with
- Scan MAME/HBMAME missing audio samples updated to show system icon with game icon instead of a system column (main menu "Games List")
- Emulators setup screen updated. When in MAME panel, emulator file texts have clickable links so you can go directly to the emulator's official website
- Interface tweaks everywhere

### Added

- New "Game ROMs" filter option: "Games With No Main Set" (extra filters tool bar button)
- Select this filter to view games that have bios ROMs and/or device ROMs and/or CHD files, but no game ROMs (no gamename.zip set)

## [7.5.5] - 2014-03-08 U

### Fixed

- Categories from catver.ini are no longer loaded for DICE games so you can filter PinMAME without removing DICE games from the list
- Controls parsing function was confusing and inaccurate (-listxml). Parse function is now perfect!
- Number of players was set to blank if info not found in "nplayers.ini", when this file is available
- In-game snapshot folder setting was being saved in EmuLoader.ini for MAME and HBMAME. Not required as they are read directly from emulators config files

### Changed

- Main menu and view mode buttons have dynamic item height to avoid waste of space. Also, icons were removed to clear the interface a little bit
- Check menu and radio menu icons were finally moved to position 0 and 1 in ImageList components. All ImageLists updated
- Even more interface tweaks (clean sweep mode ON)
- File "leftpanel_btn_help.ico" renamed to "help.ico" (resources\main_icons\)
- Settings for images folders and emulators selections moved from EmuLoader.ini to a new "\ini_files\folders_emulators.ini" file. You can now do a clean install without the need to set up images folders or emulators executables all over again :)
- Moved and renamed file from "\ini_files\biosset.ini" to "\arcade\mame_biossets.ini" and file from "\ini_files\biosset_hbmame.ini" to "\arcade\hbmame_biossets.ini"
- Favorites profile editor updated. Removed "Active Profile" text and added an icon to the active profile in the list. Hotkeys text updated

### Removed

- The following files are no longer used: "resize_window.ico", "option_radiogroup_off.ico", "leftpanel_btn_addgame.ico", "leftpanel_btn_deletegame.ico", "leftpanel_btn_add.ico", "leftpanel_btn_delete.ico"; "scanresult_game.ico", "copy.ico" (resources\main_icons\)
- The following entries are no longer added for Daphne games since game names are completely different from MAME: controls, category, number of players

### Added

- Updated "DICE_XML.dat" file with an "Attack" alternate set, titled "Attack (set 2)" and named "attack2". I failed to see there was tho valid sets in "attack.cpp"
- Note: Emu Loader rename its gamename to "attack" before loading in DICE emulator
- New game tag: buttons count (controls info). Game details now show buttons count in controls list. You must create games list for all systems... again
- All image categories have a default folder now. Folders are relative to the emulators selected. This is useful on a clean install and for new users
- NOTE: in-game snapshots for MAME/HBMAME/UME are already set in mame.ini; hbmame.ini; ume.ini!
  - Title snapshot: titles
  - In-game snapshot: snap
  - Marquee: marquees
  - Flyer: flyers
  - Cabinet: cabinets
  - Control Panel: cpanel
  - Control Panel Layout: cplayout
  - PCB: pcb
  - In-game Artwork: snapartwork
- Added new options for "File" / "Export Games List" compatible with "MAME Content Manager Plus" util (game name only). Only MAME and HBMAME are supported
  - <http://mcm.mameworld.info>

## [7.5.4] - 2014-02-18 U

### Fixed

- History quick access menu was not showing up (game docs popup menu)... weird, don't know why
- URL in HTML format detection is fixed for history.dat (might not work 100% though)
- Game details screen was cutting files info due to new driver status info (left panel)
- ROMs and CHDs files tagged "no dump" (empty CRC32) were being wrongly set as missing and using wrong status icon
- These files should be shown as found and Ok (green) if game is available or found with missing ROMs/CHDS and gray if game is missing (game details screen)
- The following filters were not working (MAME / Demul): Naomi, Naomi GD, Naomi 2, Naomi 2 GD
- Function uMain.GetSizeType() was returning an empty string if file size equal zero

### Changed

- Some more interface tweaks
- Updated DICE_xml.dat file to support DICE v0.8
- Updated the scan results screen for easier reading

### Added

- Customize columns shortcut in view mode tool bar button for easier access... and unaware users (for details/grouped view modes)
- Remember that you can access the customize screen by mouse right-click directly in columns header...

## [7.5.3] - 2014-02-14 U

### Fixed

- Changing emulator version manually was not updating the memory var, info was never updated after closing emulator setup screen
- Played and total playtime info texts were not updated in games list after quitting game (just an item repaint issue, info was updated in files)
- Fixed double text "Astron Belt" in game titles (Daphne emulator)
- Sets sorting in scan results feature is fixed. Device sets are shown first, then bios sets and finally game sets
- Scan for HBMAME device sets was wrongly searching in MAME's ROMs folder instead of HBMAME (scan games feature)
- Added the ENM_LINK message directly in Delphi's TCustomRichEdit component (ComCtrls.pas) to fix the "OnResizeRequest" event trigger in RichEditURL component
- ZiNc bios sets had the game index set to zero. ZiNc cannot run bios sets. Value is now set to -1 as it should have been

### Changed

- Added a AlterMAME version edit box for manual editing (emulator setup screen)
- MAME/HBMAME game titles with "game desc, the" will no longer be fixed to "the game desc" when creating games lists, except for games tagged "IsMechanic"
- View game docs feature (games popup menu) is limited to MAME and HBMAME now. No point in supporting other systems
- Update "ini_files\control_type.ini" to include "joy1way", fixing control filters and missing controls list info in game details screen
- Clones indentation width increased for better viewing (grouped view mode)
- Code optimization: many variables were defined with Integer type when they could be Byte or ShortInt type (I hope I didn't break anything...)
- Moved setting "Disable Clone Indent" to a new "Details/Grouped" sub-menu (view mode tool bar button)
- Moved several entries from el-todo.txt to a new el-project.txt file
- Some messages (error, info, warning) were updated with simplified texts
- Message boxes (error, info, warning, etc) can have formatted fonts now
- Several interface tweaks

### Removed

- Hidden feature to run custom batch files is no more ("el_dir\ini_files\cmdline\")... gone, finito, no mas, kaput, removed from source code
- entry "isdevice" removed from mame/hbmame .miss file (no longer needed)
- More source code cleanup
- A few icons are no longer used (resources\main_icons\ folder): disable_clone_indent.ico; display.ico; input.ico; multimedia.ico; sound.ico; video.ico; font_parent.ico; font_clone.ico; font_imperfect.ico; font_preliminary.ico; font_missroms.ico
- The reminder button in game docs panel is gone... redundant since you can access the popup menu by mouse right-click in the docs panel

### Added

- Support to use batch files as emulator executables in emulator setup screen, like in EmuCon
- If you want to run games thru batch files (.bat; .cmd), now you can. And there's a bonus... due to the way I implemented the CreateProcess API call, EL is capable of returning execution exit codes even from batch files! :)
- Note: emulator version detection will fail and you must enter the info manually
- New misc filter (requested): "Hide Games With CHD Files", so you can hide all games that use CHDs. It's an inverted filter from the main filter "CHD", where only games with CHDs are visible
- Extended driver status with new info and new columns: emulation status, color status, sound status, graphic status
  - only MAME and HBMAME are supported, all other systems show blank, nada, emptiness
  - must re-create games list for MAME and HBMAME, if you want to see the new info
  - info also shown in game details screen
  - you'll have to reset and customize columns settings again... sorry
  - status icons directly in the games list, enabled by default (details/grouped view modes only)
    - green icon for "good"; yellow icon for "imperfect"; red icon for "preliminary"
  - four new settings for this feature (view mode tool bar button, "Extra Settings" sub-menu)
    - Disable Status Icons: Bothered by the colored icons in the list ? Use this option to hide them
    - Status First Letter Only: Want to lower the width of all driver status columns but still have a readable status text ?
    - Hide Status Texts: Wanna view status icons only ? No problem...
    - Short Driver Column Titles: Use it with "hide status texts". Titles are reduced to 3 letter texts so you can lower the column width to its minimum
- Added the four new "driver status" settings above in the customize columns screen, so they can be found by unaware users :)
- Modified and extended "Working/Non-Working" filter (main tool bar button):
  - filter renamed to "Driver Status Filter"
  - you can select the status category to filter: "Driver", "Emulation", "Color", "Sound", "Graphic" (for MAME/HBMAME only)
  - filter options expanded to "Working (Good + Imperfect)", "Working (Good)", "Working (Imperfect"), "Non-Working (Preliminary)"
- Game docs popup menu (mouse right-click) have new options to quickly view a info category: "Go To Game Info", "Go To History", "Go To Driver Info", "Go To Story", "Go To Marp"

## [7.5.2] - 2014-01-28 U

### Fixed

- Some buttons hints were disabled and/or with inaccurate text
- Forgot to update the scan results feature
  - ROM tag was not being handled and ROM status text was incomplete
  - games with no game set (Taito GNET and others) and games with all ROMs tagged "nodump" were still showing "game set missing", which is wrong
  - minor tweaks

### Changed

- Some source code cleanup

### Added

- New stuff: "Last Played (date/time)" and "Total Playtime"
  - every time you play a game both fields are updated
  - new columns for details/grouped view modes
  - info stored in \ini_files\times_played.ini file (both in milliseconds)
  - info is not updated if aborting run confirmation dialog

## [7.5.1] - 2014-01-24 U

### Fixed

- Scan games fixes. I missed three other cases. With these fixes I hope the scan system validate MAME games with 100% accuracy... and it seems to be :)
  - if all ROMs are tagged "nodump", game is now set available (no validation required). MAME still run the game even if the gamename.zip set is not found (some bios sets and device sets)
  - if all ROMs are tagged "nodump" and all CHD files are found and OK, game is now set available. MAME still run the game even if the gamename.zip set is not found (Taito Type X and others)
  - if a game has only CHD files, like Global VR games (Need For Speed Underground), game is now validated

### Changed

- Select scan mode dialog pops up at startup, if "Games List Not Found" or "New Emulator Detection" is set to ask or auto-create, or if EmuLoader.ini file is missing (fresh install), so you can select how your games ROMs will be handled
- ... useful for those who have a complete MAME collection and need/want to force all games available right from the start
- Reduced games list loading time by around 500 milliseconds. No way to optimize it further as the EasyListView component takes its time to load 30000 items

### Added

- Added support to delete game input files for SEGA Model 2 emulator (\cfg\gamename.input)
- SEGA Model 2 emulator settings is back. I didn't realized you couldn't set folders within the emulator
  - Gamma correction and Force feedback settings are NOT included
  - Per game settings is also not supported
  - File emulator.ini comments and format are kept intact :)

## [7.5] - 2014-01-22 U

### Fixed

- Games list was still scrolling back to the title column if sorting games by a column (details view)
- No more scrolling back to the title column when changing games filters (details/grouped view modes)
- Create games list fixes:
  - create list for multiple systems was NOT working (main menu "Create Games List")... and no bug reports ?
  - it was parsing wrong info from MAME database, also messing up with ZiNc driver names
  - small speed increase
- I had to adjust my CheckBox and RadioGroup custom components once more. Radio/check and texts were not aligned correctly, clearly noticeable if you place both components side by side
- When in grouped view mode, if a parent game is hidden and the clone is visible, the clone game would mix with an unrelated group. To fix this the hidden parent is forced to visible no matter the games filters being used
- eg.1: "Megaman 1" clone set (cps1) seen as clone of parent set "Megaman 2" (cps2)
- eg.2: "Missile Command" clone set seen as clone of parent set "Millipede"
- Application freeze and crash if button "Enable Threads" is enabled, after switching favorites on/off
- Feature "Delete/Copy/Move Selected Games" was NOT working at all if "Auto-Check" options were unchecked even if you select files in the list, they were NOT deleted/copied/moved... again, no bug reports :(
- The dialog will not automatically close anymore if you answer NO to the confirmation dialog
- Fixing game titles from "King of Fighters, The" back to "The King of Fighters" was adding a letter "e" at the end, making it read "The King of Fitherse"
- Exit code for both MAME and AlterMAME emulators, are displayed in the error message box... after trying to run a game (when "Autorun Game With AlterMAME" is enabled)

### Changed

- Each game ROM has received a tag to facilitate ROMs validation, and to display "Bios ROM" in game details screen along with the "Device ROM" text. It's easy to know what ROMs are from the game and what ROMs are from device sets and/or bios sets
  - for all systems except Daphne (no ROMs database)
  - Demul doesn't have CHD files as they are in .bin format and need to be in the game set as regular ROMs
  - Demul bios sets are required to be present even if they are not used by any game. Without bios sets, Demul doesn't run games!
  - 0 -> game ROM
  - 1 -> device ROM
  - 2 -> bios ROM
  - 3 -> chd file
- Scan games feature (audit ROMs) is finally fixed and updated more options
  - fix: all games are recognized correctly no matter the order they appear in the main games list, specially clones and CHD files
  - new feature: "Scan Games Mode". Supported (and selectable) in by scan games and create games list features You have three options (games popup or system selection dilaog):
    - Full Scan: ROMs and CHDs are fully validated by CRC32 / SHA-1 checksum
    - Quick Scan: No ROMs validation. EL only search for the gamename (.zip; .7z) and CHD files, but CHDs are validated (SHA-1 info text from header)
    - Force Games Available: This mode sets games to available even if game files are nowhere to be found (it replaces the "Set All Games Available" from preferences screen)
  - new scan option in games popup menu: "Force Selected Games Available" (Shift+F6 hot key). Use this to force the available status in games (single or multi selections)
  - fix: many clones were set as merged or as missing ROMs/CHDs even if set is ok
  - fix: CHDs were set as found and OK when the file was actually missing
  - fix: games with no game set (gamename.zip) similar to Taito GNET (only bios set + chd) were not recognized at all or sometimes, incorrectly
  - improved: "Scan Selected Game" (Shift+F5) and "Scan Multiple Selected Games" (Shift+F6) merged into one option: "Scan Selected Games" (Shift+F5)
    - ... NOTE: Shift+F6 hot key is now used in another option!
  - new "scan mode" tag for each game, so you know what mode was used to validated a game, visible only in game details screen (games popup menu or Shift+I hot key)
    - this tag is saved in games list files "\arcade\sysname.el" (see "docs\el-listformat.txt" file for the "Scan Mode" notes)
- Important notes:
  - to work properly, the game set (gamename.zip) or the bios set is required. If neither is found, game will be set as missing, even if CHD files exist!
  - for systems like Taito GNET (only bios + chd), having the CHD file but not the bios set, game will be set as "missing"!
  - games from the "globalvr.c" driver are not validated as they only have CHD files and nothing else (this is the only limitation in EL's scan feature now)
    - just select those games and force them available using Shift+F6 hot key or use the option in games popup menu
- More tweaks, both visual and internal
- Text Filter Bar renamed to Search Bar
- Improvements when creating games lists for multiple systems (manually or at startup). All lists are created first, then loaded back all at once instead of system by system. No speed improvement but it feels better this way
- Settings in search bar are now saved/restored at startup (tool bar filters)
- Updated FastMM library to latest v4.991 (3 September 2012)
- Messages dialog box now accept clickable URL links
- Long overdue updates for Demul... and full support for v0.5.8.2 (Oct 23 2013):
  - games and bios titles were not handled correctly
  - machine names are extracted from the romof="" entry and are now used to generate the run parameter ("-run=machine gamename")
  - driver names info is used as machine names so games can be loaded correctly
    - this removes the limited machine detection function in EL's source code, and it makes possible to run the "gaelco" games ^-^
    - ...except modelgd, model2, model2gd, atomiswave games which still need to be handled internally by the frontend (hard-coded)
  - still no support to use MAME .chd files... this needs an external database, which Demul doesn't have, or have CHDs listed in its internal XML generator
- ZiNc database file "ZiNc_xml.dat" updated:
  - Game descriptions and manufacturers changed to match MAME 0.152
  - Source driver and game index added (sourcefile="" gameindex="" tags). File "\ini_files\zinc.ini" no longer needed
  - Tags moved around to make file format consistent with MAME -listxml output
  - made "Beastorizer (USA bootleg)" a clone of "Beastorizser (USA)" to match MAME 0.152. It makes no difference to the emulator
- Delete multiple games finally updated to use ROMs list from the games list instead of external files
- Improved the accuracy of the file size string generator. File size info in games list is displayed correctly now (and in other screens too)
- CHD list files (\arcade\sysname_chd.ini) are no longer needed, EL get CHDs list directly from the ROMsList info of each game
- Source code cleanup (finally!): created general functions to detect CHD filenames and to search CHD files. Multiple features can now use the same functions instead of having duplicate code (scan games, delete/copy/move games, game details)

### Added

- Sega Model 2 update:
  - support for SEGA Model 2 Emulator v1.1a
  - emulator version detection (v1.0 or v1.1a) by searching for the new "FSAA" setting in emulator.ini file
  - database file "SEGAModel2_xml.dat" updated for emulator v1.1a with new games and parent+clone relationship (I didn't know this was possible for this emulator)
  - if emulator v1.1 / v1.1a is detected, file "SEGAModel2_xml.dat" is used to create games list
  - if emulator v1.0 is detected, file "SEGAModel2-v1.0_xml.dat" is used to create games list
  - if emulator.ini file is not found, EL assume you are using the new version 1.1a (Jan 02, 2014)
  - the "model2" set is properly renamed to "Model 2 Board ROMs" - proper games audit: if the file "model2.zip" exists in your ROMs folders, EL will use it, no need to have those files on every game set
    - the emulator actually need this set to check for ROMs... and I DIDN'T KNOW about it!
- Multiple systems filter! Choose multiple systems to filter the gameslist (main tool bar button)
  - tool bar button "Arcade System" renamed to "Systems Filter"
  - button's popup menu replaced by a custom dialog to allow multiple selections
  - if "all systems" is selected, other selections are ingored
  - if you select a single system, the last selected game for that system is still used (no change)
  - only available systems are shown in the list (emulator + games list)
- WinKawaks emulator detection in the AlterMAME feature. Emulator doesn't load anymore when you select it in the filename. Emulator version must be edited manually. http://www.winkawaks.org
- New documentation file "docs\el-romsdatabaseformat.txt"
- New feature: Multiple Favorites Profiles. Simple, quick and easy to use...
  - favorites file moved a new "\ini_files\favorites\" sub-folder
  - proper validation for favorites title to avoid empty titles
  - create as many favorites lists your heart desires
  - favorites manager to create/edit/clean/duplicate/delete profiles
  - the favorites tool bar button have a new popup menu, but the "Ctrl+F3" hot key still works to enable/disable favorites
  - option "Validate Favorites File" moved from main menu "Maintenance" to the manager as "Cleanse"
  - the "favorite_title" entry must exist for proper titles, at any position in the file (default profile "favorites.ini doesn't need it)
- Important notes:
  - when setting a new active profile, EL needs to update the favorite tag in main games list. The more games you have in the favorites profile, more time it will take (around 2.3 seconds for 30000 games on a Core I7 2600 3.4Ghz)
  - when in grouped view mode, if a parent game is hidden and the clone is visible, the parent is forced visible to avoid mixing games that are not related to each other so, you might see more total games than your actual favorite games count
- New font style for games with preliminary driver and missing ROMs/CHDs (see "Font Settings" in games popup menu)
- Option "Run Game With AlterMAME" is back (games popup menu). Run a game directly with AlterMAME without using MAME. You can use any emulator you want

## [7.4.4] - 2013-12-30 U

### Fixed

- There was a beep command in a function that resets list colors, noticeable at startup... debug leftover, sorry folks

### Changed

- Tweaks in run game confirmation dialog

### Added

- Support for HqMAME build detection (*hqmame*.* filename)

## [7.4.3] - 2013-12-23 U

### Fixed

- Games list was being fully loaded twice when creating games lists (main menu). One after create list function (required) and a second time after auditing games (2x waiting time!!!)
- Most affected system is MAME due to its huge games database. Auto-create at startup was never affected by this bug
- Games were not sorted correctly when sorting the list by a column other than game title. To fix this, the list is internally sorted by title (ascending) before sorting by the selected column. Details - view mode only
- The down side... an extra 100 milliseconds to sort (timing based on games list with 31 thousand games and a Core I7 3.4 GHz CPU)
- Parent CHDs were not detected correctly in game details screen. This is purely for information only, game audit is NOT affected by this!
  - CHD and parent CHD files with same MD5 checksum and same file name, the "Parent CHD" entry is not added (duplicate info), but the "header" info text have a new "Parent CHD" tag
  - CHD and parent CHD files with same MD5 checksum but different file name, both entries will be shown even if only the parent CHD is found
- Some system IDs were not updated in the source code, making EL malfunction or even crash
- Open/save file dialog was pointing to a random folder if MAME/HBMAME input folder was not found. Folder is created by EL now (Run Game and Playback/Record Input)
- Save file dialog was pointing to a random folder if EL's custom folder "\multimedia_files\" was not found. MAME/HBMAME only. Folder is created by EL now (Record WAV/MNG/AVI Output)
- New emulator detection is working as it should (preferences screen, startup). Emulator version info is also updated if action is set to "skip"
- Disabled status was not being applied when loading the image layouts settings screen (ghosted icon)

### Changed

- Selection bar width increased to 250 pixels in tiles view mode
- Renamed "Standard" view mode to "Details" view mode... it makes more sense
- Moved "Game Icon Size" and "Disable Clone Indent" options from main menu "View" to view mode button in tool bar buttons
- Both options are only visible in details/grouped view modes
- Many, many... many user interface tweaks
- Improved function that extracts MAME/HBMAME version info from the "-help" command line parameter, to generate the same text as in MAME's -listxml output
- This feature can read version strings up to v99.999 so, when MAME reaches version 100.000... "Houston, we have a problem!"
- EL's custom select file dialog has been improved and optimized, both internally and visually
- Features "Run Game and Playback/Record Input" are using EL's custom file dialog again. MAME only support 1 input folder anyway (no sub-folders ?)
- Scan MAME/HBMAME audio samples feature has been simplified to scan games with missing samples... no more, no less
- Added a "Ghosted" property in TEasyItem type so EL can check if items are ghosted or not with ease... EasyListView component improvement

### Added

- Last sorted column is now restored at startup (details view mode). Experimental feature
- New game info: game size
  - want to know the size of each game ?... for details/grouped view modes
  - game size is extracted from emulator' games database when creating games lists, not from actual games files - CHD files are not included since they don't have a fixed file size
  - all systems are supported except for Daphne emulator
- MAME version info and game list version info are customized based on the emulator filename
  - official MAME: no filename restrictions...
  - MAME Plus!: filename containing "*mamep*.*
  - UME: filename containing "*ume*.*
  - WolfMAME: any filename since this variant is detected in version info text
  - Notes:
    - WolfMAME detection is done thru the "[W]" tag in version string
    - Emulator icon remains the same
    - This feature is hard-coded in the source code and other MAME variants are not supported, specially MAMEUI and MAMEUIFX
- You can now select multiple systems at once to create games list and audit ROMs/CHDs (scan games), like in EmuCon. Just select the system(s) in the system selection dialog. Preliminary feature, please report any bugs
  - Create games list feature is located in main menu "Create Games List"
  - Scan games is located in games popup menu "Scan Games (Audit ROMs)" and it works with all menu options except "Selected Game" and "Selected Game (Multiple)"
  - If any system fails to create games list, the failed systems list will be shown in a message box
  - Selecting "All Systems" ingore all other selections

## [7.4.2] - 2013-11-28 U

### Fixed

- Proper support for UME emulator. EL was not looking for "ume.ini" file when reading emulator settings. Sorry for that folks...

### Changed

- Delete/rename image dialog updated with a cleaner interface and more details
- System icon / game icon layout changed in a few screens. Using two 68x68 icons was a bit weird. There's still room for improvement
- Buttons size are back to standard 87x23 pixels
- Game details screen rewrite. Made several tweaks and removed redundant info
  - Section "Device ROMs" removed. Kinda pointless since you have this info in the "Game Files" section
  - Merged set info text moved from list to the "gamename" text, below game title
  - Game files info now show a "(.zip; .7z)" text if the system supports 7-Zip file format (only when file not found)

## [7.4.1] - 2013-11-12 U

### Fixed

- FATALITY! I can't beleive it... I FORGOT to change the audit feature to get .7z contents using the 7-Zip library!
- Emu Loader would simply crash as EL was trying to open .7z files as they were in .zip format, using the ZipForge library
- Well, that's fixed so you can start using MAME/HBMAME/Demul ROM sets in 7-Zip again. Thousand apologies...
- Vertical scrollbar would go back to position zero after clicking on a column (details view mode)
- Filters based on driver names were not working. Now all driver names are handled without the file extension

### Changed

- Section entries of games/devices with no ROMs are removed from ROMs list files (sysname_roms.el). This does not improve performance and it reduces only mere KBytes of file size, but it keep files clean (crete games list)

### Added

- New feature: Select a fixed game at startup (requested). It allows you to always select the same game at startup, regardless the last selected game when exiting the frontend
  - Access thru a new games popup sub-menu "Select Game at Startup"
  - Just select the desired game, call the popup menu and select "Use Current: game_title" menu option
  - This overwrites the "select last selected game" feature. To go back to the regular mode, just click on "Clear Selection" menu item
  - If the game cannot be found (not visible due to filters, etc), this feature will fallback to the regular last selected game
  - The first menu item is the game you chose as a fixed game. Cliking on it will select that game
  - Selection details are saved in EmuLoader.ini using a new "[SelectGameStartup]" section

## [7.4] - 2013-11-08 U

### Fixed

- Access violation after closing the select folder dialog. It didn't happen for everyone one though (not even on my system)
- Some MAME folders were being wrongly handled as ROMs folders, using "uMain.ExtractROMsFolders()" function. Replaced by a proper "uMain.ExtractMultiFolders()" function
- Weird that Emu Loader was "kinda" loading those info to MAME settings screen without problems... but it was being loaded WRONG!
- Proper load support for multiple MAME folders: samples, artwork, controllers. EL could only work with single folders
- Memory leak when exiting the frontend if MAME settings screen was accessed at least once
- When handling multiple items in a ListView (delete/move/copy files, remove item from list), only the first item would be processed and loop routines would self-terminate prematurely
- Minor visual tweaks

### Improved

- Updates to "Not Used Zip Files" (main menu "Settings"/Maintenance"):
  - support .7z format
  - added a destination folder edit box and a overwrite files checkbox
  - menu option "Maintenance" moved out of "Settings" as a sub-menu
  - feature renamed to "Not Used Game Files"

### Added

- Support for DICE v0.7. File "DICE_xml.dat" updated with new games and a few other changes
  - a new "sourcefile" tag was added to show driver name (reduntant for DICE ???)
  - a new "versionadded" tag was added to show which emulator version each game was added
  - driver status is now always set to "Good" (hard-coded in EL's source code)
  - category info is now shown using MAME's catver.ini (might not be accurate)
- New feature: Copy/move game files
  - Feature can be accessed only in games popup menu (mouse right-click)
  - Similar to "Delete Selected Games" feature, but to copy or move game files
  - It works with single and multiple games selections
  - New "Destination Folder" edit box so you can select the destination path when copying/moving files (full paths only!)
  - If destination path doesn't exist, EL will try to create it
  - New "Overwrite Existing Files" option so you can choose to overwrite or not existing files in the destination folder
  - Added a new (and fancy) dialog box to show operation progress (delete/copy/move)... with an error log too
- NOTES:
  - if you click on cancel button, all files that were already deleted/copied/moved will NOT be restored
  - CHD files are copied/moved to a "\chd_files\" sub-folder in the destination path. This cannot be changed
  - when copying/moving files for multiple games of different systems (MAME, ZiNc, etc), systems othen than MAME are placed in a sub-folder to avoid mixing files, like so:
    - MAME: root of the destination path
    - Supermodel: root_path\SupermodelSEGAModel3\
    - Daphne: root_path\Daphne\
    - Demul: root_path\Demul\
    - HBMAME: root_path\HBMAME\
    - DICE: root_path\DICE\
    - Sega Model 2: root_path\SEGAModel2\
    - ZiNc: root_path\ZiNc\ - when copying files of games that share the exact same ROMs/CHDs files (MAME and HBMAME games for example), to prevent EL from creating duplicates, EL keeps an internal list of all MAME files. This list is checked against game files of all the other systems
- Some HLSL options are back for better compatibility with previous MAME builds (0.149 and older): "read custom ini file", "write custom ini file", "hlsl file name"

## [7.3.4] - 2013-10-09 U

### Fixed

- Clicking "reset" button in text filter bar, games were not being shown if games list was empty due to previous filters
- Buttons hints were disabled in customize columns screen

### Changed

- Updated options in MAME settings screen, for MAME v0.150 release
  - HLSL options ("Video 1" tab)
  - Seconds to run; MAME use values in seconds and not milliseconds. Also, renamed it to "Time to Run" ("Video 2" tab)
  - Added "Benchmark" option in performance panel ("Video 1" tab)

### Improved

- Minor tweaks

## [7.3.3] - 2013-09-20 U

### Fixed

- Application crash when viewing MAME/HBMAME games list in "View Missing ROMs/CHDs" screen (F8 hot-key)

## [7.3.2] - 2013-09-17 U

### Changed

- Replaced "Snapshot Name Format" combo box control by a proper text box control

### Added

- Support for MAME v0.150 new "mame.ini" settings (MAME Settings screen)

## [7.3.1] - 2013-08-25 U

### Fixed

- Misc filters were not being validated when using text filter bar

## [7.3] - 2013-08-22 U

### Fixed

- HBMAME settings file was not being loaded if you have MAME and HBMAME in the same folder tree
- Columns were not being updated after closing customize columns screen

### Added

- Number of players option added to the text bar filter

## [7.2] - 2013-08-01 U

### Fixed

- Previous/next image buttons were not working correctly. Also, they do NOT work at all if the "load image with threads" button is enabled

### Added

- New misc filter: Hide Device Sets with no ROMs
- Check this option to hide all device sets that have no ROMs (for MAME and HBMAME). Note that this does not hide device sets with ROMs (like mie and qsound)
- Support for MAME 0.149u1

## [7.1] - 2013-07-11 U

### Fixed

- Crash fix for Demul 0.58 (create games list)
- Some systems were still using media type index higher than 1. You must re-create games lists for all systems that use CHDs or disc image files (Daphne, Demul... except MAME/HBMAME)

### Improved

- Optimizations in view audit results feature. Support up to 19 devices per game. I doubt a game will use that much devices... future proof :)

### Added

- New arcade filter: Taito Type-X System
- New column "Game Status": available, missing ROMs/CHDS, missing
- Extremely ultra mega preliminary support for 7-Zip files. This is an experimental feature. I recommend to keep your MAME/HBMAME/Demul collections in ZIP format though. With 7-zip you can save around 3GB of HDD space if you have ALL MAME games but c'mon... 500GB external HDDs USB 3.0 are so cheap these days!
  - for MAME/HBMAME and Demul only!!!
  - file "7z.dll" must be placed in same folder as EmuLoader.exe (file must be downloaded separately)
  - if you do not have ROM sets in 7-Zip format, you don't need "7z.dll" as Emu Loader works just fine without it
  - very high compression profiles will be slower to handle (compared to zipped sets)
  - Zip and 7-Zip formats are supported at the same time. You can have mixed sets in both formats, no need to convert your entire ROMs collection
  - newer 7z compression profiles might not be compatible as the only Delphi library I could find compatible with Emu Loader's internal code was coded in 2011 (not by me...). There is no way to adapt EL's internal code without breaking the entire project!
  - MAME/HBMAME audio samples are also supported... are .7z samples supported in MAME ?
  - for information, the library source code is "source\sevenzip.pas" and 7z.dll version supported in v4.65.0.0

## [7.0] - 2013-06-26 U

### Fixed

- FATAL BUG: image zip content lists were not being re-initialized after switching images categories/layouts. Only fixed by restarting the application
- Application crash when creating games lists or auditing games. Equal chars ( = ) of ROM names replaced by by minus chars ( - )
- All ROM names are now checked for HTML tags, fixing A LOT of unusual ROM names (cosmetic fix)
- False "file not found" messages due to a couple variables not being handled correctly at frontend's startup (cosmetic fix)
- Wrong system icon and game name in Emu Loader's "Select File" custom dialog (cosmetic fix)
- Fatal bug haunting Emu Loader for more than a year! When game is already set as missing, ROMs list was not being updated in "system_name.miss" files after auditing... games with device sets were the most affected
- This was a big problem as available ROMs were being shown as missing, making it impossible to update ROM sets
- I don't know how I could have missed this for so long!!!
- Several minor fixes, app settings and cosmetic fixes
- Images layout feature was being initialized TWICE at startup!!!
- Images splitter grip icon not being set at startup if setting was disabled
- Minor bug preventing EL from deleting "arcade\systemname.miss"
- Columns could be clicked while in grouped view... this mode does not allow sorting for obvious reasons

### Changed

- File "biosset.ini" is only used for MAME now. This file's purpose is to change the bios used on systems with multiple bios sets (like Neo-Geo). This prevents other emulators from messing this file up
- MAMu_ icons folders unified into a single folder. Select folder is now in Preferences screen, "Games List" page. Relative path is supported (relative to Emu Loader)
  - EL use the same icons for all systems, but the following systems can be in a sub-folder (not required):
    - ZiNc: "mamu_icons_dir\zinc\"
    - DICE: "mamu_icons_dir\dice\"
- Option "Run Game [AlterMAME]" is gone (games popup menu), and a new "Autorun Game with AlterMAME" menu item is added (ON/OFF toggle). Feature is located in emulators setup screen and in games popup menu
- Just choose an alternate MAME build in Emulator Setup screen, run game normally. If it fails (MAME exit code 2), Emu Loader will try to re-run the game using AlterMAME executable
- The AlterMAME feature now works as it was originally intended...
- Feature "Show Game Docs" now display info for MAME only. No point showing info on other systems

### Improved

- Several tweaks and optimizations everywhere
- Favorites list is always loaded with games list now, regardless of the feature being enabled or not. This causes a tremendous speed up when switching favorites on/off. One downside... games list loading can be up to 2.5 seconds slower if you favorites list is larger than three thousand games

### Removed

- Settings "Bold font style in selected games" is removed. Pointless feature...
- MAME features "Show Average FPS" and "Show Error Messages" are no more. When running a game with missing ROMs, a error message will popup after exiting the emulator, and the "Game Details" screen can be open, showing what ROMs are missing for the game... this CANNOT be disabled and it's supported on all systems (except Daphne)
- Button "Delete Image" removed from images tool bar. This feature can only be accessed in images popup menu (mouse right-click)

### Added

- Support for MAME 0.149
- New emulator support: HBMAME (HomeBrew MAME), completely independant from MAME: <http://hbmame.the-chronicles.org>
- Most MAME based features are supported
  - support for games with multiple bios sets like Neo-Geo (biosset_hbmame.ini)
  - partial merged sets support (just like MAME)
  - game custom settings
  - game audio samples detection. also, scan for audio samples in "Games List" main menu
  - features from "Run Game (Extra)" games popup menu are supported - NO support for mameinfo.dat, history.dat and other docs
  - support for catver.ini, languages.ini and others
  - detection of device sets and games with CHDs
  - AlterMAME is NOT supported
- New emulator support: DICE: Discrete Integrated Circuit Emulator
  - it uses an external ClrMAME XML games list "DICE_xml.dat", created by myself specially for Emu Loader. It has more game info compared to regular XML lists
  - ROMs folder cannot be customized. ROMs sets, zipped only, must be placed in DICE's own "roms" sub-folder
  - Games with no ROMs are set as available
- Display orientation, number of players and controls types are now extracted from external ClrMAME XML .dat files, if available. This is mostly for DICE...
- Support for zipped MAMu_ Icons (icons.zip). YES you read it right!
- Notes:
  - for ZiNc games, icons from "icons\zinc\" sub-folder are used, if found but it's not required
  - for DICE games, icons from "icons\dice\" sub-folder are used, if found, to avoid mixing with MAME icons (not required)
  - MAMEUI icons do not have those special sub-folders. Icons from the root .zip folder are used instead
- New setting: "Dark Font Selection Bar", for those who want to use a white font in games list (preferences screen, Games List tab)
- Multi-column sorting. Sort by 2 different columns at the same time (request). Usage: click on first column header, then hold Ctrl key and click on a second column header
- Notes:
  - this is a hack and extremely experimental... not a true multi-column sort implementation!
  - it only works with ascending sort (A to Z)
  - only works with details view mode
- Re-added screen resolution and screen refresh rate info in games list columns

## [6.7] - 2013-02-20 U

### Fixed

- Random application crash after selecting games
- Menu option "Enable MAMu_ Icons" was grayed out after selecting folders for icons
- Image Layout "tripple 6" was not loading/saving image 3 width correctly
- Games splitter bar disappears when making the games list panel too small
- Auditing multiple selected games was showing the system selection window. It's not necessary as the system of the first selected game is used. Games of different systems cannot be scanned together on this feature!
- No more script error messages when using web browser game info (ProgettoEMMA) on certain games (88games and others)
- It was as simple as enabling the "silent" mode in the TWebBrowser component
- A few buttons in images tool bar should not be visible when viewing game web info
- Clicking the close button in message box window was not returning the correct "abort" message
- Unfocused lists had wrong sized selection bar
- Images tool bar buttons still visible after disabling preview images, while info game docs panel enabled
- Images panel messed up when disabling preview images, while internet game info is being used
- Preview images being loaded twice at startup. Startup is now 2 seconds faster

### Changed

- Button "Toggle view mode" in images tool bar moved to a fixed position (second button). Easier to switch between view modes as it never moves to another position
- Finally updated the Graphics32 component to latest v1.9.1. There are no speed improvements though
- Renamed "Enable Layout Dimensions" to "Show Layout Dimensions" (images popup menu). You'll need to re-enable this setting
- User interface back to the good old looks. No gradient backgrounds, glowing texts or glass buttons
- Fixed background color of many controls to pure white RGB(255, 255, 255)
- Main image panel does not change color anymore, it's always black... as it should have been
- Replaced the last semicolon char " ; " by the special " ¬ " char. Now EL can have game titles with semicolon (Japan titles ?)
- Games list files are updated automatically at startup

### Improved

- Showing preview images on selected games is a bit faster. If the game image is already loaded in images panel, it is not loaded again (parent + clones related games). This is good for zipped images and when "load using threads" is disabled
- eg.: selecting "Elevator Action" and its clones. If you only have the image for the parent game, selecting its clones will not reload the parent image... if it's already loaded
- Switching between image layouts is lightning fast now!
- Replaced the "Lanczos" resampler filter by "Hermite". It's faster and it looks better. No noise, phantom pixels or over-sharpening added to the image
- Expanded the "Interface Type" filter in "Misc" filters (tool bar button) to include fruit machines in the mechanical option, and added a "Fruit Machine" option. Also, for better filtering, catver.ini is also used if available

### Removed

- Setting "Show Image Border" is gone. 7 pixels border in images panel is always enabled from now on. It looks more professional...

### Added

- Load preview images using threads
  - Preliminary feature, disabled by default. To enable it, check the first button in images tool bar buttons
  - It works great for images layout view mode and zipped images, as all 3 images load at the same time
  - Unzipped images are also supported, but the speed gain is less apparent
  - One nice side effect, no lag when scrolling the games list (if images panel is enabled)
  - If you select games too fast, sometimes images of the last selected game might not load. This was necessary to prevent the application from crashing
  - a 2 milliseconds delay was added before loading each image panel, to avoid crashes when switching between image layouts views
  - Best used with multi-core CPUs
- New filter: "Games ROMs" ("Misc" filter button) -> you can choose to show only games with ROMs/CHDs or only games with no ROMs (pong ?).
- For MAME Plus! this is handy since it has more than 30 games that do not use ROMs
- Re-added the function to select random games. Access "Select a Random Game" in games popup menu (mouse right-click) or with the "Ctrl+R" hot-key. There will be no tool bar button for this. It does NOT work with the grouped view mode!
- Support for "languages.ini" from AntoPISA Progetto-SNAPS. Place file in "emuloader\ini_files\" folder
  - new column in games list (details, grouped views)
  - new "Language" option in "text bar" filter settings (tool bar buttons)

## [6.6] - 2012-12-23 U

### Fixed

- Applied a dirty fix for the "gamename.zip not found" message, for sets with no ROMs ("Game Details" screen)
- "Ghost" effect not being applied to unchecked files in "Delete Selected Games" feature
- MAME games with no ROMs were being handled as "missing ROMs" (pongf, ide_baseboard, hdd, and others from MAME Plus!)
- Proper MAME NVRAM file type detection ("Delete Selected Games" feature). This is just a cosmetic fix, to display correct file type descriptions...
- Fixed my TShadowLabel component. It was cutting 3 pixels at the right side and 1 pixel at the bottom. The regular TLabel component also does that when text have "Italic" style enabled or the component is set to "disabled"
- Menu item caption was appearing as hints in some menus/popup menus
- Button "Yes" being executed when pressing "ENTER" key, while button "No" is focused (MessageBox screen)

### Changed
- Rewrite of "Emulator Setup" screen. A new "glowing text" unit is in for testing (might be removed/replaced in a future build)
- To avoid repaint crazyness (like TLabel component), the new "CreateGlowText()" function can only be used with TImage components
- Visual updates on a few screens that have "emulator select" and "image category select" panels and/or screens
- Rewrite of "Image Category / Image Layouts" settings screen and fixed a few visual bugs

### Improved

- Delete multiple games at once has been completely rewritten.
  - Added game config files (cfg; nvram; eeprom; sram; flash) to "Delete Selected Games" feature. Also added ".flash" files detection for Demul (nvram folder)
  - ALL selected games are now scanned, not just available ones. This is necessary since config files are included in the search, and you might have config files but not the actual ROMs/CHDs files
  - Files list no longer appear while scrolling the games list. Instead, a "Files Details" button is available if you want to see the full files list (all games or selected games)
- IMPORTANT: You cannot select individual files per game to delete anymore. A new checkbox group has been created, called "Check File Types to Delete".
- There are three options: "ROMs", "CHDs" and "CFGs/NVRAMs". Just check the file types you want to delete and uncheck the ones you want to keep. It's very simple
- Rewrite of "Show Game Details" screen and a few optimizations. Still not final... I'm not yet happy with how it looks
- Buttons "No" / "Yes" re-arranged in MessageBox screen. Button "No" should be on the right side...
- Replaced open/save file dialogs by Windows native dialogs. The proper dialogs are displayed now on Windows 7 :)
- Finally found a way to compile the project with a high res icon with many resolutions, including 256x256

### Removed

- Feature "Delete Game Config Files" is no longer needed
- Feature "Delete Not Used Game Config Files". It's way easier to manually empty config folders from all emulators anyway...

### Added

- Support for MAME v147u1 new "mame.ini" settings
- It's bigger... it's better... zipped images is BACK!
  - Files are extracted directly into a memory stream (RAM). No temporary files are created
  - All systems are supported
  - If you modify any of the .zip files, Emu Loader must be restarted, or you can disable/enable images (F6 hot-key)
  - Files must be placed in the same folders as images, for each system
  - None of the rename/delete features support zipped images, because it's ultra mega dog slow to update .zip files
  - Each .zip file is closed after the image is loaded. This prevent files from being locked and always opened...
  - The priority is still unzipped images. If no unzipped images are found (both parent and clone), .zip files are searched
  - Use of internal string lists for faster file searching
  - Filenames for each image category (same as MAME Plus! / MAMEUI). Same filenames for all emulators as well:
    - Title Snapshot: titles.zip
    - In-Game Snapshot: snap.zip
    - Marquee: marquees.zip
    - Flyer: flyers.zip
    - Cabinet: cabinets.zip
    - Control Panel: cpanel.zip
    - Control Panel Layout: cpanellayout.zip
    - PCB: pcb.zip
    - In-Game Artwork: snapartwork.zip
- Notes:
  1. if you select the same image folder for different systems, the same .zip file will be used!
    - eg.: select same folder for snaps in MAME and ZiNc. EL will search images for both systems using the same "snap.zip" file
  2. Searching internal lists, it takes zero ms (milliseconds) on a list with 30 thousand items (15 ms on a list with 60 thousand items, 30 ms on a 120 thousand list... and up on larger lists)
    - Unzipping files takes between 15 ms to 50 ms, depending on how big or small the .zip file is. This is measured on a Core I7 2600 3.4GHz)

## [6.5.4] - 2012-09-15 U

### Fixed

- Critical error: a few important features were not working due to new "TrkGlassButton" button types still being handled as regular "TButton" on many functions
- Several games filters were not working due to a glitch in the source code... sorry, my fault
- Button "Image View Mode" is now the last button in images tool bar button... as it should have been from day one

## [6.5.3] - 2012-05-27 U

### Fixed

- Rename/delete images was never possible, unless the main menu "Images" was accessed first
- Rename/delete images with popup menu was not working while in layouts view mode

### Minor UI bugs

- Quiting the frontend in full screen mode. After restart EL and disable full screen mode, main window state was not restored correctly
- Images panel visible when restarting EL in thumbnails view mode
- Feature "center image splitters" was not working correctly for some layouts (image layouts view)
- Buttons / checkboxes / radiogroups components disappear when pressing the ALT key (Windows themes support is buggy in Delphi 7 for some components)
- Game selection's alpha blend setting was always disabled on restart
- Panels in "Image Layout Settings" screen were not being correctly shown/hidden (visual bug only)
- Splash screen's texts frame not moving along with splash screen while dragging it
- Several UI bugs in MAME settings screen, including tooltips

### Changed

- Main menu bar is gone. All options are now in the first button at the main tool bar buttons. Can also be hidden
- Modified my splitter component to accept a single color, a popup menu... and more goodies
- Splitters in main screen set to "Office 2007 Luna" style by default. Customizable at preferences screen, "General" page
- Replaced all top/bottom bars by my new TPanelEx component with vista grandient styles (external image files no longer needed)
- Moved Daphne settings from preferences screen to its own config screen and added new settings. A new file is created: "\emulator_ini\daphne_el.ini"
- Moved "\images\msgbox_icons\" folder to "\resources\main_icons\msgbox_icons\" and converted into .ico files

### Improved

- Dual gradient selection bar visually improved (menus / popup menus)
- Preferences screen make-up. Sections separated by pages
- New hint control to mimic Windows 7 hints/tooltips (games list has its own custom hint, it cannot be changed)
- More code cleanups and optimizations
- Replaced all checkboxes, radiogroups and groupboxes by my new custom components. Custom label colors and shadow texts

### Removed

- Select random game feature on main tool bar buttons is gone. This feature never worked right while filters are enabled
- The following files are no longer needed (all from "resources\images\" folder):
  - "msgbox_bottom.png", "msgbox_bottom_border_left.png", "msgbox_bottom_border_right.png", "checkbox_on.png", "checkbox_off.png", "msgbox_top.png", "systembk_top.png", "textbar.png", "textbar2.png"

### Added

- New settings for "Image Layouts View"
  - "Show Splitter Grip Icon" -> toggle on/off grip dots in splitter (images popup menu)... enabled by default
  - "Customize Splitters" -> customize splitters appearance (images popup menu, preferences screen / "Images" section)
  - "Splitter Style" -> fixed gradient colors, "single color" style can be customized (preferences screen / "Images" section)
  - "Center This Splitter" -> center only one splitter on a image layouts view (mouse right-click directly on the splitter)
  - "Enable Layout Dimensions" -> show a window with the size of each image panel (in pixels), for extreme fine-tuning (images popup menu)
- Option "Category / Layout Settings" added in images popup menu for quicker access
- New setting for main tool bar filters: "Bound To Games Panel". Check this option to limit the tool bar to the games list panel. This will increase the size of the images panel even more (menu "View" / "Tool Bar" and in "Customize Tool Bar" screen
- NOTE: if the games panel is too short, use the small tool bar buttons or increase the games panel width by using the splitter
- New setting: "Show Image Border" (enabled by default). Show a 7 pixels border around the image panel (images popup menu)

## [6.5.2] - 2012-02-28 U

### Fixed

- Minor command line fix for Supermodel 0.3a (run games)

### Added

- Support for Demul v0.5.7

## [6.5.1] - 2012-02-25 U

### Fixed

- Games with discrete audio were not being parsed correctly from -listxml output (MAME)
- Feature "Delete Selected Game(s)" was not searching CHD filenames correctly and not listing them on the game files list

### Improved

- More source code cleanups

### Removed

- CHD Sub-filters removed. Only a single CHD filter is available from now on. File "chd_mediatypes.ini" no longer required
- CHD compression type info completely removed from the project. Now only the header version is shown
- Support for "Game FAQ Files" and "PCB Info Files" removed (preferences screen, game info feature)

## [6.5] - 2012-02-21 U

### Fixed

- Since MAME 0.144u7 main CPU tags have a " : " char in the tag name (-listxml output). Dunno why they did this... :_(

### Added

- View game info from Progetto EMMA website, since MAWS is offline and there's no ETA on its return (if ever)
- To change between them, go to main menu "Images", and select one of the options. "Progetto EMMA" will be the default setting from now on
- Support MAME v0.145u1: new CHD header v5 detection (no compression type detection though)
- Support new settings for the latest Supermodel 0.3a-WIP ("Supermodel Default Settings" and run games)

## [6.4.2] - 2012-01-28 U

### Fixed

- ROM status begin set as missing for available games. I guess I missed that small tiny detail. All is good now :)

## [6.4.1] - 2012-01-22 U

### Fixed

- ROM CRC32 checksum was not being parsed correctly from mame's -listxml output (several sets). This greatly affects game audit!
- Game status not being properly set on missing sets, showing wrong info in "Game Details" screen and set status icon at games list's status bar

## [6.4] - 2012-01-10 U

### Fixed

- Minor cosmetic fixes in the user interface
- Application crash after deleting a game .zip file... this bug has been there for months :_(
- Events of several buttons and components in "MAME Settings" screen were missing (folders tabs). Not a single bug report about this either :_(
- Status bar not updated after single game scan (audit)
- The folder for SEGA Model 2 Emu config file could not be located, as the folder was not being properly set. That means NO ONE could run games with the frontend! Sadly, nobody reported this :_(
- Games list was not being generated at startup, if games list file and ROMs database file were not found
- Minor bug that was not properly adding merged clone "names" into "arcade\mame_merged.ini"

### Changed

- If option "Set All Games Available", only the games from the selected "scan games" option will be updated (not the entire games list). But the "arcade\system_name.miss" file will not be updated
- Selection bar updated
- Blank icon renamed to "blank_icon.ico" and it's now a 32-bits icon ("resources" folder). "MAMu_ Icons Manager" feature updated to use this new icon
- Big core change 1! From now one, the entire ROMs database is loaded in RAM for easier and faster access. You must re-create the games list for all systems!
  - ROMs database changed again ("\arcade\systemname_roms.el" files). Used by following features: "scan games (audit)", "scan results" and "game details"
  - no more "baddump" / "nodump" tags detection (this is not a ROM manager), although "nodump" is set if the checksum is empty
  - the "is / is not device rom" tags are now placed before the rom name (MAME only)
  - entries "gmtitle", "cloneof", "biosname" removed since they're not needed anymore
  - an addition of 3 seconds to load the ROMs database, when loading the games list
- Features "Scan Games (Audit)" and "Scan Results" updated to use the new ROMs database format. The data needed (game info and ROMs list) are read directly from the games list
- Big core change 2! Game set status info expanded into three categories and added directly into game list files ("arcade\system_name.el"), for easier access and game auditing. You must re-create the games list for all systems!
  - code 0 -> available game
  - code 1 -> missing ROMs/CHDs
  - code 2 -> missing (no .zip file found)
  - file "arcade\system_name.miss" still used to display ROMs status in "Game Details" and "Scan Results" screens

### Improved

- Code cleanups

### Removed

- The following "selection bar" settings were removed (preferences screen, "Selection Bar" frame box)
  - "Full Item Paint" -> it's always enabled anyway
  - "White Text Color" -> not needed anymore
  - "Gradient Bar" -> gradient selection bar is always enabled now

### Added

- New scan games option: audit multiple selected games at once :)
  - only games from ONE system will be scanned (based on the first selected game)
  - option located below "Selected Game [Shift+F5]", called "Selected Games (Multiple)"... games popup menu, "Scan Games (Audit ROMs)" sub-menu or just use the hot-key "Shift+F6"
- New selection bar option: "Round Corners". Enable or disable the rounded corners in the selection bar (preferences screen)

## [6.3] - 2011-12-15 U

### Fixed

- Average FPS was not being shown after exiting a MAME game, if "Show Error Messages" was also checked (main menu "View" / "Command Line")
- Paiting bug when selecting items on large icons view mode

### Changed

- The -listxml output file is no longer deleted after creating a MAME games list. It is now a fixed file: "elfolder\arcade\mame_listxml.xml"
- It will only be updated if a new MAME build is used. It takes way too long for this file to be created
- Avoid deleting this file manually...
- XP themes must be enabled from now on, so EL can work properly. Windows 7 needs aero interface. Otherwise, the UI will be all messed up
- New screens for Delete/Rename image files

### Improved

- New rename/delete images dialog

### Removed

- No more true color icons (24-bits) support. EL was built for XP icons from day one (32-bits, alpha blend)
- MAMu_ icons still supports 8 bits (256-colors), 24 bits (true-color) and 32 bits (XP-icons) and that will never change
- Support for Win9x / WinMe is gone
- Setting "Force Quotes (XP/Win7)" (main menu "View" / "Command Line"). It has been disabled for many builds
- Setting "Disable Icon Stretch (48x48)". Not needed anymore (MAMu_ icons)
- File "EmuLoader.exe.manifest" is not needed anymore. Themes is always enabled from now on and there's no way to turn them off

### Added

- Support for the new control tags format in -listxml output (MAME 0.144 and newer). Games with dual joysticks are displayed correctly at "Game Details" screen. - File "ini_files\control_type.ini" updated (MAME Plus! also supported)
- Old MAME builds are still supported (minimum 0.84)
- Support 48x48 icons for MAMu_ icons (alpha blend-32 bits, true color-24 bits and 256 colors 8-bits)
- Only when using tiles view mode or standard/grouped views with "extra large icons" settings enabled

## [6.2.1] - 2011-11-24 U

### Fixed

- Game sets that have no ROMs where being set as missing as there is no ROMs list for the audit feature. They are all set as available sets from now on (pong, a2600, nes, etc). This fix only applies to "MAME Plus!"

### Changed

- Changes in "MAMu_ Icons Manager" feature:
  - new "Mechanical" column in missing icons list
  - icons do not get copied/updated when closing the screen with the window close button ("Copy zzz to Selected Games" setting)
  - support for multiple zzz icon files for the missing icons list. Missing icons list will be checked against all zzz icon files found in icons folder. files naming MUST be "zzz_nameofyourfile.ico" (always start with "zzz_")
  - icons in the "Delete Not Working Icon" screen are now properly loaded, due to multiple "zzz" files (right after scanning for missing icons) - feature "Update Not Working Icons" is broken for now
- Updated "Delete Config Files" feature (games popup menu) to support the new nvram file system for MAME (nvram\gamename\*.*)
- Notes:
  - this is only supported with single game selection!
  - old .nv files are still supported...
  - multiple folders support for games with multiple bioses, like NeoGeo... "systemname_biosnum.nv"
  - delete config files when multiple games are selected, only the old "nvram\gamename.nv" method is supported

### Improved

- 3rd pass when creating MAME games list is way faster now

## [6.2] - 2011-10-27 U

### Fixed

- Workaround for ROM names with equal char " = ". Due to the way the frontend was coded, this char cannot be used on ROM names. ROMs are validated by CRC32 checksum only, ROM names are irrelevant. This applies to the "gamtor.c" driver only (for now)

### Changed

- The available ClrMAME .dat file is now used to create Supermodel games list (file: "SupermodelSEGAModel3_xml.dat")
- But game info is incomplete. A working MAME list is needed to fill the blanks (optional)
- Changes in "MAMu_ Icons Manager" feature:
  - new column in missing icons list: "Mechanical"
  - icons do not get copied/updated when closing the screen with the window's close button ("Copy zzz to Selected Games" setting)
  - support for multiple zzz icon files for the missing icons list. Missing icons list will be checked against all zzz icon files found in icons folder. files naming MUST be "zzz_nameofyourfile.ico" (always start with "zzz_")
  - icons in the "Delete Not Working Icon" screen are not properly loaded, due to multiple "zzz" files (right after scanning for missing icons)

### Added
- Support for new MAME 0.143u8 settings ("MAME Setting" screen)

## [6.1.9] - 2011-09-27 U

### Fixed

- On a fresh install, large icons (32x32) are displayed instead of standard size (24x24)
- Red alert! Red alert! CRC32 checksum for several Demul games have leading spaces (-listxml output), causing EL to set these games as "found with missing roms". Funny, after many months, only ONE user reported this bug!!!
- I don't use Demul so, I never got this problem

### Added

- Support for MAME v0.143u6
- Support for Supermodel v0.2a (older builds are no longer supported!)
  - emulator settings and custom game settings are saved on EL's own .ini files (folder "\emulator_ini\supermodel_ini\")
  - settings from "emulator_folder\Config\Supermodel.ini" file are never read or used by the frontend
  - a working MAME 0.143u6 games list is required to create a Supermodel games list (older versions are not supported)

## [6.1.8] - 2011-08-22 U

### Fixed

- Game titles in SEGA Model 2 XML file fixed. Many thanks go to user "Retroplay" from RetroRoms forum for fixing them

### Added

- Changes in the frontend's core to support MAME v0.143u3 new device sets ("mie", "namco50" and others)... from "-listxml" output
  - new file, listing all games that use ROMs from device sets ("\arcade\mame_devicesets.ini")
  - new "IsDeviceSet" field in games list files ("\arcade\system.el"). Also a new "devices" section is added, listing all device sets
  - new "IsDeviceROM" field in ROMs list files ("\arcade\system_roms.el")
  - separate .zip sets support for these new devices when scanning/auditing games ("mie.zip", "namco50.zip" and others)
- New main filter: "Device Sets" that show only device sets (main filters button, right next to the Bios filter)
- New "Devices" filter (extra filters tool bar button):
  - "Show Games With Device ROMs" -> show all games that use device ROMs
  - "Show Games With No Device ROMs" -> show all games that do not use device ROMs
  - "Hide Device Sets" -> hide all device sets (same as "Hide Bios Sets")
- Feature "Game Details" (Ctrl+I hotkey / mouse right-click) have the following new information:
  - "Device Set / Yes" -> so you know it's a device set, not a game
  - "Device ROMs / Yes", "Device Set #" -> if a game use device ROMs and the set names of the devices
  - "Device Zip" (in "Game Files" section) -> show if the .zip file for each device set is found or not
  - Text tag "Device ROM" on each ROM that's from a device set (ROMs list panel). This is only shown on games, not device sets
- Feature "View Missing ROMs/CHDs" (F8 hot-key) updated to list device names and "device_name.zip" found or missing
- NOTE: this feature support a max of 10 device sets per game... for now (will be increased if needed for future MAME builds)

## [6.1.7] - 2011-07-09 U

### Fixed

- Window status (normal/maximized) not being correctly handled when switching between windowed/full screen mode
- Main menu "Images" showing up when initializing the frontend in full screen mode
- Selected game not visible on screen after resizing the main window or resizing the preview snapshots panel
- Document files updated ("docs\" folder). Some of them had incorrect/incomplete information
- In-game snapshot not being updated after exiting a game
- Fixed a huge bug that was messing up image layout settings when switching between layouts, and when switching between classic and layout view modes
- game snapshots were not loading correctly in layouts view mode, if one of the images was not found
- Application crash when changing image's "stretch" setting (classic view mode only)

### Changed

- Bios selection in "MAME Default" and "MAME Game/Driver Custom" settings screen only show sets for games that have external bios sets, like "Neo-Geo", "PlayChoice-10" ("Miscellaneous" tab)
- This way, a bios won't be selectable for games that do not use bios or for MAME default settings
- Renamed "Scan Results" to "View Missing ROMs/CHDs". This feature is ment to show you only available games with missing ROMs/CHDs... not after using "Scan Games" feature
- Favorites profiles removed. Only a single favorites list is supported from now on
- Either create a new favorites list or rename one of the favorites files from "\ini_files\favorites\*.el" to "\ini_files\favorites.ini"... and remove the "fav_username=" line (first entry in the file)
- You can delete "\ini_files\favorites\" folder and its files
- The "Validate Favorites File" option is at main menu "Settings" / "Maintenance"
- Replaced "Number of Screens" by "Audio Type" (only used by MAME)
- Screen "Emulator Setup" re-write
  - Simplified interface. Only emulator filename needs to be selected
  - MD5 checksum info removed (useless)
  - New "Update System" button. Useful if you change emulator file and have "New Emulator Detection" option disabled (preferences)
- ClrMAMEPro XML .dat files must be in frontend's main folder now, and named as follows:
  - ZiNc: "ZiNc_xml.dat"
  - SEGA Model 2 Emu: "SEGAModel2_xml.dat"
- As of this version, both files will be released with frontend's binary package... no more .dat file hunting :-))
- Moved games scan result files (.miss) from "arcade\scan_results\" to "arcade\" folder
- Control type entries in "\arcade\system_name.el" files have MAME's control names now
- A new file is also available listing all control types ("\ini_files\control_type.ini"). You can expand this list manually if a new MAME has a new control... even AFTER creating a MAME games list
- If version info cannot be parsed from emulator binary, "Unknown" will be set automatically (no more user input)
- New "game status" icon at games list status bar, next to the game name label
  - green ball : available game (.zip found and ok)
  - black ball : missing game (.zip missing)
  - yellow ball: have game with missing ROMs/CHDs (.zip found)

### Improved

- Minor user interface tweaks... for consistency
- Feature "Delete Clone Images" updated. Removed multi-screens support (main menu "Images" / "Maintenance")
- Text filter bar updated. New visual, easier to use. More options available
- To change options, click on "settings" button and select the desired filter. Remember, checking "Include Tool Bar Filters", the filters from main tool bar buttons will also be applied
- Game snapshots were being loaded three (3) times over at startup!

### Removed

- Feature "Bios Sets [M.A.M.E.]" (main menu "Emulator"). Select a bios using custom game/driver settings
- Feature "Convert Snapshots". Snap files are automatically renamed after exiting MAME anyway
- Hidden games feature is no more. Wanna hide games from kids and stuff ? Easy... don't have the ROMs in your computer
- ... or edit "\arcade\mame.el" manually and remove the games you don't want (NEVER remove the first game of each section!)
- Multi-games loading feature removed (megatech, and others). This will not be supported by the frontend anymore. The folder "arcade\multi-games\" and its files can be deleted
- "Classic" filter is gone (arcade filters). It's an old filter, when MAME only had Neo-Geo as a driver with external bios sets
- Support for "Screen Resolution", "Save State", "Audio Samples" infos is no more (MAME has LOTS of games without resolution info)
- Option "Display Image Label Info" ...pointless
- Support of following ZiNc features:
  - Glide rendering settings ("ZiNc Settings" screen)
  - Option "One Setting Per Line" from preferences screen (only single line settings from now on)
  - Driver custom settings support (only game custom settings from now on)
- SEGA Model 2 Emulator default settings and custom game settings is no more. The settings file "emulator.ini" have a lot of comments and they were being removed every time you changed something with the frontend. Most option can be changed directly in the emulator anyway
- Emulator default settings for Demul is gone. You can set ALL options directly into the emulator, including ROMs folders
- Setting "Show Not Available Image" is gone. The "not available images" are always displayed now
- Delphi component "VirtualTreeView" is not used anywhere on the project anymore... references and component links completely removed from the project
- More source code clean-up.

### Added

- Frontend documentation files accessible in "Help" main menu
- Support for latest MAME build
- New "Extra Filters" button in main tool bar. All filters from the main menu "Game Filters" are here now. The main reason ? To remind you that these filters exist! They are also saved/restored on restart from now on
- New filter: "Audio Type" (extra filters tool bar button):
  - Standard Audio: most games, using sound chips
  - Discrete Audio: games that use discrete sound circuits
  - Wave Sample Audio: games that use external .wav samples for sound
- XML .dat file for "SEGA Model 2 Emu" v1.0 finally added :)

## [6.1.6] - 2011-05-01 U

### Fixed

- Atomiswave games not loading with Demul emulator
- Waste of RAM when switching view modes in "MAMu_ Icons Manager" screen (missing icons list)
- Columns sorting was not working when columns positions changed

### Changed

- Removed multiple folders support for MAMu_ Icons feature. If you were using multiple folders, please select a folder for each system again. Relative path support is also removed

### Improved

- Feature "MAMu_ Icons Manager" improved. More "Not Working" icons features

## [6.1.5] - 2011-04-22 U

### Fixed

- Played column was not being sorted correctly. All other columns are sorted as strings so, they should sort correctly
- When in grouped view mode, all columns were being indented (clone games). Only the title column should be indented
- Games filters were messing games list up (main tool bar buttons, left panel filter, text bar filter)

### Improved

- After scaning a single game, left panel filter is re-applied if enabled

### Added

- New setting: "Disable Clone Indent" (main menu "View"). Check this option to prevent clone games indentation (grouped view mode only)

## [6.1.4] - 2011-04-19 U

### Fixed

- Supermodel games list not being created at a fresh install

### Added

- New feature: AlterMAME ("Emulator Setup" screen and games popup menu). You can select an alternate MAME build to run games
- See the help button in emulator setup screen, "AlterMAME" panel (after selecting MAME system) for more info

## [6.1.3] - 2011-04-18 U

### Fixed

- Custom settings were not being saved ("SEGA Model 2", custom game settings)

### Changed

- Fancy new splash screen with transparency and alpha blend effect!!! Also, new about screen
- Custom settings (game and driver) are loaded automatically now, if the custom settings file is found
- This is how MAME works, and that's how it will work for all other supported systems (except Daphne and Demul that do not support custom game/driver settings)
- Custom game/driver settings files moved from "frontend\arcade\" path to a new folder: "frontend\emulator_ini\".
- For easier access and to separate them from games list files. Old folders and files will be automatically move to the new folder (ZiNc and SEGA Model 2)
- Supported systems: ZiNc, SEGA Model 2, Supermodel: SEGA Model 3
- Removed all instances of VirtualTreeView component from the frontend, except from the "left panel" feature that requires a TreeView component. Improvements made:
  - standard and grouped view modes converted to use EasyListView component. all views use the same component now
  - no need to reload the games list when switching view modes, except for grouped view that requires special handling
  - slow games scrolling with mouse wheel fixed
  - better integration with other features that need to extract game details info from the main games list

### Improved

- Removed hourglass cursor from a few functions
- Support for "Windows Clear Type Fonts" improved. I think all screens can show clear type fonts now
- Changed all "CompareText()" function calls to "AnsiCompareText()" (multi-byte and accented characters support!) :)
- Major source code cleanup

### Removed

- Scan games list cannot be stopped anymore, to avoid crashes and weird errors
- Custom command line feature is "gone with the wind...". Blame those damn leechers that keep using my frontend for profit!
- ...plus, I've never ever used this feature anyway. Also, to prevent people from using unsupported emulators with the frontend
- Folder "resources\images\topbars\" and all its .png files are gone as they are not needed anymore
- Columns profile per system is gone (standard/grouped view modes). All systems share the same sort parameters
- Columns settings file renamed to "frontend\ini_files\columns_profile.ini"

### Added

- Support for Supermodel: A SEGA Model 3 Emulator
- NOTES:
  - you need a working MAME games list to use this new emulator (games and ROMs list extracted from MAME)
  - emulator settings and custom game settings will be stored in "frontend_dir\emulator_ini\supermodel_ini\" folder
  - emulator default setting stored in "supermodel.ini" file (frontend custom folder)
  - custom game options stored in "gamename.ini" files (frontend custom folder)
  - there is no support for custom driver options since Supermodel only has SEGA Model 3 games
  - merged games are not supported and no split-merged sets either
  - ROMs paths info is stored in "EmuLoader.ini" file, for now. Multiple paths are supported
  - options "vertex shader" and "fragment shader" are available. use them at your own risk!
- New feature: "Save State Manager". View/delete/rename save states files of your MAME and Supermodel: SEGA Model 3 games (main menu "Games List")
- Feature "Show Not Available Image" is back. If setting enabled, will display a "Not Available" image instead of an empty panel... when the image category for the selected game is not found (snapshot, cabinet, flyer, etc)
- All images must be in .png format and they are placed in the new "frontend_dir\resources\images\no_image\" folder.
- See "docs\el-notavailableimage.txt" for more details

## [6.1.2] - 2011-03-22 U

### Fixed

- Colors and transparency in MAMu_ icons not being handled correctly. White frame surrounding many icons is gone.
- They are perfect now, and there is a small speed improvement in the loading function :)
- Tiles view mode, with "Disable Icon Stretch" option checked
- Removed the annoying "Devices for games are not supported, only for bios sets." message when creating MAME games lists
- Timer in splash screen is back. Now it's really working properly... I swear :)
- Minor fixes and tweaks in "MAMu_ Icons Manager"

### Added

- New preferences setting: "Text In Bold". Check this option to enable font style "Bold" in selected items (requested feature)
- Features "Scan Missing Images" and "Scan Not Used Images" merged into "Images Manager" (main menu "Images"). Minor fixes and some optimizations were also made.
- Like MAMu_ Icons Manager, you can work with both lists at the same time. Some key features:
  - rename not used images
  - ability to maximize the window for better visual
  - columns width on missing images list are saved/restored in "el_extras.ini" file
  - images are loaded as icons in not used images list
  - not used images are separated by folders, shown in different groups, for easier access
  - move not used icons to another folder

## [6.1.1] - 2011-03-13 U

### Fixed

- Folder "arcade\multi-games\" was not being created when creating MAME games list, crashing the frontend
- Disabled the timer in splash screen (for now) to fix a bug when creating multiple games list at startup
- Daphne games list was not being created, and the scan for .zip files was crashing the frontend.
- Funny that no one ever reported this!

## [6.1] - 2011-03-11 U

### Fixed

- Proper detection of MAMu_ icons (color depth and multiple icons inside .ico file):
  - several icons were displaying white/black background colors in transparent areas
  - only the 32x32 icon is loaded, regardless the view mode used
  - icons are now loaded using their original color palette (no conversion to 24-bit color depth)
  - added support 32-bit icons (alpha blend)
- Feature "Scan For Missing MAMu_ Icons" was not loading game name icons, only bios icon or driver icon (options "Show Game Bios Icons" / "Show Game Driver Icons" / "Reload Icons")
- Text in auto game docs window was not being moved to top when selecting games
- Access violation when trying to delete game config files (Demul system)
- Feature "Not Used Game Config Files" was not working with Demul system and "Delete Files" button was not working at all!!! (main menu "Settings", "Maintenance")
- Delete files button in "Not Used Zip Files" feature was not working at all!!! (main menu "Settings", "Maintenance")
- I totally forgot to implement the function to delete files on "Delete Clones Images" (main menu "Images", "Maintenance")

### Changed

- Convert screenshots feature re-write (main menu "Images", "Maintenance"). Replaced VirtualTreeView by EasyListView and some performance tweaks
- Updated EasyListView component to latest SVN (February 2011)
- All splitters replaced by a custom gradient splitter, easier to resize panels (main screen and others)

### Improved

- Minor tweaks
- Removed the hour glass cursor from a bunch of functions because they don't make sense
- Text in games list status bar updated to display game name, clone name and bios name: "mslug3h [clone of mslug3] [bios: neogeo]"
- Splash screen timer does not reset to zero when switching from creating games list to scanning games functions. Now you can see the total time it takes to create games list/verify your games sets
- Merged left panel populate functions into one since they are almost the same (main screen and left panel editor)
- Added column "Bios" into the games list (left panel editor) and the width of game title column is now dynamically resized
- Replaced Delphi 7 "RenameFile" function (it uses MoveFile() function) by a custom function that uses "MoveFileEx()" function... it fixes errors in Windows 7 when renaming files

### Removed

- File "\ini_files\daphne.ini" not needed anymore (Daphne v1.0 is the lowest supported version)
- Custom titles are no longer supported for image layouts feature
- Custom labels for game columns is gone (details / grouped view modes). Pointless feature...

### Added

- New text filter bar (main tool bar buttons, right side). Yep, you can filter games by title, manufacturer or driver name now. Just Type a partial description, hit ENTER key or press the apply button and BAM! :)
- Main filter tool bar buttons are partially supported: "System", "Parent / Clone", "Have / Miss", "Working / Non-Working", "Bios / No Bios" and "Hide Bios" from main menu games filters.
- There are some options buttons below the text box: "Filter by title", "Filter by manufacturer", "Filter by driver name", "Enable/disable filters on main tool bar buttons".
- Clicking on the "Reset" button will reload the main filters (without this new text bar filter)
- New setting: "Setup Folders", image category tool bar button. Easier to know where to go to setup folders
- Setting "Path to hash files" was missing in MAME settings screen
- Support for SEGA Model 2 Emu v1.0 (scripts are not yet supported, if ever)
- Support for the new mechanical tag on games list (MAME 0.141u1 and newer)
- New filter: "Interface Type" with 2 options "Classic" and "Mechanical" ("Games Filters" main menu)
- NOTE: unlike others, this setting is saved in "EmuLoader.ini" and restored when restarting the frontend
- Support for MAME 0.141u3
- Preliminary support for multi-cart games loading: megatech (MAME v0.141u3 and never only! Other emulators are not supported)
- There is a new folder listing all supported systems (when creating a games list): "\arcade\multi-games\"
... that's it for now. you cannot run multiple games with this frontend yet!!!
- Features "Scan Missing MAMu_ Icons" and "Scan Not Used MAMu_ Icons" merged into "MAMu_ Icons Manager" (MAMu_ tool bar button). Minor fixes and some optimizations were also made.
- Managing missing / not used icons is easier than ever!. Some key features:
  - rename not used icons
  - all new history system for not used icons, so you can keep track of changes made to each icon (.txt files located in "resources\icons_history\ folder)
  - when renaming a not used icon to a valid MAME game name, the icon is immediately loaded into the missing icons list
  - ability to maximize the window for better visual
-   columns width on missing icons list are saved/restored in "el_extras.ini" file
- New MAMu_ icons feature: "Switch Game Icons" (MAMu_ tool bar button). Have two game icons that you need to switch places because MAME switched two games parent/clone, clone/parent ? This is what this feature is for

## [6.0] - 2010-12-02 U

### Fixed

- Features "Run Game (Custom)" and "Run Game (Extra)" were not working at all due to wrong indexes (games popup menu)
- Emulator folders info used by EL not being reloaded into memory after accessing custom game settings (all systems)
- Default bios setting not being selected on the list (MAME settings screen)
- Feature "Not Used Zip Files" was not working correctly and other systems were fully dependable of a working MAME setup (main menu "Settings" / "Maintenance"). It's also a little faster. Again, EL is NOT a ROM manager. Please use ClrMAME or RomCenter to maintain your ROMs collection. Use it at your own risk!
- Float values on MAME custom game options were being handled as strings (cosmetic fix)
- Konami Viper game "ParaParaParadise 2nd Mix" (name: ppp2nd) was not being correctly detected
- Entries "Game Zip" / "Parent Zip" being listed with "gamename.zip not found" for Taito G-NET. This system does not use gamename.zip sets (Game Details screen)
- Unwanted horizontal scroll when selecting games in Standard/grouped view modes

### Changed

- Updated settings screen to MAME 0.140u1
- Updated FastMM library (Fast Memory Manager) to v4.97
- Game docs (mameinfo.dat and others) support only at MAME's main folder from now on
- Moved 'el_extras.ini' file to EL's main folder (makes more sense)

### Improved

- Several tweaks in the source code and user interface
- You can now select an existing file for the effect overlay, using EL's file dialog box, or type the filename into the edit box (MAME settings screen, "Options" / "Video 1" tab)
- Extra game info extracted from MAME for all ClrMAME based systems, when creating ZiNc, Demul, SEGA Model 2 games lists
- Controls info for Daphne games are extracted from MAME, if available (create Daphne games list)
- Merged "uFilesUtil.pas" routines into "uCommon.pas" (file uFilesUtil.pas no longer available)
- Auto game documents feature (preferences screen):
  - duplicate settings not allowed anymore
  - clear the checkbox to disable an info
- Relative path support for games list background image (preferences screen)

### Removed

- Support for the following systems completely removed from the project (EL is a M.A.M.E. frontend anyway):
  - AGEMAME: Merged into MAME
  - Mjolnir: Discontinued and old MAME drivers. The only game that can be fully played anyway is "Starblade"
  - PinMAME: Discontinued. Also, without the actual pinball tables, you can't play anything
  - HazeMD: MegaDrive/Master Systems games are in MAME for quite some time now, and the emulator will get no further updates
  - Another Arcade Emulator (AAE): Discontinued and its unique features might be implemented in MAME
- NOTE: you will have to re-create games list for "Demul" and "SEGA Model 2" systems
- Commented options support for mame.ini files is gone (using ' # ' char, on old MAME builds)
- Windows 7** cosmetic fixes removed from EasyListView and Virtual TreeView components as they were causing glitches
- Custom description support for image categories is gone. There's no point editing their titles anyway
- Label image info custom colors is gone
- Option "Smooth Scroll (Double Buffering)" is gone (VirtualTreeView / EasyListView). I've never noticed any difference with this setting anyway

### Added

- New setting: "Disable Icon Stretch (48x48)", MAMu_ tool bar button. Enable this option to prevent MAMu_ icons from being stretched when using "Tiles" view mode or "Standard / Grouped" view modes with "Extra Large" icons (48x48)
- New left panel filter: "Discrete Audio": filter all games that use discrete audio (create file at "Left Panel" main menu)
- Support for multiple MAME directories: "sample files", "artwork files", "font files", "crosshair files", "controller files"
- New MAME option "Run Game with Effect Overlay", games popup menu "Run Game (Extra)". You can run games with an effect overlay located in one of the artwork folders (unzipped PNG files only!). Useful to test effects without changing mame.ini
- Small reminder button in game docs panel to open the hidden popup menu (top/left)... you can call the popup menu at any position, not just this button!

## [5.9] - 2010-10-10 U

### Fixed

- Video output "GDI" setting on mame.ini misspelled (write)
- Setting "ClrMAMEPro XML Data File" not clearing after pressing "Clear" button (Emulators Setup screen)

### A few minor fixes

- The following MAME filters now sort games correctly: "Naomi", "Naomi 2", "Naomi GD", "Naomi 2 GD" (does not work 100% for Demul)
- An empty file was being created when trying to load ROMs folders if file was not found (emulator main settings file)

### Added

- Updated MAME settings to v0.139u3
- Preliminary support for a new emulator: Demul v0.5.6 (Sega Dreamcast / Naomi hardware):
  - Since its games list output is based on ClrMAME database and the emulator itself can create the file, the external "ClrMAMEPro XML Data File" is optional. If not selected, the internal "-listxml" output will be used
  - Game column's missing entries are extracted from MAME's games list, if available
  - Only zipped sets are supported (GD-ROM image must be inside game .zip file)
  - MAME CHDs (v0.139u3) are NOT supported yet (GD-ROM based games)
  - Feature "Delete Game Configs" (games popup menu) support both NVRAM files (.eeprom; .sram) - Multiple ROMs folders support (native support on Demul) - Multiple bios sets is not supported yet (and it might never be) - No support for game custom options
- New games filter: "SAMMY Atomiswave"

## [5.8.7] - 2010-06-02 U

### Fixed

- Access violation on "Not Used Zip Files" feature when MAME .zip files list is empty

### Changed

- Rollback VirtualTreeview component to version 4.7.4 as newer versions are messed up
- Replaced VirtualTreeView games list for EasyListView... "Left Panel Editor" screen only (right panel)

## [5.8.6.1] - 2010-04-23 U

### Fixed

- MAME create games list feature missing a new input type: "keyboard"; also, the new DVD-ROM CHD media type was not being correctly assigned

## [5.8.6] - 2010-04-22 U

### Fixed

- Website addresses updated on main menu "Help" / "Visit Homepage"

### Improved

- Updated components VirtualTreeView to v4.8.6 and EasyListView to v2.1.0 (latest SVN)
- Front-end updated to meet some of the component's changes

### Added

- New mame.ini options for MAME 0.137u1 (MAME Settings / Options / Input tab)
- New debugger option "Internal Debugger" (MAME Settings / Options / Miscellaneous tab)
- New games filters: "CHD DVD-ROM" (CHD sub-filter); "System 246 / 256" (main filter); "Namco System 246 / 256" (Namco sub-filter)

## [5.8.5] - 2010-02-12 U

### Fixed

- MAME game titles ending with ", The" were being wrongly parsed and the following game titles are fixed:
  - ssideki4
  - lastblad
  - lastbladh
  - lastbld2
- HazeMD and PinMAME game titles ending with ", The" fixed. The full title is now parsed correctly
- Game title fix not needed for systems based on ClrMAME Pro .xml database files (ZiNc, SEGA Model 2, AAE)

## [5.8.4] - 2009-12-26 U

### Added

- Support for MAME v0.135u4 new feature: "Number of Processors" (3rd video tab, "MAME Settings" screen, "Performance")
- In Emu Loader, this feature lists all CPUs that Windows detects. Info taken from Windows registry:
"HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\"

## [5.8.3] - 2009-09-28 U

### Fixed

- Some weird user messages in "Not Used Zip Files" feature (main menu "Settings" / "Maintenance")
- Delete/move selected files in "Not Used Zip Files" and "Not Used Game Config Files" features was freezing after removing items from the list
- User selected bios was not being added into the command line (MAME, multi-bios games)
- Front-end freezing after running "BlinkBkEdit() function". It was using "GetTickCount()", not accurate on new CPUs (Core2Duo, PhenomII, etc). "No one reported this since the function was added... FATALITY!"
- Replaced by "Sleep()" function that can handle microseconds. Other functions do not require this.
- Function "Export Games List" was only working for "standard" and "grouped" view modes (left panel popup menu)
- Again, no bug reports :_((

### Changed

- Updated EasyListView/CommonLibrary to latest SVN source (August 10, 2009)
- File "\docs\el-readme.txt" updated with latest changes
- FastMM library updated to version 4.94

### Improved

- Minor tweaks in the user interface and source code

### Added

- New feature: "Delete Game Config" (access on games popup menu or "Sift+DELETE" hot-key)
- Use this to delete CFG/NVRAM files from MAME based emulators, NVDATA file from SEGA Model 2, CFG file from ZiNc and Another Arcade Emulator (AAE)
- When selecting one game, you are able to check/uncheck files. When in multi-selection screen, all games will be listed and you will be able to check/uncheck what files you want to delete or keep. Also, use the "Check All CFGs" / "Check All NVRAMs" buttons to check/uncheck all files for all games
- Daphne system is not supported by this feature, and there's no recycle bin support!
- New feature: "Not Used Game Config Files" ("Settings" main menu, "Maintenance")
- Scan all systems for not used configuration files (cfg and non-volatile RAM). It works similar to the "Not Used Zip Files" feature. All systems supported, except from Daphne

## [5.8.2] - 2009-07-16 U

### Added

- Support for MAME v0.132u5

## [5.8.1] - 2009-07-04 U

### Fixed

- EL standard game icons were not being reset after disabling MAMu_ icons (EasyListView view modes only)
- Adding .zip files as folder in the select directory screen is back... :_((
- I thought I had it fixed but I was wrong. The only way to really get rid of this annoying bug is to disable the "zip as folder" feature in Windows (who uses this annoying feature anyway ???)
- MAMu_ icon was not being loaded at startup on the selected game

### Changed

- Not used 24x24 icons removed from several .ico files ("\resources\main_icons\arcade_filters\" folder)
- Some icons in "resources\main_icons\" folder also changed

### Improved

- ImageIndex value is not assigned directly into main games list anymore (game icons)
- Minor and invisible bug fixes

### Removed

- Play custom from arcade controller layouts since it has been removed from the front-end quite a while ago
- Support for the hidden "\arcade\customgames.el" file

### Added

- "Triforce" main games filter
- New thumbnails setting: "Show Game Title". Disable this option to hide game titles while in thumbnails view mode (main menu "Settings" / "Thumbnail Settings")
- Added some missing widescreen resolutions to MAME and ZiNc settings screens (resolution drop-down buttons)
- Move folder up/down buttons on the following screens: "MAME Settings", "ZiNc Settings", "SEGA Model 2 Settings", "MAMu_ Folders"

## [5.8] - 2009-06-02 U

### Fixed

- Taito G-NET games being set as found with missing ROMs/CHDs when the bios set if found and ok, but the CHD is missing
- This is a special case to avoid all G-NET games being set as missing ROMs/CHDs since this system only use a bios set. The Konami Viper system is similar but some of its games have a game set...
- View game details was being called while multiple games selected
- Left panel editor not working if MAME binary file is not defined
- Selected game not visible on screen when switching between windowed/full screen modes
- Wrong system being scanned: "Scan For Missing MAMu_ Icons / Images";
- Columns width in hidden games editor were not being updated correctly after manual resize

### Changed

- Delete game files improved (single/multiple selection). Now you have a files list of the game (Game .zip and CHDs). CHD files are unchecked by default for safety (enable the "Always Select CHD - Files" checkbox so they are checked automatically).
- Only files that are found will be listed, even if the games is set as available. You can uncheck any file(s) you want to keep :-))
- NOTES:
  - for single selection, the amount of CHD files is unlimited but for multiple selections, they are limited to 3 (three) CHD files per game. If appear a game in MAME with more than 3 CHD files, the front-end will be updated...
  - The multiple selections screen is a little more complex, but filled with hints all over it
  - Recycle bin is NOT supported so, be very careful on the game files you want to delete!
  - Only available games and found games with missing ROMs are supported
  - This feature is accessed by selecting one or more games and hitting the "DELETE" key or using the "Delete" option in games popup menu
- Replaced all select folder dialog calls by EL's custom folder dialog
- Updated EasyListView component to latest SVN sources
- Moved debug.ini custom options (Set/Delete) to "M.A.M.E. Only" sub-menu (games popup menu, "Custom Options")

### Improved

- No more zip files or hidden folders in browse for folder dialog
- Generate .ini files for left panel is now based on the main games list, except "Refresh Rate" (still depends on MAME's -listxml output)... they are lightning fast too (main menu "Left Panel")
- Minor UI optimizations

### Removed

- Option "Enable Multiple Selection". Multi-select is always enabled
- Daphne v0.99.7 pre 5 support removed

### Added

- New file when creating MAME/ZiNc games lists: "mame_chd.ini" and "zinc_chd.ini" ("frontend\arcade\" folder)
- It contains a list of all CHD files for each game and the specific media type for each CHD (in case a game use more than one CHD file and each of these files are in different formats (hard-disk, CD-ROM, GD-ROM, flash cards, etc...)
- This file is used when deleting game files and might be used on other features for a quicker access (acessing "\arcade\systemname_roms.el" is slow if the file size is too large!)
- Support MAME 0.131u3 new .ini files "horizont.ini" / "vertical.ini" (games popup menu, "Custom Options" / "M.A.M.E. Only")

## [5.7.6] - 2009-05-08 U

### Fixed

- Detection of large files (bigger than 1.7 GigaBytes) and sorting "file size" columns was not possible due to the range of the "integer" variable type... updated all required variables in the project to "Int64" (64-bit integer)
- Option "Move Selected to Folder" implemented (scan not used MAMu_ icons feature, popup menu)
- When selecting parent or using the find game edit box in "delete multiple games files" window, the previous selections were not being de-selected (games popup menu, "Delete" / "Game File")
- All available Taito G-NET clones were being added in the merged sets list. Probably other games that use a bios set but no game set is being added in the list as well (not fixed)

### Changed

- Simplified "delete multiple game .zip files" feature. No more checking games to delete. To keep any game just remove it from the list using the "Remove Selected" button
- Scan for not used MAMu_ icons only scan ".ico" files from now on... file "\ini_files\el_mamu_exclude.ini" updated to only list files with .ico extension

### Improved

- Updated function "GetFileSize" (uFilesUtil.pas) to use Int64 (64-bit integer variable)
- Files list of "delete not used zip files" feature now have columns that can be sorted (main menu "Settings" / "Maintenance" / "Not Used Zip Files")

### Added

- A couple more details in the CHD info (game details screen, left panel)... also, file size for game .zip and .chd :)

## [5.7.5] - 2009-05-04 U

### Fixed

- Game status not being updated after scanning games (only between "missing" and "found with missing ROMs/CHDs" status)
- Main screen not being set active after exiting a game
- The "Played x" captions in tiles view mode were being loaded without using virtual mode after exiting a game
- Convert snapshots feature now support and rename up to 100 images per game
- Scan games feature was not handling games with missing ROMs/CHDs correctly
- Wrong CHD media type for some ZiNc games
- ZiNc games set as available when all ROMs are found but .zip files are not in the same folder (not valid for ZiNc emulator). All files (.zip / .chd) must be in the same folder, but the .chd file can be placed in a sub-folder with the name of the gamename (like MAME). You do not need to add this sub-folder into the ROMs paths!
- Remember that EL support multiple ROMs folders, even if ZiNc doen't, but to run games, all files of a particular game must be in the same folder and NO MERGED sets!
- A few games filters fixes (you need to create MAME games list again to apply them):
  - CHD tags "scsi0" and "scsi1" are moved to "CD-ROM" media type ("\ini_files\chd_mediatypes.ini" file)... for now. This fixes all Konami System 573 games that were being set as hard-disk based games instead of CD-ROM
  - Konami Viper games were wrongly tagged as "Hard-Disk" CHD types. Changed them to "Compact Flash Card"... hard-coded into the "uMain.CreateGamesListXML" function!
  - American Laser Games were wrongly tagged as "Hard-Disk" CHD types as none of the discs are dumped yet. Changed them to "LaserDisc"... hard-coded into the "uMain.CreateGamesListXML" function!
- Taito G-NET games were not being correctly detected due to not using "gamename.zip" files, only bios sets. But now, games that you do not have the .chd file are set as found with missing ROMs (Taito G-NET only) :_((
- ...some other games do not use "gamename.zip" as well but are not on this fix ("Konami Viper" system)
- Visual bug in the message box when vertical scrollbar is visible
- The current favorite profile was not being correctly selected when opening the favorites profile editor
- Image resampler not being applied at startup and when switching between classic/layout image view modes
- Merged games were not being added into the merged list ("\arcade\systemname_merged.ini")

### Changed

- All ZiNc icons renewed
- Only 1 system support for "Scan Missing Images / MAMu_ Icons", "Scan Not Used Images / MAMu_ Icons"
- ...old screens with TreeView and multiple systems at once was a mess :_(
- Scan not used MAMu_ icons: changed popup menu option "View Excluded List" to "View/Edit Excluded List" so you can edit and use the updated files list in real time ("\ini_files\el_mamu_exclude.ini" file)
- New setting in popup menu on scan missing MAMu_ icons screen: icon size 16x16 or 32x32 :)

### Improved

- Games details screen:
  - CHD files are always audited in games details screen, no matter the status of the game
  - The parent CHD info is displayed in the ROMs list if the CHD of the clone game is not found but the parent CHD is (only if filenames are different)
  - Header version info for older CHD files (versions 1 and 2) are still displayed, but are not supported by the front-end
- Minor optimizations to the scan results screen
- Changes and optimizations in customize hidden games screen (main menu "Games Filters" / "Hidden Games" / "Customize")
  - Search patterns and columns width are saved in "el_extras.ini"
  - Games are now validated by "game name" and "system ID" tags only (no "clone of" anymore... kinda pointless)
  - Removed "Delete Duplicates" button. Done automatically when using "BEGIN SEARCH" button
  - All lists replaced by EasyListView components (cleaner and easier to work with)
  - This feature is main games list dependant now. External files ("\arcade\*.el" and "catver.ini") are no longer used to build the list in the editor. The scan is NOT affected by the main games filter
  - New layout :)
  - Fixed loading hidden games into the editor (very old bug!). It was not checking for the system tag. If there's a game with same name on different systems, they would all be added
  - System icon displayed with game icon on the first column
- Feature scan audio samples optimized and UI updated
- Other features are also dependant on the current main games list instead of "\arcade\*.el" and extras. Main games list is processed twice as fast and the progress bar became reduntant...
  - "Scan for Missing Images / MAMu_ Icons"
  - "Scan for Not Used Images / MAMu_ Icons"
  - "Left Panel editor"
  - "Scan Audio Samples"
  - "Customize Hidden Games"
  - "Not Used Zip Files"
- Heavy optimization on add/delete games to/from favorites/hidden list functions (10000 items in 2 seconds!)
- Tweaks and optimizations to EL's custom select file dialog (virtual mode)

### Removed

- An extra (and invisible) background for the icons was being draw on top bars (all screens)... guess I forgot to remove it from the source code
- Revised and removed some more reduntant lines of code in the entire project

### Added

- Disk entry detection when creating games list for systems that use ClrMAME's external XML databases
- Support for ROMs list on ZiNc (based on ClrMAME XML file). EL can detect missing ROMs/CHDs on this system now ("\arcade\zinc_roms.el") :)
- Get the ClrMAME XML file at Logiqx website (ZiNc v1.1 only!). The missing data is extracted from the MAME games list (if available).
- Also updated file "\ini_files\zinc.ini", split in 2 sections: "[driver]" and "[gameindex]"
- That makes Daphne the only system without ROMs list support...
- Support for ZiNc bios entries. Now you have "parent / clone / bios" games IDs. The ID for all other systems were re-arranged, except MAME. You must re-create games list for all systems, except MAME. Also added 2 new icons for the ZiNc bios: "ZiNcBios.ico" and "UnZiNcBios.ico"
- Note that you cannot run ZiNc bioses, this is only to improve games scanning...
- New option to scan all games with missing ROMs/CHDs (games popup menu, "Scan Games" / "Missing ROMs/CHDs")
- Support all systems, except Daphne
- Support for MAME 0.131

## [5.7.4] - 2009-03-21 U

### Fixed

- Image resampler not working with layouts view mode

## [5.7.3] - 2009-03-21 U

### Fixed

- ROMs were not being shown correctly in game details screen, when tagged with bad checksum (ROMs List)
- Media type of CHD based games was not being set correctly when creating a MAME games list
- Single game scans were not updating the games list file (.el) correctly in some cases
- After adding/deleting games to/from favorites/hidden games list, the memory vars were not being updated with the new game selection
- Found ROMs info in game details screen was not including CHDs with bad checksum
- Main window out of focus after exiting MAWS game info

### Changed

- CHD files are verified thru its SHA-1 checksum now (header version 3 and 4). Unfortunately, CHD files that use a header version 1 or 2 are not supported by the front-end anymore!
- You must create your MAME games list again

### Improved

- MAME CHD files are correctly validated now, by detecting the "MComprHD" tag and the header version. If the tag doesn't exist, the CHD file is set as invalid, and the MD5/SHA1 checksum is not verified
- Game details UI changed a little bit. CHD files are also listed in the "Game Files" section. It shows file found or missing status, and the version of the header next to it... :-))

### Removed

- Option "Generate ZiNc Driver File" from main menu "Settings" / "Maintenance"... no use for it anymore

### Added

- Support for MAME 0.130u1
- Detection of the new version 4 header (CHD files). Headers version 1 and 2 are no longer supported by the front-end
- New CHD type added: "PCMCIA" in "\ini_files\chd_mediatype.ini" (used when creating MAME games list)
- New games filters added: "Taito G-Net System" and "CHD - PCMCIA"

## [5.7.2] - 2009-03-15 U

### Fixed

- Image resampler is updated correctly when switching between view modes (classic, layouts) and it is applied to all panels when in layouts view mode
- Selecting the already selected image resampler, the item was being set as unchecked
- Internet link for MAWS game info updated to the mameworld.info server
- Expand/collapse buttons on left panel tree were being disabled after toggling alpha blend
- Image resampler correctly set at startup
- Access violation on scan for missing images, missing MAMu_ icons, not used images and not used MAMu_ icons
- Fatality! Evil Bug Wins... Game was not being properly re-selected after changing games filters...
- CHD filename was not being shown correctly at game details screen if CHD name also contains the parent name ("_parentchd_" tag)
- Year and manufacturer were not being detected on bios entries, leaving these infos blank in the games list (MAME based emulators)
- Features to create .ini files for the left panel were missing a few games that has no information ("Left Panel" main menu)

### Changed

- Removed minimum size limitation from the screenshots panel
- Main menu / popup menus font changed from "Segoe UI" to "Trebuchet MS"
- Updated the convert snapshots to EL format feature. Only works with the "Gamename/Increment" naming format

### Improved

- Alpha blend and background color on all TreeView lists that contain a games list are updated to match the settings of the main games list, except background image (hidden games list, MAMu_ missing icons, left panel editor, games list font settings and some ListView lists)
- This also improves visibility if using dark background color
- Selection bars colors and texts optimized for a large range of background colorsSome code merging to remove duplicated functions/procedures
- Added a button in left panel editor's toolbar to restore default sizes for window, panels and columns width

### Added

- Button at preferences screen, "Folders" tab: "Setup Image Categories Folders", for those who cannot find the folder setup screen in main menu "Images"
- Setting: "White Text Color (For Dark Backgrounds)" that will paint selected text in white-ish instead of the blue/red colors. It works only when alpha blend is enabled (preferences screen)
- New games filter in main tool bar buttons: "Game Orientation" (Horizontal / Vertical)
- New menu item in game documents popup menu (mouse right-click): "Customize Panel". A shortcut for those that do not know about it ;)
- Support for MAME v0.130... CHD files can be at any folder now. The old "romfolder\gamename\gamefile.chd" method is still supported. I'm moving my 3 images to "c:\mame_roms\chd_files\" folder :)
- NOTE: you still do not need to set folders for CHD files if using the old method
- A few more options to create .ini files for the left panel:
  - Screen refresh rate
  - Year
  - Manufacturer
- Search keywords in hidden games editor is now saved/restored in file: s"\ini_files\hidden_games_keywords.txt"

## [5.7.1] - 2009-02-18 U

### Fixed

- Some default front-end settings on a fresh install were incorrect (first run)
- Colors of selected items (EasyListView and Virtual TreeView) were being set incorrectly
- Selected game not being visible on the screen when in grouped view mode
- Selecting next image category/layout with hot-key F10 was not working. Now changed to:
  - Ctrl + F9 -> show previous
  - F9 -> show next
- The array "image[???].NoImageLoaded" was not being reset correctly when the image to be loaded is not found
- Some arcade controller hot-keys were not working. Also, keys assignments were changed to simplify future updates and to use similar buttons on all controllers (Browse games with arcade controller feature)
- Message about average FPS and error messages before running games showing for systems not based on MAME
- Removed code redundancy and fixed possible bug when editing column settings in the customize columns screen
- Some system specific items in games popup menu were enabled when they shouldn't. Also, they are now hidden instead of disabled
- UI bug in custom command line settings screen (paremeters list)
- Width of left panel is automatically adjusted when resizing it. Horizontal scrollbar is not needed anymore

### Changed

- View ROMs paths have its own screen and you can view folders for all systems at once
- Added a new screen for "games list font settings" more detailed and moved it from preferences screen to main menu "Games List"
- Moved "Image Category / Layout Auto Switch" setting from images popup menu to main menu "Images" (easier to find)
- Delete multiple games files improved:
  - added support for games with missing ROMs (.zip found but game set as missing)
  - added a checkbox on each game so you can uncheck all games you want to keep
  - changed component to EasyListView
  - view mode is set to tile and it shows in 2 lines:
    - first line is the game's title
    - second line is "game name [clone of], zip file with full path

#### NOTES

- if game is merged, it will display "merged [parent zip file with full path]" - if game is marked as missing ROMs/CHDs it the selection bar is red - font settings are applied on this list (parent, clone, preliminary, miss ROMs/CHDs) - Zip files are Merged games and games where the .zip file is not found are unckecked by default

### Improved

- Daphne folder is now loaded into RAM to simplify a few functions calls
- Optimized a few functions in uCommon.pas file and removed some redundant coding
- More source code optimizations:
  - Like in EasyListView, all general functions and procedures for VirtualTreeView will begin with "VTV_" to group all of them into one place and to make it easier to read
- Games have their defined fonts and selection bar colors on hidden games editor and left panel editor :)
- Optimized hot-keys for games list and arcade controllers (when feature is activated)
- Selection bar turns red on current selected filter (MAME Games Filters screen)
- Updated EasyListView component to latest SVN source that fix a couple UI bugs

### Removed

- Main menu / popup menu themes is no more. Only the default theme is available from now on
- Setting "Bold Font In Selected Game" is gone. Font of selected items are always in bold style
- Selection bar colors customization (preferences screen). Only fixed colors are supported, blue for have/miss games and red for games with missing ROMs/CHDs (red ribbon might be used on other screens, but for a different situation)
- procedure uCommon.GetGamesFilesList() and function uCommon.ExtMatch() deleted as they are not being used anywhere
- Alpha blend for EasyListView / VirtualTreeView components have a fixed factor of 128 from now on (half alpha blend)
- Background color of sorted column is gone (games list treeview). No need since you have the sort icon in the header (ascending/descending)

### Added

- New main menu "Settings". This menu item will hold several front-end settings
- Menu items moved to the new settings main menu:
  - All items from main menu "Advanced User" (main menu also removed)
  - "Favorites - Profile Settings" moved from "View" main menu
- New feature: scan for not used zip files (main menu "Settings / Maintenance")
- Use this to list all .zip files that are not being used by any game (all systems supported)
- **WARNING**: if you share ROMs with different emulators on the same directory, take extra careful when deleting files. Recycle bin is NOT supported by this feature
  - You can choose to delete files or move them to another folder
- Support for SEGA Model 2 Emulator v0.9 and its new settings (emulator.ini)
- Features "delete current image" and "rename current image" support all 3 image panels when image layouts view mode is enabled (images popup menu, mouse right-button click)
- I finally found a way to verify what image component is calling the popup menu!!! :-))

## [5.7] - 2009-01-26 U

### Fixed

- Cheat settings updated to latest MAME build (MAME Settings screen)
- Access violation when using Hidden Games feature and the file "hidden_games.ini" does not exist
- Image info panel:
  - appearing when switching from layouts view mode to classic view mode, when setting is turned off
  - not being emptied when no image is found -> not updating its text after turning on/off
- Scan audio samples feature was not working (main menu "Games List"). Apparently nobody use this thing because I never got any bug reports on this bug
- "Danger Will Robinson... DANGER!"
- Columns profile editor load/save was not working correctly and, when closing the editor while viewing a different profile than the actual profile being used on the games list, this new profile was being set and messing up data for all columns when opening the columns editor again.
- And even more disturbing... nobody reported this fatal bug for the last 18 months!
- Pixelated game icon on several screens. Also, they are now displayed directly into the TImage32 canvas :-))
- Select file for left panel editor was not working correctly (custom EL select file dialog)
- Glide renderer config now load/save keys settings (file "glide_renderer.cfg", ZiNc settings screen)
- Glide renderer detection was not working, making EL load/save settings on the wrong renderer CFG file (ZiNc settings screen)
- Some minor bugs in the favorites profiles editor
- A bunch of small fixes everywhere... mostly UI
- Transparency (alpha channel) and smoothness were not being applied corretly on any top and bottom bars
- Incremetal search still working on EasyListView when "Control Games List With Arcade Controller" is enabled
- Access violation when auto-selecting an item in TColorBox component if its OnSelect event is empty
- Filter for "Sega System 24" was not showing any games (driver name on newer MAME builds have changed)

### Changed

- Several files renamed ("resources\main_icons\" folder)
- Minimum screen resolution increased to 960x600 (16:10)... but you still can use EL at 800x600
- I recommend 1024x768 as minimum resolution as this is a Windows application, not for arcade monitors
- Front-end main icons reduced to 16x16 (tool bar icons are still 24x24)
- Virtual TreeView component updated to v4.7.0 and to the latest SVN version
- EasyListView component updated v2.0 and to the latest SVN version
- Menu theme "Office 2007" renamed to "Default", but .ini entries remain the same
- Several changes to columns profiles feature:
  - Default profile name changed from "default.ini" to "col_profile_general.ini"
  - Columns profiles folder is no more. All files will be saved in "resources\ini_files\" and must begin with "col_profile_systemname.ini"
  - Profiles editor only works for the selected system (no more editing profiles for multiple systems at once)
  - Only 2 profiles are available for each system: "General" for all systems (default) and "System" that can only be used by the selected system
- View emulator versions and games list versions replaced by a new and single screen "File Versions" (main menu "View")
- User interface on several screens are changed and lots of controls were replaced to simplify future updates in EL
- Updated FastMM to version 4.9.2 (several fixes and full support for Delphi 2009)
- Moved image layouts feature (title edit and visible layouts) and image category settings (category titles, visible categories and folders settings) from preferences screen to a new "Category / Layout Settings" screen that can be accessed from main menu "Images", "Category / Layout Settings"
- This has been done to merge all features in one place and for easy access. Also to improve loading time of preferences screen at startup and remove all these ListView components from sitting idle in RAM without reason
- Moved "Control Games List With Arcade Controllers" from preferences screen to main menu "Games List" and renamed it to "Browse Games With". To disable this feature just select "Keyboard + Mouse"
- Moved "Auto Rename Snapshots To Old Format" from preferences screen to main menu "Images". These 2 settings are enabled by default and are for conveniece only. If you want to keep MAME snaps original filenames, disable it

### Improved

- Optimizations to popup menus (context menus), main menu, UI and a bunch of common functions
- Aut-select previous/next visible game instead of the top game in the list after using certain features: selete game, add/remove favorites and hidden list
- Converted a lot of functions into procedures since they do not need to return a confirmation value. Don't know if this saves memory or if the reduced memory usage is relevant
- Some error/warning message boxes replaced by a blinking background in edit boxes (left panel editor screen, favorites profiles screen, emulator setup screen). Other features will use this new function in the future
- Optimized the icons loading at startup and merged a couple "ImageList" since they use the same icons
- Some settings on EmuLoader.ini have been simplified and merged. Some other entries renamed
- All ListView components replaced by EasyListView since it's safer and far easier to work with. By doing this, several functionality and visual bugs were fixed
- Height of top and bottom bars reduced
- Browse for folder (multiple folders) dialog box now have a "Include Subfolders" checkbox and the dialog was completely coded from scratch.

  **WARNING** If you have "view zip as folder" feature enabled on your OS, when opening a folder with lots of .zip files, the dialog will take some time to read sub-folders and display them on the screen. The only way to fix this is to disable "zip as folder" from Windows. Google it and you'll find out how to do that

- Browse for folder (single) and select file dialog boxes optimized to reduce redundant lines of code
- Removed the "Close" button command from several screens since the TButton component have a "ModalResult" property that closes the form automatically without a single line of code
- MAME "snapshot_directory" entry in "mame.ini" is updated automatically when closing the new "Image Category / Layout Settings" screen (all MAME based systems, if they are available)

### Removed

- Left-overs in "EmuLoader.ini" from previous builds
- Some unused icons ("resources\main_icons\" folder)"
- Unused variables and old codes thru the entire project (some functions are still there, commented out)
- AnotherArcadeEmulator settings screen removed completely from the project

### Added

- Filter: "Missing ROMs/CHDs" (tool bar button "Have / Miss Games")
- Select this filter to display all games that have one or more missing ROMs/CHDs
- Feature: Customizable font for games found with 1 or more missing ROMs/CHDs (preferences screen, "Games" / "Games List" tab, "Font Settings" box, "Missing ROMs/CHDs").
- Games where the .zip was found but there are ROMs or CHDs missing, will be displayed in a different font. It uses the same files as the "Scan Results" feature (games popup menu)
- Not all systems are supported!
- PinMAME system is back (only Win32 binary is supported)
- NOTE: I am NOT adding native support for "Visual PinMAME" tables so please, do not ask
- New files added for PinMAME
- Setting: "New Emulator Binaries Detection Enabled" (preferences screen, "General" tab, "Miscellaneous" tab, "Startup" frame box)
- Disable this option to prevent the front-end from verifying the checksum of available emulators, for a faster start (enabled by default)
- Images tool bar buttons:
  - toggle classic/layouts view mode
  - delete snapshot of selected category (classic view mode only)
- New .ttf font: "Consolas", used in the project (this font is way better than "Courier New")
- The window position and size is restored on left panel editor screen ("ini_files\el_extras.ini" file)
- Support for MAME 0.129u2 including new CHD types: "Video Home System" and "Compact Flash Card"

## [5.6.2] - 2008-10-22 U

### Fixed

- Front-end crashes on some systems with Vista x64 and 4GB RAM

### Changed

- Updates to "\ini_files\mame_filters.ini" file
- Disabled AAE setup screen to avoid messing with "aae.ini" file and due to the fact that you can configure the emulator directly in its own menu (why re-invent the wheel, right ?)

### Improved

- Some minor improvements on some screens and popup menus

### Added

- Expanded the "CHD" games filter with more options:
  - "Hard-Drive" -> games that use a hard-drive device (ide, scsi, disk)
  - "Laserdisc" -> games that use a laserdisc media
  - "CD-ROM" -> games that use a CD-ROM media
  - "GD-ROM" -> games that use a GD-ROM media
- New file to detect CHD correctly based on new CHD filters: "\ini_files\chd_mediatypes.ini".
- This file contains a list of tags found on MAME's "listxml" output, and it's a temporary fix. If there is one or more tags missing, you can add them into this file
- New Sega games filters:
  - Sega Naomi GD-ROM
  - Sega Naomi 2
  - Sega Naomi 2 GD-ROM
- New files:
  - folder: "resources\main_icons\arcade_filters\"
    "chd_hd.ico", "chd_laserdisc.ico", "chd_cdrom.ico", "chd_gdrom.ico"
    "naomigd.ico", "naomi2.ico", "naomi2gd.ico"

## [5.6.1] - 2008-08-07 U

### Fixed

- Could not select .avi file to record with MAME
- Setting debugscript was being saved as comment if value is empty (MAME settings)

### Changed

- Read/write emulator/game full setting only works on MAME and AGEMAME. All other emulator have support for paths only (this is for MAME based emulator only!)

### Improved

- Left panel files can now handle any word surrounded by asterisks. They will be converted into sub-nodes.
- The section "[ROOT_FOLDER]" is not required anymore but if this section is not found, it will be added automatically (required, so the tree nodes can be created correctly)

### Removed

- Support for "optionXx (NULL) (not set)" entries from MAME based emulators (mame.ini)
- This means that configuring old MAME/AGEMAMGE builds and HazeMD/Mjolnir emus with EL is no longer possible (I might do something about that in a future version, but can't promisse anything)

### Added

Support for MAME 0.126u3

## [5.6] - 2008-06-01 U

### Changed

- Create games list for "SEGA Model 2 Emu v0.8a" and "AAE beta 1 update 5" emulators are updated to use the new XML files from Logix (ClrMAMEPro).
- Old .dat files are no longer supported!
- AAE and SEGAModel2 games lists must be created again due to changes in the ROMs IDs (games list files)

### Added

- Support new settings for MAME 0.125u8
- Support for SEGA Model 2 Emulator v0.8a. Emulator settings screen updated, but unfortunately the format and comments of "emulator.ini" file cannot be maintained

## [5.5.1] - 2008-05-23 U

### Fixed

- Option "Enable Image Label Info" not being disabled at startup
- Access violation when viewing MAME game faqs (auto game docs)
- Load/save MAME input, load MAME savestate was not working. Also removed warning message when hitting the cancel button

### Added

- Support to create AVI output with MAME 0.125u1 (games popup menu)
  ... files always created in "multimedia_files\" sub-folder of MAME's "snap" folder
- Re-added empty bios value support (MAME settings) using a new checkbox named "Default = Empty Value"

## [5.5] - 2008-05-13 U

### Fixed

- When exiting MAWS view, games list focus was not restored
- MAME ini files not being generated when setting emulator options from "Emulator Setup" screen, making settings all messed up
- Error when loading image background in treeviews and listviews if file does not exist
- Bug that did not always minimized the front-end when running games (when feature is enabled)
- Weird bug when running Model 2 emu. Front-end window is now restored correctly
- Vista taskbar / Vista Flip3D previews now show correctly when the front-end is minimized... yay!
- Game name in status bar not properly set when switching between games filters
- Minor visual bugs

### Changed

- All MAME WAV/MNG files are now created in the same folder: "mamesnaps\multimedia_files\"
- No more folder restrictions for MAME playback/record input and save state files

### Improved

- No need for the arrow in drop-down buttons anymore (tool bar buttons)
- Feature "select parent game" does nothing if parent is not found or is hidden
- Save file dialogs merged and simplified

### Removed

- "Delete .wav / .mng Files" popup menus
- Custom MAME wave output folder (preferences screen)

### Added

- Support for LCD screen type when creating MAME games lists (no support in screen type filter though)
- Incremental search by game name now works for view modes that use EasyListView
- Support for MAME 0.125

## [5.4.1] - 2008-03-23 U

### Fixed

- Menu theme, font color of selected item was not being applied
- Snapshots not always displayed after image panel was set empty
- Scan for missing icons was not running games in some view modes
- Games list not being correctly sorted (left panel editor)
- Access violations in scan missing/not used icons/images

### Changed

- Scan for not used images. Only files that are not used by any games are removed

### Added

- New setting: "Auto Rename Snapshots to Old Format" / "Delete Files After Rename" (preferences, "Images" / "Categories" tab)
- This will automatically rename snaps from new MAME format "\gamename\0000.png" to the old format used by the front-end "full_gamename0000.png". Click on the "help" button next to its checkbox for a more detailed info... disabled by default

## [5.4] - 2008-03-07 U

### Fixed

- Select parent game was bugged
- Access violation with columns profiles if a column index is invalid
- Several visual bugs
- Button "Resize screenshots area" was not working correctly in some layout
- Prev/next images browse buttons were bugged (blue ones)
- Image types auto cycle feature not working in some cases
- Add/remove to/from favorites/hidden list was not working right
- MAME features: "record .wav; .mng"; "record/play .inp; .sta" was not working. Funny no one reported this... does anyone use these features ? :(
- Button "Clear Selected" not working in "Delete Multiple Games Files"
- Several cosmetic fixes (too many to list)
- Open picture dialog, replaced by open file dialog

### Changed

- Image type is now known as "Image Category". Entries in "EmuLoader.ini are changed as well
- Renamed "Show Command Line Before Running Game" to "Run Game Confirmation Dialog" (main menu "View")
- Renamed "Auto Cycle Previous/Next Image Types" to "Image Category Prev/Next Auto Switch" (images popup menu)
- Column "Description" renamed to "Title"
- Renamed "Resize screenshots area" to "Center Splitters (Resize Images)" (images popup menu)
- Feature "Automatic Game Documents" is now called "View Game Documents"
- You cannot rename image files while in layouts view
- Replaced game documents toolbar panel by a popup menu (mouse right-click)
- Moved "\resources\msgbox_icons\" folder to "\resoureces\images\msgbox_icons\"

### Improved

- Columns positions ([Position] section) are not saved in profiles if their positions are same as default... to prevent further errors
- Major rewrite on prev/next image buttons. Only sequential image filenames are supported from now on, meaning you no longer can have gaps in filenames like:
  "galaga.png"; "galaga0002.png"; galaga0008.png"
- These files must be renamed as:
  "galaga.png"; "galaga0000.png"; galaga0001.png"
- Even more source code cleanup and optimizations (again and again and again!!!) ^-^
- Systems filter menus (toolbar button and main menu "Games Filters") are only visible if the emulator and games list are valid)
- Face lift and optimizations on all screens and some features

### Removed

- System view mode is gone. To view games by system use the system filter (main toolbar buttons or "Games Filters" main menu)
- Feature "Open in a window" (view game documents) is no more
- File "\resources\images\NoSnapshot.png" is no longer used. A blank image panel is displayed when no valid screenshot is found (for the 1st image only)
- Tray icon is no more. EL now stay minimized when running games. Tray Icon component is also removed from the project
- A bunch of images from "\resources\images\" folder and sub-folders (not used anymore)
- Several icons from "\resources\main_icons\"folder that are not used anymore
- Option: "Blend Clone Icons in 50%"

### Added

- Support for MAMEUI games icons
- Large icons, small icons, tiles view modes are back! (EasyListView v1.72)
  - Everything works, except the following limitations / bugs:
    - No virtual mode to keep it as simple as possible
    - Incremental search does not support searching by game name
    - Visual bugs that cannot be fixed (EasyListView's fault)
    - No support for arcade controllers to navigate in the games list (still working on a solution for this one!)
    - No hot-keys support for some actions
  - Some visual tweaks were added (preferences screen, "Games List" tab):
    - "Gradient Selection Bar", a nice customizable gradient bar. Thumbnails view looks awesome with this...
    - "Selected Full Item Paint" will select the entire cell (text + icon)
- Thumbnails view mode! (EasyListView v1.72)
- This is an experimental feature. Only game snapshots are supported
  - Feature:
    - Custom settings (main menu "View", "Thumbnail Settings"):
      1. Size scale from 90x90 to 400x400
      2. Enable/disable border and color customizable
      3. "Show Parent if Thumb Not Found": Load parent snapshots if clone snapshots are not found (enabled by default)
    - All thumbs are processed within threads for faster loading
    - You can delete game snapshots directly from this view mode. Just select all games you want and use the new "Delete Selected Game Snapshots" option in the games popup menu, new "Thumbnails" sub-menu
    - MAMu_ icons are not displayed in this view mode
    - Reload selected Thumb (games popup menu, "Thumbnails" sub-menu)
    - Reload All Thumbnails (games popup menu, "Thumbnails" sub-menu)
    - Images preview and game documents are disabled in this view mode. To convert snapshots, use the "Convert Snapshots" menu item from the "Thumbnails" sub-menu (games popup)
    - Games filters are fully supported, including the left bar
  - NOTES:
    - If you keep switching between thumbnails and other view modes very fast, EL might crash
    - This feature use A LOT of memory when viewing all games. About 240MB to load one thousand images, at 125x125 size. The bigger the thumbs, more memory will be used
    - Thumbs are loaded only when games appear in the screen for the fist time to save memory, if you are using a filter with only a few games
- View modes for the images preview (main menu "Images", "View Mode" menu item):
  - "Classic Mode": old 1 image mode with no multi-screenshots or layouts support
  - "Layouts Mode": new view mode with multi-screenshots and layouts support
- Show/hide images layouts and change their title. To edit a title, select the one you want and hit "F2" hot-key (or use the "Edit Title" button), and type the new description directly into the list. Hit "ESC" key to abort or "ENTER" key to confirm the change (preferences screen, "Images" / "Layouts" sub-tab)
- Note: single layout cis always visible so do not try to hide it!
- New setting: "Layout Prev/Next Auto Switch" (images popup menu)
- Enable this so you can cycle between images and layouts with the prev/next blue button, while in layouts view mode (same as image category auto cycle)
- Ability to hide panels in the layouts customize screen (dual and triple layouts), so you can view only 1 or 2 images in a triple layout and 1 image in a dual layout.
- Panels sizes might not be saved/restored when restarting, and there can be weird results when hiding panels (layouts were not ment to have hidden images!)
- Hidden games feature is changed into a filter now ("Games Filters"). Valid options are:
  - "List All": all games are visible
  - "Hidden Games": only games listed in the hidden list are visible
  - "No Hidden Games": all games are visible except the from in the hidden list
- New Delphi component: "ExTrackBar". A trackbar with labels and other stuff
- New images resampler filter: "Scale2x". This one doubles the snapshots resolution, and support only title snapshots and game snapshots

## [5.3.1] - 2008-02-11 U

### Fixed

- Screenshots alpha blend was disabled
- Crash when scanning ZiNc and Daphne games lists
- Games with multiple controls were not being properly filtered when using "Control Type" filters (main menu "Games Filters")

### Changed

- Files renamed/moved:
  - from "\ini_files\favorites\default.ico" to "\resources\main_icons\favorite_user.ico"
  - from "\resources\tray_icons\el_icon1.ico" to "\resources\main_icons\trayicon.ico"

### Improved

- "Bad Dump" / "No Dump" info in scan results screen for each ROM/CHD
- Display screenshots is a lot faster
- The "no snapshot" image is shown only when the first screenshot is missing. When using previous/next buttons, if screenshot is not found, the last one loaded is not removed
- Hint for previous/next screenshot buttons
- Even more source code cleanup and optimizations

### Removed

- URL label link on top of game documents window/panel
- Files deleted:
  - Folder: "\resources\main_icons\"
    "leftpanel_root.ico"
- Folder and all its files "\resources\tray_icons\" deleted
- New MAME snaps filename format. Only the old "fullgamename0000.ext" is supported from now on (use the new "Convert Snapshots" feature to avoid renaming all files manually)
- Icon files from favorites feature. No more custom favorites icons

### Added

- Multi-screenshots layouts!!!!!!!!!
- View up to 3 screenshots at the same time
  - Features:
    - set what image types to use for each layout using the "Customize" menu item in the new "layouts" toolbar button
    - switch layouts easily using the new "layout" toolbar button
    - resize each image using the splitters
    - settings are saved in the new "[front-end]\ini_files\screenshot_layouts.ini" file
    - each image panel use the background color configured in preferences screen
    - each image panel have a hint with its type description so you know what is being shown (just pass the mouse through the image)
    - features disabled multi-screenshots is enabled: "filename / resolution label"; "change image types"
    - use the new "Reset Screenshots Sizes" menu item (images popup menu) to center the splitters into the screenshots preview area (current layout only!)
    - use the same image type in more than one place
- New Delphi component, "RichEditURL". URL detection is within the game document text now :)
- No HTML tags support though
- New setting: "Set All Games as Available (Scan Games)" (preferences screen) See the help button next to this setting for more info...
- New feature: "convert snapshots from MAME to EL format" (main menu "Images")
- Use this to convert all your "gamename\0000.png" snapshots to "fullgamename0000.png"
- Added the "Screen Resolution" column back (1st screen only). You need to re-create your games lists again. I will not add refresh rate though
- Warning: you must delete all your games lists and columns profiles before using this new build if you are upgrading from v5.3 or EL will crash!
- New button in screenshots toolbar to resize its area so only description column is visible
- Driver "m52.c" into the "Irem Old School" filter for "Moon Patrol" game
- New files:
  - Folder: "\resources\images\img_layouts\"
    "img2_layout1.png"; "img2_layout2.png"; "img3_layout1.png"
    "img3_layout2.png"; "img3_layout3.png"; "img3_layout4.png"
    "img3_layout5.png"; "img3_layout6.png"
  - Folder: "\resources\main_icons\"
    "img1_layout.ico"; "img2_layout1.ico"; "img2_layout2.ico";
    "img3_layout1.ico"; "img3_layout2.ico"; "img3_layout3.ico"
    "img3_layout4.ico"; "img3_layout5.ico"; "img3_layout6.ico"
  - Folder: "\resources\images\
    "msgbox_top.png"

## [5.3] - 2008-01-26 U

### Fixed

- Clone games not showing in the list when using grouped view mode and "show available only " or "show missing only" filters
- This fix will show parent games in the list one way or another, so clones can be shown
- Access violation when trying to delete .zip games while game is set as missing (MAME only)
- Driver status info in "game details" screen was not showing for all systems
- ClrMAMEPro .dat files info not being restored on restart
- Input playback / record was not working
- Add games to hidden list not working... also fixed re-select item if feature is enabled
- Re-select item after deleting games from favorites lists
- Random game button is finally fixed
- Also, added a timer of 03 seconds. If no game is chosen by then, the first visible game on the list is selected... to prevent front-end from freezing when games list is too small
- System nodes still showing when they shouldn't (system view mode)
- Game name not being reset when no games are selected
- Timer in splash screen is back. Now it's really working properly... I swear :)
- Entries not being properly handled in scan result files (.miss)
- 10 seconds delay when running emulators in some systems

### Changed

- Support for the new MAME image format "\gamename\0000.png" is reduced to the first 2 image types (title snapshots / game snapshots). All other image types will only use the old format "full_gamename0000.png"
- "Emu Loader image format (fullgamename0000.png) is always enabled now, and the new MAME format is optional. Removed the setting from "Images" main menu
- Files renamed:
  - Folder: "\resources\main_icons\"

    ```text
    "image_07_gameartwork" to "image_08_gameartwork"
    "image_08_maws" to "image_09_maws"
    "filterarcade_10_aae.ico" to "filterarcade_09_aae.ico"
    "filterarcade_09_mjolnir.ico" to "filterarcade_06_mjolnir.ico"
    ```

- Game details screen remade
- Moved Mjolnir from 8th to 3rd system in the list
- Playback / record input files are now read/written inside a game sub-folder
-You only need to set the main folder for the inp files and EL will add the game name sub-folder automatically (just the way the savestate feature works)
- ROMs/CHDs marked as "nodump" are never checked and will be marked as valid since games can run even when they are missing (mainly for MAME)
- Format of "sysname_roms.el" files are changed. ROM size info is removed since it's never used by the front-end when scanning the games list

### Improved

- Frame box label of image types folder selection show all possible file formats for each type (preferences screen, "Images" tab)
- Code optimizations and removal of some unused functions / variables
- Status bar "game name" label now show "gamename [parent_gamename]"
- Select item function is a lot faster and its implementation is 100% ghost-safe
- Reduced image filters to 3 states: "off", "Linear" and "Lanczos"

### Removed

- Status bar panels: "game size"; "current favorite profile"
- Status bar icons and customization
- Files removed:
  - Folder: "\resources\main_icons\"
    "statusbar_game_size_emu.ico"; "statusbar_game_size_zip.ico"; "emu_pinmame.ico"
    "filterarcade_06_pinmame.ico"; "unzipfile.ico"
  - Folder: "\resources\gameslist_icons\"
    "PinMAMEParent.ico"; "PinMAMEClone.ico"; "PinMAMEBios.ico"
    "UnPinMAMEParent.ico"; "UnPinMAMEClone.ico"; "UnPinMAMEBios.ico"
  - Folder: "\resources\images\topbars\"
    "emu_pinmame.png"
  - Folder: "\resources\images\"
    "NoGamesAvailable.png"
- PinMAME system is gone...
- ROMs list from game details screen. Not much useful...
- ROM size info from "sysname_roms.el" file. EL never check ROM sizes anyway (you'll need to re-create all your games lists...)
- Game size info is gone. Wanna know a game's size ? Go to MAWS for that info
- Setting "Display Zip Error Messages" since the new zip library does not open the file if there are errors
- "No Games Available" when games list is empty (unnecessary screenshot)

### Added

- PCB image type added back
- New files:
  - folder: '\resources\main_icons\"
    "image_07_pcb.ico"
- Some emulator settings for Daphne. Also added support for laserdisc players other then the "Virtual" type (preferences screen, Emulators tab)

## [5.2.1] - 2008-01-18 U

### Fixed

- No need to select a game in the main list to edit left panel filters
- Left panel's node height fixed to 18 pixels (same as games list with 16x16 icons)
- Main menu / popup menus not loading / using custom themes (preferences screen)

## [5.2] - 2008-01-17 U

### Fixed

- Merged sets being added more than once in "\arcade\mame_merged.ini" file
- MAME ROMs folder selection was auto-sorting the list
- Scan games function now search all MAME folders for .chd files
- System node were counting as games when using system view mode
- All system nodes were visible when selecting one system (system view mode)
- Random game button was bugged again (this feature is very slow when just a fewer games are visible)

### Changed

- Files updated:
  - folder: "\resources\images\"
    "about.png"; "logo.png"
  - folder: "\resources\main_icons\"
    "statusbar_game_size_emu.ico"; "statusbar_game_size_zip.ico"
- Files renamed:
  - folder: "\resources\main_icons\"

    ```text
    "image_12_gameartwork.ico" to "image_07_gameartwork.ico"
    "image_13_maws.ico" to "image_08_maws.ico"
    ```

- Moved "number of screens" from main tool bar buttons to "Games Filters" main menu
- Hot-key for "previous image type" is now F9 and for "next image type" is F10
- Status bar "standard" size changed to 16x16 icons. 24x24 icons were removed
- Image type #1 (game snapshot) cannot be disabled anymore (preferences screen)
- Moved screenshots "stretch" and "display parent images" settings back to screenshots popup menu and removed the "settings and special effects" button from the tool bar
- Added a "ClrMAMEPro Data File" edit box in "Emulator Setup" screen so you can define a .dat file for all systems that need it to create the games list. There is no need to put a "SEGAModel2Emulator.dat" in "\ini_files\" folder anymore
- If the file is not found or not defined, when creating the games list you will be prompted to select one
- Read/write resolution settings for "SEGA Model 2 Emulator" was bugged
- Also, added support for custom resolutions
- Remove "Show expanded Items" menu option from "View" main menu and added a new "Collapse Tree" / "Expand Tree" to toggle between collapse and expanded
- Merged sets are a MAME exclusive feature from now on. This front-end will not support merged sets for any other system, including MAME based ones (AGEMAME, PinMAME, HazeMD, etc...)
- The following options are now MAME exclusive features (games popup menu):
  - "Run Game and Playback Input"
  - "Run Game and Record Input"
  - "Run Game and Load a Save State"
  - "Run Game and Record Wave Output"
  - "Run Game and Record MNG Output"
- Game documents feature is a MAME only feature now (it always was)
- Moved "Auto Previous/Next Image Type" from main menu "Images" to images popup menu
- Audio samples, main chip, display, sound, input, driver status and savestate info are now extracted from MAME's "-listxml" output... for bios entries
- Read/write columns profiles were adding the full path twice on the filename string, preventing the profile to be read/written

### Improved

- More code optimizations (again, no speed gains)
- Display game screenshots is a little faster (not noticeable for most of you)
- Support for "filter / Mature" entries in .ini files (left panel)
- Only available systems can be selected when scanning the games list (games popup menu)
- Removed the "Delete Selected Games Files" option from games popup menu ("Delete" menu item), and changed the "Delete "gamename.zip" menu option so it can handle multiple selected games as well, using the same "Delete" keyboard hot-key
- Treeview's FullExpand() command used instead of a loop (don't know why I never used this command before...)
- You can delete files in the "Select File" screen using the "Delete" keyboard hot-key
- Centralized all the calls for the "\ini_files\" folder and its sub-folders into one function
- Updated the function that create games lists based on ClrMAMEPro .dat files so other emulators can also use it

### Removed

- DOS box run mode. Games run with DOS box in normal state and extract games list / emulator version minimized
- The following image types are gone: "Select"; "Versus"; "Wallpaper"; "Hardware"; "PCB"
- Go to MAWS to check on these images...
- Files deleted:
  - folder: "\resources\main_icons\"
    "filter6_numscreens_all.ico"; "filter6_numscreens_1.ico"; "filter6_numscreens_2.ico";
    "filter6_numscreens_3.ico"; "filter6_numscreens_4.ico"; "mamu_scanmiss.ico";
    "mamu_scannotneeded.ico"; "binary.ico"; "statusbar_total_games.ico";
    "create_gameslist.ico"; "emu_extrafiles.ico"; "image_07_select.ico";
    "image_08_versus.ico"; "image_09_wallpaper.ico"; "image_10_hardware.ico"
    "image_11_pcb.ico"; "image_nextno.ico"; "image_prevno.ico"
- Support for zipped images is gone... for good this time
- Customize images tool bar. You can only show or hide this bar from now on
- Image type button from main tool bar button. Now only available in images tool bar
- Option: "Use MAME Games Info" for ZiNc system. If a MAME games list already exists, EL will get all extra info from it automatically
- Option: "Delete All Visible Games" from favorites popup menu. If you want to delete all games from a favorites list, enable "Multiple Section", select all games and use "Delete / Delete All Selected Games Files" (games popup menu)
- Several menu items from games popup menu "Delete" (sorry but you're gonna have to delete files manually from now on)
  - "Config File"
  - "Nvram File"
  - "Input File"
  - "Save State File"
- Number of screens column from the main games list... you still have the filter in the "Games Filters" main menu

### Added

- Support for a new emulator: "AAE - Another Arcade Emulator"
- New emulator that run vector games using OpenGL width hardware acceleration, adding some cool effects. A ClrMAMEPro .dat file is required for this system (go to "Logiqx")
- Note: this system support only full split ROMs (no parent/clone relationships)!
- Main filter "Parent/Clone" is also applied in the left panel
- New left panel popup items:
  - "Apply Main Tool Bar Filters": Use this option to re-apply main filters from the tool bar buttons
  - "Export Games List": Export the current games list to a .ini file so you can use it as a new filter for the left panel
- New button for the MAWS web browser tool bar: "Exit MAWS", to exit the browser and load the game snapshot image type
- New feature: "Left Panel Editor" (main menu "Left Panel" / left panel popup menu)
- This is what you've been waiting for. A complete editor for all your custom filter needs
- You can even edit existing filters like "catlist.ini", "artwork.ini", "series.ini" and others. Read "docs\el-leftpanel.txt" file for a user guide
- There are 2 possible options:
  - "Create a New Filter": the editor will open with a new filter already initialized waiting for your input
  - "Edit a Filter": after selecting a .ini from the list, the editor will open and load the filter so you can add/remove folders or games
- The editor is very easy to use and visualize. See the "help" button at the editor's tool bar for a small tutorial
- Warning: only MAME is supported by the editor. Even if you select games from other systems, they will not be added
- New files:
  - folder: "\resources\images\topbars\"
    "filters.png"; "emu_aae.png"
  - folder: '\resources\main_icons\"
    "emu_aae.ico"; "filterarcade_10_aae.ico";
    "leftpanel_btn_add.ico"; "leftpanel_btn_delete.ico"; "leftpanel_btn_save.ico";
    "leftpanel_btn_help.ico"; "leftpanel_btn_addgame.ico"; "leftpanel_btn_deletegame.ico";
    "search.ico"
  - folder: "\resources\gameslist_icons\"
    "AAEParent.ico"; "AAEClone.ico"; "UnAAEParent.ico"; "UnAAEClone.ico"
- Detection of available screen resolutions, based on your video card+monitor
- Used in ZiNc settings screen, SEGA Model 2 settings screen, AAE settings screen
- New filter: "Save State" in "Games Filters" main menu

## [5.1.9] - 2008-01-04 U

### Fixed

- File "\arcade\system_name.el" not updated correctly when doing a single game scan
- Left panel custom background color not being set (same as games list)
- Scan results was not checking for merged sets and adding all those games to its list
- ZiNc games showing when using "Vector" filter
- History label (top game documents panel) was bugged
- Bad treeview colors in "check for missing images" and "check for missing MAMu_ icons"
- Executing games with "Run Custom Game Settings By Default" enabled was searching only for game custom command lines
- Setting / deleting "debug.ini" for MAME was not working correctly

### Changed

- Scan results changed to not include games where "gamename.zip" is not found (for both master and clone sets

### Improved

- Emulators setup screen UI updated for easier access
- Fixed appearance of ListView lists in several screens (for Windows Vista)
- Multi-selection enabled for the left panel filters. Select a bunch of filters and all games from those filters combined will be displayed in the list
- Single selection is still supported... of course
- Left panel now use the main filter "Have / Miss". Note that selecting this main filter will overwrite the select filters from the left panel!
- Columns editor UI improved a little bit for easier maintenance
- Minor improvements to the left panel
- More optimizations for easier maintenance (no speed improvements)
- Reduced to 10 tries the "Random Game" feature so the front-end does not fall into an endless loop. Useful if you are viewing a list where most games are hidden

### Removed

- Games list icons are not validated anymore. If there is one or more files missing, the icons in the games list will be messed up

### Added

- Support for MARP data file (<http://marp.retrogames.com>)... game documents feature
- File is updated daily. Download it from this link: <http://marp.retrogames.com/marp.dat>
- Place it in "[frontend]\ini_files\" folder or MAME root folder.
- New main menu: "Left Panel"
- This menu will have some special options. One of them, create special filters using Emu Loader's internal database, to be used with the left panel
- Menu Items so far:
  - "Create Control Types File" -> create a "controltype.ini" with a list of all MAME control types and its games. Some users might want to use this filter instead of the one from "Games Filters" main menu
    - More improvements to the left panel:
  - -> Left panel popup menu:
    - "Apply Selected Filters" -> use this menu item to enforce the left panel to apply its selected filters (useful when multiple filters are selected and you used the main filters and want to revert to the left panel)
    - "Collapse / Expand Tree" -> collapse or expand all items in the tree
    - "Reload TreeView" -> reload all .ini files into the treeview (no filters are applied!)
    - "Default Panel Size" -> restore the default width of the left panel
  - New files: -> folder: "\resources\main_icons\"

    ```text
    "leftpanel_root.ico"
    ```

  - -> folder: "\resources\gameslist_icons\"

    ```text
    "MAMEParent.ico"
    "MAMEClone.ico"
    "MAMEBios.ico"
    "UnMAMEParent.ico"
    "UnMAMEClone.ico"
    "UnMAMEBios.ico"
    ```

## [5.1.8] - 2007-12-20 U

### Fixed

- When disabling left panel, main tool bar filters were not being applied again
- Hidden games stay hidden when left panel and hidden games features are enabled at the same time
- Open/close button for root nodes in left panel disappearing when starting front-end with left panel enabled
- Memory leak in "game details" screen
- Incremental search not working in several screens

### Improved

- Files that do not follow the standard format are not added into the left panel (catver.ini for example)
- Merged some more functions to remove unnecessary code duplicates

### Removed

- Several audit icons from folder "\resources\main_icons\"
- Artwork filters from "Games Filters" main menu. Also removed support for the now old artwork.ini (thanks Mr. Do!)... "[frontend]\ini_files\artwork.ini" file
- Only the new artwork.ini file is supported and is to be used with the left panel
- Audit feature is completely removed from the project (see new feature "Scan Results" for more info)

### Added

- Added a new main toolbar button: "Left Panel Filters" for easier access and removed the menu item from the "Games Filters" main menu
- Left panel now have a popup menu with some options
- New files: -> folder: "\resources\main_icons\"

  ```text
  "left_panel.ico"
  "scanresult_ok.ico"
  "scanresult_badcrc.ico"
  "scanresult_notfound.ico"
  "scanresult_game.ico"
  ```

- Support for custom background image and font for the left panel Same background image as games list and font is the same as parent games font
- New options for MAME 0.122 in MAME settings screen
- Custom width for the left panel is now saved in "EmuLoader.ini"
- New folder "font_ttf" with some custom fonts used by the front-end, in case you don't have them
- New feature: "Scan Results" (games popup menu)
- Every time you scan the games list, files are created or updated in a new folder: "[frontend]\arcade\scan_results\". Each system have a file with the ".miss" extension, except for "ZiNc" and "Daphne" systems (no support for these 2). Only games that have missing ROMs/CHD are added
- There are 2 options for this feature:
  1. Selected Game ("Shift+A" hotkey) -> view the results of a single game
  2. All Missing Games ("F8" hotkey) -> view the results of all missing games for all systems

### NOTES

- At least one ROM or CHD file must be found for each game or it will not be added in the list
- Green status is for "Ok" ROMs/CHD files
- Red status is for "bad checksum" and is for CHD files only (no ROMs)
- Gray status is for "missing" ROMs/CHD files
- If you download a new .zip file you must re-scan the games list since this feature does not do any scanning, it only read "system_name.miss" files

## [5.1.7] - 2007-12-04 U

### Fixed

- Some sample files being set as "not used" in "Scan Audio Samples" (main menu "Games List")
- New history link label background color and font settings not updated with game docs settings
- Cannot create a new favorites profile when "Default" profile is selected
- Default ini file for MAME based emulators not created on a couple situations
- Bug when editing ROM paths in emulators settings screens

### Changed

- Renamed "Bios Sets" to "Bios Sets Settings" and removed the "Default / User Define" options. This feature is now enabled by default (non-default biosset is automatically loaded when starting MAME games). Remember that this is a MAME only feature

### Improved

- Some code optimizations for easier maintenance and redundancy removal
- More internal updates for the upcoming large icons view mode

### Added

- New system: Mjolnir - Arcade Emulator v0.4 [Namco's System 21, System 22, and Super System 22 harware]
- Another MAME based emulator. It works the same way as MAME. Enough said :-)) Ini files (mjolnir.ini; etc) might not be fully compatible though
- ROMs files format updated with one more field so EL can know if a specific ROM is from a bios set or is a regular ROM. - This will only be used by the new audit system ("mame_roms.el", "agemame_roms.el", "pinmame_roms.el", "hazemd_roms.el", "mjolnir.el")
- New format: `rom_name=rom_size¬rom_crc32¬rom_status¬is_bios_rom;`

  ```text
  bios.ic23_l=65536¬e5693ce3¬baddump¬1;
  pacmanh.6j=4096¬5c96a733¬¬;
  ```

- Note that you don't have to recreate your games lists... at least not until I finish rewriting and activate the new audit feature
- New feature: Left panel filters
- Same panel as in MAME32 but with a huge difference... you can have as many sub-levels as you like, all you need to do is create a section in the file like so:

  ```text
  file: 'catlist.ini'
  [My filter / Maze / Top View / Multiplayer / Level 33.1 / Konami]
  game1
  game2
  .
  ```

  To toggle this feature ON/OFF, use the new "Enable Left Panel" setting in "Games Filters" main menu (enabled by default)

### NOTES

- you do not need to add all sub-levels way down to the last one (EL will do that automatically)
- all files must be placed in the new "[frontend]\leftpanel_filters\" folder
- you can have a custom description for each root node (.ini file). Just create a new section inside called [TITLE] with the following format:

  ```text
  [TITLE]
  FolderTitle = Type any description you want here
  ```

- other files like "catver.ini", "nplayers.ini", "mameinfo.dat", etc... are still located in "[frontend]\ini_files\" folder
- All files from MAME32 are supported, "rankings.ini", "series.ini", "catlist.ini", "version.ini", "artwork.ini", and others
- Use mouse right-button click to call popup menu

## [5.1.6] - 2007-08-27 U

### Fixed

- Auto game document #6 not being correctly read (preferences screen)
- Painting bug when scrolling games list while auto game documents is enabled
- Columns profile not being saved on certain cases (front-end startup)
- Columns profile .ini file is always deleted before saving again... to fix bug
- Games not being set correctly in grouped view mode. You'll need to re-create your games lists to fix this bug
- Custom driver options was setting game name instead of driver name
- Entries with null value now do not have "# entry" (mame.ini)... ctrlr, mngwrite, etc
- Couple bugs when scanning games list and CHD files
- Accesss violation when deleting multiple .zip files (progress bar bug)
- When favorites profile is empty, it was not being set as default at startup
- A few internal bugs
- The drop-down box # 6 (preferences screen) was reading the setting from the drop-down box #5

### Changed

- Renamed "Hidden Games Enabled" to "Activate Hidden Games" / "De-activate Hidden Games"
- For MAME based systems, all driver .ini files will now be handled in "[mame_inifolder]\source\" folder. For MAME builds older than v0.118u2, you will need to move the files to "[mame_inifolder]" manually
- ZiNc games now use the field "ScreenType" to hold the index of games, so EL can run them with ZiNc emulator
- Games list files are changed again. Please re-create all your games lists
- User interface in games filters selection screen has changed. Filters descriptions are now displayed as hints as you move the mouse over each option

### Improved

- Feature "Scan Audio Samples" ("Games List" main menu)
- It only shows a list of sample from missing games and sample files not used by any game
- First change to start implementing large view mode, using "EasyListView" v1.60 component
- On every game selection, the full game data will have to be redirected to memory variables
- I just hope this does not generate the bug from old EL builds...
- Removed systems lists from main menus to add them at runtime... much easier to add new systems in the future since I don't need to manually add the menu items
- Main buttons toolbar / images buttons toolbar / status bar customization simplified
- Customize columns screen
- Bios sets selection screen (main menu "Emulator", "Bios Set" menu item)

### Removed

- Menu setting: "Use Controller" (main menu "Emulator")
- Menu theme selection from "View" main menu. To select a theme go to preferences screen, "Front-end" tab, "Menu / Popup Themes" sub-tab
- Game size (.zip file size)
- Top bars and feature descriptions from some screens. Also some files from "[front-end]\resources\images\topbars\" folder

### Added

- ROMs validation. All games are now fully scanned when updating the games list. If a game is missing a single ROM, it will be set as unavailable
Notes:
  - ROMs of bios sets can now be placed in game sets (parents and/or clones)
  - you can put ROMs of game sets into bios sets, but parent set must still exist
  - you still cannot put ROMs of parent sets into clone sets
  - ROMs for ZiNc and Daphne systems are not fully scanned (no ROMs list...)
- Customize main menu and popup menu colors (preferences screen, "Front-end" main tab, "Menu / Popup Themes" sub-tab)

### NOTES

- You can create as many themes as you like. They will be saved in "\ini_files\menu_themes.ini" file
- Setting "Frame Round Corners" is used for both selection band and checked items
- You can set single color, 2 colors gradient or 4 colors gradient for the selection band
- Theme "Office 2007" cannot be modified
- A pretty timer in status screen so you can keep track on how long a task is taking. This is my first piece of code that use a second thread! :-))
- Only create/scan games use this timer for now
- Fix for clone games with CHD files. File "\arcade\mame_roms.el" is updated to support filenames of clone CHD + filename of the parent CHD, using a ' _"parentchd"_ ' tag, like so:

  ```text
  Game: konam80u
  CHD : 826uaa01.chd
  Parent CHD: 826eaa01.chd
  ```

  .. sample from "mame_roms.el"..\
  826uaa01.chd_"parentchd"_826eaa01.chd=0¬456f683c5d47dd73cfb73ce80b8a7351¬;

- This means that the front-end will detect both chd files and if found will set the game as available... Make sure to create the games list again
- New files to keep track of merged games located in "[frontend]\arcade\" folder (MAME based systems only)

  ```text
  - mame_merged.ini
  - agemame_merged.ini
  - pinmame_merged.ini
  - hazemd_merged.ini
  ```

- You can resize game columns directly into the list now. Columns profile will be saved when:
  - exiting the front-end
  - swicthing between system filters
  - when opening columns customizer screen
- Support for html link on new history.dat (not directly into the richedit box, but with a label above it)
- New menu option: Reload "catver.ini" / "nplayers.ini" / "artwork.ini" (main menu "Games List")
- Use it to load the info from those files without restarting the front-end

## [5.1.4] - 2007-08-10 U

### Fixed

- MAME 0.117u2 and newer use a "mame.ini". Also valid for other MAME based emulators: AGEMAME, PinMAME, HazeMD
- Bios sets being added in double when creating a games list (MAME based only)
- Error generating MAME based games lists with emulators builds older than 0.117u2
- Function "FileExists()" updated to work properly, specially under Windows Vista
- Memory leak when exiting frontend at the first time run
- Bios sets were being added into MAME based lists as BIOS and regular games
- Frontend works again under Windows Vista... as far as I could test it. Just make sure to "run as administrator" and also make sure to install the frontend and all emulators in folders that are not protected by Vista
- Enabling hidden games feature make all other games visible

### Removed

- Column "Audio Channels", "Audio Samples"
  - You'll need to re-create your games lists again since .el files have changed!!!

### Optimized

- Source code optimizations for easier maintenance
- More startup optimizations

### Added

- Column "Times Played" is back. New file "\ini_files\games_played.ini"
- New feature: "Scan Audio Samples" ("Games List" main menu)
  - Use this to scan all games that use external samples files for the sample .zip file. You can also delete not used samples
- New games filter: "Control Type" ("Games Filters" main menu)
  - Use this filter to show only games that use a particular control type: "Joystick 4-Way", "Trackball", "Dial", etc. Filter added to replace the now removed "Control Type" column
  - NOTE: For games with multiple controls, only the first control type is checked!

## [5.1.3] - 2007-07-26 U

### Fixed

- Show/hide tool bar button in auto game info (image preview area) was not working... games popup menu, "Game Documents" menu item
- When changing user description in favorite profile without changing the filename, a message saying that the filename already exists appears

### Changed

- User favorites profiles have some changes:
  - User description is stored inside "\ini_files\favorites\favfile.el" files, under "fav_username" entry
  - The "[Favorites]" section in "Emuloader.ini" is gone, and only the user filename is stored now, in "[Preferences]" section, "FavoritesFileName" entry
  - File "\ini_files\favorites.ini" is not used anymore
  - IMPORTANT NOTE: You will have to define user descriptions again. Please go to "Favorites - Profile Editor" for that

### Removed

- Some more icons

### Added

- Support for MAME 0.117u2 (file "\ini_files\bios_overwrite.ini" is no longer needed)

## [5.1.2] - 2007-07-20 U

### Fixed

- Audit failing when a game have ROMs marked as "No Good Dump Known"

### Changed

- Simplified scan and audit games features so all systems can use the hot-key (games popup menu)
  - Now a new screen appears so you can select the system
- Replaced progress bar by a windows progress bar (splash/status screen)
  - Also optimized for more speed
- Audit was too slow due to constant updates to the status bar's labels
  - Added a progress bar when auditing multiple games. Speed improvements by 300%!!!!!

### Added

- Three new icons in "\resources\main_icons" folder. Since main menu and popup menus are custom (not OS default), check boxes and radio groups must be painted manually, but only when there is no icon set for the item
  - option_check.ico
  - option_radiogroup_off.ico
  - option_radiogroup_on.ico
- Theme support for main menu / popup menus. Select the one you want in main menu "View", "Main Menu / Popup Menu Themes" sub-menu
  - Office 2007
  - Windows XP
- Support for MAME v0.117u1
  - new "mame.ini" settings
  - create games list (new file for correct bios set parsing: "\ini_files\bios_overwrite.ini")
- New filter: "Bios Sets", game filters selection screen (forth button on the tool bar)
  - Use this to view only bios sets, like "neogeo", "playch10", "cvs", "naomi"
  - You'll find it below the "Vector" filter
- New filter menu: "Select System" ("Games Filters" main menu")
  - Same as system filter button on the tool bar

## [4.9.7.2] - 2007-02-11 U

### Fixed

- "Out of Range" error when using ZiNc settings (emu or games) in one line (.cfg files)
- History info not being displayed when using old file format (history.dat)
- Window position was being reset while using auto game info on a window

### Added

- New game info: "Story" main menu "View" / "Game Documents"
  - Added by request. Not sure what info this is for, but it's being used to replace hiscores
  - Notes: File "story.dat" is required and, like the others, must be placed at MAME's root folder or Emu Loader's "\ini_files\" folder
- Added a "Reset" button in the preferences screen, auto game info drop-boxes, to reset texts to its default order ("General" tab, "Miscellanous" sub-tab)

## [4.9.7.1] - 2007-01-22 U

### Fixed

- Option "Use MAMu_ Icons" was being set as disabled when not using zipped icons
- Error when creating games lists at startup

### Changed

- Favorites Profile Editor:
  - Removed "Edit User" button. You can change description / filename "on-the-fly" now. Remember to click the "Update" button to save the changes
  - Selecting another profile or exiting the editor cancel the changes
  - Added two extra confirmation messages when deleting a profile, so you can keep the games list and icon files for that profile
  - You can have multiple profiles with same description, but the filename must be unique
  - Some minor optimizations and improvements

### Added

- Select a filter with mouse double-click ("Arcade Main Filters" screen)

## [4.9.7] - 2007-01-12 U

### Fixed

- Hints were not showing... anywhere (buttons, edit boxes, checkboxes, etc)
- Rename / delete images not working due to changes in the core
- Entry "ctrlr" in "mame.ini" was being deleted if using empty value
- Audio and video recording not working if destination folder does not exists. The folders are automatically created now
- String "File Not Found" was not being added in the "Notes" column when auditing CHD files
- Some bugs and missing cases on the audit ROMs feature

### Changed

- Moved favorites to the top of the games filters list (\ini_files\mame_filters.ini) for easier access when switching between filters
- Moved the following settings from preferences screen to "Games List" main menu:
  - "Incremental Search"
  - "Fill All Clone Entries"
  - "Multiple Games Selection", and renamed it to "Enable Multiple Selection"
- Moved "Filter Games by Main CPU" settings from "View" to "Games List" main menu
- New "About..." screen, with new background image

### Removed

- Setting "New Image Name Format"... not needed anymore
- Feature "Display Total Images"
  - This was responsable to display the "01 of ??" label in the images tool bar, to know the amount of images you have for that image type / game
  - Removed because now EL can display three image formats at the same time

### Optimized

- Detailed messages for .zip handling errors
- Added warning/information messages on a bunch of features, to make your life easier

### Added

- New arcade filter: "Konami System 576"
- In MAME settings screen:
  - Filename with full path of the file being edited, just below the top bar
  - Emulator version info label at the bottom of the MAME settings screen
- Three new settings for multiple format in images filenames. Now all formats can be used simultaneously. Settings can be found in main menu "Images":
  - EL Format (fullgamename0000.png) ... enabled by default: enable this so EL can display images like "snaps\galaga0004.png" (full game name + 4 digits)
  - New Format (\gamename\0000.png) ... enabled by default: enable this so EL can display images like "snaps\galaga\0004.png"
  - Old Format (shortname0000.png) ... disabled by default: enable this so EL can display images in old MAME style "snaps\gala0004.png" (short name + 4 digits)
  - Note: This new feature applies to all systems, not just MAME
- Convert new MAME images format (\gamename\0000.png) to Emu Loader's own format (fullgamename0000.png), located in "Images" main menu. Only unzipped images are supported on this feature
- Updates for latest MAME build (MAME settings screen)
- New feature: "All Selected Games Files" (games popup menu, "Delete" sub-menu)
  - If multi-selection is enabled, you can delete more than one game.zip file at once. A window will open with the list of games to be deleted.
  - WARNING: Recycle bin is not supported
- New feature: "All Game Files For This Favorites Profile" (games popup menu, "Delete" sub-menu)
  - Same as delete multiple selected games, but for favorites mode. Only visible games affected by current filters will be added.
- New main menu option: "Games List": this menu will hold settings for the games list itself

## [4.9.5.3] - 2006-10-09 U

### Fixed

- Range check error when using MAME's history.dat
- Some visual bugs when using MAME settings (default and custom game options)
- Feature "Filter by CPU" was taking too long and using 50% of system resources while being executed... that's a no no
- RBG pallette for MAME Plus! was not being read and set (mame settings screen)
- Game descriptions ending with ", The" were not being correctly fixed when creating games lists

### Changed

- Optimized the read/write function for MAME settings (MAME settings screen) and removed redundant code
- Frontend now compiled with "Range Check" option (Delphi project settings). This will help me to track down memory variables that are trying to use values outside its limits

### Removed

- "resources\images\toolbars\statusbar_random_game.ico" and "resources\images\toolbars\statusbar_game_size.ico" files

### Added

- New icons:
  - "resources\images\toolbars\emu_all.ico"
  - "resources\images\toolbars\random_game.ico"
  - "resources\images\toolbars\statusbar_game_size_emu.ico"
  - "resources\images\toolbars\statusbar_game_size_zip.ico"

## [4.9.5.2] - 2006-10-08 U

### Fixed

- Some console left-overs
- If using zipped images and setting a relative path for the .zip files, images were not being loaded
- Tool bar and status bar hidden when restarting frontend in full mode

### Changed

- Custom game settings for ZiNc moved from "resources\zinc_cfg\" to "arcade\zinc_cfg\" folder. Just move your folder to the new place
- Filter games by main CPU is not automatic anymore. You must click "Apply" button to filter games from now on
- Moved status bar from bottom of main screen to below the games list
- Moved game size settings from preferences screen to main menu "View"
- Moved "Tool Bar Editor" menu item from "Advanced User" to "View" main menu and renamed it to "Settings"
- A few entry names in "EmuLoader.ini"
- Random game button moved to main tool bar buttons
  - Warning: this feature only works when viewing all games with full filters enabled

### Removed

- MAME Mouse / light gun settings from preferences screen

### Added

- Improvements to the columns profile feature:
  - Each system can have its own columns profile
  - Editor improved to allow selecting a profile for each system
- Each system can have a different column sort. Settings saved in the new "[Columns]" section, "EmuLoader.ini" file
- Status bar editor (main menu "View")
  - The current favorites profile can be found in the button's hint... or you can identify it by the icon
  - Status bar is hidden when in full screen mode
- All default menu items are in bold font... for multiple items like image types, game icons size, status bar size, etc (main menu and tool bar dropdown menus)

## [4.9.5.1] - 2006-09-27 U

### Fixed

- Columns Editor was not saving profiles in the correct folder
- Favorites lists not loading
- System nodes are visible after applying filters
- Out of index error when creating MAME based games lists
- Setting "m68kCore" not being properly read from "mame.ini"
- Default / custom game settings not being correctly detected (MAME based emulators)

## [4.9.5] - 2006-09-27 U

### Fixed

- All screens setting in "mame.ini" was not being loaded (resolution, bpp, refresh rate)... mame settings screen
- System filter not working when using grouped, system or system+grouped view modes ... nobody noticed this!!! ????

### Changed

- Emulator filename checksum is now MD5
- Directory structure has changed a little bit:
  - arcade games lists from "resources" to "arcade" folder (*.el)
  - favorites games files from "resources\favorites" to "ini_files\favorites" folder (*.el; *.ico)
  - columns profile files from "resources\columns" to "ini_files\columns"

### Removed

- Remaining "MAME legacy" code from the source code

### Added

- New setting: "Force Quotes in Command Line (WinXP/Vista)". It appears that the emulator filename must be surrounded with quotes in some WinXP/2k3/Vista machines (preferences screen, general / miscellaneous tab)
- Support for MAME Plus! v0.108u3 (mame settings screen).
  - Notes: hiscore.dat is not supported; "driver_config" is not supported
- Main CPU info on an external file (ini_files\cpu.ini)
- Option: "Filter Games by CPU" (main menu "View"). Enable this setting and an edit box will appear at the top of the games list. Type a CPU name to filter the games list or select one from the listbox. The file "ini_files\cpu.ini" must exist.
- New system: HazeMD, all the usual stuff from MAME is supported on this emulator

## [4.9.4.1] - 2006-09-11 U

- A small update. This fixes a minor bug that load the resolution settings (resolution, bpp, refresh rate) in screen 0 tab, instead of all screens tab (MAME settings screen). If you always use default resolution settings, you do not need this update. Settings are saved correctly though.

## [4.9.4] - 2006-09-9 U

### Fixed

- Application crash when searching for games in parental lock editor when "ini_files\catver.ini" wasn't found. This file is not required for the editor to function anymore
- Multi-selection wasn't working correctly
- Bios entries are not shown in vectors filter anymore
- Feature "Encrypt File" (parental lock editor screen) was not saving the new file encrypted
- Slow emulator loading when trying to run games (some systems only)
- Main menu reappearing when in full screen mode

### Changed

- Moved from games popup menu to main menu "View":
  - Show Game Details
  - Full Screen
- Move "Show Command Line" from main menu "Emulator" to main menu "View" and renamed to "Show Command Line Before Run Game"
- Run game menu items are split into 2 categories (games popup menu):
  - "Play" -> used to play games with default settings
  - "Play (Custom)" use to play custom command lines and zinc custom options
- Feature "Refresh Games" renamed to "Scan Games". It is used to set games status of available/missing avoiding the need for create new games list
- Description of the following image types cannot be changed anymore, and they support images in .png format only (Title Snapshots, Game Snapshots, Select, Versus)
- MAME ROMs folders selection (MAME settings screen): From now on, you must add all your MAME roms, instead of just the top folder... bye bye recursive scan

### Removed

- Batch files feature
- MAME settings (Legacy), for all MAME based emulators. From now on, only latest MAME builds will be officially supported
- Extra Command Line Parameter feature
- Detection of .exe type from the frontend's core (too buggy)
- Game info label from preview image

### Added

- Images preview popup menu item "Image Details". Info displayed: Filename, File size, Zip filename, Resolution, Screen resolution
- Games popup menu setting: "Return to Window Mode" (visible only in full screen mode)
- New column: "Save State" (handy now that hiscore support is removed from MAME)
- New search patterns for a more precise search:
  - Patterns: Description, Manufacturer, Category, Game Name, Parent Game, Driver, System
  - "Clear Search List" checkbox for "Begin Search" button
  - "Delete Duplicates" button to remove entries already in protected list
  - "Clear" button in keywords frame
- Custom command line is back:
  - Create cmdline for games, game drivers and systems
  - Set or delete .ini files in games popup menu "Custom Options" / "Command Line"
  - Can be used with ".exe" / ".bat" files
  - Includes "Field With Quotes" checkbox and support for "prefix" and "suffix" parameters

## [4.9.3] - 2006-08-17 U

### Fixed

- Missing 16x16 sized icons in emulator icons files pack, causing index errors
- Some "mame.ini" settings were not being written correctly or not at all
- Icons not displaying correctly or not at all in games list and status bar while in small icons mode (16x16)

### Changed

- Moved game icon size settings from view mode tool bar button to "View" main menu

### Added

- Option "Bold Font In Selected Game" that toggle normal / bold font style in the selected game (preferences screen, appearance tab)
- When game snapshots file/folder setting is empty (frontend setting), the path from MAME based emus will be automatically used. This feature is used when doing a clean frontend install.

## [4.9.2] - 2006-08-10 U

### Fixed

- Icon size being reset to standard (24x24) while MAMu_ icons is enabled
- Smooth scroll setting was not being saved in "EmuLoader.ini"

### Changed

- Options "rotate" / "ror" / "rol" / "autoror" / "autorol" in MAME settings screen split into checkboxes to properly support these settings
- Create a new section in "EmuLoader.ini" for status bar settings named "[statusBar]"
- Move game documents items from games popup menu to main menu "View"

### Removed

- Hi-Score column (no point in keeping it anymore)

## [4.8.2] - 2006-05-04 U

### Fixed

- Vector games was not being shown in any filter other than "Vectors"
- Favorite games were not being loaded

### Changed

- Entries "mame_version", "zinc_version", "daphne_version", "pinmame_version", "agemame_version" in section "[info]" replaced by "version" ("mame.el", "zinc.el", "daphne.el", "pinmame.el", "agemame.el")
- A few icons in "resources\images\toolbar" folder

### Added

- Option "Games List Versions" (main menu "View")
  - Information on emulator versions used to create games lists (all systems)

## [4.8.1] - 2006-04-28 U

### Fixed

- Error in audit feature for games and bios that have "game" / "bios" strings in their titles
- Tons of memory leaks caused by "IconTools v2.01"
- Zipped icons were not being properly handled in "search missing icons" feature
- Splash screen background disappearing when switching between EL and other apps
- A few actions were not being properly executed when controlling games list with arcade controllers (most noticeable PG_UP / PG_DOWN)
- Image type tool bar icons were not being set at startup
- Tool bar button systems was not included in [ToolBar] section ("EmuLoader.ini")
- A few bugs when running EL on Windows Vista (betas). Still, a bunch of visual bugs due to Vista's new GUI will not be fixed until "Delphi Longhorn" release in 2007

### Changed

- Buttons icons in .bmp format with 2 states (normal / disabled) in "resources\images\toolbars\buttons". This fixes the bad background for some Win9x / WinXP users
- Unzipped arcades images from "resources\images\controllers.zip" again
- Removed some old code and optimized some functions
- Updated Graphic32 component to latest version 1.8.1 (faster and new image filters)
- Renamed "Filters" menu to "Resampler" (main menu "Images") and added some new filters
- Frame box "Customized Game Strings" renamed to "Customized Game Appearance" (preferences screen, general / games tab)
- Emulator version info now extract from -listxml output (MAME based emus). If info cannot be extracted, the old way will be used (-help output)
- Audit feature: Game name replaced by game title and game name appears in second column (same line as game title)
- A bunch of icons in "images\toolbars" folder were remade and others added
- Library "IconTools v2.01" replaced by a new library called "TExIcon" created by Colin Wilson
- Dynamic loading of tool bar icons / large image type icons to save memory and increase speed
- Old MAME builds that use "-listinfo" output are automatically detected when creating new MAME games lists
- Game documents feature rewritten to merge all docs functions and to fix several memory leaks when using automatic game info
- Move sections "[MAMu_]", "[Audit]" and the new "[GameInfo]" to a new file: "\ini_files\el_extras.ini"
- FMOD always use "Windows Multimedia Output" driver for playback now for best audio quality
- All updates up to MAME 0.105u3 are supported
- New about screen image ("resources\images\logo\") and new arcade controllers layout images ("resources\images\")

### Removed

- The library "IconTools" is not used by this project anymore
- Check button "Use XML" from emulators setup screen / MAME tabs

### Added

- Reminder message for Custom Game Appearance feature (description, category, font)
- Frame box "Control Games List With", listing all supported arcade controllers (preferences screen, general / miscellaneous tab). Devastator II, HotRodSE, SlikStik, X-Arcade tabsheets removed
- Menu option "Arcade Controllers Layout" (main menu View) to display the images of all controllers and their keys layout
- Support for 48x48 sized icons in main screen's tool bar buttons (Main menu "View" / "Large Tool Bar")
- New feature: "Scan Not Used Images". Searches for filenames that do not have a corresponding game name (unzipped images only)
- New feature: "Scan For Missing Images". Searches the games list for games without a screenshot (unzipped and zipped supported)
- New actions to arcade controllers and change in the actions layout for all controllers
- "Show All" in "Game Documents" games popup menu item to view all docs at once (game info, history, game driver info, faq)
- New section in "docs\el-readme.txt" named "Useful Links" with articles about advanced frontend usage

## [4.8] - 2006-03-16 U

### Fixed

- Feature "Record Sound" in "Advanced User" / "MAME" section was not working
- Folder of "-wavwrite" feature in MAME was not being set correctly
- AV error when closing the audit screen while games are being audited
- Username and user filename in favorites feature were not being properly handled causing bugs when adding/deleting games
- Error when all groups are closed in ListView (large, small, list, thumbnails, tiles view modes)
- Long folder/filenames in ZiNc was not properly supported

### Changed

- File "docs\el-tips-tricks.txt" updated
- Some minor modifications
- Tab "Unsupported" renamed to "Old Builds" (MAME settings screen)
- Updates for MAME v0.104u3 (Thread Priority in MAME settings screen, Miscellaneous tab)
- Section "[bios]" in "ini_files\bios.ini" file now displays bios descriptions correctly
- Bios sets feature rewrite:
  - Custom selection for systems with multiple bios sets via "Bios Sets" screen (Advanced User / Bios Sets / Settings)
  - Feature applies only to MAME, AGEMAME and PinMAME
  - Recreate MAME based games lists for proper functionality
- Bios dropdown button in "MAME Settings" replaced by a listview (bold font for default sets)
- Renamed "Toggle Expanded / Closed" setting to "Show Expanded Items"
- Sound clips playback and recording now use the sound clips folders setting (Preferences screen, "Folders / Files" tab)
  - Recording sounds is for MAME based emus only
  - Automatic numbering for existing .wav files (up to 9999)

### Removed

- Menu item "System Bios" (obsolete)
- Setting "MAME Wave Write" from preferences

### Added

- Software compiled with new FMOD v3.7.5 and added "fmod64.dll" for audio support in Windows 64-bit editions
- New file "ini_files\savestate.ini"
- New feature: "Load Save State" ("Advanced Users" main menu, MAME based only)
  - Load a save state before starting a game (MAME "autosave" will be disabled if used)
- New folder with images "resources\images\topbars"
- Default bios names and selected bios names stored in "ini_files\biosset.ini"
- New Option: "Display Bios Set User Defined Warning" (Preferences screen) to toggle the customization message
- GUI settings for mng playback (feature not implemented yet!)
- MNG recording (MAME based emus):
  - Set folders in "MNG Videos" (Preferences screen, "Folders / Files" tab)
  - Record video via "Advanced Users" / "MAME" / "Record Video"

## [4.7.6.2] - 2005-12-15 U

- Error when saving custom game options (default MAME ini not being defined) ... this error was very hard to find. I guess this was another code that got corrupted

## [4.7.6.1] - 2005-12-15 U

- Key strokes not working when enabling an arcade controller (Preferences screen)

## [4.7.6] - 2005-12-13 U

### Fixed

- Default favorites username was being set incorrectly as "default.ini". The extension is always ".el"
- Games that require bios not running due to a bug in the path scanning
- Error messages "Cannot open file" and errors when saving emulator configurations and games custom options due to emulator filename not being selected

## [4.7.5] - 2005-10-18 U

### Fixed

- Sorting by manufacturer not working
- Control type not correct for lots of games
- Games tooltip hints not displaying the correct string in columns other than description
- A few more memory leaks caused by the IconTools component... there are a bunch of leaks caused by this component that I've been unable to fix :_(
- Game play time and times played not being updated after playing games
- Read-only checks on files before updating and/or saving to prevent crash errors
- Error when setting a MAME emulator in the second MAME tab (Emulator Setup). When using only one binary, you must set it in the first MAME tab
- Feature "Delete gamename.zip File" was not deleting AGEMAME games

### Changed

- Games list files (*.el) are updated to support "ini_files\control_types.ini". Unfortunately you will have to recreate your games lists... except for Daphne games
- Unique sound clips folder for each system (preferences, "Folders / Files" tab)
- Background images for messages and input box screens
- Buttons icons (<frontend>\resources\images\toolbars\buttons)
- Removed the "flat" state of all buttons

### Added

- New File "<frontend>\ini_files\control_types.ini" containing a list of all control types listed in -listxml output (MAME based emulators)
- Option: "Display Read-Only Message" (preferences screen). A warning message is displayed when attempting to write on an existing file that is marked as read-only (disabled by default)

## [4.7.4] - 2005-10-09 U

### Fixed

- Check for duplicates in "Alternate Batch Files" feature (read/write/add)
- Alternate batch settings saved on "<frontend>\ini_files\alternate_batch.ini"
- Custom screen for alternate batch feature (main menu "Advanced User" / "Alternate Batch Files")
- Tons of memory leaks are gone (FastMM4)
  - Thanks to Christophe De Vocht for letting me know about this library
  - Not fixed memory leaks caused by "TCoolVirtualListview" and "IconTools" components... :_(
- MAME based games list files (resources\*.el) being deleted if user cancel the create games list

### changed

- Alternate batch files support on all emulators

### Removed

- Option "Windows XP Header Style" in Preferences screen

### Added

- Support text files (.txt) in open dialog's extension filters
- Custom colors for splash screen texts and progress bar (preferences screen, appearance tab)
- Support for MAME v0.100u4

## [4.7.3] - 2005-09-30 U

### Fixed

- Feature "Extra Command Line Parameters" in Preferences screen, Emulators tab was working only with MAME games
- Relative paths not working when searching games .zip files (bug introduce in v4.7.2)
- Feature not working: "Fill All Clone Columns"
- Full .ini path not showing in "MAME Settings" screen ("Read Ini File" button's hint)
- MAME games not auditing correctly if a game of different system was selected before starting the audit
- Password not being set when using "Parental Lock Editor", when a password is already created
- Error when using "Save To HTML" menu options in audit screen
- Some bugs related to the parental lock feature
- Error "File is being used by another process" when trying to extract version info from emulator binaries
- Error when reading paths surrounded by quotes. This also fixes ROM search when running games and scanning for audio samples. The following mame.ini entries are fixed: rompath, inipath, samplepath, ctrlr_directory
- Info was not being displayed for certain games in "Game Documents" and "Automatic Game Information" features
- Read/write errors in MAME Plus! ini files

### changed

- Renamed "Fill All Clone Columns" to "Fill All Clone Entries"
- Export games list have more output options
- Decryption is not used anymore when adding games to parental lock. This also prevents breaking the password inside the parental lock file
- Several improvements to "Parental Lock Editor" screen...
- Moved all "advanced user" settings to a new tabsheet called "Advanced User" (preferences screen, "General" tab)
- Favorites Manager is now called "Favorites - UserName Editor"
- Default profile entry removed from "<frontend>\ini_files\favorites.ini" file
- Screen "Favorites - UserName Editor" updated, optimized and bugs fixed
- Unsupported settings in "mame.ini" of newer MAME versions are separated in a new tab called "Unsupported" (MAME Settigngs screen)

### Added

- Audit support for all MAME based emulators (MAME, AGEMAME, PinMAME) Each system has its own audit menu options
- Option "Import Games List" in "Parental Lock Editor". Use this new button to import an entire games list to the parental lock list (advanced users only)
- Multiple profiles can use the same favorites file

## [4.7.2] - 2005-09-15 U

### Fixed

- MAMu_ icons are displayed in tiles view mode (stretched to 48x48)
- Games popup menu option "Delete Audio Files" was not poiting to the correct folder before deleting audio files
- Load/save function in "MAME Settings" screen (emulator setup and games custom options) was not setting to the correct "mame.ini" file, according to the selected system (MAME, AGEMAME, PinMAME)
- The initialization filename (.ini) of MAME based emulators was not being correctly set in the read/write functions (MAME Settings screen)

### Changed

- New file: "zinc.ini". It's a list of ZiNc games and its driver name (required to use ZiNc)
- All extra initialization files moved to a new folder: "<frontend>\ini_files\"
  - The following files must be moved to this new folder:
    - catver.ini
    - nplayers.ini
    - favorites.ini
    - sequels.ini
    - hiscore.dat
    - GameDescription.ini
    - GameCategory.ini
    - GameFont.ini
    - daphne.ini
    - zinc.ini
    - bios.ini
    - biosset.ini
    - controls.ini (support not implemented for this file yet! but it will be...)

### Improved

- Added missing settings for MAME Plus! (MAME Settings screen)

### Added

- Support to create custom driver options for ZiNc drivers and run games with these settings
- menu option: "Emulators Versions" in "View" main menu, to display the version info of all emulators in use

## [4.7.1] - 2005-09-10 U

### Fixed

- MAMu_ icons was not malfunctioning when switching between view modes and when toggleing "Show Large Icons" in "TreeView Settings"
- favorites lists were not being loaded when switching to favorites view
- game selection was not being properly handled in "large icons", "small icons", "list", "thumbnails", "tiles" view modes
- error in load/save routines in ZiNc settings screen
- Game .zip file was not being search when using custom settings (ZiNc games)
- mameinfo.dat and history.dat are now part of the frontend (Preferences screen)
- Error when unzipping files if the "temp" folder does not exist

### Changed

- ZiNc config files are now stored in EL's directory tree ("resources\zinc_cfg\")

## [4.7] - 2005-09-09 U

### Fixed

- Improved and fixed a few bugs in the initial setup when doing a clean install
- Frontend freezing if clicking button OK when emulator not found ("Emulator Setup" screen)
- mameinfo.dat and history.dat are now part of the frontend (Preferences screen)
- Error "menu index out of range" when trying to run games, due to missing "ctrlr" entry in "mame.ini"
- Error when renaming and deleting files inside .zips
- Verification of "ApplicationEXE.manifest" if filename of frontend's binary is renamed by the user (WinXP themes only)
- Error when unzipping files if the "temp" folder does not exist
- Access violation when trying to re-audit a game (audit screen)
- Selected game index does not reset anymore after adding a game into parental lock, when parental lock is enabled
- Dozens of preview images fixes due to the new Graphics32 version 1.7.1 :D
- A few features were not working when running games
- Error when total play time exceeds a 32-bit integer value (+ 2147483647)
- Updated games filter to include the new source code filenames of Sega System 16, System 18 and System 32
- Megatons of minor bugs (both internal and visual)
- MAMu_ icons works on Windows 9x system without any problems now ...no more "Cannot Write TImageList To Stream" error
- Error when extract file properties
- Error when trying to save a file when a directory do not exist. Directories are automatically created now
- Error when enabling parental lock without first creating the protected games list, and hitting the cancel button while in parental lock editor
- "Random Games Preview" feature had a few bugs due to changes in latest MAME
- The random games preview's warning panel was not being shown after a game

### Changed

- Renamed all MAGE strings to AGEMAME
- Image types selector buttons (main toolbar and images tool bar) is now grayed out when images is disabled
- Updated game custom command line / driver custom command line. Every system has a folder now:
  - MAME (customcmd\mame) / (drvcustomcmd\mame)
  - ZiNc (customcmd\zinc) / (drvcustomcmd\zinc)
  - Daphne (customcmd\daphne) / (drvcustomcmd\daphne)
  - AGEMAME (customcmd\agemame) / (drvcustomcmd\mage)
- Format of custom appearance .ini files updated to support multiple emulators. Now there are 4 sections: [mame], [zinc], [daphne], [agemame]. Games must be placed on their correct section:
  - "CustomDescription.ini" (sections for mame and zinc)
  - "CustomCategory.ini" (sections for mame and zinc)
  - "CustomFont.ini" (sections like [aquarush¬mame])
- Temporary folder moved to "frontend\temp"
- All temporary files are created in the new temporary folder
- Game size info merged into games list files
- All games list files (.dat) merged into one big file and the extension is renamed to ".el", except images and icons
- New filename system. I recommend you to NOT edit those files manually:
  - "mame.el" -> MAME games list
  - "mame_roms.el" -> MAME ROM files list
  - "mame_samples.el" -> MAME sample files list
  - "gameplaytime.el" -> times played and total play time of games
  - "zinc.el" -> ZiNc games list
  - "daphne.el" -> Daphne games list
  - "agemame.el" -> AGEMAME games list
  - "agemame_roms.el" -> AGEMAME ROM files list
  - "cgames.el" -> custom games list
  - "parental_lock.el" -> password protected list of games
  - "default.el" -> default favorites list of games (all systems)
- Core completely rewritten:
  - Details view mode now uses the same component as grouped tree (Virtual TreeView)
  - Entire games list is loaded only once
  - "TreeView Settings" feature (view mode) now works with details view mode
  - Custom description for image types
  - Standard ListView replaced by CoolVirtualListView from Jim Kueneman
  - All icons, except MAMu_ icons, are 24-bits (Win9x) and 32-bits (WinXP / WinVista)
  - Small icons (16x16) converted to 24x24 size, except games list icons
- Column size and position work again in details view mode
- Replaced the label progress by a real progress bar (status window)
- Renamed items:
  - "Grouped Mode" to "Grouped Tree"
  - "Big Icons" to "Large Icons"
  - "Grouped Mode Settings" to "TreeView Settings"
- Lots and lots of visual updates in all screens
- Frontend icons are merged into one folder and they all have descriptive names
- Resized "NoSnapshot" file and all image types use the same image
- "picture(s)" labels renamed to "image(s)"
- Removed 8 chars limitation from name and clone columns
- Reduced support to two (2) MAME binaries
- Tool bar buttons moved to "Advanced Users" main menu, "MAME" section:
  - "Save MAME to Wav"
  - "System Bios"
  - "Controllers"
- File "gameplaytime.el" format changed to support multiple emulators
- Favorite lists format changed to support multiple emulators
- Sound clips for other systems must be placed into sub-folders of main sound clips folder: "zinc", "daphne", "agemame"
- MAMu_ icons are dynamically loaded. Icons will be loaded while scrolling the games list. Many thanks goes to "Christophe De Vocht", coder of the great EasyMAME frontend.
- Game snapshot folder/zip file in Preferences screen for MAME and AGEMAME emulators are for frontend usage only. All snaps folders/zip files information are saved in "EmuLoader.ini". If you want to assign a snapshot folder for these 2 emulators you MUST do it in "MAME Settings" screen
- Extra command line parameters tool bar button to include all systems
- Frontend guide file updated (see "el-quick-setup-quide.txt")

### Removed

- Games Legend screen (info is not "that" useful!)
- Images "special effects" box from Preferences screen
- Option "Minimize Frontend" (frontend ALWAYS minimizes before running games now)
- mameinfo and history read/write support from mame .ini files
- Folder "resources\temp"
- A bunch of unused source codes and a lot of old and unused memory variables
- Download picture types. Use "MAWS Game Info" for viewing
- File "ParentalLock.pwd" (password is merged in "parental_lock.el" file)
- Extra "no snapshot" files
- Option: "Verify Emulator CRC32 Checksum". Enabled by default
- Folder "images\toolbar_xp"
- Option: "Hide Navigation Panel" (Preferences screen, Images tab)
- Option: "Create MAMu_ Icons List" (games popup menu)
- Option "Rename ROM File" (audit games), due to .Zip files being corrupted
- Emulators selection button in buttons toolbar
- Option "Recursive Folders"
- DOS MAME Support
- Options from random games preview feature:
  - "Display Warning Message": The initial message is always shown when enabled
  - "Display Warning Panel": The panel cannot be hidden anymore, so you can know that this feature is enabled!

### Optimized

- Entries and sections in "EmuLoader.ini" file
- Input box background image and window layout
- Amazing speed-ups and optimizations of preview images display due to Graphics32 v1.7.1 and GraphicEx II unofficial
- Sound clips support have improved due to new FMOD v3.74
- Create games routines
- Game filters selection
- Unzip files are faster
- Frontend icons load process
- Games view modes
- Automatic scan of sub-folders when searching for games files (except ZiNc and Daphne)

### Added

- "Display Total Images" (images tool bar button). Enable this so EL can scan all images of the selected game and display a label in the format "01 of xx". This scan is made in real-time. You can now dump the file "images.el"!! :)
- "Load 'No Thumbnail' Images" option -> load a no image instead of leaving it blank when in thumbnails mode (it uses more memory!). Max size is 90x90 pixels
- Button "Exit" in MAWS browser panel
- New "Special Effects" button in images tool bar with the following options:
  - all image special effects from the preferences screen: "Stretch / Stretch Larger / Aspect Ratio / Fixed Aspect Ratio / Transparency"
  - "Show Info" -> show/hide the filename and resolution info text
- Image info in the top left of the preview area
- Settings for the new image info text (Preferences screen, Images tab)
- Support to run MAME games thru batch files (.bat), with a new feature called "Alternate Batch Files" (Preferences screen, Emulators / MAME tab). This is for advanced users only and only works with MAME games. Also, this feature is intended to be used with Johnny5 Viewer
- New file selection: "Alternate Batch File" (Preferences screen, Folders / Zip Files tab). You need to select a .bat file before using "Alternate Batch Files" feature
- Option: "Fixed Aspect Ratio" (images tool bar, "Special Effects" button). Resize image for a real aspect ratio. Mimic MAME's hardware stretch. "Aspect Ratio" must also be enabled!
- Option: "Multiple Games Selection" (Preferences/Games). Use this to select and add multiple games to parental lock at once or to add/delete multiple games to/from favorites lists. Warning: Avoid enabling this feature for normal frontend usage though
- All updates for latest MAME including MAME Plus! (MAME Settings screen)
- New image filter: "Draft" (same as Linear but it seems to be faster)
- Support for newer compression specs of .gif;.jpg;.png images (zlib v1.2.2)
- New column: "Hi-Score". Display if a game has support for high-scores, based on "hiscore.dat" file. Note: only master games are scanned due to performance issues
- Shift+left mouse click select previous image type
- Support for ZiNc emulator:
  - merged games are NOT supported
  - fill all columns with data (requires a MAME games list already created)
  - only one emulator is supported
  - support for long folder names
  - field "merged" is used to store the number of the game so EL can run it, based on ZiNc's internal index
  - Default emulator configuration is saved in "zinc_el.cfg", ZiNc's main folder
  - Support for settings in one line or in multiple lines (one setting per line)
  - Audit feature is NOT supported
- Support for Daphne emulator (laserdisc emulator):
  - columns are empty because Daphne have only description and game name info
  - merged games are NOT supported
  - "DaphneLoaderInfo.ini" file required to create games list correctly
  - only one emulator is supported
  - Frame files must have the same name as its game name
  - Audit feature is NOT supported
  - Real laserdisc players are not supported yet
- New games view modes. Now you have the following view modes to choose from: large icons, small icons, list, details, thumbnails, tiles, grouped tree, group list by...
- New group view feature: "Group List By" (view mode toolbar button). This is a whole new way to group items. Works with large icons, small icons, list, thumbnails and tiles
- New option: "Re-Index Games File" (Advanced User menu). Fix bug if games are not being grouped correctly ("grouped tree" view mode only)
- New picture types (based on CrashTest's classifications), making a total of 14 image types: Select, Versus, Wallpapers, Hardware, Custom 1, Custom 2, Custom 3
- Preferences options for ZiNc (Preferences screen, Emulators / ZiNc tab):
  - "Break Settings in Config Files": separate each setting in "el_zinc.cfg" file
  - "Use MAME Games Info": fill columns that don't have data (based on MAME)
  - "Extra Command Line Parameters": run ZiNc with unsupported parameters
- Images toolbar browser with several buttons: Previous/Next image, Previous/Next image type, Preferences and Special Effects, Image type selector
- New Delphi components:
  - IconTools v2.01 from Jan Peter Stotz: Replace for the old TIcon component. Load icons at any size, detect color depths and alpha-channel
  - madExcept v2.7g (madCollection 2.7g): Errors manager. Win9x will never freeze again!
- "Tool Bar Editor" / "Images Tool Bar Editor" menu items (Advanced User menu). Hide buttons you don't want or the entire tool bar
- Dozens of new visual customizations for games lists
- Preliminary support for more speaker systems settings.
- "Reload Icons" (MAMu_ icons) -> reload icons to update changes you may have made in gamename.ico files
- Each supported emulator can have its own set of image folders / zip files (Preferences screen, Folders / Zip Files tab)
- Preferences options for Daphne (Preferences screen, Emulators / Daphne tab):
  - "Don't Create Log File": don't send info to server (v99.6 and newer)
  - "Extra Command Line Parameters": run Daphne with unsupported parameters
- "Games List Not Found" (Preferences screen, Miscellaneous tab). Actions: "Ask", "Auto-Create", "Skip"
- "New Binary (Preferences screen, Miscellaneous tab). Actions: "Ask", "Auto-Create", "Skip"
- "Re-Index Games List (Preferences screen, Miscellaneous tab). Actions: "Ask", "Auto-Create", "Skip"
- "Use Emulator" (games popup menu). Select what emulator you want to use (MAME only)

## [4.6.4] - 2004-09-28 U

### Fixed

- Create games list was not working for MAME versions 0.84 and up ("-listinfo" removed from the emulator)
- Missing leading zeroes in CRC32 checksums (to always force 8 characters)
- All features that require the file "resources\ROMs.dat" will not be executed if file not found (refresh, audit, run game)
- Access violation when auditing a ROM with no given CRC32 and/or disk image with no given MD5
- When starting EL in full screen, the main menu was reappearing again after calling popup menus or opening screens. I finally got rid of this nasty bug! :)
- Error when downloading game pictures from MAWS, if the destination directory didn't exist
- Several bugs in grouped mode
- Columns Editor works 100% now, for both normal and grouped lists :)
  - Note: the same profile is used for all view modes
- Description column size can now be set in columns editor screen, but the column cannot be moved
- Windows XP interface style will not be activated is "EmuLoader.exe.manifest" file is not found (even if themes are enabled)

### Changed

- A bunch of texts (menus, messages)
- Each emulator now have its own section in "EmuLoader.ini"
- Sound clips folder now shares MAME wave write feature. All wave outputs from MAME will be recorded in the same folder as sound clips
- For MAME v0.84 and up, the "-listxml" output will be used directly (file "xml2list.exe" is NOT required). Older versions of the emulator must use the old method though
- Reduced audio formats to 3 (.mp3; .wav; .ogg)... sound clips feature
- Menu items moved to "Advanced User" main menu:
  - "Random Game Preview" (from "Games")
  - "Columns Editor" (from "View")
  - "Save/load MAME input / INP Filename" in the new "MAME Input" sub-menu (from "Games")
- Arcade controller images are now zipped into one file, "resources\images\controllers.zip"
- Toolbar icon sets updated
- Game documents toolbar button moved to games popup menu
- Mouse / Light Gun toolbar buttons moved to "MAME" tab in "Preferences" screen. These options are now loaded/saved in "EmuLoader.ini"
- Arcade Controller toolbar button moved to "M.A.M.E." tab in Preferences screen. This option is to be used with MAME
- Column profiles format changed. New format for easier editing. I don't remember if this was already changed though, since I never used this feature...
  - Also, all profiles are saved in "resources\columns" folder now. The file "EmuLoader.ini" now only keeps the profile filename being used so it can be loaded when restarting the frontend
- When saving audit results to html files, the output will be the same as the audit columns profile

### Removed

- Menu option: "Open Game's Internet Page". Not required anymore due to MAWS browser :)
- User profile completely removed due to a hard-drive crash (damn... again!) and because I'm not willing to rewrite it all over again (was in the middle of a full rewrite...) :_(
- Lots of duplicates... and triplicates (menu items, popup items, toolbar buttons). You don't have the same option copied in menu, popup and toolbar anymore... only in one place. This will make future updates a lot easier
- Main menu "Games". All items are in games popup menu
- Arcade controllers image file selection (Preferences screen)... see change #7
- Visit homepage buttons of the arcade controllers (Preferences screen). There are link to the web pages in "Help" main menu
- Toolbar buttons removed: "Game Documents", "Mouse", "Light Gun", "Arcade Controllers" (see changes for more info)

### Optimized

- Standardization of lots of texts (menus and buttons captions, feature names)
- Create games list feature
- Huge source code clean-ups and optimizations
- Windows XP icons are used by default if themes are available (on a clean installation)
- Read/write of "EmuLoader.ini" file... and a bunch of other files
- Audit games feature
- Columns editor feature. Note: unchecked items are now grayed out
- Emulator detection routines

### Added

- Option: "Use XML" for each emulator binary (Emulator Setup screen). Enabled by default. Uncheck this box if you are using an emulator older than v0.84
- Write MAME output to wave file (MAME 0.84 and newer only!). To activate it, check the new toolbar button in main screen (last button).
  - Files will be saved in the same folder as sound clips files (Preferences screen, "Folders / Zip Files" tab), and will use the name of the game, plus an index number of four digits, if a .wav file is already found (like snapshots).
- Audio formats for sound clips can be selectable (see the new "Audio Formats" box in "Sound Clips" tab, "Preferences" screen). Useful when using only one audio format, to make games scrolling faster
- New driver status: "Test" (for MAME v0.84 and up)
- New in audit screen:
  - New menu item: "Show Icons Legend" (audit screen): Display a list of icons and their meaning...
  - New file/game status icons: An entire new set of icons, now in 32x24 pixels size
  - Audit columns editor: Same as games columns editor, but for the audit screen. You will find it in the audit popup menu

## [4.5.1] - 2004-06-10 U

### Fixed

- Sound clip VU meter / spectrum screen is not disabled when playing games anymore
- Automatic game info was not working properly
- Neo Geo clone games were being added as classic games (all of them!)
- Game size info of merged games does not show zero anymore (the parent .zip file size is used)
- Double-click in grouped mode is added again

### Changed

- Fake status bar replaced by the StatusBarPro component that can process click, each panel has its own hint and it can hold components inside panels
- FMOD library updated to v3.73

### Optimized

- Game size info
- Status bar panels have a fixed size now
- Location where downloaded game picture is saved is now shown in the message window

## [4.5] - 2004-06-06 U

### Fixed

- Proper detection of "Hyper Neo Geo 64" games into "Neo Geo" category / game filter
- Audit seems to work fine now. Still need to verify this though :)
- When auditing single games, every time you audit a new game without closing the audit window, the status bar info is correctly updated :)
- Options "Audit All Games" and "Audit All Available Games" getting disabled when closing the audit screen
- "Automatic Game Information" works 100% again (or so I think)
- Forgot to save the grouped mode background image info in "EmuLoader.ini"... heh, sorry :|
- "Times Played" "Total Play Time" not updated after quitting a game, when in grouped mode
- Audit screen not being freed from memory if closing it with the window close button instead of the "Close" button
- Very veird access violation bug in "Automatic Game Info" feature ven there are no info for a game (bug in all modches, exchept grouped modche)
- "Merged" status is now shown when auditing a merged game that is ok but the .chd file is missing (clone games only)
- "Save Bad Games To HTML File" works again
- A few "Parental Lock" bugs (thanks Marshall Brooks):
  - Access violation in "Parental Lock Editor" when "catver.ini" is not found (category is always empty in this case)
  - Games list not updating when enabling parental lock, after accessing "Parental Lock Editor"
  - Message confirming changes loss after clicking "Ok" button (to save blocked list) in "Parental Lock Editor" (it should this ask only if clicking the "Cancel" button)
  - Access violation when trying to run a game in the "Games Found" list in "Parental Lock Editor"
- A lot of cosmetic bugs
- Load and save MAME .ini / games custom .ini / delete custom game .ini files were not being correctly handled if emulator in folder different than frontend's main folder
- Bugs in the "Custom Game Description" / "Custom Game Category" features (thanks Marshall Brooks)
- Color of sorted column is properly set (grouped mode)
- Sorting in column "Times Played"
- Delete custom category was not working when in grouped mode (thanks Marshall Brooks)
- Function "FindGameName" was not working in grouped mode (needed in a couple cases)
- A bunch of string sentences in the frontend
- MP3 files with variant bitrates were not being played with 100% of accuracy
- Font in the windowed auto game info was not being updated (thanks Marshall Brooks)

### Changed

- Audit system:
  - "Show Only Bad Games" now really hide good audited games :) Also, this menu is now an ON/OFF option
  - "Audit Game Again" now can be used at any time, even if you have thousands of audited games in the list... and the best part is that the selected game is really deleted from the audit list before it gets audited again!!!! :D
  - Status bar info is simplified (Panel #1: Games being audited, Panel #2: Audited games that are OK, Panel #3: Audited games that contain errors, Panel #4: Messages/progress bar)
  - Popup menu replaced by a BcBar PopupMenu (same as main screen)
- All popup menus and main menu font names changed to "Tahoma" (it was "Ms Sans Serif" since day one)... the default font used in the entire frontend is "Tahoma" size 8
- mame.dk URL replaced by the almighty MAWS database
- The current selected emulator will always be used to create a new games list, not based on the "default emulator" selection in "Emulator Setup" screen anymore.
- Toolbar icons updated
- Recompiled with: FMOD v3.72, ZipForge v2.54
- Merged "Custom Game Description", "Custom Game Category" and the new "Custom Game Font" in the same window (Custom Game Appearance)
- "Cheats File" now accept multiple files (MAME Configuration)
- Automatic Game Information moved above the game snapshot to fix other visual bugs
- Picture navigation panel relocated to inside the picture's area and it's now transparent. Picture number font is not customizable anymore
- Source file "spectrum.pas" modified for better support :)
- Dialog box for image files selection replaced by an image dialog box (it shows a sample of the selected image)
- Images support reduced to 10 snapshots per game (for each picture type, not 10 in total). Extra files go from "gamename.png" plus "gamename0000.png" to "gamename0008.png"
- Title snapshots and game snapshots support only the .png image format from now on (no point supporting other formats)
- "Automatic Game Info" in "Appearance" tab / Preferences screen is renamed to "Game Documents". The custom appearance (font and background color) works for all game info panels
- Renamed the "Use Virtual List" to "Show Total Pictures" (snapshots feature). Check this option if you want to view "0 of 10 pictures" label in pictures preview area instead of the current number of the snapshot.
- Renamed "Create Pictures List" to "Create Total Pictures List". If you want to rescan your pictures files, just this menu
- Replaced a few input boxes by a custom and larger input box
- Buttons Yes / No / Ok when using arcade controllers are now set to player 7 buttons 6 and 7 (buttons 2 and 3 for Devastator II controller)
- Audit results to HTML is reformatted with more info

### Removed

- "Default Emulator" feature in "Emulator Setup" screen. This has always been useless since you could not create a new games list based on the selected emulator in main screen
- Translation system. Emu Loader is now English only
- Keys Assignment
- Pictures navigation panel (see changes #10)

### Optimized

- Audit system
- Grouped mode
- Switching between view modes
- "Automatic Game Information" is loaded to memory at startup, before loading the games list (much faster)
- none (testo originale riportava duplicato Optimized: none)

### Added

- Hide columns in grouped mode works (Columns Editor). Be aware that re-positioning columns in the grouped mode does NOT work properly yet
- Updates for latest MAME source release
- Preliminary support for "MAME Plus!". See new options in "MAME Configuration" screen :D
  - Notes: "MAME32 Plus!" is not supported since it's a MAME32 build; Palette colors are not customizable for each game (only general)
- Type "Standard" to the controller keys mapping list, both in main screen and MAME Configuration screen (for MAME Plus!)
- "Download Address" (audit). An internet address that works together with the new "Save Bad List Links For Download" feature
- "Save Bad List Links For Download". This is a new output that save in a HTML file, internet links with all games that are bad, for easy management.
- Toolbar button "Extra Command Line Parameters", for easy access. Useful if you want to quickly test new/other MAME parameters
- Columns in "Parental Lock Editor" games lists can now be sorted
- Game font customization (Custom Game Appearance). Customize the font size/type/color for each game in the list (for all view modes)
- New file "GameFont.ini". This file holds the custom font for each game.
- Option "Use Custom Game Font" in "Preferences / Games" screen. Enable/disable custom font for each game in the list
- Window size and column sizes in audit screen are now saved in "EmuLoader.ini", section "Audit"
- "Automatic Game Information" now use the entire pictures panel, when pictures are disabled
- Preliminary support for "No Name MAME" (including a custom icon made by me). See new options in "MAME Configuration" screen :D
- New option: "Verify Emulator CRC32 Checksum". Enabled by default, it generates a CRC32 checksum for each emulator
- Emulators will be handled by the CRC32 checksum :D
- "CRC32 Checksum" display in "Emulator Setup" screen
- New feature: "Random Game Preview" (preliminary). It keeps running random games with a limited time (15 minutes maximum)
  - Settings include: Display Warning Message, Display Warning Panel, Warning Panel Animation, Restore Selected Game, How Many Games To Run, Time To Run Game, Use Available Games Only, Pause Between Games, Pause Before MAME Starts, Blend Preview Window Factor
- Button: Export "BlockedGames.dat". Use this button to export an unencrypted list of the protected games, alphabetically sorted
- Download game images from MAWS homepage directly into EL images folders (.png format only!) :D
- New feature: "Show MAWS Game Info". It shows the selected game's webpage from MAWS, replacing the local image files
- FMOD (sound clips) has its own window now. It shows the known spectrum plus: Current audio position, VU meters, Customizable spectrum image, Transparent window (XP/2000 only)
- New sound clips options: Show Spectrum and VU Meters, Spectrum Image, VU Meter Image, Spectrum Background Color, Blend FMOD Window Factor
- New folder: "resources\images\fmod" for spectrum (.bmp) and VU meters (.png) images.
- Game Sequels. Feature designed for the grouped mode. There's also a new file "sequels.ini"
- New option: "Keep Frontend Settings File Clean". Enabled by default, the file "EmuLoader.ini" is always deleted before being updated
- Rename files inside gamename.zip is re-added (audit only). This will automatically rename filenames inside a game's zip file when auditing. Use with extreme caution!

## [4.4.2] - 2004-02-07 U

-  New version, new audit system, period. :D

## [4.4] - 2004-01-24 U

### Changed

- Everything has changed in this release. You will have to do a clean install if you want to fully enjoy this frontend.
- The minimum resolution to use Emu Loader is now 800x600, but I recommend nothing lower than 1024x768. This was a decision I had to make to, if not stop, make the like of those who use my software (and MAME) for profits, harder. Afterall, this is a Windows frontend, to be used in a PC, not in an arcade cabinet. There are other excellent frontends made specially for cabinets.
- Besides the new filters, you can now use WinXP high quality icons (true color with 8-bit alpha channel).
- Emu Loader has also become "icons skinnable", heh. Just point to a folder where the icons set is, hit update and voila... all icons in the frontend will be changed. It's like magic.
  - Warning: This is a Windows XP feature only. If you use XP icons in a Win9x operation system, your entire system will crash. You have been warned!

### Added

- For those who have seen the preview icons in the forum, know why I dedicated this version to MAMu_ :D
  - This fellow is a Jedi Master when it comes to graphics! But that's not the only reason. He helped me a lot with the new games filters system.
- Let me tell you about this filters system. You have lots of options to choose from. View only games with .chd files or only cps-1 ones... and much more. Master / clone filters were also separated from the main filter.
  - How about viewing only CPS-2 + only available games + unique font color for master games + a unique font color for clone games + a unique color for preliminary/non-working games ? How does that sound ? Good ? ;D
  - You have endless possibilities (well, almost endless)...

## [4.1] - 2003-12-04 U

### Fixes

- Access violation error when switching to "Nearest" smooth mode (preview picture).
  - Probably more "hidden" bugs were fixed too :)
- Memory leak when creating a games list
- A few labels were not being translated, when using a language other than English
- Game samples were not being correctly parsed from MAME's "-listinfo" output, adding samples to games that do not use them
- Game samples .zip files are correctly detected now
- Games bios list detection is perfect now :)
- File "EmuLoader.ini" was being corrupted when the frontend terminates at the initialization
- Memory leak when exiting the frontend
- Memory leak when refreshing games

### Changes

- Preview pictures and game icons .zip filenames are now customizable
- Preview pictures, game icons, faq folder names can have a full path and are no longer required to be inside EL's folder tree (long folder names also supported)
- Preview pictures default ".zip" filenames renamed to meet MAME32 filenames:
  - Title Snapshots: "titles.zip"
  - In Game Snapshots: "snap.zip"
  - Marquees: "marquees.zip"
  - Cabinets: "cabinets.zip"
  - Flyers: "flyers.zip"
  - Control Panels: "cpanel.zip"
  - Control Panel Layouts: "cplayout.zip"
- Section "In-Game Snapshots" renamed to "In Game Snapshots" in virtual pictures file, "pictures.dat"
- Frontend icon files (.ico) updated
- Standard game icons are changed automatically when selecting another folder
- Refresh games feature changed to detect game's sample .zip files

### Removed

- Button "Update" in "Preferences" screen, "General" / "Folder" tab (not needed anymore)
- Button "Update" in "Preferences" screen, "General" / "Games" tab, "Default Game Icons Folder" box

### Optimizations

- Preview pictures
- MAMu_ icons list create function
- Major code cleaning, also removed a lot of redundant and duplicated codes
- Blocked remaining functions to prevent DOS MAME usage (which would generate a lot of errors)
- Refresh games functions are merged, except refresh single game
- Create games list feature
- MAME binary type and version info detection
- Frontend initialization

### New Additions

- Ability to use any filename you want for the preview pictures .zip files and MAMu_ game icons .zip files ("Preferences" screen, "General" / "Zip Files" new tab)
  - Long filenames are supported
- Ability to use any folder name you want for preview pictures, MAMu_ game icons and FAQ files ("Preferences" screen, "General" / "Folders" tab).
  - Long folder names and full paths (with drive letter) are supported
- Confirmation dialogs when deleting MAME files ("Delete Selected" menu items)
- Game samples ROMs list is back
  - The file "resources\samples.dat" is generated when creating a games list
- File "EmuLoader.exe" can receive parameter now. You can force the frontend to run in a specific language, by passing a parameter with the exact filename of the language file. If the .lng filename has spaces, remember to surround the parameter with quotes (  "  ). Also, this feature only works if the file "EmuLoader.ini" does not exist

## [3.9.2] - 2003-06-07 U

### Fixed

- There are a couple fixes as well.

### Changed

- Due to the new MAME 0.71 I had to make a small update in the .zip handling routines so .chd files can be correctly handled for clone games.

### Added

- Also, I added a useful feature to the audit system: "Audit Selected Game (Rename Files)".
    - It means that if a ROM has a wrong name, EL will automatically rename the file to its correct name, without unzipping the ROM and zipping it back... isn't it cool ? Not even WinZIP has this power!!!! :()

## [3.7.1] - 2003-04-06 U

### FIXES

- Access violation error when trying to change sound clips settings, when this feature is not enabled
- Access violation error when clicking on the spectrum panel, while sound clips feature is not enabled
- Compiled with a new version of zipforge (v2.02). I think that the problem some users were still having with fake bad .zip files are really gone... i hope
- The option "high priority" on "custom game options" screen was not being translated

### CHANGES

- Sound spectrum panel turns invisible when the sound clips feature is disabled

### REMOVED

- Audit hard disk images option. Md5 checksum is now being read directly from the .chd file
- File chd md5.ini is not required anymore

### OPTIMIZATIONS

- Hard disk images auditing
- Preview pictures loading
  - This feature has suffered a drastic speed-up... When using zipped preview images (snap.zip, marquees.zip, etc...) the entire list of files from the .zip are loaded into memory. This way, el don't need to keep getting the .zip file contents every time you select another game. This results in a much faster games scrolling :)
  - Note that, by using unzipped preview images, the loading time is always a lot faster, since the image file don't need to be unzipped before showing it.
- New additions
  - Volume control for sound clips
  - Hot-key to enable / disable sound clips: shift+f7
  - Last spectrum mode used is now restored when enabling sound clips
  - All new options from mame 0.67


## [3.7] - 2003-04-02 U

### FIXES

- Sometimes a game could be wrongly detected when creating or refreshing games, if a bad .zip were found
- When hiding "favorite user manager", you could still load the manager from the status bar

### CHANGES

- Default icons 2 is modified a little bit "resources\defaulticons\gameslist2"

### NEW ADDITIONS

- "Sound clips" feature is back and better than ever! :)
- Time time, using the awesome "fmod api". A new dll is needed though. The file "fmod.dll" must be placed in the same folder as frontend's binary. Let me tell you... This api is simply fantastic and very fast. You will not feel any slowdowns when scrolling games or when loading the sound files. And best of all, it uses very little memory. For more info, visit their official homepage at <http://www.fmod.org>
- It supports a lot of audio formats, they are (note that emu loader support all those types!):
  - Microsoft wav: ".wav" (including the new 24-bit and 32-bit pcm wav files)
  - Mp2 and mp3 (including with variant bitrates): ".mp2", ".mp3"
  - Ogg vorbis: ".ogg"
  - Windows media format: ".wma", ".asf"
  - Midi / directmusic: ".mid", ".rmi", ".sgt"
  - Impulse tracker: ".it"
  - Fasttracker 2: ".xm"
  - Screamtracker 3: ".s3m"
  - Protracker / fasttracker: ".mod"
- There is a cool "spectrum" at the bottom of the preview picture area, with two different types. Just click on the spectrum area to switch between the views. Note that this spectrum may have bugs, since i'm not the coder
- Included in the feature's "package" there are a few options to select, but i think that it will work on most systems with default settings... They are:
  - Output type : choose between "windows multimedia waveout", "directsound" (default), and "a3d"
  - Output device : sound devices installed on your system. Usually you can leave it at default ("primary sound driver"). Note that if the sound clip feature is disabled, this option will be empty (fmod works this way)
  - Mixer type : this mixer is just to make possible to play various sound at the same time, with optimizations for specific cpus. There are low quality and high quality mixers, and you can try them all, but the best high quality mixer is selected by default. The four first modes are low quality, and the last four modes are high quality
  - Output rate : samplerate quality for playback output
- There are four extra options that i added to make this feature more "user friendly":
  - Play sound clip : activate/deactivate the feature
  - Loop : make the sound clip play in an endless loop
  - Use parent sound clip : when selecting a clone game, if the clip filename is not found, the clip from the master game will be played, if found
  - Folder : select the folder were all clip files are (files cannot be compressed... A.k.a. "zipped")
- Oh, a final note:
  - It works just like the pictures feature. Filenames must have the same name as the game or the game's parent name (in case of a clone game)

## [3.5.1] - 2003-02-02 U

### FIXES

- I fixed the access violation and the blank texts when doing a fresh install. Sorry folks.
  - Note that those bugs only happen if you do a clean install. Overwriting a previous version does not generate those errors. Still, if you want to get the update, the fixed binary is available on the downloads page, right below the full package.

## [3.5] - 2003-02-02 U

### FIXES

- Finally fixed the sort columns bug, when changing columns order!!! :-D
- Squashed a lot of memory leaks, but I think that there are more
- ST-V Bios was not being correctly audited when auditing all games or available games
- A few visual bugs

### CHANGES

- The last selected game information on EmuLoader.ini now have the game name, instead of an index position
- This fixes a bug in which sometimes, EL could not restore the last selected game correctly on initialization
- Favorites lists are changed once again
  - The lists will not contain the full game info anymore, just the name of the game and its parent game. This allow more control over the list, but it's slightly slower to load (milliseconds only)
  - Note: if you don't want to create your favorites lists all over again, you need to update your favorites .dat files with the "UpdateFavoritesDAT" utility, available on the homepage. Do NOT update your games .dat files with this utility

- Category, Version Added, Custom Category and Custom Description are now loaded dynamically
- They are not saved on the .dat files anymore. This allow more control over those fields, but the load will be slightly slower (milliseconds only)
  - Note: if you don't want to create your games list all over again, you need to update all your .dat files with the "UpdateGamesDAT" utility, available on the homepage. Do NOT update your favorites lists with this utility
- Parental Lock is not available anymore when viewing a favorites games list
- Frontend is now compile with the new version of Graphics32 v1.5
- Bios files can be executed as any other game
- Core updated to support MAME 0.64 changes

### REMOVED

- Main menu options:
  - Total Play Time
  - Selected Game Total Play Time
  - Update Games Descriptions
  - Update Games Categories
- Custom Games Manager
  - This feature had to be removed due to changes in frontend's core

### OPTIMIZATIONS

- Removed a lot of duplicated code
- Translation routines are faster and safer

### NEW ADDITIONS

- Two new columns (they are loaded dynamically):
  - Played - how many times did you played a game ?
  - Time Played - how much time did spent playing a game ? Time format: 0:00:00:00 (days:hours:minutes:seconds)
  - Note that the info is on GamePlayTime.ini file, not on games lists (.dat files)
- New filter for the preview images: Lanczos
  - It makes images look sharper and clearer than the other filter, but it's slower

## [3.4.1] - 2003-01-17 U

### BUG FIX

- Version 3.4.1 has a small change. A new file is added to the package, called chd md5.ini.
- You probably already know what this file does... but I'll explain anyway: it contains MD5 checksums for all .chd files supported by M.A.M.E. 0.63!
  - Be aware that this file has checksums based on the entire .chd file, not just based on the file header. Since Emu Loader can't get the MD5 value like MAME does, it needs to check the entire file. Well, that's the reason why I created this file, so you can be sure that your gamename.chd file is the right one ;-)
  - Also, you can manually add more games into that file, just follow the format and make sure to put the checksum based on the entire .chd file.
  - Please, do not change the MD5 checksum of those games, unless you are pretty sure that the value is wrong. All values came from Santeri Saarimaa himself, so I doubt that they are not correct.
  - Oh, before I forget to tell you... this change is used on the Audit feature.
- Another change, regarding .chd files: the real size of the file, and the checksum will be shown on the audit screen.
- Note that the original MD5 checksums from M.A.M.E. are still available on the resources\ROMs.dat file.

### FIXES

- Automatic Game Information was generating an access violation error on initialization
- Another access violation error when no games are loaded on initialization
- Preview image filename was not being added in the image's hint if the image is unzipped, making impossible to rename/delete images

### CHANGES

- Hard-disk images audit is a little different
  - There is a new file on Emu Loader's main folder, called chd_md5.ini. This file contains MD5 checksums of all .chd files (full file scans)
  - You can manually add checksums for new games, but remember that those checksums are based on the entire file, not just the header (as MAME checksums)
  - Also, the file size is also shown, based on the real size of the .chd file (MAME only shows "0 bytes")

## [3.4] - 2003-01-15 U

- Preview images are now unzipped directly to memory
- Delete Pictures and Rename Pictures are done directly inside the .zip file, without the need to unzip them first

### Fixed

- Custom resolution value was not being read correctly on MAME Default Options and Game/Driver Custom Options screens
- Inverted sorting when initializing the frontend with favorite games
- When switching between normal and favorite games, the last selected game was not being selected
- Get 3rd Emulator Default Description menu option was not getting the description from the third emulator binary
- Rename Picture and Delete Current Picture was not working if the snapshot folder was not inside Emu Loader's folder (in-game snapshot only)

### Changed

- Logo image design is changed a little bit (no progress bar anymore)
- File resources\images\topwindow\GameColumns.png is changed
- Columns can't be changed by "drag and drop" anymore
- Show / Hide Games List Columns menu item is renamed to Games Columns Editor (main menu View)
- Message Digest 5 routine (MD5 checksum) is replaced by a new one that gives a correct result for huge files (100Mb and up)
- The old ZIP / UNZIP routines are replaced by the ZipForge component, which works much better... and easier :-D
- The good thing: no DLLs are required anymore.
- The bad thing: games list create and games update features are faster, hehe

### Removed

- Progress bar totally removed from the project
- ALProgressBar component is not needed anymore
  - Show Progress Bar Border option
  - Logo pb.bmp files are not needed anymore (progress bar images)
  - File unzip32.dll is not required anymore

### OPTIMIZATIONS

- Audit Games feature is super fast!
- Replaced a bunch of variables by arrays. Arrays use less RAM memory to store data, and it's easier to maintain the source code
- Show Pictures is a little faster
  - If you select a master game, and then select one of its clone games, the picture of the master game will not be reloaded, saving time and speeding up the games scrolling
- Automatic Game Information loading is a lot faster (all texts are loaded into a memory stream)

### Added

- Columns Order Restore implemented and fully working!!!! Finally, I did it :-D
  - Thanks AzzaAzza69 for his BIG push... again :-D
  - All columns can be hidden and be at any order you like (except Description column)... and best of all, when you restart the frontend, their positions and sizes WILL be restored the way they were
  - It has a major bug though. Depending on where you put the column, the sort routine doesn't work :-(
- Detection of bad and empty .ZIP files... finally
  - Emu Loader will not lockup if a corrupt, incomplete or empty .ZIP file is found! :-D
- Preview images are now unzipped to memory, thanks to ZipForge
  - Games scroll is a little slower though... or it's just me ???
- Replacing the progress bar, a "xxxxxx of xxxxxx" text will be shown in the status window so you can track progress
- Added a progress bar on Audit screen when auditing the large .chd files :-)
- New implementation of Rename Current Picture, Delete Current Picture, Delete All Extra Pictures features
  - Rename / delete pictures directly inside the .ZIP file. No need to unzip pictures before renaming/deleting...
  - Note that it may take a few seconds to rename/delete the files inside the ZIP, depending on the contents of the file
- Added game FAQ to the Automatic Game Information feature
- All new options of MAME 0.63 are added (I hope I didn't forgot anything):
  - Pause Brightness
  - Log to Debug
  - Skip Disclaimer
  - Skip Game Info
  - RDTSC (Win32 MAME only)
  - inipath can now be empty (???)
  - ST-V Bios and all its games are being correctly detected
- Controller Keys also works with DOS MAME now

## [2.9] - 2002-05-29 U

### Fixed

- Fixed lots of bugs on the arcade controllers support
- Fixed a bunch of visual bugs
- Fixed a bug that was not showing transparent colors correctly in images, due to a mistake in compilation (transparent .gif and .png)
- Fixed a new bug that was not deleting the game from the list, when refreshing or deleting the game, due to the new game filter buttons
- Fixed a bug when viewing M.A.M.E. documents on View Text File screen. Now the documents are being correctly displayed
- The Num Lock bug is totally gone!
  - This key doesn't need to be handled anymore
  - You can leave the Num Lock key at any state, but for the controllers Hot Rod, SlikStik and X-Arcade to work correctly (on EL's GUI), it's recommended that the key be in ON state always
  - M.A.M.E. 0.60 handle this key correctly for a lot more games now (various games still doesn't restore the key correctly, though)
  - Just make sure that the key stays ON when navigating in the frontend
- Fixed games list to correctly detect the new PGM bios and it's games Oriental Legend is the only game I found in the -listinfo output
- Fixed a folder bug when viewing M.A.M.E. documents
- Fixed the detection of CVS bios and it's games
- Fixed a bug when executing M.A.M.E. and custom games in Windows 2000 or Windows XP
- Forgot to add the Control Panel Layout custom color entry on EmuLoader.ini file, sorry...
- Fixed a bug that was not always changing the custom colors of games list and pictures on startup

### Changed

- Frontend is now compiled under Windows XP
- Windows XP themes compatible! If you're having problems, just remove the file Emuloader.exe.manifest from the main folder
  - There are lots of visual bugs. Delphi is not totally compatible with WinXP themes
- Updated the View Text Files list to include all M.A.M.E. documents
- Changed the default font of the frontend back to Tahoma
- All frontend docs are updated
- Changed the default value of the Language entry from Default to English, on EmuLoader.ini file
- Changed the controllers images height from 305 to 340 (pixels)
- The installation package is now compiled in Windows XP
- The icon of the installation package is now a WinXP icon
- Reimplemented the abort feature when clicking the Cancel button in Emulators Setup screen, on the first execution of the frontend (the frontend will terminate)
  - Warning: This feature is not extensively tested, and if used too many times, it might decrease memory resources in Windows

### Removed

- The component SM Version Info is not used on Emu Loader anymore
- The component TdxButton is totally removed from the project (WinXP button)
- The component Color Picker Button is not used on Emu Loader anymore

### Added

- Added support for the X-Arcade controller on Emu Loader's GUI (see Preferences screen)
- Added support for the SlikStik controller on Emu Loader's GUI (see Preferences screen)
- Added an option to invert the second player stick for new SlikStik controllers, which have the UP / DOWN inverted
  - The option Swap Stick is located on SlikStik tab, Preferences screen
- Added support for the new ctrlr folder (controller key mapping). See MAME Default Options screen
- Added an option to select the controller keys mapping in MAME Default Options screen, under Sound / Controllers tab

## [2.7c] - 2002-01-17 U

### Changed

- Three more translations are available. Spanish, Croatian (still waiting for the .lng file, Josip) and Chinese (Simplified) languages. I just hope that this list grow even more (I can't translate to any other language than Portuguese - Brazil)
  - Important Note: for the Chinese (Simplified) language, you need to set the frontend's font to simplified Chinese, or you will not see the texts correctly.
  - Again, if anyone wants to translate EL to another language, please, contact me. But be aware that the translation must be done without spell errors!

### Added

- There are a few extra logos on resources\images\logo folder
- Added background image support for progress bar (in status window). Just create a .bmp file with size 417x18, name the file the same as the logo filename, adding a " pb" string (space + pb), and put it on resources\images\logo folder
  - e.g.: MAMu_ Logo 1.jpg (logo filename)
  - MAMu_ Logo 1 pb.bmp (progress bar filename)
- Added two option on Preferences screen to change the logo file
  - Splash Logo: Just select a logo file to use (splash and about screens). Only the .jpg format is valid (no restart needed)
  - Show Progress Bar Border: Show/hide the frame box of the progress bar

## [2.7b] - 2002-01-08 U

### Fixed

- Fixed the buttons Use Emulator 4 and User Emulator 5
- Fixed an Automatic Information bug, thanks to ~Smitdogg~. It was not showing info from clone game correctly
  - When the Information Data text for clone games is not found, EL will show the text from the master game, if found
- Fixed a bug in the new Automatic Information. It was not showing the history info correctly (getting info from another game. e.g.: Super Space Invaders use the history from Missile Command)
- Fixed a bug that was not updating EmuLoader.ini properly, when you change MAME binary files on Emulators Setup
- The columns size are now restored with their correct values (when using Show/Hide Games List Columns feature)

### Changed

- Finished the full screen mode implementation
  - It's now hiding the title bar as well . However, this feature is not saved on any initialization file
- The New Picture Name Format option is now disabled by default (to avoid confusion with MAME standard names)
  - It's on Pictures tab, Preferences screen
- The option Show Average FPS When Exiting MAME in Preferences screen is changed. It now shows all the ROMs loading process and the average FPS in a window, after exiting MAME
- A couple of cosmetic fixes when switching languages

### Added

- Full support for Windows XP!
- Added an Activate option on Record Sound settings screen. If you only want to change settings, but not activate the feature, just uncheck the option (by request)
- The long folder names for Windows 2000 and Windows XP systems is now fully working!!! Thanks, Ian Patterson
- Added a Game FAQ button to the group of info buttons in the tool bar (by request)
  - The language files are updated with the new Game FAQ button hint (English, Portuguese, French and German are available at the moment)

## [2.7a] - 2001-12-29 U

### Fixed

- Fixed a Win2000 / WinXP bug that was preventing EL to execute MAME
  - Important note, please read: EL works fine with Win2000 and WinXP, only if you don't use long folder names or long filenames. Win9x systems are not affected by this. I don't know when this will be fixed (I need to find out what it's really happening)
- Fixed a default game icons bug
  - The Unable to replace image error message is gone (when selecting a game)

### Changed

- Changed the Vector default icons naming
  - Warning: update your default icons files before using this new build!!!

### Removed

- The file DefaultIcons.ini is delete from the frontend. It's not needed anymore

### Added

- Added a new option on Preferences screen, under Games List tab called Default Game Icons Folder (by request)
  - This option is for the default icons on the games list. Now you can use any set of icons you want. All you need to do, is select a folder that contains all required icons (if one or more files are missing, the icons will not be loaded).
  - The default set used is on resources\defaulticons\gameslist folder.
- There is a new text file called el-defaulticons.txt, located in docs folder
  - This file has the correct naming for all icons categories. Please, do not modify the names or EL will not load them
  - This file can be viewed in View Text Files option (Help main menu)
- Added a Update button below the Default Game Icons Folder. This button must be clicked to update the icons on games list
- The alternate set of default icons is on resources\defaulticons\gameslist2 folder

## [2.7] - 2001-12-20 U

### Fixed

- Fixed an access violation error that after games refreshing, the list has no games
    - When this happens, a new resource image is shown, saying No Games Available (on preview pictures spot)
- Fixed the Show Icons Legends. The proper icons are now loaded from the current default icons set
- Fixed error: Failed to execute program " -createconfig". Error Code2" when initializing the frontend, due to a bug in EmuLoader.ini updating routine
- Fixed the access violation error when switching to favorites games, while real icons is activated
- Fixed an error that was preventing to show pictures between 08 and 11
- Cosmetic fixes everywhere
- Completely rewrote MAME .ini file read/write procedures
  - It's faster and safer, plus, you don't need to put the values on the column 25 anymore, but you need to leave at least one space between the option and it's value. It also fixes a few bugs
  - e.g.: samplepath C:\MAME\Samples is also a valid line for Emu Loader now (MAME already support it)
- Fixed Neo Geo bios information with the new release for MAME 0.56
- Fixed Garou clones that was being shown as classic games. They are Neo Geo clone games (for MAME 0.56)
- Fixed a bug on the custom sample rate (custom game options). It was always setting the sample rate to 4999
- Fixed a real icons bug. It was not building the list correctly
- Fixed a bug when detecting MAME executables. Still not sure if this bug is really fixed...
- Fixed a classification bug when adding unavailable games and bios to favorite lists
- Fixed a few bugs on Custom Games Manager
  - It's working without major problems, now (I hope)

### Changed

- Changed the Tweaks main menu description to Advanced Tools
- Changed the Current User label description on status bar for Favorite User, so it doesn't mix with the new User Profile label description, User Profile
- Update DirectShow unit for Intro Movie and EL Media Player. Now it uses an ActiveX object, instead of an OLE object (better playback)
- Changed a lot of the icons on Emu Loader's GUI. Some of them have a Windows XP compatible icon, but sadly, Delphi6 only support 256 icons
  - Most of internal icons are changed to size 48x48
- Moved a few procedures/functions to a new file: uCommon.pas
  - More will be moved in the future. All common procedures/function will be moved/added to this file (source code issue)
- Most of the Close buttons are replaced by a Ok button
- Updated size and crc info on audit results.
  - If those info are wrong, it will display [correct crc: xxxxxxxx] and/or [correct size: xxxxxxxxxxxx], after the ROM results
- Changed the source folder from Fonts to Source (source code issue)
- Changed the Original filter name to Master. This naming is more correct
- Game size info updated
  - When the option is on .ZIP game size and game is merged, the size shown is from the parent game (it wasn't showing info on merged games)
- Changed the default game icons for another set (the old balls icons are still available)
- Moved frontend's documentation to a new folder called docs
- Update el-customgamesmanager.txt tutorial file

### Removed

- Deleted the support for MAME32
  - Emu Loader will not support MAME32 directly anymore (but you can still use it thru the custom command line and the Custom Games Manager)
- Completely removed the Debugger window. It's not useful for the project anymore, as I need to manually add all debug messages, and it was using a lot of memory
- The file zip32.dll is not needed anymore (never was...)
  - Emu Loader does not create any .ZIP file or add/delete files on existing .ZIP files, so this DLL is useless (unzip32.dll is still required)
- Removed the Available and Unavailable filters from the list filter, since they are not needed anymore

### Added

- Added the most awaited Parental Lock feature
  - Now you can lock games you don't want others to see (specially kids)
  - It works with an encrypted password and an encrypted games list
  - Options are in Advanced Tools main menu
    - Parental Lock: Turn parental lock ON/OFF. Deactivation requires a password
    - Parental Lock Manager: Here you can create the list of games you want to lock. See file el-parentallocktutorial.txt file for more details
- Added the new Emu Loader Media Player module
  - Main Features:
    - Play list: create a list of all valid media formats for continuous playback (.plt extension)
    - Skins: create your own skin for EL Media Player (see resources\mediaplayer\SkinLayout.txt for the format)
    - Formats: lots of audio and movie file formats wav, mpa, mp2, mp3, au, aif, aiff, snd, avi, qt, mov, mpg, mpeg, m1v, asf, wma, wmv, mid, midi, rmi (some formats are not tested and might not work)
    - Loop: EL can loop the media files forever (with or without play list)
  - The option is on Advanced Tools main menu as Play Background Media. But be aware that it doesn't work while the intro movie is active, so when starting the frontend, the movie plays, when it finishes, then the media player starts. The player is in it's preliminary stage (may change in future versions). Also, the play list has a few weird bugs. There is a tray icon (next to the task bar's clock). Go there if the media player looses focus
- Added a preliminary Full Screen mode (Advanced Tools main menu and Games popup menu)
  - It only hides the main menu, toolbar buttons and the status bar. The hot-key is Shift+F2 (only when games list has focus). This feature is incomplete
- Added the Num Lock status restore for all Windows versions, after exiting MAME (this is a known MAME bug)
- New pictures preview option: Stretch Larger Pictures Only (by request)
  - This will stretch down only pictures that are larger than the preview area (smaller images will not be stretched up). This option works only when Stretch on main screen is activated. It's located on Preview Pictures tab in Preferences screen
- Added the awaited Screen Saver
  - View all MAME images with beautiful effects, using Direct3D. This feature requires a video card compatible with Direct3D, and a new DLL d3dx8ab.dll to work (no 3D card, no screen saver... sorry)
  - There are lots of settings (all with hints), including the awesome 32bits textures capability. Formats supported are .png, .jpg and .gif. Zipped images are also supported
  - Where to find? Preferences screen, under the new Screen Saver tab and in the Advanced Tools main menu
  - There are some issues that you need to be aware of (any OS version):
    - When running in Full Screen mode, your Windows color depth can't be at 24bits, unless your card support a 3D mode in this color depth (or your resolution/depth mode will not be restored after exiting the screen saver)
    - If your video card doesn't support 32bits depth, in Direct3D mode, (Voodoo cards), please don't try to use it
    - This feature will not automatically start when Emu Loader is idle, because it will slow-down MAME emulation a lot (and your Windows too). You need to manually start the screen saver (no auto run, sorry)
    - The Animation Random option has some glitches
- Added two more executables options for MAME executables, making available 5 MAME binaries to use (only MAME and DOS MAME are valid!)
- Added the User Profile feature
  - With this feature you can lock any option on the frontend that you don't want others to see or mess with (in very preliminary stages). You can create as many profiles as you want. All protected by an encrypted password
  - There are two new files to store the profiles: UserProfiles.ini which holds all profiles and it's password, and a .dat file containing all options. The .dat profile files are stored on the new resources\profiles folder. Where is it? In the Advanced Tools main menu. See file el-userprofiletutorial.txt file for more details
- Added .wav files support for sound clips feature (by request)
  - Still no support for zipped files (need to figure out how to unzip files in memory instead of in disk first)
- Added preliminary support for language translation (using an external .lng file)
  - Now you can translate the frontend to your own language. Note that the format of the file may change in future releases. To create a translation file, just copy the English.lng file, rename it to the language description you like (e.g. German.lng), open the file and translate the sentences (full descriptions are inside the file)
  - To select a language profile, just select the Language option in Advanced Tools menu. All .lng files found will be added into the languages list for selector. The folder of the language files is resources\language
  - Warning: Japanese, Chinese, Korean, etc... languages are not supported! Don't select the English language, because EL is already in this language. The file English.lng is there only as a base for the translation
- Added the HotRod SE image in Preferences screen with more options. Thanks MAMu_
  - The new required file, HotRodSE.png, is on resources\images folder
- Added history and driver info on Automatic Game Information feature
- If both intro movie and media player are selected, after the intro movie is finished, the media player will automatically start (initialization)
- Added three new filter buttons:
  - Show All Games
  - Show Only Available Games
  - Show Only Unavailable Games
  - Those filters will work together with the other list filter
- Added Parental Lock and User Profile tutorial files on the list of View Text Files menu option
- Added support for Metal Slug 3 and The King of Fighter 2000 clones, so they can be correctly recognized (for Tourniquet MAME)
- Full support for long folder names and long filenames
  - Now you can use both Emu Loader and MAME in folders with long name
  - Note: Custom command line in MAME (Win32) is a little different. Please, if the emulator is DOS based, and if it works like SNES9x, Visualboy Advance, just add a quote character ( " ) before and another after the parameters, if needed. For Win32 based emulators like SNES9x and Visualboy Advance, quotes are optional. MAME based emulators does not need quotes!
- Added a custom resolution option on MAME Options (by request)
    - If a custom resolution is specified, the resolution value is ignored. The format is the same as MAME: columns X lines X color depth Color depth can be omitted (e.g.: 1024x768x32). Only for MAME (Win32). DOS MAME does not have custom resolution

## [2.6.Final.3] - 2001-09-15 U

### Fixed

- If you are getting an error when EL stars (Error Code 2, or something like that), then grab this fix. I forgot to reset the EmulatorType2 and EmulatorType3 values when updating MAME filenames on Emulators Setup screen.
- This fixed binary is optional though, you can manually fix that bug. Just open the file EmuLoader.ini, and, if needed, set to zero (0), the values on EmulatorType2 and/or EmulatorType3, [Configuration] section (only if needed). This is only necessary if there is no filenames on the 2nd and/or 3rd executables...

### Changed

- Just put the new binary on top of the prior release

### Added

- One more thing... The utility to update favorite files (.fav) is also released. It replaces the old Depth info by the new Frequency. Grab it on downloads page (Main Files section)

## [2.6.Final.2] - 2001-09-15 U

### Fixed

- Correction: The Check for Missing Pictures works based on the paths from the MAME Extended Options screen, not on emulators paths
- Correction: The Check for Missing Real Icons works based on the icon path from the MAME Extended Options screen, not on emulators paths
- Correction: The Check for Unneeded Real Icons works based on the icon path from the MAME Extended Options screen, not on emulators paths
- Forgot to add the Control Panel Layout when loading the pictures folders to memory (for Check Missing Control Panel Layouts to work)
- Fixed a bug that was not selecting other executables than the 1st one
- Fixed a bug that was not loading MAME default folders when selecting executables
- Fixed the resource images (NoImage.png files)
- Fixed the access violation when selecting a game filter that has no games (I hope so...)
- Fixed a problem with Hot Rod option when using Win9x. Now every time you quit a MAME game, the Num Lock key is correctly restored

### Changed

- Forgot to add that when building real icons, you can't do it while the Windows color depth is on 32bits, only on 16 or 24bits (or you will get an error...)
- When viewing multiple paths, they are separated by a " , " character
- Now, when changing between executables, the correspondent ROMs path are also loaded (try changing between executables and see the result on the new Show Active M.A.M.E. ROM Paths option
- This is caused by MAME, not by Emu Loader, and only with Win9x systems. In Windows 2000 there is no problems, though

### Removed

- Delete a lot of optimizing codes, because they were causing weird errors (too much optimization is not healthy, hehehe)

### Added

- Added the Control Panel Layout to the sequence of picture types when clicking on the preview image
- Added a new option: Show Active M.A.M.E. ROM Paths. With this, you will be able to see what ROM paths are loaded into memory (see View main menu)
- Added the background color selector for Control Panel Layout (see Customize Frontend Look tab on Preferences screen)

## [2.6.Final] - 2001-09-13 U

### Fixed

- Fixed a bug that was generating a File not found error message if the MAME initialization file is missing (only in the initialization of the frontend)
- Fixed a preview pictures display when clicking on Random Game button
- Fixed a small bug in Check for Missing Pictures. EL was not searching for the snap.zip file, only for ingame.zip
- Fixed that 0.00 is not a valid floating point value error message for good (when configuring MAME Options)... Strangely, I still got the error after fixing it (to fix, just restart the frontend)
- Games auto hint is working again. Just point the mouse in any game in the list that does not show the complete description (works in any column). It's automatic, there is no ON/OFF option
- Lots of small fixes to the GUI and the core of EL
- Fixed the icons loading so the No Real Icon file is loaded from the external file
- Fixed an access violation error when changing games filter, while using real icons (thanks MAMu_)
- Fixed the Check For Missing Pictures function so it can works based on the selected MAME executable (buttons status bar)
- Fixed the access violation when changing the games filter (due to the custom games testing)

### Changed

- If you take a snapshot when playing, it will automatically appear in the frontend after quitting the game (valid only for in-game snapshots). Note that for this to work, you need to set in-game snapshot picture type before running the game
- Transparent background for preview pictures now supported (.gif and .png). This feature is for Marshall Brooks cabinets and control panels, so they can be displayed without the white background
- Updated the component Graphics32 to version 0.99z
- Replaced the column Depth for Frequency, since the color depth info has become obsolete
- Updated the Custom Games Manager to include the new Frequency info
- Replaced the resource image files (NoTitleSnapshot, NoCabinet, etc...) by PNG format with transparent background
- The .ZIP file for this new type is cplayouts.zip
- Changed the Show Marquees button for a gray computer. The yellow computer is now Show Control Panel Layouts
- Updated the MAME Extended Options screen to include the new Control Panel Layouts folder
- Updated slideshow to include the new Control Panel Layouts picture type
- Upgrade development environment to Delphi 6 Personal Edition. This new version it's free for non-commercial use :-)
- You can download it here: http://www.borland.com/delphi/personal (just look for the Personal Edition and follow the instructions)
- Lots of speed up due to Delphi 6 new optimizations
- Take a look at the loading time in Category / Version Added Manager (on my Pentium III 500MHz it took only 02 seconds to load the both lists, against the 45 seconds from the old version!!!)
- Games Refresh, Games Audit and Database Build are a lot faster too. The whole frontend is a little faster, but not much...
- New Sound Clip and Audio Player engine. Now it uses DirectSound8 and DirectShow8 to play files (DirectX 8.0 or higher is required now). Sadly, the new core does not support MP3 files with variant bitrates
- Now the options Remember Last Selected Game and Remember Sort State are activated by default
- Faster real icons loading (this is for you, MAMu_) ;-)
- Now, after the real icons list is built, it will be saved on external files, making the loading much more faster
- For that, two new files are created on resources folder: BigIconsList.dat and SmallIconsList.dat every time you rebuild the real icons list
- No more unzipping and loading real icons on every restart... WooHoo!
- But be aware that the size of the files is rather big (8Mb with all icons)
- Replaced the component TAdvListView by the default ListView component from Delphi 6 (TAdvListView has a lot of bugs that I can't fix nor find a workaround)
- Two things that EL will lose (games list background image and the sort arrow)
- At least, for now...
- Cleaned all default icons (there is no separated BIG and SMALL icons anymore). Same category icons are in the same .ico file (32x32 and 16x16 sizes)
- The status window is now moveable (by request)
- Moved the mameinfo.dat, history.dat, faqs and automatic game information menu options in Games main menu, to the new Games Data menu item, under Games main menu
- Update in favorites code. Now it works like the new real icons loading. When you get back to normal list, it will takes only a few seconds
- Changed the Rebuild Real Icons option description for a better one: Create Icons List
- Grouped all real icons options in the new Real Icons menu item (see main menu Games)
- Changed the Run MAME in Real Time option for another more functional. Now you can select the priority level
- The record sound feature can now be configured when activating. It will open a small window, so you can change options. This can't be done in Preferences screen anymore, but you can still see the current settings there
- The real icons ON/OFF option is now on Games main menu
- Finally implemented the custom command line for Win32 MAME custom configuration
- There is a new file called CustomCmd.dat to store the data on resources folder
- Be aware that you must enter a complete path for this to work (e.g.: C:\Raine32\raine.exe -game pbobble4 -nogui)
- Cleaned the source code a lot
- Lots of optimizations and speed-ups
- The record sound feature is not working when playing with MAME
- With DOS MAME it still works

### Removed

- Delete the option Make Windows Desktop Icons Transparent
- Removed the Verify File CRC32 option

### Added

- Added an icon to the Random button (thanks MAMu_)
- New picture format supported: GIF images (including transparent GIFs)
- Added new option in Preferences screen to support the transparent GIF images: Use Pictures Transparency. This option is also available in the main menu Pictures and in the pictures popup menu
- Added new option in Preferences screen to support the transparent resource images: Use Resource Images Transparency. This option is also available in the main menu Pictures and in the pictures popup menu
- Added new picture button: Control Panel Layouts. This is different from Control Panels, because this is the layout pictures, while the other is the actual arcade picture of the controls panel (Marshal Brooks request)
- Added new options to change emulators description: Emulators Description (see main menu File)
- Added an option to delete the games .zip files (see main menu Games and games pop-up menu)
- Careful, this will physically delete the .zip file from your system (there is no way to recover it after the process)
- It works based on the selected MAME executable (buttons status bar)
- Movie intro finally added! This new feature can display full screen / windowed videos. Valid formats are: MPEG, AVI, MOV and ASF
- Be aware of two things: 1. it requires that the proper codec is installed in Windows; 2. it requires DirectX8 to work (this feature uses DirectShow8)
- This option is on Preferences screen, under Miscellaneous tab. It will play the movie only on frontend's startup. You must select a valid filename before activating this feature
- Added a Check For Missing Icons feature. It will search for all missing real icons (zipped/unzipped) (master and/or clone)
- After the searching is complete, you will be able to save the list of games that does not have the real icon, in a HTML file
- The option is on Games main menu with the name Check For Missing Real Icons, under the new Real Icons item and also in the games popup menu
- Like the In-Game feature, it will do the search based on the games filter that you are using (All Games, Classic, Available, Neo Geo, etc...)
- It works based on the selected MAME executable (buttons status bar)
- Added a Check For Unneeded Icons feature. It will make a list of all files that Emu Loader does not use (works only with zipped icons). Option is on Real Icons menu item, under Games main menu (it does not delete any file)
- It works based on the selected MAME executable (buttons status bar)
- New option on record sound: Same As Selected Game Name. Checking this option, will make the recording filename the same as the selected game
- Added titles.zip filename for title snapshots. Now you can use title.zip or titles.zip when using zipped title snaps (by request)
- Added preliminary support for Hot Rod / Hot Rod SE joysticks (Preferences screen)
- When checking this option, the Num Lock key will be turned OFF, so you can move thru the games, but will be restored when exiting the frontend
  - Player 1 Stick (UP/DOWN/LEFT/RIGHT): controls the selected game
  - Player 1 Start button: starts game with default options
  - Player 2 Start button: starts game with

## [2.6.5] - 2001-06-01 U

### Fixed

- It mistake in the read/write procedure for WinMAME .ini files
- MAME Flicker option is finally fixed (value from 0.0 to 100.0)

## [2.6.4] - 2001-06-01 U

### Fixed

- Fixed an annoying bug when you refresh an unavailable game while games filter is on Unavailable Games. After refreshing the game, it was not being deleted from the list. This is also valid for Available Games mode (thanks MAMu_)
- When setting custom game options, EL will automatically detect the correct MAME version (DOS MAME or WinMAME). There is a window for both MAME versions
- Fixed a lot of slideshow bugs. Now for every single operation in the frontend, the slideshow is paused and resumed later

### Changed

- I've changed some menu items of place in the main screen, so it can fit on a 640x480 resolution (mainly the Games menu)
- Changed a lot of procedures/functions to add support for WinMAME and maintain support for DOS MAME at the same time (still in preliminary stages with practically no optimizations in the core)
- Major changes in the DOS MAME and WinMAME default options screens visual
- Moved MAME32Options.ini file from resources to the main folder of Emu Loader
- The Emu Loader's Debugger window is now activated by default and it opens even if the frontend's setup is not set
- To change options, when you are using both MAME versions, just select the desired executable, by clicking on the toolbar buttons, and thencclick on Set Custom Options menu item, under Games main menu
- This is the same procedure when you want to run a game
  - Custom Command Line for WinMAME custom options is not working yet
  - Fixed a bug when trying to execute a game with DOS MAME custom options. It was generating an error code number 87 due to a command line size limiter
  - Preliminary support for long folder names (EL will always convert the folders to the short folder names before execute anything). You can try to use all emulators, including the frontend in directories with long names
  - Added options to add custom WinMAME initialization files for the following files:
    - neogeo.ini
    - playch10.ini
    - cvs.ini
    - vector.ini
- Note that those files are valid and supported by WinMAME. They are placed on the same folder as WinMAME executable (I think that the files location will be changed in a future MAME release)
Some visual changes

### Improved

- New emulators handling routines. Now the emulators executables and the MAME default options are split. This is only valid for WinMAME and DOS MAME executables... To access the default options, you have two choices:
  1. Thru the new Emulators menu item (File main menu)
  2. Thru the new main menu items Set xxx Emulator Default Options
- Fixed and improved the Total Play Time function. It was not showing the time correctly. Also, now you can see how much days has passed too :-)
- All the extra data that MAME does not use are separated into another screen. The data will be saved in MAMEExtended.ini file, not in mame.cfg or mame.ini anymore. The following data are:
  - Title Snapshots folder
  - In-Game Snapshots folder
  - Marquees folder
  - Cabinets folder
  - Flyers folder
  - Control Panels folder
  - Icons folder
  - The reason for separating those data, is that they are for Emu Loader use only, and MAME does not have any kind of support for them, and Emu Loader will not alter the original configuration files of MAME, mame.cfg and/or mame.ini
  - New text file: el-setup.txt. With this file you can setup up the frontend very quickly (this is a step by step to make the correct configurations)

### Added

- Added three new options in "EmuLoader.ini" to validate the types of emulators. The options are: EmulatorType, EmulatorType2 and EmulatorType3. And here are the meaning of the values:
  - 0: Empty
  - 1: WinMAME executable
  - 2: DOS MAME executable
  - 3: MAME32 executable
  - 4: Custom executable (can be any other emulator)
- In the Emulators screen, you have three new buttons to change MAME's options:
  - Set 1st Emulator Options
  - Set 2nd Emulator Options
  - Set 3rd Emulator Options
- Also in main screen, you have three new menu items (in main menu File) with the same description as the buttons from Emulators screen
- New option: Show Statistics (located on Preferences screen, under Miscellaneous tab). This option shows a statistic after building games database (more to come)
- You can access the new window thru a new item in main menu Files, called MAME Extended Options
- Note that all the data in this new window will be used only by Emu Loader and all fields are required
- New feature: Games F.A.Q.. Now you can read the FAQ for every MAME (and non-MAME) game, using a file with .faq extension (e.g..: galaga.faq). It works with clone games too
- For that you must specify a location folder for the files. It is located on the new MAME Extended Options screen, under the General Folders tab
- Added all the MAME DAT files into the new MAME Extended Options screen, exclusively for Emu Loader use MAME will not be affected and the external files info on MAME default options screen are still needed for MAME
- Files are: mameinfo.dat, history.dat and cheat.dat (these files are optional)
- Added an new option in Preferences screen, under Games List tab: Show Only Parent Icon (real icons only). With this option checked, all the clone games will show it's parent icon, even if the clone icon is found
  - WARNING: this option is not working yet

## [2.2.1] - 2001-03-01 U

Changed the logo.jpg back to it's old size (500x350)... by request

Fixed an error message when files "Logo.jpg", "NoSnapshot.jpg", "NoPicture.jpg" and "NoControlPanel.jpg" doesn't exist

Changed the logo again

Added a "Word-Wrap" option when viewing History/Information files (by request)

Note: Just remember... Don't forget to use the utility to convert the "Favorite Games" files to the new format before adding more games to favorites lists

## [2.2] - 2001-03-01 U

Implemented a routine to move the history/information text to top automatically when opened

Updated the color depth options
The frontend now has 8bits, 15bits, 24bits and 32bits options

Fixed a mameinfo/history bug. Now the files can be in any folder

Added the Panel Control icon into the pictures popup menu

Added the show/hide the pictures preview hot-key. Just press F6

Fixed a pictures preview bug. It was not showing the 1st picture after changing the games filter type or when initializing the frontend

All screens close with ESC key now. There a some special cases:
- Audit Games (stops auditing and/or close window)
- MAME Configuration (ESC means "Cancel", not "Confirm")
- Game Custom Options (ESC means "Cancel", not "Confirm")
- MAME 32 Specific Options (ESC means "Cancel" and ENTER means "Confirm")

Added a confirmation box before deleting custom games options

Added two new options in preferences: "Remember Last Selected Game" and "Remember Sort State"
(no columns order remembering yet, sorry)

Finished the Implementation for MAME32 support ("MAME32Options.ini" file is saved in "resources" folder)

Updated MAME options with the new "Resample Filter" (Only for version 0.37 beta 12 and up)

Update games database with the new options and tweaks from MAME 0.37 beta 12

Fixed an audit bug. It was not finding files sometimes

Made some visual changes in the audit screen

Added a popup menu item in audit screen: "Audit Game Again". You can audit the game again without closing the screen (valid only for single audits)

Enabled option "Ignore .cfg" on MAME Options and Custom Options screens. Using this option, MAME runs with default options ignoring "mame.cfg" settings

Moved option "Ignore .cfg" to Preferences screen

Added a new option in Preferences screen: "Error Log". It generates "error.log" file when executing games

A lot of options from main screen can now be accessed on the main menu

Added hints in some options (preferences screen)

Fixed an error with "resolution" and "vector resolution" reading (MAME Options and Custom options)

Emu Loader now uses the same category/version file from A@H frontend
The new name is "catver.ini"
The old name "categories.ini" is no longer valid

Be aware that it can't be spaces before and after the " = " character
- This is a valid line: galaga=Shooter
- This is an invalid line: galaga = Shooter

Added a new column to the list: "Version Added". It shows in what version the game was added

The format of the database files (.dat) has changed

I created an utility to update "Favorite Games" files to the new format
Just make sure to update the files before adding games to favorite lists

Auditing all Games is much more faster now. Not sure if "All Games Audit" is 100% accurate. Single audit is perfect though

Fixed the slideshow bug. It was not starting after loading the frontend

Increase the speed when closing the audit screen (mainly for "All Games Audit")

Fixed a visual bug in icons of the audit screen (it was causing no harm to the audit process)

Added new custom colors for pictures background (preferences screen). Now all types of pictures can have different backgrounds

Added two links in the main menu "Help". One that goes to Emu Loader homepage and one to send e-mails

Changed the Delphi component "Gradient Text" so, for those who like to compile your own frontend, this improved component is needed

When viewing mameinfo/history files and/or .txt files (from Emu Loader and MAME), if there are links to homepages and/or e-mail addresses you can click on them

Note: for e-mail address to work, they must begin with
"mailto:" before the address, like this:
- mailto:emuloader@mameworld.net (this will open your default e-mail software)

emuloader@mameworld.net (this will not have any link, just a regular text)

Updated games list component to the latest version "TAdvListView" v1.53 (still deleting games instead of hiding them, due to component limitation)

Added support for a new pictures name format: gamename0000.png
Now you can choose between two types of names:

- The default MAME name (old DOS format with 8.3 characters max)
- The new Emu Loader format (it uses the entire name plus four numbers)

(no more mixed pictures. Take several pictures of Metal Slug series games and you will see what I mean)

The snapshot must be renamed with the new format (MAME doesn't use this new format, it's only for Emu Loader viewing)
All types of pictures can use it (Snapshots, Marquees, Flyers, Cabinets and Control Panels)

Added support for .jpg images format

Added an option in main menu "File" to save the games list to an external HTML file (if you save all games, the file may have more than 01Mb)

Cleaned the source code a bit fixing some minor bugs

Changed the logo. This is probably the definitive logo (thanks MAMu_)

Changed the executable icon. But you can find three more icons in the executable. The file has a total of four icons in the executable file

Finished the Custom Games support. You can add, edit and delete custom games from the list. Just go to main menu "Games", and select "Custom Games Manager"

## [2.0] - 2000-12-30 U

Frontend customization (colors, fonts, etc)

One game refreshing (means that you can refresh just one game without having to refresh all games in the database)
Useful if you download one or two games and want to quickly update the database

Logos customization (you can create your own logos in the frontend)

ZIP support for snapshots, marquees, flyers and cabinets

Custom options for every game

New frontend icons

Liter frontend (even if the .exe file is big)
(most of the screens are loaded when you call them and released from memory after they're closed)

The frontend will use TriggerFin categories file

Better look

No more "Speed Help" (it wasn't been used anyway...)

Now you can cancel the database building without loosing the last set of .dat files

Support for real icons (MAMu_ icons)
...still slow :(((

Audit games (one game at a time or complete audit)

Favorite games list. Create a favorite user using the "Users Manager" utility

Manage games categories using the "Categories Manager" utility

Complete control over "mame.cfg" options
(including new additions for 0.37 beta cycle)

Pictures Slideshow (100 images max)

## [1.3.2] - 2000-05-19 U

- No info

## [1.2] - 2000-06-28 U

### Fixed

- Fixed the "Frameskip" option
- Fixed the "Categories Manager" feature (it was duplicating categories from file "resources\category.ini")
- Replace "Manufacter" to "Manufacturer" (was written wrong)

### Changed

- Changed the look of screens with cool graphics
- Changed (again) the files lists
- Changed "EmuLoader.ini" format
- Changed extension of "resources\category.ini" file to "resources\category.dat" (to avoid confusion with the "categories.ini")
- Changed the menu "Build Games List..." to "Build Database..."
- Changed Emu Loader's logo

### Improved

- Rewrite a lot of code
- Speed up Emu Loader a bit
- Now all snaps, flyers and cabinets show it's parent picture if a clone picture do not exist
- Updated "categories.ini" with the latest MAME release (0.37 beta 4)
- Ability to customize the appearance of preview pictures

### Removed

- Ripped out the "View Styles" (now only "Details form" is shown)
- Deleted some game buttons on main screen (they are not needed anymore)

### Added

- Added support for MP3 playback (you can listen to a MP3 music and play MAME at the same time. Fully working only on PCI soundcards. ISA soundcards has some limitations)
- Added more columns to the list
- The list types has now more options to choose from (not all work)
- Added more resolutions for game configuration (some of them need the "tweak" option activated to work correctly!)
- Added Audit ROMs support (samples audit are not included. Still slow)
- Added List Filters (preliminary, does no work yet!)
- Added support to set MAME options for every game (now all games can have it's own private configurations)
  - Samples support (does not have Logiqx's Sample fixes)
- Added a "Preferences" screen with some new tweaks

## Previous Versions

I apologize, but I do not have any information regarding the older version. If anyone possesses this information, please open a ticket.
EmuLoader is on-line since March 19, 2000
