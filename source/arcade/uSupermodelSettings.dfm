object FormSupermodelSettings: TFormSupermodelSettings
  Left = 1356
  Top = 405
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
    Transparent = True
  end
  object LabelFolderROMs: TLabel
    Left = 8
    Top = 89
    Width = 73
    Height = 15
    Caption = 'ROMs Folders'
    ShowAccelChar = False
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
      Transparent = True
      WordWrap = True
    end
  end
  object VideoGroupBox: TAdvGroupBox
    Left = 8
    Top = 211
    Width = 831
    Height = 272
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 1
    object LabelResolution: TLabel
      Left = 428
      Top = 20
      Width = 56
      Height = 15
      Caption = 'Resolution'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelReal3DVertexShader: TLabel
      Left = 8
      Top = 76
      Width = 110
      Height = 15
      Caption = 'Real3D Vertex Shader'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelReal3DFragmentShader: TLabel
      Left = 8
      Top = 126
      Width = 129
      Height = 15
      Caption = 'Real3D Fragment Shader'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVideo3DEngine: TLabel
      Left = 8
      Top = 20
      Width = 53
      Height = 15
      Caption = '3D Engine'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLoadTileMapVertexShader2D: TLabel
      Left = 428
      Top = 76
      Width = 174
      Height = 15
      Caption = 'Load Tile Map Vertex Shader (2D)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLoadTileMapFragmentShader2D: TLabel
      Left = 428
      Top = 126
      Width = 193
      Height = 15
      Caption = 'Load Tile Map Fragment Shader (2D)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLoadReal3DScrollFogVertexShader: TLabel
      Left = 8
      Top = 176
      Width = 285
      Height = 15
      Caption = 'Load Real3D Scroll Fog Vertex Shader (New 3D Engine)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLoadReal3DScrollFogFragmentShader: TLabel
      Left = 8
      Top = 226
      Width = 304
      Height = 15
      Caption = 'Load Real3D Scroll Fog Fragment Shader (New 3D Engine)'
      ShowAccelChar = False
      Transparent = True
    end
    object ScreenResolution: TComboBox
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
    object DisableThrottle: TAdvOfficeCheckBox
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
    end
    object ShowFPS: TAdvOfficeCheckBox
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
    end
    object Real3DVertexShader: TEdit
      Left = 8
      Top = 92
      Width = 350
      Height = 21
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object Real3DFragmentShader: TEdit
      Left = 8
      Top = 142
      Width = 350
      Height = 21
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object ButtonSelectReal3DVertexShader: TBitBtn
      Left = 360
      Top = 92
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonSelectReal3DVertexShaderClick
    end
    object ButtonSelectReal3DFragmentShader: TBitBtn
      Left = 360
      Top = 142
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ButtonSelectReal3DFragmentShaderClick
    end
    object Widescreen: TAdvOfficeCheckBox
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
    end
    object FullScreen: TAdvOfficeCheckBox
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
    end
    object GPUMultithreading: TAdvOfficeCheckBox
      Left = 432
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
    end
    object Video3DEngine: TComboBox
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
    object DisableVSync: TAdvOfficeCheckBox
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
    end
    object Stretch: TAdvOfficeCheckBox
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
    end
    object LoadTileMapVertexShader2D: TEdit
      Left = 428
      Top = 92
      Width = 350
      Height = 21
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object ButtonSelectLoadTileMapVertexShader2D: TBitBtn
      Left = 780
      Top = 92
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = ButtonSelectLoadTileMapVertexShader2DClick
    end
    object LoadTileMapFragmentShader2D: TEdit
      Left = 428
      Top = 142
      Width = 350
      Height = 21
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object ButtonSelectLoadTileMapFragmentShader2D: TBitBtn
      Left = 780
      Top = 142
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = ButtonSelectLoadTileMapFragmentShader2DClick
    end
    object MultiTexture: TAdvOfficeCheckBox
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
    end
    object LoadReal3DScrollFogVertexShader: TEdit
      Left = 8
      Top = 192
      Width = 350
      Height = 21
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object ButtonSelectLoadReal3DScrollFogVertexShader: TBitBtn
      Left = 360
      Top = 190
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = ButtonSelectLoadReal3DScrollFogVertexShaderClick
    end
    object ButtonSelectLoadReal3DScrollFogFragmentShader: TBitBtn
      Left = 360
      Top = 242
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnClick = ButtonSelectLoadReal3DScrollFogFragmentShaderClick
    end
    object LoadReal3DScrollFogFragmentShader: TEdit
      Left = 8
      Top = 242
      Width = 350
      Height = 21
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
    object ButtonVideo3DEngineReset: TBitBtn
      Left = 360
      Top = 36
      Width = 43
      Height = 21
      Hint = 'Click here to set default 3D engine'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnClick = ButtonVideo3DEngineResetClick
    end
  end
  object InputGroupBox: TAdvGroupBox
    Left = 434
    Top = 557
    Width = 312
    Height = 102
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Input'
    Ctl3D = True
    TabOrder = 2
    object LabelCrosshairs: TLabel
      Left = 8
      Top = 76
      Width = 126
      Height = 15
      Caption = 'Crosshairs (Gun Games)'
      ShowAccelChar = False
      Transparent = True
    end
    object InputSystem: TComboBox
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
    object ButtonConfigInput: TBitBtn
      Left = 261
      Top = 21
      Width = 43
      Height = 23
      Hint = 'Open emulator'#39's config input window (select input system first!)'
      Caption = 'Config'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonConfigInputClick
    end
    object EnableForceFeedback: TAdvOfficeCheckBox
      Left = 8
      Top = 50
      Width = 256
      Height = 20
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable Force Feedback (DirectInput / XInput)'
      ReturnIsTab = False
      Themed = True
    end
    object Crosshairs: TComboBox
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
  object AudioGroupBox: TAdvGroupBox
    Left = 8
    Top = 495
    Width = 411
    Height = 197
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Audio'
    Ctl3D = True
    TabOrder = 3
    object LabelSoundVolume: TLabel
      Left = 8
      Top = 63
      Width = 221
      Height = 15
      Hint = 'Volume of SCSP Generated Sound [%u'
      Caption = 'Volume of SCSP Generated Sound [100 %]'
      ShowAccelChar = False
      Transparent = False
    end
    object LabelMusicVolume: TLabel
      Left = 8
      Top = 108
      Width = 229
      Height = 15
      Hint = 'Music Volume, Digital Sound Board [%u'
      Caption = 'Music Volume, Digital Sound Board [100 %]'
      ShowAccelChar = False
      Transparent = False
    end
    object LabelAudioBalanceFrontRear: TLabel
      Left = 8
      Top = 153
      Width = 130
      Height = 15
      Hint = 'Front/Rear Balance [%d'
      Caption = 'Front/Rear Balance [0 %]'
      ShowAccelChar = False
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
    object DisableSound: TAdvOfficeCheckBox
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
    end
    object DisableMusic: TAdvOfficeCheckBox
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
    object FlipStereo: TAdvOfficeCheckBox
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
    object BitBtn5: TBitBtn
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
    object BitBtn6: TBitBtn
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
    object BitBtn7: TBitBtn
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
    object BitBtn8: TBitBtn
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
    object BitBtn9: TBitBtn
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
    object BitBtn10: TBitBtn
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
  object PowerPCFrequencyBox: TAdvGroupBox
    Left = 434
    Top = 495
    Width = 405
    Height = 50
    RoundEdges = True
    Caption = 'PowerPC Bus Frequency (PPC)'
    Ctl3D = True
    TabOrder = 4
    object LabelPowerPCFrequency: TLabel
      Left = 105
      Top = 23
      Width = 40
      Height = 15
      Caption = '50 MHz'
      ShowAccelChar = False
      Transparent = False
    end
    object LabelPowerPCFrequencyCustom: TLabel
      Left = 372
      Top = 23
      Width = 25
      Height = 15
      Caption = 'MHz'
      Enabled = False
      ShowAccelChar = False
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
    object PowerPCFrequencyCustom: TEdit
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
    object PowerPCFrequencyUseCustom: TAdvOfficeCheckBox
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
    end
  end
  object Multithreading: TAdvOfficeCheckBox
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
  end
  object ButtonReadFile: TBitBtn
    Left = 8
    Top = 710
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 6
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 652
    Top = 710
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 7
  end
  object ButtonCancel: TBitBtn
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
    OnItemEdited = FolderROMsItemEdited
    OnItemEditEnd = FolderROMsItemEditEnd
    OnKeyAction = FolderROMsKeyAction
  end
  object ButtonUp: TBitBtn
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
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
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
    OnClick = ButtonUpClick
  end
  object FolderROMButtonSelect: TBitBtn
    Left = 794
    Top = 104
    Width = 43
    Height = 21
    Hint = 'Click here to add folders'
    Caption = 'Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = FolderROMButtonSelectClick
  end
  object FolderROMsButtonEdit: TBitBtn
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
  object FolderROMsButtonDelete: TBitBtn
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
  object FolderROMsButtonClear: TBitBtn
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
