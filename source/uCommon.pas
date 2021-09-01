unit uCommon;

{$I-,R-}

interface

uses
  Windows, RTLConsts, Classes, StdCtrls, ExtCtrls, ComCtrls, CommCtrl,
  Graphics, SysUtils, ShlObj, Forms, Menus, Controls, IniFiles, ShellAPI,
  MessageDigests, MessageAuthenticationCodes, Consts, CommDlg, Registry,
  uMessageBox, uMessageBox_4K, uSelectDirectory, Math, MPCommonUtilities,
  ShadowLabel, AdvOfficeButtons, AdvGroupBox, PanelEx, EditEx, ButtonsEx,
  BevelEx, ColorBoxEx, TntEditEx, GR32_RangeBars, uGR32Extra, XiTrackBar;//, uGetWindowsVersion;

const
  MaxArcadeSystems = 8;
  MaxIniCountMAME: Byte = 12; // MAME .ini files array - see more in uMain.GetCustomIniFileMAME() function
  MaxImagePerCategory   = 30;
  MaxImageLayouts       = 26; // single, dual, triple, quad
  MaxImagePanels        = 4;

  idMAME       = 1;
  idSupermodel = 2;
  idDaphne     = 3;
  idDemul      = 4;
  idHBMAME     = 5;
  idDICE       = 6;
  idSegaModel2 = 7;
  idZiNc       = 8;
  idMultiSys   = 500; // when selecting multiple systems

  //idFontParent      = 0;
  //idFontClone       = 1;
  //idFontMissingROMs = 2;

  aScreenType:  array[-1..4] of String = ('', 'Raster', 'Vector', 'LCD', 'SVG', 'Unknown');
  aOrientation: array[-1..1] of String = ('', 'Horizontal', 'Vertical');
  aStatus:      array[-1..2] of String = ('', 'Good', 'Imperfect', 'Preliminary');
  aSaveState:   array[-1..1] of String = ('', 'Unsupported', 'Supported');
  aMediaType:   array[-1..1] of array[0..1] of String =
    (('', ''),
     ('ROM', 'zipfile'),
     ('Compressed Hunks of Data', 'chd'));

  aScanMode: array[0..2] of String = ('Full Scan', 'Quick Scan', 'Force Available');

  SystemStr: String[1] = '"';
  CommandPromptStr: String = 'cmd.exe /c ';

  ImageCategoryArray: packed array[0..16] of packed array[0..5] of String = (
    //IconFileName,           IniSectionName,     NotAvailableName,    default path, ui.ini/mame.ini entry name,  CategoryTitle
     ('image_00_titlesnap',   'TitleSnapshot',    'title.png',         'titles',     'titles_directory',          'Title Snapshot'),
     ('image_01_gamesnap',    'GameSnapshot',     'ingame.png',        'snap',       'snapshot_directory',        'Game Snapshot'),
     ('image_02_marquee',     'Marquee',          'marquee.png',       'marquees',   'marquees_directory',        'Marquee'),
     ('image_03_flyer',       'Flyer',            'flyer.png',         'flyers',     'flyers_directory',          'Flyer'),
     ('image_04_cabinet',     'Cabinet',          'cabinet.png',       'cabinets',   'cabinets_directory',        'Cabinet'),
     ('image_05_cpanel',      'ControlPanel',     'controlpanel.png',  'cpanel',     'cpanels_directory',         'Control Panel'),
     ('image_06_cover',       'SoftwareCover',    'softwarecover.png', 'covers',     'covers_directory',          'Software Cover'),
     ('image_07_pcb',         'PCB',              'pcb.png',           'pcb',        'pcbs_directory',            'PCB'),
     ('image_08_gameartwork', 'GameArtwork',      'ingameartwork.png', 'artpreview', 'artwork_preview_directory', 'Game Artwork'),
     ('image_09_end',         'End',              'end.png',           'ends',       'ends_directory',            'End'),
     ('image_10_boss',        'Boss',             'boss.png',          'bosses',     'bosses_directory',          'Boss'),
     ('image_11_logo',        'Logo',             'logo.png',          'logo',       'logos_directory',           'Logo'),
     ('image_12_score',       'Score',            'score.png',         'scores',     'scores_directory',          'Score'),
     ('image_13_versus',      'Versus',           'versus.png',        'versus',     'versus_directory',          'Versus'),
     ('image_14_gameover',    'GameOver',         'gameover.png',      'gameover',   'gameover_directory',        'Game Over'),
     ('image_15_howto',       'HowToPlay',        'howtoplay.png',     'howto',      'howto_directory',           'How to Play'),
     ('image_16_select',      'Select',           'select.png',        'select',     'select_directory',          'Select'));

  aColumns: packed array[0..23] of packed array[0..1] of String = (
   // IniEntryName,      ColumnTitle
     ('Title',           'Title'),            // 00
     ('Year',            'Year'),             // 01
     ('Manufacturer',    'Manufacturer'),     // 02

     ('Orientation',     'Orientation'),      // 03
     ('Resolution',      'Resolution'),       // 04
     ('RefreshRate',     'Refresh Rate'),     // 05

     ('Category',        'Category'),         // 06 catver.ini / category.ini (MAME arcade); mess.ini (version.ini pack AntoPISA); non-arcade machines -listxml; softlist <description> (hash\softwarelist.xml files)
     ('VersionAdded',    'Version Added'),    // 07

     ('Name',            'Game Name'),        // 08
     ('Clone',           'Clone of'),         // 09
     ('DriverName',      'Driver Name'),      // 10

     ('NumPlayers',      'Players'),          // 11

     ('DriverStatus',    'Driver Status'),    // 12
     ('EmulationStatus', 'Emulation Status'), // 13
     ('ColorStatus',     'Color Status'),     // 14
     ('SoundStatus',     'Sound Status'),     // 15
     ('GraphicStatus',   'Graphic Status'),   // 16

     ('Played',          'Played'),           // 17
     ('Language',        'Language'),         // 18

     ('GameSize',        'Game Size'),        // 19
     ('LastPlayed',      'Last Played'),      // 20
     ('Playtime',        'Playtime'),         // 21
     ('SoftwareName',    'Software Name'),    // 22
     ('Special',         'Special'));         // 23

  aColumnsWidth: packed array[0..23] of Integer = (//10          13  14  15  16           19   20   21   22
    400, 65, 180, 100, 90, 100, 180, 100, 100, 100, 105, 80, 90, 90, 90, 90, 90, 60, 100, 115, 130, 110, 130, 65);

  aColumnsMachinesList: packed array[0..6] of String =
     ('Machine', 'Year', 'Manufacturer', 'Name', 'Clone', 'Driver', 'SaveState'); // MAME Machines Filter Panel

  aColumnsWidthMachinesList: array[0..6] of Integer =  // MAME Machines Filter Panel
     (250, 45, 120, 85, 85, 95, 90);

  aColumnsSoftwareListOrder: array[0..11] of Integer = // MAME Machines Filter Panel
     ( 0,  // 00 -> title
       1,  // 01 -> year
       2,  // 02 -> manufacturer
       6,  // 03 -> category
      17,  // 04 -> times played
      20,  // 05 -> last played date/time
      21,  // 06 -> total playtime
       8,  // 07 -> game name
       9,  // 08 -> clone of
      12,  // 09 -> driver status
      13,  // 10 -> emulation status
      19); // 11 -> game size

  ChecksumMode: array [0..4] of TMessageDigestClass = (TMD2, TMD4, TMD5, TSHA1, TRIPEMD160);

  {ListSelectionColors: packed array[0..4] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red),
    //(($00fcdcc3, $00c3dcfc), // new single color (October 26, 2016)
    // old single color (($00a65c41, $00415ca6),  // 0 -> bar single color
    (($00fcdbc1, $00c1dbfc),  // 0 -> bar single color
     ($00fcebdc, $00dcebfc),  // 1 -> gradient color top
     ($00fcdbc1, $00c1dbfc),  // 2 -> gradient color bottom
     ($00b98c64, $00648cb9),  // 3 -> gradient border color (new - October 26, 2016) R:100 G:140 B:185
     (clBlack  , clMaroon));}

     //($00cea27d, $007da2ce),  // 3 -> gradient border color
     //($006c0000, $0000006c)); // 4 -> font color (new color - October 26, 2016)
     //($00cc6600, $000066cc)); // 4 -> font color

  // Windows 10 selection bar colors
  {ListSelectionColors: packed array[0..4] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red),
    (($00ffe8cc, $00cce8ff),  // 0 -> bar single color
     ($00ffe8cc, $00cce8ff),  // 1 -> gradient color top
     ($00ffe2bf, $00bfe2ff),  // 2 -> gradient color bottom
     ($00ffd199, $0099d1ff),  // 3 -> gradient border color
     (clBlack  , clMaroon));}

     // $00e8a766 // border color (blue)
     // $00ffe8d1 // bar single color (blue)

     // $0066a7e8 // border color (red)
     // $00d1e8ff // bar single color (red)

     // $00dedede // border color (gray)
     // $00f7f7f7 // bar single color (gray)

  {ListSelectionColorInactive: packed array[0..3] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red)
    (($00d2d2c8, $00c8d2d2), // 0 -> inactive single color R:222 G:222 B:222
     ($00dcdcdc, $00dcdcdc), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($008e8e8e, $008e8e8e), // 2 -> inactive border color, gradient mode (same as bar single color) R:142 G:142: B:142
     (clBlack, clBlack));      // 3 -> inactive font color}

  {ListSelectionColorInactive: packed array[0..3] of packed array[0..1] of Integer =
    // normal colors (blue), missing ROMs/CHDs colors (red)
    (($00d2d2c8, $00c8d2d2), // 0 -> inactive single color
    // ($00f7f7f7, $00f7f7f7), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($00dcdcdc, $00dcdcdc), // 1 -> inactive color, gradient mode(same as gradient color top)
     ($00cdcdcd, $00cdcdcd), // 2 -> inactive border color, gradient mode (same as bar single color)
     (clSilver, clSilver));      // 3 -> inactive font color}

  // too light colors... better on a dark background
  //ListSelectionColorInactiveMachinesList: packed array[0..3] of packed array[0..1] of Integer =
  //  // normal colors (blue), missing ROMs/CHDs colors (red)
  //  (($00e8c39b, $009bc3e8), // 0 -> inactive single color
  //   ($00fef8f0, $00f0f8fe), // 1 -> inactive color, gradient mode(same as gradient color top)
  //   ($00fef1e0, $00e0f1fe), // 2 -> inactive border color, gradient mode (same as bar single color)
  //   (clGray, clGray));      // 3 -> inactive font color

  VersionInfo: array [1..9] of String = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
    'LegalCopyRight', 'OriginalFileName', 'ProductName', 'ProductVersion',
    'SpecialBuild');

  Model3PowerPCFrequency: array [0..8] of Byte = (16, 20, 25, 33, 40, 50, 60, 66, 75); // for Supermodel 3 emulator

  CRC32Table: array[0..255] of DWORD =
   ($00000000, $77073096, $EE0E612C, $990951BA,
    $076DC419, $706AF48F, $E963A535, $9E6495A3,
    $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988,
    $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
    $1DB71064, $6AB020F2, $F3B97148, $84BE41DE,
    $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
    $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC,
    $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
    $3B6E20C8, $4C69105E, $D56041E4, $A2677172,
    $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
    $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940,
    $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
    $26D930AC, $51DE003A, $C8D75180, $BFD06116,
    $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
    $2802B89E, $5F058808, $C60CD9B2, $B10BE924,
    $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,

    $76DC4190, $01DB7106, $98D220BC, $EFD5102A,
    $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
    $7807C9A2, $0F00F934, $9609A88E, $E10E9818,
    $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
    $6B6B51F4, $1C6C6162, $856530D8, $F262004E,
    $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
    $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C,
    $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
    $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2,
    $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
    $4369E96A, $346ED9FC, $AD678846, $DA60B8D0,
    $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
    $5005713C, $270241AA, $BE0B1010, $C90C2086,
    $5768B525, $206F85B3, $B966D409, $CE61E49F,
    $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4,
    $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,

    $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A,
    $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
    $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8,
    $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
    $F00F9344, $8708A3D2, $1E01F268, $6906C2FE,
    $F762575D, $806567CB, $196C3671, $6E6B06E7,
    $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC,
    $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
    $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252,
    $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
    $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60,
    $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
    $CB61B38C, $BC66831A, $256FD2A0, $5268E236,
    $CC0C7795, $BB0B4703, $220216B9, $5505262F,
    $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04,
    $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,

    $9B64C2B0, $EC63F226, $756AA39C, $026D930A,
    $9C0906A9, $EB0E363F, $72076785, $05005713,
    $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38,
    $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
    $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E,
    $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
    $88085AE6, $FF0F6A70, $66063BCA, $11010B5C,
    $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
    $A00AE278, $D70DD2EE, $4E048354, $3903B3C2,
    $A7672661, $D06016F7, $4969474D, $3E6E77DB,
    $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0,
    $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
    $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6,
    $BAD03605, $CDD70693, $54DE5729, $23D967BF,
    $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94,
    $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);

  clrLightGrayFrame = TColor($0078695b); // RGB(171, 173, 179) // this color is for light mode frames (TPanelEx... and other controls ?)
  
  // custom colors for the night mode
  clrDarkBlue    = TColor($00590000); // RGB(0, 0, 89) -> blue
  clrDarkGreen   = TColor($00005900); // RGB(0, 89, 0) -> green
  clrDarkRed     = TColor($00000059); // RGB(89, 0, 0) -> red /// $0000004b (75, 0, 0) darker red
  clrDarkSilver  = TColor($004c4c4c); // desaturated green RGB(76, 76, 76) /// $00595959 (89, 89, 89) darker silver
  clrDarkOrange  = TColor($00005a82); // RGB(130, 90, 0)
  clrDarkGray    = TColor($00323232); // RGB(50, 50 ,50) -> for unchecked checkboxes (also used in TShadowLabel)
  clrDarkGray2   = TColor($00373737); // RGB(55, 55 ,55) -> for GaugeBar / GaugeBar2 "pressed" background state

  clrMedSilver   = TColor($00e6e6e6); // RGB(230, 230, 230) -> for system title bar

  clrBlackBk     = TColor($00000001); // RGB(0, 0, 1) -> this is needed to create gradient in TPanelEx
  clrLightBlack  = TColor($000f0f0f); // RGB(15, 15, 15) -> used in system title background - "Console/Computer Emulator Settings" screen and others

  clrLightBlue   = TColor($00ff9933); // RGB(51, 153, 255)
  clrMedBlue     = TColor($00c83232); // RGB(50, 50, 200)

  clrLightRed    = TColor($005050fa); // RGB(250, 80, 80)
  clrMedRed      = TColor($003232c8); // RGB(200, 50, 50)

  clrLightGreen  = TColor($0099ff33); // RGB(51, 255, 153)
  clrMedGreen    = TColor($0032c832); // RGB(50, 200, 50)

  clrMedDarkGray = TColor($00505050); // RGB(80, 80, 80)

  clrOrange      = TColor($002670ac); // RGB(172, 112, 38)
  clrOrangeVivid = TColor($000053e6); // RGB(230, 83, 0)

  clrGamesListHeaderFontColor  = TColor($00b49d87); // RGB(135,157,180) default EasyListView header font color for night mode

  // colors for dark gray backgrounds (filter screens, emulator setup screens, etc) - mostly used in groupbox frames
  clrBorderGroupBoxGrayBk      = TColor($00585048); // RGB(78, 80, 88)
  clrInnerBorderGroupBoxGrayBk = TColor($0035302b); // RGB(43, 42, 53)

  // colors for EasyListView dark orange selection bars, night mode
  clrOrangeBarTop    = TColor($003ea2ff); // RGB(255, 162, 62) - gradient top color
  clrOrangeBarBottom = TColor($00245eb4); // RGB(180, 94, 36)  - gradient bottom color
  clrOrangeBarBorder = TColor($0000b6ff); // RGB(255, 182, 0)  - frame color

  // colors for the game top bar gradient
  clrGameBarBlue   = TColor($00824600); // RGB(  0, 70, 130)
  clrGameBarGreen  = TColor($00468200); // RGB(  0, 130, 70)
  clrGameBarRed    = TColor($00464682); // RGB(130,  70, 70)
  clrGameBarYellow = TColor($00008282); // RGB(130, 130, 0)
  clrGameBarGray   = TColor($00646464); // RGB(100, 100, 100)

  // disabled button colors, night mode
  clrButtonDisabledTop    = TColor($00303030); // RGB(48, 48, 48) - also used by disabled font "shadow color"
  clrButtonDisabledBottom = TColor($001e1e1e); // RGB(30, 30, 30)
  
  // position 0 -> light mode; position 1 -> night mode
  menu_background_color: array[0..1] of Integer = ($00fafafa, $00272727);

  hint_line_color: array[0..1] of Integer = ($00c5c5c5, clrBorderGroupBoxGrayBk);
  hint_text_color: array[0..1] of Integer = ($00993300, $00af912b);

  item_caption_active_color:        array[0..1] of Integer = (clBlack, $00bfdfe0);
  item_caption_active_shadow_color: array[0..1] of Integer = (clGray, $00404b4c);
  item_caption_disabled_color:      array[0..1] of Integer = ($00c5c5c5, clGray);

  item_shortcut_color:          array[0..1] of Integer = ($006e1500, clrLightBlue);
  item_shortcut_selected_color: array[0..1] of Integer = ($006e1500, clrDarkBlue);

  item_caption_selected_color:  array[0..1] of Integer = ($006e1500, $006e1500);

  help_text_color:          array[0..1] of Integer = (clMedGray, clGray);
  help_text_selected_color: array[0..1] of Integer = (clGray, clrDarkSilver);

  checked_framecolor:      array[0..1] of Integer = ($00399bf7, $00399bf7);
  checked_innerframecolor: array[0..1] of Integer = ($00f1f1f1, $005d5d5d);

  selection_frame_color: array[0..1] of Integer = ($0000b7ff, $000078f0); // RGB(240, 125, 0)   - night mode
  selection_singlecolor: array[0..1] of Integer = ($0000b7ff, $000078f0); // RGB(240, 125, 0)   - night mode
  selection_uppergradient_colorstart: array[0..1] of Integer = ($00daecfd, $00a4c1ec);  // RGB(236, 193, 164) - night mode
  selection_uppergradient_colorend:   array[0..1] of Integer = ($00bde0fd, $0087b3ec);  // RGB(236, 179, 135) - night mode
  selection_lowergradient_colorstart: array[0..1] of Integer = ($0069ceff, $002f93f0);  // RGB(240, 147, 47)  - night mode
  selection_lowergradient_colorend:   array[0..1] of Integer = ($009af6ff, $0053c8f0);  // RGB(240, 200, 83)  - night mode
  selection_gradient_outerframecolor: array[0..1] of Integer = ($00f4f9fe, $00d2deee);  // RGB(238, 232, 210) - night mode
  selection_frame_round_ish_pixels:   array[0..1] of Integer = ($0000dcff, $0000a7f0);  // RGB(240, 167, 0)   - night mode

  selection_checked_framecolor:       array[0..1] of Integer = ($006e1500, $00404b4c);// ($00399bf7, $00399bf7);

type
  TMsgBoxColors = record
    colorKeyTitle,
    colorKeyValue,
    colorFileName,
    colorMachineName,
    colorMachineMultiSlot,
    colorCmdLine,
    colorBoldTitle,
    colorWarning,
    colorExitCode: TColor;
  end;
  
  TWideFileName = type WideString;
  TSearchRecW = record
    Time: Integer;
    Size: Int64;
    Attr: Integer;
    Name: TWideFileName;
    DOSName: String;
    ExcludeAttr: Integer;
    FindHandle: THandle;
    FindData: TWin32FindDataW;
  end;

  TWideFileStream = class(THandleStream)
  public
    constructor Create(const FileName: WideString; Mode: Word);
    destructor  Destroy; override;
  end;

  TWideMemoryStream = class(TMemoryStream)
  public
    procedure LoadFromFile(const FileName: WideString);
    procedure SaveToFile(const FileName: WideString);
  end;

  TWideResourceStream = class(TCustomMemoryStream)
  private
    HResInfo: HRSRC;
    HGlobal: THandle;
    procedure Initialize(Instance: THandle; Name, ResType: PWideChar);
  public
    constructor Create(Instance: THandle; const ResName: WideString; ResType: PWideChar);
    constructor CreateFromID(Instance: THandle; ResID: Word; ResType: PWideChar);
    destructor  Destroy; override;
    function  Write(const Buffer; Count: LongInt): LongInt; override;
    procedure SaveToFile(const FileName: WideString);
  end;

  PRGB = ^TRGB;
  TRGB = record Red, Green, Blue: Byte; //B, G, R: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBARRAY = array[0..0] of TRGB;

  TRIVERTEX = packed record
    X, Y: DWORD;
    Red, Green, Blue, Alpha: Word;
  end;

var
  IsNightMode, Is4KMode:  Boolean;//, ShowDarkPopupMenu: Boolean;
  MsgTxtColors: TMsgBoxColors;
  FrontendPath, FrontendVersion: String;

function GradientFill(DC: hDC; pVertex: Pointer; dwNumVertex: DWORD;
                      pMesh: Pointer; dwNumMesh, dwMode: DWORD): DWord; stdcall;
                      external 'msimg32.dll';

function  WideLibraryErrorMessage(const LibName: WideString; Dll: THandle; ErrorCode: Integer): WideString;
function  WideSysErrorMessage(ErrorCode: Integer): WideString;

function  WideFileCreate(const FileName: WideString): Integer;
function  WideExpandFileName(const FileName: WideString): WideString;
function  WideFileOpen(const FileName: WideString; Mode: LongWord): Integer;

function  StrCmpLogicalW(psz1, psz2: PWideChar): Integer; stdcall; external 'shlwapi.dll';

procedure WinGradient(ACanvas: TCanvas; ARect: TRect; FColor1, FColor2: TColor);

function  GetFileVersion(const sFile: String; MinorVersionOnly: Boolean = False): String;
function  GetFileInfo2(FName, InfoType: String): String;
function  GetFileSize(const AFileName: String): Int64;

{$IFDEF WIN32}
function  ShortToLongFileName(const ShortName: String): String;
function  ShortToLongPath(const ShortName: String): String;
function  LongToShortFileName(const LongName: String): String;
//function  LongToShortPath(const LongName: String): String; // this function doesn't work, use ExtractShortPathName() instead (October 10, 2016)
{$ENDIF WIN32}

function  ExtractShortPathName(const FileName: String): String; // function from Delphi XE 10 Seattle source code

function  Pos(const substr, str: WideString): Integer; overload;
function  PosEx(const SubStr, S: String; Offset: Integer = 1): Integer;

function  LowerCase(const S: String): String; overload;
function  UpperCase(const S: String): String; overload;
procedure Move(const Source; var Dest; count: Integer); overload;

procedure CallShellExecute(Sender: TObject; const FileToOpen: WideString = ''; Visibility: Word = SW_SHOWNORMAL);

