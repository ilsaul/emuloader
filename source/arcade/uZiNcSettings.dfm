object FormZiNcSettings: TFormZiNcSettings
  Left = 774
  Top = 490
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 509
  ClientWidth = 715
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
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 108
    Top = 484
    Width = 88
    Height = 16
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
    EllipsType = etNone
    Transparent = True
  end
  object LabelControllerZNC: TLabel
    Left = 8
    Top = 217
    Width = 104
    Height = 15
    Caption = 'Controller [.znc file]'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelRendererZNC: TLabel
    Left = 8
    Top = 263
    Width = 98
    Height = 15
    Caption = 'Renderer [.znc file]'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelControllerConfigFile: TLabel
    Left = 288
    Top = 217
    Width = 142
    Height = 15
    Caption = 'Controller Config [.cfg file]'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelRendererConfigFile: TLabel
    Left = 288
    Top = 263
    Width = 136
    Height = 15
    Caption = 'Renderer Config [.cfg file]'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelROMsFolders: TLabel
    Left = 8
    Top = 87
    Width = 73
    Height = 15
    Caption = 'ROMs Folders'
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = False
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 715
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
    object GameIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 599
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
      Left = 106
      Top = 46
      Width = 485
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
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 599
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
  object AudioBox: TAdvGroupBoxEx
    Left = 567
    Top = 87
    Width = 141
    Height = 152
    CheckBox.Checked = True
    CheckBox.Action = caNone
    CheckBox.Hint = 'Turns sound on/off'
    CheckBox.State = cbChecked
    CheckBox.Visible = True
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Enable Sound'
    Ctl3D = True
    TabOrder = 1
    object Label12: TLabel
      Left = 24
      Top = 106
      Width = 63
      Height = 15
      Caption = 'Filter Cutoff'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelSoundLiteSurroundMultiplier: TLabel
      Left = 116
      Top = 60
      Width = 12
      Height = 15
      Caption = '40'
      ShowAccelChar = False
      Transparent = False
    end
    object SoundFilter: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 86
      Width = 85
      Height = 20
      Hint = 'Provides a quality increase with a tiny amount more CPU'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Sound Filter'
      ReturnIsTab = False
      Themed = True
    end
    object SoundStereoExciter: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 20
      Width = 92
      Height = 20
      Hint = 
        'Enables "stereo exciter" which widens the stereo image. Try it a' +
        'nd listen :)'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Stereo Exciter'
      ReturnIsTab = False
      Themed = True
    end
    object SoundLiteSurround: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 40
      Width = 132
      Height = 20
      Hint = 'Enables "Lite-Surround". Try it and listen :)'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Lite-Surround Sound'
      ReturnIsTab = False
      Themed = True
    end
    object SoundFilterCutoff: TComboBox
      Left = 24
      Top = 122
      Width = 75
      Height = 21
      Hint = 'Sets the filter cutoff frequency'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '22050 Hz'
      Items.Strings = (
        '11025 Hz'
        '22050 Hz'
        '44100 Hz'
        '48000 Hz')
    end
    object SoundLiteSurroundMultiplier: TGaugeBar
      Left = 24
      Top = 58
      Width = 89
      Height = 20
      Hint = 'Multiplier. Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      ShowHandleGrip = True
      Position = 40
      OnChange = SoundLiteSurroundMultiplierChange
    end
  end
  object AdvGroupBox3: TAdvGroupBoxEx
    Left = 566
    Top = 263
    Width = 141
    Height = 197
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 2
    object Label10: TLabel
      Left = 8
      Top = 84
      Width = 34
      Height = 15
      Caption = 'Rotate'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelNetGameConnect: TLabel
      Left = 8
      Top = 152
      Width = 101
      Height = 15
      Caption = 'Net Game Connect'
    end
    object SlowGeometry: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 20
      Width = 102
      Height = 20
      Hint = 
        'Uses slower but more accurate geometry calculations. If you see ' +
        'errors, try this as a fix. Gallop Racer 3 in particular benefits' +
        ' from using the "slow" geometry - the ground breaks up otherwise'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Slow Geometry'
      ReturnIsTab = False
      Themed = True
    end
    object MemoryPrediction: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 40
      Width = 123
      Height = 20
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Memory Prediction'
      ReturnIsTab = False
      Themed = True
    end
    object StackInRAMHack: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 60
      Width = 128
      Height = 20
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Stack In RAM (Hack)'
      ReturnIsTab = False
      Themed = True
    end
    object Rotate: TComboBox
      Left = 8
      Top = 100
      Width = 125
      Height = 21
      Hint = 'Overrides ZiNc'#39's default screen rotation setting'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'No Rotation'
      Items.Strings = (
        'No Rotation'
        '90 Degrees'
        '180 Degrees'
        '280 Degrees')
    end
    object NetGameServer: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 128
      Width = 113
      Height = 20
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Net Game Server'
      ReturnIsTab = False
      Themed = True
    end
    object NetGameConnect: TEdit
      Left = 8
      Top = 168
      Width = 125
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object OpenGLD3DRendererBox: TAdvGroupBoxEx
    Left = 8
    Top = 308
    Width = 483
    Height = 157
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'OpenGL / Direct3D Renderer'
    Ctl3D = True
    TabOrder = 3
    object LabelResolution: TLabel
      Left = 8
      Top = 20
      Width = 56
      Height = 15
      Caption = 'Resolution'
      ShowAccelChar = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 8
      Top = 66
      Width = 64
      Height = 15
      Caption = 'Color Depth'
      ShowAccelChar = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 112
      Width = 49
      Height = 15
      Caption = 'Scanlines'
      ShowAccelChar = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 98
      Top = 20
      Width = 47
      Height = 15
      Caption = 'Blending'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelFramerateManual: TLabel
      Left = 325
      Top = 112
      Width = 96
      Height = 15
      Caption = 'Manual Framerate'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = True
    end
    object LabelTurnDisplay: TLabel
      Left = 98
      Top = 130
      Width = 86
      Height = 15
      Caption = 'Turn the Display'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object LabelFramerateManualRange: TLabel
      Left = 372
      Top = 130
      Width = 55
      Height = 15
      Hint = 'Framerate Manual [%u]'
      Caption = '(0 to 1000)'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object LabelTextureSettings: TLabel
      Left = 237
      Top = 20
      Width = 84
      Height = 15
      Caption = 'Texture Settings'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object Label4: TLabel
      Left = 237
      Top = 38
      Width = 26
      Height = 15
      Caption = 'Type'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelTextureCache: TLabel
      Left = 325
      Top = 38
      Width = 33
      Height = 15
      Caption = 'Cache'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object LabelTextureFilter: TLabel
      Left = 405
      Top = 38
      Width = 26
      Height = 15
      Caption = 'Filter'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object Resolution: TComboBox
      Left = 8
      Top = 36
      Width = 80
      Height = 21
      Hint = 'Specifies an exact resolution to run in'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object FullScreen: TAdvOfficeCheckBoxEx
      Left = 98
      Top = 85
      Width = 78
      Height = 20
      Hint = 'Run in full screen or in window'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
    end
    object ColorDepth: TComboBox
      Left = 8
      Top = 82
      Width = 80
      Height = 21
      Hint = 'Full screen color depth'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '32-bit'
      Items.Strings = (
        '16-bit'
        '32-bit')
    end
    object Scanlines: TComboBox
      Left = 8
      Top = 128
      Width = 80
      Height = 21
      Hint = 'Emulate scanlines'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'None'
      Items.Strings = (
        'None'
        'Black'
        'Bright')
    end
    object Blending: TComboBox
      Left = 98
      Top = 36
      Width = 129
      Height = 21
      Hint = 'Enhanced color blend'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'OpenGL'
      Items.Strings = (
        'OpenGL / Direct3D'
        'OpenGL'
        'Direct3D')
    end
    object Dithering: TAdvOfficeCheckBoxEx
      Left = 98
      Top = 65
      Width = 112
      Height = 20
      Hint = 'Image dithering (only needed in 16 bit color depth)'
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Dithering (16-bit)'
      ReturnIsTab = False
      Themed = True
    end
    object ShowFPS: TAdvOfficeCheckBoxEx
      Left = 237
      Top = 65
      Width = 73
      Height = 20
      Hint = 'FPS display on startup'
      Checked = True
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Show FPS'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object FrameLimitation: TAdvOfficeCheckBoxEx
      Left = 325
      Top = 85
      Width = 112
      Height = 20
      Hint = 'Limit fps to monitor refresh rate'
      Checked = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Frame Limitation'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object FrameSkip: TAdvOfficeCheckBoxEx
      Left = 237
      Top = 85
      Width = 81
      Height = 20
      Hint = 'Skip frames to increase speed'
      Checked = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Frame Skip'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object FramerateDetection: TAdvOfficeCheckBoxEx
      Left = 325
      Top = 65
      Width = 128
      Height = 20
      Hint = 'Auto framerate detection'
      Checked = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Framerate Detection'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object TurnDisplay: TComboBox
      Left = 187
      Top = 128
      Width = 40
      Height = 21
      Hint = 'Rotate the whole display'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Text = '1'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object FramerateManual: TEdit
      Left = 325
      Top = 128
      Width = 45
      Height = 21
      Hint = 'Set a manual framerate (0 to 1000)'
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Text = '100'
      OnKeyPress = FramerateManualKeyPress
    end
    object EnableKeys: TAdvOfficeCheckBoxEx
      Left = 98
      Top = 105
      Width = 131
      Height = 20
      Hint = 'Enables keys for the fps menu/pause'
      Checked = True
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Enable Renderer Keys'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object TextureType: TComboBox
      Left = 267
      Top = 36
      Width = 54
      Height = 21
      Hint = 'Textures color format ("Auto" = card'#39's default)'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      Text = 'Auto'
      Items.Strings = (
        'Auto'
        '4-bit'
        '5-bit'
        '8-bit')
    end
    object TextureCache: TComboBox
      Left = 361
      Top = 36
      Width = 40
      Height = 21
      Hint = 'Level of texture caching'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      Text = '2'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object TextureFilter: TComboBox
      Left = 435
      Top = 36
      Width = 40
      Height = 21
      Hint = 'Texture filtering (may cause glitches!)'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 3
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Text = '3'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3')
    end
  end
  object ButtonReadFile: TBitBtn
    Left = 8
    Top = 478
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 4
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 521
    Top = 478
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 5
  end
  object ControllerZNC: TEdit
    Left = 8
    Top = 233
    Width = 219
    Height = 21
    Hint = 'Choose controller plugin'
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnChange = ControllerZNCChange
  end
  object ControllerZNCButtonSelect: TBitBtn
    Left = 229
    Top = 233
    Width = 43
    Height = 21
    Hint = 'Click here to select a controller file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ControllerZNCButtonSelectClick
  end
  object RendererZNC: TEdit
    Left = 8
    Top = 279
    Width = 219
    Height = 21
    Hint = 'Choose renderer to use'
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnChange = RendererZNCChange
  end
  object RendererZNCButtonSelect: TBitBtn
    Left = 229
    Top = 279
    Width = 43
    Height = 21
    Hint = 'Click here to select a renderer file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = RendererZNCButtonSelectClick
  end
  object ControllerConfigFile: TEdit
    Left = 288
    Top = 233
    Width = 219
    Height = 21
    Hint = 
      'Gets controller config info from the specified file. The default' +
      ' keyboard plugin ignores this'
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object ControllerConfigFileButtonSelect: TBitBtn
    Left = 509
    Top = 233
    Width = 43
    Height = 21
    Hint = 'Click here to select a controller config file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = ControllerConfigFileButtonSelectClick
  end
  object RendererConfigFile: TEdit
    Left = 288
    Top = 279
    Width = 219
    Height = 21
    Hint = 'Gets renderer config info from the filename specified'
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object RendererConfigFileButtonSelect: TBitBtn
    Left = 509
    Top = 279
    Width = 43
    Height = 21
    Hint = 'Click here to select a renderer config file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = RendererConfigFileButtonSelectClick
  end
  object FolderROMs: TEasyListview
    Tag = 1
    Left = 8
    Top = 103
    Width = 543
    Height = 83
    Hint = 'ROMs Folders'
    BackGround.Enabled = True
    CellSizes.Report.Height = 18
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000000011B020000FFFFFF1F0001000000
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
    TabOrder = 15
    View = elsReport
    OnItemEdited = FolderROMsItemEdited
    OnItemEditEnd = FolderROMsItemEditEnd
    OnKeyAction = FolderROMsKeyAction
  end
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 8
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Move selected folder up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    TabStop = False
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
    Left = 51
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Move selected folder down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    TabStop = False
    OnClick = ButtonUpClick
  end
  object FolderROMButtonSelect: TBitBtn
    Left = 380
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Click here to add folders'
    Caption = 'Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = FolderROMButtonSelectClick
  end
  object FolderROMsButtonEdit: TBitBtn
    Left = 423
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Click here to edit the selected folder [F2]'
    Caption = 'Edit'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnClick = FolderROMsButtonEditClick
  end
  object FolderROMsButtonDelete: TBitBtn
    Left = 466
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Click here to delete selected folders [DEL]'
    Caption = 'Delete'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = FolderROMsButtonDeleteClick
  end
  object FolderROMsButtonClear: TBitBtn
    Left = 509
    Top = 187
    Width = 43
    Height = 21
    Hint = 'Click here to clear folders list'
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    OnClick = FolderROMsButtonClearClick
  end
  object ButtonCancel: TBitBtn
    Left = 619
    Top = 478
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
end
