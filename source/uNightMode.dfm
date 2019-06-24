object FormNightMode: TFormNightMode
  Left = 637
  Top = 426
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Night Mode'
  ClientHeight = 999
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
    Height = 943
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
      Height = 144
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
      object NightModeToolBarBackgroundColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Tool Bar Background Colors'
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
      object LabelNightModeToolBarBkBottomColor: TShadowLabel
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
      object LabelNightModeToolBarBkTopColor: TShadowLabel
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
        Width = 87
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = NightModeToolBarGradientBarClick
        Alignment = taLeftJustify
        Caption = 'Gradient Bar'
        ReturnIsTab = False
        Themed = True
      end
      object NightModeToolBarBkColorsDefaultButton: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeToolBarBkColorsDefaultButtonClick
      end
      object NightModeToolBarBkTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        DefaultColorColor = 5832704
        NoneColorColor = clNone
        Selected = 5832704
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = NightModeToolBarBkTopColorSelect
      end
      object NightModeToolBarBkBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        DefaultColorColor = 1
        NoneColorColor = clNone
        Selected = 1
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = NightModeToolBarBkBottomColorSelect
      end
      object NightModeToolBarInnerFrameColor: TColorBoxEx
        Left = 91
        Top = 92
        Width = 190
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clNone
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeToolBarInnerFrameColorSelect
      end
      object NightModeToolBarOuterFrameColor: TColorBoxEx
        Left = 91
        Top = 116
        Width = 190
        Height = 22
        DefaultColorColor = 16750899
        NoneColorColor = clNone
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = NightModeToolBarOuterFrameColorSelect
      end
      object NightModeToolBarShowOuterFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 117
        Width = 85
        Height = 20
        Hint = 'Check to show a single border'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = NightModeToolBarShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Outer Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeToolBarShowInnerFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 93
        Width = 82
        Height = 20
        Hint = 'Check to show a double border (outer frame must be enabled)'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = NightModeToolBarShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Inner Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
    end
    object NightModeGamesListStatusBarColorsBox: TPanelEx
      Left = 311
      Top = 234
      Width = 287
      Height = 192
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
        Caption = ' Games List Status Bar Colors'
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
      object LabelNightModeGamesListStatusBarFontColor: TShadowLabel
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
      object LabelNightModeGamesListStatusBarBottomColor: TShadowLabel
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
      object LabelNightModeGamesListStatusBarTopColor: TShadowLabel
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
        Caption = 'Gradient Bar'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGamesListStatusBarCopyButton: TBitBtnEx
        Left = 196
        Top = 19
        Width = 38
        Height = 21
        Hint = 'Copy colors from light mode'
        Caption = 'Copy'
        TabOrder = 1
        OnClick = NightModeGamesListStatusBarCopyButtonClick
      end
      object NightModeGamesListStatusBarButtonDefault: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 2
        OnClick = NightModeGamesListStatusBarButtonDefaultClick
      end
      object NightModeGamesListStatusBarTopColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        DefaultColorColor = 5832704
        NoneColorColor = clNone
        Selected = 5832704
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = NightModeGamesListStatusBarTopColorSelect
      end
      object NightModeGamesListStatusBarBottomColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        DefaultColorColor = 1
        NoneColorColor = clNone
        Selected = 1
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeGamesListStatusBarBottomColorSelect
      end
      object NightModeGamesListStatusBarInnerFrameColor: TColorBoxEx
        Left = 91
        Top = 92
        Width = 190
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clNone
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = NightModeGamesListStatusBarInnerFrameColorSelect
      end
      object NightModeGamesListStatusBarOuterFrameColor: TColorBoxEx
        Left = 91
        Top = 116
        Width = 190
        Height = 22
        DefaultColorColor = 16750899
        NoneColorColor = clNone
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 6
        OnSelect = NightModeGamesListStatusBarOuterFrameColorSelect
      end
      object NightModeGamesListStatusBarFontColor: TColorBoxEx
        Left = 91
        Top = 140
        Width = 190
        Height = 22
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 7
        OnSelect = NightModeGamesListStatusBarFontColorSelect
      end
      object NightModeGamesListStatusBarShadowFontColor: TColorBoxEx
        Left = 91
        Top = 164
        Width = 190
        Height = 22
        DefaultColorColor = clNavy
        NoneColorColor = clNone
        Selected = clNavy
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 8
        OnSelect = NightModeGamesListStatusBarShadowFontColorSelect
      end
      object NightModeGamesListStatusBarShadowFontEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 165
        Width = 87
        Height = 20
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        TabStop = True
        OnClick = NightModeGamesListStatusBarShadowFontEnabledClick
        Alignment = taLeftJustify
        Caption = 'Text Shadow'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGamesListStatusBarShowOuterFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 117
        Width = 85
        Height = 20
        Hint = 'Check to show a single border'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NightModeGamesListStatusBarShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Outer Frame'
        ReturnIsTab = False
        Themed = True
      end
      object NightModeGamesListStatusBarShowInnerFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 93
        Width = 82
        Height = 20
        Hint = 'Check to show a double border (outer frame must be enabled)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = NightModeGamesListStatusBarShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Inner Frame'
        ReturnIsTab = False
        Themed = True
      end
    end
    object NightModeGamesListFrameColorsBox: TPanelEx
      Left = 8
      Top = 403
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
      object NightModeGamesListFrameColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Games List Frame Colors'
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
      object NightModeGamesListUseWindowsThemedBorder: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 179
        Height = 20
        Hint = 
          'Check this option to paint a Windows themed border'#13#10'(single bord' +
          'er, custom colors will not be applied)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = NightModeGamesListUseWindowsThemedBorderClick
        Alignment = taLeftJustify
        Caption = 'Use Windows Themed Border'
        ReturnIsTab = False
        Themed = True
      end
      object NightModeGamesListFrameColorsDefaultButton: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeGamesListFrameColorsDefaultButtonClick
      end
      object NightModeGamesListShowInnerFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 45
        Width = 82
        Height = 20
        Hint = 'Check to show a double border (outer frame must be enabled)'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = NightModeGamesListShowInnerFrameClick
        Alignment = taLeftJustify
        Caption = 'Inner Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGamesListShowOuterFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 69
        Width = 85
        Height = 20
        Hint = 'Check to show a single border'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeGamesListShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Outer Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGamesListOuterFrameColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        DefaultColorColor = 16750899
        NoneColorColor = clNone
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeGamesListOuterFrameColorSelect
      end
      object NightModeGamesListInnerFrameColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clNone
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = NightModeGamesListInnerFrameColorSelect
      end
    end
    object NightModeImagesPanelFrameColorsBox: TPanelEx
      Left = 8
      Top = 515
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
      object NightModeImagesPanelFrameColorsBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Images Panel Frame Colors'
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
        ShadowEnabled = True
        EllipsType = etNone
        ColorFrame = 4210752
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object NightModeImagesPanelShowInnerFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 45
        Width = 82
        Height = 20
        Hint = 'Check to show a double border (outer frame must be enabled)'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = NightModeImagesPanelShowInnerFrameClick
        Alignment = taLeftJustify
        Caption = 'Inner Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeImagesPanelShowOuterFrame: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 69
        Width = 85
        Height = 20
        Hint = 'Check to show a single border'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = NightModeImagesPanelShowOuterFrameClick
        Alignment = taLeftJustify
        Caption = 'Outer Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeImagesPanelOuterFrameColor: TColorBoxEx
        Left = 91
        Top = 68
        Width = 190
        Height = 22
        DefaultColorColor = 16750899
        NoneColorColor = clNone
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = NightModeImagesPanelOuterFrameColorSelect
      end
      object NightModeImagesPanelInnerFrameColor: TColorBoxEx
        Left = 91
        Top = 44
        Width = 190
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clNone
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = NightModeImagesPanelInnerFrameColorSelect
      end
      object NightModeImagesPanelFrameColorsDefaultButton: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 4
        OnClick = NightModeImagesPanelFrameColorsDefaultButtonClick
      end
    end
    object NightModeGamesSelectionBarColorsBox: TPanelEx
      Left = 8
      Top = 8
      Width = 287
      Height = 379
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
        Caption = ' Games List Selection Bar'
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
      object Label27: TShadowLabel
        Left = 4
        Top = 47
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
      object Label28: TShadowLabel
        Left = 4
        Top = 119
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
      object Label29: TShadowLabel
        Left = 4
        Top = 95
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
      object Label30: TShadowLabel
        Left = 4
        Top = 165
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
      object Label31: TShadowLabel
        Left = 4
        Top = 236
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
      object Label32: TShadowLabel
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
      object ShadowLabel3: TShadowLabel
        Left = 76
        Top = 144
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
      object Label33: TShadowLabel
        Left = 4
        Top = 282
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
      object Label34: TShadowLabel
        Left = 4
        Top = 354
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
      object Label35: TShadowLabel
        Left = 4
        Top = 330
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
      object ShadowLabel7: TShadowLabel
        Left = 76
        Top = 261
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
      object Label39: TShadowLabel
        Left = 4
        Top = 71
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
      object Label40: TShadowLabel
        Left = 4
        Top = 189
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
      object Label42: TShadowLabel
        Left = 4
        Top = 306
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
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 0
        OnClick = NightModeGameSelectionButtonDefaultClick
        UseCustomDraw = True
      end
      object NightModeGameSelectionAlphaBlend: TAdvOfficeCheckBoxEx
        Left = 77
        Top = 20
        Width = 88
        Height = 18
        Hint = 'Enable alpha blended bar'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = NightModeGameSelectionAlphaBlendClick
        Alignment = taLeftJustify
        Caption = 'Alpha Blend'
        ReturnIsTab = False
        Themed = True
      end
      object NightModeGameSelectionGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 68
        Height = 18
        Hint = 'Enable alpha blended bar'
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
        Themed = True
      end
      object GameSelectionButtonPreview: TBitBtnEx
        Left = 182
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = GameSelectionButtonPreviewClick
        UseCustomDraw = True
      end
      object NightModeGamesSelectionTopColor: TColorBoxEx
        Left = 76
        Top = 44
        Width = 205
        Height = 22
        Hint = 'Top gradient bar color / single color'
        DefaultColorColor = 5832704
        NoneColorColor = clNone
        Selected = 5832704
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionBottomColor: TColorBoxEx
        Left = 76
        Top = 68
        Width = 205
        Height = 22
        Hint = 'Bottom gradient bar color'
        DefaultColorColor = 1
        NoneColorColor = clNone
        Selected = 1
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionFrameColor: TColorBoxEx
        Left = 76
        Top = 92
        Width = 205
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clNone
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 6
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionFontColor: TColorBoxEx
        Left = 76
        Top = 116
        Width = 205
        Height = 22
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 7
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsTopColor: TColorBoxEx
        Left = 76
        Top = 162
        Width = 205
        Height = 22
        Hint = 'Top gradient bar color / single color'
        DefaultColorColor = 89
        NoneColorColor = clNone
        Selected = 89
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 8
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsBottomColor: TColorBoxEx
        Left = 76
        Top = 186
        Width = 205
        Height = 22
        Hint = 'Bottom gradient bar color'
        DefaultColorColor = 1
        NoneColorColor = clNone
        Selected = 1
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 9
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsFrameColor: TColorBoxEx
        Left = 76
        Top = 209
        Width = 205
        Height = 22
        DefaultColorColor = clRed
        NoneColorColor = clNone
        Selected = clRed
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 10
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionMissROMsFontColor: TColorBoxEx
        Left = 76
        Top = 233
        Width = 205
        Height = 22
        DefaultColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 11
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveTopColor: TColorBoxEx
        Left = 76
        Top = 279
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
        TabOrder = 12
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveBottomColor: TColorBoxEx
        Left = 76
        Top = 303
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
        TabOrder = 13
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveFrameColor: TColorBoxEx
        Left = 76
        Top = 327
        Width = 205
        Height = 22
        DefaultColorColor = 9342606
        NoneColorColor = clNone
        Selected = 9342606
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 14
        CustomColorsEnabled = True
      end
      object NightModeGamesSelectionInactiveFontColor: TColorBoxEx
        Left = 76
        Top = 351
        Width = 205
        Height = 22
        NoneColorColor = clNone
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 15
        CustomColorsEnabled = True
      end
    end
    object NightModePanelColorsBox: TPanelEx
      Left = 311
      Top = 443
      Width = 590
      Height = 168
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
        Width = 588
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Panels Colors (Mostly Frames and Message Boxes)'
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
      object LabelNightModePanelColorsTitle2ShadowFontColor: TShadowLabel
        Left = 307
        Top = 143
        Width = 80
        Height = 16
        Caption = 'Title 2 Shadow'
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
      object LabelNightModePanelColorsTitleShadowFontColor: TShadowLabel
        Left = 307
        Top = 119
        Width = 71
        Height = 16
        Caption = 'Title Shadow'
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
      object LabelNightModePanelColorsTitleFontColor: TShadowLabel
        Left = 307
        Top = 95
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
      object LabelNightModePanelColorsMessageShadowFontColor: TShadowLabel
        Left = 307
        Top = 71
        Width = 70
        Height = 16
        Caption = 'Text Shadow'
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
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
      end
      object LabelNightModePanelColorsMessageFontColor: TShadowLabel
        Left = 307
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
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelNightModeSearchGamesPanelTopColor: TShadowLabel
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
      object LabelNightModePanelColorsTitle2FontColor: TShadowLabel
        Left = 4
        Top = 143
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
      object LabelNightModeSearchGamesPanelOuterFrameColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelInnerFrameColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelBottomColor: TShadowLabel
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
      object NightModeSearchGamesPanelGradientBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 20
        Width = 86
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
        Caption = 'Gradient Bar'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModePanelsBackgroundColorsDefaultButton: TBitBtnEx
        Left = 538
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = NightModePanelsBackgroundColorsDefaultButtonClick
      end
      object NightModePanelColorsMessageFontColor: TColorBoxEx
        Left = 389
        Top = 44
        Width = 195
        Height = 22
        Hint = 'Font color for the message text'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = NightModePanelColorsMessageFontColorSelect
      end
      object NightModePanelColorsMessageShadowFontColor: TColorBoxEx
        Left = 389
        Top = 68
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the message text'
        DefaultColorColor = clMaroon
        NoneColorColor = clNone
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = NightModePanelColorsMessageShadowFontColorSelect
      end
      object NightModePanelColorsTitleFontColor: TColorBoxEx
        Left = 389
        Top = 92
        Width = 195
        Height = 22
        Hint = 'Font color for the title text'
        DefaultColorColor = clYellow
        NoneColorColor = clNone
        Selected = clYellow
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModePanelColorsTitleFontColorSelect
      end
      object NightModePanelColorsTitleShadowFontColor: TColorBoxEx
        Left = 389
        Top = 116
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the title text'
        DefaultColorColor = clMaroon
        NoneColorColor = clNone
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = NightModePanelColorsTitleShadowFontColorSelect
      end
      object NightModePanelColorsTitle2ShadowFontColor: TColorBoxEx
        Left = 389
        Top = 140
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the second title text'
        DefaultColorColor = 13120050
        NoneColorColor = clNone
        Selected = 13120050
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 6
        OnSelect = NightModePanelColorsTitle2ShadowFontColorSelect
      end
      object NightModeSearchGamesPanelTopColor: TColorBoxEx
        Left = 86
        Top = 44
        Width = 195
        Height = 22
        DefaultColorColor = 5832704
        NoneColorColor = 5832704
        Selected = 5832704
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 7
        OnSelect = NightModeSearchGamesPanelTopColorSelect
      end
      object NightModeSearchGamesPanelBottomColor: TColorBoxEx
        Left = 86
        Top = 68
        Width = 195
        Height = 22
        DefaultColorColor = 1
        NoneColorColor = 1
        Selected = 1
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 8
        OnSelect = NightModeSearchGamesPanelBottomColorSelect
      end
      object NightModeSearchGamesPanelInnerFrameColor: TColorBoxEx
        Left = 86
        Top = 92
        Width = 195
        Height = 22
        DefaultColorColor = clBlue
        NoneColorColor = clBlue
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 9
        OnSelect = NightModeSearchGamesPanelInnerFrameColorSelect
      end
      object NightModeSearchGamesPanelOuterFrameColor: TColorBoxEx
        Left = 86
        Top = 116
        Width = 195
        Height = 22
        DefaultColorColor = 16750899
        NoneColorColor = 16750899
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 10
        OnSelect = NightModeSearchGamesPanelOuterFrameColorSelect
      end
      object NightModePanelColorsTitle2FontColor: TColorBoxEx
        Left = 86
        Top = 140
        Width = 195
        Height = 22
        Hint = 'Font color for the second title text'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 11
        OnSelect = NightModePanelColorsTitle2FontColorSelect
      end
      object BitBtnEx1: TBitBtnEx
        Left = 485
        Top = 19
        Width = 50
        Height = 21
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = BitBtnEx1Click
      end
    end
    object NightModeSearchGamesPanelColorsBox: TPanelEx
      Left = 614
      Top = 8
      Width = 287
      Height = 337
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
      object ShadowLabel2: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Search Games Panel Colors'
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
      object LabelNightModeSearchGamesPanelFilterFontColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelFilterShadowColor: TShadowLabel
        Left = 4
        Top = 71
        Width = 74
        Height = 16
        Caption = 'Filter Shadow'
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
      object LabelNightModeSearchGamesPanelFieldFontColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelFieldShadowColor: TShadowLabel
        Left = 4
        Top = 119
        Width = 73
        Height = 16
        Caption = 'Field Shadow'
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
      object Label3: TShadowLabel
        Left = 4
        Top = 288
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
      object Label4: TShadowLabel
        Left = 4
        Top = 312
        Width = 71
        Height = 16
        Caption = 'Title Shadow'
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
      object LabelNightModeSearchGamesFloatingPanel: TShadowLabel
        Left = 141
        Top = 268
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
      object LabelNightModeSearchGamesPanelEditBoxFontColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelEditBoxBackgroundColor: TShadowLabel
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
      object LabelNightModeSearchGamesPanelEditBoxCustomFrameColor: TShadowLabel
        Left = 4
        Top = 218
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
        Top = 242
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
      object NightModeSearchGamesPanelColorsDefaultButton: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 0
        OnClick = NightModeSearchGamesPanelColorsDefaultButtonClick
        UseCustomDraw = True
      end
      object NightModeSearchGamesPanelFilterFontColor: TColorBoxEx
        Left = 86
        Top = 44
        Width = 195
        Height = 22
        Hint = 'Font color for the filter text'
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 1
        OnSelect = NightModeSearchGamesPanelFilterFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFilterShadowColor: TColorBoxEx
        Left = 86
        Top = 68
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the filter text'
        DefaultColorColor = clBlue
        NoneColorColor = clBlue
        Selected = clBlue
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = NightModeSearchGamesPanelFilterShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFieldFontColor: TColorBoxEx
        Left = 86
        Top = 92
        Width = 195
        Height = 22
        Hint = 'Font color for the category text'
        DefaultColorColor = clYellow
        NoneColorColor = clNone
        Selected = clYellow
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
        OnSelect = NightModeSearchGamesPanelFieldFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelFieldShadowColor: TColorBoxEx
        Left = 86
        Top = 116
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the category text'
        DefaultColorColor = clMaroon
        NoneColorColor = clNone
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeSearchGamesPanelFieldShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelCaptionBarFontColor: TColorBoxEx
        Left = 86
        Top = 285
        Width = 195
        Height = 22
        Hint = 'Font color for the caption bar'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 5
        OnSelect = NightModeSearchGamesPanelCaptionBarFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelCaptionBarShadowColor: TColorBoxEx
        Left = 86
        Top = 309
        Width = 195
        Height = 22
        Hint = 'Shadow font color for the caption bar'
        DefaultColorColor = clMaroon
        NoneColorColor = clNone
        Selected = clMaroon
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 6
        OnSelect = NightModeSearchGamesPanelCaptionBarShadowColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxFontColor: TColorBoxEx
        Left = 86
        Top = 140
        Width = 195
        Height = 22
        Hint = 'Font color for the edit box'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 7
        OnSelect = NightModeSearchGamesPanelEditBoxFontColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxBackgroundColor: TColorBoxEx
        Left = 86
        Top = 164
        Width = 195
        Height = 22
        Hint = 'Background color for the edit box'
        DefaultColorColor = 5832704
        NoneColorColor = clNone
        Selected = 5832704
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 8
        OnSelect = NightModeSearchGamesPanelEditBoxBackgroundColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFrameColor: TColorBoxEx
        Left = 86
        Top = 215
        Width = 195
        Height = 22
        Hint = 'Frame color for the edit box'
        DefaultColorColor = 16750899
        NoneColorColor = clNone
        Selected = 16750899
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 9
        OnSelect = NightModeSearchGamesPanelEditBoxCustomFrameColorSelect
        CustomColorsEnabled = True
      end
      object NightModeSearchGamesPanelEditBoxUseCustomFrame: TAdvOfficeCheckBoxEx
        Left = 86
        Top = 193
        Width = 172
        Height = 20
        Hint = 'Uncheck this option to paint a Windows themed edit box border'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NightModeSearchGamesPanelEditBoxUseCustomFrameClick
        Alignment = taLeftJustify
        Caption = 'Use Edit Box Custom Frame'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeSearchGamesPanelEditBoxCustomFocusedFrameColor: TColorBoxEx
        Left = 86
        Top = 239
        Width = 195
        Height = 22
        Hint = 'Focused frame color for the edit box'
        DefaultColorColor = clWhite
        NoneColorColor = clNone
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 11
        OnSelect = NightModeSearchGamesPanelEditBoxCustomFocusedFrameColorSelect
        CustomColorsEnabled = True
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
        Caption = ' Tool Bar Overlay Icons Folder'
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
        Height = 23
        Hint = 'Click here to update the folders list (no restart needed)'
        Caption = 'Update'
        TabOrder = 0
        OnClick = ToolBarOverlayIconsFolderButtonUpdateClick
      end
      object ToolBarOverlayIconsFolder: TComboBox2Ex
        Left = 4
        Top = 22
        Width = 225
        Height = 23
        Style = csDropDownList
        Color = clWhite
        ItemHeight = 15
        TabOrder = 1
        OnSelect = ToolBarOverlayIconsFolderSelect
      end
    end
    object NightModeGamesBackgroundGroupBox: TPanelEx
      Left = 8
      Top = 627
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
      object NightModeGamesBackgroundGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 891
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Games list Background'
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
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeGamesBackgroundColorSelect
      end
      object NightModeButtonDefaultBkSortedColor: TBitBtnEx
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
        OnClick = NightModeButtonDefaultBkSortedColorClick
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
        Themed = True
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
        Hint = 'Click here to load the image if you'#39've made a manual change'
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
    object NightModeGameDocsGroupBox: TPanelEx
      Left = 8
      Top = 710
      Width = 287
      Height = 143
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
      object NightModeGameDocsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Game Docs'
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
        Top = 122
        Width = 230
        Height = 19
        Caption = 'Only visible if 7 pixels border is disabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
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
        Left = 204
        Top = 54
        Width = 52
        Height = 15
        Caption = 'UseFont'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
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
      object NightModeGameDocumentsBackgroundColor: TColorBoxEx
        Left = 4
        Top = 25
        Width = 185
        Height = 22
        Hint = 'Background color'
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeGameDocumentsBackgroundColorSelect
      end
      object NightModeButtonGameDocumentsFont: TBitBtnEx
        Left = 190
        Top = 24
        Width = 41
        Height = 23
        Hint = 'Select font for texts (game docs)'
        Caption = 'Font'
        TabOrder = 1
        OnClick = NightModeButtonGameDocumentsFontClick
      end
      object NightModeButtonGameDocumentsDefault: TBitBtnEx
        Left = 232
        Top = 24
        Width = 47
        Height = 23
        Hint = 'Set background color / font default values (game docs)'
        Caption = 'Default'
        TabOrder = 2
        OnClick = NightModeButtonGameDocumentsDefaultClick
      end
      object NightModeGameDocsShowBorder: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 54
        Width = 193
        Height = 17
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeGameDocsShowBorderClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs 7 Pixels Border'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGameDocsBorderColor: TColorBoxEx
        Left = 4
        Top = 76
        Width = 220
        Height = 22
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = NightModeGameDocsBorderColorSelect
      end
      object NightModeButtonGameDocsBorderColorDefault: TBitBtnEx
        Left = 232
        Top = 75
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 5
        OnClick = NightModeButtonGameDocsBorderColorDefaultClick
      end
      object NightModeGameDocsShowStatusBar: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 105
        Width = 175
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = NightModeGameDocsShowStatusBarClick
        Alignment = taLeftJustify
        Caption = 'Show Game Docs Status Bar'
        ReturnIsTab = False
        Themed = True
      end
    end
    object NightModeGroupBoxGameDocsSplitter: TPanelEx
      Left = 311
      Top = 710
      Width = 287
      Height = 132
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
      object NightModeGroupBoxGameDocsSplitterLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Game Docs Splitter'
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
      object NightModeLabelGameDocsSplitterSingleColorDefault: TShadowLabel
        Left = 4
        Top = 54
        Width = 67
        Height = 16
        Caption = 'Single Color'
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
      object NightModeLabelGameDocsSplitterSingleColor: TShadowLabel
        Left = 4
        Top = 81
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
      object NightModeLabelGameDocsSplitterSingleColorHot: TShadowLabel
        Left = 4
        Top = 107
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
      object NightModeGameDocsSplitterStyleSelector: TComboBox2Ex
        Left = 4
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
        OnSelect = NightModeGameDocsSplitterStyleSelectorSelect
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
      object NightModeButtonGameDocsSplitterSingleColorDefault: TBitBtnEx
        Left = 74
        Top = 51
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeButtonGameDocsSplitterSingleColorDefaultClick
      end
      object NightModeButtonGameDocsSplitterStyleDefault: TBitBtnEx
        Left = 232
        Top = 20
        Width = 47
        Height = 23
        Hint = 'Set splitters default style'
        Caption = 'Default'
        TabOrder = 2
        OnClick = NightModeButtonGameDocsSplitterStyleDefaultClick
      end
      object NightModeGameDocsSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 179
        Top = 52
        Width = 97
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeGameDocsSplitterShowGripIconClick
        Alignment = taRightJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGameDocsSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 78
        Width = 221
        Height = 22
        Hint = 'Color of the splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeGameDocsSplitterSingleColorSelect
      end
      object NightModeGameDocsSplitterSingleColorHot: TColorBoxEx
        Left = 60
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
        TabOrder = 5
        OnSelect = NightModeGameDocsSplitterSingleColorHotSelect
      end
    end
    object NightModeMenuPopupMenuBox: TPanelEx
      Left = 614
      Top = 376
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
      Style = vgSolid
      object ShadowLabel20: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Menus / Popup Menus'
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
      object LabelNightModeMenuPopupMenuFrameColor: TShadowLabel
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
        DefaultColorColor = 5787720
        Selected = 5787720
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 0
      end
      object NightModeMenuPopupMenuFrameColorDefaultColors: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
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
      Height = 513
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
        Caption = ' Buttons Colors'
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
      object LabelNightModeButtonColorFontColor: TShadowLabel
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
      object LabelNightModeButtonColorGradientTop: TShadowLabel
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
      object LabelNightModeButtonColorGradientBottom: TShadowLabel
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
      object LabelNightModeButtonColorGradientBottomHover: TShadowLabel
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
      object LabelNightModeButtonColorGradientTopHover: TShadowLabel
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
      object LabelNightModeButtonColorGradientTopDisabled: TShadowLabel
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
      object LabelNightModeButtonColorGradientBottomDisabled: TShadowLabel
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
      object LabelNightModeButtonColorFrameColor: TShadowLabel
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
      object LabelNightModeButtonColorFrameColorHover: TShadowLabel
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
      object LabelNightModeButtonColorFrameColorDisabled: TShadowLabel
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
      object LabelNightModeButtonColorFrameColorFocused: TShadowLabel
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
      object LabelNightModeButtonColorFontColorDisabled: TShadowLabel
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
      object LabelNightModeButtonColorFontShadowColorDisabled: TShadowLabel
        Left = 4
        Top = 363
        Width = 93
        Height = 16
        Caption = 'Shadow Disabled'
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
      object ShadowLabel8: TShadowLabel
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
      object ShadowLabel9: TShadowLabel
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
      object ShadowLabel10: TShadowLabel
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
        Hint = 'Top gradient color'
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
        Hint = 'Bottom gradient color'
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
        Hint = 'Top gradient color'
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
        Hint = 'Bottom gradient color'
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
        Hint = 'Bottom gradient color'
        DefaultColorColor = clMedGray
        Selected = clMedGray
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
        Hint = 'Top gradient color'
        DefaultColorColor = clSilver
        Selected = clSilver
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
        DefaultColorColor = clGray
        Selected = clGray
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
        DefaultColorColor = clBtnShadow
        Selected = clBtnShadow
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
        Hint = 'Shadow font color for the text'
        DefaultColorColor = clBtnHighlight
        Selected = clBtnHighlight
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 12
        OnSelect = NightModeButtonColorFontShadowColorDisabledSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorsBoxDefaultButton: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 21
        Hint = 'Reset colors to default'
        Caption = 'Default'
        TabOrder = 13
        OnClick = NightModeButtonColorsBoxDefaultButtonClick
        UseCustomDraw = True
      end
      object NightModeButtonColorGradientTopSelected: TColorBoxEx
        Left = 96
        Top = 257
        Width = 185
        Height = 22
        Hint = 'Top gradient color'
        DefaultColorColor = 10905138
        Selected = 10905138
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
        Hint = 'Bottom gradient color'
        DefaultColorColor = 9196326
        Selected = 9196326
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
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 16
        OnSelect = NightModeButtonColorFrameColorSelectedSelect
        CustomColorsEnabled = True
      end
      object NightModeButtonColorsSamplePanel: TPanelEx
        Left = 4
        Top = 468
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
    object NightModeGroupBoxGamesListSplitters: TPanelEx
      Left = 917
      Top = 562
      Width = 287
      Height = 132
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
      object NightModeGroupBoxGamesListSplittersLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Games List / Machines List Splitters'
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
      object NightModeLabelGamesListSplitterSingleColorDefault: TShadowLabel
        Left = 4
        Top = 54
        Width = 67
        Height = 16
        Caption = 'Single Color'
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
      object NightModeLabelGamesListSplitterSingleColor: TShadowLabel
        Left = 4
        Top = 81
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
        Top = 107
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
      object NightModeGamesListSplitterStyleSelector: TComboBox2Ex
        Left = 4
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
        TabOrder = 0
        Text = 'Single Color (Customizable)'
        OnSelect = NightModeGamesListSplitterStyleSelectorSelect
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
      object NightModeButtonGamesListSplitterStyleDefault: TBitBtnEx
        Left = 235
        Top = 20
        Width = 47
        Height = 23
        Hint = 'Set splitters default style'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeButtonGamesListSplitterStyleDefaultClick
      end
      object NightModeButtonGamesListSplitterSingleColorDefault: TBitBtnEx
        Left = 74
        Top = 51
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 2
        OnClick = NightModeButtonGamesListSplitterSingleColorDefaultClick
      end
      object NightModeGamesListSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 187
        Top = 52
        Width = 97
        Height = 20
        Hint = 'Show/hide grip icon in the middle of the splitter'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = NightModeGamesListSplitterShowGripIconClick
        Alignment = taRightJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeGamesListSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 78
        Width = 221
        Height = 22
        Hint = 'Color of the splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeGamesListSplitterSingleColorSelect
      end
      object NightModeGamesListSplitterSingleColorHot: TColorBoxEx
        Left = 60
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
        TabOrder = 5
        OnSelect = NightModeGamesListSplitterSingleColorHotSelect
      end
    end
    object NightModeImagesHintBox: TPanelEx
      Left = 614
      Top = 710
      Width = 287
      Height = 225
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
        Caption = ' Image Hint Box'
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
      object LabelNightModeHintBox_Color: TShadowLabel
        Left = 4
        Top = 47
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
        Top = 99
        Width = 73
        Height = 16
        Caption = 'Opacity [200]'
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
        Top = 174
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
      object NightModeButtonHintBoxDefaultColors: TBitBtnEx
        Left = 235
        Top = 19
        Width = 47
        Height = 23
        Hint = 'Set hint box colors to default'
        Caption = 'Default'
        TabOrder = 0
        OnClick = NightModeButtonHintBoxDefaultColorsClick
      end
      object NightModeHintBox_Color: TColorBoxEx
        Left = 76
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
        TabOrder = 1
        OnSelect = NightModeHintBox_ColorSelect
      end
      object NightModeHintBox_FrameColor: TColorBoxEx
        Left = 76
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
        TabOrder = 2
        OnSelect = NightModeHintBox_FrameColorSelect
      end
      object NightModeHintBox_FrameEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 71
        Width = 57
        Height = 20
        Checked = True
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
        State = cbChecked
        Themed = True
      end
      object NightModeHintBox_Opacity: TGaugeBar
        Left = 4
        Top = 116
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
        Position = 200
        OnChange = NightModeHintBox_OpacityChange
      end
      object NightModeButtonDefaultHintBox_Opacity: TBitBtnEx
        Left = 235
        Top = 116
        Width = 47
        Height = 22
        Hint = 'Set opacity to default level'
        Caption = 'Default'
        TabOrder = 5
        OnClick = NightModeButtonDefaultHintBox_OpacityClick
      end
      object NightModeButtonHintTextDefaultColors: TBitBtnEx
        Left = 235
        Top = 145
        Width = 47
        Height = 23
        Hint = 'Set text colors to default'
        Caption = 'Default'
        TabOrder = 6
        OnClick = NightModeButtonHintTextDefaultColorsClick
      end
      object NightModeHintBox_IconEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 149
        Width = 171
        Height = 20
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 12574688
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = NightModeHintBox_IconEnabledClick
        Alignment = taLeftJustify
        Caption = 'Show Unzipped/Zipped Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeHintBox_TextColor: TColorBoxEx
        Left = 76
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
        TabOrder = 8
        OnSelect = NightModeHintBox_TextColorSelect
      end
      object NightModeHintBox_TextShadowColor: TColorBoxEx
        Left = 76
        Top = 197
        Width = 205
        Height = 22
        Hint = 'Shadow font color for the text'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 9
        OnSelect = NightModeHintBox_TextShadowColorSelect
      end
      object NightModeHintBox_TextShadowEnabled: TAdvOfficeCheckBoxEx
        Left = 4
        Top = 199
        Width = 65
        Height = 20
        Checked = True
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
        State = cbChecked
        Themed = True
      end
      object BitBtnEx2: TBitBtnEx
        Left = 182
        Top = 19
        Width = 50
        Height = 23
        Hint = 'Show preview panel for customization'
        Caption = 'Preview'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BitBtnEx2Click
      end
    end
    object NightModeGroupBoxImageSplitters: TPanelEx
      Left = 917
      Top = 710
      Width = 287
      Height = 132
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
      object NightModeGroupBoxImageSplittersLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Image Splitters'
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
      object NightModeLabelImageSplitterSingleColorDefault: TShadowLabel
        Left = 4
        Top = 54
        Width = 67
        Height = 16
        Caption = 'Single Color'
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
      object NightModeLabelImageSplitterSingleColor: TShadowLabel
        Left = 4
        Top = 81
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
        Top = 107
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
      object NightModeImageSplitterStyleSelector: TComboBox2Ex
        Left = 4
        Top = 21
        Width = 223
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
        OnSelect = NightModeImageSplitterStyleSelectorSelect
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
      object NightModeButtonImageSplitterStyleDefault: TBitBtnEx
        Left = 235
        Top = 20
        Width = 47
        Height = 23
        Hint = 'Set splitter default style'
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeButtonImageSplitterStyleDefaultClick
      end
      object NightModeButtonImageSplitterSingleColorDefault: TBitBtnEx
        Left = 74
        Top = 51
        Width = 47
        Height = 23
        Hint = 'Set single color default values'
        Caption = 'Default'
        TabOrder = 2
        OnClick = NightModeButtonImageSplitterSingleColorDefaultClick
      end
      object NightModeImageSplitterShowGripIcon: TAdvOfficeCheckBoxEx
        Left = 182
        Top = 52
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
        TabOrder = 3
        OnClick = NightModeImageSplitterShowGripIconClick
        Alignment = taLeftJustify
        Caption = 'Show Grip Icon'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object NightModeImageSplitterSingleColor: TColorBoxEx
        Left = 60
        Top = 78
        Width = 221
        Height = 22
        Hint = 'Color of the splitter'
        NoneColorColor = clBtnFace
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        Ctl3D = True
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 4
        OnSelect = NightModeImageSplitterSingleColorSelect
      end
      object NightModeImageSplitterSingleColorHot: TColorBoxEx
        Left = 60
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
        TabOrder = 5
        OnSelect = NightModeImageSplitterSingleColorHotSelect
      end
    end
    object NightModeImageBorderColorGroupBox: TPanelEx
      Left = 917
      Top = 858
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
      object NightModeImageBorderColorGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = ' Image 7 Pixels Border Color'
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
        NoneColorColor = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = NightModeImageBorderColorSelect
      end
      object NightModeButtonImageBorderColorDefault: TBitBtnEx
        Left = 235
        Top = 21
        Width = 47
        Height = 23
        Caption = 'Default'
        TabOrder = 1
        OnClick = NightModeButtonImageBorderColorDefaultClick
      end
    end
    object NightModeProfilesGroupBox: TPanelEx
      Left = 8
      Top = 869
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
        Caption = ' Night Mode Profiles'
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
  end
  object PanelPage2: TPanelEx
    Left = 1229
    Top = 536
    Width = 60
    Height = 385
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
    Top = 962
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
      Left = 706
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
      Left = 806
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
      Left = 236
      Top = 4
      Width = 55
      Height = 24
      Hint = 'Start a new profile with default colors'
      Caption = 'New'
      Enabled = False
      TabOrder = 0
      UseCustomDraw = True
    end
    object NightModeProfiles: TComboBox2Ex
      Left = 8
      Top = 5
      Width = 225
      Height = 23
      Hint = 'Night mode profiles'
      Style = csDropDownList
      Color = clWhite
      ItemHeight = 15
      TabOrder = 1
    end
    object NightModeProfiles_ButtonSave: TBitBtnEx
      Left = 292
      Top = 4
      Width = 55
      Height = 24
      Hint = 'Save current profile'
      Caption = 'Save'
      Enabled = False
      TabOrder = 2
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonSaveAs: TBitBtnEx
      Left = 348
      Top = 4
      Width = 55
      Height = 24
      Hint = 'Save current profile with a different name'
      Caption = 'Save As'
      Enabled = False
      TabOrder = 3
      UseCustomDraw = True
    end
    object NightModeProfiles_ButtonDelete: TBitBtnEx
      Left = 404
      Top = 4
      Width = 55
      Height = 24
      Hint = 'Delete current profile'
      Caption = 'Delete'
      Enabled = False
      TabOrder = 4
      UseCustomDraw = True
    end
  end
  object NightModePanelColorsBoxPreview: TPanelEx
    Left = 1224
    Top = 15
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
      Width = 127
      Height = 16
      Caption = '  Preview: Panels Colors'
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
      Color1 = 5832704
      Color2 = 1
      Color3 = 7891291
      Color4 = 16750899
      ColorFrame = 16750899
      ColorInnerFrame = clBlue
      EnableInnerFrame = True
      Frames = [frLeft, frTop, frRight, frBottom]
      ParentBackground = False
      Style = vgSimple
      object LabelInitZipTitle: TShadowLabel
        Left = 60
        Top = 8
        Width = 304
        Height = 17
        Caption = 'Initializing Zipped Images Contents Array'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clMaroon
        ShadowEnabled = True
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
        Height = 15
        Hint = '" list in RAM for fast access.'
        AutoSize = False
        Caption = 'Parsing "artpreview.zip" list in RAM for fast access.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clMaroon
        ShadowEnabled = True
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
        Height = 17
        AutoSize = False
        Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 13120050
        ShadowEnabled = True
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
        Height = 15
        AutoSize = False
        Caption = 'Game Snapshot'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clMaroon
        ShadowEnabled = True
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
    Top = 164
    Width = 287
    Height = 95
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
      Width = 137
      Height = 16
      Caption = '  Preview: Image Hint Box'
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
      Height = 49
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baTopLeft
      Color = clBlack
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smResize
      TabOrder = 0
      object ImageHintPanel: TPanelEx
        Tag = -1
        Left = 4
        Top = 4
        Width = 171
        Height = 41
        Color1 = 16750899
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = 16750899
        ColorInnerFrame = clGreen
        Frames = [frLeft, frTop, frRight, frBottom]
        ParentBackground = False
        Style = vgSolid
        object ImageHintText: TShadowLabel
          Left = 28
          Top = 8
          Width = 135
          Height = 25
          Caption = 'Game Snapshot'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clBlack
          ShadowEnabled = True
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ImageHintIcon: TImage
          Left = 8
          Top = 13
          Width = 16
          Height = 16
          Transparent = True
        end
      end
    end
  end
  object NightModeGamesSelectionBarPreview: TPanelEx
    Left = 1224
    Top = 273
    Width = 291
    Height = 135
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
      Height = 91
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
        Height = 91
        Align = alClient
        CellSizes.SmallIcon.Height = 20
        CellSizes.Tile.Width = 260
        CellSizes.Report.Height = 28
        Color = clWhite
        DisabledBlendAlpha = 0
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
          06000000810806000000020000000F00000054456173794974656D53746F7265
          64FFFECE0006000000800C010000000F00000041007600610069006C00610062
          006C0065002000470061006D0065007300000000000100000000000000000000
          0000000000000000000F00000054456173794974656D53746F726564FFFECE00
          060000008008010000001C000000470061006D00650073002000570069007400
          680020004D0069007300730069006E006700200052004F004D0073002F004300
          4800440073000000000001000000010000000000000000000000000000000000
          0000000000000000000000000000}
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
        OnItemPaintText = NightModeGamesListViewItemPaintText
        OnItemSelectionChanged = NightModeGamesListViewItemSelectionChanged
      end
    end
  end
end
