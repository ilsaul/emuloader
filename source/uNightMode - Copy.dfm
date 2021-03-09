object FormNightMode: TFormNightMode
  Left = 1217
  Top = 556
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Night Mode'
  ClientHeight = 1009
  ClientWidth = 1635
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelPage1: TPanelEx
    Left = 0
    Top = 0
    Width = 1212
    Height = 806
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
      Left = 311
      Top = 74
      Width = 287
      Height = 96
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Background Colors'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 71
        Width = 43
        Height = 16
        Caption = 'Bottom'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelToolBarBkTopColor: TShadowLabel
        Left = 4
        Top = 47
        Width = 24
        Height = 16
        Caption = 'Top'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeToolBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 69
        Height = 20
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = NightModeToolBarGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeToolBarBkColorsButtonDefault: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default (blue)'
        TabOrder = 1
        OnClick = NightModeToolBarBkColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeToolBarBkTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeToolBarBkTopColorSelect
        CustomColorsEnabled = True
      end
      object NightModeToolBarBkBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeToolBarBkBottomColorSelect
        CustomColorsEnabled = True
      end
      object NightModeToolBarBkColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default'
        Caption = '2'
        TabOrder = 4
        OnClick = NightModeToolBarBkColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeGamesSelectionBarColorsBox: TPanelEx
      Left = 8
      Top = 8
      Width = 287
      Height = 401
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Selection Bar'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 69
        Width = 58
        Height = 16
        Caption = 'Top Bkgrd'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionFontColor: TShadowLabel
        Left = 4
        Top = 141
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionFrameColor: TShadowLabel
        Left = 4
        Top = 117
        Width = 68
        Height = 16
        Caption = 'Frame Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionMissROMsTopColor: TShadowLabel
        Left = 4
        Top = 187
        Width = 58
        Height = 16
        Caption = 'Top Bkgrd'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionMissROMsFontColor: TShadowLabel
        Left = 4
        Top = 258
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionMissROMsFrameColor: TShadowLabel
        Left = 4
        Top = 234
        Width = 68
        Height = 16
        Caption = 'Frame Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesSelectionMissROMsLabel: TShadowLabel
        Left = 76
        Top = 166
        Width = 181
        Height = 16
        Caption = 'Games With Missing ROMs/CHDs'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionInactiveTopColor: TShadowLabel
        Left = 4
        Top = 304
        Width = 58
        Height = 16
        Caption = 'Top Bkgrd'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionInactiveFontColor: TShadowLabel
        Left = 4
        Top = 376
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionInactiveFrameColor: TShadowLabel
        Left = 4
        Top = 352
        Width = 68
        Height = 16
        Caption = 'Frame Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesSelectionInactiveLabel: TShadowLabel
        Left = 76
        Top = 283
        Width = 81
        Height = 16
        Caption = 'Inactive Colors'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionBottomColor: TShadowLabel
        Left = 4
        Top = 93
        Width = 59
        Height = 16
        Caption = 'Bottom Bk'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionMissROMsBottomColor: TShadowLabel
        Left = 4
        Top = 211
        Width = 59
        Height = 16
        Caption = 'Bottom Bk'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesSelectionInactiveBottomColor: TShadowLabel
        Left = 4
        Top = 328
        Width = 59
        Height = 16
        Caption = 'Bottom Bk'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGameSelectionButtonDefault: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default (blue)'
        TabOrder = 0
        OnClick = NightModeGameSelectionButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 43
        Width = 105
        Height = 18
        Hint = 'Enable alpha blended bar'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = NightModeGameSelectionAlphaBlendClick
        Alignment = taLeftJustify
        Caption = 'Alpha Blending'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGameSelectionGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 68
        Height = 18
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = NightModeGameSelectionGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGameSelectionButtonPreview: TBitBtnEx
        Left = 170
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = NightModeGameSelectionButtonPreviewClick
        UseCustomDraw = True
      end
      object NightModeGamesSelectionBottomColor: TColorBoxEx
        Left = 76
        Top = 90
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 8290
        NoneColorColor = clNone
        Selected = 8290
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionFrameColor: TColorBoxEx
        Left = 76
        Top = 114
        Width = 205
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 5
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionFontColor: TColorBoxEx
        Left = 76
        Top = 138
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = 44287
        NoneColorColor = clNone
        Selected = 44287
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 6
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsTopColor: TColorBoxEx
        Left = 76
        Top = 184
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 5636091
        NoneColorColor = clNone
        Selected = 5636091
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 7
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsBottomColor: TColorBoxEx
        Left = 76
        Top = 208
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 44287
        NoneColorColor = clNone
        Selected = 44287
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 8
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsFrameColor: TColorBoxEx
        Left = 76
        Top = 231
        Width = 205
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 9
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsFontColor: TColorBoxEx
        Left = 76
        Top = 255
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 10
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveTopColor: TColorBoxEx
        Left = 76
        Top = 301
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 9141097
        NoneColorColor = clNone
        Selected = 9141097
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 11
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveBottomColor: TColorBoxEx
        Left = 76
        Top = 325
        Width = 205
        Height = 22
        Hint = 'Bottom Gradient Bar Color'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 12
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveFrameColor: TColorBoxEx
        Left = 76
        Top = 349
        Width = 205
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 13
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveFontColor: TColorBoxEx
        Left = 76
        Top = 373
        Width = 205
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = clSilver
        NoneColorColor = clNone
        Selected = clSilver
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 14
        CustomColorsEnabled = True
      end
      object NightModeGameSelectionRoundCorners: TAdvOfficeCheckBoxEx
        Left = 124
        Top = 43
        Width = 102
        Height = 18
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnClick = NightModeGameSelectionRoundCornersClick
        Alignment = taLeftJustify
        Caption = 'Round Corners'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGamesSelectionTopColor: TColorBoxEx
        Left = 76
        Top = 66
        Width = 205
        Height = 22
        Hint = 'Top Gradient Bar Color / Single Color'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 16
        CustomColorsEnabled = True
      end
      object NightModeGameSelectionButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default (orange)'
        Caption = '2'
        TabOrder = 17
        OnClick = NightModeGameSelectionButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeSearchGamesPanelColorsBox: TPanelEx
      Left = 614
      Top = 8
      Width = 287
      Height = 354
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Search Games Panel Colors'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Top = 47
        Width = 56
        Height = 16
        Caption = 'Filter Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelFieldFontColor: TShadowLabel
        Left = 4
        Top = 95
        Width = 55
        Height = 16
        Caption = 'Field Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelCaptionBarFontColor: TShadowLabel
        Left = 4
        Top = 281
        Width = 53
        Height = 16
        Caption = 'Title Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesFloatingPanel: TShadowLabel
        Left = 96
        Top = 261
        Width = 78
        Height = 16
        Caption = 'Floating Panel'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelEditBoxFontColor: TShadowLabel
        Left = 4
        Top = 143
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelEditBoxBackgroundColor: TShadowLabel
        Left = 4
        Top = 167
        Width = 73
        Height = 16
        Caption = 'Text Bk Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelEditBoxCustomFrameColor: TShadowLabel
        Left = 4
        Top = 212
        Width = 68
        Height = 16
        Caption = 'Frame Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object LabelNightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TShadowLabel
        Left = 4
        Top = 236
        Width = 79
        Height = 16
        Caption = 'Focused Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelEditBoxFrameColor: TShadowLabel
        Left = 96
        Top = 192
        Width = 113
        Height = 16
        Caption = 'Edit Box Frame Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeSearchGamesPanelColorsButtonDefault: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default (blue)'
        TabOrder = 0
        OnClick = NightModeSearchGamesPanelColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeSearchGamesPanelFilterFontColor: TColorBoxEx
        Left = 96
        Top = 44
        Width = 185
        Height = 22
        Hint = 'Font Color For The Filter Text'
        DefaultColorColor = 4734774
        NoneColorColor = clWhite
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = NightModeSearchGamesPanelFilterFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFilterShadowColor: TColorBoxEx
        Left = 96
        Top = 68
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Filter Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeSearchGamesPanelFilterShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFieldFontColor: TColorBoxEx
        Left = 96
        Top = 92
        Width = 185
        Height = 22
        Hint = 'Font Color For The Category Text'
        DefaultColorColor = 9469548
        NoneColorColor = clNone
        Selected = 9469548
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeSearchGamesPanelFieldFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFieldShadowColor: TColorBoxEx
        Left = 96
        Top = 116
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Category Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = NightModeSearchGamesPanelFieldShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelCaptionBarFontColor: TColorBoxEx
        Left = 96
        Top = 278
        Width = 185
        Height = 22
        Hint = 'Font Color For The Caption Bar'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 5
        OnSelect = NightModeSearchGamesPanelCaptionBarFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelCaptionBarShadowColor: TColorBoxEx
        Left = 96
        Top = 302
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Caption Bar'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 6
        OnSelect = NightModeSearchGamesPanelCaptionBarShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxFontColor: TColorBoxEx
        Left = 96
        Top = 140
        Width = 185
        Height = 22
        Hint = 'Font Color For The Edit Box'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 7
        OnSelect = NightModeSearchGamesPanelEditBoxFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBoxEx
        Left = 96
        Top = 164
        Width = 185
        Height = 22
        Hint = 'Background Color For The Edit Box'
        DefaultColorColor = 4734774
        NoneColorColor = clNone
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 8
        OnSelect = NightModeSearchGamesPanelEditBoxBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBoxEx
        Left = 96
        Top = 209
        Width = 185
        Height = 22
        Hint = 'Frame Color For The Edit Box'
        DefaultColorColor = 5131854
        Selected = 5131854
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 9
        OnSelect = NightModeSearchGamesPanelEditBoxCustomFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBoxEx
        Left = 96
        Top = 233
        Width = 185
        Height = 22
        Hint = 'Focused Frame Color For The Edit Box'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 10
        OnSelect = NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFilterShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 69
        Width = 91
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = NightModeSearchGamesPanelFilterShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Filter Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeSearchGamesPanelFieldShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 117
        Width = 91
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = NightModeSearchGamesPanelFieldShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Field Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeSearchGamesPanelCaptionBarShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 303
        Width = 90
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = NightModeSearchGamesPanelCaptionBarShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Title Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeSearchGamesPanelColorsButtonPreview: TBitBtnEx
        Left = 170
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = NightModeSearchGamesPanelColorsButtonPreviewClick
        UseCustomDraw = True
      end
      object NightModeSearchGamesPanelCaptionBarOpaqueBackgroundColor: TColorBoxEx
        Left = 96
        Top = 326
        Width = 185
        Height = 22
        Hint = 'Background color of the title bar'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 15
        OnSelect = NightModeSearchGamesPanelCaptionBarOpaqueBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelCaptionBarOpaqueBackgroundEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 327
        Width = 90
        Height = 20
        Hint = 'Check to set title bar background in opaque mode'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        OnClick = NightModeSearchGamesPanelCaptionBarOpaqueBackgroundEnabledClick
        Alignment = taLeftJustify
        Caption = 'Title Bkgrd'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeSearchGamesPanelColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default'
        Caption = '2'
        TabOrder = 17
        OnClick = NightModeSearchGamesPanelColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeToolBarOverlayIconsFolderGroupBox: TPanelEx
      Left = 311
      Top = 8
      Width = 287
      Height = 50
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Tool Bar Overlay Icons Folder'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 233
        Top = 21
        Width = 49
        Height = 24
        Hint = 'Click here to update the folders list (no restart needed)'
        Caption = 'Update'
        TabOrder = 0
        OnClick = ToolBarOverlayIconsFolderButtonUpdateClick
      end
      object ToolBarOverlayIconsFolder: TComboBox2Ex
        Left = 4
        Top = 22
        Width = 225
        Height = 21
        Style = csOwnerDrawFixed
        Color = clWhite
        ItemHeight = 15
        TabOrder = 1
        OnSelect = ToolBarOverlayIconsFolderSelect
        CustomColorsEnabled = True
      end
    end
    object NightModeGamesListBackgroundBox: TPanelEx
      Left = 8
      Top = 491
      Width = 893
      Height = 67
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
        Width = 891
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Background'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
      object NightModeGamesBackgroundColor: TColorBoxEx
        Left = 4
        Top = 39
        Width = 205
        Height = 22
        Hint = 'Games List Background Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeGamesBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesBackgroundColorButtonDefault: TBitBtnEx
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
        OnClick = NightModeGamesBackgroundColorButtonDefaultClick
      end
      object NightModeGamesBackgroundImage: TEditEx
        Left = 268
        Top = 39
        Width = 518
        Height = 21
        AutoSize = False
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        UseCustomBorder = True
      end
      object NightModeGamesBackgroundImageEnable: TAdvOfficeCheckBoxEx
        Left = 268
        Top = 20
        Width = 192
        Height = 18
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeGamesBackgroundImageEnableClick
        Alignment = taLeftJustify
        Caption = 'Use Image as Background [.png]'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGamesTileBackground: TAdvOfficeCheckBoxEx
        Left = 746
        Top = 20
        Width = 40
        Height = 18
        Hint = 'Tile the background image on the entire games list canvas'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = NightModeGamesTileBackgroundClick
        Alignment = taLeftJustify
        Caption = 'Tile'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGamesBackgroundImageButtonSelect: TBitBtnEx
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
        TabOrder = 5
        OnClick = NightModeGamesBackgroundImageButtonSelectClick
      end
      object NightModeGamesBackgroundImageButtonUpdate: TBitBtnEx
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
        TabOrder = 6
        OnClick = NightModeGamesBackgroundImageButtonUpdateClick
      end
    end
    object NightModeMAMEGameDocsBox: TPanelEx
      Left = 8
      Top = 574
      Width = 287
      Height = 142
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MAME Game Docs'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
      object NightModeLabelGameDocsShowStatusBar: TShadowLabel
        Left = 20
        Top = 119
        Width = 128
        Height = 19
        Caption = 'Disable 7 pixels border'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 6316128
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NightModeGameDocsFont_Setting: TShadowLabel
        Left = 196
        Top = 114
        Width = 85
        Height = 22
        Hint = 'Select font for texts'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Font'
        Color = 2565927
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
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
        OnClick = NightModeGameDocsFont_SettingClick
      end
      object NightModeGameDocumentsBackgroundColor: TColorBoxEx
        Left = 4
        Top = 22
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs Background Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeGameDocumentsBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGameDocumentsButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 24
        Hint = 'Set background color / font default values (game docs)'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeGameDocumentsButtonDefaultClick
      end
      object NightModeGameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 51
        Width = 193
        Height = 17
        Hint = '7 pixels border color'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = NightModeGameDocsShowBorderClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGameDocsBorderColor: TColorBoxEx
        Left = 4
        Top = 73
        Width = 228
        Height = 22
        Hint = 'MAME Game Docs 7 Pixels Border Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeGameDocsBorderColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGameDocsBorderColorButtonDefault: TBitBtnEx
        Left = 235
        Top = 72
        Width = 47
        Height = 24
        Caption = 'Default'
        TabOrder = 4
        OnClick = NightModeGameDocsBorderColorButtonDefaultClick
      end
      object NightModeGameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 102
        Width = 175
        Height = 18
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = NightModeGameDocsShowStatusBarClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs Status Bar'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object NightModeMenuPopupMenuBox: TPanelEx
      Left = 8
      Top = 425
      Width = 287
      Height = 50
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Menus / Popup Menus'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 25
        Width = 36
        Height = 16
        Caption = 'Frame'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeMenuPopupMenuFrameColor: TColorBoxEx
        Left = 44
        Top = 22
        Width = 185
        Height = 22
        Hint = 'Menu Frame Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeMenuPopupMenuFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeMenuPopupMenuFrameColorDefaultColors: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 24
        Hint = 'Set menus colors to default'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeMenuPopupMenuFrameColorDefaultColorsClick
      end
    end
    object NightModeButtonColorsBox: TPanelEx
      Left = 917
      Top = 8
      Width = 287
      Height = 467
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Buttons Colors'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 47
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 78
        Width = 24
        Height = 16
        Caption = 'Top'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 102
        Width = 43
        Height = 16
        Caption = 'Bottom'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 205
        Width = 78
        Height = 16
        Caption = 'Bottom Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 181
        Width = 59
        Height = 16
        Caption = 'Top Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 394
        Width = 72
        Height = 16
        Caption = 'Top Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 418
        Width = 91
        Height = 16
        Caption = 'Bottom Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 126
        Width = 36
        Height = 16
        Caption = 'Frame'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 229
        Width = 71
        Height = 16
        Caption = 'Frame Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 442
        Width = 84
        Height = 16
        Caption = 'Frame Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 150
        Width = 83
        Height = 16
        Caption = 'Frame Focused'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 339
        Width = 73
        Height = 16
        Caption = 'Text Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 284
        Width = 90
        Height = 16
        Caption = 'Bottom Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 260
        Width = 71
        Height = 16
        Caption = 'Top Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 4
        Top = 308
        Width = 83
        Height = 16
        Caption = 'Frame Selected'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
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
        Left = 96
        Top = 44
        Width = 185
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = clCream
        Selected = clCream
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeButtonColorFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientTop: TColorBoxEx
        Left = 96
        Top = 75
        Width = 185
        Height = 22
        Hint = 'Top Gradient Color'
        DefaultColorColor = 5131854
        Selected = 5131854
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = NightModeButtonColorGradientTopSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientBottom: TColorBoxEx
        Left = 96
        Top = 99
        Width = 185
        Height = 22
        Hint = 'Bottom Gradient Color'
        DefaultColorColor = 3289650
        Selected = 3289650
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeButtonColorGradientBottomSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientTopHover: TColorBoxEx
        Left = 96
        Top = 178
        Width = 185
        Height = 22
        Hint = 'Top Gradient Color While Hovering'
        DefaultColorColor = 12153143
        Selected = 12153143
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeButtonColorGradientTopHoverSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientBottomHover: TColorBoxEx
        Left = 96
        Top = 202
        Width = 185
        Height = 22
        Hint = 'Bottom Gradient Color While Hovering'
        DefaultColorColor = 10181674
        Selected = 10181674
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = NightModeButtonColorGradientBottomHoverSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientBottomDisabled: TColorBoxEx
        Left = 96
        Top = 415
        Width = 185
        Height = 22
        Hint = 'Bottom Gradient Color On Disabled'
        DefaultColorColor = 4473924
        Selected = 4473924
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 5
        OnSelect = NightModeButtonColorGradientBottomDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientTopDisabled: TColorBoxEx
        Left = 96
        Top = 391
        Width = 185
        Height = 22
        Hint = 'Top Gradient Color On Disabled'
        DefaultColorColor = 6579300
        Selected = 6579300
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 6
        OnSelect = NightModeButtonColorGradientTopDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFrameColor: TColorBoxEx
        Left = 96
        Top = 123
        Width = 185
        Height = 22
        Hint = 'Frame Color'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 7
        OnSelect = NightModeButtonColorFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFrameColorHover: TColorBoxEx
        Left = 96
        Top = 226
        Width = 185
        Height = 22
        Hint = 'Frame Color While Hovering'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 8
        OnSelect = NightModeButtonColorFrameColorHoverSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFrameColorDisabled: TColorBoxEx
        Left = 96
        Top = 439
        Width = 185
        Height = 22
        Hint = 'Frame Color On Disabled'
        DefaultColorColor = 4473924
        Selected = 4473924
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 9
        OnSelect = NightModeButtonColorFrameColorDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFrameColorFocused: TColorBoxEx
        Left = 96
        Top = 147
        Width = 185
        Height = 22
        Hint = 'Frame Color While Focused'
        DefaultColorColor = 12615756
        Selected = 12615756
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 10
        OnSelect = NightModeButtonColorFrameColorFocusedSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFontColorDisabled: TColorBoxEx
        Left = 96
        Top = 336
        Width = 185
        Height = 22
        Hint = 'Font Color For The Disabled Text'
        DefaultColorColor = clGray
        Selected = clGray
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 11
        OnSelect = NightModeButtonColorFontColorDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFontShadowColorDisabled: TColorBoxEx
        Left = 96
        Top = 360
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Disabled Ttext'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 12
        OnSelect = NightModeButtonColorFontShadowColorDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeColorsBoxButtonDefault: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default (blue selected button)'
        TabOrder = 13
        OnClick = NightModeColorsBoxButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeButtonColorGradientTopSelected: TColorBoxEx
        Left = 96
        Top = 257
        Width = 185
        Height = 22
        Hint = 'Top Gradient Color On Selected'
        DefaultColorColor = 20985
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 14
        OnSelect = NightModeButtonColorGradientTopSelectedSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorGradientBottomSelected: TColorBoxEx
        Left = 96
        Top = 281
        Width = 185
        Height = 22
        Hint = 'Bottom Gradient Color On Selected'
        DefaultColorColor = 8290
        Selected = 8290
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 15
        OnSelect = NightModeButtonColorGradientBottomSelectedSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorFrameColorSelected: TColorBoxEx
        Left = 96
        Top = 305
        Width = 185
        Height = 22
        Hint = 'Frame Color On Selected'
        DefaultColorColor = 2236962
        Selected = 2236962
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 16
        OnSelect = NightModeButtonColorFrameColorSelectedSelect
        CustomColorsEnabled = True
      end
      object NightModeLabelButtonColorFontShadowColorDisabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 361
        Width = 87
        Height = 20
        Hint = 'Text Shadow Disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        OnClick = NightModeLabelButtonColorFontShadowColorDisabledClick
        Alignment = taLeftJustify
        Caption = 'Text Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeColorsBoxButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default (orange selected button)'
        Caption = '2'
        TabOrder = 18
        OnClick = NightModeColorsBoxButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
      object NightModeColorsBoxButtonPreview: TBitBtnEx
        Left = 170
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = NightModeColorsBoxButtonPreviewClick
        UseCustomDraw = True
      end
      object NightModeButtonColorsBoxButtonUpdateScreenButtons: TBitBtnEx
        Left = 96
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Update buttons colors on this screen'
        Caption = 'Apply'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnClick = NightModeButtonColorsBoxButtonUpdateScreenButtonsClick
        UseCustomDraw = True
      end
    end
    object NightModeGamesListSplittersBox: TPanelEx
      Left = 614
      Top = 379
      Width = 287
      Height = 96
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List / Machines List Splitters'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 47
        Width = 32
        Height = 16
        Caption = 'Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesListSplitterSingleColorHot: TShadowLabel
        Left = 4
        Top = 71
        Width = 55
        Height = 16
        Caption = 'Hot Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 0
        OnClick = NightModeGamesListSplitterSingleColorButtonDefaultClick
      end
      object NightModeGamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 103
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = NightModeGamesListSplitterShowGripIconClick
        Alignment = taLeftJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGamesListSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 44
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeGamesListSplitterSingleColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListSplitterSingleColorHot: TColorBoxEx
        Left = 60
        Top = 68
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeGamesListSplitterSingleColorHotSelect
        CustomColorsEnabled = True
      end
    end
    object NightModeImagesHintBox: TPanelEx
      Left = 614
      Top = 574
      Width = 287
      Height = 224
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image Hint Box'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 51
        Width = 66
        Height = 16
        Caption = 'Bkgrd Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelHintBox_Opacity: TShadowLabel
        Left = 4
        Top = 103
        Width = 73
        Height = 16
        Caption = 'Opacity [190]'
        Color = 5263440
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
        Transparent = False
      end
      object NightModeLabelHintBox_TextColor: TShadowLabel
        Left = 4
        Top = 175
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeHintBox_PositionLabel: TShadowLabel
        Left = 82
        Top = 25
        Width = 82
        Height = 16
        Caption = 'Bottom / Right'
        Color = 5263440
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
        Transparent = False
      end
      object NightModeHintBoxtColorsButtonDefault: TBitBtnEx
        Left = 221
        Top = 21
        Width = 24
        Height = 21
        Hint = 'Reset hint box colors and position to default (blue colors)'
        TabOrder = 0
        OnClick = NightModeHintBoxtColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeHintBox_Color: TColorBoxEx
        Left = 76
        Top = 48
        Width = 205
        Height = 22
        Hint = 'Hint Box Background Color'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = NightModeHintBox_ColorSelect
        CustomColorsEnabled = True
      end
      object NightModeHintBox_FrameColor: TColorBoxEx
        Left = 76
        Top = 72
        Width = 205
        Height = 22
        Hint = 'Hint Box Frame Color'
        DefaultColorColor = 4734774
        NoneColorColor = clBtnFace
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeHintBox_FrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeHintBox_FrameEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 73
        Width = 57
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeHintBox_FrameEnabledClick
        Alignment = taLeftJustify
        Caption = 'Frame'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeHintBox_Opacity: TGaugeBar
        Left = 4
        Top = 120
        Width = 225
        Height = 22
        Hint = 'Transparency level of the hint box'
        Color = 3289650
        Backgnd = bgSolid
        BorderStyle = bsNone
        ButtonSize = 17
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
        OnChange = NightModeHintBox_OpacityChange
      end
      object NightModeHintBox_OpacityButtonDefault: TBitBtnEx
        Left = 235
        Top = 120
        Width = 47
        Height = 22
        Hint = 'Set opacity to default level'
        Caption = 'Default'
        TabOrder = 5
        OnClick = NightModeHintBox_OpacityButtonDefaultClick
      end
      object NightModeHintTextDefaultColorsButtonDefault: TBitBtnEx
        Left = 221
        Top = 146
        Width = 24
        Height = 21
        Hint = 'Reset text colors to default'
        TabOrder = 6
        OnClick = NightModeHintTextDefaultColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeHintBox_FontItalicStyle: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 149
        Width = 49
        Height = 20
        Hint = 'Show font with italic style'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = NightModeHintBox_FontItalicStyleClick
        Alignment = taLeftJustify
        Caption = 'Italic'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeHintBox_TextColor: TColorBoxEx
        Left = 76
        Top = 172
        Width = 205
        Height = 22
        Hint = 'Font Color For The Text'
        DefaultColorColor = 20985
        NoneColorColor = clBtnFace
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 8
        OnSelect = NightModeHintBox_TextColorSelect
        CustomColorsEnabled = True
      end
      object NightModeHintBox_TextShadowColor: TColorBoxEx
        Left = 76
        Top = 196
        Width = 205
        Height = 22
        Hint = 'Shadow Font Color For The Text'
        DefaultColorColor = 1578258
        NoneColorColor = clBtnFace
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 9
        OnSelect = NightModeHintBox_TextShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeHintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 198
        Width = 65
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NightModeHintBox_TextShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeImagesHintBoxButtonPreview: TBitBtnEx
        Left = 170
        Top = 21
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = NightModeImagesHintBoxButtonPreviewClick
      end
      object NightModeHintBox_LargerFontSize: TAdvOfficeCheckBoxEx
        Left = 76
        Top = 149
        Width = 107
        Height = 20
        Hint = 'Change font size to 14 pixels'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = NightModeHintBox_LargerFontSizeClick
        Alignment = taLeftJustify
        Caption = 'Larger Font Size'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeHintBox_Position: TGaugeBar
        Left = 4
        Top = 22
        Width = 75
        Height = 22
        Hint = 'Hint box position'
        Color = 3289650
        Backgnd = bgSolid
        BorderStyle = bsNone
        ButtonSize = 17
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
        OnChange = NightModeHintBox_PositionChange
      end
      object NightModeHintBoxtColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 21
        Width = 36
        Height = 21
        Hint = 'Reset hint box colors and position to default (darker colors)'
        Caption = '2'
        TabOrder = 14
        OnClick = NightModeHintBoxtColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeHintTextDefaultColorsButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 146
        Width = 36
        Height = 21
        Hint = 'Reset text colors to default (orange color)'
        Caption = '2'
        TabOrder = 15
        OnClick = NightModeHintTextDefaultColorsButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeImageSplittersBox: TPanelEx
      Left = 917
      Top = 636
      Width = 287
      Height = 96
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image Splitters'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 47
        Width = 32
        Height = 16
        Caption = 'Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelImageSplitterSingleColorHot: TShadowLabel
        Left = 4
        Top = 71
        Width = 55
        Height = 16
        Caption = 'Hot Color'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeImageSplitterSingleColorButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 0
        OnClick = NightModeImageSplitterSingleColorButtonDefaultClick
      end
      object NightModeImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 103
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the image splitters'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = NightModeImageSplitterShowGripIconClick
        Alignment = taLeftJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeImageSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 44
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter'
        DefaultColorColor = 1578258
        NoneColorColor = clBtnFace
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeImageSplitterSingleColorSelect
        CustomColorsEnabled = True
      end
      object NightModeImageSplitterSingleColorHot: TColorBoxEx
        Left = 60
        Top = 68
        Width = 221
        Height = 22
        Hint = 'Color Of The Splitter While Hovering Mouse'
        DefaultColorColor = 20985
        NoneColorColor = clGray
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeImageSplitterSingleColorHotSelect
        CustomColorsEnabled = True
      end
    end
    object NightModeImageBorderColorBox: TPanelEx
      Left = 917
      Top = 748
      Width = 287
      Height = 50
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Image 7 Pixels Border Color'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
      object NightModeImageBorderColor: TColorBoxEx
        Left = 4
        Top = 22
        Width = 225
        Height = 22
        Hint = 'Image 7 Pixels Border Color'
        DefaultColorColor = 1578258
        NoneColorColor = clWhite
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeImageBorderColorSelect
        CustomColorsEnabled = True
      end
      object NightModeImageBorderColorButtonDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 24
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeImageBorderColorButtonDefaultClick
      end
    end
    object NightModeProfilesGroupBox: TPanelEx
      Left = 8
      Top = 732
      Width = 590
      Height = 66
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
      object NightModeProfilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 588
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Night Mode Profiles'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
    end
    object NightModePanelColorsBox: TPanelEx
      Left = 311
      Top = 187
      Width = 287
      Height = 288
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Panels Colors (Mostly Frames and Message Boxes)'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 191
        Width = 53
        Height = 16
        Caption = 'Title Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModePanelColorsImageCategoryTextFontColorLabel: TShadowLabel
        Left = 4
        Top = 143
        Width = 88
        Height = 16
        Caption = 'Image Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelTopColor: TShadowLabel
        Left = 4
        Top = 47
        Width = 24
        Height = 16
        Caption = 'Top'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelPanelColorsTitle2FontColor: TShadowLabel
        Left = 4
        Top = 239
        Width = 62
        Height = 16
        Caption = 'Title 2 Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelOuterFrameColor: TShadowLabel
        Left = 4
        Top = 119
        Width = 69
        Height = 16
        Caption = 'Outer Frame'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelInnerFrameColor: TShadowLabel
        Left = 4
        Top = 95
        Width = 66
        Height = 16
        Caption = 'Inner Frame'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelSearchGamesPanelBottomColor: TShadowLabel
        Left = 4
        Top = 71
        Width = 43
        Height = 16
        Caption = 'Bottom'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModePanelColorsImageZipTextFontColorLabel: TShadowLabel
        Left = 4
        Top = 167
        Width = 83
        Height = 16
        Caption = 'Image Zip Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeSearchGamesPanelGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 68
        Height = 20
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NightModeSearchGamesPanelGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModePanelsBackgroundColorsDefaultButton: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default (blue)'
        TabOrder = 1
        OnClick = NightModePanelsBackgroundColorsDefaultButtonClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModePanelColorsImageCategoryTextFontColor: TColorBoxEx
        Left = 96
        Top = 140
        Width = 185
        Height = 22
        Hint = 'Font Color For The Image Category Text'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModePanelColorsImageCategoryTextFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsImageZipTextFontColor: TColorBoxEx
        Left = 96
        Top = 164
        Width = 185
        Height = 22
        Hint = 'Font Color For The Image Zip File Text'
        DefaultColorColor = 20985
        NoneColorColor = clNone
        Selected = 20985
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModePanelColorsImageZipTextFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsTitleFontColor: TColorBoxEx
        Left = 96
        Top = 188
        Width = 185
        Height = 22
        Hint = 'Font Color For The Title Text'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = NightModePanelColorsTitleFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsTitleShadowFontColor: TColorBoxEx
        Left = 96
        Top = 212
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Title Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 5
        OnSelect = NightModePanelColorsTitleShadowFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsTitle2ShadowFontColor: TColorBoxEx
        Left = 96
        Top = 260
        Width = 185
        Height = 22
        Hint = 'Shadow Font Color For The Second Title Text'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 6
        OnSelect = NightModePanelColorsTitle2ShadowFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelTopColor: TColorBoxEx
        Left = 96
        Top = 44
        Width = 185
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 4734774
        Selected = 4734774
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 7
        OnSelect = NightModeSearchGamesPanelTopColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelBottomColor: TColorBoxEx
        Left = 96
        Top = 68
        Width = 185
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 8
        OnSelect = NightModeSearchGamesPanelBottomColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelInnerFrameColor: TColorBoxEx
        Left = 96
        Top = 92
        Width = 185
        Height = 22
        Hint = 'Inner Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 9
        OnSelect = NightModeSearchGamesPanelInnerFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelOuterFrameColor: TColorBoxEx
        Left = 96
        Top = 116
        Width = 185
        Height = 22
        Hint = 'Outer Frame Color'
        DefaultColorColor = 1578258
        NoneColorColor = clNone
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 10
        OnSelect = NightModeSearchGamesPanelOuterFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsTitle2FontColor: TColorBoxEx
        Left = 96
        Top = 236
        Width = 185
        Height = 22
        Hint = 'Font Color For The Second Title Text'
        DefaultColorColor = 11836807
        NoneColorColor = clNone
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 11
        OnSelect = NightModePanelColorsTitle2FontColorSelect
        CustomColorsEnabled = True
      end
      object NightModePanelColorsBoxButtonPreview: TBitBtnEx
        Left = 170
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        TabOrder = 12
        OnClick = NightModePanelColorsBoxButtonPreviewClick
      end
      object NightModePanelColorsTitleShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 213
        Width = 90
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = NightModePanelColorsTitleShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Title Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModePanelColorsTitle2ShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 261
        Width = 91
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnClick = NightModePanelColorsTitle2ShadowEnabledClick
        Alignment = taLeftJustify
        Caption = 'Title2 Shadow'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModePanelsBackgroundColorsDefaultButton2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default'
        Caption = '2'
        TabOrder = 15
        OnClick = NightModePanelsBackgroundColorsDefaultButtonClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeGamesListStatusBarColorsBox: TPanelEx
      Left = 311
      Top = 574
      Width = 287
      Height = 120
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Status Bar Colors'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 95
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesListStatusBarBottomColor: TShadowLabel
        Left = 4
        Top = 71
        Width = 43
        Height = 16
        Caption = 'Bottom'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeLabelGamesListStatusBarTopColor: TShadowLabel
        Left = 4
        Top = 47
        Width = 24
        Height = 16
        Caption = 'Top'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListStatusBarGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 87
        Height = 20
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NightModeGamesListStatusBarGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeGamesListStatusBarButtonDefault: TBitBtnEx
        Left = 221
        Top = 19
        Width = 24
        Height = 21
        Hint = 'Reset colors to default'
        TabOrder = 1
        OnClick = NightModeGamesListStatusBarButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeGamesListStatusBarTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        Hint = 'Top Gradient Background Color / Single Color'
        DefaultColorColor = 1578258
        Selected = 1578258
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeGamesListStatusBarTopColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListStatusBarBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        Hint = 'Bottom Gradient Background Color'
        DefaultColorColor = 1052429
        Selected = 1052429
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeGamesListStatusBarBottomColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListStatusBarFontColor: TColorBoxEx
        Left = 91
        Top = 92
        Width = 190
        Height = 22
        Hint = 'Text Font Color'
        DefaultColorColor = 11836807
        Selected = 11836807
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = NightModeGamesListStatusBarFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListStatusBarButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default'
        Caption = '2'
        TabOrder = 5
        OnClick = NightModeGamesListStatusBarButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
    end
    object NightModeGamesListHeaderGroupBox: TPanelEx
      Left = 917
      Top = 491
      Width = 287
      Height = 120
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Games List Column Header'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 4
        Top = 71
        Width = 35
        Height = 16
        Caption = 'Hover'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListHeaderBackgroundColorLabel: TShadowLabel
        Left = 4
        Top = 47
        Width = 34
        Height = 16
        Caption = 'Bkgrd'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListHeaderBackgroundColorDownLabel: TShadowLabel
        Left = 4
        Top = 95
        Width = 34
        Height = 16
        Caption = 'Down'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListHeaderFont: TShadowLabel
        Left = 60
        Top = 20
        Width = 85
        Height = 22
        Hint = 'Customize Header Font'
        AutoSize = False
        Caption = ' Click Me'
        Color = 2367253
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -12
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
        OnClick = NightModeGamesListHeaderFontClick
      end
      object NightModeGamesListHeaderFontColorLabel: TShadowLabel
        Left = 4
        Top = 23
        Width = 52
        Height = 16
        Caption = 'Text Font'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      object NightModeGamesListHeaderButtonDefault: TBitBtnEx
        Left = 224
        Top = 19
        Width = 21
        Height = 21
        Hint = 'Reset colors to default'
        TabOrder = 0
        OnClick = NightModeGamesListHeaderButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
      end
      object NightModeGamesListHeaderBackgroundColor: TColorBoxEx
        Left = 60
        Top = 44
        Width = 221
        Height = 22
        Hint = 'Background Color'
        DefaultColorColor = 2367253
        NoneColorColor = clBtnFace
        Selected = 2367253
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
        OnSelect = NightModeGamesListHeaderBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListHeaderBackgroundColorHover: TColorBoxEx
        Left = 60
        Top = 68
        Width = 221
        Height = 22
        Hint = 'Background Color White Hovering'
        DefaultColorColor = 5263440
        NoneColorColor = clGray
        Selected = 5263440
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
        OnSelect = NightModeGamesListHeaderBackgroundColorHoverSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListHeaderBackgroundColorDown: TColorBoxEx
        Left = 60
        Top = 92
        Width = 221
        Height = 22
        Hint = 'Background Color While Pressed'
        DefaultColorColor = 2565927
        NoneColorColor = clNone
        Selected = 2565927
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 3
        OnSelect = NightModeGamesListHeaderBackgroundColorDownSelect
        CustomColorsEnabled = True
      end
      object NightModeGamesListHeaderButtonDefault2: TBitBtnEx
        Tag = 1
        Left = 246
        Top = 19
        Width = 36
        Height = 21
        Hint = 'Reset colors to default (darker)'
        Caption = '2'
        TabOrder = 4
        OnClick = NightModeGamesListHeaderButtonDefaultClick
        ImageIndex = 15
        Images = FormMain.IL_MenuPopup
        UseCustomDraw = True
      end
    end
    object NightModeCheckBoxRadioButtonBox: TPanelEx
      Left = 614
      Top = 444
      Width = 287
      Height = 68
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
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Check Box / Radio Button'
        CaptionIndent = 3
        Color = 5787720
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
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
        Left = 208
        Top = 4
        Width = 46
        Height = 16
        Caption = 'FullPath'
        Color = 2629656
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -12
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
        Left = 4
        Top = 22
        Width = 225
        Height = 21
        Style = csOwnerDrawFixed
        Color = clWhite
        ItemHeight = 15
        TabOrder = 0
      end
      object NightModeCheckBoxRadioButton_Radio1: TAdvOfficeRadioButtonEx
        Left = 4
        Top = 44
        Width = 62
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        Caption = 'Radio 1'
        Checked = True
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeCheckBoxRadioButton_Radio2: TAdvOfficeRadioButtonEx
        Left = 76
        Top = 44
        Width = 62
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Radio 2'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NightModeCheckBoxRadioButton_Check1: TAdvOfficeCheckBoxEx
        Left = 152
        Top = 44
        Width = 73
        Height = 20
        AllowGrayed = True
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'CheckBox'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object BitBtnEx1: TBitBtnEx
        Left = 233
        Top = 21
        Width = 49
        Height = 24
        Hint = 'Click here to update the folders list (no restart needed)'
        Caption = 'Update'
        TabOrder = 4
        OnClick = ToolBarOverlayIconsFolderButtonUpdateClick
      end
    end
  end
  object PanelPage2: TPanelEx
    Left = 1152
    Top = 816
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
  object PanelBottom: TPanelEx
    Left = 0
    Top = 818
    Width = 910
    Height = 33
    Color1 = 2565927
    Color2 = 3289650
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSimple
    object ButtonPage1: TSpeedButtonEx
      Tag = 1
      Left = 704
      Top = 4
      Width = 100
      Height = 26
      Caption = 'PAGE 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonPage1Click
      UseCustomDraw = True
    end
    object ButtonPage2: TSpeedButtonEx
      Tag = 2
      Left = 804
      Top = 4
      Width = 100
      Height = 26
      Caption = 'PAGE 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonPage2Click
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonNew: TBitBtnEx
      Left = 424
      Top = 4
      Width = 49
      Height = 24
      Hint = 'Create a new profile'
      Caption = 'New'
      TabOrder = 0
      OnClick = NightModeProfiles_ButtonNewClick
      UseCustomDraw = True
    end
    object NightModeProfiles: TComboBox2Ex
      Left = 32
      Top = 5
      Width = 277
      Height = 21
      Hint = 'Night mode profiles'
      Style = csOwnerDrawFixed
      Color = clWhite
      ItemHeight = 15
      TabOrder = 1
      OnSelect = NightModeProfilesSelect
      CustomColorsEnabled = True
    end
    object NightModeProfiles_ButtonSave: TBitBtnEx
      Left = 474
      Top = 4
      Width = 49
      Height = 24
      Hint = 'Save current profile to .ini file'
      Caption = 'Save'
      TabOrder = 2
      OnClick = NightModeProfiles_ButtonSaveClick
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonDelete: TBitBtnEx
      Left = 524
      Top = 4
      Width = 49
      Height = 24
      Hint = 'Delete current profile'
      Caption = 'Delete'
      TabOrder = 3
      OnClick = NightModeProfiles_ButtonDeleteClick
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonUpdate: TBitBtnEx
      Left = 7
      Top = 4
      Width = 23
      Height = 24
      Hint = 'Click here to update the profiles list (no restart needed)'
      TabOrder = 4
      OnClick = NightModeProfiles_ButtonUpdateClick
      ImageIndex = 15
      Images = FormMain.IL_MenuPopup
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonReload: TBitBtnEx
      Left = 311
      Top = 4
      Width = 47
      Height = 24
      Hint = 'Reload current profile settings from .ini file'
      Caption = 'Reload'
      TabOrder = 5
      OnClick = NightModeProfiles_ButtonReloadClick
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonDefault: TBitBtnEx
      Left = 359
      Top = 4
      Width = 64
      Height = 24
      Hint = 'Click here to set all controls to frontend default values'
      Caption = 'Default All'
      TabOrder = 6
      OnClick = NightModeProfiles_ButtonDefaultClick
      UseCustomDraw = True
    end
  end
  object NightModePanelColorsBoxPreview: TPanelEx
    Left = 8
    Top = 863
    Width = 402
    Height = 140
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
      Left = 46
      Top = 8
      Width = 121
      Height = 16
      Caption = 'Preview: Panels Colors'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModePanelColorsBoxPreviewButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object PanelInitZipFile: TPanelEx
      Left = 12
      Top = 28
      Width = 374
      Height = 96
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
        Left = 60
        Top = 8
        Width = 305
        Height = 17
        Caption = 'Initializing Zipped Images Contents Array'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
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
        Top = 72
        Width = 354
        Height = 19
        Hint = '" list in RAM for fast access.'
        AutoSize = False
        Caption = 'Parsing "artpreview.zip" list in RAM for fast access.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -12
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
        Left = 60
        Top = 32
        Width = 305
        Height = 19
        AutoSize = False
        Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -13
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
        Left = 60
        Top = 56
        Width = 305
        Height = 19
        AutoSize = False
        Caption = 'Game Snapshot'
        Font.Charset = ANSI_CHARSET
        Font.Color = 20985
        Font.Height = -12
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
        Width = 48
        Height = 48
        Transparent = True
      end
    end
  end
  object NightModeImagesHintBoxPreview: TPanelEx
    Left = 1224
    Top = 588
    Width = 287
    Height = 281
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
      Left = 46
      Top = 8
      Width = 131
      Height = 16
      Caption = 'Preview: Image Hint Box'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModeImagesHintBoxPreviewButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object ImageHintPanel_Image: TImage32
      Left = 12
      Top = 28
      Width = 258
      Height = 205
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = 2565927
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smNormal
      TabOrder = 0
      object ImageHintPanel: TPanelEx
        Tag = -1
        Left = 67
        Top = 137
        Width = 171
        Height = 48
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
          Left = 28
          Top = 5
          Width = 94
          Height = 19
          Caption = 'Game Snapshot'
          Font.Charset = ANSI_CHARSET
          Font.Color = 20985
          Font.Height = -13
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
          Left = 8
          Top = 8
          Width = 16
          Height = 16
          Transparent = True
        end
        object ImageHintDetailsText: TShadowLabel
          Left = 30
          Top = 25
          Width = 92
          Height = 19
          Caption = '0000x0000 (PNG)'
          Font.Charset = ANSI_CHARSET
          Font.Color = 20985
          Font.Height = -12
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
      Top = 243
      Width = 89
      Height = 23
      Caption = 'View Snap 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NightModeImageHintPanel_ImageView1Click
    end
    object NightModeImageHintPanel_ImageView2: TBitBtnEx
      Tag = 1
      Left = 182
      Top = 243
      Width = 89
      Height = 23
      Caption = 'View Snap 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = NightModeImageHintPanel_ImageView1Click
    end
  end
  object NightModeGamesSelectionBarPreview: TPanelEx
    Left = 1224
    Top = 385
    Width = 291
    Height = 185
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
      Left = 46
      Top = 8
      Width = 178
      Height = 16
      Caption = 'Preview: Games List Selection Bar'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModeGamesSelectionBarPreviewButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object NightModePanelGamesList: TPanelEx
      Left = 12
      Top = 28
      Width = 263
      Height = 141
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object NightModeGamesListView: TEasyListview
        Left = 0
        Top = 0
        Width = 263
        Height = 141
        Align = alClient
        CellSizes.SmallIcon.Height = 20
        CellSizes.Tile.Width = 260
        CellSizes.Report.Height = 28
        Color = clBlack
        DisabledBlendAlpha = 0
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clWhite
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
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
          64FFFECE00060000008008010000000F00000041007600610069006C00610062
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
          0006000000800800010100010000000000000103010000FFFFFF1F0001000000
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
        OnItemPaintText = NightModeGamesListViewItemPaintText
        OnItemSelectionChanged = NightModeGamesListViewItemSelectionChanged
      end
    end
  end
  object NightModeSearchGamesPanelColorsBoxPreview: TPanelEx
    Left = 424
    Top = 863
    Width = 402
    Height = 130
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
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModeSearchGamesPanelColorsBoxPreviewButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object NightModeSearchGamesPanelColorsBoxPreviewLabel: TShadowLabel
      Left = 46
      Top = 8
      Width = 193
      Height = 16
      Caption = 'Preview: Search Games Panel Colors'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
      Top = 28
      Width = 374
      Height = 86
      Color1 = 4734774
      Color2 = 1578258
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 1578258
      ColorInnerFrame = 1578258
      EnableCustomBorder = ecbDouble
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object NightModePanelSearchGamesCaptionBar: TShadowLabel
        Left = 1
        Top = 1
        Width = 368
        Height = 25
        AutoSize = False
        Caption = '   Search Games Filter'
        Color = 11836807
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 1578258
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        Layout = tlCenter
      end
      object NightModeButtonFilterTitleClose: TShadowLabel
        Left = 326
        Top = 3
        Width = 41
        Height = 21
        Hint = 'Close'
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = 89
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clBlack
        ShadowEnabled = True
        EllipsType = etNone
        ColorFrame = 23170
        ColorInnerFrame = clBlack
        EnableInnerFrame = True
        Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
        Transparent = False
        Layout = tlCenter
        OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
        OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
      end
      object NightModeLabelSearchGamesFilter: TShadowLabel
        Left = 8
        Top = 32
        Width = 49
        Height = 14
        Caption = 'Filter by'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4734774
        Font.Height = -11
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
        Left = 60
        Top = 32
        Width = 27
        Height = 14
        Caption = 'Title'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9469548
        Font.Height = -11
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
      object NightModeFilterGameTitle: TEditEx
        Left = 8
        Top = 48
        Width = 199
        Height = 24
        AutoSize = False
        BevelOuter = bvNone
        Color = 4734774
        Constraints.MaxHeight = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = 11836807
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Game Title Is My Name'
        ColorFrame = 9141097
        ColorFrameFocused = clWhite
        UseCustomBorder = True
      end
      object NightModeToolBarFilterTitle: TToolBar
        Left = 209
        Top = 45
        Width = 160
        Height = 30
        Align = alNone
        ButtonHeight = 30
        ButtonWidth = 31
        Color = 15856113
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        Images = FormMain.IL_MiscToolBarPopup
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Transparent = False
        Wrapable = False
        OnCustomDraw = NightModeToolBarFilterTitleCustomDraw
        object NightModeButtonFilterTitleApply: TToolButton
          Left = 0
          Top = 0
          Hint = 'Click here to apply filter'
          AutoSize = True
          Caption = 'Apply'
          ImageIndex = 9
        end
        object NightModeButtonFilterControls: TToolButton
          Left = 31
          Top = 0
          Hint = 
            'Click here to select a controls filter (will be applied immediat' +
            'ely)'
          AutoSize = True
          Caption = 'Controls'
          ImageIndex = 12
        end
        object NightModeButtonFilterTitleReset: TToolButton
          Left = 62
          Top = 0
          Hint = 'Click here to reset filters to default (games tool bar buttons)'
          AutoSize = True
          Caption = 'Reset'
          ImageIndex = 3
        end
        object NightModeButtonFilterTitleSettings: TToolButton
          Left = 93
          Top = 0
          Hint = 'Click here to change filter settings'
          AutoSize = True
          Caption = 'Settings'
          ImageIndex = 10
        end
        object NightModeButtonFilterTitlePanelMode: TToolButton
          Left = 124
          Top = 0
          Hint = 'Click here to attach the panel to filters tool bar'
          AutoSize = True
          Caption = 'Panel Position'
          ImageIndex = 11
        end
      end
    end
  end
  object NightModeButtonColorsBoxPreview: TPanelEx
    Left = 840
    Top = 863
    Width = 302
    Height = 81
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
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModeButtonColorsBoxPreviewButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object NightModeButtonColorsBoxPreviewLabel: TShadowLabel
      Left = 46
      Top = 8
      Width = 134
      Height = 16
      Caption = '  Preview: Buttons Colors'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
      Top = 28
      Width = 278
      Height = 37
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
        Left = 210
        Top = 6
        Width = 62
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Selected'
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton1: TBitBtnEx
        Tag = 1
        Left = 6
        Top = 6
        Width = 65
        Height = 25
        Caption = 'Click me!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = NightModeButtonColorsSampleButton1Click
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton2: TBitBtnEx
        Left = 75
        Top = 6
        Width = 65
        Height = 25
        Caption = 'Button 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UseCustomDraw = True
      end
      object NightModeButtonColorsSampleButton3: TBitBtnEx
        Left = 144
        Top = 6
        Width = 62
        Height = 25
        Caption = 'Disabled'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clCream
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UseCustomDraw = True
      end
    end
  end
  object NightModeNewProfileBox: TPanelEx
    Left = 1224
    Top = 8
    Width = 400
    Height = 341
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
      Left = 46
      Top = 8
      Width = 112
      Height = 16
      Caption = 'Create A New Profile'
      Color = 5787720
      Font.Charset = ANSI_CHARSET
      Font.Color = clCream
      Font.Height = -12
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
    object NightModeNewProfileBoxButtonClose: TShadowLabel
      Left = 12
      Top = 8
      Width = 28
      Height = 16
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
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
      OnClick = NightModeNewProfileBoxButtonCloseClick
      OnMouseEnter = NightModeGamesSelectionBarPreviewButtonCloseMouseEnter
      OnMouseLeave = NightModeGamesSelectionBarPreviewButtonCloseMouseLeave
    end
    object NightModeNewProfileProfileNameLabel: TShadowLabel
      Left = 16
      Top = 176
      Width = 72
      Height = 16
      Caption = 'Profile Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
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
    object NightModeNewProfileProfileNameTipLabel: TShadowLabel
      Left = 109
      Top = 199
      Width = 257
      Height = 16
      Caption = 'You may select a profile above to copy its colors'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
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
    object NightModeNewProfileCreateWithDefaultColorsLabel: TShadowLabel
      Left = 32
      Top = 247
      Width = 155
      Height = 16
      Caption = 'Ignore profile selected above'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
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
    object NightModeNewProfileBoxButtonConfirm: TBitBtnEx
      Left = 104
      Top = 299
      Width = 89
      Height = 25
      Caption = 'Confirm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = NightModeNewProfileBoxButtonConfirmClick
    end
    object NightModeNewProfileBoxButtonAbort: TBitBtnEx
      Tag = 1
      Left = 203
      Top = 299
      Width = 89
      Height = 25
      Caption = 'Abort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NightModeNewProfileBoxButtonCloseClick
    end
    object NightModeNewProfileProfilesListPanel: TPanelEx
      Left = 12
      Top = 28
      Width = 368
      Height = 141
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 5787720
      ColorInnerFrame = 3485739
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object NightModeNewProfileProfilesList: TEasyListview
        Left = 0
        Top = 0
        Width = 366
        Height = 139
        Align = alClient
        CellSizes.SmallIcon.Height = 20
        CellSizes.Tile.Width = 260
        CellSizes.Report.Height = 22
        Color = 2565927
        DisabledBlendAlpha = 0
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clWhite
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        GroupFont.Charset = ANSI_CHARSET
        GroupFont.Color = clBlack
        GroupFont.Height = -12
        GroupFont.Name = 'Segoe UI'
        GroupFont.Style = []
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          000600000080080001010001000000000000016A010000FFFFFF1F0001000000
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
        OnItemPaintText = NightModeNewProfileProfilesListItemPaintText
        OnItemSelectionChanged = NightModeNewProfileProfilesListItemSelectionChanged
      end
    end
    object NightModeNewProfileProfileName: TEditEx
      Left = 90
      Top = 173
      Width = 289
      Height = 21
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      UseCustomBorder = True
    end
    object NightModeNewProfileUseColorsActiveProfile: TAdvOfficeCheckBoxEx
      Left = 16
      Top = 229
      Width = 235
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = NightModeNewProfileUseColorsActiveProfileClick
      Alignment = taLeftJustify
      Caption = 'Always Use Colors of The Active Profile'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
  end
end