// light / dark theme functions
procedure SetLabelColors(LabelSource: TShadowLabel; iColor: TColor; iShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
procedure SetLabelBkFrameColors(LabelSource: TShadowLabel; iBackgroundColor: TColor; iFrameColor: TColor; iFrameInnerColor: TColor = -1);
procedure SetTabButtonLineColors(BevelExSource: TBevelEx);
procedure AdjustComboBoxStyle(iComboBox: TComboBox2Ex; ForceOwnerDraw: Boolean = False);
procedure SetColorBoxColors(ColorBoxExSource: TColorBoxEx; UpdateColors: Boolean; ForceNightColors: Boolean = False);
procedure SetComboBox2ExColors(ComboBox2ExSource: TComboBox2Ex; UpdateColors: Boolean; EditColors: TEditEx = nil; ForceNightColors: Boolean = False);
procedure SetGaugeBarColors(GaugeBarSource: TGaugeBar; ForceNightColors: Boolean = False); overload;
procedure SetGaugeBarColors(GaugeBar2Source: TGaugeBar2; ForceNightColors: Boolean = False); overload;
procedure SetXiTrackBarColors(TrackBarSource: TXiTrackBar);
procedure SetCheckBoxColors(CheckBoxSource: TAdvOfficeCheckBoxEx; iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
procedure SetRadioButtonColors(RadioButtonSource: TAdvOfficeRadioButtonEx; iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
procedure SetGroupBoxBorderStyle(GroupBoxSource: TAdvGroupBoxEx);
procedure SetGroupBoxColors(GroupBoxSource: TAdvGroupBoxEx; iBorderColor, iBorderInnerColor, iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
procedure SetGroupBoxFontColors(GroupBoxSource: TAdvGroupBoxEx; iFontColor: TColor; iShadowFontColor: TColor = -1; iShadowEnabled: Boolean = False);
procedure SetPanelColors(PanelSource: TPanelEx; iColor1: TColor = -1; iColor2: TColor = -1; IsSolidDrawStyle: Boolean = False);
procedure SetBottomPanelColors(PanelSource: TPanelEx);
procedure SetPanelBorderColors(PanelSource: TPanelEx; iBorderColor: TColor = -1; iBorderInnerColor: TColor = -1);

procedure SetPanelNightColors(PanelSource: TPanelEx; iColor1: TColor = -1; iColor2: TColor = -1; iBorderColor: TColor = -1; iBorderInnerColor: TColor = -1; ForceNightColors: Boolean = False);
procedure SetEditNightColors(EditSource: TEditEx); overload;
procedure SetEditNightColors(EditSource: TTntEditEx); overload;
procedure SetEditColors(EditSource: TEditEx; BackgroundColor: TColor; FontColor: TColor; FrameColor: TColor; FrameFocusedColor: TColor; FrameDisabledColor: TColor = -1; EnableCustomBorder: Boolean = True);

procedure PopulateMsgColors;
procedure SetLightColorsGameTopBar(GameSetStatus: Integer; PanelSource: TPanelEx; IsBottomColorSilver: Boolean = True);
procedure SetColorsGameTopBar(GameSetStatus: Integer; PanelSource: TPanelEx; IsBottomColorSilver: Boolean = True);
procedure SetColorEmulatorTopBar(PanelExSource: TPanelEx; EmulatorID: Integer; IsBottomColorSilver: Boolean = False);
procedure SetFormColors(FormSource: TForm; PanelTopSource, PanelBottomSource: TPanelEx; LabelGameTitle, LabelGameName, LabelGameStatus: TShadowLabel; GameStatus: Integer; IsBottomColorSilver: Boolean = False);
procedure SetSystemTitleBarNightColors(sysBarSource, sysBottomBarSource: TPanelEx; IsBlackBackground: Boolean = True);
procedure SetSystemTitleBottomBarNightColors(sysBottomBarSource: TPanelEx);

function  GenerateZipErrorsMessage(const TitleMessage: String; ZipFilesList: TStrings): Integer;
function  GenerateMessage(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                          IconIndex: Integer = 0; GameSetStatus: Integer = -1): Integer;
procedure CallMessageBox;
procedure FreeMessageBox;

function  GenerateMessage4K(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                            IconIndex: Integer = 0; GameSetStatus: Integer = -1): Integer;
procedure CallMessageBox4K;
procedure FreeMessageBox4K;


function  GetSystemFileName(SystemID: Byte; FileID: Byte = 0; const SoftwareList: String = ''): String;
//function  GetSystemROMFileName(SystemID: Byte; const SoftwareList: String = ''): String;
procedure GenerateControllerDefinitionsFilesList(Folder: String; ListHolder: THashedStringList; ClearList: Boolean = False);
procedure GetFilesList(Folder, FileType, FileMask: String; ListHolder: THashedStringList; SubDirectories, ClearList, ReturnFullPath: Boolean);
procedure GetFoldersList(Folder: String; ListHolder: THashedStringList; ClearList, SubDirectories: Boolean);
procedure GetFoldersList2(Folder: String; ListHolder: THashedStringList; ClearList: Boolean; ReturnFullPath: Boolean = True);

function  GetPlayTime(Milliseconds: Int64; ShowHoursDays: Boolean = False; HideSeconds: Boolean = False): String;
function  ExtractMAMEIniValue(const MAMEOption: String): String;
function  RemoveQuotes(const ValueStr: String): String;

function  DarkenColor(Color: TColor; Perc: Integer): TColor;
function  BrightenColor(Color: TColor; Factor: Integer): TColor;
function  Blend(Color1, Color2: TColor; A: Byte): TColor;
function  GetContrastColor(ABGColor: TColor): TColor;

function  GetGameHistory(const GameName, StringLine: String; TagLength: Integer): Boolean;

// SHA-1 / MD5 routines
function  ComputeHashValueMemoryStream(Mode: Integer; const mStreamHolder: TMemoryStream): String;
function  ComputeHashValue(Mode: Integer; const FileName: WideString): String;
function  GetSHA1_ValueMemoryStream(const mStream: TMemoryStream): String;
function  GetSHA1_Value(const strFileName: WideString): String;
function  GetMD5_Value(const strFileName: WideString): String;

function  CheckAndCreateFolder(const FolderString: String): Boolean;
function  CompareIntValue(const A, B: Int64): ShortInt;
function  CompareFloatValue(const A, B: Extended): ShortInt;
function  CompareTDateTime(const A, B: TDateTime): Integer;

procedure SetSelectedColorBox(ColorBoxHolder: TColorBoxEx; Color: TColor; SetSelectedColor: Boolean = True);
procedure SetSelectedComboBox(sIndex: ShortInt; ComboBoxHolder: TComboBox2Ex);
procedure SetSelectedGaugeBar(iPosition: Integer; GaugeBarSource: TGaugeBar);  overload;
procedure SetSelectedGaugeBar(iPosition: Integer; GaugeBarSource: TGaugeBar2); overload;

function  XML_CheckData(const strLine, FieldEntry: String): Boolean;
function  XML_GetEntryName(const strLine: String): String;
function  XML_GetEntryValue(const strLine, EntryName: String): String;

// for old MAME builds 0.56 to 0.69
function  ListInfo_GetEntryValue(strLine, EntryName, TagCharacter: String): String;

function  SoftListGetEntryValue(strLine, EntryName: String): String; // for software lists (vectrex, neocd, etc...) console/handheld/computer with Unicode strings

procedure ListScreenModes(ListHolder: TStrings; ResolutionOnly: Boolean = False);

function  GetImageCategoryTitle(CategoryIndex: Byte): String;
function  GetScrLayoutSection(LayoutIndex: Byte): String;
function  GetScrLayoutImageFile(LayoutIndex: Byte; ImageExtension: Boolean = True): String;
function  GetScrLayoutDefaultType(LayoutIndex, ImageIndex: Byte): ShortInt;
function  GetScrLayoutAltVerticalDefault(LayoutIndex: Byte): ShortInt;

//function  Is64BitOS: Boolean;
//function  GetWindowsVersion: String;
function  IsWin10: Boolean;

function  CheckReadOnly(const FileString: WideString): Boolean;

function  FileExists(const FileName: String): Boolean;
function  FileExists2(const FileName: WideString): Boolean; // Unicode version for Windows 10 ?? (May 25, 2020)

//function  CopyFile(const OldName, NewName: WideString; OverwriteExistingFile: Boolean = True): Boolean;
function  RenameFile(const OldName, NewName: String; OverwriteExistingFile: Boolean = True): Boolean;
function  MoveFile(const OldName, NewName: String; OverwriteExisting: Boolean): Boolean;

procedure SetDefaultColorBox(const ColorHolder: TColorBoxEx);

function  SelectDirectoryShell(const Caption: String; RecursiveSubFolders: Boolean; out Directory: String; out AddSubFolders: Boolean; RootFolder: WideString = ''): Boolean;

procedure CallMaximizeWindow(FormSource: TForm);
procedure CallCenterWindow(FormSource: TForm; IgnoreWindowsTaskBar: Boolean = False);

procedure SetEditBkColor(EditHolder: TEditEx); overload;
procedure SetEditBkColor(EditHolder: TTntEditEx); overload;
function  IsEditEditing(EditHolder: TEditEx): Boolean; overload;
function  IsEditEditing(EditHolder: TTntEditEx): Boolean; overload;

function  ShortDirString(const FileFullPath: String; MaxLength: Integer): String;

function  LengthW(const ws: WideString): Integer;
function  ShortDirStringW(const FileFullPath: WideString; MaxLength: Integer): WideString;

function  OpenSaveFileDialog(Parent: TWinControl; const DefExt, Filter, InitialDir, Title: String; var FileName: String;
                             MustExist, OverwritePrompt, NoChangeDir, DoOpen: Boolean): Boolean;

function  PrivateExtractIcons (lpszFile: PChar;     nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; pIconId: PDWORD; nIcon, flags: DWORD): DWORD; stdcall ; external 'user32.dll' name 'PrivateExtractIconsA';
function  PrivateExtractIconsW(lpszFile: PWideChar; nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; pIconId: PDWORD; nIcon, flags: DWORD): DWORD; stdcall ; external 'user32.dll' name 'PrivateExtractIconsW';

procedure GetIconToImage(IconSource: HIcon; IconImageSource: TImage; iWidth, iHeight: Integer);
function  ExtractIcon(const iFileName: String; var iHandleIcon: THandle; var iIconId: DWORD; IconWidth, IconHeight: Integer): Boolean;
function  GetAppIcon(const appEmuFile: String; ImageListHolder: TImageList; AlternateIconSize: Integer; ReplaceIndex: Integer = -1; IconImage: TImage = nil): Integer;
function  GetExtIcon(const FileExtension: String; ImageListHolder: TImageList): Integer;
function  GetAssociatedApp(fileExtension: String; ReturnExeFileOnly: Boolean = False): String;

function  GetFileTypeStr(const strFilename: String): String;

function  GetWinTempDir:  String;
function  GetWindowsDir:  String;
function  GetSystemDir:   String;
function  GetMyDocuments: String;

procedure PopulateScreenResolution(DestList: TComboBox2Ex; AddAutoText: Boolean = False);
function  CompareStringListNatural(sList: TStringList; Index1, Index2: Integer): Integer;
function  NaturalCompareText(const Text1, Text2: WideString): Integer;

// WideString functions
function  GetFileInfoW(FName, InfoType: WideString): String;
function  LastDelimiterW(const Delimiters, S: WideString): Integer;
function  ChangeFileExtW(const FileName, Extension: WideString): WideString;
function  ExtractFileExtW(const FileName: WideString): WideString;
function  ExtractFileNameW(const FileName: WideString): WideString;
function  ExtractFilePathW(const FileName: WideString): WideString;

// unicode function to search files correctly TSearchRecUnicode
function  FindMatchingFileW(var F: TSearchRecW): Integer;
function  FindFirstW(const Path: WideString; Attr: Integer; var  F: TSearchRecW): Integer;
function  FindNextW(var F: TSearchRecW): Integer;
procedure FindCloseW(var F: TSearchRecW);

function  GetFileSizeW(const aFileName: WideString): Int64;
function  FileAgeW(const FileName: WideString): Integer;
procedure DeleteAllFilesW(const FolderName: WideString; RecursiveFolders: Boolean = False);
function  RenameFileW(const OldName, NewName: WideString; OverwriteExistingFile: Boolean = True): Boolean;
function  MoveFileW(const OldName, NewName: WideString; OverwriteExisting: Boolean): Boolean;
function  GetShortFileNameW(const FileName: WideString): String;

procedure ShowMessageW(const MessageStr: WideString; TitleStr: String = '');

function  WideLastChar(const S: WideString): PWideChar;
function  LastCharW(const S: WideString): WideChar;
//function  Tnt_GetStringTypeExW(Locale: LCID; dwInfoType: DWORD;
//                               lpSrcStr: PWideChar; cchSrc: Integer; var lpCharType): BOOL;

function  IsWideCharUpper(WC: WideChar): Boolean;
function  IsWideCharLower(WC: WideChar): Boolean;
function  IsWideCharDigit(WC: WideChar): Boolean;
function  IsWideCharSpace(WC: WideChar): Boolean;
function  IsWideCharPunct(WC: WideChar): Boolean;
function  IsWideCharCntrl(WC: WideChar): Boolean;
function  IsWideCharBlank(WC: WideChar): Boolean;
function  IsWideCharXDigit(WC: WideChar): Boolean;
function  IsWideCharAlpha(WC: WideChar): Boolean;
function  IsWideCharAlphaNumeric(WC: WideChar): Boolean;
function  StringReplaceW(const S, OldPattern, NewPattern: WideString;
                         Flags: TReplaceFlags; WholeWord: Boolean = False): WideString;

function  GetCharLastPosition(const iStr: WideString; iChar: WideChar): Integer; overload;
function  GetCharLastPosition(const iStr: String    ; iChar: Char    ): Integer; overload;

procedure GetGamesFilesListW(Folder: String; const FileType: String; ListHolder: THashedStringList; SubDirectories: Boolean; MediaTypeID: Integer);

function  CheckAppOneInstance: Boolean;

procedure ShowDropdownMenu(ButtonExSource: TBitBtnEx; PopupMenuSource: TPopupMenu); overload;
procedure ShowDropdownMenu(ButtonExSource: TSpeedButtonEx; PopupMenuSource: TPopupMenu); overload;

procedure CalcCRC32(p: Pointer; ByteCount: DWORD; var CRCValue: DWORD);
function  CalcStringCRC32(s: String; out CRC32: DWORD): Boolean;
function  CalcFileCRC32(FromName: WideString): String;

function  Validate4KResolution: Boolean;
function  Read4KSetting: Boolean;

procedure CreateSplashIniFile;
procedure CreateGamesFiltersIniFile;

implementation

function GetCheckBoxThemeFolder: String;
begin
  Result:= FrontendPath+'resources\checkbox_radiobutton\';
end;

procedure SetLabelColors(LabelSource: TShadowLabel; iColor: TColor; iShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
begin
  if LabelSource.Font.Color <> iColor then
     LabelSource.Font.Color:=  iColor;
  if iShadowColor <> -1 then
     LabelSource.ShadowColor:= iShadowColor;
  if LabelSource.ShadowEnabled <> iShadowEnabled  then
     LabelSource.ShadowEnabled:=  iShadowEnabled;
  if LabelSource.UseCustomDisabledFontColor <> IsNightMode then
     LabelSource.UseCustomDisabledFontColor:=  IsNightMode;
end;

procedure SetLabelBkFrameColors(LabelSource: TShadowLabel; iBackgroundColor: TColor; iFrameColor: TColor; iFrameInnerColor: TColor = -1);
begin
  LabelSource.Color:= iBackgroundColor;
  LabelSource.ColorFrame:= iFrameColor;
  if iFrameInnerColor <> -1 then
     LabelSource.ColorInnerFrame:= iFrameInnerColor;
end;

procedure SetTabButtonLineColors(BevelExSource: TBevelEx);
begin
  if IsNightMode then
     begin
       BevelExSource.CustomColor1:= clrLightGrayFrame;
       BevelExSource.CustomColor2:= clrDarkGray;
       BevelExSource.Style:= bsCustomColors;
     end
  else
     BevelExSource.Style:= bsLowered;
end;

procedure SetColorBoxColors(ColorBoxExSource: TColorBoxEx; UpdateColors: Boolean; ForceNightColors: Boolean = False);
begin
  if UpdateColors then
  begin
    ColorBoxExSource.SelectionBarCustomColor_Top:=    clrOrangeBarTop;
    ColorBoxExSource.SelectionBarCustomColor_Bottom:= clrOrangeBarBottom;
    ColorBoxExSource.SelectionShowFrameColor:=        clrOrangeBarBorder;
    ColorBoxExSource.SelectionShowFrame:= True;

    ColorBoxExSource.SelectionFontCustomColor:= clrBlackBk;
    ColorBoxExSource.CustomColorBk:=   clrDarkGray;
    ColorBoxExSource.CustomColorFont:= clCream;

    ColorBoxExSource.FrameColor:=         clGray;
    ColorBoxExSource.FrameColorFocused:=  clSilver;
    ColorBoxExSource.FrameColorDisabled:= clrMedDarkGray;
  end;

  if ForceNightColors then
     ColorBoxExSource.CustomColorsEnabled:= True
  else
  if ColorBoxExSource.CustomColorsEnabled <> IsNightMode then
     ColorBoxExSource.CustomColorsEnabled:=  IsNightMode;
end;

procedure SetComboBox2ExColors(ComboBox2ExSource: TComboBox2Ex; UpdateColors: Boolean; EditColors: TEditEx = nil; ForceNightColors: Boolean = False);
begin
  if UpdateColors then
  begin
    ComboBox2ExSource.SelectionBarCustomColor_Top:=    clrOrangeBarTop;
    ComboBox2ExSource.SelectionBarCustomColor_Bottom:= clrOrangeBarBottom;
    ComboBox2ExSource.SelectionShowFrameColor:=        clrOrangeBarBorder;
    ComboBox2ExSource.SelectionShowFrame:= True;

    //ComboBox2ExSource.ButtonColorHover:= clrMedDarkGray;

    ComboBox2ExSource.SelectionFontCustomColor:= clrBlackBk;
    if EditColors = nil then
    begin
      ComboBox2ExSource.CustomColorBk:=   clrDarkGray;
      ComboBox2ExSource.CustomColorFont:= clCream;

      ComboBox2ExSource.FrameColor:=         clGray;
      ComboBox2ExSource.FrameColorFocused:=  clSilver;
      ComboBox2ExSource.FrameColorDisabled:= clrMedDarkGray;
    end
    else
    begin
      ComboBox2ExSource.CustomColorBk:=   EditColors.Color;
      ComboBox2ExSource.CustomColorFont:= EditColors.Font.Color;

      ComboBox2ExSource.FrameColor:= EditColors.ColorFrame;
      ComboBox2ExSource.FrameColorFocused:=  EditColors.ColorFrameFocused;
      ComboBox2ExSource.FrameColorDisabled:= EditColors.ColorFrameDisabled;
    end;
  end;
  if ForceNightColors then
     ComboBox2ExSource.CustomColorsEnabled:= True
  else
  if ComboBox2ExSource.CustomColorsEnabled <> IsNightMode then
     ComboBox2ExSource.CustomColorsEnabled:=  IsNightMode;

  if ComboBox2ExSource.Style = csOwnerDrawFixed then // if ComboBox2ExSource.CustomColorsEnabled then
     begin // 4K mode in "light mode" also uses this
       if ComboBox2ExSource.ItemHeight > 25 then
          begin
            if ComboBox2ExSource.ItemHeight <> 30 then
               ComboBox2ExSource.ItemHeight:=  30;
          end
       else
       if ComboBox2ExSource.ItemHeight <> 16 then
          ComboBox2ExSource.ItemHeight:=  16; // fix for the control height... should always be one more pixel in "OwnerDraw" mode
     end;
end;

procedure AdjustComboBoxStyle(iComboBox: TComboBox2Ex; ForceOwnerDraw: Boolean = False);
var
  iStyle: TComboBoxStyle;
begin
  if Is4KMode or IsNightMode or ForceOwnerDraw then
     iStyle:= csOwnerDrawFixed
  else
     iStyle:= csDropDownList;

  if iComboBox.Style <> iStyle then
     iComboBox.Style:=  iStyle;
end;

procedure SetGaugeBarColors(GaugeBarSource: TGaugeBar; ForceNightColors: Boolean = False);
var
  iSize: Integer;
begin
  if IsNightMode or ForceNightColors then
     begin
       if GaugeBarSource.Style <> rbsMac then
          GaugeBarSource.Style:=  rbsMac;

       GaugeBarSource.Backgnd:=     bgSolid;
       GaugeBarSource.BorderStyle:= bsNone;
       GaugeBarSource.BorderColor:= clGray;
       GaugeBarSource.ArrowColor:=  clCream;
       GaugeBarSource.ButtonColor:= clrDarkSilver;
       if Is4KMode and (GaugeBarSource.Height > 30) then
          iSize:= 30
       else
          iSize:= 17;
       GaugeBarSource.Color:=          clrDarkGray;
       GaugeBarSource.HandleColor:=    clGray;
       GaugeBarSource.HighLightColor:= clrDarkGray;
       GaugeBarSource.ShadowColor:=    clrBlackBk;
       GaugeBarSource.BkColorPushed:=  clrDarkGray2;
       GaugeBarSource.ShowHandleGrip:= True;
     end
  else
     begin
       if GaugeBarSource.Style <> rbsDefault then
          GaugeBarSource.Style:=  rbsDefault;
       GaugeBarSource.Backgnd:=   bgPattern;
       if Is4KMode then
          iSize:= 30
       else
          iSize:= 12;
     end;
  if GaugeBarSource.ButtonSize <> iSize then
     GaugeBarSource.ButtonSize:=  iSize;
end;

procedure SetGaugeBarColors(GaugeBar2Source: TGaugeBar2; ForceNightColors: Boolean = False);
var
  iSize: Integer;
begin
  if IsNightMode or ForceNightColors then
     begin
       if GaugeBar2Source.Style <> rbsMac then
          GaugeBar2Source.Style:=  rbsMac;

       GaugeBar2Source.Backgnd:=     bgSolid;
       GaugeBar2Source.BorderStyle:= bsNone;
       GaugeBar2Source.BorderColor:= clGray;
       GaugeBar2Source.ArrowColor:=  clCream;
       GaugeBar2Source.ButtonColor:= clrDarkSilver;
       if Is4KMode then
          iSize:= 30
       else
          iSize:= 17;
       GaugeBar2Source.Color:=          clrDarkGray;
       GaugeBar2Source.HandleColor:=    clGray;
       GaugeBar2Source.HighLightColor:= clrDarkGray;
       GaugeBar2Source.ShadowColor:=    clrBlackBk;
       GaugeBar2Source.BkColorPushed:=  clrDarkGray2;
       GaugeBar2Source.ShowHandleGrip:= True;
     end
  else
     begin
       if GaugeBar2Source.Style <> rbsDefault then
          GaugeBar2Source.Style:= rbsDefault;
       GaugeBar2Source.Backgnd:= bgPattern;
       if Is4KMode then
          iSize:= 30
       else
          iSize:= 12;
     end;
  if GaugeBar2Source.ButtonSize <> iSize then
     GaugeBar2Source.ButtonSize:=  iSize;
end;

procedure SetXiTrackBarColors(TrackBarSource: TXiTrackBar);
begin
  if IsNightMode then
     begin
       if TrackBarSource.ColorScheme <> csDark then
          TrackBarSource.ColorScheme:=  csDark;
     end
  else
     begin
       if TrackBarSource.ColorScheme <> csWhite then
          TrackBarSource.ColorScheme:=  csWhite;
     end;
end;

procedure SetCheckBoxColors(CheckBoxSource: TAdvOfficeCheckBoxEx; iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
begin
  CheckBoxSource.Font.Color:= iColor;
  if CheckBoxSource.ShadowColor <> -1 then
     CheckBoxSource.ShadowColor:=  iShadowColor;
  if CheckBoxSource.ShadowEnabled <> iShadowEnabled then
     CheckBoxSource.ShadowEnabled:=  iShadowEnabled;
  if iDisabledColor <> -1 then
     CheckBoxSource.DisabledFontColor:= iDisabledColor;
  if iDisabledShadowColor <> -1 then
     CheckBoxSource.DisabledFontShadowColor:= iDisabledShadowColor;
end;

procedure SetRadioButtonColors(RadioButtonSource: TAdvOfficeRadioButtonEx; iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
begin
  RadioButtonSource.Font.Color:= iColor;
  if RadioButtonSource.ShadowColor <> -1 then
     RadioButtonSource.ShadowColor:=  iShadowColor;
  if RadioButtonSource.ShadowEnabled <> iShadowEnabled then
     RadioButtonSource.ShadowEnabled:=  iShadowEnabled;
  if iDisabledColor <> -1 then
     RadioButtonSource.DisabledFontColor:= iDisabledColor;
  if iDisabledShadowColor <> -1 then
     RadioButtonSource.DisabledFontShadowColor:= iDisabledShadowColor;
end;

procedure SetGroupBoxBorderStyle(GroupBoxSource: TAdvGroupBoxEx);
begin
  if GroupBoxSource.BorderStyle = bsAdvNone then
     Exit;
  GroupBoxSource.RoundEdges:= not IsNightMode;
  if IsNightMode then
     GroupBoxSource.BorderStyle:= bsAdvDualColors
  else
     GroupBoxSource.BorderStyle:= bsAdvSingle;
end;

procedure SetGroupBoxColors(GroupBoxSource: TAdvGroupBoxEx; iBorderColor, iBorderInnerColor, iColor: TColor; iShadowColor: TColor = -1; iDisabledColor: TColor = -1; iDisabledShadowColor: TColor = -1; iShadowEnabled: Boolean = False);
begin
  GroupBoxSource.BorderColor:= iBorderColor;
  GroupBoxSource.BorderInnerColor:= iBorderInnerColor;
  GroupBoxSource.Font.Color:= iColor;
  if GroupBoxSource.ShadowColor <> -1 then
     GroupBoxSource.ShadowColor:=  iShadowColor;
  if GroupBoxSource.ShadowEnabled <> iShadowEnabled then
     GroupBoxSource.ShadowEnabled:=  iShadowEnabled;

  if iDisabledColor <> -1 then
     GroupBoxSource.DisabledFontColor:= iDisabledColor;
  if iDisabledShadowColor <> -1 then
     GroupBoxSource.DisabledFontShadowColor:= iDisabledShadowColor;
end;

procedure SetGroupBoxFontColors(GroupBoxSource: TAdvGroupBoxEx; iFontColor: TColor; iShadowFontColor: TColor = -1; iShadowEnabled: Boolean = False);
begin
  GroupBoxSource.Font.Color:= iFontColor;
  if iShadowFontColor <> -1 then
     GroupBoxSource.ShadowColor:= iShadowFontColor;
  if GroupBoxSource.ShadowEnabled <> iShadowEnabled then
     GroupBoxSource.ShadowEnabled:=  iShadowEnabled;
end;

procedure SetBottomPanelColors(PanelSource: TPanelEx);
begin
  if IsNightMode then
     SetPanelColors(PanelSource, menu_background_color[1], clrDarkGray);
end;

procedure SetPanelColors(PanelSource: TPanelEx; iColor1: TColor = -1; iColor2: TColor = -1; IsSolidDrawStyle: Boolean = False);
var
  iDrawStyle: TvgStyle;
begin
  if iColor1 <> -1 then
     begin
       if PanelSource.Color1 <> iColor1 then
          PanelSource.Color1:=  iColor1;
     end;
  if iColor2 <> -1 then
     begin
       if PanelSource.Color2 <> iColor2 then
          PanelSource.Color2:=  iColor2;
     end;
  if IsSolidDrawStyle then
     iDrawStyle:= vgSolid
  else
     iDrawStyle:= vgSimple;

  if PanelSource.Style <> iDrawStyle then
     PanelSource.Style:=  iDrawStyle;
end;

procedure SetPanelBorderColors(PanelSource: TPanelEx; iBorderColor: TColor = -1; iBorderInnerColor: TColor = -1);
begin
  if iBorderColor <> -1 then
     begin
       if PanelSource.ColorFrame <> iBorderColor then
          PanelSource.ColorFrame:=  iBorderColor;
     end;
  if iBorderInnerColor <> -1 then
     begin
       if PanelSource.ColorInnerFrame <> iBorderInnerColor then
          PanelSource.ColorInnerFrame:=  iBorderInnerColor;
     end;
end;

procedure SetPanelNightColors(PanelSource: TPanelEx; iColor1: TColor = -1; iColor2: TColor = -1; iBorderColor: TColor = -1; iBorderInnerColor: TColor = -1; ForceNightColors: Boolean = False);
var
  ColorToApply: TColor;
begin
  ColorToApply:= clNone; // set to none to avoid appling an undefined color
  if iBorderColor <> -1 then
     ColorToApply:= iBorderColor
  else
     begin
       if IsNightMode or ForceNightColors then
          ColorToApply:= clrLightBlue
       else
          ColorToApply:= clSilver;
     end;

  if ColorToApply <> clNone then
     begin
       if PanelSource.ColorFrame <> ColorToApply then
          PanelSource.ColorFrame:=  ColorToApply;
     end;

  ColorToApply:= clNone;
  if iBorderInnerColor <> -1 then
     ColorToApply:= iBorderInnerColor
  else
     begin
       if IsNightMode or ForceNightColors then
          ColorToApply:= clBlue
       else
          ColorToApply:= clrLightGrayFrame;
     end;

  if ColorToApply <> clNone then
     begin
       if PanelSource.ColorInnerFrame <> ColorToApply then
          PanelSource.ColorInnerFrame:=  ColorToApply;
     end;

  ColorToApply:= clNone;
  if PanelSource.Style = vgSolid then
     begin
       if iColor1 <> -1 then
          ColorToApply:= iColor1
       else
       begin
         if IsNightMode or ForceNightColors then
            ColorToApply:= clrBlackBk
         else
            ColorToApply:= $00f1f1f1;
       end;

       if ColorToApply <> clNone then
          begin
            if PanelSource.Color1 <> ColorToApply then
               PanelSource.Color1:=  ColorToApply;
          end;
     end
  else
     begin
       // dual colors (vgSimple); both iColor1 and iColor2 must contain valid colors
       ColorToApply:= clNone; // top color
       if iColor1 <> -1 then
          ColorToApply:= iColor1
       else
       begin
         if IsNightMode or ForceNightColors then
            ColorToApply:= clrDarkBlue
         else
            ColorToApply:= clWhite;
       end;

       if ColorToApply <> clNone then
          begin
            if PanelSource.Color1 <> ColorToApply then
               PanelSource.Color1:=  ColorToApply;
          end;

       ColorToApply:= clNone; // bottom color
       if iColor2 <> -1 then
          ColorToApply:= iColor2
       else
       begin
         if IsNightMode or ForceNightColors then
            ColorToApply:= clrBlackBk
         else
            ColorToApply:= $00f1f1f1;
       end;

       if ColorToApply <> clNone then
          begin
            if PanelSource.Color2 <> ColorToApply then
               PanelSource.Color2:=  ColorToApply;
          end;
     end;
end;

procedure SetEditNightColors(EditSource: TTntEditEx);
begin
  EditSource.Color:= clrDarkGray;
  EditSource.ColorFrame:= clGray; // set to default TEditEx frame color just in case
  EditSource.ColorFrameFocused:= clSilver;
  EditSource.ColorFrameDisabled:= clrMedDarkGray;
  EditSource.ColorDisabled:= menu_background_color[1];
  EditSource.Font.Color:= clCream; //item_caption_active_color[1]
  EditSource.UseCustomBorder:= True;
end;

procedure SetEditNightColors(EditSource: TEditEx);
begin
  EditSource.Color:= clrDarkGray;
  EditSource.ColorFrame:= clGray; // set to default TEditEx frame color just in case
  EditSource.ColorFrameFocused:= clSilver;
  EditSource.ColorFrameDisabled:= clrMedDarkGray;
  EditSource.ColorDisabled:= menu_background_color[1];
  EditSource.Font.Color:= clCream; //item_caption_active_color[1]
  EditSource.UseCustomBorder:= True;
end;

procedure SetEditColors(EditSource: TEditEx; BackgroundColor: TColor; FontColor: TColor; FrameColor: TColor; FrameFocusedColor: TColor; FrameDisabledColor: TColor = -1; EnableCustomBorder: Boolean = True);
begin
  EditSource.Color:= BackgroundColor;
  if FrameColor <> -1 then
     EditSource.ColorFrame:= FrameColor;
  if FrameFocusedColor <> -1 then
     EditSource.ColorFrameFocused:=  FrameFocusedColor;
  if FrameDisabledColor <> -1 then
     EditSource.ColorFrameDisabled:= FrameDisabledColor;

  EditSource.Font.Color:= FontColor;

  if EditSource.UseCustomBorder <> EnableCustomBorder then
     EditSource.UseCustomBorder:=  True;
end;

procedure PopulateMsgColors;
begin
  if IsNightMode then
  begin
    if MsgTxtColors.colorKeyTitle <> $00006ee6 then
    begin
      MsgTxtColors.colorKeyTitle:= $00006ee6;
      MsgTxtColors.colorKeyValue:= $00a0a0a0;
      MsgTxtColors.colorFileName:= $00d68b40; // (0, 100, 200)
      MsgTxtColors.colorMachineName:= clrLightBlue;// $00ff7c7c;
      MsgTxtColors.colorMachineMultiSlot:= $00009696; // RGB(150, 150, 0)
      MsgTxtColors.colorCmdLine:= clrLightGreen;//clLime;
      MsgTxtColors.colorBoldTitle:= $00c8c8c8; // (200, 200, 200)
      MsgTxtColors.colorWarning:= clrLightRed;// $001414e6;
      MsgTxtColors.colorExitCode:= $008b8bd6;
    end;
  end
  else
  begin
    if MsgTxtColors.colorKeyTitle <> $000053a6 then
    begin
      MsgTxtColors.colorKeyTitle:= $000053a6;
      MsgTxtColors.colorKeyValue:= clGray;
      MsgTxtColors.colorFileName:= $00a65300;
      MsgTxtColors.colorMachineName:= clNavy;
      MsgTxtColors.colorMachineMultiSlot:= clOlive;
      MsgTxtColors.colorCmdLine:= $00600000;
      MsgTxtColors.colorBoldTitle:= clrDarkGray;
      MsgTxtColors.colorWarning:= clMaroon;
      MsgTxtColors.colorExitCode:= $00000060;
    end;
  end;
end;

procedure SetLightColorsGameTopBar(GameSetStatus: Integer; PanelSource: TPanelEx; IsBottomColorSilver: Boolean = True);
begin
  // this is for regular light colors (no dark theme)
  // $00faf0e5 // blue
  // $00e5f0fa // red
  // $00f0fae5 // green
  // $00e5fafa // yellow
  PanelSource.Canvas.Lock;
  case GameSetStatus of
   -1: PanelSource.Color1:= $00faf0e5; // blue (229, 240, 250)
    0: PanelSource.Color1:= $00f0fae5; // green (229, 250, 240)
    1: PanelSource.Color1:= $00e5f0fa; // red, based on green (250, 240, 229)
    2: PanelSource.Color1:= $00eeeeee; // silver, base on green (238, 238, 238) /// $00d9d9d9 (217, 217, 217) darker silver
  end;
  if IsBottomColorSilver then
     begin
       if PanelSource.Color2 <> $00f1f1f1 then
          PanelSource.Color2:=  $00f1f1f1; // silver bottom color
     end
  else
     begin
       if PanelSource.Color2 <> clWhite then
          PanelSource.Color2:=  clWhite; // white bottom color (FormMessageBox ... and others ?)
     end;
  PanelSource.Canvas.UnLock;
end;

procedure SetColorsGameTopBar(GameSetStatus: Integer; PanelSource: TPanelEx; IsBottomColorSilver: Boolean = True);
begin
  if IsNightMode then
  begin
    PanelSource.Canvas.Lock;
    case GameSetStatus of
     -1: PanelSource.Color1:= clrDarkBlue;   // blue -> -1 is for message box and unknown game set state
      0: PanelSource.Color1:= clrDarkGreen;  // green
      1: PanelSource.Color1:= clrDarkRed;    // red
      2: PanelSource.Color1:= clrDarkSilver; // silver
    end;

    if IsBottomColorSilver then
       PanelSource.Color2:= menu_background_color[1]
    else
       PanelSource.Color2:= clrBlackBk;
    PanelSource.Canvas.UnLock;
  end
  else
  begin
    SetLightColorsGameTopBar(GameSetStatus, PanelSource, IsBottomColorSilver);
  end;
end;

procedure SetColorEmulatorTopBar(PanelExSource: TPanelEx; EmulatorID: Integer; IsBottomColorSilver: Boolean = False);
var
  iTop, iBottom: TColor;
begin
  // night mode top color is 60% dark of the light color
  case EmulatorID of
    idMAME:
      begin
        if IsNightMode then
           iTop:= $00907964 //$00b44b32 // RGB(50, 75, 150)
        else
           iTop:= clSkyBlue;
      end;
    idSupermodel:
      begin
        if IsNightMode then
           iTop:= $00847b73 //$00b44b32 // RGB(50, 75, 150)
        else
           iTop:= $00dccdc0;
      end;
    idDaphne:
      begin
        if IsNightMode then
           iTop:= $00738484 // RGB(50, 75, 150)
        else
           iTop:= $00c0dcdc;
      end;
    //idDemul:
    //  begin
    //    if IsNightMode then
    //       iTop:= $00b44b32 // RGB(50, 75, 150)
    //    else
    //       iTop:= clSkyBlue;
    //  end;
    idHBMAME:
      begin
        if IsNightMode then
           iTop:= $006c7356 // RGB(50, 75, 150)
        else
           iTop:= $00b4bf8f;
      end;
    //idDICE:
    //  begin
    //    if IsNightMode then
    //       iTop:= $00b44b32 // RGB(50, 75, 150)
    //    else
    //       iTop:= clSkyBlue;
    //  end;
    idSegaModel2:
      begin
        if IsNightMode then
           iTop:= $00738473 //$00873826 // RGB(50, 75, 150)
        else
           iTop:= clMoneyGreen;
      end;
    idZiNc:
      begin
        if IsNightMode then
           iTop:= $00737b84 //$00324bb4 // RGB(50, 75, 150)
        else
           iTop:= $00c0cddc;
      end;
  end;
  if IsNightMode then
     begin
       if IsBottomColorSilver then
          iBottom:= menu_background_color[1]
       else
          iBottom:= clrBlackBk
     end;
  PanelExSource.Color1:= iTop;
  if IsNightMode then
     PanelExSource.Color2:= iBottom;
end;

procedure SetFormColors(FormSource: TForm; PanelTopSource, PanelBottomSource: TPanelEx; LabelGameTitle, LabelGameName, LabelGameStatus: TShadowLabel; GameStatus: Integer; IsBottomColorSilver: Boolean = False);
begin
  if IsNightMode then
  begin
    if FormSource <> nil then
       begin
         if IsBottomColorSilver then
            FormSource.Color:= menu_background_color[1]
         else
            FormSource.Color:= clrBlackBk;
       end;

    if PanelTopSource <> nil then
    begin
      PanelTopSource.Color1:= clrDarkBlue; // will paint to default color no matter what
      if IsBottomColorSilver then
         PanelTopSource.Color2:= menu_background_color[1]
      else
         PanelTopSource.Color2:= clrBlackBk;
      PanelTopSource.Color3:= clrLightGrayFrame;
      PanelTopSource.ColorFrame:= clrLightBlue;
    end;

    if PanelBottomSource <> nil then
    begin
      if IsBottomColorSilver then
         SetPanelNightColors(PanelBottomSource, menu_background_color[1], clrDarkGray, clrLightBlue)
      else
         SetPanelNightColors(PanelBottomSource, clrBlackBk, clrDarkGray, clrLightBlue);
    end;

    if LabelGameTitle <> nil then
    begin
      case GameStatus of // 0 - have (available); 1 - missing ROMs/CHDs; 2 - missing (no .zip and no ROMs found... even if CHDs are found)
        -1: // default blue gradient
          begin
            LabelGameTitle.Font.Color:=  clrOrangeBarTop;
            LabelGameTitle.ShadowColor:= clMaroon;
          end;
        0: // green gradient (have)
          begin
            LabelGameTitle.Font.Color:=  clrLightGreen;// clLime;
            LabelGameTitle.ShadowColor:= clNavy;
          end;
        1: // red gradient (missing ROMs/CHDs)
          begin
            LabelGameTitle.Font.Color:=  clrLightRed;//clRed;
            LabelGameTitle.ShadowColor:= clMaroon;
          end;
        2: // gray gradient (missing)
          begin
            LabelGameTitle.Font.Color:=  clrOrangeBarTop;
            LabelGameTitle.ShadowColor:= clMaroon;
          end;
      end;
      LabelGameTitle.ShadowEnabled:= False;
    end;

    if LabelGameName <> nil then
    begin
      if IsBottomColorSilver then
         SetLabelColors(LabelGameName, clCream, item_caption_active_shadow_color[1])
      else
         SetLabelColors(LabelGameName, clWhite, clrMedBlue);

    end;

    if LabelGameStatus <> nil then
    begin
      SetLabelColors(LabelGameStatus, clrMedSilver, clrLightBlack);
    end;
  end;
end;

procedure SetSystemTitleBarNightColors(sysBarSource, sysBottomBarSource: TPanelEx; IsBlackBackground: Boolean = True);
begin
  if IsBlackBackground then
     SetPanelColors(sysBarSource, clrBlackBk, clrDarkGray)
  else
     SetPanelColors(sysBarSource, menu_background_color[1], clrDarkGray);
  SetPanelColors(sysBottomBarSource, clrDarkGray, menu_background_color[1]);
  if not sysBarSource.Visible then
     sysBarSource.Visible:= True;
  if not sysBottomBarSource.Visible then
     sysBottomBarSource.Visible:= True;
end;

procedure SetSystemTitleBottomBarNightColors(sysBottomBarSource: TPanelEx);
begin
  SetPanelColors(sysBottomBarSource, clrBlackBk, menu_background_color[1]);
  if not sysBottomBarSource.Visible then
     sysBottomBarSource.Visible:= True;
end;

function WideLibraryErrorMessage(const LibName: WideString; Dll: THandle; ErrorCode: Integer): WideString;
var
  Len: Integer;
  Flags: Cardinal;
begin
  Flags:= FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_ARGUMENT_ARRAY;
  if Dll <> 0 then
     Flags:= Flags or FORMAT_MESSAGE_FROM_HMODULE;

  SetLength(Result, 256);
  Len:= FormatMessageW(Flags, Pointer(Dll), ErrorCode, 0, PWideChar(Result), Length(Result), nil);
  SetLength(Result, Len);

  if Trim(Result) = '' then
     Result:= WideFormat('Unspecified error (%d) from %s.', [ErrorCode, LibName]);
end;

function WideSysErrorMessage(ErrorCode: Integer): WideString;
begin
  Result := WideLibraryErrorMessage('system', 0, ErrorCode);
end;

function WideFileCreate(const FileName: WideString): Integer;
begin
  Result := Integer(CreateFileW(PWideChar(FileName), GENERIC_READ or GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0))
end;

function WideExpandFileName(const FileName: WideString): WideString;
var
  FName: PWideChar;
  Buffer: array[0..MAX_PATH - 1] of WideChar;
begin
  SetString(Result, Buffer, GetFullPathNameW(PWideChar(FileNamE), MAX_PATH, Buffer, FName));
  //SetString(Result, Buffer, Tnt_GetFullPathNameW(PWideChar(FileName), MAX_PATH, Buffer, FName)); // original from TNT_Unicode
end;

function WideFileOpen(const FileName: WideString; Mode: LongWord): Integer;
const
  AccessMode: array[0..2] of LongWord = (
    GENERIC_READ,
    GENERIC_WRITE,
    GENERIC_READ or GENERIC_WRITE);
  ShareMode: array[0..4] of LongWord = (
    0,
    0,
    FILE_SHARE_READ,
    FILE_SHARE_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE);
begin
  Result:= Integer(CreateFileW(PWideChar(FileName), AccessMode[Mode and 3],
           ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
           FILE_ATTRIBUTE_NORMAL, 0));
end;

// WideFileStream
constructor TWideFileStream.Create(const FileName: WideString; Mode: Word);
var
  CreateHandle: Integer;
  ErrorMessage: WideString;
begin
  if Mode = fmCreate then
  begin
    CreateHandle:= WideFileCreate(FileName);
    if CreateHandle < 0 then
       begin
         ErrorMessage:= WideSysErrorMessage(GetLastError);
         raise EFCreateError.CreateFmt(SFCreateErrorEx, [WideExpandFileName(FileName), ErrorMessage]);
       end;
  end else
  begin
    CreateHandle:= WideFileOpen(FileName, Mode);
    if CreateHandle < 0 then
       begin
         ErrorMessage:= WideSysErrorMessage(GetLastError);
         raise EFOpenError.CreateFmt(SFOpenErrorEx, [WideExpandFileName(FileName), ErrorMessage]);
       end;
  end;
  inherited Create(CreateHandle);
end;

destructor TWideFileStream.Destroy;
begin
  if Handle >= 0 then
     FileClose(Handle);
end;

// TWideMemoryStream

procedure TWideMemoryStream.LoadFromFile(const FileName: WideString);
var
  Stream: TStream;
begin
  Stream:= TWideFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWideMemoryStream.SaveToFile(const FileName: WideString);
var
  Stream: TStream;
begin
  Stream:= TWideFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

// TWideResourceStream

constructor TWideResourceStream.Create(Instance: THandle; const ResName: WideString;
  ResType: PWideChar);
begin
  inherited Create;
  Initialize(Instance, PWideChar(ResName), ResType);
end;

constructor TWideResourceStream.CreateFromID(Instance: THandle; ResID: Word;
  ResType: PWideChar);
begin
  inherited Create;
  Initialize(Instance, PWideChar(ResID), ResType);
end;

procedure TWideResourceStream.Initialize(Instance: THandle; Name, ResType: PWideChar);

  procedure Error;
  begin
    raise EResNotFound.CreateFmt(SResNotFound, [Name]);
  end;

begin
  HResInfo:= FindResourceW(Instance, Name, ResType);
  if HResInfo = 0 then
     Error;
  HGlobal:= LoadResource(Instance, HResInfo);
  if HGlobal = 0 then
     Error;
  SetPointer(LockResource(HGlobal), SizeOfResource(Instance, HResInfo));
end;

destructor TWideResourceStream.Destroy;
begin
  UnlockResource(HGlobal);
  FreeResource(HGlobal); // Technically this is not necessary (MS KB #193678)
  inherited Destroy;
end;

function TWideResourceStream.Write(const Buffer; Count: LongInt): LongInt;
begin
  raise EStreamError.CreateRes(PResStringRec(@SCantWriteResourceStreamError));
end;

procedure TWideResourceStream.SaveToFile(const FileName: WideString);
var
  Stream: TStream;
begin
  Stream:= TWideFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure WinGradient(ACanvas: TCanvas; ARect: TRect; FColor1, FColor2: TColor);
var
  Vertexs: array[0..1] of TTriVertex;
  GRect: TGradientRect;

  function SetVertex(var Vertex: TTriVertex; X, Y: Integer; Color: TColor): Boolean;
  begin
    Result:= True;
    Vertex.X    := X;
    Vertex.Y    := Y;
    Vertex.Red  := (Color and $000000ff) shl 8;
    Vertex.Green:= (Color and $0000ff00);
    Vertex.Blue := (Color and $00ff0000) shr 8;
    Vertex.Alpha:= 0;
  end;

begin
  SetVertex(Vertexs[0], ARect.Left,  ARect.Top,    FColor1);
  SetVertex(Vertexs[1], ARect.Right, ARect.Bottom, FColor2);
  GRect.UpperLeft := 0;
  GRect.LowerRight:= 1;
  GradientFill(ACanvas.Handle, @Vertexs, 2, @GRect, 1, GRADIENT_FILL_RECT_V);
end;

function GetFileVersion(const sFile: String; MinorVersionOnly: Boolean = False): String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  Result:= '';
  VerInfoSize:= GetFileVersionInfoSize(PChar(sFile), Dummy);
  if VerInfoSize = 0 then Exit;
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFile), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result:= IntToStr(dwFileVersionMS shr 16);
    Result:= Result+ '.'+IntToStr(dwFileVersionMS and $FFFF);
    if not MinorVersionOnly then
       begin
         Result:= Result+ '.'+IntToStr(dwFileVersionLS shr 16);
         Result:= Result+ '.'+IntToStr(dwFileVersionLS and $FFFF);
       end;
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function GetFileInfo2(FName, InfoType: String): String;
{usage:

  showmessage(GetFileInfo(Application.ExeName, VersionInfo[x]));

  1: 'CompanyName'
  2: 'FileDescription'
  3: 'FileVersion'
  4: 'InternalName'
  5: 'LegalCopyRight'
  6: 'OriginalFileName'
  7: 'ProductName'
  8: 'ProductVersion'
  9: 'SpecialBuild'}
var
  Info    : Pointer;
  InfoData: Pointer;
  InfoSize: LongInt;
  InfoLen : {$IFDEF WIN32} DWORD;{$ELSE} LongInt; {$ENDIF}
  DataLen : {$IFDEF WIN32} UInt; {$ELSE} word; {$ENDIF}
  LangPtr : Pointer;
begin
  Result:= '';
  if Length(FName) <= 0 then
     Exit;

  DataLen:= 255;
  FName:= FName+#0;

  InfoSize:= GetFileVersionInfoSize(@Fname[1], InfoLen);
  if not (InfoSize > 0) then
     Exit;

  GetMem(Info, InfoSize);
  try
    if GetFileVersionInfo(@FName[1], InfoLen, InfoSize, Info) then
       begin
         if VerQueryValue(Info, '\VarFileInfo\Translation', LangPtr, DataLen) then
            InfoType:= Format('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(LongInt(LangPtr^)), HiWord(LongInt(LangPtr^)), InfoType]);
         if VerQueryValue(Info, @InfoType[1], InfoData, Datalen) then
           Result:= strPas(InfoData);
       end;
  finally
    FreeMem(Info, InfoSize);
  end;
end;

function GetFileSize(const aFileName: String): Int64;
var
  SearchRec: TSearchRec;
  Converter: packed record
    case Boolean of
      False: (n: Int64);
      True : (Low, High: DWORD);
    end;
begin
  if FindFirst(aFileName, faAnyfile, SearchRec) = 0 then
     begin
       Converter.Low:=  SearchRec.FindData.nFileSizeLow;
       Converter.High:= SearchRec.FindData.nFileSizeHigh;
       Result:= Converter.n;
     end
  else
     Result:= -1;
  FindClose(SearchRec);
end;

{$IFDEF WIN32}

function ShortToLongFileName(const ShortName: String): String;
var
  Temp: TWin32FindData;
  SearchHandle: THandle;
begin
  SearchHandle:= FindFirstFile(PChar(ShortName), Temp);
  if SearchHandle <> INVALID_HANDLE_VALUE then
     begin
       Result:= String(Temp.cFileName);
       if Result = '' then
          Result:= String(Temp.cAlternateFileName);
     end
  else
     Result:= '';
  Windows.FindClose(SearchHandle);
end;

function LongToShortFileName(const LongName: String): String;
var
  Temp: TWin32FindData;
  SearchHandle: THandle;
begin
  SearchHandle:= FindFirstFile(PChar(LongName), Temp);
  if SearchHandle <> INVALID_HANDLE_VALUE then
     begin
       Result:= String(Temp.cAlternateFileName);
       if Result = '' then
          Result:= String(Temp.cFileName);
     end
  else
     Result:= '';
  Windows.FindClose(SearchHandle);
end;

function ShortToLongPath(const ShortName: String): String;
var
  LastSlash: PChar;
  TempPathPtr: PChar;
begin
  Result:= '';
  TempPathPtr:= PChar(ShortName);
  LastSlash:= StrRScan(TempPathPtr, '\');
  while LastSlash <> nil do
  begin
    Result:= '\' + ShortToLongFileName(TempPathPtr) + Result;
    if LastSlash <> nil then
       begin
         LastSlash^:= Char(0);
         LastSlash:= StrRScan(TempPathPtr, '\');
       end;
  end;
  Result:= TempPathPtr + Result;
end;

// this function doesn't work, use ExtractShortPathName() instead!!! October 10, 2016
//function LongToShortPath(const LongName: String): String;
//var
//  LastSlash: PChar;
//  TempPathPtr: PChar;
//begin
//  Result:= '';
//  TempPathPtr:= PChar(LongName);
//  LastSlash:= StrRScan(TempPathPtr, '\');
//  while LastSlash <> nil do
//  begin
//    Result:= '\' + LongToShortFileName(TempPathPtr) + Result;
//    if LastSlash <> nil then
//       begin
//         LastSlash^:= Char(0);
//         LastSlash:= StrRScan(TempPathPtr, '\');
//       end;
//  end;
//  Result:= TempPathPtr+Result;
//end;
{$ENDIF WIN32}

function ExtractShortPathName(const FileName: String): String; // function from Delphi XE 10 Seattle source code
var
  Buffer: array[0..MAX_PATH - 1] of Char;
  Len: Integer;
begin
  // param "FileName" can be only path (with or without "\") or with a filename at the end
  Len:= GetShortPathName(PChar(FileName), Buffer, Length(Buffer));
  if Len <= Length(Buffer) then
     SetString(Result, Buffer, Len)
  else
    if Len > 0 then
    begin
      SetLength(Result, Len);
      Len:= GetShortPathName(PChar(FileName), PChar(Result), Len);
      if Len < Length(Result) then
         SetLength(Result, Len);
    end;
end;

// delphi 2006 assembly functions!
function Pos(const substr, str: WideString): Integer; overload;
asm
{     ->EAX     Pointer to substr               }
{       EDX     Pointer to string               }
{     <-EAX     Position of substr in str or 0  }

        TEST    EAX,EAX
        JE      @@noWork

        TEST    EDX,EDX
        JE      @@stringEmpty

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        MOV     ESI,EAX                         { Point ESI to substr           }
        MOV     EDI,EDX                         { Point EDI to s                }

        MOV     ECX,[EDI-4]                     { ECX = Length(s)               }
        SHR     ECX,1

        PUSH    EDI                             { remember s position to calculate index        }

        MOV     EDX,[ESI-4]                     { EDX = Length(substr)          }
        SHR     EDX,1

        DEC     EDX                             { EDX = Length(substr) - 1              }
        JS      @@fail                          { < 0 ? return 0                        }
        MOV     AX,[ESI]                        { AL = first char of substr             }
        ADD     ESI,2                           { Point ESI to 2'nd char of substr      }

        SUB     ECX,EDX                         { #positions in s to look at    }
                                                { = Length(s) - Length(substr) + 1      }
        JLE     @@fail
@@loop:
        REPNE   SCASW
        JNE     @@fail
        MOV     EBX,ECX                         { save outer loop counter               }
        PUSH    ESI                             { save outer loop substr pointer        }
        PUSH    EDI                             { save outer loop s pointer             }

        MOV     ECX,EDX
        REPE    CMPSW
        POP     EDI                             { restore outer loop s pointer  }
        POP     ESI                             { restore outer loop substr pointer     }
        JE      @@found
        MOV     ECX,EBX                         { restore outer loop counter    }
        JMP     @@loop

@@fail:
        POP     EDX                             { get rid of saved s pointer    }
        XOR     EAX,EAX
        JMP     @@exit

@@stringEmpty:
        XOR     EAX,EAX
        JMP     @@noWork

@@found:
        POP     EDX                             { restore pointer to first char of s    }
        MOV     EAX,EDI                         { EDI points of char after match        }
        SUB     EAX,EDX                         { the difference is the correct index   }
        SHR     EAX,1
@@exit:
        POP     EDI
        POP     ESI
        POP     EBX
@@noWork:
end;

function PosEx(const SubStr, S: String; Offset: Integer = 1): Integer;
// copy of Fastcode function PosEx_JOH_IA32_8
// Needed for Delphi 6 and to Fix Bug in D7 PosEx
// not needed for Delphi 2006 and newer
asm {299 Bytes}
  sub     esp, 20
  mov     [esp], ebx
  cmp     eax, 1
  sbb     ebx, ebx         {-1 if SubStr = '' else 0}
  sub     edx, 1           {-1 if S = ''}
  sbb     ebx, 0           {Negative if S = '' or SubStr = '' else 0}
  sub     ecx, 1           {Offset - 1}
  or      ebx, ecx         {Negative if S = '' or SubStr = '' or Offset < 1}
  jl      @@InvalidInput
  mov     [esp+4], edi
  mov     [esp+8], esi
  mov     [esp+12], ebp
  mov     [esp+16], edx
  mov     edi, [eax-4]     {Length(SubStr)}
  mov     esi, [edx-3]     {Length(S)}
  add     ecx, edi
  cmp     ecx, esi
  jg      @@NotFound       {Offset to High for a Match}
  test    edi, edi
  jz      @@NotFound       {Length(SubStr = 0)}
  lea     ebp, [eax+edi]   {Last Character Position in SubStr + 1}
  add     esi, edx         {Last Character Position in S}
  movzx   eax, [ebp-1]     {Last Character of SubStr}
  add     edx, ecx         {Search Start Position in S for Last Character}
  mov     ah, al
  neg     edi              {-Length(SubStr)}
  mov     ecx, eax
  shl     eax, 16
  or      ecx, eax         {All 4 Bytes = Last Character of SubStr}
@@MainLoop:
  add     edx, 4
  cmp     edx, esi
  ja      @@Remainder      {1 to 4 Positions Remaining}
  mov     eax, [edx-4]     {Check Next 4 Bytes of S}
  xor     eax, ecx         {Zero Byte at each Matching Position}
  lea     ebx, [eax-$01010101]
  not     eax
  and     eax, ebx
  and     eax, $80808080   {Set Byte to $80 at each Match Position else $00}
  jz      @@MainLoop       {Loop Until any Match on Last Character Found}
  bsf     eax, eax         {Find First Match Bit}
  shr     eax, 3           {Byte Offset of First Match (0..3)}
  lea     edx, [eax+edx-3] {Address of First Match on Last Character + 1}
@@Compare:
  cmp     edi, -4
  jle     @@Large          {Lenght(SubStr) >= 4}
  cmp     edi, -1
  je      @@SetResult      {Exit with Match if Lenght(SubStr) = 1}
  mov     ax, [ebp+edi]    {Last Char Matches - Compare First 2 Chars}
  cmp     ax, [edx+edi]
  jne     @@MainLoop       {No Match on First 2 Characters}
@@SetResult:               {Full Match}
  lea     eax, [edx+edi]   {Calculate and Return Result}
  mov     ebx, [esp]
  mov     edi, [esp+4]
  mov     esi, [esp+8]
  mov     ebp, [esp+12]
  sub     eax, [esp+16]
  add     esp, 20
  ret
@@NotFound:
  mov     edi, [esp+4]
  mov     esi, [esp+8]
  mov     ebp, [esp+12]
@@InvalidInput:
  mov     ebx, [esp]
  add     esp, 20
  xor     eax, eax         {Return 0}
  ret
@@Remainder:               {Check Last 1 to 4 Characters}
  mov     eax, [esi-3]     {Last 4 Characters of S - May include Length Bytes}
  xor     eax, ecx         {Zero Byte at each Matching Position}
  lea     ebx, [eax-$01010101]
  not     eax
  and     eax, ebx
  and     eax, $80808080   {Set Byte to $80 at each Match Position else $00}
  jz      @@NotFound       {No Match Possible}
  lea     eax, [edx-4]     {Check Valid Match Positions}
  cmp     cl, [eax]
  lea     edx, [eax+1]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+2]
  cmp     cl, [eax+1]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+3]
  cmp     cl, [eax+2]
  je      @@Compare
  cmp     edx, esi
  ja      @@NotFound
  lea     edx, [eax+4]
  jmp     @@Compare
@@Large:
  mov     eax, [ebp-4]     {Compare Last 4 Characters of S and SubStr}
  cmp     eax, [edx-4]
  jne     @@MainLoop       {No Match on Last 4 Characters}
  mov     ebx, edi
@@CompareLoop:             {Compare Remaining Characters}
  add     ebx, 4           {Compare 4 Characters per Loop}
  jge     @@SetResult      {All Characters Matched}
  mov     eax, [ebp+ebx-4]
  cmp     eax, [edx+ebx-4]
  je      @@CompareLoop    {Match on Next 4 Characters}
  jmp     @@MainLoop       {No Match}
end;

function LowerCase(const S: String): String; overload;
asm
       push  ebx
       push  esi
       push  edi
       mov   esi, eax          // s
       mov   eax, edx
       test  esi, esi
       jz    @Nil
       mov   edx, [esi-4]      // Length(s)
       mov   edi, eax          // @Result
       test  edx, edx
       jle   @Nil
       mov   ecx, [eax]
       mov   ebx, edx
       test  ecx, ecx
       jz    @Realloc          // Jump if Result not allocated
       test  edx, 3
       jnz   @Length3
       xor   edx, [ecx-4]
       cmp   edx, 3
       jbe   @TestRef
       jmp   @Realloc
@Length3:
       or    edx, 2
       xor   edx, [ecx-4]
       cmp   edx, 1
       ja    @Realloc
@TestRef:
       cmp   [ecx-8], 1
       je    @LengthOK         // Jump if Result RefCt=1
@Realloc:
       mov   edx, ebx
       or    edx, 3
       call  System.@LStrSetLength
@LengthOK:
       mov   edi, [edi]        // Result
       mov   [edi-4], ebx      // Correct Result length
       mov   byte ptr [ebx+edi], 0
       add   ebx, -1
       and   ebx, -4
       mov   eax, [ebx+esi]

@Loop: mov   ecx, eax
       or    eax, $80808080    // $C1..$DA
       mov   edx, eax
       sub   eax, $5B5B5B5B    // $66..$7F
       xor   edx, ecx          // $80
       or    eax, $80808080    // $E6..$FF
       sub   eax, $66666666    // $80..$99
       and   eax, edx          // $80
       shr   eax, 2            // $20
       xor   eax, ecx          // Lower
       mov   [ebx+edi], eax
       mov   eax, [ebx+esi-4]
       sub   ebx, 4
       jge   @Loop

       pop   edi
       pop   esi
       pop   ebx
       ret

@Nil:  pop   edi
       pop   esi
       pop   ebx
       jmp    System.@LStrClr   // Result:=''
end;

function UpperCase(const S: String): String; overload;
asm
       push  ebx
       push  esi
       push  edi
       mov   esi, eax          // s
       mov   eax, edx
       test  esi, esi
       jz    @Nil
       mov   edx, [esi-4]      // Length(s)
       mov   edi, eax          // @Result
       test  edx, edx
       jle   @Nil
       mov   ecx, [eax]
       mov   ebx, edx
       test  ecx, ecx
       jz    @Realloc          // Jump if Result not allocated
       test  edx, 3
       jnz   @Length3
       xor   edx, [ecx-4]
       cmp   edx, 3
       jbe   @TestRef
       jmp   @Realloc
@Length3:
       or    edx, 2
       xor   edx, [ecx-4]
       cmp   edx, 1
       ja    @Realloc
@TestRef:
       cmp   [ecx-8], 1
       je    @LengthOK         // Jump if Result RefCt=1
@Realloc:
       mov   edx, ebx
       or    edx, 3
       call  System.@LStrSetLength
@LengthOK:
       mov   edi, [edi]        // Result
       mov   [edi-4], ebx      // Correct Result length
       mov   byte ptr [ebx+edi], 0
       add   ebx, -1
       and   ebx, -4
       mov   eax, [ebx+esi]

@Loop: mov   ecx, eax
       or    eax, $80808080    // $E1..$FA
       mov   edx, eax
       sub   eax, $7B7B7B7B    // $66..$7F
       xor   edx, ecx          // $80
       or    eax, $80808080    // $E6..$FF
       sub   eax, $66666666    // $80..$99
       and   eax, edx          // $80
       shr   eax, 2            // $20
       xor   eax, ecx          // Upper
       mov   [ebx+edi], eax
       mov   eax, [ebx+esi-4]
       sub   ebx, 4
       jge   @Loop

       pop   edi
       pop   esi
       pop   ebx
       ret

@Nil:  pop   edi
       pop   esi
       pop   ebx
       jmp    System.@LStrClr   // Result:=''
end;

// move used by IntToStr() function!
procedure Move(const Source; var Dest; count: Integer); overload;
asm
  cmp     eax, edx
  je      @@Exit {Source = Dest}
  cmp     ecx, 32
  ja      @@LargeMove {Count > 32 or Count < 0}
  sub     ecx, 8
  jg      @@SmallMove
@@TinyMove: {0..8 Byte Move}
  jmp     dword ptr [@@JumpTable+32+ecx*4]
@@SmallMove: {9..32 Byte Move}
  fild    qword ptr [eax+ecx] {Load Last 8}
  fild    qword ptr [eax] {Load First 8}
  cmp     ecx, 8
  jle     @@Small16
  fild    qword ptr [eax+8] {Load Second 8}
  cmp     ecx, 16
  jle     @@Small24
  fild    qword ptr [eax+16] {Load Third 8}
  fistp   qword ptr [edx+16] {Save Third 8}
@@Small24:
  fistp   qword ptr [edx+8] {Save Second 8}
@@Small16:
  fistp   qword ptr [edx] {Save First 8}
  fistp   qword ptr [edx+ecx] {Save Last 8}
@@Exit:
  ret
  nop {4-Byte Align JumpTable}
  nop
@@JumpTable: {4-Byte Aligned}
  dd      @@Exit, @@M01, @@M02, @@M03, @@M04, @@M05, @@M06, @@M07, @@M08
@@LargeForwardMove: {4-Byte Aligned}
  push    edx
  fild    qword ptr [eax] {First 8}
  lea     eax, [eax+ecx-8]
  lea     ecx, [ecx+edx-8]
  fild    qword ptr [eax] {Last 8}
  push    ecx
  neg     ecx
  and     edx, -8 {8-Byte Align Writes}
  lea     ecx, [ecx+edx+8]
  pop     edx
@FwdLoop:
  fild    qword ptr [eax+ecx]
  fistp   qword ptr [edx+ecx]
  add     ecx, 8
  jl      @FwdLoop
  fistp   qword ptr [edx] {Last 8}
  pop     edx
  fistp   qword ptr [edx] {First 8}
  ret
@@LargeMove:
  jng     @@LargeDone {Count < 0}
  cmp     eax, edx
  ja      @@LargeForwardMove
  sub     edx, ecx
  cmp     eax, edx
  lea     edx, [edx+ecx]
  jna     @@LargeForwardMove
  sub     ecx, 8 {Backward Move}
  push    ecx
  fild    qword ptr [eax+ecx] {Last 8}
  fild    qword ptr [eax] {First 8}
  add     ecx, edx
  and     ecx, -8 {8-Byte Align Writes}
  sub     ecx, edx
@BwdLoop:
  fild    qword ptr [eax+ecx]
  fistp   qword ptr [edx+ecx]
  sub     ecx, 8
  jg      @BwdLoop
  pop     ecx
  fistp   qword ptr [edx] {First 8}
  fistp   qword ptr [edx+ecx] {Last 8}
@@LargeDone:
  ret
@@M01:
  movzx   ecx, [eax]
  mov     [edx], cl
  ret
@@M02:
  movzx   ecx, word ptr [eax]
  mov     [edx], cx
  ret
@@M03:
  mov     cx, [eax]
  mov     al, [eax+2]
  mov     [edx], cx
  mov     [edx+2], al
  ret
@@M04:
  mov     ecx, [eax]
  mov     [edx], ecx
  ret
@@M05:
  mov     ecx, [eax]
  mov     al, [eax+4]
  mov     [edx], ecx
  mov     [edx+4], al
  ret
@@M06:
  mov     ecx, [eax]
  mov     ax, [eax+4]
  mov     [edx], ecx
  mov     [edx+4], ax
  ret
@@M07:
  mov     ecx, [eax]
  mov     eax, [eax+3]
  mov     [edx], ecx
  mov     [edx+3], eax
  ret
@@M08:
  fild    qword ptr [eax]
  fistp   qword ptr [edx]
end;
// end of file functions

procedure CallShellExecute(Sender: TObject; const FileToOpen: WideString = ''; Visibility: Word = SW_SHOWNORMAL);
var
  LinkStr: WideString;
begin
  if FileToOpen <> '' then
     LinkStr:= FileToOpen
  else
  if Sender is TShadowLabel then
     LinkStr:= TShadowLabel(Sender).Hint
  else
  if Sender is TLabel then
     LinkStr:= TLabel(Sender).Hint
  else
  if Sender is TMenuItem then
     LinkStr:= TMenuItem(Sender).Hint;

  if LinkStr <> '' then
     ShellExecuteW(Application.Handle, 'open', PWideChar(LinkStr), nil, nil, Visibility);
end;

function GenerateZipErrorsMessage(const TitleMessage: String; ZipFilesList: TStrings): Integer;
begin
  if Is4KMode then
     begin
       CallMessageBox4K;
       FormMessageBox4K.PanelBottom.Tag:= 1;
       FormMessageBox4K.Caption:= 'Error: Zip File';
       FormMessageBox4K.LabelMessageTitle:= TitleMessage;
       FormMessageBox4K.LabelMessageW.Clear;

       FormMessageBox4K.LabelMessageW.SelStart:= FormMessageBox4K.LabelMessageW.GetTextLen;
       FormMessageBox4K.LabelMessageW.SelLength:= 0;
       FormMessageBox4K.LabelMessageW.SelText:= ZipFilesList.Text;
       //FormMessageBox4K.LabelMessageW.Lines.AddStrings(ZipFilesList);

       FormMessageBox4K.ButtonYes.Caption:= 'Close';
       FormMessageBox4K.ButtonYes.Left:= (FormMessageBox4K.PanelBottom.Width div 2) - (FormMessageBox4K.ButtonYes.Width div 2);
       FormMessageBox4K.ButtonNo.Visible:= False;

       FormMessageBox4K.LabelMessageW.ReadOnly:= True;
       Result:= FormMessageBox4K.ShowModal;
       FreeMessageBox4K;
     end
  else
     begin
       CallMessageBox;
       FormMessageBox.PanelBottom.Tag:= 1;
       FormMessageBox.Caption:= 'Error: Zip File';
       FormMessageBox.LabelMessageTitle:= TitleMessage;
       FormMessageBox.LabelMessageW.Clear;

       FormMessageBox.LabelMessageW.SelStart:= FormMessageBox.LabelMessageW.GetTextLen;
       FormMessageBox.LabelMessageW.SelLength:= 0;
       FormMessageBox.LabelMessageW.SelText:= ZipFilesList.Text;
       //FormMessageBox.LabelMessageW.Lines.AddStrings(ZipFilesList);

       FormMessageBox.ButtonYes.Caption:= 'Close';
       FormMessageBox.ButtonYes.Left:= (FormMessageBox.PanelBottom.Width div 2) - (FormMessageBox.ButtonYes.Width div 2); //262;
       FormMessageBox.ButtonNo.Visible:= False;

       Result:= FormMessageBox.ShowModal;
       FreeMessageBox;
     end;
end;

function GenerateMessage(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                         IconIndex: Integer = 0; GameSetStatus: Integer = -1): Integer;
begin
  // icon index:
  // -1 -> Game Icon
  // 00 -> Info (default icon)
  // 01 -> Error
  // 02 -> Question
  // 03 -> Command Line
  //if not Assigned(FormMessageBox4K) then
     CallMessageBox;
  //else
  //   begin
  //     CallMessageBox4K;
  //     Result:= GenerateMessage4K(WindowMessage, TitleMessage, DescriptionMessage, MessageType, DefaultButtonNo,
  //                                IconIndex, GameSetStatus);
  //     Exit;
  //   end;

  FormMessageBox.PanelBottom.Tag:= IconIndex;
  FormMessageBox.Caption:= WindowMessage;
  FormMessageBox.LabelMessageTitle:= TitleMessage;
  FormMessageBox.MessageIcon.Tag:= GameSetStatus;

  if DescriptionMessage <> '' then
     begin
       FormMessageBox.LabelMessageW.SelStart:= FormMessageBox.LabelMessageW.GetTextLen;
       FormMessageBox.LabelMessageW.SelLength:= 0;
       FormMessageBox.LabelMessageW.SelText:= DescriptionMessage;
     end;

  if MessageType = 2 then
     begin
       FormMessageBox.ButtonYes.Caption:= 'Close';
       FormMessageBox.ButtonYes.Left:= (FormMessageBox.PanelBottom.Width div 2) - (FormMessageBox.ButtonYes.Width div 2);
       FormMessageBox.ButtonNo.Visible:= False;
     end;
  case DefaultButtonNo of
    True:
      begin
        with FormMessageBox do
        begin
          //ButtonYes.Default:= False;
          //ButtonNo.Default:= True;
          ActiveControl:= ButtonNo;
        end;
      end;
    False: FormMessageBox.ActiveControl:= FormMessageBox.ButtonYes;
  end;
  Result:= FormMessageBox.ShowModal;
  FreeMessageBox;
end;

procedure CallMessageBox;
begin
  if not Assigned(FormMessageBox) then
  begin
    FormMessageBox:= TFormMessageBox.Create(nil);
    FormMessageBox.NightMode.Checked:= IsNightMode;
    FormMessageBox.LabelMessageW.Clear; // ensure RichEdit is clear of any texts
    if IsNightMode then
    begin
      SetFormColors(FormMessageBox, FormMessageBox.PanelTop, FormMessageBox.PanelBottom, FormMessageBox.LabelGameTitle, FormMessageBox.LabelGameName, nil, -1, True);
      FormMessageBox.LabelMessageW.Color:= FormMessageBox.Color;
      FormMessageBox.LabelMessageW.Font.Color:= $00f1f1f1;
      //FormMessageBox.NightMode.Font.Color:= $00f1f1f1;
      //FormMessageBox.HideCommandLineRunConfirm.Font.Color:= $00f1f1f1;
    end;
  end;
end;

procedure FreeMessageBox;
begin
  FreeAndNil(FormMessageBox);
end;

function GenerateMessage4K(const WindowMessage, TitleMessage: WideString; const DescriptionMessage: WideString = ''; MessageType: Integer = 2; DefaultButtonNo: Boolean = False;
                           IconIndex: Integer = 0; GameSetStatus: Integer = -1): Integer;
begin
  // icon index:
  // -1 -> Game Icon
  // 00 -> Info (default icon)
  // 01 -> Error
  // 02 -> Question
  // 03 -> Command Line
  CallMessageBox4K;

  FormMessageBox4K.PanelBottom.Tag:= IconIndex;
  FormMessageBox4K.Caption:= WindowMessage;
  FormMessageBox4K.LabelMessageTitle:= TitleMessage;
  FormMessageBox4K.MessageIcon.Tag:= GameSetStatus;

  if DescriptionMessage <> '' then
     begin
       FormMessageBox4K.LabelMessageW.SelStart:= FormMessageBox4K.LabelMessageW.GetTextLen;
       FormMessageBox4K.LabelMessageW.SelLength:= 0;
       FormMessageBox4K.LabelMessageW.SelText:= DescriptionMessage;
     end;

  if MessageType = 2 then
     begin
       FormMessageBox4K.ButtonYes.Caption:= 'Close';
       FormMessageBox4K.ButtonYes.Left:= (FormMessageBox4K.PanelBottom.Width div 2) - (FormMessageBox4K.ButtonYes.Width div 2);
       FormMessageBox4K.ButtonNo.Visible:= False;
     end;
  case DefaultButtonNo of
    True:
      begin
        with FormMessageBox4K do
        begin
          ActiveControl:= ButtonNo;
        end;
      end;
    False: FormMessageBox4K.ActiveControl:= FormMessageBox4K.ButtonYes;
  end;
  FormMessageBox4K.LabelMessageW.ReadOnly:= True;
  Result:= FormMessageBox4K.ShowModal;
  FreeMessageBox4K;
end;

procedure CallMessageBox4K;
begin
  if not Assigned(FormMessageBox4K) then
  begin
    FormMessageBox4K:= TFormMessageBox4K.Create(nil);
    FormMessageBox4K.NightMode.Checked:= IsNightMode;
    FormMessageBox4K.LabelMessageW.Clear; // ensure RichEdit is clear of any texts
    FormMessageBox4K.LabelMessageW.ReadOnly:= False;
    if IsNightMode then
    begin
      SetFormColors(FormMessageBox4K, FormMessageBox4K.PanelTop, FormMessageBox4K.PanelBottom, FormMessageBox4K.LabelGameTitle, FormMessageBox4K.LabelGameName, nil, -1, True);
      FormMessageBox4K.LabelMessageW.Color:= FormMessageBox4K.Color;
      FormMessageBox4K.LabelMessageW.Font.Color:= $00f1f1f1;
      //FormMessageBox4K.NightMode.Font.Color:= $00f1f1f1;
      //FormMessageBox4K.HideCommandLineRunConfirm.Font.Color:= $00f1f1f1;
    end;
  end;
end;

procedure FreeMessageBox4K;
begin
  FreeAndNil(FormMessageBox4K);
end;

function GetSystemFileName(SystemID: Byte; FileID: Byte = 0; const SoftwareList: String = ''): String;
begin
  // FileID
  //  0 -> games list             "system_name.el"
  //  1 -> ROMs list              "system_name.elrom"
  //  2 -> games set status       "system_name.elstatus"
  //  3 -> missing files          "system_name.miss"
  //  4 -> wav/flac audio samples "system_name.elsamples"
  //  5 -> machines list+softlist "system_name.elsoftlist"
  //  6 -> softlist requirement   "system_name.elsoftlistreq"
  //  9 -> CRC32 collisions list  "system_name_crc32collision.txt"
  // 10 -> set with "NoDump"      "system_name_romsnodump.txt"
  // 11 -> MAME multi-ramsize     "system_name_ramsize
  Result:= '';
  case SystemID of
    idMAME, idHBMAME:
      begin
        if SoftwareList = '' then
           begin
             if SystemID = idMAME then
                Result:= 'mame'
             else
                Result:= 'hbmame';
           end
        else
           Result:= SoftwareList;
      end;
    idSupermodel: Result:= 'supermodelsegamodel3';
    idDaphne    : Result:= 'daphne';
    idDemul     : Result:= 'demul';
    idDICE      : Result:= 'dice';
    idSegaModel2: Result:= 'segamodel2';
    idZiNc      : Result:= 'zinc';
  end;
  case FileID of
    0: Result:= Result+'.el';
    1: Result:= Result+'.elrom';
    2: Result:= Result+'.elstatus';
    3: Result:= Result+'.miss';
    4: Result:= Result+'.elsamples';
    5: Result:= Result+'.elsoftlist';
    6: Result:= Result+'.elsoftlistreq';
    9: Result:= Result+'_crc32collision.txt'; // id "9" to give some room for future expansion (February 15, 2018)
   10: Result:= Result+'_romsnodump.txt';
  end;
end;

procedure GenerateControllerDefinitionsFilesList(Folder: String; ListHolder: THashedStringList; ClearList: Boolean = False);
var
  Search: TSearchRec;
  Loop, EndIndex, IndexLastFolder: Integer;
  ControllerDescription, FileExt: String;
  Continue: Boolean;
begin
  if Folder = '' then
     Exit;

  ListHolder.BeginUpdate;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);
  Continue:= True;
  if FindFirst(Folder+'*.*', $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
            (Search.Name <> '..') then
            GenerateControllerDefinitionsFilesList(Folder+Search.Name, ListHolder)
         else
            begin
              FileExt:= ExtractFileExt(Search.Name);
              if SameText(FileExt, '.zip') then
                 begin
                   Continue:= False;
                   ControllerDescription:= Search.Name;
                   ControllerDescription:= ChangeFileExt(ControllerDescription, '');
                   if ListHolder.IndexOf(ControllerDescription) = -1 then
                      ListHolder.Add(ControllerDescription);
                 end
              else
              case SameText(FileExt, '.ini') of
                True : Continue:= SameText(Search.Name, 'default.ini');
                False: Continue:= SameText(FileExt, '.cfg');
              end;

              if Continue then
                 begin
                   if SameText(FileExt, '.ini') then
                      begin
                        EndIndex:= -1;
                        IndexLastFolder:= -1;
                        Folder:= ExcludeTrailingPathDelimiter(Folder);
                        ControllerDescription:= '';
                        for Loop:=Length(Folder) downto 0 do
                        begin
                          if Folder[Loop] = '\' then
                             begin
                               if EndIndex = -1 then
                                  begin
                                    EndIndex:= Loop;
                                    if IndexLastFolder = -1 then
                                       IndexLastFolder:= Loop;
                                  end
                               else
                                  begin
                                    ControllerDescription:= Copy(Folder, IndexLastFolder+1, Length(Folder));
                                    Break;
                                  end;
                             end;
                        end;
                      end
                   else
                   if SameText(FileExt, '.cfg') then
                      ControllerDescription:= ChangeFileExt(Search.Name, '');
                   if ListHolder.IndexOf(ControllerDescription) = -1 then
                      ListHolder.Add(ControllerDescription);
                 end;
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.Sort;
  ListHolder.EndUpdate;
end;

procedure GetFilesList(Folder, FileType, FileMask: String; ListHolder: THashedStringList; SubDirectories, ClearList, ReturnFullPath: Boolean);
var
  Search: TSearchRec;
begin
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  ListHolder.Sorted:= True;
  ListHolder.Duplicates:= dupIgnore;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);
  if FindFirst(Folder+FileMask, $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Name <> '.') and (Search.Name <> '..') then
            begin
              if (Search.Attr and $10 = $10) and (SubDirectories) then
                 GetFilesList(Folder+Search.Name, FileType, FileMask, ListHolder, True, ClearList, ReturnFullPath)
              else
                 begin
                   if FileType = '.???' then
                      begin
                        if (Search.Attr and $10 <> $10) then
                           case ReturnFullPath of
                             True : ListHolder.Add(Folder+Search.Name);
                             False: ListHolder.Add(Search.Name);
                           end;
                      end
                   else
                   if SameText(ExtractFileExt(Search.Name), FileType) then
                      begin
                        case ReturnFullPath of
                          True : ListHolder.Add(Folder+Search.Name);
                          False: ListHolder.Add(Search.Name);
                        end;
                      end;
                 end;
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.Sorted:= False;
  ListHolder.EndUpdate;
end;

procedure GetFoldersList(Folder: String; ListHolder: THashedStringList; ClearList, SubDirectories: Boolean);
var
  Search: TSearchRec;
begin
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  ListHolder.Sorted:= True;
  ListHolder.Duplicates:= dupIgnore;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);

  if FindFirst(Folder+'*.*', $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
            (Search.Name <> '..') and (SubDirectories) then
            begin
              ListHolder.EndUpdate;
              GetFoldersList(Folder+Search.Name, ListHolder, False, True);
            end
         else
            begin
              ListHolder.Add(ExcludeTrailingPathDelimiter(Folder));
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

procedure GetFoldersList2(Folder: String; ListHolder: THashedStringList; ClearList: Boolean; ReturnFullPath: Boolean = True);
var
  Search: TSearchRec;
begin
  // this function only returns one level folder names, no recursive folder scanning
  // only used by "select icon overlay folder" in preferences screen
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  ListHolder.Sorted:= True;
  ListHolder.Duplicates:= dupIgnore;
  if ClearList then
     ListHolder.Clear;
  Folder:= IncludeTrailingPathDelimiter(Folder);

  if FindFirst(Folder+'*.*', $37, Search) = 0 then
     begin
       repeat
         // It's a directory?
         if (Search.Attr and $10 = $10) and (Search.Name <> '.') and
            (Search.Name <> '..') then
            begin
              if ReturnFullPath then
                 ListHolder.Add(Folder+Search.Name)
              else
                 ListHolder.Add(Search.Name); // used for icon overlay list only (preferences screen)
            end;
       until (FindNext(Search) <> 0);
     end;
  FindClose(Search);
  ListHolder.EndUpdate;
end;

function RemoveQuotes(const ValueStr: String): String;
begin
  Result:= ValueStr;
  if ValueStr = '' then
     Exit;

  if Result[1] = '"' then
     Delete(Result, 1, 1);

  if Result[Length(Result)] = '"' then
     Delete(Result, Length(Result), 1);
end;

function ExtractMAMEIniValue(const MAMEOption: String): String;
var
  Index: Integer;
begin
  Index:= PosEx(' ', MAMEOption);
  if Index <> 0 then
     begin
        Result:= MAMEOption;
        Delete(Result, 1, Index);
        Result:= Trim(Result);
     end
  else
     Result:= '';
end;

function GetGameHistory(const GameName, StringLine: String; TagLength: Integer): Boolean;
var
  Loop, StringSize: Integer;
  HistoryName: String;
begin
  // for history.dat (not used by history.xml)
  Result:= False;
  HistoryName:= '';
  StringSize:= Length(StringLine);
  for Loop:=TagLength+2 to StringSize do
  begin
    if (StringLine[Loop] <> ',') and (Loop < StringSize) then
       HistoryName:= HistoryName+StringLine[Loop]
    else
       begin
         if (StringLine[Loop] <> ',') and (Loop = StringSize) then
            HistoryName:= HistoryName+StringLine[Loop];
         case SameText(Trim(HistoryName), GameName) of
           True:
             begin
               Result:= True;
               Break;
             end;
           False: HistoryName:= '';
         end;
       end;
  end;
end;

function GetPlayTime(Milliseconds: Int64; ShowHoursDays: Boolean = False; HideSeconds: Boolean = False): String;
var
  //Years, Months, Weeks: Int64;
  Days, Hours, Minutes, Seconds, Sec: Int64;
  //tLeft: Int64;
begin
{
from MAME Plus!

hour = temp / 3600;
	temp = temp - 3600*hour;
	minute = temp / 60; //Calc Minutes
	second = temp - 60*minute;

	if (hour == 0)
		swprintf(buf, TEXT("%d:%02d"), minute, second );
	else
		swprintf(buf, TEXT("%d:%02d:%02d"), hour, minute, second );
}
  Sec:= Milliseconds div 1000;
  Days:= Sec div (3600*24);

  //Weeks:= Days div 7;
  //Months:= Weeks div 4;
  //Years:= Months div 12;

  Hours:= (Sec-((Days*(3600*24)))) div 3600;
  Minutes:= (Sec-((Days*(3600*24))+(Hours*3600))) div 60;
  Seconds:= (Sec-((Days*(3600*24))+(Hours*3600)+(Minutes*60)));

  //case StatusTimer of
  //  True: Result:= Format('%.2d:%.2d', [Minutes, Seconds])
  //  False: Result:= Format('%.2d:%.2d min', [Minutes, Seconds]);
  //end;

  //if Days > 0 then
  //   begin
  //     Result:= Format('%d Years, %d Months, %d Weeks, %d Days, %.2d:%.2d:%.2d', [Years, Months, Weeks, Days, Hours, Minutes, Seconds]);
  //     Exit;
  //   end;
  case ShowHoursDays of
    True:
      begin
        case HideSeconds of
          False: Result:= Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);
          True : Result:= Format('%.2d:%.2d', [Hours, Minutes]);
        end;
      end;
    False:
      begin
        Result:= Format('%.2d:%.2d', [Minutes, Seconds]);
      end;
  end;
  //if ShowHoursDays then
  //   Result:= Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds])
  //else
  //   Result:= Format('%.2d:%.2d', [Minutes, Seconds]);
  if (Days > 0) and ShowHoursDays then
     begin
       if Days > 1 then
          Result:= IntToStr(Days)+' days, '+Result
       else
          Result:= IntToStr(Days)+' day, '+Result;
     end;
end;

function ComputeHashValueMemoryStream(Mode: Integer; const mStreamHolder: TMemoryStream): String;
var
  Checksum: TMessageDigest;
  Stream: TMemoryStream;
begin
  // "No Authentication" mode
  Result:= '';

  if ((Mode < Low(ChecksumMode)) or (Mode > High(ChecksumMode))) or
     (mStreamHolder = nil) then
     Exit;
  try
    Checksum:= ChecksumMode[Mode].Create;
    Stream:= TMemoryStream.Create;
    Stream.LoadFromStream(mStreamHolder);
    Stream.Seek(0, soFromBeginning);
    Checksum.TransformStream(Stream);
    Checksum.Complete;
    FreeAndNil(Stream);
    Result:= LowerCase(Checksum.HashValue);
    FreeAndNil(Checksum);
  except
    FreeAndNil(Stream);
    FreeAndNil(Checksum);
  end;
end;

function ComputeHashValue(Mode: Integer; const FileName: WideString): String;
var
  Checksum: TMessageDigest;
  Stream: TWideFileStream;
begin
  // "No Authentication" mode
  Result:= '';
  if ((Mode < Low(ChecksumMode)) or (Mode > High(ChecksumMode))) or
     (not FileExistsW(FileName)) then
     Exit;
  try
    Checksum:= ChecksumMode[Mode].Create;
    Stream:= TWideFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    Stream.Seek(0, soFromBeginning);
    Checksum.TransformStream(Stream);
    Checksum.Complete;
    FreeAndNil(Stream);
    Result:= LowerCase(Checksum.HashValue);
    FreeAndNil(Checksum);
  except
    FreeAndNil(Stream);
    FreeAndNil(Checksum);
  end;
end;

function GetSHA1_ValueMemoryStream(const mStream: TMemoryStream): String;
begin
  Result:= '';
  if mStream = nil then
     Exit;
  try
    Result:= ComputeHashValueMemoryStream(3, mStream);
  except
    Result:= '';
  end;
end;

function GetSHA1_Value(const strFileName: WideString): String;
begin
  Result:= '';
  if not FileExistsW(strFileName) then
     Exit;
  try
    Result:= ComputeHashValue(3, strFileName);
  except
    Result:= '';
  end;
end;

function GetMD5_Value(const strFileName: WideString): String;
begin
  Result:= '';
  if not FileExistsW(strFileName) then
     Exit;
  try
    Result:= ComputeHashValue(2, strFileName);
  except
    Result:= '';
  end;
end;

function CheckAndCreateFolder(const FolderString: String): Boolean;
begin
  Result:= ForceDirectories(FolderString);
end;

function CompareIntValue(const A, B: Int64): ShortInt;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

function CompareFloatValue(const A, B: Extended): ShortInt;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

function CompareTDateTime(const A, B: TDateTime): Integer;
begin
  if A = B then
     Result:= 0 // equal value
  else
  if A < B then
     Result:= -1
  else
     Result:= 1;
end;

procedure SetSelectedColorBox(ColorBoxHolder: TColorBoxEx; Color: TColor; SetSelectedColor: Boolean = True);
begin
  if SetSelectedColor then
     ColorBoxHolder.Selected:= Color;
  if Assigned(ColorBoxHolder.OnSelect) then
     ColorBoxHolder.OnSelect(ColorBoxHolder);
end;

procedure SetSelectedComboBox(sIndex: ShortInt; ComboBoxHolder: TComboBox2Ex);
begin
  if sIndex = -1 then
     Exit; // invalid value
  ComboBoxHolder.ItemIndex:= sIndex;
  if Assigned(ComboBoxHolder.OnSelect) then
     ComboBoxHolder.OnSelect(ComboBoxHolder);
end;

procedure SetSelectedGaugeBar(iPosition: Integer; GaugeBarSource: TGaugeBar);
begin
  GaugeBarSource.Position:= iPosition;
  if Assigned(GaugeBarSource.OnChange) then
     GaugeBarSource.OnChange(GaugeBarSource);
end;

procedure SetSelectedGaugeBar(iPosition: Integer; GaugeBarSource: TGaugeBar2);
begin
  GaugeBarSource.Position:= iPosition;
  if Assigned(GaugeBarSource.OnChange) then
     GaugeBarSource.OnChange(GaugeBarSource);
end;

function XML_CheckData(const strLine, FieldEntry: String): Boolean;
begin
  Result:= Copy(strLine, 1, Length(FieldEntry)) = FieldEntry;
end;

function XML_GetEntryName(const strLine: String): String;
var
  Index: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       if strLine[1] <> '#' then
          begin
            Index:= PosEx(' ', strLine);
            if Index <> 0 then
               Result:= Copy(strLine, 1, Index-1);
          end;
     end;
end;

function XML_GetEntryValue(const strLine, EntryName: String): String;
var
  strPosition: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       strPosition:= PosEx(EntryName+'="', strLine);
       if strPosition <> 0 then
          begin
            strPosition:= strPosition+(Length(EntryName)+1);
            Result:= strLine;
            Delete(Result, 1, strPosition);
            Result:= Copy(Result, 1, PosEx('"', Result)-1);
            if Result = '' then
               Result:= '';
          end;
     end;
end;

function ListInfo_GetEntryValue(strLine, EntryName, TagCharacter: String): String;
var
  strPosition: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       strPosition:= PosEx(EntryName+' ', strLine);
       if strPosition <> 0 then
          begin
            strPosition:= strPosition+(Length(EntryName)+1);
            while (strLine[strPosition] <> TagCharacter) do
            begin
              Result:= Result+strLine[strPosition];
              Inc(strPosition);
              if strPosition > Length(strLine) then
                 Break;
            end;
          end;
     end;
end;

function SoftListGetEntryValue(strLine, EntryName: String): String;
var
  strPosition, strPosition2: Integer;
begin
  Result:= '';
  if strLine <> '' then
     begin
       // <title>3D Mine Storm</title>
       strPosition:= PosEx('<'+EntryName+'>', strLine);
       if strPosition <> 0 then
          begin
            strPosition2:= PosEx('/>', strLine, StrPosition);
            if strPosition2 = 0 then
               Exit;
            strPosition:= strPosition+Length(EntryName)+2;
            Result:= Copy(strLine, strPosition, (strPosition2-strPosition));
          end;
     end;
end;

// this function is used by the resolution list in SEGA Model 2 Emulator settings screen!
procedure ListScreenModes(ListHolder: TStrings; ResolutionOnly: Boolean = False);
var
  n: dWord;
  Mode: TDEVMODE;
  strOutput: String;
  AddMode: Boolean;
begin
  n:= 1;
  ListHolder.BeginUpdate;
  while EnumDisplaySettings(nil, n, Mode) do
  begin
    AddMode:= True;
    // false return width X height @ refresh
    strOutput:= IntToStr(Mode.dmPelsWidth)+'x'+IntToStr(Mode.dmPelsHeight);
    if not ResolutionOnly then
       strOutput:= strOutput+'@'+IntToStr(Mode.dmDisplayFrequency);

    if ResolutionOnly and (Mode.dmBitsPerPel <> 32) then
       AddMode:= False;

    if AddMode then
       begin
         if ListHolder.IndexOf(strOutput) = -1 then
            ListHolder.Add(strOutput);
       end;
    Inc(n);
  end;
  ListHolder.EndUpdate;

  //IntToStr(Mode.dmPelsWidth)+'x'+IntToStr(Mode.dmPelsHeight)+'@'+
  //IntToStr(Mode.dmDisplayFrequency)+'Hz '+
  //IntToStr(Mode.dmBitsPerPel)+' bits');
end;

function GetImageCategoryTitle(CategoryIndex: Byte): String;
begin
  Result:= ImageCategoryArray[CategoryIndex, 5];
end;

function GetScrLayoutSection(LayoutIndex: Byte): String;
begin
  case LayoutIndex of
    00: Result:= 'Single';
    01: Result:= 'Dual [Layout 1]';
    02: Result:= 'Dual [Layout 2]';

    03: Result:= 'Triple [Layout 1]';
    04: Result:= 'Triple [Layout 2]';
    05: Result:= 'Triple [Layout 3]';
    06: Result:= 'Triple [Layout 4]';
    07: Result:= 'Triple [Layout 5]';
    08: Result:= 'Triple [Layout 6]';

    09: Result:= 'Quad [Layout 1 Hor]';
    10: Result:= 'Quad [Layout 1 Vert]';
    11: Result:= 'Quad [Layout 2]';
    12: Result:= 'Quad [Layout 3]';
    13: Result:= 'Quad [Layout 4]';
    14: Result:= 'Quad [Layout 5]';
    15: Result:= 'Quad [Layout 6]';
    16: Result:= 'Quad [Layout 7]';
    17: Result:= 'Quad [Layout 8]';
    18: Result:= 'Quad [Layout 9]';
    19: Result:= 'Quad [Layout 10]';
    20: Result:= 'Quad [Layout 11]';
    21: Result:= 'Quad [Layout 12]';
    22: Result:= 'Quad [Layout 13]';
    23: Result:= 'Quad [Layout 14]';
    24: Result:= 'Quad [Layout 15]';
    25: Result:= 'Quad [Layout 16]';
    26: Result:= 'Quad [Layout 17]';
  end;
end;

function GetScrLayoutImageFile(LayoutIndex: Byte; ImageExtension: Boolean = True): String;
begin
  case LayoutIndex of
    00: Result:= 'img1_layout1';
    01: Result:= 'img2_layout1';
    02: Result:= 'img2_layout2';

    03: Result:= 'img3_layout1';
    04: Result:= 'img3_layout2';
    05: Result:= 'img3_layout3';
    06: Result:= 'img3_layout4';
    07: Result:= 'img3_layout5';
    08: Result:= 'img3_layout6';

    09: Result:= 'img4_layout1_hor';
    10: Result:= 'img4_layout1_vert';
    11: Result:= 'img4_layout2';
    12: Result:= 'img4_layout3';
    13: Result:= 'img4_layout4';
    14: Result:= 'img4_layout5';
    15: Result:= 'img4_layout6';
    16: Result:= 'img4_layout7';
    17: Result:= 'img4_layout8';
    18: Result:= 'img4_layout9';
    19: Result:= 'img4_layout10';
    20: Result:= 'img4_layout11';
    21: Result:= 'img4_layout12';
    22: Result:= 'img4_layout13';
    23: Result:= 'img4_layout14';
    24: Result:= 'img4_layout15';
    25: Result:= 'img4_layout16';
    26: Result:= 'img4_layout17';
  end;
  case ImageExtension of
    True : Result:= Result+'.png';
    False: Result:= Result+'.ico';
  end;
end;

function GetScrLayoutDefaultType(LayoutIndex, ImageIndex: Byte): ShortInt;
begin
  Result:= -1;
  case LayoutIndex of
    0: Result:= 1; // Single
    1, 2: // Dual [Layout 1] >---< Dual [Layout 2]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
        end;
      end;
    3: // Triple [Layout 1]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 3;
        end;
      end;
    4: // Triple [Layout 2]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 4;
        end;
      end;
    5, 6: // Triple [Layout 3] >---< Triple [Layout 4]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 0;
          3: Result:= 2;
        end;
      end;
    7, 8: // Triple [Layout 5] >---< Triple [Layout 6]
      begin
        case ImageIndex of
          1: Result:= 1;
          2: Result:= 3;
          3: Result:= 4;
        end;
      end;
    9: // Quad [Layout 1 Hor]
      begin
        case ImageIndex of
          1: Result:= 0; // title snap (Images)
          2: Result:= 2; // marquee    (ImageScr[2])
          3: Result:= 1; // game snap  (ImageScr[3])
          4: Result:= 3; // flyer      (ImageScr[4])
        end;
      end;
    10: // Quad [Layout 1 Vert]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 2; // marquee    (ImageScr[2])
          3: Result:= 0; // title snap (ImageScr[3])
          4: Result:= 3; // flyer      (ImageScr[4])
        end;
      end;
    11, 12: // Quad [Layout 2] >---< Quad [Layout 3]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 3; // flyer      (ImageScr[3])
          4: Result:= 2; // marquee    (ImageScr[4])
        end;
      end;
    13, 14: // Quad [Layout 4] >--< Quad [Layout 5]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 3; // flyer      (ImageScr[3])
          4: Result:= 4; // cabinet    (ImageScr[4])
        end;
      end;
    15, 16, 17, 18: // Quad [Layout 6] >--< Quad [Layout 7] >--< Quad [Layout 8] >--< Quad [Layout 9]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 2; // marquee    (ImageScr[3])
          4: Result:= 4; // cabinet    (ImageScr[4])
        end;
      end;
    19, 20, 21, 22: // Quad [Layout 10] >--< Quad [Layout 11] >--< Quad [Layout 12] >--< Quad [Layout 13]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 3; // flyer      (ImageScr[3])
          4: Result:= 2; // marquee    (ImageScr[4])
        end;
      end;
    23: // Quad [Layout 14]
      begin
        case ImageIndex of
          1: Result:= 0; // game title (Images)
          2: Result:= 1; // game snap  (ImageScr[2])
          3: Result:= 3; // flyer      (ImageScr[3])
          4: Result:= 4; // cabinet    (ImageScr[4])
        end;
      end;
    24: // Quad [Layout 15]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 2; // marquee    (ImageScr[3])
          4: Result:= 3; // fyler      (ImageScr[4])
        end;
      end;
    25, 26: // Quad [Layout 16] >--< Quad [Layout 17]
      begin
        case ImageIndex of
          1: Result:= 1; // game snap  (Images)
          2: Result:= 0; // game title (ImageScr[2])
          3: Result:= 3; // flyer      (ImageScr[3])
          4: Result:= 4; // cabinet    (ImageScr[4])
        end;
      end;
  end;
end;

function GetScrLayoutAltVerticalDefault(LayoutIndex: Byte): ShortInt;
begin
  Result:= -1; // undefined
  case LayoutIndex of
    01: Result:= 02; // Dual [Layout 1]
    02: Result:= 01; // Dual [Layout 2]

    03: Result:= 04; // Triple [Layout 1]
    04: Result:= 03; // Triple [Layout 2]
    05: Result:= 07; // Triple [Layout 3]
    06: Result:= 08; // Triple [Layout 4]
    07: Result:= 05; // Triple [Layout 5]
    08: Result:= 06; // Triple [Layout 6]

    09: Result:= 10; // Quad [Layout 1 Hor]
    10: Result:= 09; // Quad [Layout 1 Vert]
    11: Result:= 13; // Quad [Layout 2]
    12: Result:= 14; // Quad [Layout 3]
    13: Result:= 11; // Quad [Layout 4]
    14: Result:= 12; // Quad [Layout 5]
    15: Result:= 19; // Quad [Layout 6]
    16: Result:= 21; // Quad [Layout 7]
    17: Result:= 20; // Quad [Layout 8]
    18: Result:= 22; // Quad [Layout 9]
    19: Result:= 15; // Quad [Layout 10]
    20: Result:= 17; // Quad [Layout 11]
    21: Result:= 16; // Quad [Layout 12]
    22: Result:= 18; // Quad [Layout 13]
    23: Result:= 24; // Quad [Layout 14]
    24: Result:= 23; // Quad [Layout 15]
    25: Result:= 13; // Quad [Layout 16]
    26: Result:= 14; // Quad [Layout 17]
  end;
end;

function IsWin10: Boolean;
var
  //VerInfo: TOSVersionInfo;
  iStr, VersionStr: String;
  iMajorVersion{, iMinorVersion}: DWORD;
  iBuildNumber: Integer;
begin
  //Result:= False;
  iMajorVersion:= 0;
  //iMinorVersion:= 0;
  iBuildNumber:= 0;
  VersionStr:= '';

  with TRegistry.Create(KEY_READ) do
  begin
    try
      RootKey:= HKEY_LOCAL_MACHINE;
      if OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
      begin
        if ValueExists('CurrentMajorVersionNumber') then
           iMajorVersion:= ReadInteger('CurrentMajorVersionNumber');

        CloseKey;

        //if OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
        //begin
        //  if ValueExists('CurrentMinorVersionNumber') then
        //     iMinorVersion:= ReadInteger('CurrentMinorVersionNumber');
        //  //if iStr <> '' then
        //  //   iMinorVersion:= StrToInt64(istr);
        //  CloseKey;
        //end;
      end;

      if iMajorVersion = 0 then
      begin
        if OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
        begin
          if ValueExists('CurrentVersion') then
             VersionStr:= ReadString('CurrentVersion');
          CloseKey;
        end;
      end;

      if OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
      begin
        if ValueExists('ReleaseId') then
        begin
          iStr:= ReadString('ReleaseId');
          if iStr <> '' then
             iBuildNumber:= StrToInt(iStr);
        end;
        CloseKey;

        {if iStr = '' then
        begin
          if OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
          begin
            if ValueExists('CurrentBuildNumber') then
            begin
              iStr:= ReadString('CurrentBuildNumber');
              if iStr <> '' then
                 iBuildNumber:= StrToInt(iStr);
            end;
            CloseKey;
          end;
          if iStr = '' then
             if OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
             begin
               // fallback to "CurrentBuild" if "CurrentBuildNumber" doesn't exist
               if ValueExists('CurrentBuild') then
               begin
                 iStr:= ReadString('CurrentBuild');
                 if iStr <> '' then
                    iBuildNumber:= StrToInt(iStr);
               end;
               CloseKey;
             end;
        end;}
      end;
    finally
      Free;
    end;
  end;
  if VersionStr = '' then
     Result:= iMajorVersion = 10
  else
     Result:= SameText(VersionStr, '6.3');

  if Result then
     Result:= (iBuildNumber >= 1809); // only Win10 build 1809 or never have dark mode support for "Windows Explorer"

  // for debugging only, do not enable
  //ShowMessageW('Major Version: '+IntToStr(iMajorVersion)+#13#10+
  //             'Minor Version: '+IntToStr(iMinorVersion)+#13#10+
  //             'Current Build: '+IntToStr(iBuildNumber));
end;

function CheckReadOnly(const FileString: WideString): Boolean;
var
  FileAttributes: Word;
begin
  //FileIsReadOnly(FileString); ????????
  Result:= FileExistsW(FileString);
  if not Result then
     Exit;
  FileAttributes:= FileGetAttr(FileString);
  Result:= (FileAttributes and faReadOnly) = faReadOnly;
  //Result:= (FileAttributes and faArchive) = faArchive;
  //Result:= (FileAttributes and faSysFile) = faSysFile;
  //Result:= (FileAttributes and faHidden) = faHidden;
end;

// FileExists need fix for Delphi 7... for Delphi 2007 they are already fixed!!!!!
function FileExists(const FileName: String): Boolean;
var
  Code: Cardinal;
begin
  // faster than original Delphi 7 "FileExists()" function
  Code:= GetFileAttributes(PChar(FileName));
  //Result:= (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  Result:= (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  // Code will never return negative values!!!
end;

function FileExists2(const FileName: WideString): Boolean;
var
  Code: Cardinal;
begin
  // faster than original Delphi 7 "FileExists()" function
  Code:= GetFileAttributesW(PWideChar(FileName));
  //Result:= (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  Result:= (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code = 0);
  // Code will never return negative values!!!
end;

// doesn't work!!! (October 28, 2017)
//function CopyFile(const OldName, NewName: WideString; OverwriteExistingFile: Boolean = True): Boolean;
//var
//  rFlags: Cardinal;
//  CopyCancel: Boolean;
//begin
//  CopyCancel:= False;
//  rFlags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
//  if OverwriteExistingFile then
//     rFlags:= rFlags+MOVEFILE_REPLACE_EXISTING;
//
//  Result:= CopyFileExW(PWideChar(OldName), PWideChar(NewName), nil, nil, @CopyCancel, rFlags);
//end;

// RenameFile fix for Windows 7 (Delphi 7 function fails constantly)
function RenameFile(const OldName, NewName: String; OverwriteExistingFile: Boolean = True): Boolean;
var
  rFlags: Cardinal;
begin
  rFlags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExistingFile then
     rFlags:= rFlags+MOVEFILE_REPLACE_EXISTING;

  Result:= MoveFileEx(PAnsiChar(OldName), PAnsiChar(NewName), rFlags);
end;
// note: RenameFileW() function for Unicode alredy exists! MoveFileW() does not (March 07, 2017)

function MoveFile(const OldName, NewName: String; OverwriteExisting: Boolean): Boolean;
var
  flags: Cardinal;
begin
  flags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExisting then
     flags:= flags+MOVEFILE_REPLACE_EXISTING;
  Result:= MoveFileEx(PAnsiChar(OldName), PAnsiChar(NewName),
                      flags);//MOVEFILE_COPY_ALLOWED
                      //+MOVEFILE_REPLACE_EXISTING
                      //+MOVEFILE_WRITE_THROUGH);
end;

procedure SetDefaultColorBox(const ColorHolder: TColorBoxEx);
begin
  ColorHolder.Selected:= ColorHolder.DefaultColorColor;
  if Assigned(ColorHolder.OnSelect) then
     ColorHolder.OnSelect(ColorHolder);
end;

function SelectDirectoryShell(const Caption: String; RecursiveSubFolders: Boolean; out Directory: String; out AddSubFolders: Boolean; RootFolder: WideString = ''): Boolean;
begin
  if not Assigned(FormSelectDirectory) then
     FormSelectDirectory:= TFormSelectDirectory.Create(nil);
  FormSelectDirectory.AddSubFolders.Visible:= RecursiveSubFolders;
  FormSelectDirectory.LabelTitle.Caption:= Caption;
  if RootFolder <> '' then
     FormSelectDirectory.ShellTree.Root:= RootFolder;

  Result:= FormSelectDirectory.ShowModal = mrOK;
  case Result of
    True:
      begin
        Directory:= FormSelectDirectory.ShellTree.SelectedFolder.PathName;
        AddSubFolders:= FormSelectDirectory.AddSubFolders.Checked;
      end;
    False: Directory:= '';
  end;
  //if RootFolder <> '' then
  //   FormSelectDirectory.ShellTree.Root:= '';
  FreeAndNil(FormSelectDirectory);
end;

procedure CallMaximizeWindow(FormSource: TForm);
begin
  FormSource.Left:= (Screen.Width shr 1)-(FormSource.Width shr 1)-1;
  if Is4KMode then
     begin
       FormSource.Top:= 100;
       FormSource.Height:= Screen.Height-200;
     end
  else
     begin
       FormSource.Top:= 50;
       FormSource.Height:= Screen.Height-120;
     end;
end;

procedure CallCenterWindow(FormSource: TForm; IgnoreWindowsTaskBar: Boolean = False);
var
  iScreenW, iScreenH: Integer;
begin
  iScreenW:= Screen.Width;
  if IgnoreWindowsTaskBar then
     iScreenH:= Screen.Height
  else
     iScreenH:= Screen.WorkAreaHeight;

  if iScreenW > FormSource.Width then
     FormSource.Left:= (iScreenW-FormSource.Width) div 2
  else
     FormSource.Left:= (Screen.Width shr 1)-(FormSource.Width shr 1)-1;

  if iScreenH > FormSource.Height then
     FormSource.Top:= (iScreenH-FormSource.Height) div 2
  else
     FormSource.Top:=  (iScreenH shr 1)-(FormSource.Height shr 1)-1;
end;

procedure SetEditBkColor(EditHolder: TEditEx);
begin
  EditHolder.Color:= $e67878; // -> 15104120; RGB(120, 120, 255)
  EditHolder.SetFocus;
end;

procedure SetEditBkColor(EditHolder: TtntEditEx);
begin
  EditHolder.Color:= $e67878; // -> 15104120; RGB(120, 120, 255)
  EditHolder.SetFocus;
end;

function IsEditEditing(EditHolder: TEditEx): Boolean;
begin
  Result:= EditHolder.Color = $e67878;
end;

function IsEditEditing(EditHolder: TTntEditEx): Boolean;
begin
  Result:= EditHolder.Color = $e67878;
end;

function ShortDirString(const FileFullPath: String; MaxLength: Integer): String;
var
  NewPathStr, FileName: String;
  NewLength: Integer;
begin
  if Length(FileFullPath) <= MaxLength then
     begin
       Result:= FileFullPath;
       Exit;
     end;
  FileName:= ExtractFileName(FileFullPath);
  NewLength:= MaxLength-Length(FileName);
  NewPathStr:= Copy(FileFullPath, 1, NewLength)+'...\'+FileName;
  Result:= NewPathStr;
end;

function LengthW(const ws: WideString): Integer;
begin
  Result:= 0;
  if ws <> '' then
     Result:= Length(ws) * SizeOf(ws[1]);
end;

function ShortDirStringW(const FileFullPath: WideString; MaxLength: Integer): WideString;
var
  NewPathStr, FileName: WideString;
  NewLength: Integer;
begin

  if Length(FileFullPath) <= MaxLength then
     begin
       Result:= FileFullPath;
       Exit;
     end;
  FileName:= ExtractFileNameW(FileFullPath);
  NewLength:= MaxLength-Length(FileName);
  NewPathStr:= Copy(FileFullPath, 1, NewLength)+'...\'+FileName;
  Result:= NewPathStr;
end;

{
function SetScreenAspectRatio(ImageHolder: TBitmap32; out FixedWidth, FixedHeight: Integer): Boolean;
var
  driverPixelX, driverPixelY,
  //snapPixelX, snapPixelY,
  //realPixelX, realPixelY,
  aspectX, aspectY,
  Position: Integer;
begin
  Position:= Pos('x', MemGameInfo.eScreenResolution);
  driverPixelX:= StrToInt(Copy(MemGameInfo.eScreenResolution, 1, Position-1));
  driverPixelY:= StrToInt(Copy(MemGameInfo.eScreenResolution, Position+1, Length(MemGameInfo.eScreenResolution)-Position));
  if ((driverPixelX <> ImageHolder.Width) and (driverPixelY <> ImageHolder.Height)) and
     ((ImageHolder.Width > driverPixelX) or (ImageHolder.Height > driverPixelY)) then
     Exit;

  if driverPixelX >= driverPixelY then
     begin
       aspectX:= 4;
       aspectY:= 3;
     end
  else
  if driverPixelX < driverPixelY then
     begin
       aspectX:= 3;
       aspectY:= 4;
     end;
  //if (snapPixelX < 1) or (snapPixelY < 1) then
  //   begin
  //     snapPixelX:= ResWidth;
  //     snapPixelY:= ResHeight;
  //   end;

  //realPixelX:= ImageHolder.Width;
  //realPixelY:= ImageHolder.Height;

  if (Round(driverPixelY / 2 ) = ImageHolder.Height) and (ImageHolder.Width = driverPixelX) then // cropped playchoice, etc
     begin
       // "aquarush 640x240 driver 640x480 enters this case but height is not resized
       if (ImageHolder.Width / aspectX) > (ImageHolder.Height / (aspectY / 2)) then
          begin
            FixedHeight:= Round((ImageHolder.Width / aspectX) * (aspectY / 2));
            FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / (aspectY / 2)) * aspectX);
            FixedHeight:= ImageHolder.Height;
          end;
     end
  else
  if (Round(driverPixelX / 2 ) = ImageHolder.Width) and (ImageHolder.Height = driverPixelY) then // lode runner, etc
     begin
       if (ImageHolder.Width / (aspectX / 2)) > (ImageHolder.Height / aspectY) then
          begin
            FixedHeight:= Round((ImageHolder.Width / (aspectX / 2)) * aspectY);
            FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / aspectY) * (aspectX / 2));
            FixedHeight:= ImageHolder.Height;
          end;
     end
  else
  if (ImageHolder.Width / aspectX) <> (ImageHolder.Height / aspectY) then
     begin
       if (ImageHolder.Width / aspectX) > (ImageHolder.Height / aspectY) then
          begin
             FixedHeight:= Round((ImageHolder.Width / aspectX) * aspectY);
             FixedWidth:= ImageHolder.Width;
          end
       else
          begin
            FixedWidth:= Round((ImageHolder.Height / aspectY) * aspectX);
            FixedHeight:= ImageHolder.Height;
          end;
     end;
end;

// Originally written by Horst Kniebusch, modified by alioth to make it(alot) faster.
// usage: Antialiasing(Image1, 80);

procedure Antialiasing(Image: TImage; Percent: Integer);
type
  TRGBTripleArray = array[0..32767] of TRGBTriple;
  PRGBTripleArray = ^TRGBTripleArray;
var
  SL, SL2: PRGBTripleArray;
  l, m, p: Integer;
  R, G, B: TColor;
  R1, R2, G1, G2, B1, B2: Byte;
begin
  with Image.Canvas do
  begin
    Brush.Style  := bsClear;
    Pixels[1, 1] := Pixels[1, 1];
    for l := 0 to Image.Height - 1 do
    begin
      SL := Image.Picture.Bitmap.ScanLine[l];
      for p := 1 to Image.Width - 1 do
      begin
        R1 := SL[p].rgbtRed;
        G1 := SL[p].rgbtGreen;
        B1 := SL[p].rgbtBlue;

        // Left
        if (p < 1) then m := Image.Width
        else
          m := p - 1;
        R2 := SL[m].rgbtRed;
        G2 := SL[m].rgbtGreen;
        B2 := SL[m].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL[m].rgbtRed := R;
          SL[m].rgbtGreen := G;
          SL[m].rgbtBlue := B;
        end;

        //Right
        if (p > Image.Width - 2) then m := 0
        else
          m := p + 1;
        R2 := SL[m].rgbtRed;
        G2 := SL[m].rgbtGreen;
        B2 := SL[m].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL[m].rgbtRed := R;
          SL[m].rgbtGreen := G;
          SL[m].rgbtBlue := B;
        end;

        if (l < 1) then m := Image.Height - 1
        else
          m := l - 1;
        //Over
        SL2 := Image.Picture.Bitmap.ScanLine[m];
        R2  := SL2[p].rgbtRed;
        G2  := SL2[p].rgbtGreen;
        B2  := SL2[p].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL2[p].rgbtRed := R;
          SL2[p].rgbtGreen := G;
          SL2[p].rgbtBlue := B;
        end;

        if (l > Image.Height - 2) then m := 0
        else
          m := l + 1;
        //Under
        SL2 := Image.Picture.Bitmap.ScanLine[m];
        R2  := SL2[p].rgbtRed;
        G2  := SL2[p].rgbtGreen;
        B2  := SL2[p].rgbtBlue;
        if (R1 <> R2) or (G1 <> G2) or (B1 <> B2) then
        begin
          R := Round(R1 + (R2 - R1) * 50 / (Percent + 50));
          G := Round(G1 + (G2 - G1) * 50 / (Percent + 50));
          B := Round(B1 + (B2 - B1) * 50 / (Percent + 50));
          SL2[p].rgbtRed := R;
          SL2[p].rgbtGreen := G;
          SL2[p].rgbtBlue := B;
        end;
      end;
    end;
  end;
end;}

function DarkenColor(Color: TColor; Perc: Integer): TColor;
var
  r, g, b: Integer;//longint;
  l: Longint;
begin
  l := ColorToRGB(Color);
  r := ((l AND $FF0000) shr 16) and $FF;
  g := ((l AND $FF00) shr 8) and $FF;
  b := (l AND $FF);

  r := Round(r * (100 - Perc)/100);
  g := Round(g * (100 - Perc)/100);
  b := Round(b * (100 - Perc)/100);

  Result := (r shl 16) or (g shl 8) or b;
end;

function BrightenColor(Color: TColor; Factor: Integer): TColor;
const
  MaxFactor = 100;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then             // 0 = no changes
  begin
    if Factor > MaxFactor then
       Factor := MaxFactor;
    Result := (          (((255 - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ((Color shr  8) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ( Color         and $FF)) * Factor) div MaxFactor));
    Result := Color + Result;
  end
  else
    Result := Color;
end;

{function BrightnessColor(Col: TColor; Brightness: Integer): TColor; overload;
var
  r1, g1, b1: Integer;
begin
  Col := ColorToRGB(Col);
  r1  := GetRValue(Col);
  g1  := GetGValue(Col);
  b1  := GetBValue(Col);

  if r1 = 0 then
     r1 := Max(0,Brightness)
  else
     r1 := Round( Min(100,(100 + Brightness))/100 * r1 );

  if g1 = 0 then
     g1 := Max(0,Brightness)
  else
     g1 := Round( Min(100,(100 + Brightness))/100 * g1 );

  if b1 = 0 then
     b1 := Max(0,Brightness)
  else
     b1 := Round( Min(100,(100 + Brightness))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;

function BrightnessColor(Col: TColor; BR, BG, BB: Integer): TColor; overload;
var
  r1, g1, b1: Integer;
begin
  Col := Longint(ColorToRGB(Col));
  r1  := GetRValue(Col);
  g1  := GetGValue(Col);
  b1  := GetBValue(Col);

  if r1 = 0 then
    r1 := Max(0,BR)
  else
    r1 := Round( Min(100,(100 + BR))/100 * r1 );

  if g1 = 0 then
    g1 := Max(0,BG)
  else
    g1 := Round( Min(100,(100 + BG))/100 * g1 );

  if b1 = 0 then
    b1 := Max(0,BB)
  else
    b1 := Round( Min(100,(100 + BB))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;}

function Blend(Color1, Color2: TColor; A: Byte): TColor;
var
  c1, c2: Integer;
  R, G, B, v1, v2: Byte;
begin
  A  := Round(2.55 * A);
  c1 := ColorToRGB(Color1);
  c2 := ColorToRGB(Color2);
  v1 := Byte(c1);
  v2 := Byte(c2);
  R  := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 8);
  v2 := Byte(c2 shr 8);
  G  := Byte(A * (v1 - v2) shr 8 + v2);
  v1 := Byte(c1 shr 16);
  v2 := Byte(c2 shr 16);
  B  := Byte(A * (v1 - v2) shr 8 + v2);
  Result := (B shl 16) + (G shl 8) + R;
end;

function GetContrastColor(ABGColor: TColor): TColor;
var
  ADouble: Double;
  R, G, B: Byte;
begin
  if ABGColor <= 0 then
  begin
    Result := clWhite;
    Exit;
  end;

  if ABGColor = clWhite then
  begin
    Result := clBlack;
    Exit;
  end;

  // Get RGB from Color
  R := GetRValue(ABGColor);
  G := GetGValue(ABGColor);
  B := GetBValue(ABGColor);

  // Counting the perceptive luminance - human eye favors green color...
  ADouble := 1 - (0.299 * R + 0.587 * G + 0.114 * B) / 255;

  if (ADouble < 0.5) then
    Result := clBlack  // bright colors - black font
  else
    Result := clWhite;  // dark colors - white font
end;

procedure GetIconToImage(IconSource: HIcon; IconImageSource: TImage; iWidth, iHeight: Integer);
const
  Mask: array[Boolean] of Longint = (0, ILC_MASK);
var
  ImgList: HIMAGELIST;
  Index: Integer;
begin
  // this is used by GetAppIconW()
  ImgList:= ImageList_Create(iWidth, iHeight, ILC_COLOR32 or Mask[True], 1, 1);
  try
    Index := ImageList_AddIcon(ImgList, IconSource);
    IconImageSource.Picture.Icon.Handle:= ImageList_GetIcon(ImgList, Index, ILD_NORMAL);
  finally
    ImageList_Destroy(ImgList);
  end;
end;

function ExtractIcon(const iFileName: String; var iHandleIcon: THandle; var iIconId: DWORD; IconWidth, IconHeight: Integer): Boolean;
begin
  Result:= PrivateExtractIcons(PChar(iFileName), 0, IconWidth, IconHeight, @iHandleIcon, @iIconId, 1, LR_LOADFROMFILE) <> 0; // <> 0 is success
end;

function GetAppIcon(const appEmuFile: String; ImageListHolder: TImageList; AlternateIconSize: Integer; ReplaceIndex: Integer = -1; IconImage: TImage = nil): Integer;
var
  hIcon  : THandle;
  nIconId: DWORD;
  appIcon: TIcon;
  ExtractResult: Boolean; // Cardinal;
  IsAltSize: Boolean;
  iSize: Integer;
begin
  Result:= -1;
  if not FileExistsW(appEmuFile) then
     Exit;

  //Extract a 48x48 icon ////////128x128 icon
  ExtractResult:= ExtractIcon(appEmuFile, hIcon, nIconId, ImageListHolder.Width, ImageListHolder.Height);
  //ExtractResult:= PrivateExtractIcons(PChar(appEmuFile), 0, ImageListHolder.Width, ImageListHolder.Height, @hIcon, @nIconId, 1, LR_LOADFROMFILE);
  IsAltSize:= not ExtractResult; //(ExtractResult <> 0);
  if IsAltSize then
     IsAltSize:= AlternateIconSize <> ImageListHolder.Width;
  if IsAltSize then
     ExtractResult:= ExtractIcon(appEmuFile, hIcon, nIconId, AlternateIconSize, AlternateIconSize);
     //ExtractResult:= PrivateExtractIcons(PChar(appEmuFile), 0, AlternateIconSize, AlternateIconSize, @hIcon, @nIconId, 1, LR_LOADFROMFILE);

  if not ExtractResult then // ExtractResult = 0 then // failed to extract icon
     begin
       DestroyIcon(hIcon);
       Exit;
     end;
     
  case IsAltSize of
    True : iSize:= AlternateIconSize;
    False: iSize:= ImageListHolder.Width;
  end;
  try
    appIcon:= TIcon.Create;
    //appIcon.Width:=  iSize; // no need for this
    //appIcon.Height:= iSize;
    appIcon.Handle:= hIcon;


    if ReplaceIndex <> -1 then
       begin
         Result:= ReplaceIndex;
         //ImageList_ReplaceIcon(ImageListHolder.Handle, ReplaceIndex, appIcon.Handle);
         ImageListHolder.ReplaceIcon(ReplaceIndex, appIcon); // ReplaceIndex = 3 ?
       end
    else
       Result:= ImageListHolder.AddIcon(appIcon);

    if IconImage <> nil then
       begin
         // this is not used anywhere, why keep it ? (May 12, 2021)
         if not IsAltSize then
            GetIconToImage(appIcon.Handle, IconImage, IconImage.Width, IconImage.Height)
         else
            GetIconToImage(appIcon.Handle, IconImage, AlternateIconSize, AlternateIconSize);
            //IconImage.Picture.Icon.Assign(appIcon); // doesn't work! :_((
            // IconImage.Picture.Icon.Handle:= appIcon.Handle; // doesn't work! :_((
       end;
  finally
    appIcon.ReleaseHandle;
    FreeAndNil(appIcon);
    DestroyIcon(hIcon);
  end;
end;

function GetExtIcon(const FileExtension: String; ImageListHolder: TImageList): Integer;
var
  appIcon: TIcon;
  AInfo: TSHFileInfo;
begin
  Result:= -1;
  appIcon:= TIcon.Create;
  appIcon.Width:= ImageListHolder.Width;
  appIcon.Height:= ImageListHolder.Height;

  if SHGetFileInfo(PChar(FileExtension), FILE_ATTRIBUTE_NORMAL, AInfo, SizeOf(AInfo),
                   SHGFI_SYSICONINDEX or SHGFI_ICON or SHGFI_LARGEICON or SHGFI_SHELLICONSIZE or SHGFI_USEFILEATTRIBUTES) <> 0 then
     begin
       try
         appIcon.Handle:= AInfo.hIcon;
         Result:= ImageListHolder.AddIcon(appIcon);
       finally
         appIcon.ReleaseHandle;
         FreeAndNil(appIcon);
         DestroyIcon(AInfo.hIcon);
       end;
     end;
end;

function GetAssociatedApp(fileExtension: String; ReturnExeFileOnly: Boolean = False): String;
var
  sExtDesc: String;
begin
  Result:= '';
  with TRegistry.Create do
  begin
    try
      RootKey:= HKEY_CLASSES_ROOT;
      if OpenKeyReadOnly(fileExtension) then
         begin
           sExtDesc:= ReadString('');
           CloseKey;
         end;
      if sExtDesc <> '' then
         begin
           if OpenKeyReadOnly(sExtDesc+'\Shell\Open\Command') then
              Result:= ReadString('');
         end;
    finally
      Free;
    end;
  end;

  if (Result <> '') and ReturnExeFileOnly then
     begin
       if Result[1] = '"' then
          Result:=Copy(Result, 2, -1+PosEx('"', Copy(Result, 2, MaxInt))) ;
     end;
end;

{
// for Unicode filenames
var
  ofn: TOpenFilenameW;
  FileName: array [0..MAX_PATH-1] of WideChar;
begin
  FillChar(ofn, SizeOf(ofn), 0);
  ofn.lStructSize := SizeOf(ofn);
  ofn.hWndOwner := Handle;
  ofn.lpstrFilter := 'All files'#0'*.*'#0;
  FileName[0] := #0;
  ofn.lpstrFile := @FileName;
  ofn.nMaxFile := Length(FileName);
  ofn.lpstrTitle := 'Select File';
  if GetOpenFileNameW(ofn) then
    MessageBoxW(Handle, FileName, nil, MB_OK);
}

function OpenSaveFileDialog(Parent: TWinControl; const DefExt, Filter, InitialDir, Title: String; var FileName: String;
                            MustExist, OverwritePrompt, NoChangeDir, DoOpen: Boolean): Boolean;
var
  ofn: TOpenFileName;
  szFile: array[0..MAX_PATH] of Char;
begin
  Result:= False;
  FillChar(ofn, SizeOf(TOpenFileName), 0);
  with ofn do
  begin
    lStructSize:= SizeOf(TOpenFileName);
    hwndOwner:= Application.Handle; // 2013: fix for modal forms
    //hwndOwner := Parent.Handle;
    lpstrFile:= szFile;
    nMaxFile:= SizeOf(szFile);
    if (Title <> '') then
       lpstrTitle:= PChar(Title);
    if (InitialDir <> '') then
       lpstrInitialDir:= PChar(InitialDir);
    StrPCopy(lpstrFile, FileName);
    lpstrFilter:= PChar( StringReplace(Filter, '|', #0, [rfReplaceAll]) +#0#0 );
    if DefExt <> '' then
       lpstrDefExt:= PChar(DefExt);
  end;

  ofn.Flags:= ofn.Flags or OFN_DONTADDTORECENT or OFN_EXPLORER;
  if MustExist then
     ofn.Flags:= ofn.Flags or OFN_FILEMUSTEXIST;

  if OverwritePrompt then
     ofn.Flags:= ofn.Flags or OFN_OVERWRITEPROMPT;

  if NoChangeDir then
    ofn.Flags:= ofn.Flags or OFN_NOCHANGEDIR;

  if DoOpen then
  begin
    if GetOpenFileName(ofn) then
    begin
      Result:= True;
      FileName:= StrPas(szFile);
    end;
  end
  else
  begin
    if GetSaveFileName(ofn) then
    begin
      Result:= True;
      FileName:= StrPas(szFile);
    end;
  end
end;

function GetFileTypeStr(const strFilename: String): String;
var
  FileInfo: TSHFileInfo;
begin
  FillChar(FileInfo, SizeOf(FileInfo), #0);
  SHGetFileInfo(PChar(strFilename), 0, FileInfo, SizeOf(FileInfo), SHGFI_TYPENAME);
  Result:= FileInfo.szTypeName;
end;

function GetWinTempDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetTempPath(SizeOf(Buffer), Buffer));
{$ELSE}
var
  Buffer: array[0..255] of Char;
begin
  GetTempFileName(GetTempDrive(#0), '$', 1, Buffer);
  Result:= ExtractFilePath(StrPas(Buffer));
{$ENDIF}
  Delete(Result, Length(Result), 1);
end;

function GetWindowsDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetWindowsDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0]:= Char(GetWindowsDirectory(@Result[1], 254));
{$ENDIF}
end;

function GetSystemDir: String;
{$IFDEF WIN32}
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result, Buffer, GetSystemDirectory(Buffer, SizeOf(Buffer)));
{$ELSE}
begin
  Result[0]:= Char(GetSystemDirectory(@Result[1], 254));
{$ENDIF}
end;

function GetMyDocuments: String;
var
  r: Bool;
  path: array[0..Max_Path] of Char;
begin
  r:= ShGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
  if not r then
     raise Exception.Create('Could not find MyDocuments folder location!');
  Result:= Path;
end;

{function ProcessExists(const exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize:= SizeOf(FProcessEntry32);
  ContinueLoop:= Process32First(FSnapshotHandle, FProcessEntry32);
  Result:= False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result:= True;
    end;
    ContinueLoop:= Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle); 
end;}

procedure PopulateScreenResolution(DestList: TComboBox2Ex; AddAutoText: Boolean = False);
var
  ScreenResolutions: TStringList;
begin
  ScreenResolutions:= TStringList.Create;
  ListScreenModes(ScreenResolutions, True);
  ScreenResolutions.BeginUpdate;
  ScreenResolutions.CustomSort(CompareStringListNatural);
  DestList.Items.BeginUpdate;
  if AddAutoText then
     DestList.Items.Add('Auto');
  DestList.Items.AddStrings(ScreenResolutions);
  DestList.Items.EndUpdate;
  DestList.ItemIndex:= 0;
  FreeAndNil(ScreenResolutions);
end;

function CompareStringListNatural(sList: TStringList; Index1, Index2: Integer): Integer;
begin
  Result:= NaturalCompareText(sList[Index1], sList[Index2]);
end;

function NaturalCompareText(const Text1, Text2: WideString): Integer;
begin
  if (Text1 = '') or (Text2 = '') then
     begin
       // this is needed so empty texts will
       // ALWAYS be put at top for ascending sort and at bottom for descending sort
       if (Text1 = '') and (Text2 = '') then
          Result:= 0 // Text1 = Text2
       else
       if (Text1 = '') and (Text2 <> '') then
          Result:= -1 // Text 1 < Text2
       else
          Result:= 1; // Text 1 > Text2
     end
  else
     begin
       Result:= StrCmpLogicalW(PWideChar(Text1), PWideChar(Text2));
     end;
end;

// WideString functions!!!
function GetFileInfoW(FName, InfoType: WideString): String;
{usage:

  showmessage(GetFileInfoW(Application.ExeName, VersionInfo[x]));

  1: 'CompanyName'
  2: 'FileDescription'
  3: 'FileVersion'
  4: 'InternalName'
  5: 'LegalCopyRight'
  6: 'OriginalFileName'
  7: 'ProductName'
  8: 'ProductVersion'
  9: 'SpecialBuild'

}
var
  Info     : Pointer;
  InfoData : Pointer;
  InfoSize : LongInt;
  InfoLen  : {$IFDEF WIN32} DWORD;{$ELSE} LongInt; {$ENDIF}
  DataLen  : {$IFDEF WIN32} UInt; {$ELSE} word; {$ENDIF}
  LangPtr  : Pointer;
begin
  Result:= '';
  if Length(FName) <= 0 then
    Exit;

  DataLen:= 255;
  FName:= FName + #0;

  InfoSize:= GetFileVersionInfoSizeW(@Fname[1], InfoLen);
  if (InfoSize > 0) then
  begin
    GetMem(Info, InfoSize);
    try
      if GetFileVersionInfoW(@FName[1], InfoLen, InfoSize, Info) then
      begin
        if VerQueryValueW(Info, '\VarFileInfo\Translation', LangPtr, DataLen) then
          InfoType:= WideFormat('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(LongInt(LangPtr^)), HiWord(LongInt(LangPtr^)), InfoType]);
        if VerQueryValueW(Info, @InfoType[1], InfoData, Datalen) then
          Result:= PWideChar(InfoData);// strPas(InfoData);
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;

  //function StrPas(const Str: PChar): string;
  //begin
  //  Result := Str;
  //end;
end;

function LastDelimiterW(const Delimiters, S: WideString): Integer;
var
  P: PWideChar;
begin
  Result := Length(S);
  P := PWideChar(Delimiters);
  while Result > 0 do
  begin
    if (S[Result] <> #0) and (WideStrScan(P, S[Result]) <> nil) then // (WStrScan(P, S[Result]) <> nil) then
      Exit;
    Dec(Result);
  end;
end;

function ChangeFileExtW(const FileName, Extension: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('.\:', Filename);
  if (I = 0) or (FileName[I] <> '.') then
     I:= MaxInt;
  Result:= Copy(FileName, 1, I - 1) + Extension;
end;

function ExtractFileExtW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('.\:', FileName);
  if (I > 0) and (FileName[I] = '.') then
     Result:= Copy(FileName, I, MaxInt)
  else
     Result:= '';
end;

function ExtractFileNameW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('\:', FileName);
  Result:= Copy(FileName, I + 1, MaxInt);
end;

function ExtractFilePathW(const FileName: WideString): WideString;
var
  I: Integer;
begin
  I:= LastDelimiterW('\:', FileName);
  Result:= Copy(FileName, 1, I);
end;

function FindMatchingFileW(var F: TSearchRecW): Integer;
var
  LocalFileTime: TFileTime;
begin
  with F do
  begin
    while FindData.dwFileAttributes and ExcludeAttr <> 0 do
      if not FindNextFileW(FindHandle, FindData) then
      begin
        Result:= GetLastError;
        Exit;
      end;
    FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
    FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
      LongRec(Time).Lo);
    Size:= FindData.nFileSizeLow;
    Attr:= FindData.dwFileAttributes;
    Name:= FindData.cFileName;
    DOSName:= FindData.cAlternateFileName;
  end;
  Result:= 0;
end;

function FindFirstW(const Path: WideString; Attr: Integer; var  F: TSearchRecW): Integer;
const
  faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
begin
  F.ExcludeAttr:= not Attr and faSpecial;
  F.FindHandle:= FindFirstFileW(PWideChar(Path), F.FindData);

  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Result:= FindMatchingFileW(F);
    if Result <> 0 then FindCloseW(F);
  end else
    Result:= GetLastError;
end;

function FindNextW(var F: TSearchRecW): Integer;
begin
  if FindNextFileW(F.FindHandle, F.FindData) then
    Result:= FindMatchingFileW(F) else
    Result:= GetLastError;
end;

procedure FindCloseW(var F: TSearchRecW);
begin
  if F.FindHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(F.FindHandle);
    F.FindHandle:= INVALID_HANDLE_VALUE;
  end;
end;

function GetFileSizeW(const aFileName: WideString): Int64;
var
  SearchRecW: TSearchRecW;
  Converter: packed record
    case Boolean of
      False: (n: Int64);
      True : (Low, High: DWORD);
    end;
begin
  if FindFirstW(aFileName, faAnyFile, SearchRecW) = 0 then
     begin
       Converter.Low:= SearchRecW.FindData.nFileSizeLow;
       Converter.High:= SearchRecW.FindData.nFileSizeHigh;
       Result:= Converter.n;
     end
  else
     Result:= -1;
  FindCloseW(SearchRecW);
end;

function FileAgeW(const FileName: WideString): Integer;
var
  Handle: THandle;
  FindData: TSearchRecW;
  LocalFileTime: TFileTime;
begin
  Handle:= FindFirstW(FileName, faAnyFile, FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    FindCloseW(FindData);
    if (FindData.FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      FileTimeToLocalFileTime(FindData.FindData.ftLastWriteTime, LocalFileTime);
      if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi, LongRec(Result).Lo) then
         Exit;
    end;
  end;
  Result:= -1;
end;

procedure DeleteAllFilesW(const FolderName: WideString; RecursiveFolders: Boolean = False);
var
  Search: TSearchRecW;
begin
  // this function's purpose is to delete all files from "eldir\softwarelist\" folder (create MAME games list)
  if FindFirstW(FolderName+'*', faAnyFile, Search) = 0 then
  begin
    repeat
      // It's a directory?
      if (Search.Name <> '.') and (Search.Name <> '..') then
      begin
        if (Search.Attr and $10 = $10) and (RecursiveFolders) then
           DeleteAllFilesW(FolderName+'\'+Search.Name, RecursiveFolders)
        else
           DeleteFileW(PWideChar(FolderName+'\'+ Search.Name));
      end;
    until FindNextW(Search) <> 0;
  end;
  FindCloseW(Search);
end;

function RenameFileW(const OldName, NewName: WideString; OverwriteExistingFile: Boolean = True): Boolean;
var
  rFlags: Cardinal;
begin
  rFlags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExistingFile then
     rFlags:= rFlags+MOVEFILE_REPLACE_EXISTING;

  Result:= MoveFileExW(PWideChar(OldName), PWideChar(NewName), rFlags);
           //MOVEFILE_COPY_ALLOWED
           //+MOVEFILE_REPLACE_EXISTING
           //+MOVEFILE_WRITE_THROUGH);
end;

function MoveFileW(const OldName, NewName: WideString; OverwriteExisting: Boolean): Boolean;
var
  flags: Cardinal;
begin
  flags:= MOVEFILE_COPY_ALLOWED+MOVEFILE_WRITE_THROUGH;
  if OverwriteExisting then
     flags:= flags+MOVEFILE_REPLACE_EXISTING;
  Result:= MoveFileExW(PWideChar(OldName), PWideChar(NewName),
           flags);//MOVEFILE_COPY_ALLOWED
           //+MOVEFILE_REPLACE_EXISTING
           //+MOVEFILE_WRITE_THROUGH);
end;

//function WStrPas(const Str: PWideChar): WideString;
//begin
//  Result := Str;
//end;

function GetShortFileNameW(const FileName: WideString): String;
var
  aTmp: array [0..MAX_PATH-1] of WideChar;
begin
  if GetShortPathNameW(PWideChar(FileName), aTmp, SizeOf(aTmp) - 1) = 0 then
     Result:= ''
  else
     Result := WideString(aTmp);
     //Result:= WStrPas(aTmp);
end;

procedure ShowMessageW(const MessageStr: WideString; TitleStr: String = '');
begin
  if TitleStr = '' then
     TitleStr:= Application.Title;
  MessageBoxW(Application.Handle, PWideChar(MessageStr), PWideChar(WideString(TitleStr)), mb_Ok);
end;

function WideLastChar(const S: WideString): PWideChar;
begin
  if S = '' then
    Result := nil
  else
    Result := @S[Length(S)];
end;

function LastCharW(const S: WideString): WideChar;
var
  P: PWideChar;
begin
  P := WideLastChar(S);
  if P = nil then
    Result := #0
  else
    Result := P^;
end;

//function Tnt_GetStringTypeExW(Locale: LCID; dwInfoType: DWORD;
//                              lpSrcStr: PWideChar; cchSrc: Integer; var lpCharType): BOOL;
//begin
//  Result := GetStringTypeExW(Locale, dwInfoType, lpSrcStr, cchSrc, lpCharType);
//end;

function _WideCharType(WC: WideChar; dwInfoType: Cardinal): Word;
begin
  Win32Check(GetStringTypeExW(GetThreadLocale, dwInfoType, PWideChar(@WC), 1, Result));
end;

function IsWideCharUpper(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_UPPER) <> 0;
end;

function IsWideCharLower(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_LOWER) <> 0;
end;

function IsWideCharDigit(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_DIGIT) <> 0;
end;

function IsWideCharSpace(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_SPACE) <> 0;
end;

function IsWideCharPunct(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_PUNCT) <> 0;
end;

function IsWideCharCntrl(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_CNTRL) <> 0;
end;

function IsWideCharBlank(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_BLANK) <> 0;
end;

function IsWideCharXDigit(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_XDIGIT) <> 0;
end;

function IsWideCharAlpha(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and C1_ALPHA) <> 0;
end;

function IsWideCharAlphaNumeric(WC: WideChar): Boolean;
begin
  Result := (_WideCharType(WC, CT_CTYPE1) and (C1_ALPHA + C1_DIGIT)) <> 0;
end;

function StringReplaceW(const S, OldPattern, NewPattern: WideString;
                        Flags: TReplaceFlags; WholeWord: Boolean = False): WideString;

  function IsWordSeparator(WC: WideChar): Boolean;
  begin
    Result := (WC = WideChar(#0))
           or IsWideCharSpace(WC)
           or IsWideCharPunct(WC);
  end;

var
  SearchStr, Patt, NewStr: WideString;
  Offset: Integer;
  PrevChar, NextChar: WideChar;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr:= WideUpperCase(S);
    Patt:= WideUpperCase(OldPattern);
  end else
  begin
    SearchStr:= S;
    Patt:= OldPattern;
  end;
  NewStr:= S;
  Result:= '';
  while SearchStr <> '' do
  begin
    Offset:= Pos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result:= Result + NewStr;
      Break;
    end; // done

    if (WholeWord) then
    begin
      if (Offset = 1) then
        PrevChar:= LastCharW(Result)
      else
        PrevChar:= NewStr[Offset - 1];

      if Offset+Length(OldPattern) <= Length(NewStr) then
        NextChar:= NewStr[Offset + Length(OldPattern)]
      else
        NextChar:= WideChar(#0);

      if (not IsWordSeparator(PrevChar))
      or (not IsWordSeparator(NextChar)) then
      begin
        Result:= Result + Copy(NewStr, 1, Offset + Length(OldPattern) - 1);
        NewStr:= Copy(NewStr, Offset + Length(OldPattern), MaxInt);
        SearchStr:= Copy(SearchStr, Offset + Length(Patt), MaxInt);
        Continue;
      end;
    end;

    Result:= Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr:= Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result:= Result + NewStr;
      Break;
    end;
    SearchStr:= Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function StrDupW(var dst: PWideChar; src: PWideChar; len: integer = 0): PWideChar;
begin
  if (src = nil) or (src^ = #0) then
    dst:= nil
  else
  begin
    if len = 0 then
      len:= lstrlenw(src);
    GetMem(dst, (len+1)*SizeOf(WideChar));
    lstrcpynw(dst, src, len+1);
  end;
  Result:= dst;
end;

function GetCharLastPosition(const iStr: WideString; iChar: WideChar): Integer;
var
  iLoop: Integer;
begin
  Result:= -1;
  if iStr = '' then
     Exit;

  for iLoop:= LengthW(iStr) downto 1 do
  begin
    if iStr[iLoop] = iChar then
       begin
         Result:= iLoop;
         Break;
       end;
  end;
end;

function GetCharLastPosition(const iStr: String; iChar: Char): Integer;
var
  iLoop: Integer;
begin
  Result:= -1;
  if iStr = '' then
     Exit;

  for iLoop:= Length(iStr) downto 1 do
  begin
    if iStr[iLoop] = iChar then
       begin
         Result:= iLoop;
         Break;
       end;
  end;
end;

procedure GetGamesFilesListW(Folder: String; const FileType: String; ListHolder: THashedStringList; SubDirectories: Boolean; MediaTypeID: Integer);
var
  SearchW: TSearchRecW;
  iName, iStrDOS: String;
  UnicodeStr: Boolean;
begin
  // list format
  // MediaType ' ' filename_fullPath<DOS>Ansi_filename
  //   0 fullpath\UTF8Encode(gamefilename.zip)<DOS>ansi_filename.zip/>
  
  // this is for console/computer/handheld games (EmuCon), NOT to be used by arcade systems!
  if Folder = '' then
     Exit;
  ListHolder.BeginUpdate;
  //ListHolder.Sorted:= True;
  //ListHolder.Duplicates:= dupIgnore;
  Folder:= IncludeTrailingPathDelimiter(Folder);

  if FindFirstW(Folder+'*', $37, SearchW) = 0 then
     begin
       repeat
         // It's a directory?
         if (SearchW.Name <> '.') and (SearchW.Name <> '..') then
            begin
              if (SearchW.Attr and $10 = $10) and (SubDirectories) then
                 GetGamesFilesListW(Folder+SearchW.Name, FileType, ListHolder, SubDirectories, MediaTypeID)
              else
                 begin
                   if (SearchW.Attr and $10 <> $10) then
                      begin
                        iName:= SearchW.Name;
                        iStrDOS:= '';
                        UnicodeStr:= iName <> SearchW.Name;
                        if UnicodeStr then
                           begin
                             iName:= UTF8Encode(SearchW.Name);
                             iStrDOS:= '<DOS>'+SearchW.DOSName+'/>';
                           end;
                        if FileType <> '' then
                           begin
                             if SameText(ExtractFileExtW(SearchW.Name), FileType) then // iName might be encrypted with UTF8Encode (April 26, 2021)
                                ListHolder.Add(IntToStr(MediaTypeID)+' '+Folder+iName+iStrDOS);
                           end
                        else
                           begin
                             ListHolder.Add(IntToStr(MediaTypeID)+' '+Folder+iName+iStrDOS);
                           end;
                        // for debugging only, do not enable
                        //if UnicodeStr then
                        //   begin
                        //     //ShowMessage('iName encoded: '+iName);
                        //   //MessageBoxW(Application.Handle, PWideChar(SearchW.Name+#13#10+iName+#13#10+Utf8Decode(iName)), 'New MessageBoxW', mb_Ok);
                        //   end;
                      end;
                 end;
            end;
       until FindNextW(SearchW) <> 0;
     end;
  FindCloseW(SearchW);
  ListHolder.EndUpdate;
  //ShowMessage('files'+#13#10+ListHolder.Text);
end;

{function TextExtentW(const TextW: WideString; ACanvas: TCanvas): TSize;
begin
  //RequiredState([csHandleValid, csFontValid]);
  Result.cX := 0;
  Result.cY := 0;
  Windows.GetTextExtentPoint32W(ACanvas.Handle, PWideChar(TextW), Length(TextW), Result);
end;}

function CheckAppOneInstance: Boolean;
var
  Mutex: THandle;
  elIni: TMemIniFile;
  iPath: String;
begin
  Result:= False;
  iPath:= ExtractFilePath(Application.ExeName);
  if not FileExists(iPath+'EmuLoader.ini') then
     Exit;

  elIni:= TMemIniFile.Create(iPath+'EmuLoader.ini');
  Result:= Boolean(elIni.ReadInteger('Preferences', 'AllowOneInstance', 1));
  FreeAndNil(elIni);
  if not Result then
     Exit;

  Mutex:= Windows.CreateMutex(nil, True, 'EmuLoader');
  if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
     Application.MessageBox('   Emu Loader is already running!'+#13#10+#13#10+
                            'To run multiple instances of the frontend, make sure to uncheck setting "Allow Only One Instance" in preferences screen.'+
                            #13#10+#13#10+'Aborting...', '', mb_Ok+mb_IconExclamation)
  else
     Result:= False;

  if not Result then
     Screen.Cursor:= crHourGlass; // for application's startup until FormStatus shows up
end;

procedure ShowDropdownMenu(ButtonExSource: TBitBtnEx; PopupMenuSource: TPopupMenu);
var
  iPoint: TPoint;
  iLeft, iTop: Integer;
begin
  iPoint:= ButtonExSource.ClientToScreen(Point(0, 0));
  iLeft:=  iPoint.X;
  iTop:=   iPoint.Y+ButtonExSource.Height+1;
  PopupMenuSource.Popup(iLeft, iTop);
end;

procedure ShowDropdownMenu(ButtonExSource: TSpeedButtonEx; PopupMenuSource: TPopupMenu);
var
  iPoint: TPoint;
  iLeft, iTop: Integer;
begin
  iPoint:= ButtonExSource.ClientToScreen(Point(0, 0));
  iLeft:= iPoint.X;
  iTop:= iPoint.Y+ButtonExSource.Height+1;
  PopupMenuSource.Popup(iLeft, iTop); //iPoint.X, iPoint.Y);

  // these do not work
  //  iPoint:= ClientToParent(Point(TSpeedButtonEx(Sender).Left, TSpeedButtonEx(Sender).Top), FormConsCompGamesEditor);//TSpeedButtonEx(Sender).Owner);
  //  iPoint:= ClientToScreen(Point(TSpeedButtonEx(Sender).Left, TSpeedButtonEx(Sender).Top + TSpeedButtonEx(Sender).Height));
  //  PopupMenuOptions.Popup(iLeft, iTop); //iPoint.X, iPoint.Y);
end;

// Use CalcCRC32 as a procedure so CRCValue can be passed in but
  // also returned. This allows multiple calls to CalcCRC32 for
  // the "same" CRC-32 calculation.
procedure CalcCRC32(p: Pointer; ByteCount: DWORD; var CRCValue: DWORD);
  // The following is a little cryptic (but executes very quickly).
  // The algorithm is as follows:
  // 1. exclusive-or the input byte with the low-order byte of
  // the CRC register to get an INDEX
  // 2. shift the CRC register eight bits to the right
  // 3. exclusive-or the CRC register with the contents of Table[INDEX]
  // 4. repeat steps 1 through 3 for all bytes
var
  i: DWORD;
  q: ^BYTE;
begin
  q:= p;
  for i:= 0 to ByteCount-1 do
  begin
    CRCvalue:= (CRCvalue shr 8) xor
      CRC32Table[q^ xor (CRCvalue and $000000FF)];
    Inc(q);
  end
end;

function CalcStringCRC32(S: String; out CRC32: DWORD): Boolean;
var
  iCRC32Table: DWORD;
begin
  // Verify the table used to compute the CRCs has not been modified.
  // Thanks to Gary Williams for this suggestion, Jan. 2003.
  iCRC32Table:= $FFFFFFFF;
  CalcCRC32(Addr(CRC32Table[0]), SizeOf(CRC32Table), iCRC32Table);
  iCRC32Table:= not iCRC32Table;

  if iCRC32Table <> $6FCF9E13 then
     ShowMessageW('CRC32 Table CRC32 is '+IntToHex(iCRC32Table, 8)+', expecting $6FCF9E13')
  else
  begin
    CRC32:= $FFFFFFFF; // To match PKZIP
    if Length(S) > 0 then  // Avoid access violation in D4
       CalcCRC32(Addr(s[1]), Length(s), CRC32);
    CRC32:= not CRC32; // To match PKZIP
  end;
end;

function CalcFileCRC32(FromName: WideString): String;
var
  Stream: TWideMemoryStream;
  CRCvalue: DWORD;
  Error: WORD;
begin
  Error:= 0;
  CRCValue:= $FFFFFFFF;
  Stream:= TWideMemoryStream.Create;
  try
    try
      Stream.LoadFromFile(FromName);
      if Stream.Size > 0 then
         CalcCRC32(Stream.Memory, Stream.Size, CRCvalue)
    except
      on E: EReadError do
         Error:= 1;
    end;
    CRCvalue:= not CRCvalue;
  finally
    Stream.Free;
  end;
  Result:= LowerCase(IntToHex(CRCvalue, 8));
end;

function Validate4KResolution: Boolean;
begin
  Result:= (Screen.Width >= 3840) and (Screen.Height >= 2160);
end;

function Read4KSetting: Boolean;
var
  iniFile: TMemIniFile;
begin
  FrontendPath:= ExtractFilePath(Application.ExeName);
  Result:= Validate4KResolution;
  if Result then
     if FileExists(FrontendPath+'EmuLoader.ini') then
     begin
       iniFile:= TMemIniFile.Create(FrontendPath+'EmuLoader.ini');
       Result:= not Boolean(iniFile.ReadInteger('Preferences', '4KModeDisable', Ord(not Result))); // default TRUE if screen resolution is 3840x2160 or higher
       FreeAndNil(iniFile);
     end;
end;

procedure CreateSplashIniFile; // this function will be removed in a future frontend version
const
  iFolder: String = 'ini_files\';
  iFile  : String = 'lightmode.ini';
  iSplash: String = 'splash.ini';
var
  iniFile: TMemIniFile;
  newFile: TStringList;
begin
  if FileExists(FrontendPath+iFolder+iSplash) then
     Exit;

  if not FileExists(FrontendPath+iFolder+iFile) then
     Exit;

  iniFile:= TMemIniFile.Create(FrontendPath+iFolder+iFile);
  newFile:= TStringList.Create;

  iniFile.ReadSectionValues('Splash', newFile);
  if newFile.Count > 0 then
     begin
       iniFile.EraseSection('Splash');
       iniFile.UpdateFile;
       newFile.Insert(0, '[Splash]');
       newFile.SaveToFile(FrontendPath+iFolder+iSplash);
     end;
  FreeAndNil(iniFile);
  FreeAndNil(newFile);
end;

procedure CreateGamesFiltersIniFile; // this function will be removed in a future frontend version
const
  iFolder: String = 'ini_files\';
  iFile  : String = 'EmuLoader.ini';
  iFilter: String = 'games_filters.ini';
var
  iniFile: TMemIniFile;
  newFile, currentList, FiltersSection: TStringList;
  iIndex: Integer;

  function AddSetting(const NameStr: String; NewNameStr: String = ''): Boolean;
  var
    iPos: Integer;
    iValue: String;
  begin
    iPos:= FiltersSection.IndexOfName(NameStr);
    Result:= iPos <> -1;
    if Result then
       begin
         if NewNameStr <> '' then
            iValue:= NewNameStr+'='+FiltersSection.ValueFromIndex[iPos]
         else
            iValue:= FiltersSection[iPos];
         newFile.Add(iValue);
       end;
  end;

  function AddSection(const SectionName: String; AddEmptyLine: Boolean = True): Boolean;
  var
    iName: String;
  begin
    Result:= iniFile.SectionExists(SectionName);
    if Result then
    begin
      iName:= '['+SectionName+']';
      if AddEmptyLine then
         iName:= #13#10+iName;

      iniFile.ReadSectionValues(SectionName, currentList);
      newFile.Add(iName);
      newFile.AddStrings(currentList);
    end;
  end;

begin
  if FileExists(FrontendPath+iFolder+iFilter) then
     Exit;

  if not FileExists(FrontendPath+iFile) then
     Exit;

  iniFile:= TMemIniFile.Create(FrontendPath+iFile);
  newFile:= TStringList.Create;
  newFile.BeginUpdate;
  currentList:= TStringList.Create;

  FiltersSection:= TStringList.Create;
  iniFile.ReadSectionValues('ListFilter', FiltersSection);

  AddSection('Thumbnails', False);

  newFile.Add(#13#10+'[MachineType]');
  AddSetting('MachineTypeArcadeSystems',                   'ArcadeSystems');
  AddSetting('MachineTypeConsoleSystems',                  'ConsoleSystems');
  AddSetting('MachineTypeComputerSystems',                 'ComputerSystems');
  AddSetting('MachineTypeHandheldSystems',                 'HandheldSystems');
  AddSetting('MachineTypeMAMEMachinesWithSoftwareList',    'MAMEMachinesWithSoftwareList');
  AddSetting('MachineTypeMAMEMachinesWithoutSoftwareList', 'MAMEMachinesWithoutSoftwareList');
  AddSetting('MachineTypeMAMESoftwareListGames',           'MAMESoftwareListGames');
  AddSetting('EnableMAMEMachinesFilterPanel');

  AddSection('ListFilter_Arcade');
  AddSection('ListFilter_ConsoleComputer');
  AddSection('ListFilter_ArcadeQuick');
  AddSection('ListFilter_ConsoleComputerQuick');

  // misc filters
  newFile.Add(#13#10+'[Miscellaneous]');
  AddSetting('BiosNoBios');
  AddSetting('HideBiosSets');
  AddSetting('InterfaceType');
  AddSetting('AudioType');
  AddSetting('DevicesNoDevices');
  AddSetting('HideDeviceSets');

  AddSetting('GamesROMs');

  AddSetting('CategoryCasino');
  AddSetting('CategoryFruitMachines');
  AddSetting('CategorySlotMachines');
  AddSetting('CategoryRhythm');
  AddSetting('CategoryMature');
  AddSetting('CategoryMahjong');
  AddSetting('CategoryTabletop');
  AddSetting('CategoryPinMAME');
  AddSetting('CategoryBoardGame');

  AddSetting('CategoryQuiz');

  AddSetting('CategoryUtilities');
  AddSetting('CategoryCalculator');
  AddSetting('CategoryEducational');
  AddSetting('CategoryElectronic');
  AddSetting('CategoryPrinters');
  AddSetting('CategoryPhones');
  AddSetting('CategoryMusic');

  AddSetting('CategoryMAMEConsoleMachines');
  AddSetting('CategoryMAMEComputerMachines');
  AddSetting('CategoryMAMEHandheldMachines');

  AddSetting('HideGamesWithCHDFiles');
  AddSetting('HideNoDumpROMsGames');
  AddSetting('ScreenOrientation');
  AddSetting('SaveState');

  AddSetting('OnlyNeoGeoMVS');
  AddSetting('OnlySTVMultiSlot');

  AddSetting('ShowMergedSetsOnly');
  AddSetting('ShowOnlySetsCRC32Collision');
  AddSetting('HideMAMESoftlist_vgmplay');

  AddSetting('SpecialList');
  AddSetting('FilterMAMEGamesMainCPU');


  // remove sections and settings from "EmuLoader.ini"
  iniFile.EraseSection('Thumbnails');
  iniFile.EraseSection('ListFilter_Arcade');
  iniFile.EraseSection('ListFilter_ConsoleComputer');
  iniFile.EraseSection('ListFilter_ArcadeQuick');
  iniFile.EraseSection('ListFilter_ConsoleComputerQuick');

  // remove settings from "[ListFilter]" section

  IniFile.DeleteKey('ListFilter', 'MachineTypeArcadeSystems');
  IniFile.DeleteKey('ListFilter', 'MachineTypeConsoleSystems');
  IniFile.DeleteKey('ListFilter', 'MachineTypeComputerSystems');
  IniFile.DeleteKey('ListFilter', 'MachineTypeHandheldSystems');
  IniFile.DeleteKey('ListFilter', 'MachineTypeMAMEMachinesWithSoftwareList');
  IniFile.DeleteKey('ListFilter', 'MachineTypeMAMEMachinesWithoutSoftwareList');
  IniFile.DeleteKey('ListFilter', 'MachineTypeMAMESoftwareListGames');
  IniFile.DeleteKey('ListFilter', 'EnableMAMEMachinesFilterPanel');

  IniFile.DeleteKey('ListFilter', 'BiosNoBios');
  IniFile.DeleteKey('ListFilter', 'HideBiosSets');
  IniFile.DeleteKey('ListFilter', 'InterfaceType');
  IniFile.DeleteKey('ListFilter', 'AudioType');
  IniFile.DeleteKey('ListFilter', 'DevicesNoDevices');
  IniFile.DeleteKey('ListFilter', 'HideDeviceSets');

  IniFile.DeleteKey('ListFilter', 'GamesROMs');

  IniFile.DeleteKey('ListFilter', 'CategoryCasino');
  IniFile.DeleteKey('ListFilter', 'CategoryFruitMachines');
  IniFile.DeleteKey('ListFilter', 'CategorySlotMachines');
  IniFile.DeleteKey('ListFilter', 'CategoryRhythm');
  IniFile.DeleteKey('ListFilter', 'CategoryMature');
  IniFile.DeleteKey('ListFilter', 'CategoryMahjong');
  IniFile.DeleteKey('ListFilter', 'CategoryTabletop');
  IniFile.DeleteKey('ListFilter', 'CategoryPinMAME');
  IniFile.DeleteKey('ListFilter', 'CategoryBoardGame');

  IniFile.DeleteKey('ListFilter', 'CategoryQuiz');

  IniFile.DeleteKey('ListFilter', 'CategoryUtilities');
  IniFile.DeleteKey('ListFilter', 'CategoryCalculator');
  IniFile.DeleteKey('ListFilter', 'CategoryEducational');
  IniFile.DeleteKey('ListFilter', 'CategoryElectronic');
  IniFile.DeleteKey('ListFilter', 'CategoryPrinters');
  IniFile.DeleteKey('ListFilter', 'CategoryPhones');
  IniFile.DeleteKey('ListFilter', 'CategoryMusic');

  IniFile.DeleteKey('ListFilter', 'CategoryMAMEConsoleMachines');
  IniFile.DeleteKey('ListFilter', 'CategoryMAMEComputerMachines');
  IniFile.DeleteKey('ListFilter', 'CategoryMAMEHandheldMachines');

  IniFile.DeleteKey('ListFilter', 'HideGamesWithCHDFiles');
  IniFile.DeleteKey('ListFilter', 'HideNoDumpROMsGames');
  IniFile.DeleteKey('ListFilter', 'ScreenOrientation');
  IniFile.DeleteKey('ListFilter', 'SaveState');

  IniFile.DeleteKey('ListFilter', 'OnlyNeoGeoMVS');
  IniFile.DeleteKey('ListFilter', 'OnlySTVMultiSlot');

  IniFile.DeleteKey('ListFilter', 'ShowMergedSetsOnly');
  IniFile.DeleteKey('ListFilter', 'ShowOnlySetsCRC32Collision');
  IniFile.DeleteKey('ListFilter', 'HideMAMESoftlist_vgmplay');

  IniFile.DeleteKey('ListFilter', 'SpecialList');
  IniFile.DeleteKey('ListFilter', 'FilterMAMEGamesMainCPU');

  // update EmuLoader.ini
  iniFile.UpdateFile;
  FreeAndNil(iniFile);
  FreeAndNil(currentList);
  FreeAndNil(FiltersSection);

  // update new "games_filters.ini"
  newFile.EndUpdate;
  newFile.SaveToFile(FrontendPath+iFolder+iFilter); // save the new file
  FreeAndNil(newFile);
end;


end.
