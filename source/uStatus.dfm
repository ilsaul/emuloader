object FormStatus: TFormStatus
  Left = 1266
  Top = 696
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Splash Screen'
  ClientHeight = 641
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
    OnDragDrop = ImageBkDragDrop
    OnDragOver = ImageBkDragOver
    OnMouseDown = ImageBkMouseDown
    object LabelTimer: TShadowLabel
      Left = 4
      Top = 566
      Width = 67
      Height = 16
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
      Height = 19
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
    end
    object LabelVersion: TShadowLabel
      Left = 9
      Top = 228
      Width = 58
      Height = 15
      Hint = 'Drag and drop enabled'
      Alignment = taCenter
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
      ColorFrame = clWhite
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      OnDragDrop = LabelVersionDragDrop
      OnDragOver = LabelVersionDragOver
      OnEndDrag = LabelVersionEndDrag
      OnMouseDown = LabelVersionMouseDown
    end
    object LabelSoftwareScanCount: TShadowLabel
      Left = 4
      Top = 584
      Width = 83
      Height = 16
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
      Height = 17
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
    Left = 8
    Top = 608
    Width = 73
    Height = 26
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    OnClick = StatusButtonCloseClick
    ImageIndex = 0
    Images = FormMain.IL_MiscToolBarPopup
    UseCustomDraw = True
  end
  object SplashScreenSettingsTextFontColorsBox: TPanelEx
    Left = 984
    Top = 4
    Width = 248
    Height = 633
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
      Top = 89
      Width = 23
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
      Top = 144
      Width = 47
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
      Top = 199
      Width = 31
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
      Top = 309
      Width = 39
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
      Top = 254
      Width = 47
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
      Top = 573
      Width = 44
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
    object SplashScreenVersionInfoPositionXPosLabel: TShadowLabel
      Left = 224
      Top = 374
      Width = 19
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
    object SplashScreenVersionInfoPositionYPosLabel: TShadowLabel
      Left = 224
      Top = 398
      Width = 19
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
      Top = 603
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
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object VersionInfoPositionButtonDefault: TSpeedButtonEx
      Tag = 1
      Left = 83
      Top = 603
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
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object SplashScreenVersionInfoPositionXLabel: TShadowLabel
      Left = 4
      Top = 373
      Width = 49
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
    object SplashScreenVersionInfoPositionYLabel: TShadowLabel
      Left = 4
      Top = 397
      Width = 49
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
      Top = 437
      Width = 46
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
      Top = 603
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
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object SplashScreenProgressBarColorBackTopLabel: TShadowLabel
      Left = 4
      Top = 461
      Width = 36
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
      Top = 485
      Width = 48
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
      Top = 533
      Width = 40
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
      Top = 557
      Width = 52
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
      Top = 509
      Width = 37
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
    object SplashScreenTextShadowColorAllLabel: TShadowLabel
      Left = 4
      Top = 25
      Width = 48
      Height = 16
      Caption = 'Shadows'
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
      WordWrap = True
    end
    object SplashScreenTitleShadowColorLabel: TShadowLabel
      Left = 4
      Top = 113
      Width = 43
      Height = 16
      Caption = 'Shadow'
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
    object SplashScreenMessageShadowColorLabel: TShadowLabel
      Left = 4
      Top = 168
      Width = 43
      Height = 16
      Caption = 'Shadow'
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
    object SplashScreenTimerShadowColorLabel: TShadowLabel
      Left = 4
      Top = 223
      Width = 43
      Height = 16
      Caption = 'Shadow'
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
    object SplashScreenSoftwareShadowColorLabel: TShadowLabel
      Left = 4
      Top = 278
      Width = 43
      Height = 16
      Caption = 'Shadow'
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
    object SplashScreenVersionInfoShadowColorLabel: TShadowLabel
      Left = 4
      Top = 333
      Width = 43
      Height = 16
      Caption = 'Shadow'
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
    object SplashScreenTextShadowDistanceLabel: TShadowLabel
      Left = 4
      Top = 49
      Width = 46
      Height = 16
      Caption = 'Distance'
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
    object SplashScreenTextShadowDistancePosLabel: TShadowLabel
      Left = 135
      Top = 49
      Width = 7
      Height = 16
      Caption = '1'
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
    object SplashScreenTitleTextColor: TColorBoxEx
      Left = 57
      Top = 86
      Width = 185
      Height = 22
      Hint = 'Font Color For The Title Text'
      DefaultColorColor = clYellow
      NoneColorColor = clNone
      Selected = clYellow
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 0
      OnSelect = SplashScreenTitleTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenMessageTextColor: TColorBoxEx
      Left = 57
      Top = 141
      Width = 185
      Height = 22
      Hint = 'Font Color For The Message Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 1
      OnSelect = SplashScreenMessageTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenTimerTextColor: TColorBoxEx
      Left = 57
      Top = 196
      Width = 185
      Height = 22
      Hint = 'Font Color For The Timer Text'
      DefaultColorColor = clLime
      NoneColorColor = clNone
      Selected = clLime
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 2
      OnSelect = SplashScreenTimerTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoTextColor: TColorBoxEx
      Left = 57
      Top = 306
      Width = 185
      Height = 22
      Hint = 'Font Color For The Version Info Text'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 3
      OnSelect = SplashScreenVersionInfoTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenSoftwareTextColor: TColorBoxEx
      Left = 57
      Top = 251
      Width = 185
      Height = 22
      Hint = 'Font Color For The MAME Software Counter Text'
      DefaultColorColor = clAqua
      NoneColorColor = clNone
      Selected = clAqua
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 4
      OnSelect = SplashScreenSoftwareTextColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoPositionX: TGaugeBar
      Left = 57
      Top = 370
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
      Top = 394
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
      Top = 434
      Width = 136
      Height = 21
      Hint = 'Color Scheme For The Progress Bar'
      Style = csOwnerDrawFixed
      Color = clWhite
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 7
      Text = 'Custom Colors'
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
      Top = 458
      Width = 185
      Height = 22
      Hint = 'Background Top Color For The Progress Bar'
      DefaultColorColor = 13036799
      NoneColorColor = clNone
      Selected = 13036799
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 8
      OnSelect = SplashScreenProgressBarColorBackTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackDown: TColorBoxEx
      Left = 57
      Top = 482
      Width = 185
      Height = 22
      Hint = 'Background Bottom Color For The Progress Bar'
      DefaultColorColor = clWhite
      NoneColorColor = clNone
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 9
      OnSelect = SplashScreenProgressBarColorBackDownSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBackBorder: TColorBoxEx
      Left = 57
      Top = 506
      Width = 185
      Height = 22
      Hint = 'Background Border Color For The Progress Bar'
      DefaultColorColor = 22144
      NoneColorColor = clNone
      Selected = 22144
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 10
      OnSelect = SplashScreenProgressBarColorBackBorderSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarTop: TColorBoxEx
      Left = 57
      Top = 530
      Width = 185
      Height = 22
      Hint = 'Bar Top Color For The Progress Bar'
      DefaultColorColor = 10215167
      NoneColorColor = clNone
      Selected = 10215167
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 11
      OnSelect = SplashScreenProgressBarColorBarTopSelect
      CustomColorsEnabled = True
    end
    object SplashScreenProgressBarColorBarDown: TColorBoxEx
      Left = 57
      Top = 554
      Width = 185
      Height = 22
      Hint = 'Bar Bottom Color For The Progress Bar'
      DefaultColorColor = 31671
      NoneColorColor = clNone
      Selected = 31671
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 12
      OnSelect = SplashScreenProgressBarColorBarDownSelect
      CustomColorsEnabled = True
    end
    object ProgressBarCopyCurrentColorsToCustomButton: TBitBtnEx
      Left = 197
      Top = 434
      Width = 45
      Height = 21
      Hint = 'Copy progress bar'#39's current color scheme to custom colors scheme'
      Caption = 'Copy'
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
    object SplashScreenTextShadowColorAll: TColorBoxEx
      Left = 57
      Top = 22
      Width = 185
      Height = 22
      Hint = 'Font Color For The Text Shadows'#13#10'One Color To Rule Them All'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 14
      OnSelect = SplashScreenTextShadowColorAllSelect
      CustomColorsEnabled = True
    end
    object SplashScreenTitleShadowColor: TColorBoxEx
      Left = 57
      Top = 110
      Width = 185
      Height = 22
      Hint = 'Font Color For The Title Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 15
      OnSelect = SplashScreenTitleShadowColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenMessageShadowColor: TColorBoxEx
      Left = 57
      Top = 165
      Width = 185
      Height = 22
      Hint = 'Font Color For The Message Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 16
      OnSelect = SplashScreenMessageShadowColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenTimerShadowColor: TColorBoxEx
      Left = 57
      Top = 220
      Width = 185
      Height = 22
      Hint = 'Font Color For The Timer Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 17
      OnSelect = SplashScreenTimerShadowColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenSoftwareShadowColor: TColorBoxEx
      Left = 57
      Top = 275
      Width = 185
      Height = 22
      Hint = 'Font Color For The MAME Software Counter Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 18
      OnSelect = SplashScreenSoftwareShadowColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenVersionInfoShadowColor: TColorBoxEx
      Left = 57
      Top = 330
      Width = 185
      Height = 22
      Hint = 'Font Color For The Version Info Shadow'
      NoneColorColor = clNone
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      ItemHeight = 16
      TabOrder = 19
      OnSelect = SplashScreenVersionInfoShadowColorSelect
      CustomColorsEnabled = True
    end
    object SplashScreenShowTextShadows: TAdvOfficeCheckBoxEx
      Left = 140
      Top = -1
      Width = 105
      Height = 18
      Hint = 'Show shadows in texts'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnClick = SplashScreenShowTextShadowsClick
      Alignment = taLeftJustify
      Caption = 'Enable Shadows'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
    object SplashScreenTextShadowDistance: TGaugeBar
      Left = 57
      Top = 46
      Width = 75
      Height = 22
      Hint = 'Text Shadow Distance'
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
      Max = 3
      Min = 1
      ShowHandleGrip = True
      Style = rbsMac
      Position = 1
      OnChange = SplashScreenTextShadowDistanceChange
    end
    object SplashScreenTextShadowColor_OneColor: TAdvOfficeCheckBoxEx
      Left = 169
      Top = 47
      Width = 72
      Height = 18
      Hint = 
        'Use the same shadow color on all texts'#13#10'(uncheck to show a custo' +
        'm shadow color on each text)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      OnClick = SplashScreenTextShadowColor_OneColorClick
      Alignment = taRightJustify
      Caption = 'One Color'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
  end
  object SplashScreenSettingsBox: TPanelEx
    Left = 732
    Top = 604
    Width = 248
    Height = 33
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
      Left = 115
      Top = 10
      Width = 130
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
      Caption = 'Alternate Text Layout'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
    object SplashScreenEnableAlternateLogoFile: TAdvOfficeCheckBoxEx
      Left = 4
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
      TabOrder = 1
      OnClick = SplashScreenEnableAlternateLogoFileClick
      Alignment = taLeftJustify
      Caption = 'Alternate Logo'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
  end
  object SplashScreen4KUltraSize: TAdvOfficeCheckBoxEx
    Left = 604
    Top = 610
    Width = 100
    Height = 18
    Hint = 'Enable 4K logo double size (insane mode)'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = SplashScreen4KUltraSizeClick
    Alignment = taLeftJustify
    Caption = '4K Ultra Size x2'
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
  end
end
