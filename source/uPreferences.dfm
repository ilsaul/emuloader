object FormPreferences: TFormPreferences
  Left = 468
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 647
  ClientWidth = 951
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
    Width = 951
    Height = 29
    Align = alTop
    Color1 = 14540253
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonPageGeneral: TSpeedButton
      Left = 1
      Top = 1
      Width = 150
      Height = 26
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
      Left = 152
      Top = 1
      Width = 150
      Height = 26
      GroupIndex = 1
      Caption = 'Games List / Columns'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageImages: TSpeedButton
      Tag = 2
      Left = 303
      Top = 1
      Width = 150
      Height = 26
      GroupIndex = 1
      Caption = 'Images'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
    object ButtonPageGameDocuments: TSpeedButton
      Tag = 3
      Left = 454
      Top = 1
      Width = 150
      Height = 26
      GroupIndex = 1
      Caption = 'MAME Game Docs'
      Flat = True
      OnClick = ButtonPageGeneralClick
    end
  end
  object PageOptions: TNotebook
    Left = 0
    Top = 29
    Width = 951
    Height = 618
    Color = 15856113
    ParentColor = False
    TabOrder = 0
    OnPageChanged = PageOptionsPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'General'
      object LabelIgnoreExitCode1InvalidFunction: TShadowLabel
        Left = 32
        Top = 188
        Width = 287
        Height = 19
        Caption = 'Do not display this error after exiting the emulator'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelUseItalicFontStyleSystemTitleBar: TShadowLabel
        Left = 32
        Top = 228
        Width = 254
        Height = 19
        Caption = 'Uncheck this option if you dislike italic fonts'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object DisableMinimize: TAdvOfficeCheckBoxEx
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
      object HideDOSBoxFrame: TAdvGroupBoxEx
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
          WordWrap = True
        end
        object HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBoxEx
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
        object HideDOSBoxRunGame: TAdvOfficeCheckBoxEx
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
      object AllowOnlyOneInstance: TAdvOfficeCheckBoxEx
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
      object IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 171
        Width = 329
        Height = 20
        Checked = True
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Ignore "Exit Code 1: Invalid Function" (Console/Computer)'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object RestoreInternetGameInfoStartup: TAdvOfficeCheckBoxEx
        Left = 15
        Top = 467
        Width = 230
        Height = 20
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Restore "Internet Game Info" at Startup'
        ReturnIsTab = False
        Themed = True
      end
      object GroupBoxInternetGameInfo: TAdvGroupBoxEx
        Left = 15
        Top = 496
        Width = 752
        Height = 106
        RoundEdges = True
        Caption = 
          'Internet Game Info                                              ' +
          '                                                                ' +
          '                  '
        Ctl3D = True
        TabOrder = 5
        object LabelInternetGameInfoLink: TShadowLabel
          Left = 8
          Top = 20
          Width = 83
          Height = 16
          Caption = 'Game Info Link'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object LabelInternetMAMESoftwareListGameInfoLink: TShadowLabel
          Left = 8
          Top = 60
          Width = 192
          Height = 16
          Caption = 'MAME Software List Game Info Link'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object Label5: TShadowLabel
          Left = 115
          Top = 1
          Width = 290
          Height = 15
          Caption = 'Tag       required to be replaced by                  and'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label6: TShadowLabel
          Left = 141
          Top = 1
          Width = 350
          Height = 15
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
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object InternetGameInfoLink: TEditEx
          Left = 8
          Top = 36
          Width = 450
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 0
        end
        object InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtn
          Left = 459
          Top = 35
          Width = 142
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Reset to ProgettoEMMA'
          TabOrder = 1
          OnClick = InternetGameInfoProgettoEMMALinkButtonDefaultClick
        end
        object InternetMAMESoftwareListGameInfoLink: TEditEx
          Left = 8
          Top = 76
          Width = 450
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 2
        end
        object InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtn
          Left = 459
          Top = 75
          Width = 142
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Reset to ProgettoEMMA'
          TabOrder = 3
          OnClick = InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefaultClick
        end
        object InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtn
          Left = 603
          Top = 35
          Width = 142
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Reset to Arcade Italia'
          TabOrder = 4
          OnClick = InternetGameInfoArcadeItaliaLinkButtonDefaultClick
        end
        object InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtn
          Left = 603
          Top = 75
          Width = 142
          Height = 23
          Hint = 'Reset link to default'
          Caption = 'Reset to Arcade Italia'
          TabOrder = 5
          OnClick = InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefaultClick
        end
      end
      object UseItalicFontStyleSystemTitleBar: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 211
        Width = 233
        Height = 20
        Checked = True
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Use Italic Font Style in System Title Bars'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Games List Appearance'
      object LabelDisableNaturalSorting: TShadowLabel
        Left = 658
        Top = 317
        Width = 201
        Height = 19
        Caption = 'Use ASCII sorting (1, 10, 11, 2, 20, 3)'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelGameMultilineCaptions: TShadowLabel
        Left = 658
        Top = 277
        Width = 218
        Height = 19
        Caption = 'Show full caption (32x32 / 48x48 icons)'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelDisableDeleteSelectedGames: TShadowLabel
        Left = 658
        Top = 438
        Width = 212
        Height = 19
        Caption = 'Safeguard ROMs from naughty kiddies'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object MAMu_Icon: TImage
        Left = 16
        Top = 570
        Width = 32
        Height = 32
        Transparent = True
      end
      object LabelMAMu_IconsFolder: TShadowLabel
        Left = 50
        Top = 566
        Width = 246
        Height = 16
        Caption = 'MAMu_ Icons Folder (MAME and arcade only)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelAddLeadingZeroVersionInfoMAME: TShadowLabel
        Left = 658
        Top = 357
        Width = 257
        Height = 19
        Caption = 'Show a zero in front of the text instead of .???'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ButtonCustomizeGameFonts: TBitBtn
        Left = 642
        Top = 380
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
      object ColumnsSettingsGroupBox: TAdvGroupBoxEx
        Left = 642
        Top = 85
        Width = 293
        Height = 163
        Transparent = False
        RoundEdges = True
        Caption = 'Details/Grouped View Columns Settings'
        Ctl3D = True
        TabOrder = 1
        object DisableCloneIndent: TAdvOfficeCheckBoxEx
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
        object DisableDriverStatusIcons: TAdvOfficeCheckBoxEx
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
        object DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBoxEx
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
        object HideDriverStatusTexts: TAdvOfficeCheckBoxEx
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
        object ShortDriverColumnTitles: TAdvOfficeCheckBoxEx
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
        object LastPlayedHideSeconds: TAdvOfficeCheckBoxEx
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
        object TotalPlayTimeHideSeconds: TAdvOfficeCheckBoxEx
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
      object GamesBackgroundGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 919
        Height = 61
        RoundEdges = True
        Caption = 'Background'
        Ctl3D = True
        TabOrder = 2
        object GamesBackgroundColor: TColorBox
          Left = 8
          Top = 31
          Width = 205
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
          Left = 215
          Top = 30
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
        object GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx
          Left = 282
          Top = 12
          Width = 192
          Height = 18
          TabOrder = 2
          OnClick = GamesBackgroundImageEnableClick
          Alignment = taLeftJustify
          Caption = 'Use Image as Background [.png]'
          ReturnIsTab = False
          Themed = True
        end
        object GamesBackgroundImage: TEditEx
          Left = 282
          Top = 31
          Width = 528
          Height = 21
          AutoSize = False
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object GamesTileBackground: TAdvOfficeCheckBoxEx
          Left = 770
          Top = 12
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
          Left = 813
          Top = 30
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
          Left = 862
          Top = 30
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
      object DisableNaturalSorting: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 300
        Width = 237
        Height = 18
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 3
        OnClick = DisableNaturalSortingClick
        Alignment = taLeftJustify
        Caption = 'Disable Natural Sorting (1, 2, 3, 10, 11, 20)'
        ReturnIsTab = False
        Themed = True
      end
      object GameMultilineCaptions: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 260
        Width = 242
        Height = 20
        TabOrder = 4
        OnClick = GameMultilineCaptionsClick
        Alignment = taLeftJustify
        Caption = 'Multiline Captions (Details/Grouped View)'
        ReturnIsTab = False
        Themed = True
      end
      object GamesListStatusBarBox: TAdvGroupBoxEx
        Left = 16
        Top = 230
        Width = 293
        Height = 203
        RoundEdges = True
        Caption = 'Games List Status Bar Colors (Light Mode)'
        Ctl3D = True
        TabOrder = 5
        object LabelGamesListStatusBarBottomColor: TShadowLabel
          Left = 8
          Top = 73
          Width = 43
          Height = 16
          Caption = 'Bottom'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGamesListStatusBarTopColor: TShadowLabel
          Left = 8
          Top = 48
          Width = 24
          Height = 16
          Caption = 'Top'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGamesListStatusBarFontColor: TShadowLabel
          Left = 8
          Top = 152
          Width = 52
          Height = 16
          Caption = 'Text Font'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object GamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx
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
          Left = 95
          Top = 70
          Width = 190
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
          Left = 236
          Top = 16
          Width = 47
          Height = 21
          Hint = 'Reset colors to default'
          Caption = 'Default'
          TabOrder = 2
          OnClick = GamesListStatusBarButtonDefaultClick
        end
        object GamesListStatusBarTopColor: TColorBox
          Left = 95
          Top = 44
          Width = 190
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
          Left = 95
          Top = 148
          Width = 190
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
          OnSelect = GamesListStatusBarFontColorSelect
        end
        object GamesListStatusBarInnerFrameColor: TColorBox
          Left = 95
          Top = 96
          Width = 190
          Height = 22
          DefaultColorColor = 7891291
          NoneColorColor = 7891291
          Selected = 7891291
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
          OnSelect = GamesListStatusBarInnerFrameColorSelect
        end
        object GamesListStatusBarOuterFrameColor: TColorBox
          Left = 95
          Top = 122
          Width = 190
          Height = 22
          DefaultColorColor = 11775403
          NoneColorColor = 11775403
          Selected = 11775403
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 6
          OnSelect = GamesListStatusBarOuterFrameColorSelect
        end
        object GamesListStatusBarShadowFontColor: TColorBox
          Left = 95
          Top = 174
          Width = 190
          Height = 22
          DefaultColorColor = clSilver
          NoneColorColor = clSilver
          Selected = clSilver
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 7
          OnSelect = GamesListStatusBarShadowFontColorSelect
        end
        object GamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 176
          Width = 87
          Height = 20
          TabOrder = 8
          TabStop = True
          OnClick = GamesListStatusBarShadowFontEnabledClick
          Alignment = taLeftJustify
          Caption = 'Text Shadow'
          ReturnIsTab = False
          Themed = True
        end
        object GamesListStatusBarShowInnerFrame: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 97
          Width = 82
          Height = 20
          Hint = 'Check to show a double border (outer frame must be enabled)'
          Checked = True
          TabOrder = 9
          OnClick = GamesListStatusBarShowOuterFrameClick
          Alignment = taLeftJustify
          Caption = 'Inner Frame'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GamesListStatusBarShowOuterFrame: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 123
          Width = 85
          Height = 20
          Hint = 'Check to show a single border'
          Checked = True
          TabOrder = 10
          OnClick = GamesListStatusBarShowOuterFrameClick
          Alignment = taLeftJustify
          Caption = 'Outer Frame'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
      end
      object DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 421
        Width = 237
        Height = 20
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 6
        OnClick = DisableDeleteSelectedGamesClick
        Alignment = taLeftJustify
        Caption = 'Disable "Delete/Copy/Move Games Files"'
        ReturnIsTab = False
        Themed = True
      end
      object GroupBoxGamesListSplitters: TAdvGroupBoxEx
        Left = 16
        Top = 85
        Width = 293
        Height = 133
        RoundEdges = True
        Caption = 'Games List / Machines List Splitters'
        Ctl3D = True
        TabOrder = 7
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGamesListSplitterSingleColor: TShadowLabel
          Left = 8
          Top = 82
          Width = 32
          Height = 16
          Caption = 'Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGamesListSplitterSingleColorHot: TShadowLabel
          Left = 8
          Top = 107
          Width = 55
          Height = 16
          Caption = 'Hot Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
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
        object GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
          Left = 191
          Top = 52
          Width = 97
          Height = 20
          Hint = 'Show/hide grip icon in the middle of the splitter'
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
      object MAMu_IconsFolder: TEditEx
        Left = 50
        Top = 582
        Width = 332
        Height = 21
        Hint = 'Select MAMu_ Icons Folder'
        AutoSize = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
      end
      object ButtonMAMu_IconsFolderSelect: TBitBtn
        Left = 384
        Top = 582
        Width = 49
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        TabOrder = 9
        OnClick = ButtonMAMu_IconsFolderSelectClick
      end
      object GroupBoxGamesListSelectionBar: TAdvGroupBoxEx
        Left = 329
        Top = 85
        Width = 293
        Height = 398
        RoundEdges = True
        Caption = 'Selection Bar'
        Ctl3D = True
        TabOrder = 10
        object Label2: TShadowLabel
          Left = 8
          Top = 48
          Width = 58
          Height = 16
          Caption = 'Top Bkgrd'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label10: TShadowLabel
          Left = 8
          Top = 126
          Width = 52
          Height = 16
          Caption = 'Text Font'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label14: TShadowLabel
          Left = 8
          Top = 172
          Width = 58
          Height = 16
          Caption = 'Top Bkgrd'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label15: TShadowLabel
          Left = 8
          Top = 249
          Width = 52
          Height = 16
          Caption = 'Text Font'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel4: TShadowLabel
          Left = 80
          Top = 150
          Width = 181
          Height = 16
          Caption = 'Games With Missing ROMs/CHDs'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object Label17: TShadowLabel
          Left = 8
          Top = 295
          Width = 58
          Height = 16
          Caption = 'Top Bkgrd'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label18: TShadowLabel
          Left = 8
          Top = 373
          Width = 52
          Height = 16
          Caption = 'Text Font'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel5: TShadowLabel
          Left = 80
          Top = 273
          Width = 81
          Height = 16
          Caption = 'Inactive Colors'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object Label23: TShadowLabel
          Left = 8
          Top = 73
          Width = 59
          Height = 16
          Caption = 'Bottom Bk'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label24: TShadowLabel
          Left = 8
          Top = 197
          Width = 59
          Height = 16
          Caption = 'Bottom Bk'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label26: TShadowLabel
          Left = 8
          Top = 320
          Width = 59
          Height = 16
          Caption = 'Bottom Bk'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label11: TShadowLabel
          Left = 8
          Top = 99
          Width = 68
          Height = 16
          Caption = 'Frame Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label16: TShadowLabel
          Left = 8
          Top = 222
          Width = 68
          Height = 16
          Caption = 'Frame Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Label19: TShadowLabel
          Left = 8
          Top = 346
          Width = 68
          Height = 16
          Caption = 'Frame Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object GamesSelectionTopColor: TColorBox
          Left = 80
          Top = 44
          Width = 205
          Height = 22
          Hint = 'Top gradient bar color / single color'
          DefaultColorColor = 16571329
          NoneColorColor = clNone
          Selected = 16571329
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 0
        end
        object GameSelectionButtonDefault: TBitBtn
          Left = 236
          Top = 16
          Width = 47
          Height = 21
          Hint = 'Reset colors to default'
          Caption = 'Default'
          TabOrder = 1
          OnClick = GameSelectionButtonDefaultClick
        end
        object GamesSelectionFontColor: TColorBox
          Left = 80
          Top = 122
          Width = 205
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 2
        end
        object GamesSelectionFrameColor: TColorBox
          Left = 80
          Top = 96
          Width = 205
          Height = 22
          DefaultColorColor = 12160100
          NoneColorColor = clNone
          Selected = 12160100
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 3
        end
        object GamesSelectionMissROMsTopColor: TColorBox
          Left = 80
          Top = 168
          Width = 205
          Height = 22
          Hint = 'Top gradient bar color / single color'
          DefaultColorColor = 12704764
          NoneColorColor = clNone
          Selected = 12704764
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 4
        end
        object GamesSelectionMissROMsFontColor: TColorBox
          Left = 80
          Top = 245
          Width = 205
          Height = 22
          DefaultColorColor = clMaroon
          Selected = clMaroon
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
        end
        object GamesSelectionMissROMsFrameColor: TColorBox
          Left = 80
          Top = 219
          Width = 205
          Height = 22
          DefaultColorColor = 6589625
          NoneColorColor = clNone
          Selected = 6589625
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 6
        end
        object GamesSelectionInactiveTopColor: TColorBox
          Left = 80
          Top = 291
          Width = 205
          Height = 22
          Hint = 'Top gradient bar color / single color'
          DefaultColorColor = 13816520
          NoneColorColor = clNone
          Selected = 13816520
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 7
        end
        object GamesSelectionInactiveFontColor: TColorBox
          Left = 80
          Top = 369
          Width = 205
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 8
        end
        object GamesSelectionInactiveFrameColor: TColorBox
          Left = 80
          Top = 343
          Width = 205
          Height = 22
          DefaultColorColor = 9342606
          NoneColorColor = clNone
          Selected = 9342606
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 9
        end
        object GameSelectionAlphaBlend: TAdvOfficeCheckBoxEx
          Left = 112
          Top = 20
          Width = 103
          Height = 18
          Hint = 'Enable alpha blended bar'
          Checked = True
          TabOrder = 10
          OnClick = GameSelectionAlphaBlendClick
          Alignment = taLeftJustify
          Caption = 'Alpha Blending'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object GamesSelectionBottomColor: TColorBox
          Left = 80
          Top = 70
          Width = 205
          Height = 22
          Hint = 'Bottom gradient bar color'
          DefaultColorColor = 16512497
          NoneColorColor = clNone
          Selected = 16512497
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 11
        end
        object GameSelectionGradientBar: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 89
          Height = 18
          Hint = 'Enable alpha blended bar'
          TabOrder = 12
          OnClick = GameSelectionGradientBarClick
          Alignment = taLeftJustify
          Caption = 'Gradient Bar'
          ReturnIsTab = False
          Themed = True
        end
        object GamesSelectionMissROMsBottomColor: TColorBox
          Left = 80
          Top = 194
          Width = 205
          Height = 22
          Hint = 'Bottom gradient bar color'
          DefaultColorColor = 14478332
          NoneColorColor = clNone
          Selected = 14478332
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 13
        end
        object GamesSelectionInactiveBottomColor: TColorBox
          Left = 80
          Top = 317
          Width = 205
          Height = 22
          Hint = 'Bottom gradient bar color'
          DefaultColorColor = 14474460
          NoneColorColor = clNone
          Selected = 14474460
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 14
        end
      end
      object AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 340
        Width = 290
        Height = 18
        TabOrder = 11
        Alignment = taLeftJustify
        Caption = 'Add Leading Zero to Version Info Column (MAME)'
        ReturnIsTab = False
        Themed = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'Images'
      object LabelImageBorderColor: TShadowLabel
        Left = 16
        Top = 156
        Width = 147
        Height = 16
        Caption = 'Image 7 Pixels Border Color'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GroupBoxImageSplitters: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 293
        Height = 133
        RoundEdges = True
        Caption = 'Splitters'
        Ctl3D = True
        TabOrder = 0
        object LabelImageSplitterSingleColor: TShadowLabel
          Left = 8
          Top = 82
          Width = 32
          Height = 16
          Caption = 'Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelImageSplitterSingleColorHot: TShadowLabel
          Left = 8
          Top = 107
          Width = 55
          Height = 16
          Caption = 'Hot Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
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
      object ImageBorderColor: TColorBox
        Left = 16
        Top = 174
        Width = 244
        Height = 22
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = ImageBorderColorSelect
      end
      object ButtonImageBorderColorDefault: TBitBtn
        Left = 262
        Top = 173
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 2
        OnClick = ButtonImageBorderColorDefaultClick
      end
      object HintBoxSettings: TAdvGroupBoxEx
        Left = 642
        Top = 12
        Width = 293
        Height = 228
        RoundEdges = True
        Caption = 'Hint Box'
        Ctl3D = True
        TabOrder = 3
        object LabelHintBox_Color: TShadowLabel
          Left = 8
          Top = 48
          Width = 66
          Height = 16
          Caption = 'Bkgrd Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelHintBox_Opacity: TShadowLabel
          Left = 8
          Top = 97
          Width = 73
          Height = 16
          Caption = 'Opacity [200]'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object LabelHintBox_TextColor: TShadowLabel
          Left = 8
          Top = 174
          Width = 52
          Height = 16
          Caption = 'Text Font'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object HintBox_Color: TColorBox
          Left = 80
          Top = 44
          Width = 205
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
          Left = 80
          Top = 70
          Width = 205
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
        object HintBox_FrameEnabled: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 72
          Width = 57
          Height = 20
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Frame'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object HintBox_Opacity: TGaugeBar
          Left = 8
          Top = 114
          Width = 225
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
          Left = 236
          Top = 113
          Width = 47
          Height = 22
          Hint = 'Set opacity to default level'
          Caption = 'Default'
          TabOrder = 4
          OnClick = ButtonDefaultHintBox_OpacityClick
        end
        object HintBox_TextShadowColor: TColorBox
          Left = 80
          Top = 197
          Width = 205
          Height = 22
          Hint = 'Shadow font color for the text'
          NoneColorColor = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          Ctl3D = True
          ItemHeight = 16
          ParentCtl3D = False
          TabOrder = 5
        end
        object HintBox_TextColor: TColorBox
          Left = 80
          Top = 171
          Width = 205
          Height = 22
          Hint = 'Font color for the text'
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
          Left = 236
          Top = 16
          Width = 47
          Height = 23
          Hint = 'Set hint box colors to default'
          Caption = 'Default'
          TabOrder = 7
          OnClick = ButtonHintBoxDefaultColorsClick
        end
        object ButtonHintTextDefaultColors: TBitBtn
          Left = 236
          Top = 143
          Width = 47
          Height = 23
          Hint = 'Set text colors to default'
          Caption = 'Default'
          TabOrder = 8
          OnClick = ButtonHintTextDefaultColorsClick
        end
        object HintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 199
          Width = 65
          Height = 20
          Checked = True
          TabOrder = 9
          Alignment = taLeftJustify
          Caption = 'Shadow'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object HintBox_IconEnabled: TAdvOfficeCheckBoxEx
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
      object ImagesSpecialSettingsGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 504
        Width = 293
        Height = 99
        RoundEdges = True
        Caption = 'Special Settings'
        Ctl3D = True
        TabOrder = 4
        object LabelFixRetroArchImageFileNames: TShadowLabel
          Left = 24
          Top = 77
          Width = 241
          Height = 19
          Caption = 'Replace & * '#39' < > ? | chars by _ (underscore)'
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelImageDisableThreadedLoading: TShadowLabel
          Left = 24
          Top = 37
          Width = 257
          Height = 19
          Caption = 'Fix delay and "invalid pointer operation" error'
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object FixRetroArchImageFileNames: TAdvOfficeCheckBoxEx
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
        object ImageDisableThreadedLoading: TAdvOfficeCheckBoxEx
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
      object LabelAppearanceGameDocuments: TShadowLabel
        Left = 16
        Top = 230
        Width = 99
        Height = 16
        Caption = 'Background Color'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ShadowLabel1: TShadowLabel
        Left = 317
        Top = 496
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object LabelGoToMAMEInfo: TShadowLabel
        Left = 160
        Top = 557
        Width = 236
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://mameinfo.mameworld.info'
        Caption = 'Go To MASH'#39's MAMEInfo (mameinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMARP: TShadowLabel
        Left = 536
        Top = 589
        Width = 333
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://replay.marpirc.net'
        Caption = 'Go To MAME Action Replay Page (scores3.htm; marp.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEScore: TShadowLabel
        Left = 536
        Top = 557
        Width = 172
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.arcadehits.net/mamescore/index.php'
        Caption = 'Go To MAMEScore (story.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEHistory: TShadowLabel
        Left = 536
        Top = 573
        Width = 193
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.arcade-history.com'
        Caption = 'Go To MAME History (history.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMESSInfo: TShadowLabel
        Left = 160
        Top = 573
        Width = 254
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/messinfo/'
        Caption = 'Go To AntoPISA'#39's MESS Info (messinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToGameInit: TShadowLabel
        Left = 160
        Top = 589
        Width = 332
        Height = 14
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/gameinit/'
        Caption = 'Go To AntoPISA'#39's Game Initialization Page (gameinit.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelMAMEGameManualsPDFFolder: TShadowLabel
        Left = 16
        Top = 416
        Width = 271
        Height = 16
        Caption = 'Directory for PDF Game Manual Files (MAME Only)'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object ShadowLabel6: TShadowLabel
        Left = 116
        Top = 458
        Width = 177
        Height = 19
        Caption = 'Relative folder name supported'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object GameDocsFont_Setting: TShadowLabel
        Left = 263
        Top = 228
        Width = 52
        Height = 15
        Caption = 'UseFont'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Visible = False
      end
      object LabelGameDocsShowStatusBar: TShadowLabel
        Left = 658
        Top = 241
        Width = 230
        Height = 19
        Caption = 'Only visible if 7 pixels border is disabled'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GameDocumentsBackgroundColor: TColorBox
        Left = 16
        Top = 248
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
        Top = 247
        Width = 47
        Height = 23
        Hint = 'Select font for window texts'
        Caption = 'Font'
        TabOrder = 1
        OnClick = ButtonGameDocumentsFontClick
      end
      object GroupBoxGameDocsSplitter: TAdvGroupBoxEx
        Left = 642
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGameDocsSplitterSingleColor: TShadowLabel
          Left = 8
          Top = 82
          Width = 32
          Height = 16
          Caption = 'Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object LabelGameDocsSplitterSingleColorHot: TShadowLabel
          Left = 8
          Top = 107
          Width = 55
          Height = 16
          Caption = 'Hot Color'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
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
        object GameDocsSplitterShowGripIcon: TAdvOfficeCheckBoxEx
          Left = 183
          Top = 52
          Width = 97
          Height = 20
          Hint = 'Show/hide grip icon in the middle of the splitter'
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
      object GameDocsDisplayOrderBox: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 331
        Height = 205
        RoundEdges = True
        Caption = 'Display Order'
        Ctl3D = True
        TabOrder = 4
        object LabelMARP_scores3htm: TShadowLabel
          Left = 80
          Top = 184
          Width = 241
          Height = 14
          Hint = 'http://replay.marpirc.net/txt/scores3.htm'
          Caption = 'http://replay.marpirc.net/txt/scores3.htm'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          OnClick = LabelGoToMAMEInfoClick
          OnMouseEnter = LabelGoToMAMEInfoMouseEnter
          OnMouseLeave = LabelGoToMAMEInfoMouseLeave
        end
        object LabelLinkMARP_scores3htm: TShadowLabel
          Left = 8
          Top = 184
          Width = 61
          Height = 16
          Caption = 'MARP link:'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object GameDocs: TEasyListview
          Tag = 1
          Left = 8
          Top = 21
          Width = 315
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
            0006000000800800010100010000000000000139010000FFFFFF1F0001000000
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
          Left = 8
          Top = 151
          Width = 47
          Height = 23
          Hint = 'Move selected item up'
          Caption = 'Up'
          TabOrder = 1
          TabStop = False
          OnClick = ButtonUpClick
        end
        object ButtonDown: TBitBtn
          Left = 60
          Top = 151
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
          Top = 151
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
        Top = 247
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values'
        Caption = 'Default'
        TabOrder = 2
        OnClick = ButtonGameDocumentsDefaultClick
      end
      object GameDocsDisplayModeBox: TAdvGroupBoxEx
        Left = 16
        Top = 284
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
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
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object GameDocsDisplayModeTabs: TAdvOfficeRadioButtonEx
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
        object GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButtonEx
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
      object GameDocsBorderColor: TColorBox
        Left = 642
        Top = 198
        Width = 244
        Height = 22
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 6
        OnSelect = GameDocsBorderColorSelect
      end
      object ButtonGameDocsBorderColorDefault: TBitBtn
        Left = 888
        Top = 197
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 7
        OnClick = ButtonGameDocsBorderColorDefaultClick
      end
      object GameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 180
        Width = 193
        Height = 17
        Checked = True
        TabOrder = 8
        OnClick = GameDocsShowBorderClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object MAMEGameManualsPDFFolder: TEditEx
        Left = 16
        Top = 432
        Width = 281
        Height = 23
        TabOrder = 9
      end
      object MAMEGameManualsPDFFolderButtonSelect: TBitBtn
        Left = 300
        Top = 432
        Width = 47
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = MAMEGameManualsPDFFolderButtonSelectClick
      end
      object MAMEGameManualsPDFFolderButtonDefault: TBitBtn
        Left = 300
        Top = 456
        Width = 47
        Height = 21
        Hint = 'Click here to reset folder to default'
        Caption = 'Default'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = MAMEGameManualsPDFFolderButtonDefaultClick
      end
      object GameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 642
        Top = 224
        Width = 175
        Height = 17
        TabOrder = 12
        OnClick = GameDocsShowStatusBarClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs Status Bar'
        ReturnIsTab = False
        Themed = True
      end
    end
  end
end
