object FormPreferences: TFormPreferences
  Left = 656
  Top = 296
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 392
  ClientWidth = 505
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
  object PanelEx1: TPanelEx
    Left = 0
    Top = 0
    Width = 505
    Height = 35
    Color1 = 14540253
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14540253
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonGeneral: TSpeedButton
      Left = 7
      Top = 10
      Width = 74
      Height = 25
      GroupIndex = 1
      Down = True
      Caption = 'General'
      Flat = True
      OnClick = ButtonGeneralClick
    end
    object ButtonGamesList: TSpeedButton
      Tag = 1
      Left = 81
      Top = 10
      Width = 125
      Height = 25
      GroupIndex = 1
      Caption = 'Games List/Columns'
      Flat = True
      OnClick = ButtonGeneralClick
    end
    object ButtonImages: TSpeedButton
      Tag = 2
      Left = 206
      Top = 10
      Width = 76
      Height = 25
      GroupIndex = 1
      Caption = 'Images'
      Flat = True
      OnClick = ButtonGeneralClick
    end
    object ButtonGameDocuments: TSpeedButton
      Tag = 3
      Left = 282
      Top = 10
      Width = 125
      Height = 25
      GroupIndex = 1
      Caption = 'Game Docs (MAME)'
      Flat = True
      OnClick = ButtonGeneralClick
    end
    object ButtonVideoPreview: TSpeedButton
      Tag = 4
      Left = 407
      Top = 10
      Width = 90
      Height = 25
      GroupIndex = 1
      Caption = 'Video Preview'
      Flat = True
      OnClick = ButtonGeneralClick
    end
    object Bevel1: TBevel
      Left = 7
      Top = 32
      Width = 491
      Height = 2
    end
  end
  object PageOptions: TNotebook
    Left = 0
    Top = 35
    Width = 505
    Height = 357
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'General'
      object DisableMinimize: TAdvOfficeCheckBox
        Left = 88
        Top = 12
        Width = 165
        Height = 20
        Hint = 'Do not minimize frontend when running games'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Disable Frontend Minimize'
        ReturnIsTab = False
        Themed = True
      end
      object StartupBox: TAdvGroupBox
        Left = 88
        Top = 36
        Width = 329
        Height = 75
        RoundEdges = True
        Caption = 'Startup'
        Ctl3D = True
        TabOrder = 1
        object LabelStartupGamesListNotFound: TLabel
          Left = 10
          Top = 21
          Width = 117
          Height = 15
          Caption = 'Games List Not Found'
          ShowAccelChar = False
          Transparent = True
        end
        object StartupGamesListNotFound: TComboBox
          Left = 10
          Top = 40
          Width = 149
          Height = 23
          Hint = 'Action to take on startup when a games list is not found'
          Style = csDropDownList
          Ctl3D = True
          ItemHeight = 15
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'Ask'
          Items.Strings = (
            'Ask'
            'Auto-Create'
            'Skip')
        end
        object NewBinariesDetectionEnabled: TAdvOfficeCheckBox
          Left = 170
          Top = 17
          Width = 150
          Height = 20
          Hint = 'Check for new emulator binaries at startup'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'New Emulator Detection'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object StartupNewBinaryFound: TComboBox
          Left = 170
          Top = 40
          Width = 149
          Height = 23
          Hint = 'Action to take on startup when a new emulator binary is found'
          Style = csDropDownList
          Ctl3D = True
          ItemHeight = 15
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 2
          Text = 'Ask'
          Items.Strings = (
            'Ask'
            'Auto-Create'
            'Skip')
        end
        object StartupHelpButton: TBitBtn
          Left = 303
          Top = 3
          Width = 15
          Height = 15
          Hint = 'What does it do and what option to choose ?'
          Caption = '?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = StartupHelpButtonClick
        end
      end
      object GroupBoxSplitters: TAdvGroupBox
        Left = 88
        Top = 126
        Width = 329
        Height = 199
        RoundEdges = True
        Caption = 'Splitters'
        Ctl3D = True
        TabOrder = 2
        object LabelSplitterStyleSelector: TLabel
          Left = 16
          Top = 22
          Width = 25
          Height = 15
          Caption = 'Style'
        end
        object SplitterStyleSelector: TComboBox
          Left = 16
          Top = 40
          Width = 240
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
          OnSelect = SplitterStyleSelectorSelect
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
        object ButtonSplitterStyleDefault: TBitBtn
          Left = 264
          Top = 39
          Width = 47
          Height = 23
          Hint = 'Set splitters default style'
          Caption = 'Default'
          TabOrder = 1
          OnClick = ButtonSplitterStyleDefaultClick
        end
        object GroupBoxSplitterSingleColor: TAdvGroupBox
          Left = 16
          Top = 75
          Width = 295
          Height = 104
          RoundEdges = True
          Caption = 'Single Color'
          ParentCtl3D = True
          TabOrder = 2
          object LabelSplitterSingleColor: TLabel
            Left = 8
            Top = 50
            Width = 29
            Height = 15
            Caption = 'Color'
            Transparent = True
          end
          object LabelSplitterSingleColorHot: TLabel
            Left = 8
            Top = 75
            Width = 52
            Height = 15
            Caption = 'Hot Color'
            Transparent = True
          end
          object SplitterSingleColor: TColorBox
            Left = 64
            Top = 46
            Width = 221
            Height = 22
            Hint = 'Color of the splitter'
            NoneColorColor = clBtnFace
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
            Ctl3D = True
            ItemHeight = 16
            ParentCtl3D = False
            TabOrder = 0
            OnSelect = SplitterSingleColorSelect
          end
          object SplitterSingleColorHot: TColorBox
            Left = 64
            Top = 72
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
            TabOrder = 1
            OnSelect = SplitterSingleColorHotSelect
          end
          object ButtonSplitterSingleColorDefault: TBitBtn
            Left = 236
            Top = 16
            Width = 47
            Height = 23
            Hint = 'Set single color default values'
            Caption = 'Default'
            TabOrder = 2
            OnClick = ButtonSplitterSingleColorDefaultClick
          end
        end
        object SplitterGripIcon: TAdvOfficeCheckBox
          Left = 207
          Top = 16
          Width = 105
          Height = 20
          Hint = 
            'Show/hide grip icon in the middle of the splitter (games list/ga' +
            'me docs)'
          Checked = True
          TabOrder = 3
          OnClick = SplitterGripIconClick
          Alignment = taRightJustify
          Caption = 'Enable Grip Icon'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Games List Appearance'
      object LabelMAMu_IconsFolder: TLabel
        Left = 50
        Top = 304
        Width = 278
        Height = 15
        Caption = 'MAMu_ Icons Folder (frontend relative path support)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object MAMu_Icon: TImage
        Left = 16
        Top = 308
        Width = 32
        Height = 32
        Transparent = True
      end
      object LabelDisableNaturalSorting: TLabel
        Left = 32
        Top = 267
        Width = 232
        Height = 16
        Caption = 'Check to use ASCII sorting (1, 10, 11, 2, 20, 3)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object ButtonCustomizeGameFonts: TBitBtn
        Left = 16
        Top = 174
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
        Top = 204
        Width = 169
        Height = 20
        Hint = 'Enable alpha blended bar'
        TabOrder = 1
        OnClick = GameSelectionAlphaBlendClick
        Alignment = taLeftJustify
        Caption = 'Alpha Blended Selection Bar'
        ReturnIsTab = False
        Themed = True
      end
      object MAMu_IconsFolder: TEdit
        Left = 50
        Top = 320
        Width = 385
        Height = 21
        Hint = 'Select MAMu_ Icons Folder'
        AutoSize = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object ButtonMAMu_IconsFolderSelect: TBitBtn
        Left = 436
        Top = 320
        Width = 49
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        TabOrder = 3
        OnClick = ButtonMAMu_IconsFolderSelectClick
      end
      object GameSelectionDarkFont: TAdvOfficeCheckBox
        Left = 16
        Top = 228
        Width = 149
        Height = 20
        Hint = 'Enable this option if you'#39're using a white font for games list'
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Dark Font Selection Bar'
        ReturnIsTab = False
        Themed = True
      end
      object ColumnsSettings: TAdvGroupBox
        Left = 272
        Top = 12
        Width = 218
        Height = 279
        Transparent = False
        RoundEdges = True
        Caption = 'Details/Grouped Columns Settings'
        Ctl3D = True
        TabOrder = 5
        object LabelDisableDriverStatusIcons: TLabel
          Left = 24
          Top = 60
          Width = 159
          Height = 16
          Caption = 'Hide icons of all status columns'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object LabelDriverStatusShowFirstLetterOnly: TLabel
          Left = 24
          Top = 159
          Width = 154
          Height = 16
          Caption = 'Abbreviate driver status texts'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          Transparent = True
        end
        object LabelHideDriverStatusTexts: TLabel
          Left = 24
          Top = 126
          Width = 181
          Height = 16
          Caption = 'Check this to show only status icons'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object LabelShortDriverColumnTitles: TLabel
          Left = 24
          Top = 93
          Width = 164
          Height = 16
          Caption = 'Use 3 letters driver status titles'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
        end
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
          Top = 44
          Width = 160
          Height = 18
          TabOrder = 1
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Disable Driver Status Icons'
          ReturnIsTab = False
          Themed = True
        end
        object DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBox
          Left = 8
          Top = 144
          Width = 171
          Height = 18
          TabOrder = 2
          OnClick = DisableCloneIndentClick
          Alignment = taLeftJustify
          Caption = 'Show Status First Letter Only'
          ReturnIsTab = False
          Themed = True
        end
        object HideDriverStatusTexts: TAdvOfficeCheckBox
          Left = 8
          Top = 110
          Width = 152
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
          Top = 77
          Width = 195
          Height = 18
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Short Driver Status Column Titles'
          ReturnIsTab = False
          Themed = True
        end
        object ButtonCustomizeColumnHeaderFont: TBitBtn
          Left = 8
          Top = 248
          Width = 142
          Height = 23
          Caption = 'Customize Header Font'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = ButtonCustomizeColumnHeaderFontClick
        end
        object ButtonCustomizeColumns: TBitBtn
          Left = 8
          Top = 224
          Width = 202
          Height = 23
          Caption = 'Customize Columns'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = ButtonCustomizeColumnsClick
        end
        object LastPlayedHideSeconds: TAdvOfficeCheckBox
          Left = 8
          Top = 177
          Width = 167
          Height = 18
          TabOrder = 7
          Alignment = taLeftJustify
          Caption = 'Hide Seconds in Last Played'
          ReturnIsTab = False
          Themed = True
        end
        object TotalPlayTimeHideSeconds: TAdvOfficeCheckBox
          Left = 8
          Top = 201
          Width = 156
          Height = 18
          TabOrder = 8
          Alignment = taLeftJustify
          Caption = 'Hide Seconds in Playtime'
          ReturnIsTab = False
          Themed = True
        end
        object ButtonDefaultColumnHeaderFont: TBitBtn
          Left = 152
          Top = 248
          Width = 58
          Height = 23
          Hint = 'Reset header font to default'
          Caption = 'Default'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = ButtonDefaultColumnHeaderFontClick
        end
      end
      object GamesBackgroundGroupBox: TAdvGroupBox
        Left = 16
        Top = 12
        Width = 218
        Height = 142
        RoundEdges = True
        Caption = 'Background'
        Ctl3D = True
        TabOrder = 6
        object LabelGamesBackgroundColor: TLabel
          Left = 8
          Top = 20
          Width = 29
          Height = 15
          Caption = 'Color'
          ShowAccelChar = False
        end
        object GamesBackgroundColor: TColorBox
          Left = 8
          Top = 36
          Width = 152
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
          Left = 162
          Top = 36
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
          Left = 8
          Top = 68
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
          Left = 8
          Top = 88
          Width = 203
          Height = 21
          AutoSize = False
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object GamesBackgroundImageButtonUpdate: TBitBtn
          Left = 112
          Top = 110
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
        object GamesTileBackground: TAdvOfficeCheckBox
          Left = 8
          Top = 112
          Width = 40
          Height = 20
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
          Left = 161
          Top = 110
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
      end
      object DisableNaturalSorting: TAdvOfficeCheckBox
        Left = 16
        Top = 252
        Width = 238
        Height = 18
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 7
        OnClick = DisableNaturalSortingClick
        Alignment = taLeftJustify
        Caption = 'Disable Natural Sorting (1, 2, 3, 10, 11, 20)'
        ReturnIsTab = False
        Themed = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'Images'
      object GroupBoxImageLayoytSplitters: TAdvGroupBox
        Left = 88
        Top = 12
        Width = 329
        Height = 199
        RoundEdges = True
        Caption = 'Layout View Mode - Image Splitters'
        Ctl3D = True
        TabOrder = 0
        object LabelImageLayoutSplitterStyleSelector: TLabel
          Left = 16
          Top = 22
          Width = 25
          Height = 15
          Caption = 'Style'
        end
        object ImageLayoutSplitterStyleSelector: TComboBox
          Left = 16
          Top = 40
          Width = 240
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
          OnSelect = ImageLayoutSplitterStyleSelectorSelect
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
        object ButtonImageLayoutSplitterStyleDefault: TBitBtn
          Left = 264
          Top = 39
          Width = 47
          Height = 23
          Hint = 'Set image splitters default style'
          Caption = 'Default'
          TabOrder = 1
          OnClick = ButtonImageLayoutSplitterStyleDefaultClick
        end
        object GroupBoxImageLayoutSplitterSingleColor: TAdvGroupBox
          Left = 16
          Top = 75
          Width = 295
          Height = 104
          RoundEdges = True
          Caption = 'Single Color'
          ParentCtl3D = True
          TabOrder = 2
          object LabelImageLayoutSplitterSingleColor: TLabel
            Left = 8
            Top = 50
            Width = 29
            Height = 15
            Caption = 'Color'
            Transparent = True
          end
          object LabelImageLayoutSplitterSingleColorHot: TLabel
            Left = 8
            Top = 75
            Width = 52
            Height = 15
            Caption = 'Hot Color'
            Transparent = True
          end
          object ImageLayoutSplitterSingleColor: TColorBox
            Left = 64
            Top = 46
            Width = 221
            Height = 22
            Hint = 'Color of the splitter'
            NoneColorColor = clBtnFace
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
            Ctl3D = True
            ItemHeight = 16
            ParentCtl3D = False
            TabOrder = 0
            OnSelect = ImageLayoutSplitterSingleColorSelect
          end
          object ImageLayoutSplitterSingleColorHot: TColorBox
            Left = 64
            Top = 72
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
            TabOrder = 1
            OnSelect = ImageLayoutSplitterSingleColorHotSelect
          end
          object ButtonImageLayoutSplitterSingleColorDefault: TBitBtn
            Left = 236
            Top = 16
            Width = 47
            Height = 23
            Hint = 'Set single color default values'
            Caption = 'Default'
            TabOrder = 2
            OnClick = ButtonImageLayoutSplitterSingleColorDefaultClick
          end
        end
        object ImageEnableGripIcon: TAdvOfficeCheckBox
          Left = 207
          Top = 16
          Width = 105
          Height = 20
          Hint = 'Show/hide grip icon in the middle of the image splitters'
          Checked = True
          TabOrder = 3
          OnClick = ImageEnableGripIconClick
          Alignment = taRightJustify
          Caption = 'Enable Grip Icon'
          ReturnIsTab = False
          State = cbChecked
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
        Left = 83
        Top = 210
        Width = 96
        Height = 15
        Caption = 'Background Color'
        ShowAccelChar = False
        Transparent = True
      end
      object ShadowLabel1: TShadowLabel
        Left = 83
        Top = 12
        Width = 339
        Height = 19
        Caption = 'Enable this feature in games popup menu or use "F3" hot-key'
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
      object LabelGoToMAMEInfo: TLabel
        Left = 155
        Top = 272
        Width = 195
        Height = 13
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
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMARP: TLabel
        Left = 147
        Top = 288
        Width = 211
        Height = 13
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
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEScore: TLabel
        Left = 181
        Top = 304
        Width = 143
        Height = 13
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
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object LabelGoToMAMEHistory: TLabel
        Left = 172
        Top = 320
        Width = 161
        Height = 13
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
        Transparent = True
        OnClick = LabelGoToMAMEInfoClick
        OnMouseEnter = LabelGoToMAMEInfoMouseEnter
        OnMouseLeave = LabelGoToMAMEInfoMouseLeave
      end
      object GroupBox3: TAdvGroupBox
        Left = 83
        Top = 36
        Width = 337
        Height = 161
        RoundEdges = True
        Caption = 'Display Order (Place all files in MAME'#39's main folder)'
        Ctl3D = True
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 136
          Width = 303
          Height = 18
          Caption = 'You can find more settings in docs panel popup menu.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = True
        end
        object GameDocs: TEasyListview
          Tag = 1
          Left = 16
          Top = 25
          Width = 241
          Height = 108
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
            00060000008008000101000100000000000001EF000000FFFFFF1F0001000000
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
          Selection.Gradient = True
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
          Left = 272
          Top = 25
          Width = 47
          Height = 23
          Hint = 'Move selected item up'
          Caption = 'Up'
          TabOrder = 1
          TabStop = False
          OnClick = ButtonUpClick
        end
        object ButtonDown: TBitBtn
          Left = 272
          Top = 48
          Width = 47
          Height = 23
          Hint = 'Move selected folder down'
          Caption = 'Down'
          TabOrder = 2
          TabStop = False
          OnClick = ButtonUpClick
        end
        object ButtonResetAutoGameInfoOrder: TBitBtn
          Left = 272
          Top = 111
          Width = 47
          Height = 23
          Hint = 'Set the order of the texts to default'
          Caption = 'Reset'
          TabOrder = 3
          OnClick = ButtonResetAutoGameInfoOrderClick
        end
      end
      object GameDocumentsBackgroundColor: TColorBox
        Left = 83
        Top = 228
        Width = 225
        Height = 22
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = GameDocumentsBackgroundColorSelect
      end
      object ButtonGameDocumentsFont: TBitBtn
        Left = 315
        Top = 227
        Width = 47
        Height = 23
        Hint = 'Select font for window texts'
        Caption = 'Font'
        TabOrder = 2
        OnClick = ButtonGameDocumentsFontClick
      end
      object ButtonGameDocumentsDefault: TBitBtn
        Left = 371
        Top = 227
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values'
        Caption = 'Default'
        TabOrder = 3
        OnClick = ButtonGameDocumentsDefaultClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 4
      Caption = 'Video Preview'
      object LabelVideoPreviewTitle: TShadowLabel
        Left = 101
        Top = 12
        Width = 302
        Height = 19
        Caption = 'Watch Game Videos With Your Preferred Media Player'
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
      object Label2: TLabel
        Left = 96
        Top = 128
        Width = 259
        Height = 15
        Caption = 'Folder (relative path supported, no network path)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelVideoPreviewMediaPlayerExecutable: TLabel
        Left = 96
        Top = 184
        Width = 180
        Height = 15
        Caption = 'Media Player File (.exe; .bat; .cmd)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelVideoPreviewMediaPlayerParameters: TLabel
        Left = 96
        Top = 232
        Width = 313
        Height = 15
        Caption = 'Media Player Parameters        (%1 tag required for filename)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelVideoPreviewAutoPlay: TShadowLabel
        Left = 248
        Top = 299
        Width = 118
        Height = 13
        Caption = 'Use With Extreme Caution!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
      end
      object LabelVideoPreviewAutoPlayHelp: TShadowLabel
        Left = 311
        Top = 286
        Width = 54
        Height = 12
        Cursor = crHandPoint
        Caption = 'read more...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
        OnClick = LabelVideoPreviewAutoPlayHelpClick
        OnMouseEnter = LabelVideoPreviewAutoPlayHelpMouseEnter
        OnMouseLeave = LabelVideoPreviewAutoPlayHelpMouseLeave
      end
      object LabelVideoPreviewEnabled: TShadowLabel
        Left = 106
        Top = 299
        Width = 93
        Height = 13
        Caption = 'Check to play videos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
      end
      object VideoPreviewFolder: TEdit
        Left = 91
        Top = 147
        Width = 275
        Height = 21
        Hint = 'Select a Folder For Video Preview'
        AutoSize = False
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnChange = VideoPreviewFolderChange
      end
      object ButtonSelectVideoPreviewFolder: TBitBtn
        Left = 371
        Top = 146
        Width = 43
        Height = 23
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        TabOrder = 1
        OnClick = ButtonSelectVideoPreviewFolderClick
      end
      object PanelVideoPreviewSystems: TPanelEx
        Left = 91
        Top = 42
        Width = 323
        Height = 78
        Color1 = 16448250
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = 11775403
        Frames = [frLeft, frTop, frRight, frBottom]
        ParentBackground = False
        Style = vgSolid
        object LabelVideoPreviewSystem: TShadowLabel
          Left = 1
          Top = 58
          Width = 321
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'HBMAME: HomeBrew Multiple Arcade Machine Emulator'
          Color = 16448250
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = 14540253
          ShadowEnabled = True
          EllipsType = etNone
          Transparent = False
        end
        object SystemsVideoPreview: TEasyListview
          Tag = -1
          Left = 1
          Top = 1
          Width = 340
          Height = 57
          BorderStyle = bsNone
          CellSizes.Icon.Height = 55
          CellSizes.Icon.Width = 40
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -8
          EditManager.Font.Name = 'Arial'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clWindowText
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          Header.Columns.Items = {
            0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000000000154010000FFFFFF1F0001000000
            00000000000000000000000000000000}
          Header.Draggable = False
          Header.FixedSingleColumn = True
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          HotTrack.Color = clBlack
          HotTrack.Enabled = True
          HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
          HotTrack.Underline = False
          ImagesLarge = FormMain.IL_ArcadeSystem_Large
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          ShowThemedBorder = False
          ShowHint = True
          Selection.BlendColorSelRect = 10902593
          Selection.BlendIcon = False
          Selection.BorderColor = 10902593
          Selection.BorderColorSelRect = 10902593
          Selection.Color = 10902593
          Selection.FullCellPaint = True
          Selection.FullItemPaint = True
          Selection.Gradient = True
          Selection.GradientColorBottom = 16506264
          Selection.GradientColorTop = 15582647
          Selection.InactiveBorderColor = 10902593
          Selection.InactiveColor = 15582647
          Selection.MouseButton = [cmbLeft, cmbRight]
          Selection.RectSelect = True
          Selection.RoundRectRadius = 2
          Selection.TextColor = clBlack
          Selection.UseFocusRect = False
          TabOrder = 0
          OnItemSelectionChanged = SystemsVideoPreviewItemSelectionChanged
        end
        object PanelEx3: TPanelEx
          Left = 322
          Top = 0
          Width = 1
          Height = 58
          Color1 = clWhite
          Color2 = clSilver
          Color3 = clYellow
          Color4 = clTeal
          ColorFrame = 11775403
          Frames = [frLeft]
          ParentBackground = False
          Style = vgSimple
        end
      end
      object VideoPreviewMediaPlayerExecutable: TEdit
        Left = 91
        Top = 203
        Width = 275
        Height = 21
        AutoSize = False
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 3
      end
      object ButtonSelectVideoPreviewMediaPlayer: TBitBtn
        Left = 371
        Top = 202
        Width = 43
        Height = 23
        Hint = 'Click here to select a file'
        Caption = 'Select'
        TabOrder = 4
        OnClick = ButtonSelectVideoPreviewMediaPlayerClick
      end
      object VideoPreviewMediaPlayerParameters: TEdit
        Left = 91
        Top = 251
        Width = 230
        Height = 21
        AutoSize = False
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
      object ButtonClearVideoPreviewMediaPlayerParameters: TBitBtn
        Left = 326
        Top = 250
        Width = 43
        Height = 23
        Caption = 'Clear'
        TabOrder = 6
        OnClick = ButtonClearVideoPreviewMediaPlayerParametersClick
      end
      object VideoPreviewAutoPlay: TAdvOfficeCheckBox
        Left = 233
        Top = 281
        Width = 69
        Height = 20
        Hint = 'Play video preview automatically when selecting games'
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'AutoPlay'
        ReturnIsTab = False
        Themed = True
      end
      object ButtonVideoPreviewHelp: TBitBtn
        Left = 371
        Top = 288
        Width = 43
        Height = 37
        Hint = 'A little help please...'
        Caption = 'Help'
        TabOrder = 8
        OnClick = ButtonVideoPreviewHelpClick
      end
      object VideoPreviewParentGameVideo: TAdvOfficeCheckBox
        Left = 91
        Top = 312
        Width = 121
        Height = 20
        Hint = 'Play video of parent game if video of clone game is not found'
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Parent Game Video'
        ReturnIsTab = False
        Themed = True
      end
      object VideoPreviewEnabled: TAdvOfficeCheckBox
        Left = 91
        Top = 281
        Width = 127
        Height = 20
        Hint = 
          'Enable playback of video preview feature (uncheck to disable it ' +
          'completely)'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Play Videos Enabled'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object ButtonResetVideoPreviewMediaPlayerParameters: TBitBtn
        Left = 371
        Top = 250
        Width = 43
        Height = 23
        Hint = 'Reload parameter settings from video_preview.ini'
        Caption = 'Reset'
        TabOrder = 11
        OnClick = ButtonResetVideoPreviewMediaPlayerParametersClick
      end
      object ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtn
        Left = 230
        Top = 232
        Width = 15
        Height = 15
        Hint = 'Why ???'
        Caption = '?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = ButtonHelpVideoPreviewMediaPlayerParametersClick
      end
    end
  end
end
