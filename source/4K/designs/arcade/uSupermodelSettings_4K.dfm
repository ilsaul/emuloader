object FormSupermodelSettings4K: TFormSupermodelSettings4K
  Left = 1035
  Top = 191
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (4K)'
  ClientHeight = 1551
  ClientWidth = 1677
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
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 200
    Top = 1497
    Width = 1100
    Height = 31
    AutoSize = False
    Caption = 'LabelReadFileIni'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
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
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1677
    Height = 150
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
      Width = 830
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
      Width = 710
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
      Left = 825
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
  object Multithreading: TAdvOfficeCheckBoxEx
    Left = 826
    Top = 1422
    Width = 175
    Height = 36
    Hint = 'Uncheck it to disable multi-threading entirely'
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 1
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Multithreading'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object FolderROMsGroupBox: TPanelEx
    Left = 16
    Top = 160
    Width = 1645
    Height = 329
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
      Width = 1643
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'ROMs Folders'
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
      Left = 8
      Top = 26
      Width = 867
      Height = 145
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
        000600000080080001010001000000000000015F030000FFFFFF1F0001000000
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
    end
    object FolderROMsButtonUp: TBitBtnEx
      Tag = 1
      Left = 878
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
    end
    object FolderROMsButtonDown: TBitBtnEx
      Left = 878
      Top = 49
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
    end
    object FolderROMsButtonSelect: TBitBtnEx
      Left = 878
      Top = 81
      Width = 43
      Height = 21
      Hint = 'Click here to add folders'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object FolderROMsButtonEdit: TBitBtnEx
      Left = 878
      Top = 104
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object FolderROMsButtonDelete: TBitBtnEx
      Left = 878
      Top = 127
      Width = 43
      Height = 21
      Hint = 'Click here to delete selected folders [DEL]'
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object FolderROMsButtonClear: TBitBtnEx
      Left = 878
      Top = 150
      Width = 43
      Height = 21
      Hint = 'Click here to clear folders list'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
  end
  object VideoGroupBox: TPanelEx
    Left = 16
    Top = 514
    Width = 1645
    Height = 381
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
    object VideoGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 1643
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Video'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object ResolutionLabel: TShadowLabel
      Left = 623
      Top = 45
      Width = 98
      Height = 31
      Caption = 'Resolution'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object Real3DVertexShaderLabel: TShadowLabel
      Left = 10
      Top = 127
      Width = 200
      Height = 31
      Caption = 'Real3D Vertex Shader'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object Real3DFragmentShaderLabel: TShadowLabel
      Left = 10
      Top = 208
      Width = 230
      Height = 31
      Caption = 'Real3D Fragment Shader'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object Video3DEngineLabel: TShadowLabel
      Left = 10
      Top = 45
      Width = 96
      Height = 31
      Caption = '3D Engine'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object LoadTileMapVertexShader2DLabel: TShadowLabel
      Left = 623
      Top = 127
      Width = 310
      Height = 31
      Caption = 'Load Tile Map Vertex Shader (2D)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object LoadTileMapFragmentShader2DLabel: TShadowLabel
      Left = 623
      Top = 208
      Width = 340
      Height = 31
      Caption = 'Load Tile Map Fragment Shader (2D)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object LoadReal3DScrollFogVertexShaderLabel: TShadowLabel
      Left = 10
      Top = 291
      Width = 508
      Height = 31
      Caption = 'Load Real3D Scroll Fog Vertex Shader (New 3D Engine)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object LoadReal3DScrollFogFragmentShaderLabel: TShadowLabel
      Left = 623
      Top = 291
      Width = 538
      Height = 31
      Caption = 'Load Real3D Scroll Fog Fragment Shader (New 3D Engine)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object ScreenResolution: TComboBox2Ex
      Left = 623
      Top = 81
      Width = 512
      Height = 36
      Hint = 
        'Screen resolution (auto = current desktop  resolution / default ' +
        'emulator windowed resolution'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DisableThrottle: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 279
      Width = 180
      Height = 36
      Hint = 'Disable 60Hz frame rate limit (not recommended!)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Disable Throttle'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowFPS: TAdvOfficeCheckBoxEx
      Left = 1500
      Top = 135
      Width = 125
      Height = 36
      Hint = 'Display frame rate in window title bar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show FPS'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Real3DVertexShader: TEditEx
      Left = 10
      Top = 163
      Width = 512
      Height = 36
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object Real3DFragmentShader: TEditEx
      Left = 10
      Top = 245
      Width = 512
      Height = 36
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object Real3DVertexShaderButtonSelect: TBitBtnEx
      Left = 527
      Top = 163
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      CaptionVertIndent = -1
    end
    object Real3DFragmentShaderButtonSelect: TBitBtnEx
      Left = 527
      Top = 245
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      CaptionVertIndent = -1
    end
    object Widescreen: TAdvOfficeCheckBoxEx
      Left = 1500
      Top = 91
      Width = 140
      Height = 36
      Hint = 'Expand 3D field of view to screen width'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Widescreen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FullScreen: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 91
      Width = 135
      Height = 36
      Hint = 'Run game in full screen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object GPUMultithreading: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 185
      Width = 220
      Height = 36
      Hint = 
        'Run graphics rendering in separate thread (disable to run in mai' +
        'n thread)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'GPU Multithreading'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Video3DEngine: TComboBox2Ex
      Left = 10
      Top = 81
      Width = 512
      Height = 36
      Style = csOwnerDrawFixed
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 1
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Text = 'New 3D Engine by Ian Curtis (recommended)'
      Items.Strings = (
        'Legacy 3D Engine (faster but less accurate)'
        'New 3D Engine by Ian Curtis (recommended)')
    end
    object DisableVSync: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 232
      Width = 175
      Height = 36
      Hint = 'Do not lock to vertical refresh rate'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 11
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Disable V-Sync'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Stretch: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 138
      Width = 95
      Height = 36
      Hint = 'Fit viewport to resolution, ignoring aspect ratio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 12
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Stretch'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object LoadTileMapVertexShader2D: TEditEx
      Left = 623
      Top = 163
      Width = 512
      Height = 36
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object LoadTileMapVertexShader2DButtonSelect: TBitBtnEx
      Left = 1140
      Top = 163
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      CaptionVertIndent = -1
    end
    object LoadTileMapFragmentShader2D: TEditEx
      Left = 623
      Top = 245
      Width = 512
      Height = 36
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object LoadTileMapFragmentShader2DButtonSelect: TBitBtnEx
      Left = 1140
      Top = 245
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      CaptionVertIndent = -1
    end
    object MultiTexture: TAdvOfficeCheckBoxEx
      Left = 1235
      Top = 326
      Width = 340
      Height = 36
      Hint = 
        'Use 8 texture maps for accurate decoding (disable to decode to a' +
        ' single texture map)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 17
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Multi-Texture (Legacy 3D Engine)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object LoadReal3DScrollFogVertexShader: TEditEx
      Left = 10
      Top = 327
      Width = 512
      Height = 36
      Hint = 'Load Real3D vertex shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object LoadReal3DScrollFogVertexShaderButtonSelect: TBitBtnEx
      Left = 527
      Top = 327
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      CaptionVertIndent = -1
    end
    object LoadReal3DScrollFogFragmentShaderButtonSelect: TBitBtnEx
      Left = 1140
      Top = 327
      Width = 70
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      CaptionVertIndent = -1
    end
    object LoadReal3DScrollFogFragmentShader: TEditEx
      Left = 623
      Top = 327
      Width = 512
      Height = 36
      Hint = 'Load Real3D fragment shader for 3D rendering'
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
    object Video3DEngineButtonReset: TBitBtnEx
      Left = 527
      Top = 81
      Width = 70
      Height = 36
      Hint = 'Click here to set default 3D engine'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      CaptionVertIndent = -1
    end
    object QuadRendering: TAdvOfficeCheckBoxEx
      Left = 1228
      Top = 44
      Width = 410
      Height = 36
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 23
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Quad Rendering (New 3D Engine)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object InputGroupBox: TPanelEx
    Left = 1018
    Top = 1038
    Width = 643
    Height = 185
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
    object InputGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Input'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object CrosshairsLabel: TShadowLabel
      Left = 10
      Top = 141
      Width = 220
      Height = 31
      Caption = 'Crosshairs (Gun Games)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object InputSystem: TComboBox2Ex
      Left = 10
      Top = 45
      Width = 546
      Height = 36
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'DirectInput (default)'
      Items.Strings = (
        'DirectInput (default)'
        'XInput (for Xbox 360)'
        'Raw Input (multiple mice and keyboards)'
        'SDL (non-Windows builds)')
      CaptionVertIndent = -1
    end
    object InputSystemConfigButton: TBitBtnEx
      Left = 561
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Open emulator'#39's config input window (select input system first!)'
      Caption = 'Config'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EnableForceFeedback: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 91
      Width = 450
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Force Feedback (DirectInput / XInput)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Crosshairs: TComboBox2Ex
      Left = 244
      Top = 138
      Width = 312
      Height = 36
      Hint = 'Crosshairs configuration for gun games'
      Style = csOwnerDrawFixed
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'None'
      Items.Strings = (
        'None'
        'Player 1 Only'
        'Player 2 Only'
        'Player 1 and Player 2')
      CaptionVertIndent = -1
    end
  end
  object PowerPCFrequencyGroupBox: TPanelEx
    Left = 16
    Top = 920
    Width = 1645
    Height = 93
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
    object PowerPCFrequencyGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 1643
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'PowerPC Bus Frequency (PPC)'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object PowerPCFrequencyLabel: TShadowLabel
      Left = 164
      Top = 48
      Width = 73
      Height = 31
      Caption = '50 MHz'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Transparent = False
    end
    object PowerPCFrequencyCustomLabel: TShadowLabel
      Left = 425
      Top = 48
      Width = 95
      Height = 31
      Alignment = taRightJustify
      Caption = '1000 MHz'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Transparent = False
    end
    object PowerPCFrequency: TGaugeBar
      Left = 10
      Top = 45
      Width = 145
      Height = 36
      Hint = 'Set PowerPC frequency in MHz [Default: 50]'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 30
      Max = 8
      ShowHint = True
      ShowHandleGrip = True
      Position = 5
    end
    object PowerPCFrequencyUseCustom: TAdvOfficeCheckBoxEx
      Left = 261
      Top = 45
      Width = 145
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Use Custom'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object PowerPCFrequencyCustom: TGaugeBar
      Left = 524
      Top = 45
      Width = 1109
      Height = 36
      Hint = 'Set PowerPC frequency in MHz [Default: 50]'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 30
      Max = 1000
      Min = 1
      ShowHint = True
      ShowHandleGrip = True
      Position = 5
    end
  end
  object AudioGroupBox: TPanelEx
    Left = 16
    Top = 1038
    Width = 977
    Height = 339
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
      Width = 975
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Audio'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object SoundVolumeLabel: TShadowLabel
      Left = 10
      Top = 91
      Width = 450
      Height = 31
      Hint = 'Volume of SCSP Generated Sound [%u'
      AutoSize = False
      Caption = 'Volume of SCSP Generated Sound [100 %]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Transparent = False
    end
    object MusicVolumeLabel: TShadowLabel
      Left = 10
      Top = 173
      Width = 450
      Height = 31
      Hint = 'Music Volume, Digital Sound Board [%u'
      AutoSize = False
      Caption = 'Music Volume, Digital Sound Board [100 %]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Transparent = False
    end
    object AudioBalanceFrontRearLabel: TShadowLabel
      Left = 10
      Top = 255
      Width = 450
      Height = 31
      Hint = 'Front/Rear Balance [%d'
      AutoSize = False
      Caption = 'Front/Rear Balance [0 %]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Transparent = False
    end
    object SoundVolume: TGaugeBar
      Left = 10
      Top = 127
      Width = 807
      Height = 36
      Hint = 
        'Adjust colume of SCSP-generated sound, applies only when Digital' +
        ' Sound Board is present'#13#10'(mouse right-click for default)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 30
      LargeChange = 5
      Max = 200
      ShowHint = True
      ShowHandleGrip = True
      Position = 100
    end
    object DisableSound: TAdvOfficeCheckBoxEx
      Left = 260
      Top = 44
      Width = 170
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Disable Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object DisableMusic: TAdvOfficeCheckBoxEx
      Left = 546
      Top = 44
      Width = 425
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Disable Digital Sound Board (MPEG music)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MusicVolume: TGaugeBar
      Left = 10
      Top = 209
      Width = 807
      Height = 36
      Hint = 
        'Adjust Digital Sound Board volume'#13#10'(mouse right-click for defaul' +
        't)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 30
      LargeChange = 5
      Max = 200
      ShowHint = True
      ShowHandleGrip = True
      Position = 100
    end
    object FlipStereo: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 44
      Width = 130
      Height = 36
      Hint = 'Swaps the left and right audio channels'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Flip Stereo'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AudioBalanceFrontRear: TGaugeBar
      Left = 10
      Top = 291
      Width = 807
      Height = 36
      Hint = 
        'Adjust sound position between front and rear speakers'#13#10'(mouse ri' +
        'ght-click for default)'
      Color = clWhite
      Backgnd = bgPattern
      ButtonSize = 30
      LargeChange = 5
      Min = -100
      ShowHint = True
      ShowHandleGrip = True
      Position = 0
    end
    object SoundVolumeButtonLast: TBitBtnEx
      Left = 822
      Top = 127
      Width = 70
      Height = 36
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      CaptionVertIndent = -1
    end
    object MusicVolumeButtonLast: TBitBtnEx
      Left = 822
      Top = 209
      Width = 70
      Height = 36
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      CaptionVertIndent = -1
    end
    object SoundVolumeButtonReset: TBitBtnEx
      Left = 895
      Top = 127
      Width = 70
      Height = 36
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      CaptionVertIndent = -1
    end
    object MusicVolumeButtonReset: TBitBtnEx
      Left = 895
      Top = 209
      Width = 70
      Height = 36
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      CaptionVertIndent = -1
    end
    object AudioBalanceFrontRearButtonLast: TBitBtnEx
      Left = 822
      Top = 291
      Width = 70
      Height = 36
      Hint = 'Click here to set last used volume'
      Caption = 'Last'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      CaptionVertIndent = -1
    end
    object AudioBalanceFrontRearButtonReset: TBitBtnEx
      Left = 895
      Top = 291
      Width = 70
      Height = 36
      Hint = 'Click here to reset volume to default'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      CaptionVertIndent = -1
    end
  end
  object NetworkBoardGroupBox: TPanelEx
    Left = 1018
    Top = 1248
    Width = 623
    Height = 222
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
    Visible = False
    object NetworkBoardGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 621
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Network Board'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object NetworkAddressOutLabel: TShadowLabel
      Left = 10
      Top = 138
      Width = 140
      Height = 31
      Caption = 'IP Address Out'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object NetworkPortInLabel: TShadowLabel
      Left = 278
      Top = 138
      Width = 62
      Height = 31
      Caption = 'Port In'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object NetworkPortOutLabel: TShadowLabel
      Left = 373
      Top = 138
      Width = 79
      Height = 31
      Caption = 'Port Out'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
    object NetworkEnable: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 44
      Width = 240
      Height = 36
      Hint = 'Disabled by default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Network Board'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NetworkSimulateNetBoard: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 91
      Width = 385
      Height = 36
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Simulate The Network Board (Default)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NetworkEmulateNetBoard: TAdvOfficeCheckBoxEx
      Left = 326
      Top = 44
      Width = 295
      Height = 36
      Hint = 'Requires multithreading to be disabled'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Emulate The Network Board'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NetworkAddressOut: TEditEx
      Left = 10
      Top = 174
      Width = 263
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
    end
    object NetworkPortIn: TEditEx
      Left = 278
      Top = 174
      Width = 90
      Height = 36
      Hint = 'HTTP server listener port'
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object NetworkButtonReset: TBitBtnEx
      Left = 468
      Top = 174
      Width = 70
      Height = 36
      Hint = 'Reset to default values'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object NetworkPortOut: TEditEx
      Left = 373
      Top = 174
      Width = 90
      Height = 36
      Hint = 'HTTP server listener port'
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 6
    end
    object NetworkButtonHelp: TBitBtnEx
      Left = 541
      Top = 174
      Width = 70
      Height = 36
      Hint = 'Tips on how to set master/slave IPs and ports'
      Caption = 'Help'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
  end
  object ButtonReadFile: TBitBtnEx
    Left = 16
    Top = 1490
    Width = 168
    Height = 45
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ButtonOk: TBitBtnEx
    Left = 1311
    Top = 1490
    Width = 168
    Height = 45
    Hint = 'Close and update settings'
    Caption = 'Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
  end
  object ButtonCancel: TBitBtnEx
    Left = 1489
    Top = 1490
    Width = 168
    Height = 45
    Hint = 'Close without updating'
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
end
