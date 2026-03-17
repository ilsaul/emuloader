object FormMAMESettings: TFormMAMESettings
  Left = 48
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 1629
  ClientWidth = 3753
  Color = clMoneyGreen
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ButtonPageFolders: TSpeedButtonEx
    Tag = 1
    Left = 361
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Down = True
    Caption = 'Folders'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageVideo1: TSpeedButtonEx
    Tag = 2
    Left = 427
    Top = 80
    Width = 57
    Height = 22
    GroupIndex = 1
    Caption = 'Video'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageVideo2: TSpeedButtonEx
    Tag = 3
    Left = 484
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Caption = 'Video 2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageVideo3: TSpeedButtonEx
    Tag = 4
    Left = 550
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Caption = 'Video 3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageLUAandAudio: TSpeedButtonEx
    Tag = 5
    Left = 616
    Top = 80
    Width = 101
    Height = 22
    GroupIndex = 1
    Caption = 'LUA and Audio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageInput: TSpeedButtonEx
    Tag = 6
    Left = 717
    Top = 80
    Width = 57
    Height = 22
    GroupIndex = 1
    Caption = 'Input'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageMisc: TSpeedButtonEx
    Tag = 7
    Left = 774
    Top = 80
    Width = 96
    Height = 22
    GroupIndex = 1
    Caption = 'Miscellaneous'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageSDLMAMEInput: TSpeedButtonEx
    Tag = 8
    Left = 870
    Top = 80
    Width = 49
    Height = 22
    GroupIndex = 1
    Caption = 'SDL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ShadowLabel2: TShadowLabel
    Left = 1048
    Top = 640
    Width = 690
    Height = 22
    Caption = 
      'Note: HLSL and GLSL panels are 34 pixels smaller and must be set' +
      ' as child of BGFX panel in runtime'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clSilver
    ShadowEnabled = True
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Visible = False
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 3753
    Height = 80
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 840
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 48
      Width = 700
      Height = 27
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
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
      Layout = tlCenter
      WordWrap = True
    end
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 828
      Top = 45
      Width = 107
      Height = 29
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
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
      WordWrap = True
    end
  end
  object Panel3_Video2: TPanelEx
    Left = 1872
    Top = 101
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ScreensGroupBox: TPanelEx
      Left = 8
      Top = 249
      Width = 216
      Height = 217
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
      object ScreensGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Screens'
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
      object ScreenNameLabel: TShadowLabel
        Left = 8
        Top = 77
        Width = 33
        Height = 16
        Hint = 'Explicit name of'
        Caption = 'Name'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenAspectRatioLabel: TShadowLabel
        Left = 127
        Top = 123
        Width = 67
        Height = 16
        Hint = 'Aspect ratio of'
        Caption = 'Aspect Ratio'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenResolutionLabel: TShadowLabel
        Left = 8
        Top = 169
        Width = 57
        Height = 16
        Hint = 'Preferred resolution of'
        Caption = 'Resolution'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenRefreshRateLabel: TShadowLabel
        Left = 128
        Top = 169
        Width = 15
        Height = 16
        Caption = 'Hz'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenViewLabel: TShadowLabel
        Left = 7
        Top = 123
        Width = 26
        Height = 16
        Hint = 'Preferred view for'
        Caption = 'View'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NumberScreensLabel: TShadowLabel
        Left = 11
        Top = 48
        Width = 43
        Height = 14
        Caption = '1 2 3 4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenName: TComboBox2Ex
        Left = 8
        Top = 93
        Width = 198
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Auto'
        OnSelect = ScreenNameSelect
        Items.Strings = (
          'Auto'
          '\\.\DISPLAY1'
          '\\.\DISPLAY2'
          '\\.\DISPLAY3'
          '\\.\DISPLAY4'
          '\\.\DISPLAY5'
          '\\.\DISPLAY6'
          '\\.\DISPLAY7'
          '\\.\DISPLAY8')
      end
      object ScreenAspectRatio: TComboBox2Ex
        Left = 127
        Top = 139
        Width = 79
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'Auto'
        OnSelect = ScreenAspectRatioSelect
        Items.Strings = (
          'Auto'
          '16:9'
          '4:3'
          '16:10'
          '3:2'
          '3:4'
          '5:2'
          '5:3')
      end
      object ScreenResolution: TComboBox2Ex
        Left = 8
        Top = 185
        Width = 99
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Auto'
        OnSelect = ScreenResolutionSelect
        Items.Strings = (
          'Auto'
          '0x0'
          '320x200'
          '320x240'
          '400x300'
          '480x360'
          '512x384'
          '640x400'
          '640x480'
          '720x480'
          '720x576'
          '800x600'
          '848x480'
          '960x600'
          '1024x768'
          '1088x612'
          '1152x864'
          '1280x720'
          '1280x768'
          '1280x800'
          '1280x960'
          '1280x1024'
          '1360x768'
          '1440s900'
          '1600x900'
          '1600x1024'
          '1600x1200'
          '1680x1050'
          '1920x1080'
          '1920x1200'
          '1920x1440'
          '2048x1536')
      end
      object ScreenRefreshRate: TComboBox2Ex
        Left = 127
        Top = 185
        Width = 79
        Height = 23
        Hint = 'Screen refresh rate'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = 'Auto'
        OnSelect = ScreenRefreshRateSelect
        Items.Strings = (
          'Auto'
          '50'
          '59'
          '60'
          '70'
          '72'
          '75'
          '85'
          '100'
          '120'
          '140'
          '144'
          '150'
          '170'
          '200'
          '240')
      end
      object ScreenView: TComboBox2Ex
        Left = 8
        Top = 139
        Width = 99
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'Auto'
        OnSelect = ScreenViewSelect
        Items.Strings = (
          'Auto'
          'Standard'
          'Native'
          'Pixel Aspect'
          'Cocktail'
          'Cropped'
          'Stretched')
      end
      object ScreensSelector: TComboBox2Ex
        Tag = -1
        Left = 117
        Top = 22
        Width = 89
        Height = 23
        Hint = 'Select the screen you want to configure'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        Text = 'All Screens'
        OnSelect = ScreensSelectorSelect
        Items.Strings = (
          'All Screens'
          'Screen 1'
          'Screen 2'
          'Screen 3'
          'Screen 4')
      end
      object ScreenButtonDefaultSettings: TBitBtnEx
        Left = 168
        Top = 48
        Width = 38
        Height = 21
        Hint = 'Set default values for the selected screen'
        Caption = 'Reset'
        TabOrder = 6
        OnClick = ScreenButtonDefaultSettingsClick
      end
      object NumberScreens: TXiTrackBar
        Left = 8
        Top = 20
        Width = 47
        Height = 28
        Hint = 'Number of screens to create (usually you want just one)'
        BackColor = 15856113
        TickColor = 7500402
        DisabledTickColor = clSilver
        SlideBorderColor = 7500402
        SlideFaceColor = clWhite
        SlideGradColor = 15395562
        DisabledSlideBorderColor = 12500670
        DisabledSlideFaceColor = 14211288
        DisabledSlideGradColor = 15263976
        DisabledThumbBorderColor = 11908533
        DisabledThumbFaceColor = 15395562
        DisabledThumbGradColor = 13619151
        ThumbBorderColor = 6381921
        ThumbFaceColor = clWhite
        ThumbGradColor = 14145495
        OverThumbBorderColor = 7631988
        OverThumbFaceColor = 13750737
        OverThumbGradColor = 9803157
        DownThumbBorderColor = 7631988
        DownThumbFaceColor = 10066329
        DownThumbGradColor = 12698049
        SmoothCorners = True
        ColorScheme = csWhite
        Max = 4
        Min = 1
        Position = 1
        TickStyle = tsAuto
        TickMarks = tmBottomRight
        Orientation = trHorizontal
      end
    end
    object SnapshotsGroupBox: TPanelEx
      Left = 240
      Top = 249
      Width = 216
      Height = 217
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
      object SnapshotsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Snapshots / Movies'
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
      object SnapNameLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 74
        Height = 16
        Caption = 'Name Format'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SnapViewLabel: TShadowLabel
        Left = 8
        Top = 64
        Width = 26
        Height = 16
        Caption = 'View'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SnapSizeCustomXLabel: TShadowLabel
        Left = 113
        Top = 136
        Width = 8
        Height = 16
        Caption = 'X'
        Enabled = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SnapSizeCustomLabel: TShadowLabel
        Left = 24
        Top = 136
        Width = 43
        Height = 16
        Caption = 'Custom'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SnapBurnIn: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 179
        Width = 113
        Height = 20
        Hint = 'Create burn-in snapshots for each screen'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Burn-in Snapshot'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SnapNameButtonDefault: TBitBtnEx
        Left = 163
        Top = 36
        Width = 43
        Height = 21
        Hint = 'Set default snapshot name'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = SnapNameButtonDefaultClick
      end
      object SnapView: TComboBox2Ex
        Left = 8
        Top = 80
        Width = 151
        Height = 23
        Hint = 
          'Specify snapshot/movie view'#13#10'Select the default '#39'internal'#39' to us' +
          'e internal pixel-aspect views'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Internal'
        Items.Strings = (
          'Internal'
          'Auto'
          'Standard'
          'Native'
          'Pixel Aspect'
          'Cocktail')
      end
      object SnapViewButtonDefault: TBitBtnEx
        Left = 163
        Top = 80
        Width = 43
        Height = 21
        Hint = 'Set default snapshot / movie view'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = SnapViewButtonDefaultClick
      end
      object SnapSizeAuto: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 113
        Width = 106
        Height = 20
        Hint = 'Set resolution to game'#39's original size (raw pixels)'
        Checked = True
        TabOrder = 4
        OnClick = SnapSizeAutoClick
        Alignment = taLeftJustify
        Caption = 'Auto Resolution'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SnapSizeWidth: TEditEx
        Left = 69
        Top = 133
        Width = 41
        Height = 21
        Hint = 'Custom resolution width'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyPress = SnapSizeWidthKeyPress
      end
      object SnapSizeHeight: TEditEx
        Left = 124
        Top = 133
        Width = 41
        Height = 21
        Hint = 'Custom resolution height'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyPress = SnapSizeHeightKeyPress
      end
      object SnapName: TEditEx
        Left = 8
        Top = 36
        Width = 151
        Height = 21
        Hint = 
          'Override the default snapshot naming; %g == gamename, %i == inde' +
          'x'
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object SnapBilinear: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 159
        Width = 123
        Height = 20
        Hint = 
          'Specify if the snapshot/movie should have bilinear filtering app' +
          'lied'
        Checked = True
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Apply Bilinear Filter'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PerformanceGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 448
      Height = 221
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
      object PerformanceGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Performance'
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
      object SpeedLabel: TShadowLabel
        Left = 8
        Top = 132
        Width = 160
        Height = 16
        Hint = 'Gameplay Speed [%3.2f]'
        AutoSize = False
        Caption = 'Gameplay Speed [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object FrameskipLabel: TShadowLabel
        Left = 158
        Top = 86
        Width = 55
        Height = 16
        Caption = 'Frameskip'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ThreadPriorityLabel: TShadowLabel
        Left = 308
        Top = 86
        Width = 78
        Height = 16
        Caption = 'Thread Priority'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object NumberProcessorsLabel: TShadowLabel
        Left = 8
        Top = 86
        Width = 53
        Height = 16
        Caption = '# of CPUs'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object BenchmarkLabel: TShadowLabel
        Left = 233
        Top = 132
        Width = 160
        Height = 16
        Hint = 'sec'
        AutoSize = False
        Caption = 'Benchmark [00:00 sec]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object SecondsToRunLabel: TShadowLabel
        Left = 8
        Top = 175
        Width = 310
        Height = 16
        Hint = 'secs'
        AutoSize = False
        Caption = 'Time to Run Before Automatically Exiting [00:00 sec]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object AutoFrameskip: TAdvOfficeCheckBoxEx
        Left = 158
        Top = 40
        Width = 103
        Height = 20
        Hint = 
          'Enable automatic frameskip adjustment to maintain emulation spee' +
          'd'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Auto Frameskip'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Throttle: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 40
        Width = 63
        Height = 20
        Hint = 'Throttle emulation to keep system running in sync with real time'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Throttle'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Sleep: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 55
        Height = 20
        Hint = 
          'Enable sleeping, which gives time back to other applications whe' +
          'n idle'
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Sleep'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Multithreading: TAdvOfficeCheckBoxEx
        Left = 158
        Top = 20
        Width = 130
        Height = 20
        Hint = 
          'Enable multithreading; this enables rendering and blitting on a ' +
          'separate thread'
        Enabled = False
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Multithreading'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RefreshSpeed: TAdvOfficeCheckBoxEx
        Left = 308
        Top = 40
        Width = 100
        Height = 20
        Hint = 
          'Automatically adjust emulation speed to keep the emulated refres' +
          'h rate slower than the host screen'
        Checked = True
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Refresh Speed'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SyncronizeRefreshRate: TAdvOfficeCheckBoxEx
        Left = 308
        Top = 20
        Width = 130
        Height = 20
        Hint = 
          'Enables speed throttling only to the refresh of your monitor'#13#10'Th' +
          'is means that the game'#39's actual refresh rate is ignored'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Sync Refresh Rate'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Speed: TGaugeBar2
        Left = 8
        Top = 148
        Width = 205
        Height = 20
        Hint = 
          'Controls the speed of gameplay, relative to realtime; smaller nu' +
          'mbers are slower'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.500000000000000000
        Max = 100.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.100000001490116100
        Position = 1.000000000000000000
        OnChange = SpeedChange
        OnMouseDown = SpeedMouseDown
      end
      object Frameskip: TComboBox2Ex
        Left = 158
        Top = 102
        Width = 130
        Height = 23
        Hint = 'Set frameskip to fixed value (autoframeskip must be disabled)'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 7
        Text = '0 (Default)'
        Items.Strings = (
          '0 (Default)'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object ThreadPriority: TComboBox2Ex
        Left = 308
        Top = 102
        Width = 130
        Height = 23
        Hint = 'Thread priority for the main game thread'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 15
        ParentFont = False
        TabOrder = 8
        Text = '0 (Normal)'
        Items.Strings = (
          '-15'
          '-14'
          '-13'
          '-12'
          '-11'
          '-10'
          '-9'
          '-8'
          '-7'
          '-6'
          '-5'
          '-4'
          '-3'
          '-2'
          '-1'
          '0 (Normal)'
          '1')
      end
      object NumberProcessors: TComboBox2Ex
        Left = 8
        Top = 102
        Width = 130
        Height = 23
        Hint = 
          'Specify the number of processors to use for work queues. Auto se' +
          'tting uses all CPUs found by the OS'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        Text = 'Auto'
        Items.Strings = (
          'Auto')
      end
      object Benchmark: TGaugeBar
        Tag = 14
        Left = 233
        Top = 148
        Width = 205
        Height = 20
        Hint = 'Implies: -video none -sound none -nothrottle'
        Color = clWindow
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 60
        Max = 900
        ShowHandleGrip = True
        Position = 0
        OnChange = BenchmarkChange
      end
      object SecondsToRun: TGaugeBar
        Tag = 14
        Left = 8
        Top = 191
        Width = 430
        Height = 20
        Hint = 'Time to Run Before Automatically Exiting ['
        Color = clWindow
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 60
        Max = 900
        ShowHint = False
        ShowHandleGrip = True
        Position = 0
        OnChange = SecondsToRunChange
      end
      object LowLatency: TAdvOfficeCheckBoxEx
        Left = 308
        Top = 60
        Width = 90
        Height = 20
        Hint = 'Draws new frame before throttling to reduce input latency'
        Enabled = False
        TabOrder = 12
        Alignment = taLeftJustify
        Caption = 'Low Latency'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
  end
  object Panel4_Video3a: TPanelEx
    Tag = 2
    Left = 2808
    Top = 101
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object VideoOutputModeLabel: TShadowLabel
      Left = 598
      Top = 15
      Width = 106
      Height = 16
      Caption = 'Video Output Mode'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonPageVideoEffectsBGFX: TSpeedButtonEx
      Tag = 1
      Left = 16
      Top = 12
      Width = 172
      Height = 22
      GroupIndex = 2
      Caption = 'BGFX Post-Processing Effects'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonPageVideoEffectsBGFXClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object ButtonPageVideoEffectsHLSL: TSpeedButtonEx
      Tag = 2
      Left = 188
      Top = 12
      Width = 188
      Height = 22
      GroupIndex = 2
      Down = True
      Caption = 'Direct3D Post-Processing Effects'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonPageVideoEffectsBGFXClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object ButtonPageVideoEffectsGLSL: TSpeedButtonEx
      Tag = 3
      Left = 376
      Top = 12
      Width = 185
      Height = 22
      GroupIndex = 2
      Caption = 'OpenGL Post-Processing Effects'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonPageVideoEffectsBGFXClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object VideoOutputMode: TComboBox2Ex
      Left = 708
      Top = 12
      Width = 185
      Height = 23
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object VideoOutputModeButtonHelp: TBitBtnEx
      Left = 896
      Top = 12
      Width = 23
      Height = 23
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = VideoOutputModeButtonHelpClick
    end
    object BGFXDebug: TAdvOfficeCheckBoxEx
      Left = 392
      Top = 46
      Width = 58
      Height = 20
      Hint = 'Debug for advance users'#13#10'Most users will not need to use this'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Debug'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object BGFXBackendGroupBox: TPanelEx
      Left = 8
      Top = 46
      Width = 363
      Height = 54
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
      object BGFXBackendGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 361
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'BGFX Backend to Use'
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
      object BGFXBackend: TComboBox2Ex
        Left = 8
        Top = 22
        Width = 345
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Direct3D 9'
          'Direct3D 11'
          'Direct3D 12 (Requires Windows 10 / Windows 11)'
          'OpenGL (Requires OpenGL drivers)'
          'OpenGL ES (Requires SDLMAME)'
          'Metal Apple Graphics API (Requires OS X 10.11 El Capitan)'
          'Vulkan (Requires Vulkan drivers)')
      end
    end
    object BGFXPathGroupBox: TPanelEx
      Left = 472
      Top = 46
      Width = 448
      Height = 53
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
      object BGFXPathGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to BGFX Files'
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
      object BGFXPath: TEditEx
        Left = 8
        Top = 22
        Width = 384
        Height = 21
        Hint = 'Path to BGFX related files'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object BGFXPathButtonSelect: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BGFXPathButtonSelectClick
      end
    end
    object BGFXShadowMaskTextureNameGroupBox: TPanelEx
      Left = 8
      Top = 116
      Width = 448
      Height = 53
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
      object BGFXShadowMaskTextureNameGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Shadow Mask Texture'
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
      object BGFXShadowMaskTextureNameButtonReset: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to set default filename'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BGFXShadowMaskTextureNameButtonResetClick
      end
      object BGFXShadowMaskTextureNameButtonSelect: TBitBtnEx
        Left = 349
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BGFXShadowMaskTextureNameButtonSelectClick
      end
      object BGFXShadowMaskTextureName: TEditEx
        Left = 8
        Top = 22
        Width = 338
        Height = 21
        Hint = 'Shadow mask texture filename'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object BGFXLUTTextureNameGroupBox: TPanelEx
      Left = 472
      Top = 116
      Width = 448
      Height = 53
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
      object BGFXLUTTextureNameGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'LUT Texture Name'
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
      object BGFXLUTTextureNameButtonReset: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to set default filename (empty)'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BGFXLUTTextureNameButtonResetClick
      end
      object BGFXLUTTextureNameButtonSelect: TBitBtnEx
        Left = 349
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BGFXLUTTextureNameButtonSelectClick
      end
      object BGFXLUTTextureName: TEditEx
        Left = 8
        Top = 22
        Width = 338
        Height = 21
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object BGFXScreenShaderChainsGroupBox: TPanelEx
      Left = 8
      Top = 185
      Width = 911
      Height = 314
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
      object BGFXScreenShaderChainsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 909
        Height = 18
        Hint = 'default'
        Align = alTop
        AutoSize = False
        Caption = 'Screen Shader Chains'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object BGFXScreenShaderChainsHelpLabel: TShadowLabel
        Left = 136
        Top = 0
        Width = 228
        Height = 16
        Caption = 'select a shader in the list or type in edit box'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object BGFXScreenShaderChainsDetailsHTMLLabel: TShadowLabel
        Left = 753
        Top = 0
        Width = 148
        Height = 16
        Hint = 
          'http://docs.mamedev.org/advanced/bgfx.html#configuration-setting' +
          's'
        Caption = '(click here for usage details)'
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
        OnClick = BGFXScreenShaderChainsDetailsHTMLLabelClick
        OnMouseEnter = BGFXScreenShaderChainsDetailsHTMLLabelMouseEnter
        OnMouseLeave = BGFXScreenShaderChainsDetailsHTMLLabelMouseLeave
      end
      object BGFXScreenShaderChainsButtonReset: TBitBtnEx
        Left = 858
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to reset shader to default value'
        Caption = 'Reset'
        TabOrder = 0
        OnClick = BGFXScreenShaderChainsButtonResetClick
      end
      object BGFXScreenShaderChainsButtonReload: TBitBtnEx
        Left = 808
        Top = 22
        Width = 47
        Height = 21
        Hint = 'Click here to reset shader to current value'
        Caption = 'Reload'
        TabOrder = 1
        OnClick = BGFXScreenShaderChainsButtonReloadClick
      end
      object BGFXScreenShaderChains: TEditEx
        Left = 8
        Top = 22
        Width = 797
        Height = 21
        Hint = 
          'Comma-delimited list of screen chain JSON names (without file ex' +
          'tension), colon-delimited per-window'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object BGFXScreenShaderChains_ListView: TEasyListview
        Left = 8
        Top = 53
        Width = 893
        Height = 227
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000083010000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          000101000000000000C8000000FFFFFF1F000100000001000000040000004E00
          61006D006500000000000000000000000000110000005445617379436F6C756D
          6E53746F726564FFFECE000600000080080001010001020000000000002C0100
          00FFFFFF1F0001000000010000000600000041007500740068006F0072000000
          00000000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
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
        TabOrder = 3
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnDblClick = BGFXScreenShaderChains_ListViewDblClick
        OnItemCompare = BGFXScreenShaderChains_ListViewItemCompare
        OnItemPaintText = BGFXScreenShaderChains_ListViewItemPaintText
      end
      object BGFXScreenShaderChainsButtonSelect: TBitBtnEx
        Left = 858
        Top = 283
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnClick = BGFXScreenShaderChainsButtonSelectClick
      end
      object BGFXScreenShaderChains_ListViewButtonAdd: TBitBtnEx
        Left = 79
        Top = 283
        Width = 43
        Height = 21
        Hint = 'Add selected shader to the list (for multiple screens games)'
        Caption = 'Add'
        TabOrder = 5
        OnClick = BGFXScreenShaderChains_ListViewButtonAddClick
      end
      object BGFXScreenShaderChains_ListViewButtonSelect: TBitBtnEx
        Left = 8
        Top = 283
        Width = 68
        Height = 21
        Hint = 
          'Click here to set selected shader active (mouse double-click in ' +
          'the list)'
        Caption = 'Set Active'
        TabOrder = 6
        OnClick = BGFXScreenShaderChains_ListViewButtonSelectClick
      end
    end
  end
  object Panel5_LUA: TPanelEx
    Left = 0
    Top = 1112
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object AudioGroupBox: TPanelEx
      Left = 317
      Top = 338
      Width = 293
      Height = 161
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
      object AudioGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Audio'
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
      object AudioLatencyLabel: TShadowLabel
        Left = 155
        Top = 66
        Width = 77
        Height = 16
        Caption = 'Audio Latency'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SampleRateLabel: TShadowLabel
        Left = 8
        Top = 66
        Width = 66
        Height = 16
        Caption = 'Sample Rate'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object VolumeLabel: TShadowLabel
        Left = 8
        Top = 112
        Width = 150
        Height = 16
        Hint = 'Volume Attenuation [%ddB]'
        AutoSize = False
        Caption = 'Volume Attenuation [0dB]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object SoundOutputMethodLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 110
        Height = 16
        Caption = 'Sound Output Mode'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SpeakerReportLabel: TShadowLabel
        Left = 178
        Top = 112
        Width = 80
        Height = 16
        Caption = 'Speaker Report'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Samples: TAdvOfficeCheckBoxEx
        Left = 155
        Top = 20
        Width = 90
        Height = 20
        Hint = 'Enable the use of external samples if available'
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Use Samples'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AudioLatency: TComboBox2Ex
        Left = 155
        Top = 82
        Width = 81
        Height = 23
        Hint = 
          'Set audio latency (increase to reduce glitches, decrease for res' +
          'ponsiveness)'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '2/5'
        Items.Strings = (
          '1/5'
          '2/5'
          '3/5'
          '4/5'
          '5/5')
      end
      object SampleRate: TComboBox2Ex
        Left = 8
        Top = 82
        Width = 130
        Height = 23
        Hint = 'Set sound output sample rate'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 3
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = '48000 Hz'
        Items.Strings = (
          '11025 Hz'
          '22050 Hz'
          '44100 Hz'
          '48000 Hz'
          '96000 Hz'
          '192000 Hz')
      end
      object Volume: TGaugeBar
        Left = 8
        Top = 128
        Width = 151
        Height = 21
        Hint = 'Sound volume in decibels (-32 -> low, 0 -> normal)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 5
        Max = 0
        Min = -32
        ShowHandleGrip = True
        Position = 0
        OnChange = VolumeChange
      end
      object AudioLatencyButtonReset: TBitBtnEx
        Left = 240
        Top = 82
        Width = 43
        Height = 23
        Hint = 'Set default latency'
        Caption = 'Reset'
        TabOrder = 4
        OnClick = AudioLatencyButtonResetClick
      end
      object SoundOutputMethod: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 130
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'DirectSound'
          'XAudio2 (Win8+)'
          'SDL'
          'PortAudio'
          'None')
      end
      object SpeakerReport: TComboBox2Ex
        Left = 178
        Top = 128
        Width = 105
        Height = 23
        Hint = 
          'Print report of speaker ouput maxima (0=none, or 1-4 for more de' +
          'tail)'
        Style = csDropDownList
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'None'
        Items.Strings = (
          'None'
          'Details Level 1'
          'Details Level 2'
          'Details Level 3'
          'Details Level 4')
      end
      object AudioUseCompressor: TAdvOfficeCheckBoxEx
        Left = 155
        Top = 40
        Width = 123
        Height = 20
        Hint = 
          'It temporarily reduces the overall volume when the audio output ' +
          'is overdriven'
        Checked = True
        Enabled = False
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'Enable Compressor'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PortAudioSettingsGroupBox: TPanelEx
      Left = 632
      Top = 338
      Width = 287
      Height = 161
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
      object PortAudioSettingsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'PortAudio Settings'
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
      object PortAudioAPILabel: TShadowLabel
        Left = 8
        Top = 21
        Width = 19
        Height = 16
        Caption = 'API'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object PortAudioDeviceLabel: TShadowLabel
        Left = 8
        Top = 66
        Width = 36
        Height = 16
        Caption = 'Device'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object PortAudioLatencyLabel: TShadowLabel
        Left = 8
        Top = 112
        Width = 104
        Height = 16
        Caption = 'Latency, in seconds'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object PortAudioAPIButtonClear: TBitBtnEx
        Left = 234
        Top = 37
        Width = 43
        Height = 21
        Hint = 'Click here to set API to "none"'
        Caption = 'Clear'
        TabOrder = 0
      end
      object PortAudioAPI: TEditEx
        Left = 8
        Top = 37
        Width = 223
        Height = 21
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object PortAudioDevice: TEditEx
        Left = 8
        Top = 82
        Width = 223
        Height = 21
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object PortAudioDeviceButtonClear: TBitBtnEx
        Left = 234
        Top = 82
        Width = 43
        Height = 21
        Hint = 'Click here to set Device to "none"'
        Caption = 'Clear'
        TabOrder = 3
      end
      object PortAudioLatency: TEditEx
        Left = 8
        Top = 129
        Width = 223
        Height = 21
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnKeyPress = PortAudioLatencyKeyPress
      end
      object PortAudioLatencyButtonReset: TBitBtnEx
        Left = 234
        Top = 129
        Width = 43
        Height = 21
        Hint = 'Click here to set default value'
        Caption = 'Reset'
        TabOrder = 5
      end
    end
    object AutobootGroupBox: TPanelEx
      Left = 8
      Top = 338
      Width = 293
      Height = 161
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object AutobootGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Auto-boot (LUA Scripts)'
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
      object AutobootCommandLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 223
        Height = 16
        Caption = 'Command To Execute After Machine Boot'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object AutobootDelayLabel: TShadowLabel
        Left = 8
        Top = 112
        Width = 225
        Height = 16
        Hint = 'Delay Timer [%s]'
        HelpType = htKeyword
        HelpKeyword = 'sec'
        AutoSize = False
        Caption = 'Delay Timer [00:00 sec]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object AutobootLuaScriptLabel: TShadowLabel
        Left = 8
        Top = 66
        Width = 220
        Height = 16
        Hint = 'Delay Timer [%u sec]'
        Caption = 'LUA Script to Execute After Machine Boot'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object AutobootCommand: TEditEx
        Left = 8
        Top = 37
        Width = 229
        Height = 21
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object AutobootDelay: TGaugeBar
        Left = 8
        Top = 128
        Width = 275
        Height = 21
        Hint = 'Delay before executing autoboot command'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 5
        Max = 180
        ShowHandleGrip = True
        Position = 0
        OnChange = AutobootDelayChange
      end
      object AutobootLuaScript: TEditEx
        Left = 8
        Top = 82
        Width = 229
        Height = 21
        Hint = 'Script for debugger'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object AutobootLuaScriptButtonSelect: TBitBtnEx
        Left = 240
        Top = 82
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = AutobootLuaScriptButtonSelectClick
      end
      object AutobootCommandButtonClear: TBitBtnEx
        Left = 242
        Top = 37
        Width = 43
        Height = 21
        Hint = 'Click here to clear the parameters'
        Caption = 'Clear'
        TabOrder = 4
        OnClick = AutobootCommandButtonClearClick
      end
      object EnableEmulatorLUAConsole: TAdvOfficeCheckBoxEx
        Left = 160
        Top = -1
        Width = 130
        Height = 20
        Hint = 
          'Start emulator with LUA console enabled'#13#10'For MAME v0.154 and new' +
          'er'
        Enabled = False
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Enable LUA Console'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object LUAPluginsToEnableGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 911
      Height = 310
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object LUAPluginsToEnableGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 909
        Height = 18
        Align = alTop
        AutoSize = False
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
      object LUAPluginsToEnable2Label: TShadowLabel
        Left = 195
        Top = 0
        Width = 117
        Height = 16
        Caption = '(check plugins to use)'
        Enabled = False
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
      object LUAPluginsToEnable: TEasyListview
        Left = 8
        Top = 22
        Width = 893
        Height = 278
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        Enabled = False
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000033010000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          000101000000000000C8000000FFFFFF1F000100000001000000040000004E00
          61006D006500000000000000000000000000110000005445617379436F6C756D
          6E53746F726564FFFECE00060000008008000101000102000000000000500000
          00FFFFFF1F00010000000100000007000000560065007200730069006F006E00
          000000000000000000000000110000005445617379436F6C756D6E53746F7265
          64FFFECE000600000080080001010001030000000000002C010000FFFFFF1F00
          01000000010000000600000041007500740068006F0072000000000000000000
          00000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.CheckType = ectBox
        PaintInfoItem.ShowBorder = False
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
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        OnItemPaintText = FolderROMsItemPaintText
      end
      object EnableLUAPluginSupport: TAdvOfficeCheckBoxEx
        Left = 4
        Top = -1
        Width = 163
        Height = 20
        Checked = True
        Enabled = False
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Enable LUA Plugin Support'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
  end
  object Panel1_Folders: TPanelEx
    Left = 0
    Top = 101
    Width = 929
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object FolderDebuggerCommentsGroupBox: TPanelEx
      Left = 626
      Top = 12
      Width = 293
      Height = 49
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
      object FolderDebuggerCommentsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Debugger Comments'
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
      object FolderDebuggerCommentsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderDebuggerCommentsButtonSelectClick
      end
      object FolderDebuggerComments: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderDiffGroupBox: TPanelEx
      Left = 626
      Top = 67
      Width = 293
      Height = 49
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
      object FolderDiffGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save CHD Difference Files'
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
      object FolderDiff: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Hard Drive Image Difference Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderDiffButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderDiffButtonSelectClick
      end
    end
    object FolderControllerDefinitionsGroupBox: TPanelEx
      Left = 626
      Top = 177
      Width = 293
      Height = 49
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
      object FolderControllerDefinitionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Controller Definitions'
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
      object FolderControllerDefinitionsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderControllerDefinitionsButtonSelectClick
      end
      object FolderControllerDefinitions: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Preconfigured Controller Keys'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderCheatFilesGroupBox: TPanelEx
      Left = 626
      Top = 122
      Width = 293
      Height = 49
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
      object FolderCheatFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Cheat Files'
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
      object FolderCheatFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path To Cheat Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderCheatFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderCheatFilesButtonSelectClick
      end
    end
    object FolderCrosshairFilesGroupBox: TPanelEx
      Left = 626
      Top = 232
      Width = 293
      Height = 49
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
      object FolderCrosshairFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Crosshair Files'
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
      object FolderCrosshairFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path To Crosshair Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderCrosshairFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderCrosshairFilesButtonSelectClick
      end
    end
    object FolderFontFilesGroupBox: TPanelEx
      Left = 626
      Top = 287
      Width = 293
      Height = 49
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
      object FolderFontFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Font Files'
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
      object FolderFontFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to font files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderFontFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderFontFilesButtonSelectClick
      end
    end
    object FolderMemoryCardsGroupBox: TPanelEx
      Left = 626
      Top = 397
      Width = 293
      Height = 49
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
      object FolderMemoryCardsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Memory Card Contents'
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
      object FolderMemoryCards: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Save Memory Card Contents'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderMemoryCardsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderMemoryCardsButtonSelectClick
      end
    end
    object FolderInputDeviceLogsGroupBox: TPanelEx
      Left = 626
      Top = 342
      Width = 293
      Height = 49
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
      object FolderInputDeviceLogsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Input Device Logs'
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
      object FolderInputDeviceLogs: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Recordings (Input Device Logs)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderInputDeviceLogsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderInputDeviceLogsButtonSelectClick
      end
    end
    object FolderManualsPDFGroupBox: TPanelEx
      Left = 626
      Top = 452
      Width = 293
      Height = 49
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
      object FolderManualsPDFGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Game Manual Files (PDF)'
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
      object FolderManualsPDF: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory to Game Manual Files (PDF)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderManualsPDFButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderManualsPDFButtonSelectClick
      end
    end
    object FolderNVRAMGroupBox: TPanelEx
      Left = 317
      Top = 452
      Width = 293
      Height = 49
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
      object FolderNVRAMGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save NVRAM Contents'
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
      object FolderNVRAMButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderNVRAMButtonSelectClick
      end
      object FolderNVRAM: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Save NVRAM Contents'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderHashFilesGroupBox: TPanelEx
      Left = 8
      Top = 452
      Width = 293
      Height = 49
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
      object FolderHashFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Software Definition Files (Hash)'
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
      object FolderHashFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderHashFilesButtonSelectClick
      end
      object FolderHashFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to Software Definition Files (Hash)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderSaveStatesGroupBox: TPanelEx
      Left = 317
      Top = 342
      Width = 293
      Height = 49
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
      object FolderSaveStatesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save States'
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
      object FolderSaveStatesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderSaveStatesButtonSelectClick
      end
      object FolderSaveStates: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Save States'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderGamesConfigurationsGroupBox: TPanelEx
      Left = 317
      Top = 397
      Width = 293
      Height = 49
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
      object FolderGamesConfigurationsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Configurations'
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
      object FolderGamesConfigurationsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderGamesConfigurationsButtonSelectClick
      end
      object FolderGamesConfigurations: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Save Configurations'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderPluginFilesGroupBox: TPanelEx
      Left = 317
      Top = 177
      Width = 293
      Height = 49
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
      object FolderPluginFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to LUA Plugin Files'
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
      object FolderPluginFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderPluginFilesButtonSelectClick
      end
      object FolderPluginFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to LUA Plugin Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderLanguageFilesGroupBox: TPanelEx
      Left = 317
      Top = 287
      Width = 293
      Height = 49
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
      object FolderLanguageFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to UI Translation Files'
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
      object FolderLanguageFilesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderLanguageFilesButtonSelectClick
      end
      object FolderLanguageFiles: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to UI Translation Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderGameSnapshotsGroupBox: TPanelEx
      Left = 317
      Top = 232
      Width = 293
      Height = 49
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
      object FolderGameSnapshotsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Screenshots'
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
      object FolderGameSnapshotsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderGameSnapshotsButtonSelectClick
      end
      object FolderGameSnapshots: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Screenshots (.png Format)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderSamplesGroupBox: TPanelEx
      Left = 8
      Top = 397
      Width = 293
      Height = 49
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
      object FolderSamplesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Audio Sample Sets'
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
      object FolderSamplesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderSamplesButtonSelectClick
      end
      object FolderSamples: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to Audio Sample Sets'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderIniFilesGroupBox: TPanelEx
      Left = 8
      Top = 177
      Width = 293
      Height = 113
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
      object FolderIniFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Ini Files'
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
      object FolderIniFiles: TEasyListview
        Tag = 1
        Left = 4
        Top = 22
        Width = 283
        Height = 62
        Hint = 'Path to ini files'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
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
          0006000000800800010100010000000000000117010000FFFFFF1F0001000000
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
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
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
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderIniFilesKeyAction
      end
      object FolderIniFilesButtonUp: TBitBtnEx
        Tag = 1
        Left = 4
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonDown: TBitBtnEx
        Left = 48
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonSelect: TBitBtnEx
        Left = 112
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderIniFilesButtonSelectClick
      end
      object FolderIniFilesButtonEdit: TBitBtnEx
        Left = 156
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderIniFilesButtonEditClick
      end
      object FolderIniFilesButtonDelete: TBitBtnEx
        Left = 200
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderIniFilesButtonDeleteClick
      end
      object FolderIniFilesButtonClear: TBitBtnEx
        Left = 244
        Top = 86
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderIniFilesButtonClearClick
      end
    end
    object FolderArtworksGroupBox: TPanelEx
      Left = 8
      Top = 296
      Width = 293
      Height = 95
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
      object FolderArtworksGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Artwork Files / Effect Overlay Files'
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
      object FolderArtworks: TEasyListview
        Tag = 1
        Left = 4
        Top = 22
        Width = 283
        Height = 44
        Hint = 'Path to Artwork Files / Path to Effect Overlay Files'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
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
          0006000000800800010100010000000000000117010000FFFFFF1F0001000000
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
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
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
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderArtworksKeyAction
      end
      object FolderArtworksButtonUp: TBitBtnEx
        Tag = 1
        Left = 4
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonDown: TBitBtnEx
        Left = 48
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonSelect: TBitBtnEx
        Left = 112
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderArtworksButtonSelectClick
      end
      object FolderArtworksButtonEdit: TBitBtnEx
        Left = 156
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderArtworksButtonEditClick
      end
      object FolderArtworksButtonDelete: TBitBtnEx
        Left = 200
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderArtworksButtonDeleteClick
      end
      object FolderArtworksButtonClear: TBitBtnEx
        Left = 244
        Top = 68
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderArtworksButtonClearClick
      end
    end
    object FolderROMsGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 293
      Height = 159
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
      object FolderROMsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to ROM Sets and CHD Files'
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
      object FolderROMs: TEasyListview
        Tag = 1
        Left = 4
        Top = 21
        Width = 283
        Height = 109
        Hint = 'Path To ROM Sets And Hard Disk Images'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
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
          0006000000800800010100010000000000000117010000FFFFFF1F0001000000
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
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
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
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderROMsKeyAction
      end
      object FolderROMsButtonUp: TBitBtnEx
        Tag = 1
        Left = 4
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderROMsButtonUpClick
      end
      object FolderROMsButtonDown: TBitBtnEx
        Left = 48
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderROMsButtonUpClick
      end
      object FolderROMsButtonSelect: TBitBtnEx
        Left = 112
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderROMsButtonSelectClick
      end
      object FolderROMsButtonEdit: TBitBtnEx
        Left = 156
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderROMsButtonEditClick
      end
      object FolderROMsButtonDelete: TBitBtnEx
        Left = 200
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderROMsButtonDeleteClick
      end
      object FolderROMsButtonClear: TBitBtnEx
        Left = 244
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderROMsButtonClearClick
      end
    end
    object FolderHomePathGroupBox: TPanelEx
      Left = 317
      Top = 122
      Width = 293
      Height = 49
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
      object FolderHomePathGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path For LUA Plugins To Store Data (Home Path)'
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
      object FolderHomePathButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object FolderHomePath: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path For LUA Plugins To Store Data (Read/Write)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderLooseSoftwareGroupBox: TPanelEx
      Left = 317
      Top = 67
      Width = 293
      Height = 49
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
      object FolderLooseSoftwareGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path To Loose Software (Not Listed In Software Lists)'
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
      object FolderLooseSoftwareButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object FolderLooseSoftware: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path To Loose Software (Not Listed In Software Lists)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderShareEmulatedMachinesGroupBox: TPanelEx
      Left = 317
      Top = 12
      Width = 293
      Height = 49
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
      object FolderShareEmulatedMachinesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory To Share With Emulated Machines'
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
      object FolderShareEmulatedMachinesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object FolderShareEmulatedMachines: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Share With Emulated Machines'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
  end
  object Panel2_Video1: TPanelEx
    Left = 936
    Top = 101
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object VideoRenderOptionsGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 216
      Height = 489
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
      object VideoRenderOptionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Render Options'
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
      object IntegerScaleFactorVerticalLabel: TShadowLabel
        Left = 105
        Top = 236
        Width = 21
        Height = 16
        Caption = 'Vert'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object IntegerScaleFactorHorizontalLabel: TShadowLabel
        Left = 24
        Top = 236
        Width = 21
        Height = 16
        Caption = 'Hor'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object MonitorProviderLabel: TShadowLabel
        Left = 8
        Top = 284
        Width = 91
        Height = 16
        Caption = 'Monitor Provider'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object AttachWindowLabel: TShadowLabel
        Left = 8
        Top = 330
        Width = 147
        Height = 16
        Caption = 'Attach To Arbitrary Window'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object WindowMode: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 101
        Height = 20
        Hint = 'Run games in a window instead of full screen'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Window Mode'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object MaximizeWindow: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 41
        Width = 119
        Height = 20
        Hint = 'Start emulation with window maximized (window mode only)'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Maximize Window'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object KeepAspectRatio: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 62
        Width = 117
        Height = 20
        Hint = 'Maintain aspect ratio when scaling to fill output screen/window'
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Keep Aspect Ratio'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object WaitVerticalSync: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 104
        Width = 116
        Height = 20
        Hint = 'Enables v-sync to reduce tearing'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Wait Vertical Sync'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object BilinearFilter: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 83
        Width = 113
        Height = 20
        Hint = 'Enable bilinear filtering on screen output'
        Checked = True
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Use Bilinear Filter'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UnevenStretch: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 125
        Width = 104
        Height = 20
        Hint = 
          'Allow non-integer ratios when scaling to fill output screen/wind' +
          'ow horizontally or vertically'
        Checked = True
        Enabled = False
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Uneven Stretch'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UnevenStretchX: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 146
        Width = 132
        Height = 20
        Hint = 
          'Allow non-integer ratios when scaling to fill output screen/wind' +
          'ow horizontally'
        Enabled = False
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Uneven Stretch (Hor)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object IntegerScaleFactorHorizontal: TEditEx
        Left = 47
        Top = 233
        Width = 50
        Height = 21
        Hint = 'Set horizontal integer scale factor'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnKeyPress = IntegerScaleFactorHorizontalKeyPress
      end
      object IntegerScaleFactorVertical: TEditEx
        Left = 129
        Top = 233
        Width = 50
        Height = 21
        Hint = 'Set vertical integer scale factor'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnKeyPress = IntegerScaleFactorVerticalKeyPress
      end
      object IntegerScaleOverscan: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 209
        Width = 140
        Height = 20
        Hint = 'Allow overscan on integer scaled targets'
        Enabled = False
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Integer Scale Overscan'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UnevenStretchY: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 167
        Width = 132
        Height = 20
        Hint = 
          'Allow non-integer ratios when scaling to fill otuput screen/wind' +
          'ow vertially'
        Enabled = False
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Uneven Stretch (Vert)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AutoUnevenStretchXY: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 188
        Width = 130
        Height = 20
        Hint = 
          'Automatically apply uneven stretch hor/vert based on source nati' +
          've orientation'
        Enabled = False
        TabOrder = 11
        Alignment = taLeftJustify
        Caption = 'Auto Uneven Stretch'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EnableMenuBar: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 261
        Width = 120
        Height = 20
        Hint = 'Enables menu bar if available by UI implementation'
        TabOrder = 12
        Alignment = taLeftJustify
        Caption = 'Enable Menu Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object MonitorProvider: TComboBox2Ex
        Left = 8
        Top = 300
        Width = 198
        Height = 23
        Hint = 'Monitor Discovery Method'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Win32'
          'DXGI'
          'SDL')
      end
      object AttachWindow: TEditEx
        Left = 8
        Top = 346
        Width = 198
        Height = 23
        Hint = 'Use an existing window as the first emulation window'
        Color = clWhite
        TabOrder = 14
      end
    end
    object FullScreenGroupBox: TPanelEx
      Left = 472
      Top = 12
      Width = 216
      Height = 196
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
      object FullScreenGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Full Screen'
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
      object FullScreenBrightnessLabel: TShadowLabel
        Left = 8
        Top = 64
        Width = 185
        Height = 16
        Hint = 'Brightness Correction [%1.2f]'
        AutoSize = False
        Caption = 'Brightness Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object FullScreenContrastLabel: TShadowLabel
        Left = 8
        Top = 107
        Width = 185
        Height = 16
        Hint = 'Contrast Correction [%1.2f]'
        AutoSize = False
        Caption = 'Contrast Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object FullScreenGammaLabel: TShadowLabel
        Left = 8
        Top = 150
        Width = 185
        Height = 16
        Hint = 'Gamma Correction [%1.2f]'
        AutoSize = False
        Caption = 'Gamma Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object TripleBuffer: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 89
        Height = 20
        Hint = 'Enable triple buffering (override v-sync)'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Triple Buffer'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SwitchResolution: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 41
        Width = 121
        Height = 20
        Hint = 'Enable resolution switching (for old systems and CRT monitors)'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Switch Resolution'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object FullScreenBrightness: TGaugeBar2
        Left = 8
        Top = 80
        Width = 198
        Height = 20
        Hint = 'Brightness value in full screen mode (entire screen)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 2.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
        OnChange = FullScreenBrightnessChange
      end
      object FullScreenContrast: TGaugeBar2
        Left = 8
        Top = 123
        Width = 198
        Height = 20
        Hint = 'Contrast value in full screen mode (entire screen)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 2.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 1.000000000000000000
        OnChange = FullScreenContrastChange
      end
      object FullScreenGamma: TGaugeBar2
        Left = 8
        Top = 166
        Width = 198
        Height = 20
        Hint = 'Gamma value in full screen mode (entire screen)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 3.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 1.000000000000000000
        OnChange = FullScreenGammaChange
      end
    end
    object VectorGroupBox: TPanelEx
      Left = 472
      Top = 224
      Width = 448
      Height = 175
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
      object VectorGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Vector'
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
      object VectorFlickerEffectLabel: TShadowLabel
        Left = 8
        Top = 43
        Width = 185
        Height = 16
        Hint = 'Flicker Effect [%3.2f]'
        AutoSize = False
        Caption = 'Flicker Effect [0.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorBeamWidthMinLabel: TShadowLabel
        Left = 233
        Top = 43
        Width = 185
        Height = 16
        Hint = 'Beam Min Width [%2.2f]'
        AutoSize = False
        Caption = 'Beam Min Width [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorBeamWidthMaxLabel: TShadowLabel
        Left = 233
        Top = 86
        Width = 185
        Height = 16
        Hint = 'Beam Max Width [%2.2f]'
        AutoSize = False
        Caption = 'Beam Max Width [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorBeamIntensityWeightLabel: TShadowLabel
        Left = 8
        Top = 86
        Width = 185
        Height = 16
        Hint = 'Beam Intensity Weight %1.2f'
        AutoSize = False
        Caption = 'Beam Intensity Weight 0.00'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorBeamDotSizeLabel: TShadowLabel
        Left = 8
        Top = 129
        Width = 150
        Height = 16
        Hint = 'Beam Dot Size %2.2f'
        AutoSize = False
        Caption = 'Beam Dot Size 1.00'
        Enabled = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorFlickerEffect: TGaugeBar2
        Left = 8
        Top = 59
        Width = 205
        Height = 20
        Hint = 'Set vector flicker effect'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 10.000000000000000000
        Max = 100.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.500000000000000000
        OnChange = VectorFlickerEffectChange
      end
      object VectorBeamWidthMin: TGaugeBar2
        Left = 233
        Top = 59
        Width = 205
        Height = 20
        Hint = 'Set minimum vector beam width'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 10.000000000000000000
        Min = 0.009999999776482582
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
        OnChange = VectorBeamWidthMinChange
      end
      object VectorBeamWidthMax: TGaugeBar2
        Left = 233
        Top = 102
        Width = 205
        Height = 20
        Hint = 'Set maximum vector beam width'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 10.000000000000000000
        Min = 0.009999999776482582
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
        OnChange = VectorBeamWidthMaxChange
      end
      object VectorBeamIntensityWeight: TGaugeBar2
        Left = 8
        Top = 102
        Width = 205
        Height = 20
        Hint = 'Set maximum vector beam width'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 1.000000000000000000
        Min = -1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        OnChange = VectorBeamIntensityWeightChange
      end
      object Antialias: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 65
        Height = 19
        Hint = 'Use antialiasing when drawing vectors'
        Checked = True
        Enabled = False
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Antialias'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object VectorBeamDotSize: TGaugeBar2
        Left = 8
        Top = 145
        Width = 430
        Height = 20
        Hint = 'Set vector beam size for dots'
        Backgnd = bgPattern
        ButtonSize = 12
        Enabled = False
        LargeChange = 0.100000001490116100
        Max = 10.000000000000000000
        Min = 1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
        OnChange = VectorBeamDotSizeChange
      end
    end
    object ScreenRotationGroupBox: TPanelEx
      Left = 240
      Top = 310
      Width = 216
      Height = 130
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
      object ScreenRotationGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Screen Rotation'
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
      object FlipX: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 83
        Width = 96
        Height = 20
        Hint = 'Flip screen left-right'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Flip Left-Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object FlipY: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 104
        Width = 112
        Height = 20
        Hint = 'Flip screen upside-down'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Flip Upside-Down'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RotateRight: TAdvOfficeCheckBoxEx
        Left = 135
        Top = 41
        Width = 50
        Height = 20
        Hint = 'Rotate screen clockwise 90 degrees'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RotateLeft: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 41
        Width = 41
        Height = 20
        Hint = 'Rotate screen counterclockwise 90 degrees'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Left'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AutoRotateRight: TAdvOfficeCheckBoxEx
        Left = 135
        Top = 62
        Width = 80
        Height = 20
        Hint = 'Automatically rotate screen clockwise 90 degrees if vertical'
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Auto Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AutoRotateLeft: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 62
        Width = 73
        Height = 20
        Hint = 
          'Automatically rotate screen counterclockwise 90 degrees if verti' +
          'cal'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Auto Left'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Rotate: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 45
        Height = 19
        Hint = 
          'Rotate the game screen according to the game'#39's orientation needs' +
          ' it'
        Checked = True
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Auto'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object ArtworkGroupBox: TPanelEx
      Left = 704
      Top = 12
      Width = 216
      Height = 180
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
      object ArtworkGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Artwork'
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
      object FallbackArtworkLabel: TShadowLabel
        Left = 8
        Top = 85
        Width = 89
        Height = 16
        Caption = 'Fallback Artwork'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OverrideArtworkLabel: TShadowLabel
        Left = 8
        Top = 131
        Width = 91
        Height = 16
        Caption = 'Override Artwork'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ArtworkBackdrops: TAdvOfficeCheckBoxEx
        Left = 135
        Top = 41
        Width = 77
        Height = 20
        Hint = 'Enable the display of backdrops'
        Checked = True
        Enabled = False
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Backdrops'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ArtworkBezels: TAdvOfficeCheckBoxEx
        Left = 135
        Top = 62
        Width = 53
        Height = 20
        Hint = 'Enable the display of bezels'
        Checked = True
        Enabled = False
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Bezels'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ArtworkOverlays: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 41
        Width = 68
        Height = 20
        Hint = 'Enable the display of overlays'
        Checked = True
        Enabled = False
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Overlays'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ArtworkCrop: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 49
        Height = 20
        Hint = 
          'Crop artwork so emulated screen image fills output screen/window' +
          ' in one axis'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Crop'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ArtworkControlPanels: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 62
        Width = 99
        Height = 20
        Hint = 'Enable the display of control panels'
        Checked = True
        Enabled = False
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Control Panels'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ArtworkMarquees: TAdvOfficeCheckBoxEx
        Left = 135
        Top = 20
        Width = 75
        Height = 20
        Hint = 'Enable the display of marquees'
        Checked = True
        Enabled = False
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Marquees'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object FallbackArtwork: TEditEx
        Left = 8
        Top = 101
        Width = 198
        Height = 23
        Hint = 
          'Fallback artwork if no external artwork or internal driver layou' +
          't defined'
        Color = clWhite
        Enabled = False
        TabOrder = 6
      end
      object OverrideArtwork: TEditEx
        Left = 8
        Top = 147
        Width = 198
        Height = 23
        Hint = 'Override artwork for external artwork and internal driver layout'
        Color = clWhite
        Enabled = False
        TabOrder = 7
      end
    end
    object ScreenOptionsGroupBox: TPanelEx
      Left = 240
      Top = 12
      Width = 216
      Height = 282
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
      object ScreenOptionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Game Screen'
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
      object BrightnessLabel: TShadowLabel
        Left = 8
        Top = 63
        Width = 185
        Height = 16
        Hint = 'Brightness Correction [%1.2f]'
        AutoSize = False
        Caption = 'Brightness Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object Prescale_ScaleScreenLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 185
        Height = 16
        Hint = 'Resolution Prescale [%ux]'
        AutoSize = False
        Caption = 'Resolution Prescale [1x]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object ContrastLabel: TShadowLabel
        Left = 8
        Top = 106
        Width = 185
        Height = 16
        Hint = 'Contrast Correction [%1.2f]'
        AutoSize = False
        Caption = 'Contrast Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object GammaLabel: TShadowLabel
        Left = 8
        Top = 149
        Width = 185
        Height = 16
        Hint = 'Gamma Correction [%1.2f]'
        AutoSize = False
        Caption = 'Gamma Correction [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object PauseBrightnessLabel: TShadowLabel
        Left = 8
        Top = 192
        Width = 185
        Height = 16
        Hint = 'Pause Brightness [%1.2f]'
        AutoSize = False
        Caption = 'Pause Brightness [0.65]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object EffectOverlayLabel: TShadowLabel
        Left = 8
        Top = 235
        Width = 113
        Height = 16
        Caption = 'Visual Effects Overlay'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Prescale_ScaleScreen: TGaugeBar
        Left = 8
        Top = 36
        Width = 198
        Height = 20
        Hint = 
          'Scale screen resolution rendering (1x for game'#39's original resolu' +
          'tion)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        Max = 8
        Min = 1
        ShowHandleGrip = True
        Position = 1
        OnChange = Prescale_ScaleScreenChange
      end
      object Brightness: TGaugeBar2
        Left = 8
        Top = 79
        Width = 198
        Height = 20
        Hint = 
          'Default screen brightness correction (does not affect the artwor' +
          'k or other parts of the display)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 2.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
        OnChange = BrightnessChange
      end
      object Contrast: TGaugeBar2
        Left = 8
        Top = 122
        Width = 198
        Height = 20
        Hint = 
          'Default screen contrast correction (does not affect the artwork ' +
          'or other parts of the display)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 2.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 1.000000000000000000
        OnChange = ContrastChange
      end
      object Gamma: TGaugeBar2
        Left = 8
        Top = 165
        Width = 198
        Height = 20
        Hint = 
          'Default screen gamma correction (does not affect the artwork or ' +
          'other parts of the display)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 3.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 1.000000000000000000
        OnChange = GammaChange
      end
      object PauseBrightness: TGaugeBar2
        Left = 8
        Top = 208
        Width = 198
        Height = 20
        Hint = 'Additional pause brightness'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.050000000745058060
        Max = 2.000000000000000000
        Min = 0.500000000000000000
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 0.649999976158142100
        OnChange = PauseBrightnessChange
      end
      object EffectOverlay: TEditEx
        Left = 8
        Top = 251
        Width = 152
        Height = 21
        Hint = 'Name of a PNG file to use for visual effects'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object EffectOverlayButtonSelect: TBitBtnEx
        Left = 163
        Top = 251
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = EffectOverlayButtonSelectClick
      end
    end
  end
  object Panel6_Input: TPanelEx
    Left = 936
    Top = 1112
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object RecordInputTimecodeFileLabel: TShadowLabel
      Left = 333
      Top = 245
      Width = 138
      Height = 19
      Caption = '(used with record input)'
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
    end
    object ExitAfterInputPlaybackLabel: TShadowLabel
      Left = 642
      Top = 245
      Width = 148
      Height = 19
      Caption = '(used with playback input)'
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
    end
    object MultiKeyboard: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 54
      Width = 105
      Height = 20
      Hint = 'Enable separate input from each keyboard device (if present)'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Mutli-Keyboard'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Mouse: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 12
      Width = 65
      Height = 20
      Hint = 'Enable mouse input'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Mouse'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MultiMouse: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 33
      Width = 89
      Height = 20
      Hint = 'Enable separate input from each mouse device (if present)'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Multi-Mouse'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object LightGun: TAdvOfficeCheckBoxEx
      Left = 189
      Top = 12
      Width = 73
      Height = 20
      Hint = 'Enable lightgun input'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Light Gun'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DualLightGun: TAdvOfficeCheckBoxEx
      Left = 189
      Top = 33
      Width = 100
      Height = 20
      Hint = 'Enable dual lightgun input'
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Dual Light Gun'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object LightGunOffScreenReload: TAdvOfficeCheckBoxEx
      Left = 189
      Top = 54
      Width = 121
      Height = 20
      Hint = 'Convert lightgun button 2 into offscreen reload'
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Off-Screen Reload'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NaturalKeyboard: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 75
      Width = 113
      Height = 20
      Hint = 'Specifies whether to use a natural keyboard mode or not'
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Natural Keyboard'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SteadyKey: TAdvOfficeCheckBoxEx
      Left = 189
      Top = 75
      Width = 81
      Height = 20
      Hint = 'Use a different handling for multiple keys presses at once'
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Steady Key'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object CoinLockout: TAdvOfficeCheckBoxEx
      Left = 189
      Top = 96
      Width = 97
      Height = 20
      Hint = 'Ignore coin inputs if coin lockout output is active'
      Checked = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Coin Lockout'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UIMouse: TAdvOfficeCheckBoxEx
      Left = 626
      Top = 287
      Width = 212
      Height = 20
      Hint = 
        'Displays a mouse cursor when using the built-in user interface f' +
        'or MAME'
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Display User Interface Mouse Cursor'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UIActive: TAdvOfficeCheckBoxEx
      Left = 626
      Top = 308
      Width = 272
      Height = 20
      Hint = 
        'Enable access to the built-in user interface in MAME on top of e' +
        'mulated keyboard'
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'Enable Partial Keyboard Emulation (UI Enabled)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableGlobalInputs: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 96
      Width = 128
      Height = 20
      Hint = 'Read inputs even when the MAME window is not in focus'
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Enable Global Inputs'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object RecordInputTimecodeFile: TAdvOfficeCheckBoxEx
      Left = 317
      Top = 228
      Width = 185
      Height = 18
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Record an Input Timecode File'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ExitAfterInputPlayback: TAdvOfficeCheckBoxEx
      Left = 626
      Top = 228
      Width = 200
      Height = 18
      TabOrder = 13
      Alignment = taLeftJustify
      Caption = 'Exit Emulator After Input Playback'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object OSDOutputOptionsGroupBox: TPanelEx
      Left = 8
      Top = 193
      Width = 293
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
      object OSDOutputOptionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'OSD Output Options'
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
      object OSDOutputProviderLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 86
        Height = 16
        Caption = 'Output Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OSDOutputProvider: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 275
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Console'
          'Network'
          'Windows'
          'None')
      end
    end
    object HTTPServerGroupBox: TPanelEx
      Left = 626
      Top = 432
      Width = 293
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
      object HTTPServerGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
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
      object HTTPPortLabel: TShadowLabel
        Left = 186
        Top = 20
        Width = 23
        Height = 16
        Caption = 'Port'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object HTTPPathLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 120
        Height = 16
        Caption = 'Root Path to Web Files'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object HTTPServer: TAdvOfficeCheckBoxEx
        Left = 4
        Top = -1
        Width = 125
        Height = 20
        Hint = 'Enable lightgun input'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Enable HTTP Server'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object HTTPPort: TEditEx
        Left = 186
        Top = 36
        Width = 51
        Height = 21
        Hint = 'HTTP server listener port'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = HTTPPortKeyPress
      end
      object HTTPPath: TEditEx
        Left = 8
        Top = 36
        Width = 175
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object HTTPServerButtonReset: TBitBtnEx
        Left = 240
        Top = 36
        Width = 43
        Height = 21
        Hint = 'Reset to default values'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = HTTPServerButtonResetClick
      end
    end
    object AnalogSettingsGroupBox: TPanelEx
      Left = 626
      Top = 12
      Width = 293
      Height = 207
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
      object AnalogSettingsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Automatic Device Selection [Analog Controls]'
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
      object Analog_PaddleLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 37
        Height = 16
        Caption = 'Paddle'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_JoystickLabel: TShadowLabel
        Left = 8
        Top = 66
        Width = 83
        Height = 16
        Caption = 'Analog Joystick'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_LightGunLabel: TShadowLabel
        Left = 153
        Top = 112
        Width = 53
        Height = 16
        Caption = 'Light Gun'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_PedalLabel: TShadowLabel
        Left = 153
        Top = 20
        Width = 30
        Height = 16
        Caption = 'Pedal'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_DialLabel: TShadowLabel
        Left = 153
        Top = 66
        Width = 21
        Height = 16
        Caption = 'Dial'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_TrackballLabel: TShadowLabel
        Left = 153
        Top = 158
        Width = 47
        Height = 16
        Caption = 'Trackball'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_PositionalLabel: TShadowLabel
        Left = 8
        Top = 112
        Width = 53
        Height = 16
        Caption = 'Positional'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_MouseLabel: TShadowLabel
        Left = 8
        Top = 158
        Width = 37
        Height = 16
        Caption = 'Mouse'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Analog_Paddle: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 124
        Height = 23
        Hint = 'Enable it if a paddle control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Joystick: TComboBox2Ex
        Left = 8
        Top = 82
        Width = 124
        Height = 23
        Hint = 'Enable it if an analog joystick control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_LightGun: TComboBox2Ex
        Left = 153
        Top = 128
        Width = 124
        Height = 23
        Hint = 'Enable it if a lightgun control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Pedal: TComboBox2Ex
        Left = 153
        Top = 36
        Width = 124
        Height = 23
        Hint = 'Enable it if a pedal control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Dial: TComboBox2Ex
        Left = 153
        Top = 82
        Width = 124
        Height = 23
        Hint = 'Enable it if a dial control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Trackball: TComboBox2Ex
        Left = 153
        Top = 174
        Width = 124
        Height = 23
        Hint = 'Enable it if a trackball control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Positional: TComboBox2Ex
        Left = 8
        Top = 128
        Width = 124
        Height = 23
        Hint = 'Enable it if a positional control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'Keyboard'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
      object Analog_Mouse: TComboBox2Ex
        Left = 8
        Top = 174
        Width = 124
        Height = 23
        Hint = 'Enable it if a mouse control is present'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 2
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Text = 'Mouse'
        Items.Strings = (
          'None'
          'Keyboard'
          'Mouse'
          'Joystick'
          'Lightgun')
      end
    end
    object ControllerDefinitionsGroupBox: TPanelEx
      Left = 8
      Top = 122
      Width = 293
      Height = 55
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
      object ControllerDefinitionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Controller Definitions'
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
      object ControllerDefinitions: TComboBox2Ex
        Left = 8
        Top = 22
        Width = 275
        Height = 23
        Hint = 'Pre-configure for specified controller'
        Style = csDropDownList
        DropDownCount = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = '(None)'
        Items.Strings = (
          '(None)')
      end
    end
    object UIModeGroupBox: TPanelEx
      Left = 626
      Top = 334
      Width = 293
      Height = 82
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
      object UIModeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Full Keyboard Emulation (User Interface Disabled)'
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
      object UIModeKeyCustomLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 239
        Height = 31
        Hint = 
          'Key to enable/disable MAME controls when emulated system has key' +
          'board inputs'
        Caption = 
          'Key to Enable/Disable MAME Controls When Emulated System Has Key' +
          'board Inputs'
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
      object UIModeKeyCustomButtonReset: TBitBtnEx
        Left = 240
        Top = 51
        Width = 43
        Height = 21
        Hint = 'Reset to default value'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = UIModeKeyCustomButtonResetClick
      end
      object UIModeKeyButtonDetectKey: TBitBtnEx
        Left = 262
        Top = 22
        Width = 21
        Height = 21
        Hint = 'Click here to select a hot-key'
        Caption = '...'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        Visible = False
        OnClick = UIModeKeyButtonDetectKeyClick
      end
      object UIModeKeyCustom: TEditEx
        Left = 8
        Top = 51
        Width = 229
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object CommOptionsGroupBox: TPanelEx
      Left = 317
      Top = 12
      Width = 293
      Height = 134
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
      object CommOptionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Comm Options'
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
      object CommLocalHostLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 129
        Height = 16
        Caption = 'Local Address to Bind to'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object CommLocalPortLabel: TShadowLabel
        Left = 186
        Top = 20
        Width = 23
        Height = 16
        Caption = 'Port'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object CommRemoteHostLabel: TShadowLabel
        Left = 8
        Top = 64
        Width = 163
        Height = 16
        Caption = 'Remote Address to Connect to'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object CommRemotePortLabel: TShadowLabel
        Left = 186
        Top = 64
        Width = 23
        Height = 16
        Caption = 'Port'
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
      object CommLocalHost: TEditEx
        Left = 8
        Top = 36
        Width = 175
        Height = 21
        Hint = '0.0.0.0'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnKeyPress = CommLocalHostKeyPress
      end
      object CommLocalPort: TEditEx
        Left = 186
        Top = 36
        Width = 51
        Height = 21
        Hint = '15112'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnKeyPress = CommLocalPortKeyPress
      end
      object CommRemoteHost: TEditEx
        Left = 8
        Top = 80
        Width = 175
        Height = 21
        Hint = '127.0.0.1'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnKeyPress = CommLocalHostKeyPress
      end
      object CommRemotePort: TEditEx
        Left = 186
        Top = 80
        Width = 51
        Height = 21
        Hint = '15112'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnKeyPress = CommLocalPortKeyPress
      end
      object CommLocalHostButtonReset: TBitBtnEx
        Left = 240
        Top = 36
        Width = 43
        Height = 21
        Hint = 'Reset to default address and port'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = CommLocalHostButtonResetClick
      end
      object CommRemoteHostButtonReset: TBitBtnEx
        Left = 240
        Top = 80
        Width = 43
        Height = 21
        Hint = 'Reset to default address and port'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = CommRemoteHostButtonResetClick
      end
      object CommSyncFrame: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 108
        Width = 120
        Height = 20
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Syncronize Frames'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object JoystickGroupBox: TPanelEx
      Left = 8
      Top = 359
      Width = 602
      Height = 87
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
      object JoystickGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 600
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Joystick'
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
      object JoystickDeadzoneLabel: TShadowLabel
        Left = 8
        Top = 42
        Width = 185
        Height = 16
        Hint = 'Joystick Deadzone [%1.2f]'
        AutoSize = False
        Caption = 'Joystick Deadzone [0.30]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object JoystickSaturationLabel: TShadowLabel
        Left = 310
        Top = 42
        Width = 185
        Height = 16
        Hint = 'Joystick Saturation [%1.2f]'
        AutoSize = False
        Caption = 'Joystick Saturation [0.85]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object JoystickDeadzone: TGaugeBar2
        Left = 8
        Top = 58
        Width = 282
        Height = 20
        Hint = 
          'Center deadzone range for joystick where change is ignored (0.0 ' +
          'center, 1.0 end)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 0.300000011920929000
        OnChange = JoystickDeadzoneChange
      end
      object Joystick: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 125
        Height = 20
        Hint = 'Enable joystick input'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Enable Joystick'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object JoystickContradictory: TAdvOfficeCheckBoxEx
        Left = 310
        Top = 20
        Width = 138
        Height = 20
        Hint = 
          'Enable contradictory direction digital joystick input at the sam' +
          'e time (left/right, up/down)'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Joystick Contradictory'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object JoystickSaturation: TGaugeBar2
        Left = 310
        Top = 58
        Width = 282
        Height = 20
        Hint = 
          'End of axis saturation range for joystick where change is ignore' +
          'd (0.0 center, 1.0 end)'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 0.850000023841857900
        OnChange = JoystickSaturationChange
      end
    end
    object OSDInputOptionsGroupBox: TPanelEx
      Left = 8
      Top = 276
      Width = 602
      Height = 67
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object OSDInputOptionsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 600
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'OSD Input Options'
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
      object OSDInputKeyboardProviderLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 98
        Height = 16
        Caption = 'Keyboard Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OSDInputMouseProviderLabel: TShadowLabel
        Left = 160
        Top = 20
        Width = 84
        Height = 16
        Caption = 'Mouse Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OSDInputLightgunProviderLabel: TShadowLabel
        Left = 464
        Top = 20
        Width = 96
        Height = 16
        Caption = 'Lightgun Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OSDInputJoystickProviderLabel: TShadowLabel
        Left = 312
        Top = 20
        Width = 89
        Height = 16
        Caption = 'Joystick Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object OSDInputKeyboardProvider: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 132
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Raw Input'
          'DirectInput'
          'Win32 Input'
          'UWP Windows 10'
          'SDL'
          'None')
      end
      object OSDInputMouseProvider: TComboBox2Ex
        Left = 160
        Top = 36
        Width = 132
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Raw Input'
          'DirectInput'
          'Win32 Input'
          'SDL'
          'None')
      end
      object OSDInputLightgunProvider: TComboBox2Ex
        Left = 464
        Top = 36
        Width = 128
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Win32 Input'
          'Raw Input'
          'None')
      end
      object OSDInputJoystickProvider: TComboBox2Ex
        Left = 312
        Top = 36
        Width = 132
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'DirectInput'
          'XInput'
          'Hybrid'
          'UWP (Windows 10)'
          'None')
      end
    end
    object CoinImpulseGroupBox: TPanelEx
      Left = 317
      Top = 162
      Width = 293
      Height = 55
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
      object CoinImpulseGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Coin Impulse Time'
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
      object CoinImpulse: TComboBox2Ex
        Left = 8
        Top = 22
        Width = 275
        Height = 23
        Hint = 'Set coin impulse time'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Obbey Driver'
        Items.Strings = (
          'Disabled'
          'Obbey Driver'
          '1 second'
          '2 seconds'
          '3 seconds'
          '4 seconds'
          '5 seconds'
          '6 seconds'
          '7 seconds'
          '8 seconds'
          '9 seconds'
          '10 seconds'
          '11 seconds'
          '12 seconds'
          '13 seconds'
          '14 seconds'
          '15 seconds'
          '16 seconds'
          '17 seconds'
          '18 seconds'
          '19 seconds'
          '20 seconds')
      end
    end
  end
  object Panel8_SDL: TPanelEx
    Left = 2816
    Top = 1112
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SDLVideoPerformance: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 86
      Width = 177
      Height = 20
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Show SDL Video Performance'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SDLSplitFullScreenMonitors: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 289
      Width = 231
      Height = 20
      Hint = 'Multi-monitors (X11 only)'
      Enabled = False
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Split Full Screen Image Across Monitors'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SDLLightgunMappingGroupBox: TPanelEx
      Left = 632
      Top = 269
      Width = 287
      Height = 230
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
      object SDLLightgunMappingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Lightgun Mapping (XInput)'
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
      object SDLLightgunMapping1Label: TShadowLabel
        Left = 8
        Top = 26
        Width = 14
        Height = 16
        Caption = '#1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping2Label: TShadowLabel
        Left = 8
        Top = 51
        Width = 14
        Height = 16
        Caption = '#2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping3Label: TShadowLabel
        Left = 8
        Top = 76
        Width = 14
        Height = 16
        Caption = '#3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping4Label: TShadowLabel
        Left = 8
        Top = 101
        Width = 14
        Height = 16
        Caption = '#4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping5Label: TShadowLabel
        Left = 8
        Top = 126
        Width = 14
        Height = 16
        Caption = '#5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping6Label: TShadowLabel
        Left = 8
        Top = 151
        Width = 14
        Height = 16
        Caption = '#6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping7Label: TShadowLabel
        Left = 8
        Top = 175
        Width = 14
        Height = 16
        Caption = '#7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping8Label: TShadowLabel
        Left = 8
        Top = 200
        Width = 14
        Height = 16
        Caption = '#8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLLightgunMapping1: TComboBox2Ex
        Left = 24
        Top = 22
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'auto'
        OnSelect = SDLLightgunMapping1Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping1Custom: TEditEx
        Left = 137
        Top = 22
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #1'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object SDLLightgunMapping2: TComboBox2Ex
        Left = 24
        Top = 47
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'auto'
        OnSelect = SDLLightgunMapping2Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping2Custom: TEditEx
        Left = 137
        Top = 47
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #2'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object SDLLightgunMapping3: TComboBox2Ex
        Left = 24
        Top = 72
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'auto'
        OnSelect = SDLLightgunMapping3Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping3Custom: TEditEx
        Left = 137
        Top = 72
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #3'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object SDLLightgunMapping4: TComboBox2Ex
        Left = 24
        Top = 97
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'auto'
        OnSelect = SDLLightgunMapping4Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping4Custom: TEditEx
        Left = 137
        Top = 97
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #4'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object SDLLightgunMapping5: TComboBox2Ex
        Left = 24
        Top = 122
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Text = 'auto'
        OnSelect = SDLLightgunMapping5Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping5Custom: TEditEx
        Left = 137
        Top = 122
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #5'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object SDLLightgunMapping6: TComboBox2Ex
        Left = 24
        Top = 147
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Text = 'auto'
        OnSelect = SDLLightgunMapping6Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping6Custom: TEditEx
        Left = 137
        Top = 147
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #6'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object SDLLightgunMapping7: TComboBox2Ex
        Left = 24
        Top = 172
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = 'auto'
        OnSelect = SDLLightgunMapping7Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping7Custom: TEditEx
        Left = 137
        Top = 172
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #7'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object SDLLightgunMapping8: TComboBox2Ex
        Left = 24
        Top = 197
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = 'auto'
        OnSelect = SDLLightgunMapping8Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLLightgunMapping8Custom: TEditEx
        Left = 137
        Top = 197
        Width = 140
        Height = 23
        Hint = 'Name of lightgun mapped to lightgun #8'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
    end
    object SDL2MouseMappingGroupBox: TPanelEx
      Left = 632
      Top = 12
      Width = 287
      Height = 230
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
      object SDL2MouseMappingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Mouse Mapping (SDL 2)'
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
      object SDL2MouseMapping1Label: TShadowLabel
        Left = 8
        Top = 27
        Width = 14
        Height = 16
        Caption = '#1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping2Label: TShadowLabel
        Left = 8
        Top = 51
        Width = 14
        Height = 16
        Caption = '#2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping3Label: TShadowLabel
        Left = 8
        Top = 76
        Width = 14
        Height = 16
        Caption = '#3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping4Label: TShadowLabel
        Left = 8
        Top = 101
        Width = 14
        Height = 16
        Caption = '#4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping5Label: TShadowLabel
        Left = 8
        Top = 126
        Width = 14
        Height = 16
        Caption = '#5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping6Label: TShadowLabel
        Left = 8
        Top = 151
        Width = 14
        Height = 16
        Caption = '#6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping7Label: TShadowLabel
        Left = 8
        Top = 175
        Width = 14
        Height = 16
        Caption = '#7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping8Label: TShadowLabel
        Left = 8
        Top = 200
        Width = 14
        Height = 16
        Caption = '#8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2MouseMapping1: TComboBox2Ex
        Left = 24
        Top = 22
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'auto'
        OnSelect = SDL2MouseMapping1Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping1Custom: TEditEx
        Left = 137
        Top = 22
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #1'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object SDL2MouseMapping2: TComboBox2Ex
        Left = 24
        Top = 47
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'auto'
        OnSelect = SDL2MouseMapping2Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping2Custom: TEditEx
        Left = 137
        Top = 47
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #2'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object SDL2MouseMapping3: TComboBox2Ex
        Left = 24
        Top = 72
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'auto'
        OnSelect = SDL2MouseMapping3Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping3Custom: TEditEx
        Left = 137
        Top = 72
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #3'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object SDL2MouseMapping4: TComboBox2Ex
        Left = 24
        Top = 97
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'auto'
        OnSelect = SDL2MouseMapping4Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping4Custom: TEditEx
        Left = 137
        Top = 97
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #4'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object SDL2MouseMapping5: TComboBox2Ex
        Left = 24
        Top = 122
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Text = 'auto'
        OnSelect = SDL2MouseMapping5Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping5Custom: TEditEx
        Left = 137
        Top = 122
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #5'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object SDL2MouseMapping6: TComboBox2Ex
        Left = 24
        Top = 147
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Text = 'auto'
        OnSelect = SDL2MouseMapping6Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping6Custom: TEditEx
        Left = 137
        Top = 147
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #6'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object SDL2MouseMapping7: TComboBox2Ex
        Left = 24
        Top = 172
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = 'auto'
        OnSelect = SDL2MouseMapping7Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping7Custom: TEditEx
        Left = 137
        Top = 172
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #7'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object SDL2MouseMapping8: TComboBox2Ex
        Left = 24
        Top = 197
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = 'auto'
        OnSelect = SDL2MouseMapping8Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2MouseMapping8Custom: TEditEx
        Left = 137
        Top = 197
        Width = 140
        Height = 23
        Hint = 'Name of mouse mapped to mouse #8'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
    end
    object SDLJoystickMappingGroupBox: TPanelEx
      Left = 329
      Top = 269
      Width = 287
      Height = 230
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
      object SDLJoystickMappingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Joystick Mapping'
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
      object SDLJoystickMapping1Label: TShadowLabel
        Left = 8
        Top = 27
        Width = 14
        Height = 16
        Caption = '#1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping2Label: TShadowLabel
        Left = 8
        Top = 51
        Width = 14
        Height = 16
        Caption = '#2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping3Label: TShadowLabel
        Left = 8
        Top = 76
        Width = 14
        Height = 16
        Caption = '#3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping4Label: TShadowLabel
        Left = 8
        Top = 101
        Width = 14
        Height = 16
        Caption = '#4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping5Label: TShadowLabel
        Left = 8
        Top = 126
        Width = 14
        Height = 16
        Caption = '#5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping6Label: TShadowLabel
        Left = 8
        Top = 151
        Width = 14
        Height = 16
        Caption = '#6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping7Label: TShadowLabel
        Left = 8
        Top = 175
        Width = 14
        Height = 16
        Caption = '#7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping8Label: TShadowLabel
        Left = 8
        Top = 200
        Width = 14
        Height = 16
        Caption = '#8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLJoystickMapping1: TComboBox2Ex
        Left = 24
        Top = 22
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'auto'
        OnSelect = SDLJoystickMapping1Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping1Custom: TEditEx
        Left = 137
        Top = 22
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #1'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object SDLJoystickMapping2: TComboBox2Ex
        Left = 24
        Top = 47
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'auto'
        OnSelect = SDLJoystickMapping2Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping2Custom: TEditEx
        Left = 137
        Top = 47
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #2'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object SDLJoystickMapping3: TComboBox2Ex
        Left = 24
        Top = 72
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'auto'
        OnSelect = SDLJoystickMapping3Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping3Custom: TEditEx
        Left = 137
        Top = 72
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #3'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object SDLJoystickMapping4: TComboBox2Ex
        Left = 24
        Top = 97
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'auto'
        OnSelect = SDLJoystickMapping4Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping4Custom: TEditEx
        Left = 137
        Top = 97
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #4'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object SDLJoystickMapping5: TComboBox2Ex
        Left = 24
        Top = 122
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Text = 'auto'
        OnSelect = SDLJoystickMapping5Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping5Custom: TEditEx
        Left = 137
        Top = 122
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #5'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object SDLJoystickMapping6: TComboBox2Ex
        Left = 24
        Top = 147
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Text = 'auto'
        OnSelect = SDLJoystickMapping6Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping6Custom: TEditEx
        Left = 137
        Top = 147
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #6'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object SDLJoystickMapping7: TComboBox2Ex
        Left = 24
        Top = 172
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = 'auto'
        OnSelect = SDLJoystickMapping7Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping7Custom: TEditEx
        Left = 137
        Top = 172
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #7'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object SDLJoystickMapping8: TComboBox2Ex
        Left = 24
        Top = 197
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = 'auto'
        OnSelect = SDLJoystickMapping8Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDLJoystickMapping8Custom: TEditEx
        Left = 137
        Top = 197
        Width = 140
        Height = 23
        Hint = 'Name of joystick mapped to joystick #8'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
      object PS3SixaxisControllers: TAdvOfficeCheckBoxEx
        Left = 146
        Top = -1
        Width = 135
        Height = 20
        Hint = 'Use special handling for PS3 Sixaxis controllers'
        TabOrder = 16
        Alignment = taLeftJustify
        Caption = 'PS3 Sixaxis Controller'
        ReturnIsTab = False
        CustomIconsEnabled = False
        CustomEnableIconHD = False
      end
    end
    object SDL2KeyboardMappingGroupBox: TPanelEx
      Left = 329
      Top = 12
      Width = 287
      Height = 230
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
      object SDL2KeyboardMappingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 285
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Keyboard Mapping (SDL 2)'
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
      object SDL2KeyboardMapping1Label: TShadowLabel
        Left = 8
        Top = 27
        Width = 14
        Height = 16
        Caption = '#1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping2Label: TShadowLabel
        Left = 8
        Top = 51
        Width = 14
        Height = 16
        Caption = '#2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping3Label: TShadowLabel
        Left = 8
        Top = 76
        Width = 14
        Height = 16
        Caption = '#3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping4Label: TShadowLabel
        Left = 8
        Top = 101
        Width = 14
        Height = 16
        Caption = '#4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping5Label: TShadowLabel
        Left = 8
        Top = 126
        Width = 14
        Height = 16
        Caption = '#5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping6Label: TShadowLabel
        Left = 8
        Top = 151
        Width = 14
        Height = 16
        Caption = '#6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping7Label: TShadowLabel
        Left = 8
        Top = 175
        Width = 14
        Height = 16
        Caption = '#7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping8Label: TShadowLabel
        Left = 8
        Top = 200
        Width = 14
        Height = 16
        Caption = '#8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2KeyboardMapping1: TComboBox2Ex
        Left = 24
        Top = 22
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping1Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping1Custom: TEditEx
        Left = 137
        Top = 22
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #1'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object SDL2KeyboardMapping2: TComboBox2Ex
        Left = 24
        Top = 47
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping2Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping2Custom: TEditEx
        Left = 137
        Top = 47
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #2'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object SDL2KeyboardMapping3: TComboBox2Ex
        Left = 24
        Top = 72
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping3Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping3Custom: TEditEx
        Left = 137
        Top = 72
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #3'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object SDL2KeyboardMapping4: TComboBox2Ex
        Left = 24
        Top = 97
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping4Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping4Custom: TEditEx
        Left = 137
        Top = 97
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #4'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object SDL2KeyboardMapping5: TComboBox2Ex
        Left = 24
        Top = 122
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping5Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping5Custom: TEditEx
        Left = 137
        Top = 122
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #5'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object SDL2KeyboardMapping6: TComboBox2Ex
        Left = 24
        Top = 147
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping6Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping6Custom: TEditEx
        Left = 137
        Top = 147
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #6'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object SDL2KeyboardMapping7: TComboBox2Ex
        Left = 24
        Top = 172
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping7Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping7Custom: TEditEx
        Left = 137
        Top = 172
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #7'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object SDL2KeyboardMapping8: TComboBox2Ex
        Left = 24
        Top = 197
        Width = 108
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = 'auto'
        OnSelect = SDL2KeyboardMapping8Select
        Items.Strings = (
          'auto'
          'Custom Name')
      end
      object SDL2KeyboardMapping8Custom: TEditEx
        Left = 137
        Top = 197
        Width = 140
        Height = 23
        Hint = 'Name of keyboard mapped to keyboard #8'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
    end
    object SDLLowLevelDriverGroupBox: TPanelEx
      Left = 8
      Top = 315
      Width = 305
      Height = 115
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
      object SDLLowLevelDriverGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 303
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'SDL Low Level Driver'
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
      object SDLVideoDriverToUseLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 65
        Height = 16
        Caption = 'Video Driver'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDL2RenderDriverToUseLabel: TShadowLabel
        Left = 107
        Top = 20
        Width = 72
        Height = 16
        Caption = 'Render Driver'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLAudioDriverToUseLabel: TShadowLabel
        Left = 205
        Top = 20
        Width = 67
        Height = 16
        Caption = 'Audio Driver'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLAlternativeLibGLToUseLabel: TShadowLabel
        Left = 8
        Top = 66
        Width = 248
        Height = 16
        Caption = 'Alternative libGL.so to use; '#39'auto'#39' is SDL default'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLVideoDriverToUse: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 90
        Height = 23
        Hint = 'SDL video driver to use'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'X11'
          'DirectFB')
      end
      object SDL2RenderDriverToUse: TComboBox2Ex
        Left = 107
        Top = 36
        Width = 89
        Height = 23
        Hint = 'SDL render driver to use'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Software'
          'OpenGL'
          'DirectFB')
      end
      object SDLAudioDriverToUse: TComboBox2Ex
        Left = 205
        Top = 36
        Width = 90
        Height = 23
        Hint = 'SDL audio driver to use'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Alsa'
          'Arts')
      end
      object SDLAlternativeLibGLToUse: TComboBox2Ex
        Left = 8
        Top = 82
        Width = 80
        Height = 23
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = 'Auto'
        OnSelect = SDLAlternativeLibGLToUseSelect
        Items.Strings = (
          'Auto'
          'Custom')
      end
      object SDLAlternativeLibGLToUseCustom: TEditEx
        Left = 91
        Top = 82
        Width = 158
        Height = 23
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 4
      end
      object SDLAlternativeLibGLToUseCustomButtonSelect: TBitBtnEx
        Left = 252
        Top = 82
        Width = 43
        Height = 23
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = SDLAlternativeLibGLToUseCustomButtonSelectClick
      end
    end
    object SDLAttachWindowGroupBox: TPanelEx
      Left = 8
      Top = 446
      Width = 305
      Height = 53
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object SDLAttachWindowGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 303
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Attach To Arbitrary Window'
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
      object SDLAttachWindow: TEditEx
        Left = 8
        Top = 22
        Width = 241
        Height = 21
        Hint = 'Specify a font to use'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object SDLAttachWindowButtonClear: TBitBtnEx
        Left = 252
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a font'
        Caption = 'Clear'
        Enabled = False
        TabOrder = 1
        OnClick = SDLAttachWindowButtonClearClick
      end
    end
    object SDKKeyboardMappingGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 305
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
      object SDKKeyboardMappingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 303
        Height = 18
        Align = alTop
        AutoSize = False
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
      object SDLKeymapFilenameLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 95
        Height = 16
        Caption = 'Keymap Filename'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDKKeyboardMapping: TAdvOfficeCheckBoxEx
        Left = 4
        Top = -1
        Width = 185
        Height = 20
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Enable SDL Keyboard Mapping'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SDLKeymapFilenameButtonReset: TBitBtnEx
        Left = 252
        Top = 36
        Width = 43
        Height = 21
        Hint = 'Click here to reset filename to default'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = SDLKeymapFilenameButtonResetClick
      end
      object SDLKeymapFilenameButtonSelect: TBitBtnEx
        Left = 206
        Top = 36
        Width = 43
        Height = 21
        Hint = 'Click here to disable this feature'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = SDLKeymapFilenameButtonSelectClick
      end
      object SDLKeymapFilename: TEditEx
        Left = 8
        Top = 36
        Width = 195
        Height = 21
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object SDLOutputModeGroupBox: TPanelEx
      Left = 8
      Top = 151
      Width = 305
      Height = 92
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
      object SDLOutputModeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 303
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Output Mode'
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
      object SDLScaleModeLabel: TShadowLabel
        Left = 8
        Top = 43
        Width = 197
        Height = 16
        Caption = 'Scale Mode (Software Renderer Only)'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SDLCenterHorizontally: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 124
        Height = 20
        Hint = 'Center horizontally within the view area'
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Center Horizontally'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SDLCenterVertically: TAdvOfficeCheckBoxEx
        Left = 193
        Top = 20
        Width = 107
        Height = 20
        Hint = 'Center vertically within the view area'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Center Vertically'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SDLScaleMode: TComboBox2Ex
        Left = 8
        Top = 59
        Width = 287
        Height = 23
        Style = csDropDownList
        Color = clWhite
        DropDownCount = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'None'
        Items.Strings = (
          'None'
          'Async'
          'YV12'
          'YUY2'
          'YV12x2'
          'YUY2x2'
          'Hardware Blit (SDL 2)'
          'Hardware Best (SDL 2)')
      end
    end
  end
  object Panel7_Miscellaneous: TPanelEx
    Left = 1880
    Top = 1112
    Width = 927
    Height = 507
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SkipGameInfo: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 98
      Width = 105
      Height = 20
      Hint = 'Skip displaying the system information screen at startup'
      Enabled = False
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Skip Game Info'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ReadConfigFiles: TAdvOfficeCheckBoxEx
      Left = 120
      Top = 98
      Width = 114
      Height = 20
      Hint = 'Enable loading of configuration files'
      Checked = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Read Config Files'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object WriteConfigFiles: TAdvOfficeCheckBoxEx
      Left = 120
      Top = 119
      Width = 115
      Height = 20
      Hint = 'Write configuration to (driver).ini on exit'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Write Config Files'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Cheat: TAdvOfficeCheckBoxEx
      Left = 120
      Top = 140
      Width = 105
      Height = 20
      Hint = 'Enable cheat subsystem'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Cheats Enabled'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ConfirmQuit: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 140
      Width = 97
      Height = 20
      Hint = 'Ask for confirmation before exiting'
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Confirm Quit'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DRC: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 357
      Width = 141
      Height = 20
      Hint = 'Enable DRC CPU core if available'
      Checked = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Enable DRC CPU Core'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DRCUseC: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 378
      Width = 189
      Height = 20
      Hint = 'Force DRC to use C backend'
      ShowHint = False
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Force DRC To Use C Backend'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DRCLogUML: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 399
      Width = 194
      Height = 20
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Write DRC UML Disassembly Log'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DRCLogNative: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 420
      Width = 201
      Height = 20
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Write DRC Native Disassembly Log'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SaveNVRAMOnExit: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 182
      Width = 128
      Height = 20
      Hint = 
        'Enable automatic restore at startup, and automatic save at exit ' +
        'time'
      Checked = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Save NVRAM on Exit'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AutoSave: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 12
      Width = 103
      Height = 20
      Hint = 
        'Enable automatic restore at startup, and automatic save at exit ' +
        'time'
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'Auto Save State'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableSaveStateRewind: TAdvOfficeCheckBoxEx
      Left = 168
      Top = 12
      Width = 152
      Height = 20
      Hint = 'Enable rewind save states'
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Enable Save State Rewind'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SkipMandatoryFileMan: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 161
      Width = 202
      Height = 20
      Hint = 
        'Skip prompting the user for any mandatory images with the file m' +
        'anager at startup'
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Skip Mandatory Images at Startup'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SkipWarnings: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 119
      Width = 105
      Height = 20
      Hint = 'Display fewer repeated warnings about imperfect emulation'
      TabOrder = 13
      Alignment = taLeftJustify
      Caption = 'Skip Warnings'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UserInterfaceGroupBox: TPanelEx
      Left = 240
      Top = 107
      Width = 216
      Height = 391
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
      object UserInterfaceGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'User Interface'
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
      object UIFontLabel: TShadowLabel
        Left = 8
        Top = 344
        Width = 96
        Height = 16
        Caption = 'User Inteface Font'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object TypeUserInterfaceLabel: TShadowLabel
        Left = 8
        Top = 254
        Width = 151
        Height = 16
        Caption = 'Type of User Interface To Use'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object UIFontProviderLabel: TShadowLabel
        Left = 8
        Top = 299
        Width = 162
        Height = 16
        Caption = 'Frovider For UI Font Rendering'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object DisplayLanguageLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 94
        Height = 16
        Caption = 'Display Language'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object UIFontButtonSelect: TBitBtnEx
        Left = 164
        Top = 360
        Width = 43
        Height = 21
        Hint = 'Click here to select a font'
        Caption = 'Select'
        Enabled = False
        TabOrder = 0
        OnClick = UIFontButtonSelectClick
      end
      object UIFont: TEditEx
        Left = 8
        Top = 360
        Width = 151
        Height = 21
        Hint = 'Specify a font to use'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object TypeUserInterface: TComboBox2Ex
        Left = 8
        Top = 270
        Width = 198
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 1
        ParentFont = False
        TabOrder = 2
        Text = 'Cabinet'
        Items.Strings = (
          'Simple'
          'Cabinet')
      end
      object UIFontProvider: TComboBox2Ex
        Left = 8
        Top = 315
        Width = 198
        Height = 23
        Hint = 'Provider for user interface font'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'None'
          'Windows'
          'SDL')
      end
      object DisplayLanguageList: TEasyListview
        Left = 8
        Top = 38
        Width = 198
        Height = 208
        Hint = 'Specify a localization language found in the languagepath tree'
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        Enabled = False
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000000C2000000FFFFFF1F0001000000
          010000001A0000004C0061006E00670075006100670065002000280064006500
          6600610075006C007400200069006E00200062006F006C006400290000000000
          0000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Height = 23
        Header.Sizeable = False
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = FormMain.IL_MenuPopup
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
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
        TabOrder = 4
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemPaintText = FolderROMsItemPaintText
      end
    end
    object RAMSizeGroupBox: TPanelEx
      Left = 8
      Top = 277
      Width = 216
      Height = 67
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object RAMSizeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'RAM Size'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object RAMSizeLabel: TShadowLabel
        Left = 8
        Top = 21
        Width = 135
        Height = 16
        Caption = 'Select a Size For The RAM'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object RAMSize: TComboBox2Ex
        Left = 8
        Top = 37
        Width = 198
        Height = 23
        Style = csDropDownList
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object DebugGroupBox: TPanelEx
      Left = 472
      Top = 360
      Width = 448
      Height = 138
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
      object DebugGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
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
      object DebuggerScriptLabel: TShadowLabel
        Left = 112
        Top = 91
        Width = 86
        Height = 16
        Caption = 'Debugger Script'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object WatchdogLabel: TShadowLabel
        Left = 8
        Top = 43
        Width = 56
        Height = 16
        Hint = 
          'Creates new thread that kills the application after a few second' +
          's'
        Caption = 'Watchdog'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object DebuggerLabel: TShadowLabel
        Left = 109
        Top = 43
        Width = 90
        Height = 16
        Caption = 'Debugger To Use'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object WatchdogSecsLabel: TShadowLabel
        Left = 67
        Top = 62
        Width = 23
        Height = 16
        Hint = 
          'Creates new thread that kills the application after a few second' +
          's'
        Caption = 'secs'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object DebuggerPortLabel: TShadowLabel
        Left = 341
        Top = 89
        Width = 23
        Height = 16
        Caption = 'Port'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object DebuggerFont: TShadowLabel
        Left = 8
        Top = 90
        Width = 85
        Height = 37
        Hint = 'Lucida Console [Auto]'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Font'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Lucida Console'
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
        OnClick = DebuggerFontClick
      end
      object DebuggerFontSizeLabel: TShadowLabel
        Left = 226
        Top = 41
        Width = 140
        Height = 16
        AutoSize = False
        Caption = 'Font Size [Auto]'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object DebuggerEnable: TAdvOfficeCheckBoxEx
        Left = 4
        Top = -1
        Width = 115
        Height = 20
        Hint = 'Enable loading of configuration files'
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Enable Debugger'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Log: TAdvOfficeCheckBoxEx
        Left = 317
        Top = 20
        Width = 42
        Height = 20
        Hint = 'Generate an error.log file'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object OSLog: TAdvOfficeCheckBoxEx
        Left = 384
        Top = 20
        Width = 57
        Height = 20
        Hint = 
          'Output error.log data to system diagnostic output (debugger or s' +
          'tandard error)'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'OS Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Verbose: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 64
        Height = 20
        Hint = 'Display additional diagnostic information'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Verbose'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UpdateInPause: TAdvOfficeCheckBoxEx
        Left = 96
        Top = 20
        Width = 109
        Height = 20
        Hint = 'Keep calling video updates while in pause'
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Update In Pause'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DebuggerScript: TEditEx
        Left = 112
        Top = 107
        Width = 175
        Height = 21
        Hint = 'Script for debugger'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object DebuggerScriptButtonSelect: TBitBtnEx
        Left = 290
        Top = 107
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = DebuggerScriptButtonSelectClick
      end
      object Watchdog: TEditEx
        Left = 8
        Top = 59
        Width = 56
        Height = 21
        Hint = 
          'Creates new thread that kills the application after a few second' +
          's'
        AutoSize = False
        TabOrder = 7
        Text = '2500'
        OnKeyPress = WatchdogKeyPress
      end
      object Debugger: TComboBox2Ex
        Left = 109
        Top = 59
        Width = 97
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Internal'
          'Windows'
          'None')
      end
      object DebuggerPort: TEditEx
        Left = 341
        Top = 107
        Width = 51
        Height = 21
        Hint = 'Port to use for GDB stub debugger'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object DebuggerPortButtonReset: TBitBtnEx
        Left = 395
        Top = 107
        Width = 43
        Height = 21
        Hint = 'Click here to use the default port'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = DebuggerPortButtonResetClick
      end
      object DebugLogConsole: TAdvOfficeCheckBoxEx
        Left = 228
        Top = 20
        Width = 65
        Height = 20
        Hint = 'Write debug console output to debug.log'
        TabOrder = 11
        Alignment = taLeftJustify
        Caption = 'Console'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DebuggerFontButtonReset: TBitBtnEx
        Left = 395
        Top = 59
        Width = 43
        Height = 21
        Hint = 'Click here to reset to default'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = DebuggerFontButtonResetClick
      end
      object DebuggerFontSize: TGaugeBar
        Left = 226
        Top = 59
        Width = 166
        Height = 21
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 4
        Max = 48
        Min = -1
        ShowHint = False
        ShowHandleGrip = True
        Position = 0
        OnChange = DebuggerFontSizeChange
      end
    end
    object SaveStateRewindBufferSizeGroupBox: TPanelEx
      Left = 8
      Top = 38
      Width = 448
      Height = 53
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
      object SaveStateRewindBufferSizeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Hint = 'Rewind Buffer Size'
        Align = alTop
        AutoSize = False
        Caption = 'Rewind Buffer Size [100 MegaBytes]'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object SaveStateRewindBufferSize: TGaugeBar
        Left = 8
        Top = 22
        Width = 430
        Height = 21
        Hint = 'Rewind buffer size in megabytes'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 5
        Max = 2048
        Min = 1
        ShowHandleGrip = True
        Position = 100
        OnChange = SaveStateRewindBufferSizeChange
      end
    end
    object SaveStateNameGroupBox: TPanelEx
      Left = 8
      Top = 208
      Width = 216
      Height = 53
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
      object SaveStateNameGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Save State Name'
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
      object SaveStateNameButtonReset: TBitBtnEx
        Left = 164
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Set default save state name'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = SaveStateNameButtonResetClick
      end
      object SaveStateName: TEditEx
        Left = 8
        Top = 22
        Width = 151
        Height = 21
        Hint = 'Override of the default state subfolder naming; %g == gamename'
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object BiosSetsGroupBox: TPanelEx
      Left = 472
      Top = 12
      Width = 448
      Height = 332
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
      object BiosSetsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Select the System BIOS to Use'
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
      object BiosSetsListView: TEasyListview
        Left = 8
        Top = 22
        Width = 430
        Height = 300
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000018010000FFFFFF1F0001000000
          010000002800000053006500740020005400690074006C006500200028006400
          65006600610075006C00740020006D00610072006B0065006400200077006900
          740068002000720061006D002000690063006F006E0029000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          00800800010100010100000000000090000000FFFFFF1F000100000001000000
          0800000053006500740020004E0061006D006500000000000000000000000000
          110000005445617379436F6C756D6E53746F726564FFFECE0006000000800000
          01010001020000000000015F000000FFFFFF1F00010000000100000010000000
          50006100720065006E0074002000420069006F00730020004E0061006D006500
          000000000000000000000000110000005445617379436F6C756D6E53746F7265
          64FFFECE000600000080000001010001030000000000012D000000FFFFFF1F00
          01000000010000000B000000440065006600610075006C007400200053006500
          7400000000000000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = FormMain.IL_MenuPopup
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
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
        CustomEnableIconHD = False
        OnItemCompare = BiosSetsListViewItemCompare
        OnItemPaintText = FolderROMsItemPaintText
      end
    end
  end
  object Panel4_Video3b: TPanelEx
    Left = 1872
    Top = 618
    Width = 927
    Height = 473
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object HLSLEnable: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 12
      Width = 88
      Height = 20
      Hint = 'Enables HLSL post-processing (Pixel Shader 3.0 required)'
      TabOrder = 0
      OnClick = HLSLEnableClick
      Alignment = taLeftJustify
      Caption = 'Enable HLSL'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object YIQEnable: TAdvOfficeCheckBoxEx
      Left = 316
      Top = 33
      Width = 141
      Height = 20
      Hint = 
        'Enables YIQ-colorspace post-processing. Causes a performance dro' +
        'p but gives a much more authentic'#13#10'NTSC TV appearance on TV-base' +
        'd systems when configured properly'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Enable YIQ Colorspace'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object HLSLOversampling: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 33
      Width = 162
      Height = 20
      Hint = 
        'Render the image in a resolution twice as high, which can help t' +
        'o reduces moir'#233'-effects'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable HLSL Oversampling'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object HLSLPathGroupBox: TPanelEx
      Left = 8
      Top = 59
      Width = 448
      Height = 53
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
      object HLSLPathGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to HLSL Files'
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
      object HLSLPathButtonSelect: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = HLSLPathButtonSelectClick
      end
      object HLSLPath: TEditEx
        Left = 8
        Top = 22
        Width = 384
        Height = 21
        Hint = 'Path to the .fx files that are in use'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object ShadowMaskTextureGroupBox: TPanelEx
      Left = 8
      Top = 128
      Width = 448
      Height = 53
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
      object ShadowMaskTextureGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Shadow Mask Texture'
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
      object ShadowMaskTextureButtonReset: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to set default filename'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ShadowMaskTextureButtonResetClick
      end
      object ShadowMaskTextureButtonSelect: TBitBtnEx
        Left = 349
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ShadowMaskTextureButtonSelectClick
      end
      object ShadowMaskTexture: TEditEx
        Left = 8
        Top = 22
        Width = 338
        Height = 21
        Hint = 'A PNG that defines the shadow mask for each pixel'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object ShadowMaskTileModeGroupBox: TPanelEx
      Left = 8
      Top = 196
      Width = 216
      Height = 53
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
      object ShadowMaskTileModeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Shadow Mask Tile Mode'
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
      object ShadowMaskTileMode: TComboBox2Ex
        Left = 8
        Top = 22
        Width = 198
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Screen Based'
        Items.Strings = (
          'Screen Based'
          'Source Based')
      end
    end
    object VectorPostProcessingGroupBox: TPanelEx
      Left = 8
      Top = 339
      Width = 911
      Height = 109
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Enabled = False
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object VectorPostProcessingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 909
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Vector Post-Processing'
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
      object VectorBeamSmoothLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 185
        Height = 16
        Hint = 'Beam Smooth [%1.2f]'
        AutoSize = False
        Caption = 'Beam Smooth [0.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorMaximumAttenuationLabel: TShadowLabel
        Left = 233
        Top = 20
        Width = 185
        Height = 16
        Hint = 'Maximum Attenuation [%1.2f]'
        AutoSize = False
        Caption = 'Maximum Attenuation [0.50]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorMinimumLengthAttenuationLabel: TShadowLabel
        Left = 8
        Top = 63
        Width = 250
        Height = 16
        Hint = 'Minimum Attenuation Length [%1.3f]'
        AutoSize = False
        Caption = 'Minimum Attenuation Length [0.500]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorBeamSmooth: TGaugeBar2
        Left = 8
        Top = 36
        Width = 205
        Height = 20
        Hint = 'The vector beam smoothness'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        OnChange = VectorBeamSmoothChange
      end
      object VectorMaximumAttenuation: TGaugeBar2
        Left = 233
        Top = 36
        Width = 205
        Height = 20
        Hint = 'The maximum vector attenuation'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 1.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 0.500000000000000000
        OnChange = VectorMaximumAttenuationChange
      end
      object VectorMinimumLengthAttenuation: TGaugeBar2
        Left = 8
        Top = 79
        Width = 893
        Height = 20
        Hint = 
          'The minimum vector length (vector length to screen size ratio) t' +
          'hat is affected by the attenuation'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.009999999776482582
        Max = 1.000000000000000000
        Min = 0.001000000047497451
        ThreeDecimalDigits = True
        ShowHandleGrip = True
        SmallChange = 0.001000000047497451
        Position = 0.500000000000000000
        OnChange = VectorMinimumLengthAttenuationChange
      end
    end
    object HLSLIniFileGroupBox: TPanelEx
      Left = 8
      Top = 265
      Width = 448
      Height = 53
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
      object HLSLIniFileGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'HLSL Ini File Name For This Game'
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
      object ReadCustomHLSLFile: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 23
        Width = 70
        Height = 20
        Hint = 'Enable custom HLSL ini reading'
        Enabled = False
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Read File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object WriteCustomHLSLFile: TAdvOfficeCheckBoxEx
        Left = 84
        Top = 23
        Width = 72
        Height = 20
        Hint = 'Enable custom HLSL ini writing'
        Enabled = False
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Write File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object HLSLIniFile: TEditEx
        Left = 157
        Top = 22
        Width = 235
        Height = 21
        Hint = 'HLSL ini file name for this game'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object HLSLIniFileButtonReset: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to reset HLSL custom filename to default'
        Caption = 'Reset'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = HLSLIniFileButtonResetClick
      end
    end
    object HLSLUpscaleSnapGroupBox: TPanelEx
      Left = 240
      Top = 196
      Width = 216
      Height = 53
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
      object HLSLUpscaleSnapGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Upscaled Snap Resolution'
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
      object HLSLUpscaleSnapshotXLabel: TShadowLabel
        Left = 80
        Top = 24
        Width = 8
        Height = 16
        Caption = 'X'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object HLSLUpscaleSnapX: TEditEx
        Left = 8
        Top = 22
        Width = 67
        Height = 21
        Hint = 'Width'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = HLSLUpscaleSnapXKeyPress
      end
      object HLSLUpscaleSnapY: TEditEx
        Left = 93
        Top = 22
        Width = 67
        Height = 21
        Hint = 'Height'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = HLSLUpscaleSnapYKeyPress
      end
      object HLSLUpscaleSnapButtonReset: TBitBtnEx
        Left = 163
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to set default upscale resolution'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = HLSLUpscaleSnapButtonResetClick
      end
    end
    object HLSLBloomPostProcessingGroupBox: TPanelEx
      Left = 472
      Top = 59
      Width = 448
      Height = 164
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
      object HLSLBloomPostProcessingGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Bloom Post-Processing'
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
      object BloomBlendModeLabel: TShadowLabel
        Left = 8
        Top = 20
        Width = 103
        Height = 16
        Caption = 'Bloom Blend Mode'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object BloomBlendMode: TComboBox2Ex
        Left = 8
        Top = 36
        Width = 129
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Brighten'
        Items.Strings = (
          'Brighten'
          'Darken')
      end
      object BloomLUTTextureScreen: TEditEx
        Left = 8
        Top = 85
        Width = 338
        Height = 21
        Hint = '3D LUT texture filename for screen'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object BloomLUTTextureScreenButtonSelect: TBitBtnEx
        Left = 349
        Top = 85
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BloomLUTTextureScreenButtonSelectClick
      end
      object BloomLUTTextureScreenButtonReset: TBitBtnEx
        Left = 395
        Top = 85
        Width = 43
        Height = 21
        Hint = 'Click here to set default filename (empty)'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BloomLUTTextureScreenButtonResetClick
      end
      object BloomLUTEnabled: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 65
        Width = 162
        Height = 20
        Hint = 'Enables 3D LUT to be applied to screen after post-processing'
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Enable Screen LUT Texture'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object BloomLOOTUIEnabled: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 113
        Width = 191
        Height = 20
        Hint = 
          'Enables 3D LUT to be applied to UI and artwork after post-proces' +
          'sing'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Enable UI / Artwork LUT Texture'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object BloomLUTTextureUI: TEditEx
        Left = 8
        Top = 133
        Width = 338
        Height = 21
        Hint = '3D LUT texture filename of UI'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object BloomLUTTextureUIButtonSelect: TBitBtnEx
        Left = 349
        Top = 133
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BloomLUTTextureUIButtonSelectClick
      end
      object BloomLUTTextureUIButtonReset: TBitBtnEx
        Left = 395
        Top = 133
        Width = 43
        Height = 21
        Hint = 'Click here to set default filename (empty)'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BloomLUTTextureUIButtonResetClick
      end
    end
  end
  object PanelBottom: TPanelEx
    Tag = 1
    Left = 0
    Top = 608
    Width = 927
    Height = 35
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ButtonCancel: TBitBtnEx
      Left = 830
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object ButtonOk: TBitBtnEx
      Left = 733
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
    end
    object SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx
      Left = 447
      Top = 5
      Width = 195
      Height = 20
      Hint = 
        'Check settings from all custom files to avoid duplicates and kee' +
        'p files clean'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = SaveValidateAllCustomFilesClick
      Alignment = taLeftJustify
      Caption = 'Validate All Custom Files on Save'
      ReturnIsTab = False
      ShadowColor = clSkyBlue
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx
      Left = 427
      Top = 7
      Width = 15
      Height = 15
      Hint = 'What is this settings for ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButtonHelpSaveValidateAllCustomFilesClick
    end
    object ButtonReadFileHelp: TBitBtnEx
      Left = 202
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Why two reload buttons ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonReadFileHelpClick
    end
    object ButtonResetToDefault: TBitBtnEx
      Left = 105
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Load only emulator default settings'
      Caption = 'Reset to Default'
      TabOrder = 5
      OnClick = ButtonResetToDefaultClick
    end
    object ButtonReadFile: TBitBtnEx
      Left = 8
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Reload configuration files'
      Caption = 'Reload Settings'
      TabOrder = 6
      OnClick = ButtonReadFileClick
    end
  end
  object SampleBox: TPanelEx
    Left = 1248
    Top = 672
    Width = 287
    Height = 53
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
  object Panel4_Video3c: TPanelEx
    Left = 2808
    Top = 618
    Width = 927
    Height = 473
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object EnableOpenGLFilterNotFFLabel: TShadowLabel
      Left = 490
      Top = 51
      Width = 254
      Height = 19
      Caption = 'Checked: Bilinear (Default); Unchecked: Plain'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object OpenGLForcePowerTwoTextures: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 33
      Width = 172
      Height = 20
      Hint = 
        'Always use only power-of-2 sized textures'#13#10'Can cause graphic cor' +
        'ruption on recent video cards!'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Force Power of Two Textures'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object OpenGLDisableUseGL_ARBTextureRectangle: TAdvOfficeCheckBoxEx
      Left = 472
      Top = 12
      Width = 214
      Height = 20
      Hint = 'Can cause graphic corruption on recent video cards!'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Don'#39't Use GL_ARB Texture Rectangle'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableOpenGL_VBO: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 54
      Width = 81
      Height = 20
      Hint = 'Enable OpenGL VBO, if available'
      Checked = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable VBO'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableOpenGL_PBO: TAdvOfficeCheckBoxEx
      Left = 150
      Top = 54
      Width = 82
      Height = 20
      Hint = 'Enable OpenGL PBO, if available'
      Checked = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Enable PBO'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableGLSL: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 12
      Width = 89
      Height = 20
      Hint = 'Enable OpenGL GLSL, if available'
      TabOrder = 4
      OnClick = EnableGLSLClick
      Alignment = taLeftJustify
      Caption = 'Enable GLSL'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableOpenGLFilterNotFF: TAdvOfficeCheckBoxEx
      Left = 472
      Top = 33
      Width = 214
      Height = 18
      Checked = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Use OpenGL Filter Instead of FF Filter'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object GLSL_Shader_MAMEGroupBox: TPanelEx
      Left = 8
      Top = 80
      Width = 448
      Height = 269
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
      object GLSL_Shader_MAMEGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Custom OpenGL GLSL Shader Set MAME'
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
      object GLSL_Shader_MAME0Label: TShadowLabel
        Left = 8
        Top = 25
        Width = 7
        Height = 16
        Caption = '0'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME1Label: TShadowLabel
        Left = 8
        Top = 49
        Width = 7
        Height = 16
        Caption = '1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME2Label: TShadowLabel
        Left = 8
        Top = 73
        Width = 7
        Height = 16
        Caption = '2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME3Label: TShadowLabel
        Left = 8
        Top = 97
        Width = 7
        Height = 16
        Caption = '3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME4Label: TShadowLabel
        Left = 8
        Top = 121
        Width = 7
        Height = 16
        Caption = '4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME5Label: TShadowLabel
        Left = 8
        Top = 145
        Width = 7
        Height = 16
        Caption = '5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME6Label: TShadowLabel
        Left = 8
        Top = 169
        Width = 7
        Height = 16
        Caption = '6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME7Label: TShadowLabel
        Left = 8
        Top = 193
        Width = 7
        Height = 16
        Caption = '7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME8Label: TShadowLabel
        Left = 8
        Top = 217
        Width = 7
        Height = 16
        Caption = '8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME9Label: TShadowLabel
        Left = 8
        Top = 241
        Width = 7
        Height = 16
        Caption = '9'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_MAME0: TEditEx
        Left = 20
        Top = 22
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 0
      end
      object GLSL_Shader_MAME0ButtonSelect: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = GLSL_Shader_MAME0ButtonSelectClick
      end
      object GLSL_Shader_MAME1: TEditEx
        Left = 20
        Top = 46
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 2
      end
      object GLSL_Shader_MAME1ButtonSelect: TBitBtnEx
        Left = 395
        Top = 46
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = GLSL_Shader_MAME1ButtonSelectClick
      end
      object GLSL_Shader_MAME2: TEditEx
        Left = 20
        Top = 70
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 4
      end
      object GLSL_Shader_MAME2ButtonSelect: TBitBtnEx
        Left = 395
        Top = 70
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = GLSL_Shader_MAME2ButtonSelectClick
      end
      object GLSL_Shader_MAME3: TEditEx
        Left = 20
        Top = 94
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 6
      end
      object GLSL_Shader_MAME3ButtonSelect: TBitBtnEx
        Left = 395
        Top = 94
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = GLSL_Shader_MAME3ButtonSelectClick
      end
      object GLSL_Shader_MAME4: TEditEx
        Left = 20
        Top = 118
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 8
      end
      object GLSL_Shader_MAME4ButtonSelect: TBitBtnEx
        Left = 395
        Top = 118
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = GLSL_Shader_MAME4ButtonSelectClick
      end
      object GLSL_Shader_MAME5: TEditEx
        Left = 20
        Top = 142
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 10
      end
      object GLSL_Shader_MAME5ButtonSelect: TBitBtnEx
        Left = 395
        Top = 142
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = GLSL_Shader_MAME5ButtonSelectClick
      end
      object GLSL_Shader_MAME6: TEditEx
        Left = 20
        Top = 166
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 12
      end
      object GLSL_Shader_MAME6ButtonSelect: TBitBtnEx
        Left = 395
        Top = 166
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnClick = GLSL_Shader_MAME6ButtonSelectClick
      end
      object GLSL_Shader_MAME7: TEditEx
        Left = 20
        Top = 190
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 14
      end
      object GLSL_Shader_MAME7ButtonSelect: TBitBtnEx
        Left = 395
        Top = 190
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnClick = GLSL_Shader_MAME7ButtonSelectClick
      end
      object GLSL_Shader_MAME8: TEditEx
        Left = 20
        Top = 214
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 16
      end
      object GLSL_Shader_MAME8ButtonSelect: TBitBtnEx
        Left = 395
        Top = 214
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = GLSL_Shader_MAME8ButtonSelectClick
      end
      object GLSL_Shader_MAME9: TEditEx
        Left = 20
        Top = 238
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 18
      end
      object GLSL_Shader_MAME9ButtonSelect: TBitBtnEx
        Left = 395
        Top = 238
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = GLSL_Shader_MAME9ButtonSelectClick
      end
    end
    object GLSL_Shader_ScreenGroupBox: TPanelEx
      Left = 472
      Top = 80
      Width = 448
      Height = 269
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
      object GLSL_Shader_ScreenGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Custom OpenGL GLSL Shader Screen'
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
      object GLSL_Shader_Screen0Label: TShadowLabel
        Left = 8
        Top = 25
        Width = 7
        Height = 16
        Caption = '0'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen1Label: TShadowLabel
        Left = 8
        Top = 49
        Width = 7
        Height = 16
        Caption = '1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen2Label: TShadowLabel
        Left = 8
        Top = 73
        Width = 7
        Height = 16
        Caption = '2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen3Label: TShadowLabel
        Left = 8
        Top = 97
        Width = 7
        Height = 16
        Caption = '3'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen4Label: TShadowLabel
        Left = 8
        Top = 121
        Width = 7
        Height = 16
        Caption = '4'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen5Label: TShadowLabel
        Left = 8
        Top = 145
        Width = 7
        Height = 16
        Caption = '5'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen6Label: TShadowLabel
        Left = 8
        Top = 169
        Width = 7
        Height = 16
        Caption = '6'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen7Label: TShadowLabel
        Left = 8
        Top = 193
        Width = 7
        Height = 16
        Caption = '7'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen8Label: TShadowLabel
        Left = 8
        Top = 217
        Width = 7
        Height = 16
        Caption = '8'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen9Label: TShadowLabel
        Left = 8
        Top = 241
        Width = 7
        Height = 16
        Caption = '9'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GLSL_Shader_Screen0: TEditEx
        Left = 20
        Top = 22
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 0
      end
      object GLSL_Shader_Screen0ButtonSelect: TBitBtnEx
        Left = 395
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = GLSL_Shader_Screen0ButtonSelectClick
      end
      object GLSL_Shader_Screen1: TEditEx
        Left = 20
        Top = 46
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 2
      end
      object GLSL_Shader_Screen1ButtonSelect: TBitBtnEx
        Left = 395
        Top = 46
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = GLSL_Shader_Screen1ButtonSelectClick
      end
      object GLSL_Shader_Screen2: TEditEx
        Left = 20
        Top = 70
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 4
      end
      object GLSL_Shader_Screen2ButtonSelect: TBitBtnEx
        Left = 395
        Top = 70
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = GLSL_Shader_Screen2ButtonSelectClick
      end
      object GLSL_Shader_Screen3: TEditEx
        Left = 20
        Top = 94
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 6
      end
      object GLSL_Shader_Screen3ButtonSelect: TBitBtnEx
        Left = 395
        Top = 94
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = GLSL_Shader_Screen3ButtonSelectClick
      end
      object GLSL_Shader_Screen4: TEditEx
        Left = 20
        Top = 118
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 8
      end
      object GLSL_Shader_Screen4ButtonSelect: TBitBtnEx
        Left = 395
        Top = 118
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = GLSL_Shader_Screen4ButtonSelectClick
      end
      object GLSL_Shader_Screen5: TEditEx
        Left = 20
        Top = 142
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 10
      end
      object GLSL_Shader_Screen5ButtonSelect: TBitBtnEx
        Left = 395
        Top = 142
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = GLSL_Shader_Screen5ButtonSelectClick
      end
      object GLSL_Shader_Screen6: TEditEx
        Left = 20
        Top = 166
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 12
      end
      object GLSL_Shader_Screen6ButtonSelect: TBitBtnEx
        Left = 395
        Top = 166
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnClick = GLSL_Shader_Screen6ButtonSelectClick
      end
      object GLSL_Shader_Screen7: TEditEx
        Left = 20
        Top = 190
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 14
      end
      object GLSL_Shader_Screen7ButtonSelect: TBitBtnEx
        Left = 395
        Top = 190
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnClick = GLSL_Shader_Screen7ButtonSelectClick
      end
      object GLSL_Shader_Screen8: TEditEx
        Left = 20
        Top = 214
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 16
      end
      object GLSL_Shader_Screen8ButtonSelect: TBitBtnEx
        Left = 395
        Top = 214
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = GLSL_Shader_Screen8ButtonSelectClick
      end
      object GLSL_Shader_Screen9: TEditEx
        Left = 20
        Top = 238
        Width = 372
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 18
      end
      object GLSL_Shader_Screen9ButtonSelect: TBitBtnEx
        Left = 395
        Top = 238
        Width = 43
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = GLSL_Shader_Screen9ButtonSelectClick
      end
    end
  end
end
