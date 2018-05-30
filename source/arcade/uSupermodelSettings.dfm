object FormSupermodelSettings: TFormSupermodelSettings
  Left = 925
  Top = 612
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 543
  ClientWidth = 614
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
    Top = 515
    Width = 300
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
  object Label1: TLabel
    Left = 337
    Top = 460
    Width = 258
    Height = 15
    Caption = 'Load Graphics State From Save State File (Debug)'
    ShowAccelChar = False
    Transparent = True
    Visible = False
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 614
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
      Width = 500
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
      Width = 384
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
      Left = 499
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
    Top = 178
    Width = 312
    Height = 215
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 1
    object LabelResolution: TLabel
      Left = 8
      Top = 20
      Width = 56
      Height = 15
      Caption = 'Resolution'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVertexShader: TLabel
      Left = 8
      Top = 124
      Width = 214
      Height = 15
      Caption = 'Real3D Vertex Shader (Legacy 3D Engine)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelFragmentShader: TLabel
      Left = 8
      Top = 170
      Width = 233
      Height = 15
      Caption = 'Real3D Fragment Shader (Legacy 3D Engine)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVideo3DEngine: TLabel
      Left = 184
      Top = 20
      Width = 53
      Height = 15
      Caption = '3D Engine'
      ShowAccelChar = False
      Transparent = True
    end
    object ScreenResolution: TComboBox
      Left = 8
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
      Left = 184
      Top = 100
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
      Left = 8
      Top = 100
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
    object VertexShader: TEdit
      Left = 8
      Top = 140
      Width = 251
      Height = 21
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object FragmentShader: TEdit
      Left = 8
      Top = 186
      Width = 251
      Height = 21
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object ButtonSelectVertexShader: TBitBtn
      Left = 261
      Top = 140
      Width = 43
      Height = 21
      Caption = 'Select'
      TabOrder = 5
      OnClick = ButtonSelectVertexShaderClick
    end
    object ButtonSelectFragmentShader: TBitBtn
      Left = 261
      Top = 186
      Width = 43
      Height = 21
      Caption = 'Select'
      TabOrder = 6
      OnClick = ButtonSelectFragmentShaderClick
    end
    object Widescreen: TAdvOfficeCheckBox
      Left = 8
      Top = 60
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
      Left = 98
      Top = 60
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
    object MultiTexture: TAdvOfficeCheckBox
      Left = 184
      Top = 60
      Width = 94
      Height = 20
      Hint = 
        'Use 8 texture maps for accurate decoding (disable to decode to a' +
        ' single texture map)'
      Checked = True
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Multi-Texture'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object GPUMultithreading: TAdvOfficeCheckBox
      Left = 8
      Top = 80
      Width = 127
      Height = 20
      Hint = 
        'Run graphics rendering in separate thread (disable to run in mai' +
        'n thread)'
      Checked = True
      ShowHint = True
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'GPU Multithreading'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object Video3DEngine: TComboBox
      Left = 184
      Top = 36
      Width = 121
      Height = 23
      Hint = 
        'Choose between the new 3D Engine by Ian Curtis (recommended) or ' +
        'the old one'
      Style = csDropDownList
      Ctl3D = True
      ItemHeight = 15
      ItemIndex = 1
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Text = 'New 3D Engine'
      Items.Strings = (
        'Legacy 3D Engine'
        'New 3D Engine')
    end
    object DisableVSync: TAdvOfficeCheckBox
      Left = 184
      Top = 80
      Width = 101
      Height = 20
      Hint = 'Do not lock to vertical refresh rate'
      ShowHint = True
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Disable V-Sync'
      ReturnIsTab = False
      Themed = True
    end
  end
  object InputGroupBox: TAdvGroupBox
    Left = 8
    Top = 401
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
    Left = 337
    Top = 178
    Width = 268
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
      Width = 233
      Height = 20
      Hint = 
        'Adjust colume of SCSP-generated sound, applies only when Digital' +
        ' Sound Board is present (mouse right-click for default)'
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
      Width = 233
      Height = 20
      Hint = 
        'Adjust Digital Sound Board volume (mouse right-click for default' +
        ')'
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
      Width = 233
      Height = 20
      Hint = 
        'Adjust sound position between front and rear speakers (mouse rig' +
        'ht-click for default)'
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
  end
  object PowerPCFrequencyBox: TAdvGroupBox
    Left = 337
    Top = 383
    Width = 268
    Height = 69
    RoundEdges = True
    Caption = 'PowerPC Bus Frequency (PPC)'
    Ctl3D = True
    TabOrder = 4
    object LabelPowerPCFrequency: TLabel
      Left = 96
      Top = 23
      Width = 40
      Height = 15
      Caption = '50 MHz'
      ShowAccelChar = False
      Transparent = False
    end
    object Label3: TLabel
      Left = 146
      Top = 23
      Width = 88
      Height = 15
      Caption = 'Custom [1-1000]'
      ShowAccelChar = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 237
      Top = 41
      Width = 25
      Height = 15
      Caption = 'MHz'
      ShowAccelChar = False
      Transparent = True
    end
    object PowerPCFrequency: TGaugeBar
      Left = 8
      Top = 21
      Width = 84
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
      Left = 146
      Top = 39
      Width = 89
      Height = 22
      AutoSize = False
      TabOrder = 1
      Text = '1000'
      OnKeyPress = PowerPCFrequencyCustomKeyPress
    end
  end
  object Multithreading: TAdvOfficeCheckBox
    Left = 337
    Top = 473
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
    Top = 510
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 6
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 419
    Top = 510
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 7
  end
  object ButtonCancel: TBitBtn
    Left = 517
    Top = 510
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
    Width = 461
    Height = 65
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
      00060000008008000101000100000000000001C9010000FFFFFF1F0001000000
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
    Left = 471
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
    Left = 471
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
    Left = 520
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
    Left = 563
    Top = 104
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
    Left = 520
    Top = 125
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
    Left = 563
    Top = 125
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
