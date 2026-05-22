Emu Loader: MAME and Arcade Frontend
------------------------------------
     by Ciro Alfredo Consentino

   Emu Loader is a graphical user interface (GUI) for multiple emulators of many different platforms. MAME, arcade, console, computer, handheld. Compatible with all versions of
Windows, starting with Windows 7. WinXP is not officially supported anymore. Windows 10 compatibility is somewhat precarious.
This frontend started as a hobby and a learning project. I first discovered MAME in 1997.

   WARNING: DOS MAME and MAME32 are not supported by the frontend!


Disclaimer
----------

   This is a freeware software. It can be distributed freely. It cannot be sold. It cannot
be used for commercial purposes. It's an open source project, created with Borland Delphi 7.
It's totally free except from the compiler.
   The author is not responsible for any data loss or damage to your computer caused by
this program. All components, contents and codes used in this project
are copyrighted by their owners.

  Use it at your own risk.


Requirements
------------

Minimum Hardware:

OS: Windows 7 with themes enabled
CPU: Pentium 4 2.0GHz
RAM: 1 GB MB
Video: any capable of at least 32-bits bpp and 1024x768 or 1280x720 pixels resolution
Sound: none
Other: mouse, keyboard

Recommended Hardware:

OS: Windows 7 with Aero user interface
CPU: any dual-core or quad-core 3.0GHz processor
RAM: 4 GB
Video: any capable of showing 32-bits bpp and a high resolution
Sound: sound card/onboard audio chip to listen to game sounds
Other: mouse, keyboard. (optional) arcade controller for the GUI: Devastator II, HotRod SE, SlikStik, X-Arcade


Features
--------

- Arcade emulators supported (latest versions of all emulators only, except MAME/HBMAME)
  - MAME v0.37 beta 15 and newer (variants: UME; SDLMAME; SDLUME; WolfMAME)
  - Supermodel: SEGA Model 3
  - Daphne
  - Demul v0.7 beta and newer (v0.56 is not supported)
  - HBMAME (HomeBrew MAME)
  - DICE: Discrete Integrated Circuit Emulator
  - SEGA Model 2 Emu v1.0 and v1.1a
  - ZiNc v1.1 

- Support for MAME software lists: non-arcade games (MAME v0.162 and newer)
  These lists are not handled as console/computer/handheld systems as they are part of MAME
 
- Support several console/computer/handheld emulators. See "docs\console_computer\systems_emulators.htm" for details

- MAME/Arcade: Support split ROMs (zip/7-zip only)

- Detection of MAME/HBMAME merged clone sets (full scan mode only)
  NOTE: Merged sets are not fully supported by the frontend and I recommend to stay away from them

- Detection of CRC32 collisions and SHA-1 validation when needed

- 99.99% games audit accuracy (scan games feature)

- Create multiple favorites profiles (no limit)
  
- Support for 7-Zip ROMs. It requires an external 7z.dll file to work. MAME, HBMAME and Demul emulators only
  Its recommended to stay with .zip files as games will be validated faster

- Console/Computer/Handheld: Support any file format, depending only on the emulator. Games files are not validated,
                             this is done by the emulators... and by you

- Console/Computer/Handheld: Unicode game filename support

- Console/Computer/Handheld: Any emulator that load games from the command line can be used

- MAME/Arcade: Three scan games modes (audit)
               - full scan with full ROMs validation thru CRC32 / SHA-1 checksum and CHDs thru SHA-1 / MD5 checksum
               - quick scan to simply search for main game files, no validation
               - force games available to set games available no matter what, with no files search or validation

- Support several image categories: title snapshots, game snapshots, marquees,
  flyers, cabinets, control panels, software covers, PCBs, in-game artworks, ends, boss, logo, score, versus,
  game over, how to play, select

- Preview snapshots (unzipped and zipped). Max of 30 snapshots per game (and per image category)
  Zipped images filenames are fixed (same filename for all emulators):
  - Title Snapshot......: titles.zip
  - In-Game Snapshot....: snap.zip
  - Marquee.............: marquees.zip
  - Flyer...............: flyers.zip
  - Cabinet.............: cabinets.zip
  - Control Panel.......: cpanel.zip
  - Software Cover......: covers.zip
  - PCB.................: pcb.zip
  - In-Game Artwork.....: artpreview.zip
  - End.................: ends.zip
  - Boss................: bosses.zip
  - Logo................: logo.zip
  - Score...............: scores.zip
  - Versus..............: versus.zip
  - Game Over...........: gameover.zip
  - How to Play.........: howto.zip
  - Select..............: select.zip

- Night mode with mulitple profiles support
  - customize frontend colors with several options to choose from
  - use your own CheckBox / RadioButton custom icons

- Video preview playback. Watch a video sample of your games when browsing the games list
  - requires an external media player
  - any video and audio format can be used, limited only by your system
  - any media player can be used as long as it can load files from the command line
  - support for command line switches for more control over the media player

