object FormPreferences: TFormPreferences
  Left = 624
  Top = 297
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 562
  ClientWidth = 834
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelTabButtons: TPanelEx
    Left = 0
    Top = 0
    Width = 73
    Height = 562
    Color1 = 14540253
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frRight]
    ParentBackground = False
    Style = vgSolid
    object ButtonPageGeneral: TSpeedButton
      Left = 1
      Top = 1
      Width = 70
      Height = 50
      GroupIndex = 1
      Down = True
      Caption = 'General'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageGamesList: TSpeedButton
      Tag = 1
      Left = 1
      Top = 52
      Width = 70
      Height = 50
      GroupIndex = 1
      Caption = 'Games List'#13#10' / Columns'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageImages: TSpeedButton
      Tag = 2
      Left = 1
      Top = 103
      Width = 70
      Height = 50
      GroupIndex = 1
      Caption = 'Images'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageGameDocuments: TSpeedButton
      Tag = 3
      Left = 1
      Top = 154
      Width = 70
      Height = 50
      GroupIndex = 1
      Caption = 'Game Docs'#13#10'(MAME)'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageNightMode: TSpeedButton
      Tag = 4
      Left = 1
      Top = 205
      Width = 70
      Height = 50
      GroupIndex = 1
      Caption = 'Night'#13#10'Mode'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
  end
  object PageOptions: TNotebook
    Left = 73
    Top = 0
    Width = 761
    Height = 562
    Color = 15856113
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'General'
      object Label1: TLabel
        Left = 32
        Top = 188
        Width = 264
        Height = 18
        Caption = 'Do not display errors after exiting the emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object DisableMinimize: TAdvOfficeCheckBox
        Left = 15
        Top = 12
        Width = 286
        Height = 20
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Disable Frontend Minimize When Running Games'
        ReturnIsTab = False
        Themed = True
      end
      object HideDOSBoxFrame: TAdvGroupBox
        Left = 15
        Top = 61
        Width = 314
        Height = 97
        RoundEdges = True
        Caption = 'Hide Command Prompt Box'
        Ctl3D = True
        TabOrder = 1
        object ShadowLabel2: TShadowLabel
          Left = 24
          Top = 57
          Width = 281
          Height = 37
          AutoSize = False
          Caption = 
            'Do not run emulator in windowed mode or it will be invisible to ' +
            'Windows task bar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
          WordWrap = True
        end
        object HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 247
          Height = 20
          Checked = True
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Create Games List / Read Emulator Version'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object HideDOSBoxRunGame: TAdvOfficeCheckBox
          Left = 8
          Top = 40
          Width = 304
          Height = 20
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Run Game (Full Screen Only. Use it at Your Own Risk!)'
          ReturnIsTab = False
          Themed = True
        end
      end
      object AllowOnlyOneInstance: TAdvOfficeCheckBox
        Left = 15
        Top = 32
        Width = 154
        Height = 20
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Allow Only One Instance'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBox
        Left = 16
        Top = 171
        Width = 289
        Height = 20
        Checked = True
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Ignore Exit Code 1: Invalid Function (KEGA Fusion)'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object RestoreInternetGameInfoStartup: TAdvOfficeCheckBox
        Left = 15
        Top = 411
        Width = 230
        Height = 20
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Restore "Internet Game Info" at Startup'
        ReturnIsTab = False
        Themed = True
      end
      object GroupBoxInternetGameInfo: TAdvGroupBox
        Left = 15
        Top = 440
        Width = 514
        Height = 106
        RoundEdges = True
        Caption = 
          'Internet Game Info                                              ' +
          '                                                                ' +
          '                  '
        Ctl3D = True
        TabOrder = 5
        object LabelInternetGameInfoLink: TLabel
          Left = 8
          Top = 20
          Width = 80
          Height = 15
          Caption = 'Game Info Link'
        end
        object LabelInternetMAMESoftwareListGameInfoLink: TLabel
          Left = 8
          Top = 60
          Width = 189
          Height = 15
          Caption = 'MAME Software List Game Info Link'
        end
        object Label5: TLabel
          Left = 115
          Top = 1
          Width = 287
          Height = 14
          Caption = 'Tag       required to be replaced by                  and'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 141
          Top = 1
          Width = 347
          Height = 14
          Caption = 
            '%s                                       game name       softwar' +
            'e name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object InternetGameInfoLink: TEdit
          Left = 8
          Top = 36
          Width = 450
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 0
        end
        object InternetGameInfoLinkButtonDefault: TBitBtn
          Left = 459
          Top = 35
          Width = 47
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Default'
          TabOrder = 1
          OnClick = InternetGameInfoLinkButtonDefaultClick
        end
        object InternetMAMESoftwareListGameInfoLink: TEdit
          Left = 8
          Top = 76
          Width = 450
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 2
        end
        object InternetMAMESoftwareListGameInfoLinkButtonDefault: TBitBtn
          Left = 459
          Top = 75
          Width = 47
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Default'
          TabOrder = 3
          OnClick = InternetMAMESoftwareListGameInfoLinkButtonDefaultClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Games List Appearance'
      object LabelDisableNaturalSorting: TLabel
        Left = 32
        Top = 324
        Width = 198
        Height = 18
        Caption = 'Use ASCII sorting (1, 10, 11, 2, 20, 3)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelGameMultilineCaptions: TLabel
        Left = 32
        Top = 284
        Width = 249
        Height = 18
        Caption = 'Show full caption (32x32 and 48x48 icon size)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelDisableDeleteSelectedGames: TLabel
        Left = 32
        Top = 405
        Width = 237
        Height = 18
        Caption = 'Safeguard your ROMs from naughty kiddies'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object MAMu_Icon: TImage
        Left = 16
        Top = 514
        Width = 32
        Height = 32
        Transparent = True
      end
      object LabelMAMu_IconsFolder: TLabel
        Left = 50
        Top = 510
        Width = 449
        Height = 15
        Caption = 
          'MAMu_ Icons Folder                 emulator relative path suppor' +
          't; MAME and arcade only'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object ButtonCustomizeGameFonts: TBitBtn
        Left = 16
        Top = 347
        Width = 166
        Height = 23
        Caption = 'Customize Game Fonts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonCustomizeGameFontsClick
      end
      object GameSelectionAlphaBlend: TAdvOfficeCheckBox
        Left = 16
        Top = 247
        Width = 169
        Height = 18
        Hint = 'Enable alpha blended bar'
        TabOrder = 1
        OnClick = GameSelectionAlphaBlendClick
        Alignment = taLeftJustify
        Caption = 'Alpha Blended Selection Bar'
        ReturnIsTab = False
        Themed = True
      end
      object ColumnsSettingsGroupBox: TAdvGroupBox
        Left = 502
        Top = 256
        Width = 244
        Height = 163
        Transparent = False
        RoundEdges = True
        Caption = 'Details/Grouped View Columns Settings'
        Ctl3D = True
        TabOrder = 2
        object DisableCloneIndent: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 187
          Height = 18
          Hint = 'Align clone games to parent'
          TabOrder = 0
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Disable Clone Indent (grouped)'
          ReturnIsTab = False
          Themed = True
        end
        object DisableDriverStatusIcons: TAdvOfficeCheckBox
          Left = 8
          Top = 40
          Width = 145
          Height = 18
          TabOrder = 1
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Hide Driver Status Icons'
          ReturnIsTab = False
          Themed = True
        end
        object DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBox
          Left = 8
          Top = 80
          Width = 201
          Height = 18
          TabOrder = 2
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Show Status Texts First Letter Only'
          ReturnIsTab = False
          Themed = True
        end
        object HideDriverStatusTexts: TAdvOfficeCheckBox
          Left = 8
          Top = 60
          Width = 146
          Height = 18
          TabOrder = 3
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Hide Driver Status Texts'
          ReturnIsTab = False
          Themed = True
        end
        object ShortDriverColumnTitles: TAdvOfficeCheckBox
          Left = 8
          Top = 100
          Width = 195
          Height = 18
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Short Driver Status Column Titles'
          ReturnIsTab = False
          Themed = True
        end
        object LastPlayedHideSeconds: TAdvOfficeCheckBox
          Left = 8
          Top = 120
          Width = 167
          Height = 18
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = 'Hide Seconds in Last Played'
          ReturnIsTab = False
          Themed = True
        end
        object TotalPlayTimeHideSeconds: TAdvOfficeCheckBox
          Left = 8
          Top = 140
          Width = 156
          Height = 18
          TabOrder = 6
          Alignment = taLeftJustify
          Caption = 'Hide Seconds in Playtime'
          ReturnIsTab = False
          Themed = True
        end
      end
      object GamesBackgroundGroupBox: TAdvGroupBox
        Left = 16
        Top = 12
        Width = 729
        Height = 69
        RoundEdges = True
        Caption = 'Background'
        Ctl3D = True
        TabOrder = 3
        object LabelGamesBackgroundColor: TShadowLabel
          Left = 8
          Top = 22
          Width = 32
          Height = 16
          Caption = 'Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object GamesBackgroundColor: TColorBox
          Left = 8
          Top = 39
          Width = 187
          Height = 22
          DefaultColorColor = clWhite
          NoneColorColor = clWhite
          Selected = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
          OnSelect = GamesBackgroundColorSelect
        end
        object ButtonDefaultBkSortedColor: TBitBtn
          Left = 197
          Top = 38
          Width = 47
          Height = 23
          Hint = 'Set default values'
          Caption = 'Default'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonDefaultBkSortedColorClick
        end
        object GamesBackgroundImageEnable: TAdvOfficeCheckBox
          Left = 264
          Top = 20
          Width = 92
          Height = 18
          TabOrder = 2
          OnClick = GamesBackgroundImageEnableClick
          Alignment = taLeftJustify
          Caption = 'Image [.png]'
          ReturnIsTab = False
          Themed = True
        end
        object GamesBackgroundImage: TEdit
          Left = 264
          Top = 39
          Width = 357
          Height = 21
          AutoSize = False
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object GamesTileBackground: TAdvOfficeCheckBox
          Left = 580
          Top = 20
          Width = 40
          Height = 18
          Hint = 'Tile the background image on the entire games list canvas'
          Checked = True
          TabOrder = 6
          OnClick = GamesTileBackgroundClick
          Alignment = taLeftJustify
          Caption = 'Tile'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GamesBackgroundImageButtonSelect: TBitBtn
          Left = 623
          Top = 38
          Width = 49
          Height = 23
          Hint = 'Click here to select a file'
          Caption = 'Select'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = GamesBackgroundImageButtonSelectClick
        end
        object GamesBackgroundImageButtonUpdate: TBitBtn
          Left = 672
          Top = 38
          Width = 49
          Height = 23
          Hint = 'Click here to load the image if you'#39've made a manual change'
          Caption = 'Update'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = GamesBackgroundImageButtonUpdateClick
        end
      end
      object DisableNaturalSorting: TAdvOfficeCheckBox
        Left = 16
        Top = 307
        Width = 237
        Height = 18
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 4
        OnClick = DisableNaturalSortingClick
        Alignment = taLeftJustify
        Caption = 'Disable Natural Sorting (1, 2, 3, 10, 11, 20)'
        ReturnIsTab = False
        Themed = True
      end
      object GameMultilineCaptions: TAdvOfficeCheckBox
        Left = 16
        Top = 267
        Width = 242
        Height = 20
        TabOrder = 5
        OnClick = GameMultilineCaptionsClick
        Alignment = taLeftJustify
        Caption = 'Multiline Captions (Details/Grouped View)'
        ReturnIsTab = False
        Themed = True
      end
      object GamesListStatusBarBox: TAdvGroupBox
        Left = 502
        Top = 93
        Width = 244
        Height = 150
        RoundEdges = True
        Caption = 'Status Bar Colors'
        TabOrder = 6
        object LabelGamesListStatusBarBottomColor: TLabel
          Left = 8
          Top = 73
          Width = 40
          Height = 15
          Caption = 'Bottom'
          Transparent = True
        end
        object LabelGamesListStatusBarTopColor: TLabel
          Left = 8
          Top = 48
          Width = 21
          Height = 15
          Caption = 'Top'
          Transparent = True
        end
        object LabelGamesListStatusBarFontColor: TLabel
          Left = 8
          Top = 126
          Width = 24
          Height = 15
          Caption = 'Font'
          Transparent = True
        end
        object LabelGamesListStatusBarFrameColor: TLabel
          Left = 8
          Top = 99
          Width = 33
          Height = 15
          Caption = 'Frame'
          Transparent = True
        end
        object GamesListStatusBarGradientBar: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 89
          Height = 20
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = GamesListStatusBarGradientBarClick
          Alignment = taLeftJustify
          Caption = 'Gradient Bar'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GamesListStatusBarBottomColor: TColorBox
          Left = 52
          Top = 70
          Width = 187
          Height = 22
          DefaultColorColor = 16512497
          NoneColorColor = 16512497
          Selected = 16512497
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 1
          OnSelect = GamesListStatusBarBottomColorSelect
        end
        object GamesListStatusBarButtonDefault: TBitBtn
          Left = 190
          Top = 16
          Width = 47
          Height = 21
          Caption = 'Default'
          TabOrder = 2
          OnClick = GamesListStatusBarButtonDefaultClick
        end
        object GamesListStatusBarTopColor: TColorBox
          Left = 52
          Top = 44
          Width = 187
          Height = 22
          DefaultColorColor = 15391180
          NoneColorColor = 15391180
          Selected = 15391180
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 3
          OnSelect = GamesListStatusBarTopColorSelect
        end
        object GamesListStatusBarFontColor: TColorBox
          Left = 52
          Top = 122
          Width = 187
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
          OnSelect = GamesListStatusBarFontColorSelect
        end
        object GamesListStatusBarFrameColor: TColorBox
          Left = 52
          Top = 96
          Width = 187
          Height = 22
          DefaultColorColor = 7891291
          NoneColorColor = 7891291
          Selected = 7891291
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
          OnSelect = GamesListStatusBarFrameColorSelect
        end
      end
      object DisableDeleteSelectedGames: TAdvOfficeCheckBox
        Left = 16
        Top = 388
        Width = 237
        Height = 20
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 7
        OnClick = DisableDeleteSelectedGamesClick
        Alignment = taLeftJustify
        Caption = 'Disable "Delete/Copy/Move Games Files"'
        ReturnIsTab = False
        Themed = True
      end
      object GroupBoxGamesListSplitters: TAdvGroupBox
        Left = 16
        Top = 93
        Width = 293
        Height = 133
        RoundEdges = True
        Caption = 'Games List / Machines List Splitters'
        Ctl3D = True
        TabOrder = 8
        object LabelGamesListSplitterSingleColorDefault: TShadowLabel
          Left = 8
          Top = 56
          Width = 67
          Height = 16
          Caption = 'Single Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object LabelGamesListSplitterSingleColor: TLabel
          Left = 8
          Top = 82
          Width = 29
          Height = 15
          Caption = 'Color'
          Transparent = True
        end
        object LabelGamesListSplitterSingleColorHot: TLabel
          Left = 8
          Top = 107
          Width = 52
          Height = 15
          Caption = 'Hot Color'
          Transparent = True
        end
        object GamesListSplitterStyleSelector: TComboBox
          Left = 8
          Top = 21
          Width = 220
          Height = 23
          Hint = 'Set splitter style'
          Style = csDropDownList
          Ctl3D = True
          DropDownCount = 20
          ItemHeight = 15
          ItemIndex = 6
          ParentCtl3D = False
          TabOrder = 0
          Text = 'Office 2007 Luna (Default)'
          OnSelect = GamesListSplitterStyleSelectorSelect
          Items.Strings = (
            'Silver'
            'Single Color (Customizable)'
            'Office 2003 Blue'
            'Office 2003 Silver'
            'Office 2003 Olive'
            'Office 2003 Classic'
            'Office 2007 Luna (Default)'
            'Office 2007 Silver'
            'Office 2007 Obsidian'
            'Windows XP'
            'Whidbey'
            'Windows Vista'
            'Windows 7'
            'Terminal'
            'Office 2010 Blue'
            'Office 2010 Silver'
            'Office 2010 Black')
        end
        object ButtonGamesListSplitterStyleDefault: TBitBtn
          Left = 236
          Top = 20
          Width = 47
          Height = 23
          Hint = 'Set splitters default style'
          Caption = 'Default'
          TabOrder = 1
          OnClick = ButtonGamesListSplitterStyleDefaultClick
        end
        object GamesListSplitterShowGripIcon: TAdvOfficeCheckBox
          Left = 183
          Top = 50
          Width = 97
          Height = 20
          Hint = 
            'Show/hide grip icon in the middle of the splitter (games list/ga' +
            'me docs)'
          Checked = True
          TabOrder = 2
          OnClick = GamesListSplitterShowGripIconClick
          Alignment = taRightJustify
          Caption = 'Show Grip Icon'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GamesListSplitterSingleColor: TColorBox
          Left = 64
          Top = 78
          Width = 221
          Height = 22
          Hint = 'Color of the splitter'
          NoneColorColor = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 3
          OnSelect = GamesListSplitterSingleColorSelect
        end
        object GamesListSplitterSingleColorHot: TColorBox
          Left = 64
          Top = 104
          Width = 221
          Height = 22
          Hint = 'Color of the splitter while hovering mouse'
          DefaultColorColor = clGray
          NoneColorColor = clGray
          Selected = clGray
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
          OnSelect = GamesListSplitterSingleColorHotSelect
        end
        object ButtonGamesListSplitterSingleColorDefault: TBitBtn
          Left = 78
          Top = 51
          Width = 47
          Height = 23
          Hint = 'Set single color default values'
          Caption = 'Default'
          TabOrder = 5
          OnClick = ButtonGamesListSplitterSingleColorDefaultClick
        end
      end
      object MAMu_IconsFolder: TEdit
        Left = 50
        Top = 526
        Width = 452
        Height = 21
        Hint = 'Select MAMu_ Icons Folder'
        AutoSize = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
      end
      object ButtonMAMu_IconsFolderSelect: TBitBtn
        Left = 504
        Top = 526
        Width = 49
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        TabOrder = 10
        OnClick = ButtonMAMu_IconsFolderSelectClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'Images'
      object LabelImagePanelOuterFrameColor: TLabel
        Left = 16
        Top = 156
        Width = 179
        Height = 15
        Caption = 'Panel Outer Frame Color (7 Pixels)'
        ShowAccelChar = False
        Transparent = True
      end
      object GroupBoxImageSplitters: TAdvGroupBox
        Left = 16
        Top = 12
        Width = 293
        Height = 133
        RoundEdges = True
        Caption = 'Splitters'
        Ctl3D = True
        TabOrder = 0
        object LabelImageSplitterSingleColor: TLabel
          Left = 8
          Top = 82
          Width = 29
          Height = 15
          Caption = 'Color'
          Transparent = True
        end
        object LabelImageSplitterSingleColorHot: TLabel
          Left = 8
          Top = 107
          Width = 52
          Height = 15
          Caption = 'Hot Color'
          Transparent = True
        end
        object LabelImageSplitterSingleColorDefault: TShadowLabel
          Left = 8
          Top = 56
          Width = 67
          Height = 16
          Caption = 'Single Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object ImageSplitterShowGripIcon: TAdvOfficeCheckBox
          Left = 183
          Top = 50
          Width = 103
          Height = 20
          Hint = 'Show/hide grip icon in the middle of the image splitters'
          Checked = True
          TabOrder = 0
          OnClick = ImageSplitterShowGripIconClick
          Alignment = taLeftJustify
          Caption = 'Show Grip Icon'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object ImageSplitterSingleColor: TColorBox
          Left = 64
          Top = 78
          Width = 221
          Height = 22
          Hint = 'Color of the splitter'
          NoneColorColor = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 1
          OnSelect = ImageSplitterSingleColorSelect
        end
        object ImageSplitterSingleColorHot: TColorBox
          Left = 64
          Top = 104
          Width = 221
          Height = 22
          Hint = 'Color of the splitter while hovering mouse'
          DefaultColorColor = clGray
          NoneColorColor = clGray
          Selected = clGray
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 2
          OnSelect = ImageSplitterSingleColorHotSelect
        end
        object ButtonImageSplitterStyleDefault: TBitBtn
          Left = 236
          Top = 20
          Width = 47
          Height = 23
          Hint = 'Set splitter default style'
          Caption = 'Default'
          TabOrder = 3
          OnClick = ButtonImageSplitterStyleDefaultClick
        end
        object ButtonImageSplitterSingleColorDefault: TBitBtn
          Left = 78
          Top = 51
          Width = 47
          Height = 23
          Hint = 'Set single color default values'
          Caption = 'Default'
          TabOrder = 4
          OnClick = ButtonImageSplitterSingleColorDefaultClick
        end
        object ImageSplitterStyleSelector: TComboBox
          Left = 8
          Top = 21
          Width = 220
          Height = 23
          Hint = 'Set splitter style'
          Style = csDropDownList
          Ctl3D = True
          DropDownCount = 20
          ItemHeight = 15
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 5
          Text = 'Single Color (Customizable)'
          OnSelect = ImageSplitterStyleSelectorSelect
          Items.Strings = (
            'Silver'
            'Single Color (Customizable)'
            'Office 2003 Blue'
            'Office 2003 Silver'
            'Office 2003 Olive'
            'Office 2003 Classic'
            'Office 2007 Luna (Default)'
            'Office 2007 Silver'
            'Office 2007 Obsidian'
            'Windows XP'
            'Whidbey'
            'Windows Vista'
            'Windows 7'
            'Terminal'
            'Office 2010 Blue'
            'Office 2010 Silver'
            'Office 2010 Black')
        end
      end
      object ImagePanelOuterFrameColor: TColorBox
        Left = 16
        Top = 174
        Width = 244
        Height = 22
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = ImagePanelOuterFrameColorSelect
      end
      object ButtonImagePanelOuterFrameColorDefault: TBitBtn
        Left = 262
        Top = 173
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 2
        OnClick = ButtonImagePanelOuterFrameColorDefaultClick
      end
      object HintBoxSettings: TAdvGroupBox
        Left = 503
        Top = 12
        Width = 243
        Height = 248
        RoundEdges = True
        Caption = 'Hint Box'
        Ctl3D = True
        TabOrder = 3
        object LabelHintBox_Color: TLabel
          Left = 8
          Top = 48
          Width = 29
          Height = 15
          Caption = 'Color'
          Transparent = True
        end
        object LabelHintBox_FrameColor: TLabel
          Left = 8
          Top = 74
          Width = 33
          Height = 15
          Caption = 'Frame'
          Transparent = True
        end
        object LabelHintBox_Opacity: TLabel
          Left = 8
          Top = 97
          Width = 70
          Height = 15
          Caption = 'Opacity [200]'
        end
        object LabelHintBox_TextColor: TLabel
          Left = 8
          Top = 194
          Width = 22
          Height = 15
          Caption = 'Text'
          Transparent = True
        end
        object LabelHintBox_TextShadowColor: TLabel
          Left = 8
          Top = 221
          Width = 42
          Height = 15
          Caption = 'Shadow'
          Transparent = True
        end
        object HintBox_Color: TColorBox
          Left = 49
          Top = 44
          Width = 187
          Height = 22
          Hint = 'Hint box background color'
          DefaultColorColor = 16750899
          NoneColorColor = clBtnFace
          Selected = 16750899
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 0
        end
        object HintBox_FrameColor: TColorBox
          Left = 49
          Top = 70
          Width = 187
          Height = 22
          Hint = 'Hint box frame color'
          DefaultColorColor = 16750899
          NoneColorColor = clBtnFace
          Selected = 16750899
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 1
        end
        object HintBox_FrameEnabled: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 109
          Height = 20
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Show Box Frame'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object HintBox_Opacity: TGaugeBar
          Left = 8
          Top = 114
          Width = 177
          Height = 20
          Hint = 'Transparency level of the hint box'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 5
          Max = 255
          ShowHandleGrip = True
          Position = 200
          OnChange = HintBox_OpacityChange
        end
        object ButtonDefaultHintBox_Opacity: TBitBtn
          Left = 188
          Top = 113
          Width = 47
          Height = 22
          Hint = 'Set opacity to default level'
          Caption = 'Default'
          TabOrder = 4
          OnClick = ButtonDefaultHintBox_OpacityClick
        end
        object HintBox_TextShadowColor: TColorBox
          Left = 53
          Top = 217
          Width = 182
          Height = 22
          Hint = 'Text shadow color'
          NoneColorColor = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
        end
        object HintBox_TextColor: TColorBox
          Left = 53
          Top = 191
          Width = 182
          Height = 22
          Hint = 'Text color'
          DefaultColorColor = clWhite
          NoneColorColor = clBtnFace
          Selected = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 6
        end
        object ButtonHintBoxDefaultColors: TBitBtn
          Left = 188
          Top = 16
          Width = 47
          Height = 23
          Hint = 'Set hint box colors to default'
          Caption = 'Default'
          TabOrder = 7
          OnClick = ButtonHintBoxDefaultColorsClick
        end
        object ButtonHintTextDefaultColors: TBitBtn
          Left = 188
          Top = 163
          Width = 47
          Height = 23
          Hint = 'Set text colors to default'
          Caption = 'Default'
          TabOrder = 8
          OnClick = ButtonHintTextDefaultColorsClick
        end
        object HintBox_TextShadowEnabled: TAdvOfficeCheckBox
          Left = 8
          Top = 167
          Width = 120
          Height = 20
          Checked = True
          TabOrder = 9
          Alignment = taLeftJustify
          Caption = 'Show Text Shadow'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object HintBox_IconEnabled: TAdvOfficeCheckBox
          Left = 8
          Top = 147
          Width = 171
          Height = 20
          Checked = True
          TabOrder = 10
          Alignment = taLeftJustify
          Caption = 'Show Unzipped/Zipped Icon'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
      end
      object ImagesSpecialSettingsGroupBox: TAdvGroupBox
        Left = 16
        Top = 448
        Width = 293
        Height = 99
        RoundEdges = True
        Caption = 'Special Settings'
        Ctl3D = True
        TabOrder = 4
        object LabelFixRetroArchImageFileNames: TLabel
          Left = 24
          Top = 77
          Width = 238
          Height = 18
          Caption = 'Replace & * '#39' < > ? | chars by _ (underscore)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object LabelImageDisableThreadedLoading: TLabel
          Left = 24
          Top = 37
          Width = 254
          Height = 18
          Caption = 'Fix delay and "invalid pointer operation" error'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object FixRetroArchImageFileNames: TAdvOfficeCheckBox
          Left = 8
          Top = 60
          Width = 254
          Height = 20
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Fix Image File Name for RetroArch Frontend'
          ReturnIsTab = False
          Themed = True
        end
        object ImageDisableThreadedLoading: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 244
          Height = 20
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Disable Threaded Preview Images Loading'
          ReturnIsTab = False
          Themed = True
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 3
      Caption = 'Game Documents'
      object LabelAppearanceGameDocuments: TLabel
        Left = 16
        Top = 182
        Width = 96
        Height = 15
        Caption = 'Background Color'
        ShowAccelChar = False
        Transparent = True
      end
      object ShadowLabel1: TShadowLabel
        Left = 222
        Top = 408
        Width = 317
        Height = 19
        Caption = 'Enable this feature in games popup menu or "F3" hot-key'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 16448250
        ShadowEnabled = False
        EllipsType = etNone
      end
      object LabelGoToMAMEInfo: TShadowLabel
        Left = 125
        Top = 501
        Width = 198
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://mameinfo.mameworld.info'
        Caption = 'Go To MASH'#39's MAMEInfo (mameinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMARP: TShadowLabel
        Left = 421
        Top = 533
        Width = 214
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://replay.marpirc.net'
        Caption = 'Go To MAME Action Replay Page (marp.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEScore: TShadowLabel
        Left = 421
        Top = 501
        Width = 146
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.arcadehits.net/mamescore/index.php'
        Caption = 'Go To MAMEScore (story.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEHistory: TShadowLabel
        Left = 421
        Top = 517
        Width = 164
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.arcade-history.com'
        Caption = 'Go To MAME History (history.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMESSInfo: TShadowLabel
        Left = 125
        Top = 517
        Width = 212
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/messinfo/'
        Caption = 'Go To AntoPISA'#39's MESS Info (messinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToGameInit: TShadowLabel
        Left = 125
        Top = 533
        Width = 275
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/gameinit/'
        Caption = 'Go To AntoPISA'#39's Game Initialization Page (gameinit.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object GameDocumentsBackgroundColor: TColorBox
        Left = 16
        Top = 200
        Width = 234
        Height = 22
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = GameDocumentsBackgroundColorSelect
      end
      object ButtonGameDocumentsFont: TBitBtn
        Left = 252
        Top = 199
        Width = 47
        Height = 23
        Hint = 'Select font for window texts'
        Caption = 'Font'
        TabOrder = 1
        OnClick = ButtonGameDocumentsFontClick
      end
      object GroupBoxGameDocsSplitter: TAdvGroupBox
        Left = 452
        Top = 12
        Width = 293
        Height = 133
        RoundEdges = True
        Caption = 'Splitter'
        Ctl3D = True
        TabOrder = 3
        object LabelGameDocsSplitterSingleColorDefault: TShadowLabel
          Left = 8
          Top = 56
          Width = 67
          Height = 16
          Caption = 'Single Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object LabelGameDocsSplitterSingleColor: TLabel
          Left = 8
          Top = 82
          Width = 29
          Height = 15
          Caption = 'Color'
          Transparent = True
        end
        object LabelGameDocsSplitterSingleColorHot: TLabel
          Left = 8
          Top = 107
          Width = 52
          Height = 15
          Caption = 'Hot Color'
          Transparent = True
        end
        object GameDocsSplitterStyleSelector: TComboBox
          Left = 8
          Top = 21
          Width = 220
          Height = 23
          Hint = 'Set splitter style'
          Style = csDropDownList
          Ctl3D = True
          DropDownCount = 20
          ItemHeight = 15
          ItemIndex = 6
          ParentCtl3D = False
          TabOrder = 0
          Text = 'Office 2007 Luna (Default)'
          OnSelect = GameDocsSplitterStyleSelectorSelect
          Items.Strings = (
            'Silver'
            'Single Color (Customizable)'
            'Office 2003 Blue'
            'Office 2003 Silver'
            'Office 2003 Olive'
            'Office 2003 Classic'
            'Office 2007 Luna (Default)'
            'Office 2007 Silver'
            'Office 2007 Obsidian'
            'Windows XP'
            'Whidbey'
            'Windows Vista'
            'Windows 7'
            'Terminal'
            'Office 2010 Blue'
            'Office 2010 Silver'
            'Office 2010 Black')
        end
        object ButtonGameDocsSplitterStyleDefault: TBitBtn
          Left = 236
          Top = 20
          Width = 47
          Height = 23
          Hint = 'Set splitters default style'
          Caption = 'Default'
          TabOrder = 1
          OnClick = ButtonGameDocsSplitterStyleDefaultClick
        end
        object GameDocsSplitterShowGripIcon: TAdvOfficeCheckBox
          Left = 183
          Top = 50
          Width = 97
          Height = 20
          Hint = 
            'Show/hide grip icon in the middle of the splitter (games list/ga' +
            'me docs)'
          Checked = True
          TabOrder = 2
          OnClick = GameDocsSplitterShowGripIconClick
          Alignment = taRightJustify
          Caption = 'Show Grip Icon'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GameDocsSplitterSingleColor: TColorBox
          Left = 64
          Top = 78
          Width = 221
          Height = 22
          Hint = 'Color of the splitter'
          NoneColorColor = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 3
          OnSelect = GameDocsSplitterSingleColorSelect
        end
        object GameDocsSplitterSingleColorHot: TColorBox
          Left = 64
          Top = 104
          Width = 221
          Height = 22
          Hint = 'Color of the splitter while hovering mouse'
          DefaultColorColor = clGray
          NoneColorColor = clGray
          Selected = clGray
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
          OnSelect = GameDocsSplitterSingleColorHotSelect
        end
        object ButtonGameDocsSplitterSingleColorDefault: TBitBtn
          Left = 78
          Top = 51
          Width = 47
          Height = 23
          Hint = 'Set single color default values'
          Caption = 'Default'
          TabOrder = 5
          OnClick = ButtonGameDocsSplitterSingleColorDefaultClick
        end
      end
      object GameDocsDisplayOrderBox: TAdvGroupBox
        Left = 16
        Top = 12
        Width = 331
        Height = 157
        RoundEdges = True
        Caption = 'Display Order'
        Ctl3D = True
        TabOrder = 4
        object GameDocs: TEasyListview
          Tag = 1
          Left = 8
          Top = 21
          Width = 263
          Height = 128
          BackGround.Enabled = True
          CellSizes.Report.Height = 20
          Color = clWhite
          Ctl3D = True
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000000000105010000FFFFFF1F0001000000
            00000000000000000000000000000000}
          Header.Draggable = False
          Header.FixedSingleColumn = True
          Header.Height = 23
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.Border = 1
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.CaptionIndent = 2
          PaintInfoItem.CheckType = ectBox
          PaintInfoItem.ShowBorder = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          Selection.BlendColorSelRect = 10902593
          Selection.BlendIcon = False
          Selection.BorderColor = 10902593
          Selection.BorderColorSelRect = 10902593
          Selection.Color = 10902593
          Selection.FullCellPaint = True
          Selection.FullItemPaint = True
          Selection.FullRowSelect = True
          Selection.GradientColorBottom = 16506264
          Selection.GradientColorTop = 15582647
          Selection.InactiveBorderColor = 10902593
          Selection.InactiveColor = 15582647
          Selection.MouseButton = [cmbLeft, cmbRight]
          Selection.RoundRectRadius = 2
          Selection.TextColor = clBlack
          Selection.UseFocusRect = False
          TabOrder = 0
          View = elsReport
          OnItemPaintText = GameDocsItemPaintText
        end
        object ButtonUp: TBitBtn
          Tag = 1
          Left = 276
          Top = 21
          Width = 47
          Height = 23
          Hint = 'Move selected item up'
          Caption = 'Up'
          TabOrder = 1
          TabStop = False
          OnClick = ButtonUpClick
        end
        object ButtonDown: TBitBtn
          Left = 276
          Top = 44
          Width = 47
          Height = 23
          Hint = 'Move selected folder down'
          Caption = 'Down'
          TabOrder = 2
          TabStop = False
          OnClick = ButtonUpClick
        end
        object ButtonResetAutoGameInfoOrder: TBitBtn
          Left = 276
          Top = 127
          Width = 47
          Height = 23
          Hint = 'Set the order of the texts to default'
          Caption = 'Reset'
          TabOrder = 3
          OnClick = ButtonResetAutoGameInfoOrderClick
        end
      end
      object ButtonGameDocumentsDefault: TBitBtn
        Left = 300
        Top = 199
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values'
        Caption = 'Default'
        TabOrder = 2
        OnClick = ButtonGameDocumentsDefaultClick
      end
      object GameDocsDisplayModeBox: TAdvGroupBox
        Left = 16
        Top = 236
        Width = 331
        Height = 96
        RoundEdges = True
        Caption = 'Display Mode'
        Ctl3D = True
        TabOrder = 5
        object LabelGameDocsDisplayModeSinglePanel: TShadowLabel
          Left = 24
          Top = 37
          Width = 208
          Height = 19
          Caption = 'Show images and game docs together'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object LabelGameDocsDisplayModeTabs: TShadowLabel
          Left = 24
          Top = 73
          Width = 262
          Height = 19
          Caption = 'Show images and game docs in separate panels'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
        end
        object GameDocsDisplayModeTabs: TAdvOfficeRadioButton
          Tag = 1
          Left = 8
          Top = 56
          Width = 225
          Height = 20
          TabOrder = 0
          OnClick = GameDocsDisplayModeSinglePanelClick
          Alignment = taLeftJustify
          Caption = 'Images and Game Docs Tabbed Panels'
          ReturnIsTab = False
          Themed = True
        end
        object GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButton
          Left = 8
          Top = 20
          Width = 213
          Height = 20
          TabOrder = 1
          TabStop = True
          OnClick = GameDocsDisplayModeSinglePanelClick
          Alignment = taLeftJustify
          Caption = 'Images and Game Docs Single Panel'
          Checked = True
          ReturnIsTab = False
          Themed = True
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 4
      Caption = 'Night Mode'
      object NightModeToolBarBackgroundColors: TAdvGroupBox
        Left = 16
        Top = 12
        Width = 256
        Height = 125
        CheckBox.Action = caNone
        RoundEdges = True
        Caption = 'Tool Bar Background Colors'
        Ctl3D = True
        TabOrder = 0
        object LabelNightModeToolBarBkTopColor: TShadowLabel
          Left = 8
          Top = 48
          Width = 24
          Height = 16
          Caption = 'Top'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object LabelNightModeToolBarBkBottomColor: TShadowLabel
          Left = 8
          Top = 74
          Width = 43
          Height = 16
          Caption = 'Bottom'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object NightModeToolBarBkTopColor: TColorBox
          Left = 62
          Top = 44
          Width = 187
          Height = 22
          DefaultColorColor = 5832704
          NoneColorColor = clBtnFace
          Selected = 5832704
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 0
          OnSelect = NightModeToolBarBkTopColorSelect
        end
        object NightModeToolBarFrameColor: TColorBox
          Left = 62
          Top = 96
          Width = 187
          Height = 22
          DefaultColorColor = clBlue
          NoneColorColor = clBtnFace
          Selected = clBlue
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 1
          OnSelect = NightModeToolBarFrameColorSelect
        end
        object NightModeToolBarBkColorsDefaultButton: TBitBtn
          Left = 201
          Top = 16
          Width = 47
          Height = 21
          Caption = 'Default'
          TabOrder = 2
          OnClick = NightModeToolBarBkColorsDefaultButtonClick
        end
        object NightModeToolBarShowFrame: TAdvOfficeCheckBox
          Left = 8
          Top = 97
          Width = 53
          Height = 20
          Checked = True
          TabOrder = 3
          OnClick = NightModeToolBarShowFrameClick
          Alignment = taLeftJustify
          Caption = 'Frame'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object NightModeToolBarGradientBar: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 87
          Height = 20
          TabOrder = 4
          OnClick = NightModeToolBarGradientBarClick
          Alignment = taLeftJustify
          Caption = 'Gradient Bar'
          ReturnIsTab = False
          Themed = True
        end
        object NightModeToolBarBkBottomColor: TColorBox
          Left = 62
          Top = 70
          Width = 187
          Height = 22
          DefaultColorColor = 1
          NoneColorColor = clBtnFace
          Selected = 1
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
          OnSelect = NightModeToolBarBkBottomColorSelect
        end
      end
    end
  end
end
