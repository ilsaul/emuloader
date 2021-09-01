object FormNightMode4K: TFormNightMode4K
  Left = 495
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Night Mode (4K)'
  ClientHeight = 1511
  ClientWidth = 3207
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object PanelPage1: TPanelEx
    Left = 0
    Top = 0
    Width = 2083
    Height = 1499
    Color1 = 2565927
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object NightModeToolBarBackgroundColorsBox: TPanelEx
      Left = 532
      Top = 128
      Width = 497
      Height = 186
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeToolBarBackgroundColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Background Colors'
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
      object NightModeLabelToolBarBkBottomColor: TShadowLabel
        Left = 10
        Top = 140
        Width = 69
        Height = 31
        Caption = 'Bottom'
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
      object NightModeLabelToolBarBkTopColor: TShadowLabel
        Left = 10
        Top = 94
        Width = 34
        Height = 31
        Caption = 'Top'
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
      object NightModeToolBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 45
        Width = 115
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeToolBarBkColorsButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default (blue)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeToolBarBkTopColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
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
      object NightModeToolBarBkBottomColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1513239
        NoneColorColor = clNone
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeToolBarBkColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeGamesSelectionBarColorsBox: TPanelEx
      Left = 10
      Top = 128
      Width = 497
      Height = 764
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeGamesSelectionBarColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List Selection Bar'
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
      object NightModeLabelGamesSelectionTopColor: TShadowLabel
        Left = 10
        Top = 140
        Width = 93
        Height = 31
        Caption = 'Top Bkgrd'
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
      object NightModeLabelGamesSelectionFontColor: TShadowLabel
        Left = 10
        Top = 278
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
      object NightModeLabelGamesSelectionFrameColor: TShadowLabel
        Left = 10
        Top = 232
        Width = 113
        Height = 31
        Caption = 'Frame Color'
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
      object NightModeLabelGamesSelectionMissROMsTopColor: TShadowLabel
        Left = 10
        Top = 360
        Width = 93
        Height = 31
        Caption = 'Top Bkgrd'
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
      object NightModeLabelGamesSelectionMissROMsFontColor: TShadowLabel
        Left = 10
        Top = 498
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
      object NightModeLabelGamesSelectionMissROMsFrameColor: TShadowLabel
        Left = 10
        Top = 452
        Width = 113
        Height = 31
        Caption = 'Frame Color'
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
      object NightModeGamesSelectionMissROMsLabel: TShadowLabel
        Left = 173
        Top = 322
        Width = 314
        Height = 31
        Caption = 'Games With Missing ROMs/CHDs'
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
      object NightModeLabelGamesSelectionInactiveTopColor: TShadowLabel
        Left = 10
        Top = 580
        Width = 93
        Height = 31
        Caption = 'Top Bkgrd'
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
      object NightModeLabelGamesSelectionInactiveFontColor: TShadowLabel
        Left = 10
        Top = 672
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
      object NightModeLabelGamesSelectionInactiveFrameColor: TShadowLabel
        Left = 10
        Top = 718
        Width = 113
        Height = 31
        Caption = 'Frame Color'
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
      object NightModeGamesSelectionInactiveLabel: TShadowLabel
        Left = 173
        Top = 542
        Width = 137
        Height = 31
        Caption = 'Inactive Colors'
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
      object NightModeLabelGamesSelectionBottomColor: TShadowLabel
        Left = 10
        Top = 186
        Width = 97
        Height = 31
        Caption = 'Bottom Bk'
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
      object NightModeLabelGamesSelectionMissROMsBottomColor: TShadowLabel
        Left = 10
        Top = 406
        Width = 97
        Height = 31
        Caption = 'Bottom Bk'
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
      object NightModeLabelGamesSelectionInactiveBottomColor: TShadowLabel
        Left = 10
        Top = 626
        Width = 97
        Height = 31
        Caption = 'Bottom Bk'
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
      object NightModeGameSelectionButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default (blue)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 92
        Width = 175
        Height = 36
        Hint = 'Enable alpha blended bar'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Alpha Blending'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGameSelectionGradientBar: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 115
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGameSelectionButtonPreview: TBitBtnEx
        Left = 304
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
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
        UseCustomDraw = True
      end
      object NightModeGamesSelectionBottomColor: TColorBoxEx
        Left = 173
        Top = 184
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 8290
        NoneColorColor = clNone
        Selected = 8290
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 4
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionFrameColor: TColorBoxEx
        Left = 173
        Top = 230
        Width = 312
        Height = 36
        Hint = 'Frame Color'
        DefaultColorColor = 1513239
        NoneColorColor = clNone
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 5
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionFontColor: TColorBoxEx
        Left = 173
        Top = 276
        Width = 312
        Height = 36
        Hint = 'Text Font Color'
        DefaultColorColor = 44287
        NoneColorColor = clNone
        Selected = 44287
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 6
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionMissROMsTopColor: TColorBoxEx
        Left = 173
        Top = 358
        Width = 312
        Height = 36
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 5636091
        NoneColorColor = clNone
        Selected = 5636091
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 7
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionMissROMsBottomColor: TColorBoxEx
        Left = 173
        Top = 404
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 44287
        NoneColorColor = clNone
        Selected = 44287
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
      object NightModeGamesSelectionMissROMsFrameColor: TColorBoxEx
        Left = 173
        Top = 450
        Width = 312
        Height = 36
        Hint = 'Frame Color'
        DefaultColorColor = 1513239
        NoneColorColor = clNone
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
      object NightModeGamesSelectionMissROMsFontColor: TColorBoxEx
        Left = 173
        Top = 496
        Width = 312
        Height = 36
        Hint = 'Text Font Color'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 10
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionInactiveTopColor: TColorBoxEx
        Left = 173
        Top = 578
        Width = 312
        Height = 36
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 9141097
        NoneColorColor = clNone
        Selected = 9141097
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 11
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionInactiveBottomColor: TColorBoxEx
        Left = 173
        Top = 624
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 12
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionInactiveFrameColor: TColorBoxEx
        Left = 173
        Top = 670
        Width = 312
        Height = 36
        Hint = 'Frame Color'
        DefaultColorColor = 1513239
        NoneColorColor = clNone
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 13
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesSelectionInactiveFontColor: TColorBoxEx
        Left = 173
        Top = 716
        Width = 312
        Height = 36
        Hint = 'Text Font Color'
        DefaultColorColor = clSilver
        NoneColorColor = clNone
        Selected = clSilver
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 14
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGameSelectionRoundCorners: TAdvOfficeCheckBoxEx
        Left = 230
        Top = 92
        Width = 170
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Round Corners'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGamesSelectionTopColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 16
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGameSelectionButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default (orange)'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeSearchGamesPanelColorsBox: TPanelEx
      Left = 532
      Top = 339
      Width = 497
      Height = 416
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeSearchGamesPanelColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Search Games Panel Colors'
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
      object NightModeLabelSearchGamesPanelFilterFontColor: TShadowLabel
        Left = 4
        Top = 95
        Width = 93
        Height = 31
        Caption = 'Filter Font'
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
      object NightModeLabelSearchGamesPanelFieldFontColor: TShadowLabel
        Left = 4
        Top = 140
        Width = 91
        Height = 31
        Caption = 'Field Font'
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
      object NightModeLabelSearchGamesPanelEditBoxFontColor: TShadowLabel
        Left = 4
        Top = 196
        Width = 126
        Height = 31
        Caption = 'Edit Text Font'
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
      object NightModeLabelSearchGamesPanelEditBoxBackgroundColor: TShadowLabel
        Left = 4
        Top = 242
        Width = 150
        Height = 31
        Caption = 'Edit Bkgrd Color'
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
      object NightModeLabelSearchGamesPanelEditBoxCustomFrameColor: TShadowLabel
        Left = 4
        Top = 324
        Width = 113
        Height = 31
        Caption = 'Frame Color'
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
      object LabelNightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TShadowLabel
        Left = 4
        Top = 370
        Width = 132
        Height = 31
        Caption = 'Focused Color'
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
      object NightModeLabelSearchGamesPanelEditBoxFrameColor: TShadowLabel
        Left = 173
        Top = 286
        Width = 139
        Height = 31
        Caption = 'Edit Box Frame'
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
      object NightModeSearchGamesPanelColorsButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default (blue)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeSearchGamesPanelFilterFontColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Font Color For The Filter Text'
        DefaultColorColor = 4734774
        NoneColorColor = clWhite
        Selected = 4734774
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
      end
      object NightModeSearchGamesPanelFieldFontColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Font Color For The Category Text'
        DefaultColorColor = 9469548
        NoneColorColor = clNone
        Selected = 9469548
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
      end
      object NightModeSearchGamesPanelEditBoxFontColor: TColorBoxEx
        Left = 173
        Top = 194
        Width = 312
        Height = 36
        Hint = 'Font Color For The Edit Box'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBoxEx
        Left = 173
        Top = 240
        Width = 312
        Height = 36
        Hint = 'Background Color For The Edit Box'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 4
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBoxEx
        Left = 173
        Top = 322
        Width = 312
        Height = 36
        Hint = 'Frame Color For The Edit Box'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 5
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBoxEx
        Left = 173
        Top = 368
        Width = 312
        Height = 36
        Hint = 'Focused Frame Color For The Edit Box'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 6
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelColorsButtonPreview: TBitBtnEx
        Left = 304
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
      object NightModeSearchGamesPanelColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeToolBarOverlayIconsFolderGroupBox: TPanelEx
      Left = 532
      Top = 10
      Width = 497
      Height = 93
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeToolBarOverlayIconsFolderGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Overlay Icons Folder'
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
      object ToolBarOverlayIconsFolderButtonUpdate: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Click here to update the folders list (no restart needed)'
        Caption = 'Update'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
      end
      object ToolBarOverlayIconsFolder: TComboBox2Ex
        Left = 10
        Top = 45
        Width = 386
        Height = 36
        Style = csOwnerDrawFixed
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 1
        CustomColorsEnabled = True
      end
    end
    object NightModeGamesListBackgroundBox: TPanelEx
      Left = 10
      Top = 917
      Width = 1541
      Height = 140
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeGamesListBackgroundBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 1539
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List Background'
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
      object NightModeGamesBackgroundColorLabel: TShadowLabel
        Left = 10
        Top = 94
        Width = 50
        Height = 31
        Caption = 'Color'
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
      object NightModeGamesBackgroundColor: TColorBoxEx
        Left = 84
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Games List Background Color'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesBackgroundColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 91
        Width = 85
        Height = 38
        Hint = 'Set default values'
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
      end
      object NightModeGamesBackgroundImage: TEditEx
        Left = 532
        Top = 92
        Width = 819
        Height = 36
        AutoSize = False
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        UseCustomBorder = True
      end
      object NightModeGamesBackgroundImageEnable: TAdvOfficeCheckBoxEx
        Left = 532
        Top = 46
        Width = 335
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Use Image as Background [.png]'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGamesTileBackground: TAdvOfficeCheckBoxEx
        Left = 1280
        Top = 46
        Width = 65
        Height = 36
        Hint = 'Tile the background image on the entire games list canvas'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Tile'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGamesBackgroundImageButtonSelect: TBitBtnEx
        Left = 1356
        Top = 91
        Width = 85
        Height = 38
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
      end
      object NightModeGamesBackgroundImageButtonUpdate: TBitBtnEx
        Left = 1445
        Top = 91
        Width = 85
        Height = 38
        Hint = 'Click here to load the image if you edited the filename manually'
        Caption = 'Update'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        CaptionVertIndent = -1
      end
    end
    object NightModeMAMEGameDocsBox: TPanelEx
      Left = 1576
      Top = 917
      Width = 497
      Height = 231
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeMAMEGameDocsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs'
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
      object NightModeGameDocsFont_Setting: TShadowLabel
        Left = 325
        Top = 113
        Width = 160
        Height = 38
        Hint = 'Select font for texts'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Select Font'
        Color = 1513239
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -21
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
      object NightModeGameDocumentsBackgroundColorLabel: TShadowLabel
        Left = 10
        Top = 47
        Width = 54
        Height = 31
        Caption = 'Bkgrd'
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
      object NightModeGameDocsBorderColorLabel: TShadowLabel
        Left = 10
        Top = 185
        Width = 62
        Height = 31
        Caption = 'Border'
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
      object NightModeGameDocumentsBackgroundColor: TColorBoxEx
        Left = 84
        Top = 45
        Width = 312
        Height = 36
        Hint = 'MAME Game Docs Background Color'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGameDocumentsButtonDefault: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Set background color / font default values (game docs)'
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
      object NightModeGameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 138
        Width = 225
        Height = 36
        Hint = '7 pixels border color'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGameDocsBorderColor: TColorBoxEx
        Left = 84
        Top = 183
        Width = 312
        Height = 36
        Hint = 'MAME Game Docs 7 Pixels Border Color'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGameDocsBorderColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 182
        Width = 85
        Height = 38
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
      end
      object NightModeGameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 92
        Width = 185
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Status Bar'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
    end
    object NightModeMenuPopupMenuBox: TPanelEx
      Left = 10
      Top = 10
      Width = 497
      Height = 93
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeMenuPopupMenuBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Menus / Popup Menus'
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
      object NightModeLabelMenuPopupMenuFrameColor: TShadowLabel
        Left = 10
        Top = 47
        Width = 58
        Height = 31
        Caption = 'Frame'
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
      object NightModeMenuPopupMenuFrameColor: TColorBoxEx
        Left = 84
        Top = 45
        Width = 312
        Height = 36
        Hint = 'Menu Frame Color'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeMenuPopupMenuFrameColorDefaultColors: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Set menus colors to default'
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
    end
    object NightModeButtonColorsBox: TPanelEx
      Left = 1576
      Top = 10
      Width = 497
      Height = 882
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeButtonColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Buttons Colors'
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
      object NightModeLabelButtonColorFontColor: TShadowLabel
        Left = 10
        Top = 94
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
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientTop: TShadowLabel
        Left = 10
        Top = 150
        Width = 34
        Height = 31
        Caption = 'Top'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientBottom: TShadowLabel
        Left = 10
        Top = 196
        Width = 69
        Height = 31
        Caption = 'Bottom'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientBottomHover: TShadowLabel
        Left = 10
        Top = 390
        Width = 130
        Height = 31
        Caption = 'Bottom Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientTopHover: TShadowLabel
        Left = 10
        Top = 344
        Width = 95
        Height = 31
        Caption = 'Top Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientTopDisabled: TShadowLabel
        Left = 10
        Top = 741
        Width = 120
        Height = 31
        Caption = 'Top Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientBottomDisabled: TShadowLabel
        Left = 10
        Top = 787
        Width = 155
        Height = 31
        Caption = 'Bottom Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFrameColor: TShadowLabel
        Left = 10
        Top = 242
        Width = 58
        Height = 31
        Caption = 'Frame'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFrameColorHover: TShadowLabel
        Left = 10
        Top = 436
        Width = 119
        Height = 31
        Caption = 'Frame Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFrameColorDisabled: TShadowLabel
        Left = 10
        Top = 833
        Width = 144
        Height = 31
        Caption = 'Frame Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFrameColorFocused: TShadowLabel
        Left = 10
        Top = 288
        Width = 140
        Height = 31
        Caption = 'Frame Focused'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFontColorDisabled: TShadowLabel
        Left = 10
        Top = 639
        Width = 124
        Height = 31
        Caption = 'Text Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientBottomSelected: TShadowLabel
        Left = 10
        Top = 538
        Width = 153
        Height = 31
        Caption = 'Bottom Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorGradientTopSelected: TShadowLabel
        Left = 10
        Top = 492
        Width = 118
        Height = 31
        Caption = 'Top Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelButtonColorFrameColorSelected: TShadowLabel
        Left = 10
        Top = 583
        Width = 142
        Height = 31
        Caption = 'Frame Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeButtonColorFontColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Text Font Color'
        DefaultColorColor = clCream
        Selected = clCream
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorGradientTop: TColorBoxEx
        Left = 173
        Top = 148
        Width = 312
        Height = 36
        Hint = 'Top Gradient Color'
        DefaultColorColor = 5131854
        Selected = 5131854
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
      object NightModeButtonColorGradientBottom: TColorBoxEx
        Left = 173
        Top = 194
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Color'
        DefaultColorColor = 3289650
        Selected = 3289650
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
      object NightModeButtonColorGradientTopHover: TColorBoxEx
        Left = 173
        Top = 342
        Width = 312
        Height = 36
        Hint = 'Top Gradient Color While Hovering'
        DefaultColorColor = 12153143
        Selected = 12153143
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorGradientBottomHover: TColorBoxEx
        Left = 173
        Top = 388
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Color While Hovering'
        DefaultColorColor = 10181674
        Selected = 10181674
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 4
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorGradientBottomDisabled: TColorBoxEx
        Left = 173
        Top = 785
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Color On Disabled'
        DefaultColorColor = 4473924
        Selected = 4473924
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 5
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorGradientTopDisabled: TColorBoxEx
        Left = 173
        Top = 739
        Width = 312
        Height = 36
        Hint = 'Top Gradient Color On Disabled'
        DefaultColorColor = 6579300
        Selected = 6579300
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 6
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorFrameColor: TColorBoxEx
        Left = 173
        Top = 240
        Width = 312
        Height = 36
        Hint = 'Frame Color'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 7
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorFrameColorHover: TColorBoxEx
        Left = 173
        Top = 434
        Width = 312
        Height = 36
        Hint = 'Frame Color While Hovering'
        DefaultColorColor = 1513239
        Selected = 1513239
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
      object NightModeButtonColorFrameColorDisabled: TColorBoxEx
        Left = 173
        Top = 831
        Width = 312
        Height = 36
        Hint = 'Frame Color On Disabled'
        DefaultColorColor = 4473924
        Selected = 4473924
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
      object NightModeButtonColorFrameColorFocused: TColorBoxEx
        Left = 173
        Top = 286
        Width = 312
        Height = 36
        Hint = 'Frame Color While Focused'
        DefaultColorColor = 12615756
        Selected = 12615756
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 10
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorFontColorDisabled: TColorBoxEx
        Left = 173
        Top = 637
        Width = 312
        Height = 36
        Hint = 'Font Color For The Disabled Text'
        DefaultColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 11
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorFontShadowColorDisabled: TColorBoxEx
        Left = 173
        Top = 683
        Width = 312
        Height = 36
        Hint = 'Shadow Font Color For The Disabled Ttext'
        DefaultColorColor = 1513239
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 12
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeColorsBoxButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default (blue selected button)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = IL_32x32
        UseCustomDraw = True
      end
      object NightModeButtonColorGradientTopSelected: TColorBoxEx
        Left = 173
        Top = 490
        Width = 312
        Height = 36
        Hint = 'Top Gradient Color On Selected'
        DefaultColorColor = 20985
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 14
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorGradientBottomSelected: TColorBoxEx
        Left = 173
        Top = 536
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Color On Selected'
        DefaultColorColor = 8290
        Selected = 8290
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 15
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeButtonColorFrameColorSelected: TColorBoxEx
        Left = 173
        Top = 581
        Width = 312
        Height = 36
        Hint = 'Frame Color On Selected'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 16
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeLabelButtonColorFontShadowColorDisabled: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 683
        Width = 150
        Height = 36
        Hint = 'Text Shadow Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Text Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeColorsBoxButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default (orange selected button)'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = IL_32x32
        UseCustomDraw = True
      end
      object NightModeColorsBoxButtonPreview: TBitBtnEx
        Left = 304
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
      object NightModeButtonColorsBoxButtonUpdateScreenButtons: TBitBtnEx
        Left = 172
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Update buttons colors on this screen'
        Caption = 'Apply'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
    end
    object NightModeGamesListSplittersBox: TPanelEx
      Left = 1054
      Top = 706
      Width = 497
      Height = 186
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeGamesListSplittersBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List / Machines List Splitters'
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
      object NightModeLabelGamesListSplitterSingleColor: TShadowLabel
        Left = 10
        Top = 94
        Width = 50
        Height = 31
        Caption = 'Color'
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
      object NightModeLabelGamesListSplitterSingleColorHot: TShadowLabel
        Left = 10
        Top = 140
        Width = 90
        Height = 31
        Caption = 'Hot Color'
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
      object NightModeGamesListSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 44
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
        TabOrder = 0
        CaptionVertIndent = -1
      end
      object NightModeGamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 175
        Height = 36
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGamesListSplitterSingleColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter'
        DefaultColorColor = 1513239
        NoneColorColor = clNone
        Selected = 1513239
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
      end
      object NightModeGamesListSplitterSingleColorHot: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
      end
    end
    object NightModeImagesHintBox: TPanelEx
      Left = 1054
      Top = 1082
      Width = 497
      Height = 408
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
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
        Top = 184
        Width = 123
        Height = 31
        Caption = 'Opacity [190]'
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
        Top = 317
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
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset hint box colors and position to default (blue colors)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
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
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeHintBox_Opacity: TGaugeBar
        Left = 10
        Top = 222
        Width = 386
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
        Left = 401
        Top = 221
        Width = 85
        Height = 38
        Hint = 'Set opacity to default level'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object NightModeHintTextDefaultColorsButtonDefault: TBitBtnEx
        Left = 392
        Top = 268
        Width = 38
        Height = 38
        Hint = 'Reset text colors to default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeHintBox_FontItalicStyle: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 272
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
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeHintBox_TextColor: TColorBoxEx
        Left = 173
        Top = 314
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
        Top = 360
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
        Top = 361
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
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeImagesHintBoxButtonPreview: TBitBtnEx
        Left = 304
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        CaptionVertIndent = -1
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
      object NightModeHintBoxtColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset hint box colors and position to default (darker colors)'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeHintTextDefaultColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 268
        Width = 53
        Height = 38
        Hint = 'Reset text colors to default (orange color)'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeImageSplittersBox: TPanelEx
      Left = 1576
      Top = 1185
      Width = 497
      Height = 186
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeImageSplittersBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Image Splitters'
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
      object NightModeLabelImageSplitterSingleColor: TShadowLabel
        Left = 10
        Top = 94
        Width = 50
        Height = 31
        Caption = 'Color'
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
      object NightModeLabelImageSplitterSingleColorHot: TShadowLabel
        Left = 10
        Top = 140
        Width = 90
        Height = 31
        Caption = 'Hot Color'
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
      object NightModeImageSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Reset colors to default'
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object NightModeImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 175
        Height = 36
        Hint = 'Show/hide grip icon in the middle of the image splitters'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeImageSplitterSingleColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter'
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
        TabOrder = 2
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeImageSplitterSingleColorHot: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = 20985
        NoneColorColor = clGray
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
      end
    end
    object NightModeImageBorderColorBox: TPanelEx
      Left = 1576
      Top = 1397
      Width = 497
      Height = 93
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeImageBorderColorBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Image 7 Pixels Border Color'
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
      object NightModeImageBorderColorLabel: TShadowLabel
        Left = 10
        Top = 47
        Width = 62
        Height = 31
        Caption = 'Border'
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
      object NightModeImageBorderColor: TColorBoxEx
        Left = 84
        Top = 45
        Width = 312
        Height = 36
        Hint = 'Image 7 Pixels Border Color'
        DefaultColorColor = 1513239
        NoneColorColor = clWhite
        Selected = 1513239
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeImageBorderColorButtonDefault: TBitBtnEx
        Left = 401
        Top = 44
        Width = 85
        Height = 38
        Caption = 'Default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object NightModeProfilesBox: TPanelEx
      Left = 10
      Top = 1396
      Width = 1019
      Height = 93
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeProfilesBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 1017
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Night Mode Profiles'
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
      object PanelBottom: TPanelEx
        Left = 0
        Top = 40
        Width = 1017
        Height = 51
        Align = alBottom
        Color1 = 2565927
        Color2 = 3289650
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clGreen
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSimple
        object NightModeProfiles_ButtonNew: TBitBtnEx
          Left = 745
          Top = 4
          Width = 85
          Height = 38
          Hint = 'Create a new profile'
          Caption = 'New'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          CaptionVertIndent = -1
          UseCustomDraw = True
        end
        object NightModeProfiles: TComboBox2Ex
          Left = 56
          Top = 5
          Width = 471
          Height = 36
          Hint = 'Night mode profiles'
          Style = csOwnerDrawFixed
          Color = clWhite
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
        object NightModeProfiles_ButtonSave: TBitBtnEx
          Left = 834
          Top = 4
          Width = 85
          Height = 38
          Hint = 'Save current profile to .ini file'
          Caption = 'Save'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          CaptionVertIndent = -1
          UseCustomDraw = True
        end
        object NightModeProfiles_ButtonDelete: TBitBtnEx
          Left = 923
          Top = 4
          Width = 85
          Height = 38
          Hint = 'Delete current profile'
          Caption = 'Delete'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          CaptionVertIndent = -1
          UseCustomDraw = True
        end
        object NightModeProfiles_ButtonUpdate: TBitBtnEx
          Left = 9
          Top = 4
          Width = 38
          Height = 38
          Hint = 'Click here to update the profiles list (no restart needed)'
          TabOrder = 4
          CaptionVertIndent = -1
          ImageIndex = 15
          Images = IL_32x32
          UseCustomDraw = True
        end
        object NightModeProfiles_ButtonReload: TBitBtnEx
          Left = 536
          Top = 4
          Width = 85
          Height = 38
          Hint = 'Reload current profile settings from .ini file'
          Caption = 'Reload'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          CaptionVertIndent = -1
          UseCustomDraw = True
        end
        object NightModeProfiles_ButtonDefault: TBitBtnEx
          Left = 625
          Top = 4
          Width = 116
          Height = 38
          Hint = 'Click here to set all controls to frontend default values'
          Caption = 'Default All'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          CaptionVertIndent = -1
          UseCustomDraw = True
        end
      end
    end
    object NightModePanelColorsBox: TPanelEx
      Left = 1054
      Top = 10
      Width = 497
      Height = 594
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModePanelColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Panels Colors (Mostly Frames and Message Boxes)'
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
      object NightModeLabelPanelColorsTitleFontColor: TShadowLabel
        Left = 10
        Top = 400
        Width = 87
        Height = 31
        Caption = 'Title Font'
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
      object NightModePanelColorsImageCategoryTextFontColorLabel: TShadowLabel
        Left = 10
        Top = 298
        Width = 149
        Height = 31
        Caption = 'Image Text Font'
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
      object NightModeLabelSearchGamesPanelTopColor: TShadowLabel
        Left = 10
        Top = 94
        Width = 34
        Height = 31
        Caption = 'Top'
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
      object NightModeLabelPanelColorsTitle2FontColor: TShadowLabel
        Left = 10
        Top = 502
        Width = 104
        Height = 31
        Caption = 'Title 2 Font'
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
      object NightModeLabelSearchGamesPanelOuterFrameColor: TShadowLabel
        Left = 10
        Top = 242
        Width = 117
        Height = 31
        Caption = 'Outer Frame'
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
      object NightModeLabelSearchGamesPanelInnerFrameColor: TShadowLabel
        Left = 10
        Top = 196
        Width = 112
        Height = 31
        Caption = 'Inner Frame'
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
      object NightModeLabelSearchGamesPanelBottomColor: TShadowLabel
        Left = 10
        Top = 140
        Width = 69
        Height = 31
        Caption = 'Bottom'
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
      object NightModePanelColorsImageZipTextFontColorLabel: TShadowLabel
        Left = 10
        Top = 344
        Width = 141
        Height = 31
        Caption = 'Image Zip Font'
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
      object NightModeSearchGamesPanelGradientBar: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 115
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModePanelsBackgroundColorsDefaultButton: TBitBtnEx
        Left = 386
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default (blue)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModePanelColorsImageCategoryTextFontColor: TColorBoxEx
        Left = 173
        Top = 296
        Width = 312
        Height = 36
        Hint = 'Font Color For The Image Category Text'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
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
      object NightModePanelColorsImageZipTextFontColor: TColorBoxEx
        Left = 173
        Top = 342
        Width = 312
        Height = 36
        Hint = 'Font Color For The Image Zip File Text'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModePanelColorsTitleFontColor: TColorBoxEx
        Left = 173
        Top = 398
        Width = 312
        Height = 36
        Hint = 'Font Color For The Title Text'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 4
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModePanelColorsTitleShadowFontColor: TColorBoxEx
        Left = 173
        Top = 444
        Width = 312
        Height = 36
        Hint = 'Shadow Font Color For The Title Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 5
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModePanelColorsTitle2ShadowFontColor: TColorBoxEx
        Left = 173
        Top = 546
        Width = 312
        Height = 36
        Hint = 'Shadow Font Color For The Second Title Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 6
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeSearchGamesPanelTopColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 4734774
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 7
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeSearchGamesPanelBottomColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1578258
        Selected = 1578258
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
      object NightModeSearchGamesPanelInnerFrameColor: TColorBoxEx
        Left = 173
        Top = 194
        Width = 312
        Height = 36
        Hint = 'Inner Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
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
      object NightModeSearchGamesPanelOuterFrameColor: TColorBoxEx
        Left = 173
        Top = 240
        Width = 312
        Height = 36
        Hint = 'Outer Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 10
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModePanelColorsTitle2FontColor: TColorBoxEx
        Left = 173
        Top = 500
        Width = 312
        Height = 36
        Hint = 'Font Color For The Second Title Text'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 11
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModePanelColorsBoxButtonPreview: TBitBtnEx
        Left = 298
        Top = 44
        Width = 85
        Height = 38
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        CaptionVertIndent = -1
      end
      object NightModePanelColorsTitleShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 445
        Width = 155
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Title Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModePanelColorsTitle2ShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 546
        Width = 160
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Title2 Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModePanelsBackgroundColorsDefaultButton2: TBitBtnEx
        Tag = 1
        Left = 427
        Top = 44
        Width = 55
        Height = 38
        Hint = 'Reset colors to default'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = IL_32x32
      end
    end
    object NightModeGamesListStatusBarColorsBox: TPanelEx
      Left = 532
      Top = 1082
      Width = 497
      Height = 242
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeGamesListStatusBarColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List Status Bar Colors'
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
      object NightModeLabelGamesListStatusBarFontColor: TShadowLabel
        Left = 10
        Top = 196
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
      object NightModeLabelGamesListStatusBarBottomColor: TShadowLabel
        Left = 10
        Top = 140
        Width = 69
        Height = 31
        Caption = 'Bottom'
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
      object NightModeLabelGamesListStatusBarTopColor: TShadowLabel
        Left = 10
        Top = 94
        Width = 34
        Height = 31
        Caption = 'Top'
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
      object NightModeGamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 46
        Width = 115
        Height = 36
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
        CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
      end
      object NightModeGamesListStatusBarButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeGamesListStatusBarTopColor: TColorBoxEx
        Left = 173
        Top = 92
        Width = 312
        Height = 36
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 1513239
        Selected = 1513239
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
      object NightModeGamesListStatusBarBottomColor: TColorBoxEx
        Left = 173
        Top = 138
        Width = 312
        Height = 36
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1052429
        Selected = 1052429
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesListStatusBarFontColor: TColorBoxEx
        Left = 173
        Top = 194
        Width = 312
        Height = 36
        Hint = 'Text Font Color'
        DefaultColorColor = 11836807
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 4
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesListStatusBarButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeGamesListHeaderGroupBox: TPanelEx
      Left = 10
      Top = 1082
      Width = 497
      Height = 242
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object NightModeGamesListHeaderGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Games List Column Header'
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
      object NightModeGamesListHeaderBackgroundColorHoverLabel: TShadowLabel
        Left = 10
        Top = 150
        Width = 56
        Height = 31
        Caption = 'Hover'
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
      object NightModeGamesListHeaderBackgroundColorLabel: TShadowLabel
        Left = 10
        Top = 104
        Width = 54
        Height = 31
        Caption = 'Bkgrd'
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
      object NightModeGamesListHeaderBackgroundColorDownLabel: TShadowLabel
        Left = 10
        Top = 196
        Width = 55
        Height = 31
        Caption = 'Down'
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
      object NightModeGamesListHeaderFont: TShadowLabel
        Left = 173
        Top = 45
        Width = 160
        Height = 36
        Hint = 'Customize Header Font'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Select Font'
        CaptionIndent = 8
        Color = 2367259
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -21
        Font.Name = 'Segoe UI'
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
      object NightModeGamesListHeaderFontColorLabel: TShadowLabel
        Left = 10
        Top = 47
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
      object NightModeGamesListHeaderButtonDefault: TBitBtnEx
        Left = 392
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Reset colors to default'
        TabOrder = 0
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeGamesListHeaderBackgroundColor: TColorBoxEx
        Left = 173
        Top = 102
        Width = 312
        Height = 36
        Hint = 'Background Color'
        DefaultColorColor = 2367259
        NoneColorColor = clBtnFace
        Selected = 2367259
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
      object NightModeGamesListHeaderBackgroundColorHover: TColorBoxEx
        Left = 173
        Top = 148
        Width = 312
        Height = 36
        Hint = 'Background Color White Hovering'
        DefaultColorColor = 5263440
        NoneColorColor = clGray
        Selected = 5263440
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
      object NightModeGamesListHeaderBackgroundColorDown: TColorBoxEx
        Left = 173
        Top = 194
        Width = 312
        Height = 36
        Hint = 'Background Color While Pressed'
        DefaultColorColor = 2565927
        NoneColorColor = clNone
        Selected = 2565927
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 3
        CustomColorsEnabled = True
        CaptionVertIndent = -1
      end
      object NightModeGamesListHeaderButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 433
        Top = 44
        Width = 53
        Height = 38
        Hint = 'Reset colors to default (darker)'
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeCheckBoxRadioButtonBox: TPanelEx
      Left = 532
      Top = 799
      Width = 497
      Height = 93
      Color1 = 5263440
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = 5787720
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgSolid
      object CheckBoxRadioButtonBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 495
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Check Box / Radio Button'
        CaptionIndent = 7
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = 5588805
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 4210752
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object NightModeCheckBoxRadioButtonBoxFolderFullPathLabel: TShadowLabel
        Left = 411
        Top = 6
        Width = 74
        Height = 31
        Caption = 'FullPath'
        Color = 2629656
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
        Visible = False
      end
      object NightModeCheckBoxRadioButtonProfile: TComboBox2Ex
        Left = 105
        Top = 45
        Width = 338
        Height = 36
        Style = csOwnerDrawFixed
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ParentFont = False
        TabOrder = 0
        CustomColorsEnabled = True
      end
      object NightModeCheckBoxRadioButton_Radio1: TAdvOfficeRadioButtonEx
        Left = 41
        Top = 45
        Width = 30
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Checked = True
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeCheckBoxRadioButton_Radio2: TAdvOfficeRadioButtonEx
        Left = 72
        Top = 45
        Width = 30
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeCheckBoxRadioButton_Check1: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 45
        Width = 30
        Height = 36
        AllowGrayed = True
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object NightModeCheckBoxRadioButtonProfileButtonUpdate: TBitBtnEx
        Left = 448
        Top = 44
        Width = 38
        Height = 38
        Hint = 'Click here to update the folders list (no restart needed)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object NightModePanelColorsBoxPreview: TPanelEx
    Left = 2096
    Top = 1079
    Width = 685
    Height = 215
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object NightModePanelColorsBoxPreviewLabel: TShadowLabel
      Left = 72
      Top = 10
      Width = 206
      Height = 31
      Caption = 'Preview: Panels Colors'
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
      Frames = []
      Transparent = True
    end
    object NightModePanelColorsBoxPreviewButtonClose: TShadowLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object PanelInitZipFile: TPanelEx
      Left = 12
      Top = 54
      Width = 657
      Height = 145
      Color1 = 4734774
      Color2 = 1578258
      Color3 = 7891291
      Color4 = clTeal
      ColorFrame = 1578258
      ColorInnerFrame = 1578258
      EnableInnerFrame = True
      Frames = [frLeft, frTop, frRight, frBottom]
      ParentBackground = False
      Style = vgSimple
      object LabelInitZipTitle: TShadowLabel
        Left = 80
        Top = 8
        Width = 565
        Height = 30
        AutoSize = False
        Caption = 'Initializing Zipped Images Contents Array'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelInitZipFile: TShadowLabel
        Left = 11
        Top = 111
        Width = 634
        Height = 28
        Hint = '" list in RAM for fast access.'
        AutoSize = False
        Caption = 'Parsing "artpreview.zip" list in RAM for fast access.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        WordWrap = True
      end
      object LabelInitZipSystemTitle: TShadowLabel
        Left = 80
        Top = 46
        Width = 567
        Height = 28
        AutoSize = False
        Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelInitZipImageCategory: TShadowLabel
        Left = 80
        Top = 81
        Width = 567
        Height = 28
        AutoSize = False
        Caption = 'Game Snapshot'
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object InitZipSystemIcon: TImage
        Tag = -1
        Left = 6
        Top = 6
        Width = 68
        Height = 68
        Transparent = True
      end
    end
  end
  object NightModeImagesHintBoxPreview: TPanelEx
    Left = 2096
    Top = 572
    Width = 604
    Height = 479
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object NightModeImagesHintBoxPreviewLabel: TShadowLabel
      Left = 72
      Top = 10
      Width = 226
      Height = 31
      Caption = 'Preview: Image Hint Box'
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
      Frames = []
      Transparent = True
    end
    object NightModeImagesHintBoxPreviewButtonClose: TShadowLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object ImageHintPanel_Image: TImage32
      Left = 12
      Top = 54
      Width = 576
      Height = 361
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baCenter
      Color = 2565927
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 0
      object ImageHintPanel: TPanelEx
        Tag = -1
        Left = 355
        Top = 260
        Width = 200
        Height = 80
        Color1 = 1578258
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = 4734774
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object ImageHintText: TShadowLabel
          Left = 46
          Top = 12
          Width = 142
          Height = 28
          Caption = 'Game Snapshot'
          Font.Charset = ANSI_CHARSET
          Font.Color = 20985
          Font.Height = -21
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = 1578258
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ImageHintIcon: TImage
          Left = 10
          Top = 10
          Width = 32
          Height = 32
          Transparent = True
        end
        object ImageHintDetailsText: TShadowLabel
          Left = 46
          Top = 43
          Width = 133
          Height = 25
          Caption = '0000x0000 PNG'
          Font.Charset = ANSI_CHARSET
          Font.Color = 20985
          Font.Height = -19
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = 1578258
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
      end
    end
    object NightModeImageHintPanel_ImageView1: TBitBtnEx
      Left = 11
      Top = 426
      Width = 135
      Height = 38
      Caption = 'View Snap 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      CaptionVertIndent = -1
    end
    object NightModeImageHintPanel_ImageView2: TBitBtnEx
      Tag = 1
      Left = 454
      Top = 426
      Width = 135
      Height = 38
      Caption = 'View Snap 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      CaptionVertIndent = -1
    end
  end
  object NightModeGamesSelectionBarPreview: TPanelEx
    Left = 2768
    Top = 153
    Width = 408
    Height = 250
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object NightModeGamesSelectionBarPreviewLabel: TShadowLabel
      Left = 72
      Top = 10
      Width = 309
      Height = 31
      Caption = 'Preview: Games List Selection Bar'
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
      Frames = []
      Transparent = True
    end
    object NightModeGamesSelectionBarPreviewButtonClose: TShadowLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object NightModeGamesListView: TEasyListview
      Left = 12
      Top = 54
      Width = 380
      Height = 180
      CellSizes.SmallIcon.Height = 20
      CellSizes.Tile.Width = 260
      CellSizes.Report.Height = 40
      Color = clBlack
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clWhite
      EditManager.Font.Height = -21
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
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
        06000000810806000000030000000F00000054456173794974656D53746F7265
        64FFFECE0006000000800C010000000F00000041007600610069006C00610062
        006C0065002000470061006D0065007300000000000100000000000000000000
        0000000000000000000F00000054456173794974656D53746F726564FFFECE00
        060000008008010000001C000000470061006D00650073002000570069007400
        680020004D0069007300730069006E006700200052004F004D0073002F004300
        4800440073000000000001000000010000000000000000000000000000000F00
        000054456173794974656D53746F726564FFFECE000600000080080100000028
        000000530065006C00650063007400200061006E0020004900740065006D0020
        0074006F002000540065007300740020007400680065002000530065006C0065
        006300740069006F006E00200042006100720000000000010000000000000000
        000000000000000000000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000178010000FFFFFF1F0001000000
        01000000050000005400690074006C006500000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Sizeable = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoColumn.CaptionIndent = 0
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandEnabled = False
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 0
      PaintInfoGroup.MarginBottom.Visible = True
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      PaintInfoItem.TileDetailCount = 2
      PaintInfoItem.ReportViewTextTopBorderIndent = -1
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendAlphaImage = 0
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
      CustomEnableIconHD = False
    end
  end
  object NightModeSearchGamesPanelColorsBoxPreview: TPanelEx
    Left = 2096
    Top = 1303
    Width = 621
    Height = 161
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object NightModeSearchGamesPanelColorsBoxPreviewButtonClose: TShadowLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object NightModeSearchGamesPanelColorsBoxPreviewLabel: TShadowLabel
      Left = 72
      Top = 10
      Width = 414
      Height = 31
      Caption = 'Preview: Tool Bar Search Games Panel Colors'
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
      Frames = []
      Transparent = True
    end
    object NightModePanelSearchGames: TPanelEx
      Left = 12
      Top = 54
      Width = 593
      Height = 91
      Color1 = 4734774
      Color2 = 1513239
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 1578258
      ColorInnerFrame = 1578258
      EnableCustomBorder = ecbDouble
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object NightModeLabelSearchGamesFilter: TShadowLabel
        Left = 12
        Top = 12
        Width = 80
        Height = 24
        Caption = 'Filter by'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeLabelSearchGamesBy: TShadowLabel
        Left = 98
        Top = 12
        Width = 43
        Height = 24
        Caption = 'Title'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9469548
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ButtonFilterTitleApply_ToolBar: TSpeedButtonEx
        Left = 432
        Top = 40
        Width = 36
        Height = 37
        Hint = 'Click here to apply filter'
        Flat = True
        ImageIndex = 9
        FontColorDisabled = clBtnShadow
        FontShadowColorDisabled = clBtnHighlight
        GradientColorTop_Disabled = clSilver
        GradientColorBottom_Disabled = clMedGray
        FrameColor_Disabled = clGray
      end
      object ButtonFilterControls_ToolBar: TSpeedButtonEx
        Left = 469
        Top = 40
        Width = 36
        Height = 37
        Hint = 
          'Click here to select a MAME controls filter (will be applied imm' +
          'ediately)'
        Flat = True
        ImageIndex = 12
        FontColorDisabled = clBtnShadow
        FontShadowColorDisabled = clBtnHighlight
        GradientColorTop_Disabled = clSilver
        GradientColorBottom_Disabled = clMedGray
        FrameColor_Disabled = clGray
      end
      object ButtonFilterTitleReset_ToolBar: TSpeedButtonEx
        Left = 506
        Top = 40
        Width = 36
        Height = 37
        Hint = 'Click here to reset filters to default (games tool bar buttons)'
        Flat = True
        ImageIndex = 3
        FontColorDisabled = clBtnShadow
        FontShadowColorDisabled = clBtnHighlight
        GradientColorTop_Disabled = clSilver
        GradientColorBottom_Disabled = clMedGray
        FrameColor_Disabled = clGray
      end
      object ButtonFilterTitleSettings_ToolBar: TSpeedButtonEx
        Left = 543
        Top = 40
        Width = 36
        Height = 37
        Hint = 'Click here to change settings'
        Flat = True
        ImageIndex = 10
        FontColorDisabled = clBtnShadow
        FontShadowColorDisabled = clBtnHighlight
        GradientColorTop_Disabled = clSilver
        GradientColorBottom_Disabled = clMedGray
        FrameColor_Disabled = clGray
      end
      object NightModeFilterGameTitle: TEditEx
        Left = 12
        Top = 41
        Width = 416
        Height = 34
        AutoSize = False
        BevelOuter = bvNone
        Color = 4734774
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Game Title Is My Name'
        ColorFrame = 9141097
        ColorFrameFocused = clWhite
        UseCustomBorder = True
      end
    end
  end
  object NightModeButtonColorsBoxPreview: TPanelEx
    Left = 2712
    Top = 575
    Width = 477
    Height = 128
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    Visible = False
    object NightModeButtonColorsBoxPreviewButtonClose: TShadowLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object NightModeButtonColorsBoxPreviewLabel: TShadowLabel
      Left = 72
      Top = 10
      Width = 218
      Height = 31
      Caption = 'Preview: Buttons Colors'
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
      Frames = []
      Transparent = True
    end
    object NightModeButtonColorsSamplePanel: TPanelEx
      Left = 12
      Top = 54
      Width = 449
      Height = 58
      Color1 = 5263440
      Color2 = clYellow
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object NightModeButtonColorsSampleButton4: TSpeedButtonEx
        Left = 334
        Top = 10
        Width = 105
        Height = 38
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Selected'
        CaptionVertIndent = -1
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        FontColorDisabled = clBtnShadow
        FontShadowColorDisabled = clBtnHighlight
        GradientColorTop_Disabled = clSilver
        GradientColorBottom_Disabled = clMedGray
        FrameColor_Disabled = clGray
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton1: TBitBtnEx
        Tag = 1
        Left = 10
        Top = 10
        Width = 105
        Height = 38
        Caption = 'Click me!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton2: TBitBtnEx
        Left = 118
        Top = 10
        Width = 105
        Height = 38
        Caption = 'Button 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton3: TBitBtnEx
        Left = 226
        Top = 10
        Width = 105
        Height = 38
        Caption = 'Disabled'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        CaptionVertIndent = -1
        UseCustomDraw = True
      end
    end
  end
  object NightModeNewProfileBox: TPanelEx
    Left = 2096
    Top = 8
    Width = 659
    Height = 548
    Color1 = 3289650
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 1
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object NightModeNewProfileBoxLabel: TShadowLabel
      Left = 68
      Top = 24
      Width = 199
      Height = 31
      Caption = 'Create A New Profile'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 5588805
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 4210752
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object NightModeNewProfileBoxButtonClose: TShadowLabel
      Left = 580
      Top = 24
      Width = 50
      Height = 30
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 23170
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object NightModeNewProfileProfileNameLabel: TShadowLabel
      Left = 28
      Top = 284
      Width = 122
      Height = 31
      Caption = 'Profile Name'
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
    object NightModeNewProfileProfileNameTipLabel: TShadowLabel
      Left = 163
      Top = 322
      Width = 446
      Height = 31
      Caption = 'You may select a profile above to copy its colors'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
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
    object NightModeNewProfileCreateWithDefaultColorsLabel: TShadowLabel
      Left = 55
      Top = 413
      Width = 270
      Height = 31
      Caption = 'Ignore profile selected above'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
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
    object NightModeNewProfileBoxIcon: TImage
      Left = 24
      Top = 24
      Width = 32
      Height = 32
    end
    object NightModeNewProfileBoxButtonConfirm: TBitBtnEx
      Left = 215
      Top = 483
      Width = 105
      Height = 38
      Caption = 'Confirm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object NightModeNewProfileBoxButtonAbort: TBitBtnEx
      Tag = 1
      Left = 334
      Top = 483
      Width = 105
      Height = 38
      Caption = 'Abort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      CaptionVertIndent = -1
    end
    object NightModeNewProfileProfileName: TEditEx
      Left = 159
      Top = 281
      Width = 472
      Height = 36
      AutoSize = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      UseCustomBorder = True
    end
    object NightModeNewProfileUseColorsActiveProfile: TAdvOfficeCheckBoxEx
      Left = 28
      Top = 378
      Width = 395
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
      Caption = 'Always Use Colors of The Active Profile'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = IL_NightModeCheckBoxRadioButtonIcons
      CustomIconsImagesHD = IL_NightModeCheckBoxRadioButtonIconsHD
    end
    object NightModeNewProfileProfilesList: TEasyListview
      Left = 24
      Top = 78
      Width = 607
      Height = 191
      CellSizes.SmallIcon.Height = 20
      CellSizes.Tile.Width = 260
      CellSizes.Report.Height = 36
      Color = 2565927
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clWhite
      EditManager.Font.Height = -21
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
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
        06000000810806000000050000000F00000054456173794974656D53746F7265
        64FFFECE00060000008008010000002B00000067006600640067006400660067
        0020006400660067002000640066006700200073006400660067002000640073
        0066006700200064007300660067006400660067006400730066006700200064
        00660067006600640000000000000000000000000000000000000000000F0000
        0054456173794974656D53746F726564FFFECE00060000008008010000001B00
        0000670073006400660020006700640066007300200067006400660020006700
        6400660020006700640066002000670064006600200067000000000000000000
        0000000000000000000000000F00000054456173794974656D53746F726564FF
        FECE000600000080080100000030000000670066007300200064006600670064
        0020007300660067006400660020006700640066006A00200067006B0064006A
        00660067006B006A00200068007300640066006B006A00200068006B0064006A
        0066006800200067006B00640066006700000000000000000000000000000000
        00000000000F00000054456173794974656D53746F726564FFFECE0006000000
        8008010000003A00000067006A00640066006B0067006A006400660020006C00
        67006A006B006C002000640066006A0067006C006B0064006A00660020006C00
        67006A00640066006C0020006A0067006C0064006A00660020006C0067006A00
        64006C00660020006A0067006F0072006500690074006F00740075006F000000
        0000000000000000000000000000000000000F00000054456173794974656D53
        746F726564FFFECE0006000000800C010000003D000000660067006B00200064
        0066006C00E70067006B0064006600E7006C006A0067006C006B002000640066
        006A00670073007200390074007500720073003900750066006400750020006F
        0066007500640061006F0073006400660075006F0069006C00200075006C0069
        00620076006A0069006C00630076006A00000000000000000000000000000000
        000000000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000000015B020000FFFFFF1F0001000000
        01000000050000005400690074006C006500000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Sizeable = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandEnabled = False
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 0
      PaintInfoGroup.MarginBottom.Visible = True
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      PaintInfoItem.TileDetailCount = 2
      PaintInfoItem.ReportViewTextTopBorderIndent = -1
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorderColor = 5787720
      ShowHint = True
      Selection.BlendAlphaImage = 0
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
      TabOrder = 4
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
  end
  object PanelPage2: TPanelEx
    Left = 2768
    Top = 16
    Width = 60
    Height = 60
    Color1 = 2565927
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
  end
  object IL_NightModeCheckBoxRadioButtonIcons: TImageList
    Height = 13
    Width = 13
    Left = 2776
    Top = 96
  end
  object IL_NightModeCheckBoxRadioButtonIconsHD: TImageList
    Height = 23
    Width = 23
    Left = 2816
    Top = 96
  end
  object IL_32x32: TImageList
    Height = 32
    Width = 32
    Left = 2856
    Top = 96
  end
end