- MAME/Arcade: Extra snapshots using full game names. This is an unique Emu Loader feature to avoid similar filenames
               to be mixed up. Format: "fullgamename0000.png" (e.g.: galaga0000.png instead of gala0000.png)

- Support for MAME's game snapshots filename format "snap_folder\gamename\0000.png"; "snap_folder\softwarename\gamename\0000.png" (unzipped only)

- Support for separate MAME's zipped game snapshots filename format for software lists "snap_folder\softwarename.zip"; "snap_folder\softwarename\softwarename.zip"

- Image Layouts. View up to four game image categories at the same time

- Support for MAMu_ icons, one folder per system (unzipped or zipped)... MAMEUI / MAME32 icons might not be fully compatible
  Icon files can have multiple icons with different sizes: 48x48; 32x32; 24x24; 16x16 (one for each games list view mode)

- Random game selection (only thru Ctrl+R hotkey or games popup menu)

- Advanced games filters, including a search bar with customizable settings

- Incremental search by game title or game name
  Just type the game title or game name for quick acccess (partial strings support)

- MAME/Arcade: Custom game/driver options (driver settings for MAME/HBMAME only)

- MAME only: support several .dat files: mameinfo.dat, messinfo.dat, history.dat, story.dat (MAMEscore v2), marp.dat, scores3.htm

- View PDF manuals of MAME games with an external PDF viewer

- MAME only: select a file to play or record input before starting MAME

- MAME only: select a save state before starting MAME

- MAME only: insert a memory card file before starting MAME (only for supported machines)

- MAME only: run multi-slot MAME machines by selecting multiple games: "Neo-Geo MVS", "Sega Mega-Tech", "ST-V"

- Easy access with popup menus, toolbar buttons and hot keys

- Run multiple floppy disk games by selecting all disks to load on emulators (computer systems only)

- Detection of several media types: ROMs, cartridges, floppy disks, cassette tapes, hard disk drive, disc images, flash cards, video tapes, MAME CHDs

- Console/Computer/Handheld: use 4 emulators on each system

- Console/Computer/Handheld: you can have two parameters for each media type, using same emulator filename. The 2nd parameter is optional and it's
                             available for special cases, mostly for Atari 800 and Commodore Amiga emulators

- Console/Computer/Handheld: mount/unmount disc images on a virtual drive (Daemon Tools, SlySoft Virtual CloneDrive, Alcohol 120% and others)

- Console/Computer/Handheld: add new games to an existing list. Useful if you need to add more games to a list that are located on various CDs/DVDs
                             or external HDDs

- Played games info (last played, times played, total playtime)

- Quick access of the last 25 games you played (MRU)

- Rename/delete preview snapshots (unzipped only)

- Browse games list with Detonator II / HotRod SE / SlikStik and X-Arcade arcade controllers (limited functions)
  
- Delete/copy/move game files (.zip; .7z; .cfg; nvram; .dat; etc). Recycle bin not supported!

- Game columns customization (details and grouped view modes)

- Basic detection of bad .zip files to prevent frontend crashes (ZipForge library)

- Frontend settings are stored in .ini files. Windows registry is never used

- Thumbnails view mode, for a nice view of game snaps, fully customizable

- MAME only: view complete web game info in images panel (ProgettoEMMA website)

- MAME/Arcade: grouped view mode. List games in "parent + clone games" groups format (columns sort is disable in this view)

- MAME/HBMAME only: CatVer support (catver.ini; category.ini; version.ini from AntoPISA). View category and version added in your games list

- MAME only: Nplayers support (nplayers.ini). Shows how many players a game support

- MAME only: languages support (languages.ini). Show language for each game

- MAME only: non-arcade machines tagging and filtering using "mess.ini" from AntoPISA. MAME 0.162 and newer required

- MAME Machines Filter Panel, listing all MAME machines with software lists, to filter games by machine. MAME 0.162 and newer required ("Systems" tool bar button)
 
- MAME only: MAMu_ Icons Manager. Neat feature to manage game icons. Specially coded for the icons master, MAMu_


Short Cut Keys
--------------

