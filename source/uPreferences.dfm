object FormPreferences: TFormPreferences
  Left = 462
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 773
  ClientWidth = 1818
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
    Width = 1818
    Height = 23
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
    object ButtonPage1: TSpeedButtonEx
      Tag = 1
      Left = 2
      Top = 1
      Width = 100
      Height = 22
      GroupIndex = 1
      Down = True
      Caption = 'PAGE 1'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonPage1Click
    end
    object ButtonPage2: TSpeedButtonEx
      Tag = 2
      Left = 103
      Top = 1
      Width = 146
      Height = 22
      GroupIndex = 1
      Caption = 'PAGE 2 - Light Mode'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonPage1Click
    end
  end
  object PanelPage2: TPanelEx
    Left = 909
    Top = 23
    Width = 909
    Height = 636
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ToolBarBackgroundColorsBox: TPanelEx
      Left = 311
      Top = 8
      Width = 287
      Height = 96
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ToolBarBackgroundColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Background Colors'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = 5588805
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object NightModeLabelToolBarBkBottomColor: TShadowLabel
        Left = 4
        Top = 71
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
      object NightModeLabelToolBarBkTopColor: TShadowLabel
        Left = 4
        Top = 47
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
      object ToolBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 69
        Height = 20
        Checked = True
        TabOrder = 0
        OnClick = ToolBarGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object ToolBarBkTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = clSilver
        NoneColorColor = clNone
        Selected = clSilver
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = ToolBarBkTopColorSelect
      end
      object ToolBarBkBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = ToolBarBkBottomColorSelect
      end
      object ToolBarBkColorsDefaultButton: TBitBtnEx
        Tag = 1
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 3
        OnClick = ToolBarBkColorsDefaultButtonClick
      end
      object ToolBarWindowsTheme: TAdvOfficeCheckBoxEx
        Left = 91
        Top = 20
        Width = 112
        Height = 20
        Hint = 'Paint the tool bar Windows themed style'
        Checked = True
        TabOrder = 4
        OnClick = ToolBarWindowsThemeClick
        Alignment = taLeftJustify
        Caption = 'Windows Theme'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object SearchGamesPanelColorsBox: TPanelEx
      Left = 614
      Top = 8
      Width = 287
      Height = 144
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object SearchGamesPanelColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Search Games Panel Colors'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = 5588805
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object NightModeLabelSearchGamesPanelFilterFontColor: TShadowLabel
        Left = 4
        Top = 47
        Width = 56
        Height = 16
        Caption = 'Filter Font'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelSearchGamesPanelFieldFontColor: TShadowLabel
        Left = 4
        Top = 71
        Width = 55
        Height = 16
        Caption = 'Field Font'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelSearchGamesPanelEditBoxFontColor: TShadowLabel
        Left = 4
        Top = 95
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
      object NightModeLabelSearchGamesPanelEditBoxBackgroundColor: TShadowLabel
        Left = 4
        Top = 119
        Width = 73
        Height = 16
        Caption = 'Text Bk Color'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SearchGamesPanelFilterFontColor: TColorBoxEx
        Left = 96
        Top = 44
        Width = 185
        Height = 22
        Hint = 'Font Color For The Filter Text'
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = SearchGamesPanelFilterFontColorSelect
      end
      object SearchGamesPanelFieldFontColor: TColorBoxEx
        Left = 96
        Top = 68
        Width = 185
        Height = 22
        Hint = 'Font Color For The Category Text'
        DefaultColorColor = clMaroon
        NoneColorColor = clNone
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = SearchGamesPanelFieldFontColorSelect
      end
      object SearchGamesPanelEditBoxFontColor: TColorBoxEx
        Left = 96
        Top = 92
        Width = 185
        Height = 22
        Hint = 'Font Color For The Edit Box'
        NoneColorColor = clNone
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = SearchGamesPanelEditBoxFontColorSelect
      end
      object SearchGamesPanelEditBoxBackgroundColor: TColorBoxEx
        Left = 96
        Top = 116
        Width = 185
        Height = 22
        Hint = 'Background Color For The Edit Box'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = SearchGamesPanelEditBoxBackgroundColorSelect
      end
      object SearchGamesPanelColorsButtonDefault: TBitBtnEx
        Tag = 1
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 4
      end
    end
    object GamesSelectionBarColorsBox: TPanelEx
      Left = 8
      Top = 8
      Width = 287
      Height = 401
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object GamesSelectionBarColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Selection Bar'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object GamesSelectionTopColorLabel: TShadowLabel
        Left = 4
        Top = 70
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
      object GamesSelectionFontColorLabel: TShadowLabel
        Left = 4
        Top = 142
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
      object GamesSelectionMissROMsTopColorLabel: TShadowLabel
        Left = 4
        Top = 188
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
      object GamesSelectionMissROMsFontColorLabel: TShadowLabel
        Left = 4
        Top = 259
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
      object GamesSelectionMissROMsLabel: TShadowLabel
        Left = 76
        Top = 166
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
        Transparent = True
      end
      object GamesSelectionInactiveTopColorLabel: TShadowLabel
        Left = 4
        Top = 305
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
      object GamesSelectionInactiveFontColorLabel: TShadowLabel
        Left = 4
        Top = 376
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
      object GamesSelectionInactiveLabel: TShadowLabel
        Left = 76
        Top = 283
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
        Transparent = True
      end
      object GamesSelectionBottomColorLabel: TShadowLabel
        Left = 4
        Top = 93
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
      object GamesSelectionMissROMsBottomColorLabel: TShadowLabel
        Left = 4
        Top = 211
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
      object GamesSelectionInactiveBottomColorLabel: TShadowLabel
        Left = 4
        Top = 328
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
      object GamesSelectionFrameColorLabel: TShadowLabel
        Left = 4
        Top = 117
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
      object GamesSelectionMissROMsFrameColorLabel: TShadowLabel
        Left = 4
        Top = 234
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
      object GamesSelectionInactiveFrameColorLabel: TShadowLabel
        Left = 4
        Top = 352
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
      object GamesSelectionTopColor: TColorBoxEx
        Left = 76
        Top = 66
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 16571329
        NoneColorColor = clNone
        Selected = 16571329
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 0
      end
      object GameSelectionButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 1
        OnClick = GameSelectionButtonDefaultClick
      end
      object GamesSelectionFontColor: TColorBoxEx
        Left = 76
        Top = 138
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
      end
      object GamesSelectionFrameColor: TColorBoxEx
        Left = 76
        Top = 114
        Width = 205
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 12160100
        NoneColorColor = clNone
        Selected = 12160100
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
      end
      object GamesSelectionMissROMsTopColor: TColorBoxEx
        Left = 76
        Top = 184
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 12704764
        NoneColorColor = clNone
        Selected = 12704764
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
      end
      object GamesSelectionMissROMsFontColor: TColorBoxEx
        Left = 76
        Top = 255
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = clMaroon
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
      end
      object GamesSelectionMissROMsFrameColor: TColorBoxEx
        Left = 76
        Top = 231
        Width = 205
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 6589625
        NoneColorColor = clNone
        Selected = 6589625
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 6
      end
      object GamesSelectionInactiveTopColor: TColorBoxEx
        Left = 76
        Top = 301
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 13816520
        NoneColorColor = clNone
        Selected = 13816520
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 7
      end
      object GamesSelectionInactiveFontColor: TColorBoxEx
        Left = 76
        Top = 373
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 8
      end
      object GamesSelectionInactiveFrameColor: TColorBoxEx
        Left = 76
        Top = 349
        Width = 205
        Height = 22
        Hint = 'Frame Color'
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
        Left = 4
        Top = 43
        Width = 108
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
        CustomIconsEnabled = False
      end
      object GamesSelectionBottomColor: TColorBoxEx
        Left = 76
        Top = 90
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
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
        Left = 4
        Top = 20
        Width = 68
        Height = 18
        Checked = True
        TabOrder = 12
        OnClick = GameSelectionGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object GamesSelectionMissROMsBottomColor: TColorBoxEx
        Left = 76
        Top = 208
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 14478332
        NoneColorColor = clNone
        Selected = 14478332
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 13
      end
      object GamesSelectionInactiveBottomColor: TColorBoxEx
        Left = 76
        Top = 325
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 14474460
        NoneColorColor = clNone
        Selected = 14474460
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 14
      end
      object GameSelectionRoundCorners: TAdvOfficeCheckBoxEx
        Left = 124
        Top = 43
        Width = 108
        Height = 18
        Checked = True
        TabOrder = 15
        OnClick = GameSelectionRoundCornersClick
        Alignment = taLeftJustify
        Caption = 'Round Corners'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object GamesListBackgroundBox: TPanelEx
      Left = 8
      Top = 561
      Width = 893
      Height = 67
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object GamesListBackgroundBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 891
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Background'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object GamesBackgroundColor: TColorBoxEx
        Left = 4
        Top = 39
        Width = 205
        Height = 22
        Hint = 'Games List Background Color'
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = GamesBackgroundColorSelect
      end
      object ButtonDefaultBkSortedColor: TBitBtnEx
        Left = 211
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
      object GamesBackgroundImage: TEditEx
        Left = 268
        Top = 39
        Width = 518
        Height = 21
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx
        Left = 268
        Top = 20
        Width = 192
        Height = 18
        TabOrder = 3
        OnClick = GamesBackgroundImageEnableClick
        Alignment = taLeftJustify
        Caption = 'Use Image as Background [.png]'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object GamesBackgroundImageButtonSelect: TBitBtnEx
        Left = 789
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
      object GamesBackgroundImageButtonUpdate: TBitBtnEx
        Left = 838
        Top = 38
        Width = 49
        Height = 23
        Hint = 'Click here to load the image if you edited the filename manually'
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
      object GamesTileBackground: TAdvOfficeCheckBoxEx
        Left = 746
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
        CustomIconsEnabled = False
      end
    end
    object GamesListSplittersBox: TPanelEx
      Left = 311
      Top = 416
      Width = 287
      Height = 129
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object GamesListSplittersBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List / Machines List Splitters'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object LabelGamesListSplitterSingleColorDefault: TShadowLabel
        Left = 4
        Top = 55
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
      object LabelGamesListSplitterSingleColorHot: TShadowLabel
        Left = 4
        Top = 104
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
      object LabelGamesListSplitterSingleColor: TShadowLabel
        Left = 4
        Top = 81
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
      object GamesListSplitterStyleSelector: TComboBox2Ex
        Left = 4
        Top = 22
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
      object ButtonGamesListSplitterStyleButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
        Hint = 'Set splitters default style'
        Caption = 'Default'
        TabOrder = 1
        OnClick = ButtonGamesListSplitterStyleButtonDefaultClick
      end
      object GamesListSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 74
        Top = 50
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 2
        OnClick = GamesListSplitterSingleColorButtonDefaultClick
      end
      object GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 178
        Top = 51
        Width = 97
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Checked = True
        TabOrder = 3
        OnClick = GamesListSplitterShowGripIconClick
        Alignment = taLeftJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object GamesListSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 77
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = GamesListSplitterSingleColorSelect
      end
      object GamesListSplitterSingleColorHot: TColorBoxEx
        Left = 60
        Top = 101
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = clGray
        NoneColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = GamesListSplitterSingleColorHotSelect
      end
    end
    object GamesListStatusBarColorsBox: TPanelEx
      Left = 8
      Top = 425
      Width = 287
      Height = 120
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object GamesListStatusBarColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Status Bar Colors'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object LabelGamesListStatusBarBottomColor: TShadowLabel
        Left = 4
        Top = 71
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
      object LabelGamesListStatusBarFontColor: TShadowLabel
        Left = 4
        Top = 95
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
      object LabelGamesListStatusBarTopColor: TShadowLabel
        Left = 4
        Top = 47
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
      object GamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 69
        Height = 20
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = GamesListStatusBarGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object GamesListStatusBarButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 1
        OnClick = GamesListStatusBarButtonDefaultClick
      end
      object GamesListStatusBarTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 15391180
        NoneColorColor = 15391180
        Selected = 15391180
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = GamesListStatusBarTopColorSelect
      end
      object GamesListStatusBarBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 16512497
        NoneColorColor = 16512497
        Selected = 16512497
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = GamesListStatusBarBottomColorSelect
      end
      object GamesListStatusBarFontColor: TColorBoxEx
        Left = 91
        Top = 92
        Width = 190
        Height = 22
        Hint = 'Text Font Color'
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = GamesListStatusBarFontColorSelect
      end
    end
    object MAMEGameDocsColorsBox: TPanelEx
      Left = 614
      Top = 403
      Width = 287
      Height = 142
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object MAMEGameDocsColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs Colors'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object GameDocsShowStatusBarLabel: TShadowLabel
        Left = 20
        Top = 119
        Width = 128
        Height = 19
        Caption = 'Disable 7 pixels border'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object GameDocsFont_Setting: TShadowLabel
        Left = 196
        Top = 114
        Width = 85
        Height = 22
        Hint = 'Select font for texts'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Font'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clGray
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
        Transparent = False
        Layout = tlCenter
        OnClick = GameDocsFont_SettingClick
      end
      object GameDocumentsBackgroundColor: TColorBoxEx
        Left = 4
        Top = 22
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs Background Color'
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = GameDocumentsBackgroundColorSelect
      end
      object GameDocumentsButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values'
        Caption = 'Default'
        TabOrder = 1
        OnClick = GameDocumentsButtonDefaultClick
      end
      object GameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 51
        Width = 193
        Height = 17
        Checked = True
        TabOrder = 2
        OnClick = GameDocsShowBorderClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object GameDocsBorderColor: TColorBoxEx
        Left = 3
        Top = 73
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs 7 Pixels Border Color'
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = GameDocsBorderColorSelect
      end
      object GameDocsBorderColorButtonDefault: TBitBtnEx
        Left = 235
        Top = 71
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 4
        OnClick = GameDocsBorderColorButtonDefaultClick
      end
      object GameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 102
        Width = 175
        Height = 18
        TabOrder = 5
        OnClick = GameDocsShowStatusBarClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs Status Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object ImagesHintBox: TPanelEx
      Left = 311
      Top = 120
      Width = 287
      Height = 224
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ImagesHintBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image Hint Box'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object LabelHintBox_Color: TShadowLabel
        Left = 4
        Top = 51
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
      object HintBox_OpacityLabel: TShadowLabel
        Left = 4
        Top = 103
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
      object HintBox_TextColorLabel: TShadowLabel
        Left = 4
        Top = 175
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
      object HintBox_PositionLabel: TShadowLabel
        Left = 108
        Top = 25
        Width = 71
        Height = 16
        Caption = 'Middle / Left'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object HintBox_Color: TColorBoxEx
        Left = 76
        Top = 48
        Width = 205
        Height = 22
        Hint = 'Hint Box Background Color'
        DefaultColorColor = 16750899
        NoneColorColor = clBtnFace
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 0
      end
      object HintBox_FrameColor: TColorBoxEx
        Left = 76
        Top = 72
        Width = 205
        Height = 22
        Hint = 'Hint Box Frame Color'
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
        Left = 4
        Top = 73
        Width = 57
        Height = 20
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object HintBox_OpacityButtonDefault: TBitBtnEx
        Left = 235
        Top = 119
        Width = 47
        Height = 22
        Hint = 'Set opacity to default level'
        Caption = 'Default'
        TabOrder = 3
        OnClick = HintBox_OpacityButtonDefaultClick
      end
      object HintBox_TextShadowColor: TColorBoxEx
        Left = 76
        Top = 196
        Width = 205
        Height = 22
        Hint = 'Shadow Font Color For The Text'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
      end
      object HintBox_TextColor: TColorBoxEx
        Left = 76
        Top = 172
        Width = 205
        Height = 22
        Hint = 'Font Color For The Text'
        DefaultColorColor = clWhite
        NoneColorColor = clBtnFace
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
      end
      object HintBoxtColorsButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
        Hint = 'Set hint box colors and display position to default'
        Caption = 'Default'
        TabOrder = 6
        OnClick = HintBoxtColorsButtonDefaultClick
      end
      object HintTextDefaultColorsButtonDefault: TBitBtnEx
        Left = 235
        Top = 145
        Width = 47
        Height = 23
        Hint = 'Set text colors to default'
        Caption = 'Default'
        TabOrder = 7
        OnClick = HintTextDefaultColorsButtonDefaultClick
      end
      object HintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 198
        Width = 65
        Height = 20
        Checked = True
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Shadow'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object HintBox_FontItalicStyle: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 149
        Width = 52
        Height = 20
        Hint = 'Show font with italic style'
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Italic'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object HintBox_LargerFontSize: TAdvOfficeCheckBoxEx
        Left = 76
        Top = 149
        Width = 105
        Height = 20
        Hint = 'Change font size to 14 pixels'
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Larger Font Size'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object HintBox_Position: TGaugeBar
        Left = 4
        Top = 22
        Width = 100
        Height = 20
        Hint = 'Hint box position'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        Max = 8
        Min = 1
        ShowHandleGrip = True
        Position = 4
        OnChange = HintBox_PositionChange
      end
      object HintBox_Opacity: TGaugeBar
        Left = 4
        Top = 120
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
    end
    object ImageSplittersBox: TPanelEx
      Left = 614
      Top = 168
      Width = 287
      Height = 129
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ImageSplittersBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image Splitters'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object LabelImageSplitterSingleColorDefault: TShadowLabel
        Left = 4
        Top = 55
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
      object LabelImageSplitterSingleColor: TShadowLabel
        Left = 4
        Top = 81
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
        Left = 4
        Top = 104
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
      object ImageSplitterStyleSelector: TComboBox2Ex
        Left = 4
        Top = 22
        Width = 220
        Height = 23
        Hint = 'Set splitter style'
        Style = csDropDownList
        Ctl3D = True
        DropDownCount = 20
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 0
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
      object ImageSplitterStyleSelectorButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
        Hint = 'Set splitter default style'
        Caption = 'Default'
        TabOrder = 1
        OnClick = ImageSplitterStyleSelectorButtonDefaultClick
      end
      object ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 178
        Top = 51
        Width = 102
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the image splitters'
        Checked = True
        TabOrder = 2
        OnClick = ImageSplitterShowGripIconClick
        Alignment = taLeftJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object ImageSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 74
        Top = 50
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 3
        OnClick = ImageSplitterSingleColorButtonDefaultClick
      end
      object ImageSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 77
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = ImageSplitterSingleColorSelect
      end
      object ImageSplitterSingleColorHot: TColorBoxEx
        Left = 60
        Top = 101
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = clGray
        NoneColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = ImageSplitterSingleColorHotSelect
      end
    end
    object ImageBorderColorBox: TPanelEx
      Left = 614
      Top = 313
      Width = 287
      Height = 50
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ImageBorderColorBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image 7 Pixels Border Color'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object ImageBorderColor: TColorBoxEx
        Left = 4
        Top = 22
        Width = 225
        Height = 22
        Hint = 'Image 7 Pixels Border Color'
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnSelect = ImageBorderColorSelect
      end
      object ImageBorderColorButtonDefault: TBitBtnEx
        Left = 234
        Top = 21
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 1
        OnClick = ImageBorderColorButtonDefaultClick
      end
    end
  end
  object SampleBox: TPanelEx
    Left = 112
    Top = 672
    Width = 287
    Height = 96
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = clGreen
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SampleBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 285
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Sample Box'
      CaptionIndent = 3
      Color = clCream
      ParentColor = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
  end
  object PanelPage1: TPanelEx
    Left = 0
    Top = 23
    Width = 909
    Height = 636
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object Settings_GeneralBox: TPanelEx
      Left = 8
      Top = 8
      Width = 301
      Height = 421
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object Settings_GeneralBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 299
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'General'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object IgnoreExitCode1InvalidFunctionLabel: TShadowLabel
        Left = 20
        Top = 77
        Width = 268
        Height = 19
        Caption = 'Don'#39't show this error after exiting the emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object LeftAlignEmulatorGameTextMessageBoxLabel: TShadowLabel
        Left = 20
        Top = 117
        Width = 213
        Height = 19
        Caption = 'Do not center texts in message boxes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object DisableMinimize: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 286
        Height = 20
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Disable Frontend Minimize When Running Games'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object AllowOnlyOneInstance: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 40
        Width = 154
        Height = 20
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Allow Only One Instance'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 60
        Width = 221
        Height = 20
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Ignore "Exit Code 1: Invalid Function"'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object LeftAlignEmulatorGameTextMessageBox: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 100
        Width = 240
        Height = 20
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Left Align Emulators Info and Games Info'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object HideDOSBoxBox: TPanelEx
        Left = 4
        Top = 323
        Width = 291
        Height = 97
        Color1 = 15856113
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = clGreen
        Frames = [frTop]
        ParentBackground = False
        Style = vgSolid
        object HideDOSBoxRunGameLabel: TShadowLabel
          Left = 16
          Top = 60
          Width = 241
          Height = 37
          AutoSize = False
          Caption = 
            'Do not run emulator in windowed mode or it will be invisible to ' +
            'Windows task bar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
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
          WordWrap = True
        end
        object HideDOSBoxBoxLabel: TShadowLabel
          Left = 16
          Top = 3
          Width = 153
          Height = 16
          Caption = 'Hide Command Prompt Box'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBoxEx
          Left = 0
          Top = 23
          Width = 255
          Height = 20
          Checked = True
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Create Games List / Detect Emulator Version'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object HideDOSBoxRunGame: TAdvOfficeCheckBoxEx
          Left = 0
          Top = 43
          Width = 304
          Height = 20
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Run Game (Full Screen Only. Use it With Caution!)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
      end
    end
    object GamesListBox: TPanelEx
      Left = 325
      Top = 8
      Width = 576
      Height = 178
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object GamesListBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 574
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 
          'Games List / Columns                                            ' +
          '                                    Details / Grouped View Setti' +
          'ngs'
        CaptionIndent = 3
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object GameListHeaderFont_Setting: TShadowLabel
        Left = 276
        Top = 28
        Width = 49
        Height = 46
        Caption = 'Column Header Font'
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        WordWrap = True
      end
      object LabelDisableNaturalSorting: TShadowLabel
        Left = 20
        Top = 77
        Width = 201
        Height = 19
        Caption = 'Use ASCII sorting (1, 10, 11, 2, 20, 3)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object LabelGameMultilineCaptions: TShadowLabel
        Left = 20
        Top = 37
        Width = 218
        Height = 19
        Caption = 'Show full caption (32x32 / 48x48 icons)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object LabelDisableDeleteSelectedGames: TShadowLabel
        Left = 20
        Top = 157
        Width = 211
        Height = 19
        Caption = 'Safeguard ROMs from naughty kiddies'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
        Left = 20
        Top = 117
        Width = 260
        Height = 19
        Caption = 'Show a zero in front of the text instead of .???'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object DisableNaturalSorting: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 60
        Width = 237
        Height = 18
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 0
        OnClick = DisableNaturalSortingClick
        Alignment = taLeftJustify
        Caption = 'Disable Natural Sorting (1, 2, 3, 10, 11, 20)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object GameMultilineCaptions: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 242
        Height = 20
        TabOrder = 1
        OnClick = GameMultilineCaptionsClick
        Alignment = taLeftJustify
        Caption = 'Multiline Captions (Details/Grouped View)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 140
        Width = 239
        Height = 20
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        TabOrder = 2
        OnClick = DisableDeleteSelectedGamesClick
        Alignment = taLeftJustify
        Caption = 'Disable "Delete/Copy/Move Games Files"'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 100
        Width = 245
        Height = 18
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Add Leading Zero to Version Info (MAME)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DisableCloneIndent: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 20
        Width = 201
        Height = 18
        Hint = 'Align clone games to parent'
        TabOrder = 4
        OnClick = DisableCloneIndentClick
        Alignment = taLeftJustify
        Caption = 'Disable Clone Indent (grouped)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DisableDriverStatusIcons: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 40
        Width = 201
        Height = 18
        TabOrder = 5
        OnClick = DisableCloneIndentClick
        Alignment = taLeftJustify
        Caption = 'Hide Driver Status Icons'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object HideDriverStatusTexts: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 60
        Width = 201
        Height = 18
        TabOrder = 6
        OnClick = DisableCloneIndentClick
        Alignment = taLeftJustify
        Caption = 'Hide Driver Status Texts'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 80
        Width = 201
        Height = 18
        TabOrder = 7
        OnClick = DisableCloneIndentClick
        Alignment = taLeftJustify
        Caption = 'Show Status Texts First Letter Only'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object ShortDriverColumnTitles: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 100
        Width = 201
        Height = 18
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Short Driver Status Column Titles'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object LastPlayedHideSeconds: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 120
        Width = 201
        Height = 18
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Hide Seconds in Last Played'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object TotalPlayTimeHideSeconds: TAdvOfficeCheckBoxEx
        Left = 358
        Top = 140
        Width = 201
        Height = 18
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Hide Seconds in Playtime'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object MAMu_IconsFolderBox: TPanelEx
      Left = 325
      Top = 478
      Width = 576
      Height = 63
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object MAMu_IconsFolderBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 574
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MAMu_ Icons Folder (MAME and arcade only)'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object MAMu_Icon: TImage
        Left = 4
        Top = 24
        Width = 32
        Height = 32
        Transparent = True
      end
      object MAMu_IconsFolder: TEditEx
        Left = 38
        Top = 36
        Width = 483
        Height = 21
        Hint = 'Select MAMu_ Icons Folder'
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ButtonMAMu_IconsFolderSelect: TBitBtnEx
        Left = 522
        Top = 36
        Width = 49
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        TabOrder = 1
        OnClick = ButtonMAMu_IconsFolderSelectClick
      end
    end
    object ImagesSpecialSettingsBox: TPanelEx
      Left = 8
      Top = 445
      Width = 301
      Height = 96
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ImagesSpecialSettingsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 299
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Images - Special Settings'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FixRetroArchImageFileNamesLabel: TShadowLabel
        Left = 20
        Top = 75
        Width = 248
        Height = 19
        Caption = 'Replace & * '#39' < > ? | chars by _ (underscore)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object ImageDisableThreadedLoadingLabel: TShadowLabel
        Left = 20
        Top = 37
        Width = 257
        Height = 19
        Caption = 'Fix delay and "invalid pointer operation" error'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object FixRetroArchImageFileNames: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 60
        Width = 254
        Height = 20
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Fix Image File Name for RetroArch Frontend'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object ImageDisableThreadedLoading: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 244
        Height = 20
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Disable Threaded Preview Images Loading'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object InternetGameInfoBox: TPanelEx
      Left = 8
      Top = 557
      Width = 893
      Height = 71
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object InternetGameInfoBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 891
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Internet Game Info'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object InternetGameInfoBoxTip1Label: TShadowLabel
        Left = 176
        Top = 0
        Width = 271
        Height = 16
        Caption = 'Tag       required to be replaced by                       and'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
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
      object InternetGameInfoBoxTip2Label: TShadowLabel
        Left = 199
        Top = 0
        Width = 330
        Height = 16
        Caption = 
          '%s                                                game name     ' +
          '    software name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
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
      object InternetGameInfoLinkLabel: TShadowLabel
        Left = 4
        Top = 28
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
        Transparent = True
      end
      object InternetMAMESoftwareListGameInfoLinkLabel: TShadowLabel
        Left = 449
        Top = 28
        Width = 171
        Height = 16
        Caption = 'MAME Software Game Info Link'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object RestoreInternetGameInfoStartup: TAdvOfficeCheckBoxEx
        Left = 776
        Top = -1
        Width = 114
        Height = 20
        Hint = 'Restore the "active" state of the buttons in images tool bar'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Restore at Startup'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object InternetGameInfoLink: TEditEx
        Left = 4
        Top = 44
        Width = 438
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 1
      end
      object InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx
        Left = 175
        Top = 19
        Width = 141
        Height = 23
        Hint = 'Reset link to default'
        Caption = 'Reset to ProgettoEMMA'
        TabOrder = 2
        OnClick = InternetGameInfoProgettoEMMALinkButtonDefaultClick
      end
      object InternetMAMESoftwareListGameInfoLink: TEditEx
        Left = 449
        Top = 44
        Width = 438
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 3
      end
      object InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx
        Left = 621
        Top = 19
        Width = 141
        Height = 23
        Hint = 'Reset link to default'
        Caption = 'Reset to ProgettoEMMA'
        TabOrder = 4
        OnClick = InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefaultClick
      end
      object InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx
        Left = 318
        Top = 19
        Width = 124
        Height = 23
        Hint = 'Reset link to default'
        Caption = 'Reset to Arcade Italia'
        TabOrder = 5
        OnClick = InternetGameInfoArcadeItaliaLinkButtonDefaultClick
      end
      object InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx
        Left = 764
        Top = 19
        Width = 124
        Height = 23
        Hint = 'Reset link to default'
        Caption = 'Reset to Arcade Italia'
        TabOrder = 6
        OnClick = InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefaultClick
      end
    end
    object Setting_MAMEGameDocsBox: TPanelEx
      Left = 325
      Top = 202
      Width = 576
      Height = 260
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object Setting_MAMEGameDocsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 574
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object Setting_MAMEGameDocsBoxTipLabel: TShadowLabel
        Left = 263
        Top = 0
        Width = 306
        Height = 16
        Caption = 'Enable this feature in games popup menu or "F3" hot-key'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 16448250
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object MAMEGameManualsPDFFolderLabel: TShadowLabel
        Left = 4
        Top = 128
        Width = 196
        Height = 16
        Caption = 'Directory for Game Manual PDF Files'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object MAMEGameManualsPDFFolderTipLabel: TShadowLabel
        Left = 92
        Top = 170
        Width = 177
        Height = 19
        Caption = 'Relative folder name supported'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object LabelGoToMAMEInfo: TShadowLabel
        Left = 85
        Top = 207
        Width = 191
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://mameinfo.mameworld.info'
        Caption = 'MASH'#39's MAMEInfo (mameinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        Left = 81
        Top = 223
        Width = 196
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/messinfo/'
        Caption = 'AntoPISA'#39's MESS Info (messinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        Left = 8
        Top = 239
        Width = 269
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/gameinit/'
        Caption = 'AntoPISA'#39's Game Initialization Page (gameinit.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        Left = 298
        Top = 239
        Width = 273
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://replay.marpirc.net'
        Caption = 'MAME Action Replay Page (scores3.htm; marp.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        Left = 298
        Top = 223
        Width = 147
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://www.arcade-history.com'
        Caption = 'MAME History (history.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
        Left = 298
        Top = 207
        Width = 125
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://www.mamescore.net'
        Caption = 'MAMEScore (story.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object GameDocsDisplayOrderBox: TPanelEx
        Left = 398
        Top = 22
        Width = 175
        Height = 171
        Color1 = 15856113
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object GameDocsLabel: TShadowLabel
          Left = 0
          Top = 0
          Width = 74
          Height = 16
          Caption = 'Display Order'
          Color = 16448250
          ParentColor = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = 15132390
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object GameDocsButtonUp: TBitBtnEx
          Tag = 1
          Left = 0
          Top = 146
          Width = 47
          Height = 23
          Hint = 'Move selected item up'
          Caption = 'Up'
          TabOrder = 1
          TabStop = False
          OnClick = GameDocsButtonUpClick
        end
        object GameDocsButtonDown: TBitBtnEx
          Left = 52
          Top = 146
          Width = 47
          Height = 23
          Hint = 'Move selected folder down'
          Caption = 'Down'
          TabOrder = 2
          TabStop = False
          OnClick = GameDocsButtonUpClick
        end
        object GameDocsButtonReset: TBitBtnEx
          Left = 125
          Top = 146
          Width = 47
          Height = 23
          Hint = 'Set the order of the texts to default'
          Caption = 'Reset'
          TabOrder = 3
          OnClick = GameDocsButtonResetClick
        end
        object GameDocs: TEasyListview
          Tag = 1
          Left = 1
          Top = 16
          Width = 171
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
            00060000008008000101000100000000000001A7000000FFFFFF1F0001000000
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
          CustomCheckRadioEnabled = False
          OnItemPaintText = GameDocsItemPaintText
        end
      end
      object GameDocsDisplayModeBox: TPanelEx
        Left = 4
        Top = 22
        Width = 283
        Height = 96
        Color1 = 15856113
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object GameDocsDisplayModeBoxLabel: TShadowLabel
          Left = 16
          Top = 0
          Width = 75
          Height = 16
          Caption = 'Display Mode'
          Color = 16448250
          ParentColor = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = 15132390
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object GameDocsDisplayModeSinglePanelLabel: TShadowLabel
          Left = 16
          Top = 37
          Width = 211
          Height = 19
          Caption = 'Show images and game docs together'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
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
        object GameDocsDisplayModeTabsLabel: TShadowLabel
          Left = 16
          Top = 73
          Width = 263
          Height = 19
          Caption = 'Show images and game docs in separate panels'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
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
        object GameDocsDisplayModeSinglePanel: TAdvOfficeRadioButtonEx
          Left = 0
          Top = 20
          Width = 213
          Height = 20
          TabOrder = 0
          TabStop = True
          OnClick = GameDocsDisplayModeSinglePanelClick
          Alignment = taLeftJustify
          Caption = 'Images and Game Docs Single Panel'
          Checked = True
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object GameDocsDisplayModeTabs: TAdvOfficeRadioButtonEx
          Tag = 1
          Left = 0
          Top = 56
          Width = 225
          Height = 20
          TabOrder = 1
          OnClick = GameDocsDisplayModeSinglePanelClick
          Alignment = taLeftJustify
          Caption = 'Images and Game Docs Tabbed Panels'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object MAMEGameManualsPDFFolder: TEditEx
        Left = 4
        Top = 144
        Width = 269
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 2
      end
      object MAMEGameManualsPDFFolderButtonSelect: TBitBtnEx
        Left = 274
        Top = 144
        Width = 47
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = MAMEGameManualsPDFFolderButtonSelectClick
      end
      object MAMEGameManualsPDFFolderButtonDefault: TBitBtnEx
        Left = 274
        Top = 168
        Width = 47
        Height = 21
        Hint = 'Click here to reset folder to default'
        Caption = 'Default'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = MAMEGameManualsPDFFolderButtonDefaultClick
      end
    end
  end
end
