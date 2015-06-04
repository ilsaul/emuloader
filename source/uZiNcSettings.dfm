object FormZiNcSettings: TFormZiNcSettings
  Left = 593
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 528
  ClientWidth = 776
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
    Left = 116
    Top = 496
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
    Left = 16
    Top = 211
    Width = 53
    Height = 15
    Caption = 'Controller'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelRendererZNC: TLabel
    Left = 16
    Top = 259
    Width = 47
    Height = 15
    Caption = 'Renderer'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelControllerConfigFile: TLabel
    Left = 320
    Top = 211
    Width = 163
    Height = 15
    Caption = 'Znx Controller Config (Default)'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelRendererConfigFile: TLabel
    Left = 320
    Top = 259
    Width = 86
    Height = 15
    Caption = 'Renderer Config'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelROMsFolders: TLabel
    Left = 16
    Top = 67
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
    Width = 776
    Height = 60
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = clWhite
    Color4 = 1117964
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object GameIcon: TImage
      Left = 56
      Top = 28
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 680
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
      Left = 86
      Top = 28
      Width = 508
      Height = 25
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
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
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 660
      Top = 26
      Width = 110
      Height = 27
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -11
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
  object AudioBox: TAdvGroupBox
    Left = 599
    Top = 67
    Width = 161
    Height = 196
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Audio'
    Ctl3D = True
    TabOrder = 1
    object Label12: TLabel
      Left = 8
      Top = 104
      Width = 100
      Height = 15
      Caption = 'Sound Filter Cutoff'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelSoundLiteSurroundMultiplier: TLabel
      Left = 8
      Top = 152
      Width = 96
      Height = 15
      Hint = 'Lite-Surround [%u]'
      Caption = 'Lite-Surround [40]'
      ShowAccelChar = False
      Transparent = False
    end
    object Sound: TAdvOfficeCheckBox
      Left = 8
      Top = 20
      Width = 57
      Height = 20
      Hint = 'Turns sound on/off'
      Checked = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Sound'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object SoundFilter: TAdvOfficeCheckBox
      Left = 8
      Top = 40
      Width = 89
      Height = 20
      Hint = 'Provides a quality increase with a tiny amount more CPU'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Sound Filter'
      ReturnIsTab = False
      Themed = True
    end
    object SoundStereoExciter: TAdvOfficeCheckBox
      Left = 8
      Top = 60
      Width = 97
      Height = 20
      Hint = 
        'Enables "stereo exciter" which widens the stereo image. Try it a' +
        'nd listen :)'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Stereo Exciter'
      ReturnIsTab = False
      Themed = True
    end
    object SoundLiteSurround: TAdvOfficeCheckBox
      Left = 8
      Top = 80
      Width = 132
      Height = 20
      Hint = 'Enables "Lite-Surround". Try it and listen :)'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Lite-Surround Sound'
      ReturnIsTab = False
      Themed = True
    end
    object SoundFilterCutoff: TComboBox
      Left = 8
      Top = 120
      Width = 145
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
      TabOrder = 4
      Text = '22050 Hz'
      Items.Strings = (
        '11025 Hz'
        '22050 Hz'
        '44100 Hz'
        '48000 Hz')
    end
    object SoundLiteSurroundMultiplier: TGaugeBar
      Left = 8
      Top = 168
      Width = 145
      Height = 20
      Hint = 'Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      ShowHandleGrip = True
      Position = 40
      OnChange = SoundLiteSurroundMultiplierChange
    end
  end
  object AdvGroupBox3: TAdvGroupBox
    Left = 598
    Top = 275
    Width = 162
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
    object SlowGeometry: TAdvOfficeCheckBox
      Left = 8
      Top = 20
      Width = 105
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
    object MemoryPrediction: TAdvOfficeCheckBox
      Left = 8
      Top = 40
      Width = 125
      Height = 20
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Memory Prediction'
      ReturnIsTab = False
      Themed = True
    end
    object StackInRAMHack: TAdvOfficeCheckBox
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
      Width = 146
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
    object NetGameServer: TAdvOfficeCheckBox
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
      Width = 146
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object OpenGLD3DRendererBox: TAdvGroupBox
    Left = 16
    Top = 312
    Width = 567
    Height = 160
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
      Top = 68
      Width = 64
      Height = 15
      Caption = 'Color Depth'
      ShowAccelChar = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 116
      Width = 49
      Height = 15
      Caption = 'Scanlines'
      ShowAccelChar = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 147
      Top = 20
      Width = 47
      Height = 15
      Caption = 'Blending'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelFramerateManual: TLabel
      Left = 288
      Top = 116
      Width = 125
      Height = 15
      Hint = 'Framerate Manual [%u]'
      Caption = 'Framerate Manual [100]'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object Label4: TLabel
      Left = 288
      Top = 20
      Width = 68
      Height = 15
      Caption = 'Texture Type'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelTextureCache: TLabel
      Left = 429
      Top = 20
      Width = 92
      Height = 15
      Hint = 'Texture Cache [%u]'
      Caption = 'Texture Cache [2]'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object LabelTurnDisplay: TLabel
      Left = 429
      Top = 68
      Width = 83
      Height = 15
      Hint = 'Turn Display [%u]'
      Caption = 'Turn Display [1]'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object LabelTextureFilter: TLabel
      Left = 429
      Top = 116
      Width = 85
      Height = 15
      Hint = 'Texture Filter [%u]'
      Caption = 'Texture Filter [3]'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      Transparent = False
    end
    object Resolution: TComboBox
      Left = 8
      Top = 36
      Width = 129
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
    object FullScreen: TAdvOfficeCheckBox
      Left = 147
      Top = 68
      Width = 86
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
      Top = 84
      Width = 129
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
      Top = 132
      Width = 129
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
      Left = 147
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
    object Dithering: TAdvOfficeCheckBox
      Left = 147
      Top = 90
      Width = 78
      Height = 20
      Hint = 'Image dithering'
      Checked = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Dithering'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object ShowFPS: TAdvOfficeCheckBox
      Left = 147
      Top = 114
      Width = 78
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
    object FrameLimitation: TAdvOfficeCheckBox
      Left = 147
      Top = 136
      Width = 118
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
    object FrameSkip: TAdvOfficeCheckBox
      Left = 288
      Top = 68
      Width = 82
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
    object FramerateDetection: TAdvOfficeCheckBox
      Left = 288
      Top = 90
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
    object TextureType: TComboBox
      Left = 288
      Top = 36
      Width = 129
      Height = 21
      Hint = 'Textures color format'
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
      TabOrder = 10
      Text = '8-bit'
      Items.Strings = (
        'Default'
        '4-bit'
        '5-bit'
        '8-bit')
    end
    object TextureCache: TGaugeBar
      Left = 429
      Top = 36
      Width = 129
      Height = 20
      Hint = 'Level of texture caching'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      Max = 2
      ShowHandleGrip = True
      Position = 2
      OnChange = TextureCacheChange
    end
    object TurnDisplay: TGaugeBar
      Left = 429
      Top = 84
      Width = 129
      Height = 20
      Hint = 'Rotate the whole display'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      Max = 2
      ShowHandleGrip = True
      Position = 1
      OnChange = TurnDisplayChange
    end
    object TextureFilter: TGaugeBar
      Left = 429
      Top = 132
      Width = 129
      Height = 20
      Hint = 'Texture filtering'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      Max = 3
      ShowHandleGrip = True
      Position = 3
      OnChange = TextureFilterChange
    end
    object FramerateManual: TGaugeBar
      Tag = 14
      Left = 288
      Top = 132
      Width = 129
      Height = 20
      Hint = 'Set a manual framerate'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 50
      Max = 255
      ShowHandleGrip = True
      Position = 100
      OnChange = FramerateManualChange
    end
  end
  object ButtonReadFile: TBitBtn
    Left = 16
    Top = 490
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 4
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 574
    Top = 490
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 5
  end
  object ControllerZNC: TEdit
    Left = 16
    Top = 227
    Width = 219
    Height = 21
    Hint = 'Choose controller plugin'
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object ControllerZNCButtonSelect: TBitBtn
    Left = 237
    Top = 227
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
    Left = 16
    Top = 275
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
    Left = 237
    Top = 275
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
    Left = 320
    Top = 227
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
    Left = 541
    Top = 227
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
    Left = 320
    Top = 275
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
    Left = 541
    Top = 275
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
    Left = 16
    Top = 83
    Width = 567
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
      0006000000800800010100010000000000000133020000FFFFFF1F0001000000
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
    Selection.Gradient = True
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
    OnItemPaintText = FolderROMsItemPaintText
    OnKeyAction = FolderROMsKeyAction
  end
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 16
    Top = 167
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
    Left = 59
    Top = 167
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
    Left = 412
    Top = 167
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
    Left = 455
    Top = 167
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
    Left = 498
    Top = 167
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
    Left = 541
    Top = 167
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
    Left = 672
    Top = 490
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
end