Enter..............Play game
Shift+Enter........Play game with AlterMAME
Shift+A............Show a list of all available game sets with missing ROMs/CHDs (selected game)
F8.................Show a list of all available game sets with missing ROMs/CHDs (all games)
Left Key...........Moves list to the left (standard/grouped views) / Select previous game
Right Key..........Moves list to the right (standard/grouped views) / Select next game
Ctrl+Left Key......Moves list to the left (faster)
Ctrl+Right Key.....Moves list to the right (faster)
Home...............Go to the top of the list
End................Go to the bottom of the list
Page Up............Scroll the list up (faster)
Page Down..........Scroll the list down (faster)
Alt+F4.............Close screens
Esc................Close screens / "No" / "Cancel" / "Close" buttons selection
F5.................Scan games list for ROMs (all games)
Shift+F5...........Scan all selected games for valid ROMs (single game or multiple games)
Shift+F6...........Force all selected games available no matter what (single game or multiple games)
Shift+F............Add selected game to favorites list
Shift+D............Delete selected game from favorites list
F6.................Show/hide screenshots preview panel
Shift+I............Show selected game info
F3.................Show/hide game documents panel
Shift+F2...........Toggle full screen / windowed mode
F11................Show previous image
F12................Show next image
Ctrl+F9............Show previous image category / layout
F9.................Show next image category / layout
Delete.............Delete game files of selected games
Shift+Delete.......Delete game config files of selected games (cfg; non-volatile RAM; etc)
Mouse Click........Select next image type (click on the preview image)
Ctrl+T.............Toggle main tool bar visible / invisible
Ctrl+I.............Toggle images tool bar visible / invisible
Ctrl+F3............Toggle current favorites profile / last games filters
Ctrl+Shift+T.......Delete thumbnail of selected games (thumbnail view mode)
Ctrl+M.............Toggle MAMu_ icons (enabled/disabled)
Ctrl+R.............Select a random game
Shift+V............Play game video preview
Shift+M............Show PDF game manual



Additional MAME Files
---------------------

Place these files in "[frontend]\arcade\filters\" folder...

 - Catlist (catver.ini)
     by TriggerFin: http://www.mameworld.net/catver/
     Italian Forum: http://www.progettoemma.net/?catlist
     Alternate....: http://www.catver.com

 - Category / Version / CatVer for MAME arcade and non-arcade machines, by AntoPISA
     http://www.progettosnaps.net/renameset/

 - Non-arcade machines (mess.ini) by AntoPISA
     http://www.progettosnaps.net/renameset/
  
 - NPlayers (nplayers.ini) by Nomax
     http://nplayers.arcadebelgium.be

 - Languages (languages.ini) by AntoPISA
     http://www.progettosnaps.net/languages



Place these files in MAME's main folder or in "dats" folder (configurable path only in MAME v0.172 and newer)...

 - MAMEInfo (mameinfo.dat) by M.A.S.H.
     http://www.mameworld.net/mameinfo

 - MESSInfo (messinfo.dat) by ANtoPISA
     http://www.progettosnaps.net/messinfo/

 - History (history.dat) by Alexis Bousiges
     http://fandemame.emu-france.com

 - MAMEscore v2 (story.dat)
     http://www.arcadehits.net/mamescore/home.php?show=files

 - MARP (scores3.htm; marp.dat)
     http://replay.marpirc.net
     http://replay.marpirc.net/txt/scores3.htm
     http://replay.marpirc.net/marp.dat



Miscellaneous MAME Files
------------------------

- Cheats (cheat.dat)
    http://cheat.retrogames.com/

- Mr. Do's MAME Artwork In-game
    http://mrdo.mameworld.info/mame_artwork_ingame.php

- MAME Titles by Petr1field
    http://www.mametitles.com/

- MAME Video Snaps
    http://emumovies.com/forums/index.php/files/category/44-mame/

- Progetto-SNAPS Unpacked VideoSnaps MP4; An awesome collection of video snaps for MAME
    http://www.progettosnaps.net/videosnaps/videosnaps_files.php


Thanks
------

Many thanks to the MAME (TM) team for their excellent work!
To Mugnier Aymeric, a.k.a. MAMu_, for allowing the use of his 3D model of Hot Rod SE
controller, for all the graphics and icons he created for EL and all his awesome game icons.

Thanks to Ra Chen, who made EL famous :-D
AzzaAzza69 for helping with the implementation of the list's virtual mode
Marshall Brooks [TigerHeli] for beta testing and the "Tips and Tricks" file
Marco De Mori for a bunch of critital fixes and beta testing
Karasu for beta testing
Roland Testa [TriggerFin]
Humbert Stephane [StephH]
L. D. Orchard [Eldio]
Fuzz Norelid
Gh0st
Stig Remnes for beta testing
Dave Swanwick
cutebutwrong for the awesome MAWS database
hap for helping me with test the new scan games feature
AntoPISA for category/version, catver.ini, mess.ini for non-arcade machines and video snaps database
Bugs reporters and everyone else I forgot to mention here, for helping in the improvements
of this frontend.

Special thanks to MAMEWorld for hosting Emu Loader's website!


How to Contact Me
-----------------

My name is Ciro, and I'm from Brazil.
Homepage: http://emuloader.mameworld.info
E-Mail..: emuloader@gmail.com
Forum...: http://www.mameworld.info/ubbthreads/postlist.php?Cat=&Board=emuloader

   You will always find the latest version of the frontend at the homepage. Send comments
and bugs reports to my e-mail or post a message in the forum.



-- Master Control: "End of line." (quote from "TRON") --
