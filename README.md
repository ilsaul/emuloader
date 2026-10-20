# EmuLoader

## Intro

EmuLoader is a *front-end* application for game emulators, mainly specialized in platforms like **M.A.M.E.** (Multiple Arcade Machine Emulator) and **Demul** (a Sega Dreamcast and arcade emulator).

The main website is <https://emuloader.com>

### 🎮 What is an Emulator Front-End?

In simple terms, an emulator **front-end** is a **Graphical User Interface (GUI)** that acts as a "game launcher" and organizer for your ROMs and emulators. Instead of having to navigate through folders, `.exe` files, and command lines, EmuLoader allows you to:

* **Browse** your game collection visually (with screenshots, titles, and information).
* **Launch** games with a double click, automatically managing the necessary settings for the underlying emulator (M.A.M.E., Demul, etc.).
* **Filter** and *sort* games based on various criteria (genre, year, manufacturer, etc.).

### ✨ Key Features of EmuLoader

EmuLoader is valued for its clean interface and a set of specific functionalities that make it a powerful tool for arcade and retro console enthusiasts:

1. **Advanced M.A.M.E. Support:** It was developed with M.A.M.E. in mind. It offers tools to manage complex ROM sets, easily find missing or non-working games, and use advanced filters specific to arcade emulation.
2. **Demul Integration:** It has excellent integration with the Demul emulator (for Sega Dreamcast, Naomi, Naomi 2, Atomiswave), allowing you to launch these systems seamlessly.
3. **Customization:** It provides extensive options for customizing the look and layout, including the display of preview images, videos, and game artwork.
4. **Database Management:** It scans and validates your ROMs against the emulator databases (like M.A.M.E.'s listxml) to ensure your files are correct and up-to-date.

In summary, EmuLoader is the ideal tool if you want a powerful and dedicated interface to organize and launch your M.A.M.E. and Demul game collections efficiently and attractively.

## Diagnostic logging (Delphi 13)

The Delphi 13 port is version **10.0.0**, with file/product version `10.0.0.0`
and the Windows **Pre-release** flag enabled until the stable release. The flag
does not add a beta suffix to the version displayed in the application or logs.

Logging is disabled by default. Enable **Enable Diagnostic Log (Troubleshooting)**
in **Preferences > General**, or launch the application with:

```bat
EmuLoader.exe --debug-log
```

The command-line option forces logging for that session, even if the preference
is off. The preference takes effect immediately and is saved when the preferences
dialog closes. It is also read before the splash screen on subsequent starts.

`diagnostic.log` is written beside `EmuLoader.exe`, in UTF-8. It records session
information, startup/status messages, clicked window controls, list loading and
filtering, emulator launches and exit codes, application message dialogs, VCL
event exceptions (including their addresses), and normal shutdown milestones.
Logging is serialized across threads. At 5 MiB, the log rolls over to
`diagnostic.log.1`, retaining only one previous file. A write failure disables
logging and displays a warning; normal error dialogs are still shown.

For a bug report, enable logging, reproduce the problem, and include both log
files if present. **Review them before sharing:** they can contain local paths,
game names and emulator command lines. No keyboard text is captured. A hard
process termination or an unhandled worker-thread crash may leave only the last
operation, not an exception or shutdown record; this is not a crash dump or a
full stack-trace reporter.

## History

This Repository was created to continue the work of *Ciro Alfredo Consentino*, who developed this front-end for over 20 years, providing us with an excellent product without ever asking for anything in return.

He passed away on December 7, 2021. You can read the family's tribute in the local newspaper at this link: <https://www.gazetadopovo.com.br/curitiba/falecimentos/falecimentos-curitiba-7-12-2021/>.

The project is currently looking for Delphi developers to carry on his legacy and great work."