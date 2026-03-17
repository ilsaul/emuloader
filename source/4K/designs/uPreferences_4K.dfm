object FormPreferences4K: TFormPreferences4K
  Left = 499
  Top = 274
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preferences (4K)'
  ClientHeight = 1364
  ClientWidth = 3175
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
  PixelsPerInch = 96
  TextHeight = 15
  object PanelTabButtons: TPanelEx
    Left = 0
    Top = 0
    Width = 3175
    Height = 38
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
      Width = 205
      Height = 37
      GroupIndex = 1
      Down = True
      Caption = 'PAGE 1'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object ButtonPage2: TSpeedButtonEx
      Tag = 2
      Left = 210
      Top = 1
      Width = 205
      Height = 37
      GroupIndex = 1
      Caption = 'PAGE 2 - Light Mode'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
  end
  object PanelPage2: TPanelEx
    Left = 1573
    Top = 38
    Width = 1561
    Height = 1206
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
      Left = 532
      Top = 10
      Width = 497
      Height = 186
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Background Colors'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
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
        Left = 10
        Top = 98
        Width = 41
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
        Left = 10
        Top = 79
        Width = 20
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
        Left = 10
        Top = 46
        Width = 69
        Height = 20
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ToolBarBkTopColor: TColorBoxEx
        Left = 179
        Top = 71
        Width = 190
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = clSilver
        NoneColorColor = clNone
        Selected = clSilver
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
      end
      object ToolBarBkBottomColor: TColorBoxEx
        Left = 179
        Top = 95
        Width = 190
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
      end
      object ToolBarBkColorsDefaultButton: TBitBtnEx
        Tag = 1
        Left = 427
        Top = 43
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 3
      end
      object ToolBarWindowsTheme: TAdvOfficeCheckBoxEx
        Left = 179
        Top = 46
        Width = 185
        Height = 36
        Hint = 'Paint the tool bar Windows themed style'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Windows Theme'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object SearchGamesPanelColorsBox: TPanelEx
      Left = 532
      Top = 221
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
        Width = 54
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
        Width = 53
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
        Width = 49
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
        Width = 70
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
      Left = 10
      Top = 10
      Width = 497
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
        Width = 495
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
        Width = 54
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
        Width = 49
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
        Width = 54
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
        Width = 49
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
        Width = 179
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
        Width = 54
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
        Width = 49
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
        Width = 79
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
        Width = 57
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
        Width = 57
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
        Width = 57
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
        Width = 66
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
        Width = 66
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
        Width = 66
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
        Alignment = taLeftJustify
        Caption = 'Alpha Blending'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
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
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
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
        Alignment = taLeftJustify
        Caption = 'Round Corners'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object GamesListBackgroundBox: TPanelEx
      Left = 10
      Top = 1056
      Width = 893
      Height = 140
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
        Alignment = taLeftJustify
        Caption = 'Use Image as Background [.png]'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
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
      end
      object GamesTileBackground: TAdvOfficeCheckBoxEx
        Left = 746
        Top = 20
        Width = 40
        Height = 18
        Hint = 'Tile the background image on the entire games list canvas'
        Checked = True
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Tile'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object GamesListSplittersBox: TPanelEx
      Left = 534
      Top = 799
      Width = 497
      Height = 232
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List / Machines List Splitters'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelGamesListSplitterSingleColorDefault: TShadowLabel
        Left = 10
        Top = 96
        Width = 112
        Height = 31
        Caption = 'Single Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelGamesListSplitterSingleColorHot: TShadowLabel
        Left = 10
        Top = 184
        Width = 90
        Height = 31
        Caption = 'Hot Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelGamesListSplitterSingleColor: TShadowLabel
        Left = 10
        Top = 140
        Width = 50
        Height = 31
        Caption = 'Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object GamesListSplitterStyleSelector: TComboBox2Ex
        Left = 10
        Top = 45
        Width = 312
        Height = 36
        Hint = 'Set splitter style'
        Style = csOwnerDrawFixed
        Ctl3D = True
        DropDownCount = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 6
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'Office 2007 Luna (Default)'
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
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Set splitters default style'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
      end
      object GamesListSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 91
        Width = 85
        Height = 38
        Hint = 'Set single color default values'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        CaptionVertIndent = -1
      end
      object GamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 173
        Top = 92
        Width = 175
        Height = 36
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object GamesListSplitterSingleColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object GamesListSplitterSingleColorHot: TColorBoxEx
        Left = 173
        Top = 184
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = clGray
        NoneColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object GamesListStatusBarColorsBox: TPanelEx
      Left = 10
      Top = 427
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
        Width = 41
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
        Width = 49
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
        Width = 20
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
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object GamesListStatusBarButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 1
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
      end
    end
    object MAMEGameDocsColorsBox: TPanelEx
      Left = 1056
      Top = 799
      Width = 497
      Height = 232
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs Colors'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object GameDocsShowStatusBarLabel: TShadowLabel
        Left = 27
        Top = 143
        Width = 126
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
        Left = 203
        Top = 138
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
      end
      object GameDocumentsBackgroundColor: TColorBoxEx
        Left = 11
        Top = 46
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs Background Color'
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
      end
      object GameDocumentsButtonDefault: TBitBtnEx
        Left = 242
        Top = 45
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values'
        Caption = 'Default'
        TabOrder = 1
      end
      object GameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 11
        Top = 75
        Width = 193
        Height = 17
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Show Game Docs 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object GameDocsBorderColor: TColorBoxEx
        Left = 10
        Top = 97
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs 7 Pixels Border Color'
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
      end
      object GameDocsBorderColorButtonDefault: TBitBtnEx
        Left = 242
        Top = 95
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 4
      end
      object GameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 11
        Top = 126
        Width = 175
        Height = 18
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Show Game Docs Status Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object ImageSplittersBox: TPanelEx
      Left = 1056
      Top = 405
      Width = 497
      Height = 232
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Image Splitters'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelImageSplitterSingleColorDefault: TShadowLabel
        Left = 10
        Top = 101
        Width = 112
        Height = 31
        Caption = 'Single Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelImageSplitterSingleColor: TShadowLabel
        Left = 10
        Top = 144
        Width = 50
        Height = 31
        Caption = 'Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object LabelImageSplitterSingleColorHot: TShadowLabel
        Left = 10
        Top = 187
        Width = 90
        Height = 31
        Caption = 'Hot Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object ImageSplitterStyleSelector: TComboBox2Ex
        Left = 10
        Top = 45
        Width = 312
        Height = 38
        Hint = 'Set splitter style'
        Style = csDropDownList
        Ctl3D = True
        DropDownCount = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'Single Color (Customizable)'
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
        Left = 401
        Top = 44
        Width = 47
        Height = 23
        Hint = 'Set splitter default style'
        Caption = 'Default'
        TabOrder = 1
      end
      object ImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 184
        Top = 92
        Width = 175
        Height = 36
        Hint = 'Show/hide grip icon in the middle of the image splitters'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ImageSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 416
        Top = 104
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 3
      end
      object ImageSplitterSingleColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object ImageSplitterSingleColorHot: TColorBoxEx
        Left = 173
        Top = 184
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = clGray
        NoneColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object ImageBorderColorBox: TPanelEx
      Left = 1056
      Top = 662
      Width = 287
      Height = 93
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
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Image 7 Pixels Border Color'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object ImageBorderColor: TColorBoxEx
        Left = 4
        Top = 46
        Width = 225
        Height = 22
        Hint = 'Image 7 Pixels Border Color'
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ImageBorderColorButtonDefault: TBitBtnEx
        Left = 234
        Top = 45
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 1
      end
    end
    object NightModeImagesHintBox: TPanelEx
      Left = 1056
      Top = 10
      Width = 497
      Height = 370
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object NightModeImagesHintBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Image Hint Box'
        CaptionIndent = 7
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 5588805
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 4210752
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object NightModeLabelHintBox_Color: TShadowLabel
        Left = 10
        Top = 94
        Width = 109
        Height = 31
        Caption = 'Bkgrd Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
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
      object NightModeLabelHintBox_Opacity: TShadowLabel
        Left = 10
        Top = 186
        Width = 111
        Height = 31
        Caption = 'Opacity 190'
        Color = 5263440
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
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
        Transparent = False
      end
      object NightModeLabelHintBox_TextColor: TShadowLabel
        Left = 10
        Top = 279
        Width = 85
        Height = 31
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
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
      object NightModeHintBox_PositionLabel: TShadowLabel
        Left = 155
        Top = 47
        Width = 126
        Height = 31
        Caption = 'Bottom/Right'
        Color = 5263440
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
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
        Transparent = False
      end
      object NightModeHintBoxtColorsButtonDefault: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Reset hint box colors and position to default (blue colors)'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
      end
      object NightModeHintBox_Color: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Hint Box Background Color'
        DefaultColorColor = 1513239
        NoneColorColor = clBtnFace
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 1
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeHintBox_FrameColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Hint Box Frame Color'
        DefaultColorColor = 4734774
        NoneColorColor = clBtnFace
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 2
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeHintBox_FrameEnabled: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 138
        Width = 90
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Frame'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeHintBox_Opacity: TGaugeBar
        Left = 173
        Top = 184
        Width = 270
        Height = 36
        Hint = 'Transparency level of the hint box'
        Color = 3289650
        Backgnd = bgSolid
        BorderStyle = bsNone
        ButtonSize = 30
        HandleColor = clGray
        ButtonColor = 5000268
        HighLightColor = 3289650
        ShadowColor = 1
        BorderColor = clGray
        ArrowColor = clCream
        LargeChange = 5
        Max = 255
        ShowHandleGrip = True
        Style = rbsMac
        Position = 190
      end
      object NightModeHintBox_OpacityButtonDefault: TBitBtnEx
        Left = 448
        Top = 183
        Width = 38
        Height = 38
        Hint = 'Reset opacity to default level'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object NightModeHintTextDefaultColorsButtonDefault: TBitBtnEx
        Left = 401
        Top = 229
        Width = 85
        Height = 38
        Hint = 'Reset text colors to default'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        CaptionVertIndent = -1
      end
      object NightModeHintBox_FontItalicStyle: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 231
        Width = 80
        Height = 36
        Hint = 'Show font with italic style'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Italic'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeHintBox_TextColor: TColorBoxEx
        Left = 173
        Top = 276
        Width = 312
        Height = 36
        Hint = 'Font Color For The Text'
        DefaultColorColor = 20985
        NoneColorColor = clBtnFace
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 8
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeHintBox_TextShadowColor: TColorBoxEx
        Left = 173
        Top = 322
        Width = 312
        Height = 36
        Hint = 'Shadow Font Color For The Text'
        DefaultColorColor = 1513239
        NoneColorColor = clBtnFace
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 9
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeHintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 323
        Width = 150
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Text Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeHintBox_Position: TGaugeBar
        Left = 10
        Top = 45
        Width = 141
        Height = 36
        Hint = 'Hint box position'
        Color = 3289650
        Backgnd = bgSolid
        BorderStyle = bsNone
        ButtonSize = 30
        HandleColor = clGray
        ButtonColor = 5000268
        HighLightColor = 3289650
        ShadowColor = 1
        BorderColor = clGray
        ArrowColor = clCream
        Max = 8
        Min = 1
        ShowHandleGrip = True
        Style = rbsMac
        Position = 8
      end
    end
  end
  object PanelPage1: TPanelEx
    Left = 0
    Top = 38
    Width = 1561
    Height = 1206
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
      Left = 10
      Top = 10
      Width = 497
      Height = 811
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'General'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object IgnoreExitCode1InvalidFunctionLabel: TShadowLabel
        Left = 37
        Top = 173
        Width = 443
        Height = 28
        Caption = 'Don'#39't show this error after exiting the emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 37
        Top = 245
        Width = 347
        Height = 28
        Caption = 'Do not center texts in message boxes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
      object EnableBackgroundWindowAlphaBlendEffectLabel: TShadowLabel
        Left = 37
        Top = 321
        Width = 359
        Height = 28
        Caption = 'Highlight foreground windows/dialogs'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 37
        Top = 395
        Width = 353
        Height = 28
        Caption = 'Safeguard ROMs from naughty kiddies'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 10
        Top = 46
        Width = 480
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Don'#39't Minimize Frontend When Running Games'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AllowOnlyOneInstance: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 92
        Width = 265
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Allow Only One Instance'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object IgnoreExitCode1InvalidFunction: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 138
        Width = 380
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Ignore "Exit Code 1: Invalid Function"'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object LeftAlignEmulatorGameTextMessageBox: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 212
        Width = 420
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Left Align Emulators Info and Games Info'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object HideDOSBoxBox: TPanelEx
        Left = 10
        Top = 622
        Width = 477
        Height = 185
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
          Left = 27
          Top = 127
          Width = 393
          Height = 55
          AutoSize = False
          Caption = 
            'Do not run emulator in windowed mode or it will be invisible to ' +
            'Windows task bar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -21
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
          Left = 25
          Top = 3
          Width = 260
          Height = 31
          Caption = 'Hide Command Prompt Box'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
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
        object HideDOSBoxEmuVersionCreateGames: TAdvOfficeCheckBoxEx
          Left = 0
          Top = 46
          Width = 445
          Height = 36
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Create Games List / Detect Emulator Version'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object HideDOSBoxRunGame: TAdvOfficeCheckBoxEx
          Left = 0
          Top = 92
          Width = 390
          Height = 36
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Run Game (Only Works In Full Screen)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object EnableBackgroundWindowAlphaBlendEffect: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 286
        Width = 475
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enable Background Window Alpha Blend Effect'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DisableDeleteSelectedGames: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 360
        Width = 420
        Height = 36
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Disable "Delete/Copy/Move Games Files"'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object GamesListBox: TPanelEx
      Left = 532
      Top = 10
      Width = 1019
      Height = 369
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
        Width = 1017
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 
          'Games List / Columns                                            ' +
          '                                Details / Grouped View Settings'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 442
        Top = 54
        Width = 74
        Height = 91
        Caption = 'Column Header Font'
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 37
        Top = 155
        Width = 349
        Height = 28
        Caption = 'Use ASCII sorting (1, 10, 11, 2, 20, 3)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 37
        Top = 81
        Width = 364
        Height = 28
        Caption = 'Useful for 32x32 / 48x48 / 68x68 icons'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 37
        Top = 229
        Width = 431
        Height = 28
        Caption = 'Show a zero in front of the text instead of .???'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
      object ShadowLabel1: TShadowLabel
        Left = 37
        Top = 303
        Width = 443
        Height = 28
        Caption = 'Don'#39't show this error after exiting the emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 10
        Top = 120
        Width = 420
        Height = 36
        Hint = 'Don'#39't want games sorted like Windows Explorer ?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Disable Natural Sorting (1, 2, 3, 10, 11, 20)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object GameMultilineCaptions: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 420
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Multiline Captions (Details/Grouped View)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AddLeadingZeroVersionInfoMAME: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 194
        Width = 420
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Add Leading Zero to Version Info (MAME)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DisableCloneIndent: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 46
        Width = 325
        Height = 36
        Hint = 'Align clone games to parent'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Disable Clone Indent (grouped)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DisableDriverStatusIcons: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 92
        Width = 255
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hide Driver Status Icons'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object HideDriverStatusTexts: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 138
        Width = 250
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hide Driver Status Texts'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DriverStatusShowFirstLetterOnly: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 184
        Width = 350
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Status Texts First Letter Only'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ShortDriverColumnTitles: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 230
        Width = 340
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Short Driver Status Column Titles'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object LastPlayedHideSeconds: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 276
        Width = 295
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hide Seconds in Last Played'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object TotalPlayTimeHideSeconds: TAdvOfficeCheckBoxEx
        Left = 665
        Top = 322
        Width = 270
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hide Seconds in Playtime'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 268
        Width = 560
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Grayscale Icon In Game With Missing ROMs/CHDs'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object MAMu_IconsFolderBox: TPanelEx
      Left = 532
      Top = 938
      Width = 1019
      Height = 93
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
        Width = 1017
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'MAMu_ Icons Folder (MAME And Arcade Only)'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object MAMu_Icon: TImage
        Left = 10
        Top = 47
        Width = 32
        Height = 32
        Transparent = True
      end
      object MAMu_IconsFolder: TEditEx
        Left = 47
        Top = 45
        Width = 871
        Height = 36
        Hint = 'Select MAMu_ Icons Folder'
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object ButtonMAMu_IconsFolderSelect: TBitBtnEx
        Left = 923
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
      end
    end
    object ImagesSpecialSettingsBox: TPanelEx
      Left = 10
      Top = 846
      Width = 497
      Height = 185
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
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Images - Special Settings'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object FixRetroArchImageFileNamesLabel: TShadowLabel
        Left = 37
        Top = 153
        Width = 409
        Height = 28
        Caption = 'Replace & * '#39' < > ? | chars by _ (underscore)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 37
        Top = 79
        Width = 433
        Height = 28
        Caption = 'Fix delay and "invalid pointer operation" error'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 10
        Top = 118
        Width = 445
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Fix Image File Name for RetroArch Frontend'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ImageDisableThreadedLoading: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 430
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Disable Threaded Preview Images Loading'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object InternetGameInfoBox: TPanelEx
      Left = 10
      Top = 1056
      Width = 1541
      Height = 140
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
        Width = 1539
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Internet Game Info'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object InternetGameInfoBoxTip1Label: TShadowLabel
        Left = 300
        Top = 0
        Width = 486
        Height = 31
        Caption = 'Tag       required to be replaced by                      and'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
        Left = 340
        Top = 0
        Width = 592
        Height = 31
        Caption = 
          '%s                                            game name         ' +
          'software name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -21
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
        Left = 10
        Top = 48
        Width = 141
        Height = 31
        Caption = 'Game Info Link'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object InternetMAMESoftwareListGameInfoLinkLabel: TShadowLabel
        Left = 789
        Top = 48
        Width = 297
        Height = 31
        Caption = 'MAME Software Game Info Link'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object RestoreInternetGameInfoStartup: TAdvOfficeCheckBoxEx
        Left = 1336
        Top = -1
        Width = 200
        Height = 36
        Hint = 'Restore the "active" state of the buttons in images tool bar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Restore at Startup'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InternetGameInfoLink: TEditEx
        Left = 10
        Top = 92
        Width = 740
        Height = 36
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object InternetGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx
        Left = 418
        Top = 44
        Width = 165
        Height = 38
        Hint = 'Reset link to default'
        Caption = 'ProgettoEMMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        CaptionVertIndent = -1
      end
      object InternetMAMESoftwareListGameInfoLink: TEditEx
        Left = 789
        Top = 92
        Width = 740
        Height = 36
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object InternetMAMESoftwareListGameInfoProgettoEMMALinkButtonDefault: TBitBtnEx
        Left = 1197
        Top = 44
        Width = 165
        Height = 38
        Hint = 'Reset link to default'
        Caption = 'ProgettoEMMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
      end
      object InternetGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx
        Left = 586
        Top = 44
        Width = 165
        Height = 38
        Hint = 'Reset link to default'
        Caption = 'Arcade Italia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
      end
      object InternetMAMESoftwareListGameInfoArcadeItaliaLinkButtonDefault: TBitBtnEx
        Left = 1365
        Top = 44
        Width = 165
        Height = 38
        Hint = 'Reset link to default'
        Caption = 'Arcade Italia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        CaptionVertIndent = -1
      end
    end
    object Setting_MAMEGameDocsBox: TPanelEx
      Left = 532
      Top = 404
      Width = 1019
      Height = 509
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
        Width = 1017
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs'
        CaptionIndent = 7
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object Setting_MAMEGameDocsBoxTipLabel: TShadowLabel
        Left = 476
        Top = 0
        Width = 533
        Height = 31
        Caption = 'Enable this feature in games popup menu or "F3" hot-key'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
        Left = 10
        Top = 248
        Width = 342
        Height = 31
        Caption = 'Directory for Game Manual PDF Files'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      object MAMEGameManualsPDFFolderTipLabel: TShadowLabel
        Left = 100
        Top = 328
        Width = 295
        Height = 28
        Caption = 'Relative folder name supported'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
        Left = 154
        Top = 405
        Width = 327
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://mameinfo.mameworld.info'
        Caption = 'MASH'#39's MAMEInfo (mameinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object LabelGoToMESSInfo: TShadowLabel
        Left = 141
        Top = 437
        Width = 340
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/messinfo/'
        Caption = 'AntoPISA'#39's MESS Info (messinfo.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object LabelGoToGameInit: TShadowLabel
        Left = 14
        Top = 469
        Width = 467
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://www.progettosnaps.net/gameinit/'
        Caption = 'AntoPISA'#39's Game Initialization Page (gameinit.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object LabelGoToMARP: TShadowLabel
        Left = 532
        Top = 469
        Width = 471
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://replay.marpirc.net'
        Caption = 'MAME Action Replay Page (scores3.htm; marp.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object LabelGoToMAMEHistory: TShadowLabel
        Left = 532
        Top = 437
        Width = 250
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://www.arcade-history.com'
        Caption = 'MAME History (history.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object LabelGoToMAMEScore: TShadowLabel
        Left = 532
        Top = 405
        Width = 213
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://www.mamescore.net'
        Caption = 'MAMEScore (story.dat)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
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
      end
      object GameDocsDisplayOrderBox: TPanelEx
        Left = 706
        Top = 45
        Width = 302
        Height = 320
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
          Width = 127
          Height = 31
          Caption = 'Display Order'
          Color = 16448250
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
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
          Frames = []
          Transparent = True
        end
        object GameDocsButtonUp: TBitBtnEx
          Tag = 1
          Left = 0
          Top = 279
          Width = 85
          Height = 38
          Hint = 'Move selected item up'
          Caption = 'Up'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          CaptionVertIndent = -1
        end
        object GameDocsButtonDown: TBitBtnEx
          Left = 90
          Top = 279
          Width = 85
          Height = 38
          Hint = 'Move selected folder down'
          Caption = 'Down'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          CaptionVertIndent = -1
        end
        object GameDocsButtonReset: TBitBtnEx
          Left = 217
          Top = 279
          Width = 85
          Height = 38
          Hint = 'Set the order of the texts to default'
          Caption = 'Reset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          CaptionVertIndent = -1
        end
        object GameDocs: TEasyListview
          Tag = 1
          Left = 1
          Top = 36
          Width = 300
          Height = 233
          BackGround.Enabled = True
          CellSizes.Report.Height = 37
          Color = clWhite
          Ctl3D = True
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          Groups.Items = {
            060000000100000010000000544561737947726F757053746F726564FFFECE00
            06000000810806000000060000000F00000054456173794974656D53746F7265
            64FFFECE0006000000800C01000000170000004D0041004D0045002000410063
            00740069006F006E0020005200650070006C0061007900200050006100670065
            0000000000000000000000000000000000000000000F00000054456173794974
            656D53746F726564FFFECE000600000080080000000000000000000000000000
            000000000000000000000F00000054456173794974656D53746F726564FFFECE
            0006000000800801000000170000004D0041004D004500200041006300740069
            006F006E0020005200650070006C006100790020005000610067006500000000
            00000000000000000000000000000000000F00000054456173794974656D5374
            6F726564FFFECE00060000008008000000000000000000000000000000000000
            0000000000000F00000054456173794974656D53746F726564FFFECE00060000
            0080080000000000000000000000000000000000000000000000000F00000054
            456173794974656D53746F726564FFFECE000600000080080100000017000000
            4D0041004D004500200041006300740069006F006E0020005200650070006C00
            6100790020005000610067006500000000000000000000000000000000000000
            000000000000000000000000000000000000}
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000000000128010000FFFFFF1F0001000000
            00000000000000000000000000000000}
          Header.Draggable = False
          Header.FixedSingleColumn = True
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.CheckSize = 22
          PaintInfoItem.CheckType = ectBox
          PaintInfoItem.ShowBorder = False
          ParentCtl3D = False
          ParentFont = False
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
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object GameDocsDisplayModeBox: TPanelEx
        Left = 10
        Top = 45
        Width = 470
        Height = 180
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
          Left = 26
          Top = 0
          Width = 128
          Height = 31
          Caption = 'Display Mode'
          Color = 16448250
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
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
          Frames = []
          Transparent = True
        end
        object GameDocsDisplayModeSinglePanelLabel: TShadowLabel
          Left = 27
          Top = 70
          Width = 348
          Height = 28
          Caption = 'Show images and game docs together'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Left = 27
          Top = 144
          Width = 439
          Height = 28
          Caption = 'Show images and game docs in separate panels'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Top = 35
          Width = 370
          Height = 36
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Images and Game Docs Single Panel'
          Checked = True
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object GameDocsDisplayModeTabs: TAdvOfficeRadioButtonEx
          Tag = 1
          Left = 0
          Top = 109
          Width = 395
          Height = 36
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Images and Game Docs Tabbed Panels'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object MAMEGameManualsPDFFolder: TEditEx
        Left = 10
        Top = 284
        Width = 386
        Height = 36
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object MAMEGameManualsPDFFolderButtonSelect: TBitBtnEx
        Left = 401
        Top = 284
        Width = 85
        Height = 38
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CaptionVertIndent = -1
      end
      object MAMEGameManualsPDFFolderButtonDefault: TBitBtnEx
        Left = 401
        Top = 324
        Width = 85
        Height = 38
        Hint = 'Click here to reset folder to default'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CaptionVertIndent = -1
      end
    end
  end
  object SampleBox: TPanelEx
    Left = 596
    Top = 1248
    Width = 497
    Height = 93
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
      Width = 495
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Sample Box'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
  end
end
