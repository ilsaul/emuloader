object FormSupermodelSettings: TFormSupermodelSettings
  Left = 1356
  Top = 405
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 743
  ClientWidth = 847
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 108
    Top = 715
    Width = 515
    Height = 16
    AutoSize = False
    Caption = 'LabelReadFileIni'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 12632284
    ShadowEnabled = False
    EllipsType = etPathEllips
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelFolderROMs: TShadowLabel
    Left = 8
    Top = 89
    Width = 76
    Height = 16
    Caption = 'ROMs Folders'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 847
    Height = 80
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = clWhite
    Color4 = 1117964
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 76
      Top = 49
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 735
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
      Left = 107
      Top = 46
      Width = 600
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
    object LabelGameStatus: TShadowLabel
      Left = 730
      Top = 45
      Width = 110
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
  object VideoGroupBox: TAdvGroupBoxEx
    Left = 8
    Top = 211
    Width = 831
    Height = 272
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 1
    object ResolutionLabel: TShadowLabel
      Left = 428
      Top = 20
      Width = 59
      Height = 16
      Caption = 'Resolution'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object Real3DVertexShaderLabel: TShadowLabel
      Left = 8
      Top = 76
      Width = 113
      Height = 16
      Caption = 'Real3D Vertex Shader'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object Real3DFragmentShaderLabel: TShadowLabel
      Left = 8
      Top = 126
      Width = 132
      Height = 16
      Caption = 'Real3D Fragment Shader'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object Video3DEngineLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 56
      Height = 16
      Caption = '3D Engine'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LoadTileMapVertexShader2DLabel: TShadowLabel
      Left = 428
      Top = 76
      Width = 177
      Height = 16
      Caption = 'Load Tile Map Vertex Shader (2D)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LoadTileMapFragmentShader2DLabel: TShadowLabel
      Left = 428
      Top = 126
      Width = 196
      Height = 16
      Caption = 'Load Tile Map Fragment Shader (2D)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LoadReal3DScrollFogVertexShaderLabel: TShadowLabel
      Left = 8
      Top = 176
      Width = 288
      Height = 16
      Caption = 'Load Real3D Scroll Fog Vertex Shader (New 3D Engine)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LoadReal3DScrollFogFragmentShaderLabel: TShadowLabel
      Left = 8
      Top = 226
      Width = 307
      Height = 16
      Caption = 'Load Real3D Scroll Fog Fragment Shader (New 3D Engine)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ScreenResolution: TComboBox2Ex
      Left = 428
      Top = 36
      Width = 169
      Height = 23
      Hint = 
        'Screen resolution (auto = current desktop  resolution / default ' +
        'emulator windowed resolution'
      Style = csDropDownList
      ItemHeight = 15
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DisableThrottle: TAdvOfficeCheckBoxEx
      Left = 672
      Top = 240
      Width = 105
      Height = 20
      Hint = 'Disable 60Hz frame rate limit (not recommended!)'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Disable Throttle'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object ShowFPS: TAdvOfficeCheckBoxEx
      Left = 432
      Top = 220
      Width = 72
      Height = 20
      Hint = 'Display frame rate in window title bar'
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Show FPS'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Real3DVertexShader: TEditEx
      Left = 8
      Top = 92
      Width = 350
      Height = 21
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object Real3DFragmentShader: TEditEx
      Left = 8
      Top = 142
      Width = 350
      Height = 21
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object Real3DVertexShaderButtonSelect: TBitBtnEx
      Left = 360
      Top = 92
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Real3DVertexShaderButtonSelectClick
    end
    object Real3DFragmentShaderButtonSelect: TBitBtnEx
      Left = 360
      Top = 142
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Real3DFragmentShaderButtonSelectClick
    end
    object Widescreen: TAdvOfficeCheckBoxEx
      Left = 432
      Top = 180
      Width = 84
      Height = 20
      Hint = 'Expand 3D field of view to screen width'
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Widescreen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object FullScreen: TAdvOfficeCheckBoxEx
      Left = 554
      Top = 180
      Width = 79
      Height = 20
      Hint = 'Run game in full screen'
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object GPUMultithreading: TAdvOfficeCheckBoxEx
      Left = 672
      Top = 200
      Width = 127
      Height = 20
      Hint = 
        'Run graphics rendering in separate thread (disable to run in mai' +
        'n thread)'
      Checked = True
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'GPU Multithreading'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object Video3DEngine: TComboBox2Ex
      Left = 8
      Top = 36
      Width = 350
      Height = 23
      Style = csDropDownList
      Ctl3D = True
      ItemHeight = 15
      ItemIndex = 1
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Text = 'New 3D Engine by Ian Curtis (recommended)'
      Items.Strings = (
        'Legacy 3D Engine (faster but less accurate)'
        'New 3D Engine by Ian Curtis (recommended)')
    end
    object DisableVSync: TAdvOfficeCheckBoxEx
      Left = 672
      Top = 220
      Width = 101
      Height = 20
      Hint = 'Do not lock to vertical refresh rate'
      ShowHint = True
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Disable V-Sync'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Stretch: TAdvOfficeCheckBoxEx
      Left = 672
      Top = 180
      Width = 60
      Height = 20
      Hint = 'Fit viewport to resolution, ignoring aspect ratio'
      ShowHint = True
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Stretch'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object LoadTileMapVertexShader2D: TEditEx
      Left = 428
      Top = 92
      Width = 350
      Height = 21
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object LoadTileMapVertexShader2DButtonSelect: TBitBtnEx
      Left = 780
      Top = 92
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = LoadTileMapVertexShader2DButtonSelectClick
    end
    object LoadTileMapFragmentShader2D: TEditEx
      Left = 428
      Top = 142
      Width = 350
      Height = 21
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object LoadTileMapFragmentShader2DButtonSelect: TBitBtnEx
      Left = 780
      Top = 142
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = LoadTileMapFragmentShader2DButtonSelectClick
    end
    object MultiTexture: TAdvOfficeCheckBoxEx
      Left = 432
      Top = 240
      Width = 197
      Height = 20
      Hint = 
        'Use 8 texture maps for accurate decoding (disable to decode to a' +
        ' single texture map)'
      ShowHint = True
      TabOrder = 17
      Alignment = taLeftJustify
      Caption = 'Multi-Texture (Legacy 3D Engine)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object LoadReal3DScrollFogVertexShader: TEditEx
      Left = 8
      Top = 192
      Width = 350
      Height = 21
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object LoadReal3DScrollFogVertexShaderButtonSelect: TBitBtnEx
      Left = 360
      Top = 190
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = LoadReal3DScrollFogVertexShaderButtonSelectClick
    end
    object LoadReal3DScrollFogFragmentShaderButtonSelect: TBitBtnEx
      Left = 360
      Top = 242
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnClick = LoadReal3DScrollFogFragmentShaderButtonSelectClick
    end
    object LoadReal3DScrollFogFragmentShader: TEditEx
      Left = 8
      Top = 242
      Width = 350
      Height = 21
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
    object Video3DEngineButtonReset: TBitBtnEx
      Left = 360
      Top = 36
      Width = 43
      Height = 21
      Hint = 'Click here to set default 3D engine'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnClick = Video3DEngineButtonResetClick
    end
    object QuadRendering: TAdvOfficeCheckBoxEx
      Left = 432
      Top = 200
      Width = 234
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 23
      Alignment = taLeftJustify
      Caption = 'Enable Quad Rendering (New 3D Engine)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
  end
  object InputGroupBox: TAdvGroupBoxEx
    Left = 434
    Top = 557
    Width = 312
    Height = 102
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Input'
    Ctl3D = True
    TabOrder = 2
    object CrosshairsLabel: TShadowLabel
      Left = 8
      Top = 76
      Width = 129
      Height = 16
      Caption = 'Crosshairs (Gun Games)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object InputSystem: TComboBox2Ex
      Left = 8
      Top = 21
      Width = 251
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'DirectInput (default)'
      OnSelect = InputSystemSelect
      Items.Strings = (
        'DirectInput (default)'
        'XInput (for Xbox 360)'
        'Raw Input (multiple mice and keyboards)'
        'SDL (non-Windows builds)')
    end
    object InputSystemConfigButton: TBitBtnEx
      Left = 261
      Top = 21
      Width = 43
      Height = 23
      Hint = 'Open emulator'#39's config input window (select input system first!)'
      Caption = 'Config'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = InputSystemConfigButtonClick
    end
    object EnableForceFeedback: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 50
      Width = 256
      Height = 20
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable Force Feedback (DirectInput / XInput)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Crosshairs: TComboBox2Ex
      Left = 136
      Top = 72
      Width = 138
      Height = 23
      Hint = 'Crosshairs configuration for gun games'
      Style = csDropDownList
      Ctl3D = True
      ItemHeight = 15
      ItemIndex = 0
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'None'
      Items.Strings = (
        'None'
        'Player 1 Only'
        'Player 2 Only'
        'Player 1 and Player 2')
    end
  end
  object AudioGroupBox: TAdvGroupBoxEx
    Left = 8
    Top = 495
    Width = 411
    Height = 197
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Audio'
    Ctl3D = True
    TabOrder = 3
    object SoundVolumeLabel: TShadowLabel
      Left = 8
      Top = 63
      Width = 224
      Height = 16
      Hint = 'Volume of SCSP Generated Sound [%u'
      Caption = 'Volume of SCSP Generated Sound [100 %]'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object MusicVolumeLabel: TShadowLabel
      Left = 8
      Top = 108
      Width = 232
      Height = 16
      Hint = 'Music Volume, Digital Sound Board [%u'
      Caption = 'Music Volume, Digital Sound Board [100 %]'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object AudioBalanceFrontRearLabel: TShadowLabel
      Left = 8
      Top = 153
      Width = 133
      Height = 16
      Hint = 'Front/Rear Balance [%d'
      Caption = 'Front/Rear Balance [0 %]'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object SoundVolume: TGaugeBar
      Left = 8
      Top = 79
      Width = 305
      Height = 20
      Hint = 
        'Adjust colume of SCSP-generated sound, applies only when Digital' +
        ' Sound Board is present'#13#10'(mouse right-click for default)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 5
      Max = 200
      ShowHint = True
      ShowHandleGrip = True
      Position = 100
      OnChange = SoundVolumeChange
      OnMouseDown = SoundVolumeMouseDown
    end
    object DisableSound: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 20
      Width = 110
      Height = 20
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Disable Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object DisableMusic: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 40
      Width = 257
      Height = 20
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Disable Digital Sound Board (MPEG music)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object MusicVolume: TGaugeBar
      Left = 8
      Top = 124
      Width = 305
      Height = 20
      Hint = 
        'Adjust Digital Sound Board volume'#13#10'(mouse right-click for defaul' +
        't)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 5
      Max = 200
      ShowHint = True
      ShowHandleGrip = True
      Position = 100
      OnChange = MusicVolumeChange
      OnMouseDown = MusicVolumeMouseDown
    end
    object FlipStereo: TAdvOfficeCheckBoxEx
      Left = 179
      Top = 20
      Width = 77
      Height = 20
      Hint = 'Swaps the left and right audio channels'
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Flip Stereo'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object AudioBalanceFrontRear: TGaugeBar
      Left = 8
      Top = 169
      Width = 305
      Height = 20
      Hint = 
        'Adjust sound position between front and rear speakers'#13#10'(mouse ri' +
        'ght-click for default)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 5
      Min = -100
      ShowHint = True
      ShowHandleGrip = True
      Position = 0
      OnChange = AudioBalanceFrontRearChange
      OnMouseDown = AudioBalanceFrontRearMouseDown
    end
    object SoundVolumeButtonLast: TBitBtnEx
      Left = 317
      Top = 80
      Width = 43
      Height = 21
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object MusicVolumeButtonLast: TBitBtnEx
      Left = 317
      Top = 128
      Width = 43
      Height = 21
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object SoundVolumeButtonReset: TBitBtnEx
      Left = 360
      Top = 80
      Width = 43
      Height = 21
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object MusicVolumeButtonReset: TBitBtnEx
      Left = 360
      Top = 128
      Width = 43
      Height = 21
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object AudioBalanceFrontRearButtonLast: TBitBtnEx
      Left = 317
      Top = 168
      Width = 43
      Height = 21
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object AudioBalanceFrontRearButtonReset: TBitBtnEx
      Left = 360
      Top = 168
      Width = 43
      Height = 21
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
  end
  object PowerPCFrequencyBox: TAdvGroupBoxEx
    Left = 434
    Top = 495
    Width = 405
    Height = 50
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    Caption = 'PowerPC Bus Frequency (PPC)'
    Ctl3D = True
    TabOrder = 4
    object PowerPCFrequencyLabel: TShadowLabel
      Left = 105
      Top = 23
      Width = 43
      Height = 16
      Caption = '50 MHz'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object PowerPCFrequencyCustomLabel: TShadowLabel
      Left = 372
      Top = 23
      Width = 28
      Height = 16
      Caption = 'MHz'
      Enabled = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object PowerPCFrequency: TGaugeBar
      Left = 8
      Top = 21
      Width = 90
      Height = 20
      Hint = 'Set PowerPC frequency in MHz [Default: 50]'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 12
      Max = 8
      ShowHint = True
      ShowHandleGrip = True
      Position = 5
      OnChange = PowerPCFrequencyChange
    end
    object PowerPCFrequencyCustom: TEditEx
      Left = 307
      Top = 20
      Width = 63
      Height = 22
      AutoSize = False
      Enabled = False
      TabOrder = 1
      Text = '1000'
      OnKeyPress = PowerPCFrequencyCustomKeyPress
    end
    object PowerPCFrequencyUseCustom: TAdvOfficeCheckBoxEx
      Left = 175
      Top = 21
      Width = 129
      Height = 20
      TabOrder = 2
      OnClick = PowerPCFrequencyUseCustomClick
      Alignment = taLeftJustify
      Caption = 'Use Custom [1-1000]'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
  end
  object Multithreading: TAdvOfficeCheckBoxEx
    Left = 434
    Top = 672
    Width = 101
    Height = 20
    Hint = 'Uncheck it to disable multi-threading entirely'
    Checked = True
    ShowHint = True
    TabOrder = 5
    Alignment = taLeftJustify
    Caption = 'Multithreading'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
  end
  object ButtonReadFile: TBitBtnEx
    Left = 8
    Top = 710
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 6
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtnEx
    Left = 652
    Top = 710
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 7
  end
  object ButtonCancel: TBitBtnEx
    Left = 750
    Top = 710
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object FolderROMs: TEasyListview
    Tag = 1
    Left = 8
    Top = 105
    Width = 739
    Height = 98
    Hint = 'ROMs Folders'
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
      00060000008008000101000100000000000001DF020000FFFFFF1F0001000000
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
    TabOrder = 9
    View = elsReport
    CustomCheckRadioEnabled = False
    OnItemEdited = FolderROMsItemEdited
    OnItemEditEnd = FolderROMsItemEditEnd
    OnKeyAction = FolderROMsKeyAction
  end
  object FolderROMsButtonUp: TBitBtnEx
    Tag = 1
    Left = 751
    Top = 104
    Width = 43
    Height = 21
    Hint = 'Move selected folder up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    TabStop = False
    OnClick = FolderROMsButtonUpClick
  end
  object FolderROMsButtonDown: TBitBtnEx
    Left = 751
    Top = 125
    Width = 43
    Height = 21
    Hint = 'Move selected folder down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    TabStop = False
    OnClick = FolderROMsButtonUpClick
  end
  object FolderROMsButtonSelect: TBitBtnEx
    Left = 794
    Top = 104
    Width = 43
    Height = 21
    Hint = 'Click here to add folders'
    Caption = 'Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = FolderROMsButtonSelectClick
  end
  object FolderROMsButtonEdit: TBitBtnEx
    Left = 794
    Top = 125
    Width = 43
    Height = 21
    Hint = 'Click here to edit the selected folder [F2]'
    Caption = 'Edit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = FolderROMsButtonEditClick
  end
  object FolderROMsButtonDelete: TBitBtnEx
    Left = 794
    Top = 146
    Width = 43
    Height = 21
    Hint = 'Click here to delete selected folders [DEL]'
    Caption = 'Delete'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = FolderROMsButtonDeleteClick
  end
  object FolderROMsButtonClear: TBitBtnEx
    Left = 794
    Top = 167
    Width = 43
    Height = 21
    Hint = 'Click here to clear folders list'
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = FolderROMsButtonClearClick
  end
end
