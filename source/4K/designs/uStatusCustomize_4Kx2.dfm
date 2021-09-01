object FormStatusCustomize4Kx2: TFormStatusCustomize4Kx2
  Left = 239
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Customize Splash Screen (4K x2)'
  ClientHeight = 1800
  ClientWidth = 3417
  Color = 2565927
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 30
  object ImageBk: TImage32
    Left = 0
    Top = 0
    Width = 2940
    Height = 1800
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object LabelTimer: TShadowLabel
      Left = 14
      Top = 1730
      Width = 131
      Height = 27
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlue
      ShadowOffset = 3
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelStatusType: TShadowLabel
      Left = 159
      Top = 1726
      Width = 1185
      Height = 32
      AutoSize = False
      Caption = 
        'Force Incomplete Games Available [.zip; .7z]: Supermodel: A Sega' +
        ' Model 3 Arcade Emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGreen
      ShadowOffset = 3
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelVersion: TShadowLabel
      Left = 70
      Top = 698
      Width = 108
      Height = 35
      Alignment = taCenter
      AutoSize = False
      Caption = 'v44.64.06'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clRed
      ShadowOffset = 3
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSoftwareScanCount: TShadowLabel
      Left = 14
      Top = 1765
      Width = 163
      Height = 27
      Hint = '%.3u of %u'
      AutoSize = False
      Caption = '000 of 000'
      Font.Charset = OEM_CHARSET
      Font.Color = clAqua
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlue
      ShadowOffset = 3
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelMessage: TShadowLabel
      Left = 191
      Top = 1763
      Width = 1153
      Height = 28
      AutoSize = False
      Caption = 
        'Parsing "hbmame_listxml.xml" (3rd pass). Adding parent sections ' +
        'and listing parents with BIOS.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clRed
      ShadowOffset = 3
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
  end
  object SplashScreenSettingsBox: TPanelEx
    Left = 2959
    Top = 20
    Width = 438
    Height = 125
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
      Width = 436
      Height = 36
      Align = alTop
      AutoSize = False
      Caption = 'Logo Image Settings'
      CaptionIndent = 9
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
    object SplashScreenEnableTextsAlternateLayout: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 82
      Width = 230
      Height = 36
      Hint = 'Left aligned texts layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = SplashScreenEnableTextsAlternateLayoutClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Alternate Text Layout'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object SplashScreenEnableAlternateLogoFile: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 39
      Width = 190
      Height = 36
      Hint = 'Use "resources\images\logo2.png" image file in the splash screen'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = SplashScreenEnableAlternateLogoFileClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Alternate Logo'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object SplashScreen4KUltraSize: TAdvOfficeCheckBoxEx
      Left = 256
      Top = 39
      Width = 175
      Height = 36
      Hint = 'Use "resources\images\logo2.png" image file in the splash screen'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = '4K Ultra Size x2'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
  end
  object SplashScreenSettingsTextFontColorsBox: TPanelEx
    Left = 2959
    Top = 165
    Width = 438
    Height = 1470
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
      Width = 436
      Height = 36
      Align = alTop
      AutoSize = False
      Caption = 'Text Font Colors'
      CaptionIndent = 9
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
    object SplashScreenTitleTextColorLabel: TShadowLabel
      Left = 10
      Top = 194
      Width = 40
      Height = 31
      Caption = 'Title'
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
    object SplashScreenMessageTextColorLabel: TShadowLabel
      Left = 10
      Top = 306
      Width = 83
      Height = 31
      Caption = 'Message'
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
    object SplashScreenTimerTextColorLabel: TShadowLabel
      Left = 10
      Top = 418
      Width = 53
      Height = 31
      Caption = 'Timer'
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
    object SplashScreenVersionInfoTextColorLabel: TShadowLabel
      Left = 10
      Top = 642
      Width = 69
      Height = 31
      Caption = 'Version'
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
    object SplashScreenSoftwareTextColorLabel: TShadowLabel
      Left = 10
      Top = 530
      Width = 82
      Height = 31
      Caption = 'Software'
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
    object SplashScreenVersionInfoPositionXPosLabel: TShadowLabel
      Left = 109
      Top = 754
      Width = 34
      Height = 31
      Caption = '000'
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
    object SplashScreenVersionInfoPositionYPosLabel: TShadowLabel
      Left = 109
      Top = 835
      Width = 34
      Height = 31
      Caption = '000'
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
    object ColorsBoxButtonDefault: TSpeedButtonEx
      Left = 16
      Top = 1416
      Width = 114
      Height = 36
      Hint = 'Reset colors to default'
      Caption = 'Colors'
      CaptionVertIndent = -1
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 5
      Images = FormMain.IL_Misc_Large
      ParentFont = False
      OnClick = ColorsBoxButtonDefaultClick
    end
    object VersionInfoPositionButtonDefault: TSpeedButtonEx
      Tag = 1
      Left = 147
      Top = 1416
      Width = 122
      Height = 36
      Hint = 'Reset version info position to default'
      Caption = 'Version'
      CaptionVertIndent = -1
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 5
      Images = FormMain.IL_Misc_Large
      ParentFont = False
      OnClick = VersionInfoPositionButtonDefaultClick
    end
    object SplashScreenVersionInfoPositionXLabel: TShadowLabel
      Left = 10
      Top = 754
      Width = 87
      Height = 31
      Caption = 'Version X'
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
    object SplashScreenVersionInfoPositionYLabel: TShadowLabel
      Left = 10
      Top = 835
      Width = 87
      Height = 31
      Caption = 'Version Y'
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
    object SplashScreenProgressBarColorSchemeLabel: TShadowLabel
      Left = 10
      Top = 928
      Width = 80
      Height = 31
      Caption = 'Progress'
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
    object ProgressBarSchemeButtonDefault: TSpeedButtonEx
      Tag = 1
      Left = 287
      Top = 1416
      Width = 133
      Height = 36
      Hint = 'Reset progress bar color scheme to default'
      Caption = 'Progress'
      CaptionVertIndent = -1
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 5
      Images = FormMain.IL_Misc_Large
      ParentFont = False
      OnClick = ProgressBarSchemeButtonDefaultClick
    end
    object SplashScreenProgressBarColorBackTopLabel: TShadowLabel
      Left = 10
      Top = 984
      Width = 62
      Height = 31
      Caption = 'Bk Top'
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
    object SplashScreenProgressBarColorBackDownLabel: TShadowLabel
      Left = 10
      Top = 1040
      Width = 83
      Height = 31
      Caption = 'Bk Down'
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
    object SplashScreenProgressBarColorBarTopLabel: TShadowLabel
      Left = 10
      Top = 1152
      Width = 70
      Height = 31
      Caption = 'Bar Top'
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
    object SplashScreenProgressBarColorBarDownLabel: TShadowLabel
      Left = 10
      Top = 1208
      Width = 91
      Height = 31
      Caption = 'Bar Down'
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
    object SplashScreenProgressBarColorBackBorderLabel: TShadowLabel
      Left = 10
      Top = 1096
      Width = 64
      Height = 31
      Caption = 'Bk Out'
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
    object SplashScreenTextShadowColorAllLabel: TShadowLabel
      Left = 10
      Top = 82
      Width = 83
      Height = 31
      Caption = 'Shadows'
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
    object SplashScreenTitleShadowColorLabel: TShadowLabel
      Left = 10
      Top = 250
      Width = 74
      Height = 31
      Caption = 'Shadow'
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
    object SplashScreenMessageShadowColorLabel: TShadowLabel
      Left = 10
      Top = 362
      Width = 74
      Height = 31
      Caption = 'Shadow'
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
    object SplashScreenTimerShadowColorLabel: TShadowLabel
      Left = 10
      Top = 474
      Width = 74
      Height = 31
      Caption = 'Shadow'
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
    object SplashScreenSoftwareShadowColorLabel: TShadowLabel
      Left = 10
      Top = 586
      Width = 74
      Height = 31
      Caption = 'Shadow'
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
    object SplashScreenVersionInfoShadowColorLabel: TShadowLabel
      Left = 10
      Top = 698
      Width = 74
      Height = 31
      Caption = 'Shadow'
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
    object SplashScreenTextShadowDistanceLabel: TShadowLabel
      Left = 10
      Top = 138
      Width = 81
      Height = 31
      Caption = 'Distance'
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
    object SplashScreenTextShadowDistancePosLabel: TShadowLabel
      Left = 269
      Top = 137
      Width = 12
      Height = 31
      Caption = '0'
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
    object SplashScreenTitleTextColor: TColorBoxEx
      Left = 109
      Top = 191
      Width = 312
      Height = 36
      Hint = 'Font Color For The Title Text'
      DefaultColorColor = clYellow
      NoneColorColor = clNone
      Selected = clYellow
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 0
      OnSelect = SplashScreenTitleTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenMessageTextColor: TColorBoxEx
      Left = 109
      Top = 303
      Width = 312
      Height = 36
      Hint = 'Font Color For The Message Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 1
      OnSelect = SplashScreenMessageTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenTimerTextColor: TColorBoxEx
      Left = 109
      Top = 415
      Width = 312
      Height = 36
      Hint = 'Font Color For The Timer Text'
      DefaultColorColor = clLime
      NoneColorColor = clNone
      Selected = clLime
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 2
      OnSelect = SplashScreenTimerTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoTextColor: TColorBoxEx
      Left = 109
      Top = 639
      Width = 312
      Height = 36
      Hint = 'Font Color For The Version Info Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 3
      OnSelect = SplashScreenVersionInfoTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenSoftwareTextColor: TColorBoxEx
      Left = 109
      Top = 527
      Width = 312
      Height = 36
      Hint = 'Font Color For The MAME Software Counter Text'
      DefaultColorColor = clAqua
      NoneColorColor = clNone
      Selected = clAqua
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 4
      OnSelect = SplashScreenSoftwareTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoPositionX: TGaugeBar
      Left = 10
      Top = 788
      Width = 412
      Height = 36
      Hint = 'Version info left position'
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
      LargeChange = 10
      Max = 1840
      Min = 4
      ShowHandleGrip = True
      Style = rbsMac
      Position = 24
      OnChange = SplashScreenVersionInfoPositionXChange
    end
    object SplashScreenVersionInfoPositionY: TGaugeBar
      Left = 10
      Top = 869
      Width = 412
      Height = 36
      Hint = 'Version info top position'
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
      LargeChange = 10
      Max = 1157
      ShowHandleGrip = True
      Style = rbsMac
      Position = 698
      OnChange = SplashScreenVersionInfoPositionYChange
    end
    object SplashScreenProgressBarColorScheme: TComboBox2Ex
      Left = 109
      Top = 925
      Width = 312
      Height = 36
      Hint = 'Color Scheme For The Progress Bar'
      Style = csOwnerDrawFixed
      Color = clWhite
      ItemHeight = 30
      ItemIndex = 1
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
      Left = 109
      Top = 981
      Width = 312
      Height = 36
      Hint = 'Background Top Color For The Progress Bar'
      NoneColorColor = clNone
      Selected = 16448250
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 8
      OnSelect = SplashScreenProgressBarColorBackTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackDown: TColorBoxEx
      Left = 109
      Top = 1037
      Width = 312
      Height = 36
      Hint = 'Background Bottom Color For The Progress Bar'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 9
      OnSelect = SplashScreenProgressBarColorBackDownSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackBorder: TColorBoxEx
      Left = 109
      Top = 1093
      Width = 312
      Height = 36
      Hint = 'Background Border Color For The Progress Bar'
      DefaultColorColor = 22144
      NoneColorColor = clNone
      Selected = 22144
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 10
      OnSelect = SplashScreenProgressBarColorBackBorderSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarTop: TColorBoxEx
      Left = 109
      Top = 1149
      Width = 312
      Height = 36
      Hint = 'Bar Top Color For The Progress Bar'
      DefaultColorColor = 10215167
      NoneColorColor = clNone
      Selected = 10215167
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 11
      OnSelect = SplashScreenProgressBarColorBarTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarDown: TColorBoxEx
      Left = 109
      Top = 1205
      Width = 312
      Height = 36
      Hint = 'Bar Bottom Color For The Progress Bar'
      DefaultColorColor = 31671
      NoneColorColor = clNone
      Selected = 31671
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 12
      OnSelect = SplashScreenProgressBarColorBarDownSelect
      CustomColorsEnabled = True
    end
    object ProgressBarCopyCurrentColorsToCustomButton: TBitBtnEx
      Left = 108
      Top = 1261
      Width = 314
      Height = 36
      Hint = 'Copy progress bar'#39's current color scheme to custom colors scheme'
      Caption = 'Copy Current Colors To Custom'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = ProgressBarCopyCurrentColorsToCustomButtonClick
      CaptionVertIndent = -1
      UseCustomDraw = True
    end
    object SplashScreenTextShadowColorAll: TColorBoxEx
      Left = 109
      Top = 79
      Width = 312
      Height = 36
      Hint = 'Background Top Color For The Progress Bar'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 14
      CustomColorsEnabled = True
    end
    object SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 39
      Width = 182
      Height = 36
      Hint = 'Show shadow in black color'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = SplashScreenShowTextShadowsClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Shadows'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object SplashScreenTitleShadowColor: TColorBoxEx
      Left = 109
      Top = 247
      Width = 312
      Height = 36
      Hint = 'Font Color For The Title Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 16
      CustomColorsEnabled = True
    end
    object SplashScreenMessageShadowColor: TColorBoxEx
      Left = 109
      Top = 359
      Width = 312
      Height = 36
      Hint = 'Font Color For The Message Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 17
      CustomColorsEnabled = True
    end
    object SplashScreenTimerShadowColor: TColorBoxEx
      Left = 109
      Top = 471
      Width = 312
      Height = 36
      Hint = 'Font Color For The Timer Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 18
      CustomColorsEnabled = True
    end
    object SplashScreenSoftwareShadowColor: TColorBoxEx
      Left = 109
      Top = 583
      Width = 312
      Height = 36
      Hint = 'Font Color For The MAME Software Counter Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 19
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoShadowColor: TColorBoxEx
      Left = 109
      Top = 695
      Width = 312
      Height = 36
      Hint = 'Font Color For The Version Info Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 30
      TabOrder = 20
      CustomColorsEnabled = True
    end
    object SplashScreenTextShadowDistance: TGaugeBar
      Left = 109
      Top = 135
      Width = 155
      Height = 36
      Hint = 'Text Shadow Distance'
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
      LargeChange = 10
      Max = 3
      Min = 1
      ShowHandleGrip = True
      Style = rbsMac
      Position = 3
    end
    object SplashScreenTextShadowColor_OneColor: TAdvOfficeCheckBoxEx
      Left = 299
      Top = 39
      Width = 123
      Height = 36
      Hint = 
        'Use the same shadow color on all texts'#13#10'(uncheck to show a custo' +
        'm shadow color on each text)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      Alignment = taRightJustify
      ButtonVertAlign = tlCenter
      Caption = 'One Color'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
  end
  object ProgressBarPanel: TPanelEx
    Left = 14
    Top = 1693
    Width = 130
    Height = 25
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
      Width = 130
      Height = 25
      ColorBorder = 22144
      BackColorFace = 13036799
      BackColorGrad = clWhite
      ForeColorFace = 10215167
      ForeColorGrad = 31671
      SmoothCorners = False
      ColorScheme = csDesert
      Max = 100
      Min = 0
      Position = 60
      Step = 10
      Orientation = pbHorizontal
    end
  end
  object StatusButtonClose: TBitBtnEx
    Left = 3128
    Top = 1735
    Width = 100
    Height = 45
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = StatusButtonCloseClick
    CaptionVertIndent = -1
    ImageIndex = 0
    Images = FormMain.IL_MiscToolBarPopup
    UseCustomDraw = True
  end
end
