object FormStatus: TFormStatus
  Left = 1266
  Top = 696
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Splash Screen'
  ClientHeight = 600
  ClientWidth = 1236
  Color = 2565927
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ImageBk: TImage32
    Left = 0
    Top = 0
    Width = 980
    Height = 600
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseDown = ImageBkMouseDown
    object LabelTimer: TShadowLabel
      Left = 4
      Top = 566
      Width = 67
      Height = 14
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Terminal'
      Font.Style = []
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
    object LabelStatusType: TShadowLabel
      Left = 76
      Top = 563
      Width = 685
      Height = 17
      AutoSize = False
      Caption = 
        'Force Incomplete Games Available [.zip; .7z]: Supermodel: A Sega' +
        ' Model 3 Arcade Emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
    object LabelVersion: TShadowLabel
      Left = 6
      Top = 228
      Width = 58
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'v12.10.0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
    object LabelSoftwareScanCount: TShadowLabel
      Left = 4
      Top = 584
      Width = 83
      Height = 14
      Hint = '%.3u of %u'
      AutoSize = False
      Caption = '000 of 000'
      Font.Charset = OEM_CHARSET
      Font.Color = clAqua
      Font.Height = -12
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Visible = False
    end
    object LabelMessage: TShadowLabel
      Left = 92
      Top = 582
      Width = 669
      Height = 15
      AutoSize = False
      Caption = 
        'Parsing "hbmame_listxml.xml" (3rd pass). Adding parent sections ' +
        'and listing parents with BIOS.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
  end
  object SplashScreenSettingsBox: TPanelEx
    Left = 984
    Top = 4
    Width = 248
    Height = 52
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
    object SplashScreenSettingsBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 246
      Height = 9
      Align = alTop
      AutoSize = False
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
    object SplashScreenEnableTextsAlternateLayout: TAdvOfficeCheckBoxEx
      Left = 4
      Top = 10
      Width = 129
      Height = 18
      Hint = 'Left aligned texts layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = SplashScreenEnableTextsAlternateLayoutClick
      Alignment = taLeftJustify
      Caption = 'Use Alternate Layout'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx
      Left = 4
      Top = 30
      Width = 129
      Height = 18
      Hint = 'Show shadow in black color'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = SplashScreenShowTextShadowsClick
      Alignment = taLeftJustify
      Caption = 'Enable Text Shadows'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object SplashScreenEnableAlternateLogoFile: TAdvOfficeCheckBoxEx
      Left = 140
      Top = 10
      Width = 100
      Height = 18
      Hint = 'Use "resources\images\logo2.png" image file in the splash screen'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = SplashScreenEnableAlternateLogoFileClick
      Alignment = taLeftJustify
      Caption = 'Use Logo2 File'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
  end
  object SplashScreenSettingsTextFontColorsBox: TPanelEx
    Left = 984
    Top = 60
    Width = 248
    Height = 427
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
    object SplashScreenSettingsTextFontColorsBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 246
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Text Font Colors'
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
    object SplashScreenTitleTextColorLabel: TShadowLabel
      Left = 4
      Top = 25
      Width = 26
      Height = 16
      Caption = 'Title'
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
    object SplashScreenMessageTextColorLabel: TShadowLabel
      Left = 4
      Top = 49
      Width = 49
      Height = 16
      Caption = 'Message'
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
    object SplashScreenTimerTextColorLabel: TShadowLabel
      Left = 4
      Top = 80
      Width = 34
      Height = 16
      Caption = 'Timer'
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
    object SplashScreenVersionInfoTextColorLabel: TShadowLabel
      Left = 4
      Top = 135
      Width = 42
      Height = 16
      Caption = 'Version'
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
    object SplashScreenSoftwareTextColorLabel: TShadowLabel
      Left = 4
      Top = 104
      Width = 49
      Height = 16
      Caption = 'Software'
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
    object SplashScreenVersionInfoPositionLabel: TShadowLabel
      Left = 4
      Top = 361
      Width = 46
      Height = 16
      Caption = 'Position'
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
      Visible = False
    end
    object SplashScreenVersionInfoPositionXLabel: TShadowLabel
      Left = 224
      Top = 159
      Width = 21
      Height = 16
      Caption = '000'
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
    object SplashScreenVersionInfoPositionYLabel: TShadowLabel
      Left = 224
      Top = 183
      Width = 21
      Height = 16
      Caption = '000'
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
    object ColorsBoxButtonDefault: TSpeedButtonEx
      Left = 4
      Top = 398
      Width = 64
      Height = 24
      Hint = 'Reset colors to default'
      Caption = 'Colors'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 15
      Images = FormMain.IL_MenuPopup
      ParentFont = False
      OnClick = ColorsBoxButtonDefaultClick
    end
    object VersionInfoPositionButtonDefault: TSpeedButtonEx
      Tag = 1
      Left = 83
      Top = 398
      Width = 69
      Height = 24
      Hint = 'Reset version info position to default'
      Caption = 'Version'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 15
      Images = FormMain.IL_MenuPopup
      ParentFont = False
      OnClick = VersionInfoPositionButtonDefaultClick
    end
    object SplashScreenVersionInfoPositionLeftLabel: TShadowLabel
      Left = 4
      Top = 159
      Width = 52
      Height = 16
      Caption = 'Version X'
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
    object SplashScreenVersionInfoPositionTopLabel: TShadowLabel
      Left = 4
      Top = 183
      Width = 52
      Height = 16
      Caption = 'Version Y'
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
    object SplashScreenProgressBarColorSchemeLabel: TShadowLabel
      Left = 4
      Top = 214
      Width = 48
      Height = 16
      Caption = 'Progress'
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
    object ProgressBarSchemeButtonDefault: TSpeedButtonEx
      Tag = 1
      Left = 167
      Top = 398
      Width = 75
      Height = 24
      Hint = 'Reset progress bar color scheme to default'
      Caption = 'Progress'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 15
      Images = FormMain.IL_MenuPopup
      ParentFont = False
      OnClick = ProgressBarSchemeButtonDefaultClick
    end
    object SplashScreenProgressBarColorBackTopLabel: TShadowLabel
      Left = 4
      Top = 238
      Width = 40
      Height = 16
      Caption = 'Bk Top'
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
    object SplashScreenProgressBarColorBackDownLabel: TShadowLabel
      Left = 4
      Top = 262
      Width = 50
      Height = 16
      Caption = 'Bk Down'
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
    object SplashScreenProgressBarColorBarTopLabel: TShadowLabel
      Left = 4
      Top = 310
      Width = 44
      Height = 16
      Caption = 'Bar Top'
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
    object SplashScreenProgressBarColorBarDownLabel: TShadowLabel
      Left = 4
      Top = 334
      Width = 54
      Height = 16
      Caption = 'Bar Down'
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
    object SplashScreenProgressBarColorBackBorderLabel: TShadowLabel
      Left = 4
      Top = 286
      Width = 39
      Height = 16
      Caption = 'Bk Out'
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
    object SplashScreenTitleTextColor: TColorBoxEx
      Left = 57
      Top = 22
      Width = 185
      Height = 22
      Hint = 'Font Color For The Title Text'
      DefaultColorColor = clYellow
      NoneColorColor = clNone
      Selected = clYellow
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnSelect = SplashScreenTitleTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenMessageTextColor: TColorBoxEx
      Left = 57
      Top = 46
      Width = 185
      Height = 22
      Hint = 'Font Color For The Message Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnSelect = SplashScreenMessageTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenTimerTextColor: TColorBoxEx
      Left = 57
      Top = 77
      Width = 185
      Height = 22
      Hint = 'Font Color For The Timer Text'
      DefaultColorColor = clLime
      NoneColorColor = clNone
      Selected = clLime
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnSelect = SplashScreenTimerTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoTextColor: TColorBoxEx
      Left = 57
      Top = 132
      Width = 185
      Height = 22
      Hint = 'Font Color For The Version Info Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      OnSelect = SplashScreenVersionInfoTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenSoftwareTextColor: TColorBoxEx
      Left = 57
      Top = 101
      Width = 185
      Height = 22
      Hint = 'Font Color For The MAME Software Counter Text'
      DefaultColorColor = clAqua
      NoneColorColor = clNone
      Selected = clAqua
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnSelect = SplashScreenSoftwareTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoPositionX: TGaugeBar
      Left = 57
      Top = 156
      Width = 164
      Height = 22
      Hint = 'Version info left position'
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
      LargeChange = 10
      Max = 920
      Min = 4
      ShowHandleGrip = True
      Style = rbsMac
      Position = 6
      OnChange = SplashScreenVersionInfoPositionXChange
    end
    object SplashScreenVersionInfoPositionY: TGaugeBar
      Left = 57
      Top = 180
      Width = 164
      Height = 22
      Hint = 'Version info top position'
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
      LargeChange = 10
      Max = 582
      ShowHandleGrip = True
      Style = rbsMac
      Position = 228
      OnChange = SplashScreenVersionInfoPositionYChange
    end
    object SplashScreenProgressBarColorScheme: TComboBox2Ex
      Left = 57
      Top = 211
      Width = 185
      Height = 21
      Hint = 'Color Scheme For The Progress Bar'
      Style = csOwnerDrawFixed
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 15
      ItemIndex = 1
      ParentFont = False
      TabOrder = 7
      Text = 'Desert'
      OnSelect = SplashScreenProgressBarColorSchemeSelect
      Items.Strings = (
        'Custom Colors'
        'Desert'
        'Grass'
        'Silver'
        'Sky'
        'Rose'
        'Sun'
        'Hackers'
        'Night'
        'Velvet'
        'Metal'
        'Violet'
        'Toxic')
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackTop: TColorBoxEx
      Left = 57
      Top = 235
      Width = 185
      Height = 22
      Hint = 'Background Top Color For The Progress Bar'
      DefaultColorColor = 13036799
      NoneColorColor = clNone
      Selected = 13036799
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 8
      OnSelect = SplashScreenProgressBarColorBackTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackDown: TColorBoxEx
      Left = 57
      Top = 259
      Width = 185
      Height = 22
      Hint = 'Background Bottom Color For The Progress Bar'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 9
      OnSelect = SplashScreenProgressBarColorBackDownSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackBorder: TColorBoxEx
      Left = 57
      Top = 283
      Width = 185
      Height = 22
      Hint = 'Background Border Color For The Progress Bar'
      DefaultColorColor = 22144
      NoneColorColor = clNone
      Selected = 22144
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 10
      OnSelect = SplashScreenProgressBarColorBackBorderSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarTop: TColorBoxEx
      Left = 57
      Top = 307
      Width = 185
      Height = 22
      Hint = 'Bar Top Color For The Progress Bar'
      DefaultColorColor = 10215167
      NoneColorColor = clNone
      Selected = 10215167
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 11
      OnSelect = SplashScreenProgressBarColorBarTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarDown: TColorBoxEx
      Left = 57
      Top = 331
      Width = 185
      Height = 22
      Hint = 'Bar Bottom Color For The Progress Bar'
      DefaultColorColor = 31671
      NoneColorColor = clNone
      Selected = 31671
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 12
      OnSelect = SplashScreenProgressBarColorBarDownSelect
      CustomColorsEnabled = True
    end
    object ProgressBarCopyCurrentColorsToCustomButton: TBitBtnEx
      Left = 56
      Top = 359
      Width = 187
      Height = 24
      Hint = 'Copy progress bar'#39's current color scheme to custom colors scheme'
      Caption = 'Copy Current Colors To Custom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = ProgressBarCopyCurrentColorsToCustomButtonClick
      UseCustomDraw = True
    end
  end
  object ProgressBarPanel: TPanelEx
    Left = 4
    Top = 548
    Width = 64
    Height = 14
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object ProgressBar: TXiProgressBar
      Left = 0
      Top = 0
      Width = 64
      Height = 14
      ColorBorder = 22144
      BackColorFace = 13036799
      BackColorGrad = clWhite
      ForeColorFace = 10215167
      ForeColorGrad = 31671
      SmoothCorners = False
      ColorScheme = csDesert
      Max = 100
      Min = 0
      Position = 0
      Step = 10
      Orientation = pbHorizontal
    end
  end
  object StatusButtonClose: TBitBtnEx
    Left = 1152
    Top = 562
    Width = 73
    Height = 26
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    OnClick = StatusButtonCloseClick
    ImageIndex = 0
    Images = FormMain.IL_MiscToolBarPopup
    UseCustomDraw = True
  end
end
