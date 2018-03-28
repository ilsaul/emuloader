unit uCommonCustom;

interface

uses
  Windows, RTLConsts, Classes, StdCtrls, ExtCtrls, ComCtrls,
  Graphics, SysUtils, ShlObj, Forms, Controls, IniFiles, ShellAPI,
  MessageDigests, MessageAuthenticationCodes, Consts, CommDlg, Registry,
  uMessageBox, uSelectDirectory, Math, ShadowLabel,
  EasyListview, MPCommonObjects, MPCommonUtilities,
  uCommon;

const
  MaxConsoleComputerSystems = 65;
  IsFloppy = 3; // quick dirty way to check for floppy media type... used by multi disk games features for console/computer systems!

  SystemsListCustom: packed array [0..MaxConsoleComputerSystems] of packed array[0..2] of String = (
    // sys title/section name, icon fileName,              games list filename,
    ('All Systems',            '00_AllSystems.ico',        ''),
    ('Super Nintendo',         '01_SuperNintendo.ico',     'SuperNintendo.txt'),
    ('Game Boy Advance',       '02_GameBoyAdvance.ico',    'GameBoyAdvance.txt'),
    ('Nintendo 8-bit',         '03_Nintendo8bit.ico',      'Nintendo8bit.txt'),
    ('Genesis',                '04_Genesis.ico',           'Genesis.txt'),
    ('Atari 2600',             '05_Atari2600.ico',         'Atari2600.txt'),
    ('Intellivision',          '06_Intellivision.ico',     'Intellivision.txt'),
    ('Master System',          '07_MasterSystem.ico',      'MasterSystem.txt'),
    ('Odyssey2',               '08_Odyssey2.ico',          'Odyssey2.txt'),
    ('Game Gear',              '09_GameGear.ico',          'GameGear.txt'),
    ('ColecoVision',           '10_ColecoVision.ico',      'ColecoVision.txt'),
    ('GP32',                   '11_GP32.ico',              'GP32.txt'),
    ('PC Engine',              '12_PCEngine.ico',          'PCEngine.txt'),
    ('Atari Lynx',             '13_AtariLynx.ico',         'AtariLynx.txt'),
    ('Atari 5200 SuperSystem', '14_Atari5200.ico',         'Atari5200.txt'),
    ('Atari Jaguar',           '15_AtariJaguar.ico',       'AtariJaguar.txt'),
    ('Sega 32X',               '16_Sega32X.ico',           'Sega32X.txt'),
    ('Neo-Geo Pocket',         '17_NeoGeoPocket.ico',      'NeoGeoPocket.txt'),
    ('Nintendo 64',            '18_Nintendo64.ico',        'Nintendo64.txt'),
    ('Sega CD',                '19_SegaCD.ico',            'SegaCD.txt'),
    ('Game Boy',               '20_GameBoy.ico',           'GameBoy.txt'),
    ('PlayStation',            '21_PlayStation.ico',       'PlayStation.txt'),
    ('GameCube',               '22_GameCube.ico',          'GameCube.txt'),
    ('Atari 7800',             '23_Atari7800.ico',         'Atari7800.txt'),
    ('Dreamcast',              '24_Dreamcast.ico',         'Dreamcast.txt'),
    ('Watara Supervision',     '25_WataraSupervision.ico', 'Supervision.txt'),
    ('WonderSwan',             '26_WonderSwan.ico',        'WonderSwan.txt'),
    ('PlayStation 2',          '27_PlayStation2.ico',      'PlayStation2.txt'),
    ('Nintendo Wii',           '28_NintendoWii.ico',       'NintendoWii.txt'),
    ('Nintendo DS',            '29_NintendoDS.ico',        'NintendoDS.txt'),
    ('PC Engine CD',           '30_PCEngineCD.ico',        'PCEngineCD.txt'),
    ('Game Boy Color',         '31_GameBoyColor.ico',      'GameBoyColor.txt'),
    ('Super Game Boy',         '32_SuperGameBoy.ico',      'SuperGameBoy.txt'),
    ('Sega Saturn',            '33_SegaSaturn.ico',        'SegaSaturn.txt'),
    ('3DO',                    '34_3DO.ico',               '3DO.txt'),
    ('Amiga CD32',             '35_AmigaCD32.ico',         'AmigaCD32.txt'),
    ('Virtual Boy',            '36_VirtualBoy.ico',        'VirtualBoy.txt'),
    ('PC-FX',                  '37_PC-FX.ico',             'PC-FX.txt'),
    ('Famicom Disk System',    '38_FamicomDiskSystem.ico', 'FamicomDiskSystem.txt'),
    ('Commodore 64',           '39_Commodore64.ico',       'Commodore64.txt'),
    ('MSX',                    '40_MSX.ico',               'MSX.txt'),
    ('MSX 2',                  '41_MSX2.ico',              'MSX2.txt'),
    ('MSX 2+',                 '42_MSX2+.ico',             'MSX2+.txt'),
    ('MSX Turbo-R',            '43_MSXTurboR.ico',         'MSXTurboR.txt'),
    ('Amiga',                  '44_Amiga.ico',             'Amiga.txt'),
    ('Atari ST',               '45_AtariST.ico',           'AtariST.txt'),
    ('ZX Spectrum',            '46_ZXSpectrum.ico',        'ZXSpectrum.txt'),
    ('Sega SC-3000',           '47_SegaSC3000.ico',        'SegaSC3000.txt'),
    ('Atari 400/800/XL',       '48_Atari400-800-XL.ico',   'Atari400-800-XL.txt'),
    ('Commodore VIC-20',       '49_CommodoreVIC20.ico',    'CommodoreVIC20.txt'),
    ('Arcadia 2001',           '50_Arcadia2001.ico',       'Arcadia2001.txt'),
    ('Tiger game.com',         '51_TigerGame.com.ico',     'TigerGame.com.txt'),
    ('Apple II',               '52_AppleII.ico',           'AppleII.txt'),
    ('Apple IIGS',             '53_AppleIIGS.ico',         'AppleIIGS.txt'),
    ('WonderSwan Color',       '54_WonderSwanColor.ico',   'WonderSwanColor.txt'),
    ('Neo-Geo Pocket Color',   '55_NeoGeoPocketColor.ico', 'NeoGeoPocketColor.txt'),
    ('Commodore 128',          '56_Commodore128.ico',      'Commodore128.txt'),
    ('Neo-Geo CD',             '57_NeoGeoCD.ico',          'NeoGeoCD.txt'),
    ('Atari Jaguar CD',        '58_AtariJaguarCD.ico',     'AtariJagiarCD.txt'),
    ('Amstrad CPC',            '59_AmstradCPC.ico',        'AmstradCPC.txt'),
    ('PSP',                    '60_PSP.ico',               'PSP.txt'),
    ('Philips CD-i',           '61_PhilipsCDi.ico',        'PhilipsCDi.txt'),
    ('Sega SF-7000',           '62_SegaSF7000.ico',        'SegaSF7000.txt'),
    ('Nintendo Satellaview',   '63_Satellaview.ico',       'Satellaview.txt'),
    ('Nintendo Wii U',         '64_NintendoWiiU.ico',      'NintendoWiiU.txt'),
    ('Nintendo 3DS',           '65_Nintendo3DS.ico',       'Nintendo3DS.txt'));
    //('SuFami Turbo',           '66_SuFamiTurbo.ico',       'SuFamiTurbo.txt'));

  MediaTypeCustom: packed array[1..5] of packed array[0..2] of String = (
    // media title,   icon filename,              media short .ini value, EXPERIMENTAL!!! // this array can never be higher than 1..9 !!!!!!!! no reason to either...
    ('Cartridge',       'media_Cartridge.ico',    'cart'),
    ('Disc Image',      'media_Disc.ico',         'disc'),
    ('Floppy Disk',     'media_FloppyDisk.ico',   'flop'),
    ('Cassette Tape',   'media_CassetteTape.ico', 'cass'),
    ('Hard Disk Drive', 'media_HardDisk.ico',     'hard'));

  // SystemCategory: packed array[0..2] of String = ('Arcade', 'Console', 'Computer');
  {SystemsCategory: packed array [1..MaxCustomSystems] of Byte = (
    // sys title/section name, icon fileName,              games list filename,
     1, // Super Nintendo
     1, // Game Boy Advance
     1, // Nintendo 8-bit',         '03_Nintendo8bit.ico',      'Nintendo8bit.txt'),
     1, // Genesis',                '04_Genesis.ico',           'Genesis.txt'),
     1, // Atari 2600',             '05_Atari2600.ico',         'Atari2600.txt'),
     1, // Intellivision',          '06_Intellivision.ico',     'Intellivision.txt'),
     1, // Master System',          '07_MasterSystem.ico',      'MasterSystem.txt'),
     1, // Odyssey2',               '08_Odyssey2.ico',          'Odyssey2.txt'),
     1, // Game Gear',              '09_GameGear.ico',          'GameGear.txt'),
     1, // ColecoVision',           '10_ColecoVision.ico',      'ColecoVision.txt'),
     1, // GP32',                   '11_GP32.ico',              'GP32.txt'),
     1, // PC Engine',              '12_PCEngine.ico',          'PCEngine.txt'),
     1, // Atari Lynx',             '13_AtariLynx.ico',         'AtariLynx.txt'),
     1, // Atari 5200 SuperSystem', '14_Atari5200.ico',         'Atari5200.txt'),
     1, // Atari Jaguar',           '15_AtariJaguar.ico',       'AtariJaguar.txt'),
     1, // Sega 32X',               '16_Sega32X.ico',           'Sega32X.txt'),
     1, // Neo-Geo Pocket',         '17_NeoGeoPocket.ico',      'NeoGeoPocket.txt'),
     1, // Nintendo 64',            '18_Nintendo64.ico',        'Nintendo64.txt'),
     1, // Sega CD',                '19_SegaCD.ico',            'SegaCD.txt'),
     1, // Game Boy',               '20_GameBoy.ico',           'GameBoy.txt'),
     1, // PlayStation',            '21_PlayStation.ico',       'PlayStation.txt'),
     1, // GameCube',               '22_GameCube.ico',          'GameCube.txt'),
     1, // Atari 7800',             '23_Atari7800.ico',         'Atari7800.txt'),
     1, // Dreamcast',              '24_Dreamcast.ico',         'Dreamcast.txt'),
     1, // Watara Supervision',     '25_WataraSupervision.ico', 'Supervision.txt'),
     1, // WonderSwan',             '26_WonderSwan.ico',        'WonderSwan.txt'),
     1, // PlayStation 2',          '27_PlayStation2.ico',      'PlayStation2.txt'),
     1, // Nintendo Wii',           '28_NintendoWii.ico',       'NintendoWii.txt'),
     1, // Nintendo DS',            '29_NintendoDS.ico',        'NintendoDS.txt'),
     1, // PC Engine CD',           '30_PCEngineCD.ico',        'PCEngineCD.txt'),
     1, // Game Boy Color',         '31_GameBoyColor.ico',      'GameBoyColor.txt'),
     1, // Super Game Boy',         '32_SuperGameBoy.ico',      'SuperGameBoy.txt'),
     1, // Sega Saturn',            '33_SegaSaturn.ico',        'SegaSaturn.txt'),
     1, // 3DO',                    '34_3DO.ico',               '3DO.txt'),
     1, // Amiga CD32',             '35_AmigaCD32.ico',         'AmigaCD32.txt'),
     1, // Virtual Boy',            '36_VirtualBoy.ico',        'VirtualBoy.txt'),
     1, // PC-FX',                  '37_PC-FX.ico',             'PC-FX.txt'),
     1, // Famicom Disk System',    '38_FamicomDiskSystem.ico', 'FamicomDiskSystem.txt'),
     2, // Commodore 64',           '39_Commodore64.ico',       'Commodore64.txt'),
     2, // MSX',                    '40_MSX.ico',               'MSX.txt'),
     2, // MSX 2',                  '41_MSX2.ico',              'MSX2.txt'),
     2, // MSX 2+',                 '42_MSX2+.ico',             'MSX2+.txt'),
     2, // MSX Turbo-R',            '43_MSXTurboR.ico',         'MSXTurboR.txt'),
     2, // Amiga',                  '44_Amiga.ico',             'Amiga.txt'),
     2, // Atari ST',               '45_AtariST.ico',           'AtariST.txt'),
     2, // ZX Spectrum',            '46_ZXSpectrum.ico',        'ZXSpectrum.txt'),
     2, // Sega SC-3000',           '47_SegaSC3000.ico',        'SegaSC3000.txt'),
     2, //('Atari 400/800/XL',       '48_Atari400-800-XL.ico',   'Atari400-800-XL.txt'),
     2, //('Commodore VIC-20',       '49_CommodoreVIC20.ico',    'CommodoreVIC20.txt'),
     1, //('Arcadia 2001',           '50_Arcadia2001.ico',       'Arcadia2001.txt'),
     1, //('Tiger game.com',         '51_TigerGame.com.ico',     'TigerGame.com.txt'),
     2, //('Apple II',               '52_AppleII.ico',           'AppleII.txt'),
     2, //('Apple IIGS',             '53_AppleIIGS.ico',         'AppleIIGS.txt'),
     1, //('WonderSwan Color',       '54_WonderSwanColor.ico',   'WonderSwanColor.txt'),
     1, //('Neo-Geo Pocket Color',   '55_NeoGeoPocketColor.ico', 'NeoGeoPocketColor.txt'),
     2, //('Commodore 128',          '56_Commodore128.ico',      'Commodore128.txt'),
     1, //('Neo-Geo CD',             '57_NeoGeoCD.ico',          'NeoGeoCD.txt'),
     1, //('Atari Jaguar CD',        '58_AtariJaguarCD.ico',     'AtariJagiarCD.txt'),
     2, //('Amstrad CPC',            '59_AmstradCPC.ico',        'AmstradCPC.txt'),
     1, //('PSP',                    '60_PSP.ico',               'PSP.txt'),
     1, //('Philips CD-i',           '61_PhilipsCDi.ico',        'PhilipsCDi.txt'),
     2, //('Sega SF-7000',           '62_SegaSF7000.ico',        'SegaSF7000.txt'),
     1, //('Nintendo Satellaview',   '63_Satellaview.ico',       'Satellaview.txt'),
     1, //('Nintendo Wii U',         '64_NintendoWiiU.ico',      'NintendoWiiU.txt'),
     1, //('Nintendo 3DS',           '65_Nintendo3DS.ico',       'Nintendo3DS.txt'),
     1); //('SuFami Turbo',           '66_SuFamiTurbo.ico',       'SuFamiTurbo.txt'));}


var
  EmulatorFileCustom,
  EmulatorVersionCustom: packed array[1..MaxConsoleComputerSystems] of packed array[1..4] of String;

  EmulatorIndexToUseCustom: packed array[1..MaxConsoleComputerSystems] of ShortInt; // emulator index to use 1..4

  EmulatorParameterIndexToUseCustom: packed array[1..MaxConsoleComputerSystems] of packed array[Low(MediaTypeCustom)..High(MediaTypeCustom)] of ShortInt; // param 1..2

  EmulatorMountVirtualDrive, PlayWithAssociatedEmulator: packed array[1..MaxConsoleComputerSystems] of Boolean;

  // custom systems and custom games
  sysCustomFolders: packed array[1..MaxConsoleComputerSystems] of packed array[Low(MediaTypeCustom)..High(MediaTypeCustom)] of THashedStringList;
  // 1 -> cartridge; 2 -> disc image; 3 -> floppy disk; 4 -> cassette tape; 5 -> hard disk drive

  SnapshotFolderCustom: packed array[1..MaxConsoleComputerSystems] of packed array[0..High(ImageCategoryArray)] of String;
  // see uCommon.ImageCategoryArray[] for the image category indexes

  imgZipFileListConsComp: packed array[1..MaxConsoleComputerSystems] of packed array[0..High(ImageCategoryArray)-1] of THashedStringList;

  VirtualDriveFile, VirtualDriveMount, VirtualDriveUnmount: String;


// header functions definitions

procedure LoadCustomMAMEIconToForm(FormHolder: TForm; CustomImageIndex: Integer = 20);

procedure GetCustomGameFields(const ROMLine: String; DecodeUnicodeString: Boolean = False);
procedure GetCustomGameExtraFields(const ROMLine: String; DecodeUnicodeString: Boolean);

function  GetCustomGameMediaType(romTagIndex: Integer): Integer;
function  SystemUseCartridge(sysID: Integer): Boolean;
function  SystemUseDisc(sysID: Integer): Boolean;
function  SystemUseFloppyDisk(sysID: Integer): Boolean;
function  SystemUseCassetteTape(sysID: Integer): Boolean;
function  SystemUseHardDiskDrive(sysID: Integer): Boolean;
function  SystemIsConsole(sysID: Integer): Boolean;
function  SystemIsComputer(sysID: Integer): Boolean;
function  SystemIsHandheld(sysID: Integer): Boolean;
function  GetSystemTypeTitle(sysID: Integer; IsArcadeSystem: Boolean): String;

function  ELV_GetSystemTitleConsoleComputer(ELV_Holder: TEasyListView; SelectedItem: TEasyItem; EmulatorTitle: TShadowLabel = nil; SystemType: TShadowLabel = nil): String;
procedure ELV_PopulateCustomSystems(ELV_Holder: TEasyListView; SelectSystemID: Integer = 0; ActionMode: ShortInt = -1; HideAllSystemsItem: Boolean = False);

function  GetMiscSettingsFile: String;
function  GetCustomGamesFile(sysID: Integer): String;
function  GetCustomGamePlayedFile(sysID: Integer): String;
function  GetSysEmulators(ReturnFullPath: Boolean = True): String;
function  GetSysGameFolders(ReturnFullPath: Boolean = True): String;
function  GetSysImageFolders(ReturnFullPath: Boolean = True): String;
function  GetSysGameCustomFont(ReturnFullPath: Boolean = True): String;
function  GetEmuParametersFile(ReturnFullPath: Boolean = True; GetDefaultFileName: Boolean = False): String;

function  GetMediaTypeName(MediaTypeIndex: Integer; ParameterIndex: Byte = 1; IsEmuParameter: Boolean = False): String;

procedure ReadCustomEmulatorsInfo; // enable these later
procedure UpdateCustomEmulatorsInfo(UpdateEmulators: Boolean = True; OnlyUpdateEmulatorIndexToUse: Boolean = False);
procedure ReadCustomSysImageFolders;
procedure UpdateCustomSysImageFolders;
procedure ReadCustomGamesFolders;
procedure UpdateCustomGamesFolders;

function  CheckSystemGamesFolders(sysID: ShortInt): Boolean;

function  GetVirtualDriveIniSection(const VirtualDriveFileName: String): String;
procedure ReadDaemonToolsSettings(UpdateMainVars: Boolean; VirtualDriveFileName: TEdit = nil; MountEdit: TEdit = nil; UnmountEdit: TEdit = nil);

procedure EmuParametersAddMissingSections;

procedure InitializeCustomEmulatorVariables;

function  IsWinVice(const emuFile: String): Boolean;
function  IsAmigaUAE(const emuFile: String): Boolean;
function  IsWinApe(const emuFile: String): Boolean;
function  IsAppleWinEmu(const emuFile: String): Boolean;
function  IsAppleIIGS(const emufile: String): Boolean;

function  IsAtari800Emu(const emuFile: String): Boolean;
function  IsAtariPlusPlus(const emuFile: String): Boolean;
function  IsAltirra(const emuFile: String): Boolean;

function  FindFile(RootFolder: String; {const }FileName: WideString; out ResultVar: WideString; SearchISOmetadata: Boolean; out VarNameDOS: String): Boolean;

procedure GetPlayedGameInfoIniCustom(const LineStr: String;
                                     var TimesPlayedVar: Cardinal; var LastPlayedVar: Integer; var TotalPlaytimeVar: Int64);
function  GetPlayedGamePosIndex(ListPlayed: THashedStringList; const GameName: String; AddGameTag: Boolean = True): Integer;
function  GetCustomGamePosIndex(ListPlayed: THashedStringList; const GameName: String): Integer;

implementation

uses uMain;

// functions details

procedure LoadCustomMAMEIconToForm(FormHolder: TForm; CustomImageIndex: Integer = 20);
begin
  FormMain.IL_MenuPopup.GetIcon(CustomImageIndex, FormHolder.Icon);
end;

procedure GetCustomGameFields(const ROMLine: String; DecodeUnicodeString: Boolean = False);
var
  iStr: String;
begin
  // new 2016
  // SystemID MediaType IsUnicode <file>Game Filename (no path)/> <size>file size (bytes)/>
  // 005 01 0 <file>Hero.bin</file> <size>8192</size>

  //TempField:= '';
  //FieldNumber:= 1;
  //FormMain.ClearMemGameInfo(FormMain.TempGameVars);
  FormMain.TempGameVars.eIsCustomGame:= True;

  FormMain.TempGameVars.eCustomSystemID:= StrToInt(Copy(ROMLine, 1, 3));
  FormMain.TempGameVars.eCustomMediaType:= StrToInt(Copy(ROMLine, 4, 1));
  FormMain.TempGameVars.eIsUnicode:= Boolean(StrToInt(Copy(ROMLine, 5, 1)));

  FormMain.TempGameVars.eName:= SoftListGetEntryValue(ROMLine, 'file');

  iStr:= SoftListGetEntryValue(ROMLine, 'size');
  if iStr = '' then
     iStr:= '0';
  FormMain.TempGameVars.eGameSize:= StrToInt64(iStr);

  // the extra info is now parsed here!!!! May 25, 2017
  //FormMain.TempGameVars.eTitle:= SoftListGetEntryValue(ROMLine, 'title');

  //FormMain.TempGameVars.eYear:= SoftListGetEntryValue(ROMLine, 'year');
  //FormMain.TempGameVars.eManufacturer:= SoftListGetEntryValue(ROMLine, 'manuf');

  //FormMain.TempGameVars.eNumberPlayers:= SoftListGetEntryValue(ROMLine, 'nplayer');

  // huh ? softfile - softtitle ??? no use for them here!!!
  //FormMain.TempGameVars.eSoftwareName:= SoftListGetEntryValue(ROMLine, 'softfile');
  //FormMain.TempGameVars.eCategory:= SoftListGetEntryValue(ROMLine, 'softtitle'); // description of software list files...

  if FormMain.TempGameVars.eIsUnicode and DecodeUnicodeString then
     FormMain.TempGameVars.eName:= UTF8Decode(FormMain.TempGameVars.eName);

  if FormMain.TempGameVars.eTitle = '' then
     FormMain.TempGameVars.eTitle:= ChangeFileExtW(FormMain.TempGameVars.eName, '');
end;

procedure GetCustomGameExtraFields(const ROMLine: String; DecodeUnicodeString: Boolean);
var
  iStr: String;
begin
  iStr:= SoftListGetEntryValue(ROMLine, 'title');
  if iStr <> '' then
     FormMain.TempGameVars.eTitle:= UTF8Decode(iStr);

  iStr:= SoftListGetEntryValue(ROMLine, 'year');
  if iStr <> '' then
     FormMain.TempGameVars.eYear:= iStr;

  iStr:= SoftListGetEntryValue(ROMLine, 'manuf');
  if iStr <> '' then
     FormMain.TempGameVars.eManufacturer:= UTF8Decode(iStr);

  iStr:= SoftListGetEntryValue(ROMLine, 'nplayer');
  if iStr <> '' then
     FormMain.TempGameVars.eNumberPlayers:= iStr;
end;

function GetCustomGameMediaType(romTagIndex: Integer): Integer;
begin
  // media type (from EmuCon)
  // 0: ROM file ???? - this is not from EmuCon
  // 1: Cartridge
  // 2: Disc Image
  // 3: Floppy Disk
  // 4: Cassette Tape
  // 5: HDD - this is not from EmuCon

  case romTagIndex of
    00, 01, 02: Result:= 0; // ROM
    03, 04, 05: Result:= 1; // Cartridge
    06, 07, 08: Result:= 3; // Floppy Disk
    09, 10, 11: Result:= 4; // Cassette Tape
    12, 13, 14: Result:= 5; // for Amiga and maybe other home computers ????
    15, 16, 17: Result:= 2; // CD/LD/DVD/Blu-Ray
    // not used for console/home computers//18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
  end;
end;

function SystemUseCartridge(sysID: Integer): Boolean;
begin
  Result:= sysID in [01..18, 20, 23, 25, 26, 29, 31, 32, 36, 38..43, 43, 45, 46, 47..51, 54, 55, 56, 59, 63, 65, 66];
end;

function SystemUseDisc(sysID: Integer): Boolean;
begin
  Result:= sysID in [15, 16, 19, 21, 22, 24, 27, 28, 30, 33, 34, 35, 37, 44, 57, 58, 60, 61, 64];
end;

function SystemUseFloppyDisk(sysID: Integer): Boolean;
begin
  Result:= sysID in [38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 52, 53, 56, 59, 62];
end;

function SystemUseCassetteTape(sysID: Integer): Boolean;
begin
  Result:= sysID in [39, 40..43, 46, 47, 48, 49, 52, 56, 59];
end;

function SystemUseHardDiskDrive(sysID: Integer): Boolean;
begin
  // Commodore 64
  // MSX
  // Amiga
  // Atari ST
  // Apple II
  // Apple II GS
  // Commodore 128
  Result:= sysID in [39, 40..43, 44, 45, 52, 53, 56];
end;

function SystemIsConsole(sysID: Integer): Boolean;
begin
  Result:= sysID in [01, 03..08, 10, 12, 14..16, 18, 19, 21..24, 27, 28, 30, 32..38, 50, 57, 58, 61, 63, 64, 66];;
  // Result:= sysID in [01..38, 50, 51, 54, 55, 57, 58, 60, 61, 63.. 66]; // console+handheld
end;

function SystemIsComputer(sysID: Integer): Boolean;
begin
  Result:= sysID in [39..49, 5, 52, 53, 56, 59, 62];
end;

function SystemIsHandheld(sysID: Integer): Boolean;
begin
  Result:= sysID in [02, 09, 11, 13, 17, 20, 25, 26, 29, 31, 51, 54, 55, 60, 65];
end;

function GetSystemTypeTitle(sysID: Integer; IsArcadeSystem: Boolean): String;
begin
  if IsArcadeSystem then
     Result:= 'Arcade'
  else
  if SystemIsConsole(sysID) then
     Result:= 'Console'
  else
  if SystemIsComputer(sysID) then
     Result:= 'Computer'
  else
  if SystemIsHandheld(sysID) then
     Result:= 'Handheld';
end;

//function IsCustomSystemAvailable(const sysID: Integer): Boolean;
//begin
//  Result:= FormMain.ValidateFile(GetCustomGamesFile(sysID));
//  //Result:= FormMain.ValidateFile(FormMain.GetCustomGamesFolder+SystemsListCustom[sysID, 2]);
//end;

function ELV_GetSystemTitleConsoleComputer(ELV_Holder: TEasyListView; SelectedItem: TEasyItem; EmulatorTitle: TShadowLabel = nil; SystemType: TShadowLabel = nil): String;
begin
  Result:= SystemsListCustom[SelectedItem.ImageIndex, 0]; // .ImageIndex because there's only console/computer/handheld systems (from EmuCon)
  if SystemType <> nil then
     SystemType.Caption:= UpperCase(GetSystemTypeTitle(ELV_Holder.Tag, False));

  if EmulatorTitle <> nil then
     EmulatorTitle.Caption:= UpperCase(Result);
end;

procedure ELV_PopulateCustomSystems(ELV_Holder: TEasyListView; SelectSystemID: Integer = 0; ActionMode: ShortInt = -1; HideAllSystemsItem: Boolean = False);
var
  Loop: Integer;
  ShowSystem: Boolean;
  selItem: TEasyItem;

  function CheckFolders(sysID: Integer): Boolean;
  begin
    Result:= False;
    if sysID = 0 then
       begin
         Result:= not HideAllSystemsItem;
         Exit;
       end;

    if SystemUseCartridge(sysID) then
       Result:= Assigned(sysCustomFolders[sysID,  1]) and (sysCustomFolders[Loop, 1].Count > 0);

    if (not Result) and SystemUseDisc(sysID) then
       Result:= Assigned(sysCustomFolders[sysID,  2]) and (sysCustomFolders[Loop, 2].Count > 0);

    if (not Result) and SystemUseFloppyDisk(sysID) then
       Result:= Assigned(sysCustomFolders[sysID,  3]) and (sysCustomFolders[Loop, 3].Count > 0);

    if (not Result) and SystemUseCassetteTape(sysID) then
       Result:= Assigned(sysCustomFolders[sysID,  4]) and (sysCustomFolders[Loop, 4].Count > 0);

    if (not Result) and SystemUseHardDiskDrive(sysID) then
       Result:= Assigned(sysCustomFolders[sysID,  5]) and (sysCustomFolders[Loop, 5].Count > 0);
  end;

begin
  // Action Mode:
  // -1 -> all systems
  //  0 -> set visible available game files only
  //  1 -> set visible available system ROMs foldes only (create games list)
  //  2 -> MRU list (last played games)
  //  3 -> Add/Remove Disc Games (only systems with disc / image support!) ... this is not used anymore!!!!
  //  4 -> game custom fonts dialog, all systems, add sysID ImageIndex + 6

  ELV_Holder.BeginUpdate;
  ELV_Holder.Items.ReIndexDisable:= True;
  for Loop:=Ord(HideAllSystemsItem) to MaxConsoleComputerSystems do
  begin
    ShowSystem:= True;
    if Loop > 0 then
       begin
         case ActionMode of
           0: ShowSystem:= FormMain.IsSystemAvailable(Loop, True);
           1: ShowSystem:= CheckFolders(Loop);
           2: ShowSystem:= FormMain.ValidateFile(GetCustomGamePlayedFile(Loop));
         end;
       end;

    selItem:= ELV_Holder.Items.Add; // this is the real system ID... (arcade/console/computer can have same tags)

    if ActionMode <> 4 then
       begin
         selItem.ImageIndex:= Loop;
         //if AddSystemTypeLabel then
         begin
           selItem.Captions[1]:= '      '+LowerCase(GetSystemTypeTitle(Loop, False));
           selItem.Details[1]:= 1;
         end;
       end
    else
       begin
         selItem.ImageIndex:= Loop+5; // to display correct system icons in game custom font screen
         selItem.StateImageIndex:= Loop; // to keep track of the correct system icon
       end;

    selItem.Caption:= SystemsListCustom[Loop, 0];
    selItem.Visible:= ShowSystem;
    //selItem.Enabled:= ShowSystem; // if you click a disabled item, current selections are reset! :(
  end;
  ELV_Holder.Items.ReIndexDisable:= False;
  ELV_Holder.Sort.SortAll;

  ELV_Holder.Items.Exchange(ELV_Holder.Items.FindByCaption(SystemsListCustom[56, 0]).Index,
                            ELV_Holder.Items.FindByCaption(SystemsListCustom[39, 0]).Index); // Commodore 64 and 128

  ELV_Holder.Items.Exchange(ELV_Holder.Items.FindByCaption(SystemsListCustom[31, 0]).Index,
                            ELV_Holder.Items.FindByCaption(SystemsListCustom[2, 0]).Index); // Game Boy Color and Game Boy Advance

  ELV_Holder.Items.Exchange(ELV_Holder.Items.FindByCaption(SystemsListCustom[48, 0]).Index,
                            ELV_Holder.Items.FindByCaption(SystemsListCustom[5, 0]).Index); // Atari 400/800/XL and Atari 2600

  ELV_Holder.Items.Exchange(ELV_Holder.Items.FindByCaption(SystemsListCustom[65, 0]).Index,
                            ELV_Holder.Items.FindByCaption(SystemsListCustom[3, 0]).Index); // Nintendo 8-bit and Nintendo 3DS

  ELV_Holder.Items.Exchange(ELV_Holder.Items.FindByCaption(SystemsListCustom[65, 0]).Index,
                            ELV_Holder.Items.FindByCaption(SystemsListCustom[29, 0]).Index); // Nintendo 3DS and Nintendo DS 


  if not HideAllSystemsItem then
     ELV_Holder.Items.Exchange(1, 0); // change 3DO with All systems!!!

  ELV_Holder.EndUpdate;

  selItem:= nil;

  if ActionMode = 4 then
     Exit; // game custom font, do not select items in the list

  if not FormMain.CheckTotalVisible(ELV_Holder) then
     Exit;
  if SelectSystemID = idMultiSys then
     Exit; // games filter multi systems selected!!!!

  selItem:= ELV_Holder.Groups.FirstVisibleItem;
  if selItem = nil then
     Exit;

  if SelectSystemID <> -1 then
  begin
    repeat
      if selItem.ImageIndex <> SelectSystemID then
         selItem:= ELV_Holder.Groups.NextVisibleItem(selItem);
    until (selItem = nil) or (selItem.ImageIndex = SelectSystemID);

    if selItem = nil then
       selItem:= ELV_Holder.Groups.FirstVisibleItem;
  end;
  selItem.Selected:= True;
  ELV_Holder.Selection.FocusedItem:= selItem;
  selItem.MakeVisible(emvAuto);
end;

function GetMiscSettingsFile: String;
begin
  Result:= FormMain.GetConsoleComputerFolder+'misc_settings.ini';
end;

function GetCustomGamesFile(sysID: Integer): String;
begin
  Result:= FormMain.GetGamesFolderEL(2)+SystemsListCustom[sysID, 2];
end;

function GetCustomGamePlayedFile(sysID: Integer): String;
begin
  Result:= FormMain.GetFolderFull(39)+SystemsListCustom[sysID, 2];
end;

function GetSysEmulators(ReturnFullPath: Boolean = True): String;
begin
  Result:= 'sysemulators.ini';
  if ReturnFullPath then
     Result:= FormMain.GetConsoleComputerFolder+Result;
end;

function GetSysGameFolders(ReturnFullPath: Boolean = True): String;
begin
  Result:= 'sysgamefolders.ini';
  if ReturnFullPath then
     Result:= FormMain.GetConsoleComputerFolder+Result;
end;

function GetSysImageFolders(ReturnFullPath: Boolean = True): String;
begin
  Result:= 'sysimagefolders.ini';
  if ReturnFullPath then
     Result:= FormMain.GetConsoleComputerFolder+Result;
end;

function GetSysGameCustomFont(ReturnFullPath: Boolean = True): String;
begin
  Result:= 'sysgamecustomfont.ini';
  if ReturnFullPath then
     Result:= FormMain.GetConsoleComputerFolder+Result;
end;

function GetEmuParametersFile(ReturnFullPath: Boolean = True; GetDefaultFileName: Boolean = False): String;
begin
  case GetDefaultFileName of
    True : Result:= 'emulator_parameters[default].ini';
    False: Result:= 'emulator_parameters.ini';
  end;
  if ReturnFullPath then
     Result:= FormMain.GetConsoleComputerFolder+Result;
end;

function GetMediaTypeName(MediaTypeIndex: Integer; ParameterIndex: Byte = 1; IsEmuParameter: Boolean = False): String;
begin
  // ParameterIndex: 1 -> Param1; 2 -> Param2
  Result:= '';
  case MediaTypeIndex of
    0: Result:= 'DISC'; // boot cd!!! special case.
    1: Result:= 'ROM';
    2: Result:= 'ISO';
    3: Result:= 'FLOPPY';
    4: Result:= 'CASSETTE';
    5: Result:= 'HARDDISK';
  else
    begin
      GenerateMessage('Warning', 'Get Media Type Name', '    It seems that the index is higher than '+
           'uMain.GetMediaTypeName() function supports.'+#13#10+'Please contact the author. Media Index: '+
           IntToStr(MediaTypeIndex));
      Exit;
    end;
  end;
  if ParameterIndex = 2 then
     Result:= Result+'2';
  if IsEmuParameter then
     Result:= ' '+Result;
end;

procedure ReadCustomEmulatorsInfo;
var
  sysLoop: Integer;
  IniFileName: TMemIniFile;

  procedure ReadSystem(SystemID: Integer);
  var
    sLoop: Integer;
    sIndex: String;
  begin
    for sLoop:= 1 to 4 do
    begin
      sIndex:= '';
      if sLoop > 1 then
         sIndex:= IntToStr(sLoop);
      EmulatorFileCustom[SystemID, sLoop]:= IniFileName.ReadString(SystemsListCustom[SystemID, 0], 'Emulator'+sIndex, '');
      EmulatorVersionCustom[SystemID, sLoop]:= IniFileName.ReadString(SystemsListCustom[SystemID, 0], 'EmuDescription'+sIndex, '');

      if EmulatorFileCustom[SystemID, sLoop] <> '' then
         begin
           if EmulatorVersionCustom[SystemID, sLoop] = '' then
              EmulatorVersionCustom[SystemID, sLoop]:= Format('%s - (%u)', [SystemsListCustom[SystemID, 0], sLoop]);
         end
      else
         begin
           if EmulatorVersionCustom[SystemID, sLoop] <> '' then
              EmulatorVersionCustom[SystemID, sLoop]:= '';
         end;
    end;

    EmulatorIndexToUseCustom[SystemID]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseEmulator', 1);
    if EmulatorIndexToUseCustom[SystemID] = -1 then
       EmulatorIndexToUseCustom[SystemID]:= 1;
    EmulatorMountVirtualDrive[SystemID]:= (SystemID = 30); // will set to all to false but true for PC Engine CD!
    if SystemUseDisc(SystemID) then
       EmulatorMountVirtualDrive[SystemID]:= Boolean(IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'MountDaemonTools', Ord(SystemID = 30)));
       // for "PC Engine CD", mount with Daemon Tools is enabled by default!!!!

    PlayWithAssociatedEmulator[SystemID]:= Boolean(IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'PlayWithAssociatedApp', 0));

    if SystemUseCartridge(SystemID) then
       EmulatorParameterIndexToUseCustom[SystemID, 1]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexCartridge', 1);
    if SystemUseDisc(SystemID) then
       EmulatorParameterIndexToUseCustom[SystemID, 2]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexDiscImage', 1);
    if SystemUseFloppyDisk(SystemID) then
       EmulatorParameterIndexToUseCustom[SystemID, 3]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexFloppyDisk', 1);
    if SystemUseCassetteTape(SystemID) then
       EmulatorParameterIndexToUseCustom[SystemID, 4]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexCassetteTape', 1);
    if SystemUseHardDiskDrive(SystemID) then
       EmulatorParameterIndexToUseCustom[SystemID, 5]:= IniFileName.ReadInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexHardDiskDrive', 1);
  end;

begin
  if not FileExists(GetSysEmulators) then // sysemulators.ini
     Exit;

  IniFileName:= TMemIniFile.Create(GetSysEmulators);
  for sysLoop:= 1 to MaxConsoleComputerSystems do
      ReadSystem(sysLoop);
  FreeAndNil(IniFileName);
end;

procedure UpdateCustomEmulatorsInfo(UpdateEmulators: Boolean = True; OnlyUpdateEmulatorIndexToUse: Boolean = False);
var
  sysLoop: Integer;
  IniFileName: TMemIniFile;

  function UpdateEmulator(SystemID: Integer; EmulatorNumber: ShortInt): Boolean;
  var
    IndexStr: String;
  begin
    Result:= (EmulatorFileCustom[SystemID, EmulatorNumber] <> '');
    case Result of
      True:
        begin
          IndexStr:= '';
          if EmulatorNumber > 1 then
             IndexStr:= IntToStr(EmulatorNumber);

          IniFileName.WriteString(SystemsListCustom[SystemID, 0], 'Emulator'+IndexStr, EmulatorFileCustom[SystemID, EmulatorNumber]);
          IniFileName.WriteString(SystemsListCustom[SystemID, 0], 'EmuDescription'+IndexStr, EmulatorVersionCustom[SystemID, EmulatorNumber]);
        end;
      False:
        begin
          //IniFileName.DeleteKey(SystemsList[SystemID, 0], 'MountDaemonTools');
          //IniFileName.DeleteKey(SystemsList[SystemID, 0], 'PlayWithAssociatedApp');
        end;
    end;
  end;

  procedure WriteSystem(SystemID: Integer);
  begin
    if UpdateEmulators then
       begin
         UpdateEmulator(SystemID, 1);
         UpdateEmulator(SystemID, 2);
         UpdateEmulator(SystemID, 3);
         UpdateEmulator(SystemID, 4);
       end;

    if EmulatorIndexToUseCustom[SystemID] = -1 then
       EmulatorIndexToUseCustom[SystemID]:= 1;
    IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseEmulator', EmulatorIndexToUseCustom[SystemID]);

    if UpdateEmulators or (not OnlyUpdateEmulatorIndexToUse) then
    begin
      if SystemUseDisc(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'MountDaemonTools', Ord(EmulatorMountVirtualDrive[SystemID]));

      IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'PlayWithAssociatedApp', Ord(PlayWithAssociatedEmulator[SystemID]));

      if SystemUseCartridge(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexCartridge', EmulatorParameterIndexToUseCustom[SystemID, 1]);
      if SystemUseDisc(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexDiscImage', EmulatorParameterIndexToUseCustom[SystemID, 2]);
      if SystemUseFloppyDisk(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexFloppyDisk', EmulatorParameterIndexToUseCustom[SystemID, 3]);
      if SystemUseCassetteTape(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexCassetteTape', EmulatorParameterIndexToUseCustom[SystemID, 4]);
      if SystemUseHardDiskDrive(SystemID) then
         IniFileName.WriteInteger(SystemsListCustom[SystemID, 0], 'UseParameterIndexHardDiskDrive', EmulatorParameterIndexToUseCustom[SystemID, 5]);
    end;
  end;

begin
  if UpdateEmulators then
     DeleteFile(GetSysEmulators);// sysemulators.ini
  IniFileName:= TMemIniFile.Create(GetSysEmulators);
  for sysLoop:=1 to MaxConsoleComputerSystems do
      WriteSystem(sysLoop);
  IniFileName.UpdateFile;
  FreeAndNil(IniFileName);
end;

procedure ReadCustomSysImageFolders;
var
  sysLoop, ImgCatLoop: Integer;
  IniFileName: TMemIniFile;
begin
  if not FileExists(GetSysImageFolders) then // sysimagefolders.ini
     Exit;

  IniFileName:= TMemIniFile.Create(GetSysImageFolders);

  for sysLoop:=1 to MaxConsoleComputerSystems do
  begin
    // do not assign a default folder path... leave it empty if user hasn't selected one!!!! March 02, 2017
    // this is to prevent mixing up with arcade "snap.zip" files (other categories too)
    for ImgCatLoop:=0 to High(ImageCategoryArray)-1 do
        SnapshotFolderCustom[sysLoop, ImgCatLoop]:= IniFileName.ReadString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[ImgCatLoop, 4], ''); //, ImageCategoryArray[ImgCatLoop, 3]);
  end;
    //SnapshotFolderCustom[sysLoop, 0]:= IniFileName.ReadString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[0, 4], ImageCategoryArray[0, 3]);
    //SnapshotFolderCustom[sysLoop, 1]:= IniFileName.ReadString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[1, 4], ImageCategoryArray[0, 3]);
    //SnapshotFolderCustom[sysLoop, 2]:= IniFileName.ReadString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[2, 4], ImageCategoryArray[0, 3]);
  //end;
  FreeAndNil(IniFileName);
end;

procedure UpdateCustomSysImageFolders;
var
  sysLoop, sysCategory: Integer;
  IniFileName: TMemIniFile;
begin
  //DeleteFile(GetSysImageFolders); //sysimagefolders.ini
  IniFileName:= TMemIniFile.Create(GetSysImageFolders);//AppPath+'sysimagefolders.ini');
  for sysLoop:=1 to MaxConsoleComputerSystems do
  begin
    for sysCategory:= 0 to High(ImageCategoryArray)-1 do
        IniFileName.WriteString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[sysCategory, 4], SnapshotFolderCustom[sysLoop, sysCategory]);
    //begin
    //  if SnapshotFolderCustom[sysLoop, sysCategory] <> '' then
    //     IniFileName.WriteString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[sysCategory, 4], SnapshotFolderCustom[sysLoop, sysCategory]);
    //end;

    // old code from EmuCon, no longer used (February 11, 2017)
    //if SnapshotFolderCustom[sysLoop, 0] <> '' then
    //   IniFileName.WriteString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[0, 4], SnapshotFolderCustom[sysLoop, 0]);
    //if SnapshotFolderCustom[sysLoop, 1] <> '' then
    //   IniFileName.WriteString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[1, 4], SnapshotFolderCustom[sysLoop, 1]);
    //if SnapshotFolderCustom[sysLoop, 2] <> '' then
    //   IniFileName.WriteString(SystemsListCustom[sysLoop, 0], ImageCategoryArray[2, 4], SnapshotFolderCustom[sysLoop, 2]);
  end;
  IniFileName.UpdateFile;
  FreeAndNil(IniFileName);
  if not FormMain.ValidateFile(GetSysImageFolders) then
     DeleteFile(GetSysImageFolders);
end;

procedure ReadCustomGamesFolders;
var
  sysLoop, MediaTypeLoop, idxMediaType: Integer;
  IniFileName: TMemIniFile;
  LineString, ValueString, SectionStr, MediaTypeStr: String;
  Continue: Boolean;

  function GetFolderToMemVar(SystemID: Integer; MediaTypeIndex: Integer): Boolean;
  var
    Loop: Integer;
  begin
    if not Assigned(sysCustomFolders[SystemID, MediaTypeIndex]) then
       sysCustomFolders[SystemID, MediaTypeIndex]:= THashedStringList.Create;
    sysCustomFolders[SystemID, MediaTypeIndex].Clear;
    ValueString:= '';
    sysCustomFolders[SystemID, MediaTypeIndex].BeginUpdate;
    for Loop:=1 to Length(LineString) do
    begin
      if LineString[Loop] <> ';' then
         ValueString:= ValueString+LineString[Loop]
      else
         begin
           sysCustomFolders[SystemID, MediaTypeIndex].Add(ValueString);
           ValueString:= '';
         end;
    end;
  end;

begin
  if not FileExists(GetSysGameFolders) then
     Exit;

  // read folders from new "sysgamefolders.ini" format
  // [System Name]
  // ROM=folders list
  // ISO=folders list
  // FLOPPY=folders list
  // CASSETTE=folders list
  // HARDDISK=folders list
  IniFileName:= TMemIniFile.Create(GetSysGameFolders);
  for sysLoop:=1 to MaxConsoleComputerSystems do
  begin
    SectionStr:= SystemsListCustom[sysLoop, 0];
    for MediaTypeLoop:= Low(MediaTypeCustom) to High(MediaTypeCustom) do
    begin
      Continue:= False;
      case MediaTypeLoop of
        1: Continue:= SystemUseCartridge(sysLoop);
        2: Continue:= SystemUseDisc(sysLoop);
        3: Continue:= SystemUseFloppyDisk(sysLoop);
        4: Continue:= SystemUseCassetteTape(sysLoop);
        5: Continue:= SystemUseHardDiskDrive(sysLoop);
      end;
      if Continue then
         begin
           MediaTypeStr:= GetMediaTypeName(MediaTypeLoop);
           LineString:= IniFileName.ReadString(SectionStr, MediaTypeStr, '');
           if LineString <> '' then
              GetFolderToMemVar(sysLoop, MediaTypeLoop);
         end;
    end;
  end;
  FreeAndNil(IniFileName);
end;

procedure UpdateCustomGamesFolders;
var
  sysLoop, MediaTypeLoop, LoopFolders: Integer;
  IniFileName: TMemIniFile;
  LineString, SectionStr, MediaTitle: String;
begin
  // read folders from new "sysgamefolders.ini" format
  // [System Name]
  // ROM=folders list
  // ISO=folders list
  // FLOPPY=folders list
  // CASSETTE=folders list
  // HARDDISK=folders list
  DeleteFile(GetSysGameFolders);
  IniFileName:= TMemIniFile.Create(GetSysGameFolders);
  for sysLoop:=1 to MaxConsoleComputerSystems do
  begin
    SectionStr:= SystemsListCustom[sysLoop, 0];
    for MediaTypeLoop:= Low(MediaTypeCustom) to High(MediaTypeCustom) do
    begin
      if (Assigned(sysCustomFolders[sysLoop, MediaTypeLoop]) and (sysCustomFolders[sysLoop, MediaTypeLoop].Count > 0)) then
         begin
           MediaTitle:= GetMediaTypeName(MediaTypeLoop);
           LineString:= '';
           for LoopFolders:=0 to sysCustomFolders[sysLoop, MediaTypeLoop].Count-1 do
               LineString:= LineString+sysCustomFolders[sysLoop, MediaTypeLoop].Strings[LoopFolders]+';';
           IniFileName.WriteString(SectionStr, MediaTitle, LineString);
         end;
    end;
  end;
  IniFileName.UpdateFile;
  FreeAndNil(IniFileName);
  if not FormMain.ValidateFile(GetSysGameFolders) then
     DeleteFile(GetSysGameFolders);
end;

function CheckSystemGamesFolders(sysID: ShortInt): Boolean;
var
  iniFileStr: THashedStringList;
begin
  Result:= FormMain.ValidateFile(GetSysGameFolders); // sysgamefolders.ini
  if not Result then
     Exit;

  // check if system section exists...
  iniFileStr:= THashedStringList.Create;
  iniFileStr.LoadFromFile(GetSysGameFolders);
  Result:= iniFileStr.IndexOf('['+SystemsListCustom[sysID, 0]+']') <> -1;
  FreeAndNil(iniFileStr);
end;

function GetVirtualDriveIniSection(const VirtualDriveFileName: String): String;
var
  tFile: String;
begin
  if VirtualDriveFileName = '' then
     begin
       Result:= 'Daemon Tools';
       Exit;
     end;
  tFile:= LowerCase(VirtualDriveFileName);
  if PosEx('vcdmount', tFile) <> 0 then
     Result:= 'Virtual CloneDrive' // Elby Virtual CloneDrive
  else
  if (PosEx('dtlite', tFile) <> 0) or (PosEx('daemon', tFile) <> 0) then
     Result:= 'Daemon Tools'
  else
  if PosEx('axcmd', tFile) <> 0 then
     Result:= 'Alcohol 120%'
  else
     Result:= 'Custom Virtual Drive';
end;

procedure ReadDaemonToolsSettings(UpdateMainVars: Boolean; VirtualDriveFileName: TEdit = nil; MountEdit: TEdit = nil; UnmountEdit: TEdit = nil);
var
  dtoolsFileName: TMemIniFile;
  iniSection, dtFile, dtMount, dtUnmount: String;
begin
  case FileExists(GetEmuParametersFile) of
    True:
      begin
        dtoolsFileName:= TMemIniFile.Create(GetEmuParametersFile);
        if VirtualDriveFileName = nil then
           dtFile:= dtoolsFileName.ReadString('Daemon Tools', 'File', '')
        else
           dtFile:= VirtualDriveFileName.Text;
        iniSection:= GetVirtualDriveIniSection(dtFile);
        dtMount:= dtoolsFileName.ReadString(iniSection, 'Mount', '-mount scsi, 0, "%s"');
        dtUnmount:= dtoolsFileName.ReadString(iniSection, 'Unmount', '-unmount scsi, 0');
      end;
    False:
      begin
        // set default parameters, Daemon Tools
        dtFile:= '';
        dtMount:= '-mount scsi, 0, "%s"';
        dtUnmount:= '-unmount scsi, 0';
      end;
  end;
  FreeAndNil(dtoolsFileName);
  if MountEdit <> nil then
     MountEdit.Text:= dtMount;
  if UnmountEdit <> nil then
     UnmountEdit.Text:= dtUnmount;
  if UpdateMainVars then
     begin
       VirtualDriveFile:= dtFile;
       VirtualDriveMount:= dtMount;
       VirtualDriveUnmount:= dtUnmount;
     end;
end;

procedure EmuParametersAddMissingSections;
var
  SysLoop: Byte;
  SectionIndex, Loop: Integer;
  {MissingSections, }EmuParamUpd, DefaultEmuParamFile: THashedStringList;
  SectionStr, EntryStr{, PrevEntryStr}: String;
  FileUpdated: Boolean;
begin
  if (not FormMain.ValidateFile(GetEmuParametersFile)) or (not FormMain.ValidateFile(GetEmuParametersFile(True, True))) then
     Exit;

  EmuParamUpd:= THashedStringList.Create;
  DefaultEmuParamFile:= THashedStringList.Create;

  EmuParamUpd.LoadFromFile(GetEmuParametersFile);
  DefaultEmuParamFile.LoadFromFile(GetEmuParametersFile(True, True));

  FileUpdated:= False;
  EmuParamUpd.BeginUpdate;
  for SysLoop:=1 to MaxConsoleComputerSystems do
  begin
    SectionStr:= '['+SystemsListCustom[SysLoop, 0]+']';
    if EmuParamUpd.IndexOf(SectionStr) = -1 then
       begin
         SectionIndex:= DefaultEmuParamFile.IndexOf(SectionStr);
         if SectionIndex <> -1 then
            begin
              FileUpdated:= True;
              EntryStr:= EmuParamUpd[EmuParamUpd.Count-1];
              if EntryStr <> '' then
                 EmuParamUpd.Add('');
              EmuParamUpd.Add(SectionStr);
              for Loop:= SectionIndex+1 to DefaultEmuParamFile.Count-1 do
              begin
                EntryStr:= DefaultEmuParamFile[Loop];
                if (EntryStr = '') or (EntryStr[1] <> '[') then
                   EmuParamUpd.Add(EntryStr)
                else
                   Break; // finished adding the section, get outta here!
              end;
            end;
       end;
  end;
  EmuParamUpd.EndUpdate;
  if FileUpdated then
     EmuParamUpd.SaveToFile(GetEmuParametersFile);
  FreeAndNil(EmuParamUpd);
  FreeAndNil(DefaultEmuParamFile);
end;

procedure InitializeCustomEmulatorVariables;
var
  Loop, Loop2: Integer;
begin
  // define values for all arrays or exception error will occur....
  try
    //SystemsFilters[0]:= True;
    for Loop:= 1 to MaxConsoleComputerSystems do
    begin
      EmulatorIndexToUseCustom[Loop]:= 1;
      for Loop2:= Low(MediaTypeCustom) to High(MediaTypeCustom) do
          EmulatorParameterIndexToUseCustom[Loop, Loop2]:= 1;
      EmulatorMountVirtualDrive[Loop]:= (Loop = 30);
      PlayWithAssociatedEmulator[Loop]:= False;
      //SystemsFilters[Loop]:= True;
      for Loop2:= 1 to Length(EmulatorFileCustom[Loop]) do
      begin
        EmulatorFileCustom[Loop, Loop2]:= '';
        EmulatorVersionCustom[Loop, Loop2]:= '';
      end;
      for Loop2:=Low(MediaTypeCustom) to High(MediaTypeCustom) do
          sysCustomFolders[Loop, Loop2]:= nil; // only 1 folder list for now...
    end;

    for Loop:=Low(SnapshotFolderCustom) to High(SnapshotFolderCustom) do
    begin
      for Loop2:= Low(SnapshotFolderCustom[1]) to High(SnapshotFolderCustom[1]) do
          SnapshotFolderCustom[Loop, Loop2]:= '';
    end;
  finally
  end;
end;

function IsWinVice(const emuFile: String): Boolean;
begin
  Result:= SameText(emuFile, 'x64.exe') or
           SameText(emuFile, 'x64sc.exe') or
           SameText(emuFile, 'x128.exe') or
           SameText(emuFile, 'x64dtv.exe');
end;

function IsAmigaUAE(const emuFile: String): Boolean;
begin
  Result:= SameText(emuFile, 'WinUAE.exe') or
           SameText(emuFile, 'FS-UAE.exe');
end;

function IsWinApe(const emuFile: String): Boolean;
begin
  Result:= SameText(emuFile, 'WinApe.exe');
end;

function IsAppleWinEmu(const emuFile: String): Boolean;
begin
  // for Apple II system
  Result:= SameText(emuFile, 'AppleWin.exe');
end;

function IsAppleIIGS(const emuFile: String): Boolean;
begin
  Result:= SameText(emuFile, 'kegs32.exe') or
           SameText(emuFile, 'GSport.exe');
end;

function IsAtari800Emu(const emuFile: String): Boolean;
begin
  Result:= SameText(emuFile, 'atari800.exe') or
           SameText(emuFile, 'Atari800Win.exe');
end;

function IsAtariPlusPlus(const emuFile: String): Boolean;
begin
  // Atari 800 emulator
  Result:= SameText(emuFile, 'atari++.exe');
end;

function IsAltirra(const emuFile: String): Boolean;
begin
  // Atari 800 emulator
  Result:= SameText(emuFile, 'altirra64.exe') or
           SameText(emuFile, 'altirra.exe');
end;

function FindFile(RootFolder: String; FileName: WideString; out ResultVar: WideString; SearchISOmetadata: Boolean; out VarNameDOS: String): Boolean;
const
  ISO_metadata: array[1..5] of String = ('.m3u', '.cue', '.toc', '.mds', '.ccd'); // .m3u is for Mednafen emulator, multiple CD games...
var
  FoldersList: THashedStringList;
  Loop: Integer;
  FolderStr: String;
  FileISO, FileMetadata: WideString;

  function FindISOmetadata(const SubFolderStr: String): Boolean;
  var
    LoopISO: Integer;
    newFileName: WideString;
  begin
    for LoopISO:=Low(ISO_metadata) to High(ISO_metadata) do
    begin
      newFileName:= ChangeFileExtW(FileName, ISO_metadata[LoopISO]);
      Result:= FileExistsW(SubFolderStr+newFileName);
      if Result then
         begin
           FileMetadata:= SubFolderStr+newFileName;
           Break;
         end;
    end;
  end;

begin
  Result:= RootFolder <> '';
  if not Result then
     Exit;
  RootFolder:= IncludeTrailingPathDelimiter(RootFolder);
  Result:= FileExistsW(RootFolder+FileName);
  //if Result then
  //   ShowMessageW('FileExistsW('+RootFolder+FileName+')'+#13#10+#13#10+'File found!')
  //else
  //   ShowMessageW('FileExistsW('+RootFolder+FileName+')'+#13#10+'File NOT found!');
  if Result then
     begin
       ResultVar:= RootFolder+FileName;
       //FileISO:= RootFolder+FileName;
       if SearchISOmetadata then
          begin
            if FindISOmetadata(RootFolder) then
               ResultVar:= FileMetadata;
          end;

       {case SearchISOmetadata of
         True:
           begin
             case FindISOmetadata(RootFolder) of
               True : ResultVar:= FileMetadata;
               False: ResultVar:= FileISO;
             end;
           end;
         False: ResultVar:= FileISO;
       end;}
       Exit;
     end;

  // do a recursive search if file not found in main folder
  FoldersList:= THashedStringList.Create;
  GetFoldersList(RootFolder, FoldersList, True, True);
  for Loop:=0 to FoldersList.Count-1 do
  begin
    FolderStr:= IncludeTrailingPathDelimiter(FoldersList[Loop]);
    Result:= FileExistsW(FolderStr+FileName);
    if Result then
       begin
         ResultVar:= FolderStr+FileName;
         //FileISO:= FolderStr+FileName;
         if SearchISOmetadata then
          begin
            if FindISOmetadata(FolderStr) then
               ResultVar:= FileMetadata;
          end;

         {case SearchISOmetadata of
           True:
             begin
               case FindISOmetadata(FolderStr) of
                 True : ResultVar:= FileMetadata;
                 False: ResultVar:= FileISO;
               end;
             end;
           False: ResultVar:= FileISO;
         end;}
         Break;
       end;
  end;
  FreeAndNil(FoldersList);
end;

procedure GetPlayedGameInfoIniCustom(const LineStr: String;
                               var TimesPlayedVar: Cardinal; var LastPlayedVar: Integer; var TotalPlaytimeVar: Int64);
var
  iPos, iPos2, vPos: Integer;
  iStr, ValueStr: String;
begin
  // <file>Game Filename/> media_type is_unicode times_played;last_played;total_playtime
  // <file>H.E.R.O. (1984) (Activision).bin/>10 2;1219279034;9454

  // only 9 media types max will be supported in EmuCon
  // cart, disc, floppy, cassette. what more media types can one have ???

  if LineStr = '' then
     Exit;
  vPos:= PosEx('/>', LineStr);
  ValueStr:= Copy(LineStr, vPos+2, Length(LineStr));

  //showMessage('LineStr:'+#13#10+LineStr+#13#10+#13#10+'ValueStr:'+#13#10+ValueStr);


  //MediaTypeVar:= StrToInt(LineStr[1]); // always at position 1 (first char in the string)...
  iPos:= Pos(';', ValueStr); // last played
  iPos2:= PosEx(';', ValueStr, iPos+1); // total playtime

  iStr:= Copy(ValueStr, 4, iPos-4);
  TimesPlayedVar:= StrToInt(iStr);

  iStr:= Copy(ValueStr, iPos+1, iPos2-(iPos+1));
  LastPlayedVar:= StrToInt(iStr);

  iStr:= Copy(ValueStr, iPos2+1, Length(ValueStr));
  TotalPlaytimeVar:= StrToInt64(iStr);
end;

function GetPlayedGamePosIndex(ListPlayed: THashedStringList; const GameName: String; AddGameTag: Boolean = True): Integer;
var
  iStr: String;
  Loop: Integer;
  iPos: Integer;
begin
  Result:= -1;
  for Loop:=0 to ListPlayed.Count-1 do
  begin
    iStr:= ListPlayed[Loop];
    case AddGameTag of
      True : iPos:= PosEx('<file>'+GameName+'/>', iStr);
      False: iPos:= PosEx(GameName, iStr); // this is only used by ExecuteGame()
    end;
    if iPos <> 0 then
    begin
      Result:= Loop;
      Break;
    end;
  end;
end;

function GetCustomGamePosIndex(ListPlayed: THashedStringList; const GameName: String): Integer;
var
  iStr: String;
  Loop: Integer;
  iPos: Integer;
begin
  Result:= -1;
  for Loop:=0 to ListPlayed.Count-1 do
  begin
    iStr:= ListPlayed[Loop];
    iPos:= PosEx('<file>'+GameName+'/>', iStr);
    if iPos <> 0 then
    begin
      Result:= Loop;
      Break;
    end;
  end;
end;


end.
