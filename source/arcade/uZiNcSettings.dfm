object FormZiNcSettings: TFormZiNcSettings
  Left = 774
  Top = 490
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 633
  ClientWidth = 837
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
    Top = 605
    Width = 525
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
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 837
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
      Width = 720
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
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 715
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
  object ButtonReadFile: TBitBtnEx
    Left = 8
    Top = 600
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    TabOrder = 1
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtnEx
    Left = 642
    Top = 600
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TBitBtnEx
    Left = 740
    Top = 600
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object FolderROMsGroupBox: TPanelEx
    Left = 8
    Top = 92
    Width = 600
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
    object FolderROMsGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 598
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
      Top = 24
      Width = 582
      Height = 108
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
        0006000000800800010100010000000000000142020000FFFFFF1F0001000000
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
      Left = 8
      Top = 134
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
      Left = 53
      Top = 134
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
      Left = 412
      Top = 134
      Width = 43
      Height = 21
      Hint = 'Click here to add folders'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = FolderROMsButtonSelectClick
    end
    object FolderROMsButtonEdit: TBitBtnEx
      Left = 457
      Top = 134
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = FolderROMsButtonEditClick
    end
    object FolderROMsButtonDelete: TBitBtnEx
      Left = 502
      Top = 134
      Width = 43
      Height = 21
      Hint = 'Click here to delete selected folders [DEL]'
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = FolderROMsButtonDeleteClick
    end
    object FolderROMsButtonClear: TBitBtnEx
      Left = 547
      Top = 134
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
  object ControllerZNCGroupBox: TPanelEx
    Left = 8
    Top = 273
    Width = 292
    Height = 57
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
    object ControllerZNCGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 290
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Controller [.znc file]'
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
    object ControllerZNCButtonSelect: TBitBtnEx
      Left = 239
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Click here to select a controller file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ControllerZNCButtonSelectClick
    end
    object ControllerZNC: TEditEx
      Left = 8
      Top = 26
      Width = 229
      Height = 21
      Hint = 'Choose controller plugin'
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = ControllerZNCChange
    end
  end
  object ControllerConfigFileGroupBox: TPanelEx
    Left = 316
    Top = 273
    Width = 292
    Height = 57
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
    object ControllerConfigFileGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 290
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Controller Config [.cfg file]'
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
    object ControllerConfigFileButtonSelect: TBitBtnEx
      Left = 239
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Click here to select a controller config file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ControllerConfigFileButtonSelectClick
    end
    object ControllerConfigFile: TEditEx
      Left = 8
      Top = 26
      Width = 229
      Height = 21
      Hint = 
        'Gets controller config info from the specified file. The default' +
        ' keyboard plugin ignores this'
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object RendererZNCGroupBox: TPanelEx
    Left = 8
    Top = 346
    Width = 292
    Height = 57
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
    object RendererZNCGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 290
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Renderer [.znc file]'
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
    object RendererZNCButtonSelect: TBitBtnEx
      Left = 239
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Click here to select a renderer file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = RendererZNCButtonSelectClick
    end
    object RendererZNC: TEditEx
      Left = 8
      Top = 26
      Width = 229
      Height = 21
      Hint = 'Choose renderer to use'
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = RendererZNCChange
    end
  end
  object RendererConfigFileGroupBox: TPanelEx
    Left = 316
    Top = 346
    Width = 292
    Height = 57
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
    object RendererConfigFileGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 290
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Renderer Config [.cfg file]'
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
    object RendererConfigFileButtonSelect: TBitBtnEx
      Left = 239
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Click here to select a renderer config file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = RendererConfigFileButtonSelectClick
    end
    object RendererConfigFile: TEditEx
      Left = 8
      Top = 26
      Width = 229
      Height = 21
      Hint = 'Gets renderer config info from the filename specified'
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object OpenGLD3DRendererGroupBox: TPanelEx
    Left = 8
    Top = 419
    Width = 600
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
    object OpenGLD3DRendererGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 598
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'OpenGL / Direct3D Renderer'
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
    object ResolutionLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 57
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
    object ColorDepthLabel: TShadowLabel
      Left = 8
      Top = 66
      Width = 65
      Height = 16
      Caption = 'Color Depth'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ScanLinesLabel: TShadowLabel
      Left = 8
      Top = 112
      Width = 50
      Height = 16
      Caption = 'Scanlines'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object BlendingLabel: TShadowLabel
      Left = 108
      Top = 20
      Width = 48
      Height = 16
      Caption = 'Blending'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object FramerateManualLabel: TShadowLabel
      Left = 250
      Top = 112
      Width = 150
      Height = 16
      Hint = 'Manual Framerate ['
      AutoSize = False
      Caption = 'Manual Framerate [100 fps]'
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
    object TurnDisplayLabel: TShadowLabel
      Left = 108
      Top = 130
      Width = 88
      Height = 16
      Caption = 'Turn The Display'
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
    object TextureSettingsLabel: TShadowLabel
      Left = 332
      Top = 20
      Width = 84
      Height = 16
      Caption = 'Texture Settings'
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
    object TextureTypeLabel: TShadowLabel
      Left = 332
      Top = 38
      Width = 25
      Height = 16
      Caption = 'Type'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object TextureCacheLabel: TShadowLabel
      Left = 429
      Top = 38
      Width = 34
      Height = 16
      Caption = 'Cache'
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
    object TextureFilterLabel: TShadowLabel
      Left = 518
      Top = 38
      Width = 27
      Height = 16
      Caption = 'Filter'
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
    object Resolution: TComboBox2Ex
      Left = 8
      Top = 36
      Width = 90
      Height = 23
      Hint = 'Specifies an exact resolution to run in'
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
      TabOrder = 0
    end
    object FullScreen: TAdvOfficeCheckBoxEx
      Left = 108
      Top = 85
      Width = 78
      Height = 20
      Hint = 'Run in full screen or in window'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ColorDepth: TComboBox2Ex
      Left = 8
      Top = 82
      Width = 90
      Height = 23
      Hint = 'Full screen color depth'
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
      TabOrder = 2
      Text = '32-bit'
      Items.Strings = (
        '16-bit'
        '32-bit')
    end
    object Scanlines: TComboBox2Ex
      Left = 8
      Top = 128
      Width = 90
      Height = 23
      Hint = 'Emulate scanlines'
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
      TabOrder = 3
      Text = 'None'
      Items.Strings = (
        'None'
        'Black'
        'Bright')
    end
    object Blending: TComboBox2Ex
      Left = 108
      Top = 36
      Width = 132
      Height = 23
      Hint = 'Enhanced color blend'
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
      TabOrder = 4
      Text = 'OpenGL'
      Items.Strings = (
        'OpenGL / Direct3D'
        'OpenGL'
        'Direct3D')
    end
    object Dithering: TAdvOfficeCheckBoxEx
      Left = 108
      Top = 65
      Width = 112
      Height = 20
      Hint = 'Image dithering (only needed in 16 bit color depth)'
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Dithering (16-bit)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowFPS: TAdvOfficeCheckBoxEx
      Left = 250
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FrameLimitation: TAdvOfficeCheckBoxEx
      Left = 338
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FrameSkip: TAdvOfficeCheckBoxEx
      Left = 250
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FramerateDetection: TAdvOfficeCheckBoxEx
      Left = 338
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TurnDisplay: TComboBox2Ex
      Left = 197
      Top = 128
      Width = 43
      Height = 23
      Hint = 'Rotate the whole display'
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
      TabOrder = 10
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object EnableKeys: TAdvOfficeCheckBoxEx
      Left = 108
      Top = 105
      Width = 131
      Height = 20
      Hint = 'Enables keys for the fps menu/pause'
      Checked = True
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Enable Renderer Keys'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TextureType: TComboBox2Ex
      Left = 359
      Top = 36
      Width = 60
      Height = 23
      Hint = 'Textures color format ("Auto" = card'#39's default)'
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
      TabOrder = 12
      Text = 'Auto'
      Items.Strings = (
        'Auto'
        '4-bit'
        '5-bit'
        '8-bit')
    end
    object TextureCache: TComboBox2Ex
      Left = 465
      Top = 36
      Width = 43
      Height = 23
      Hint = 'Level of texture caching'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 15
      ItemIndex = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      Text = '2'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object TextureFilter: TComboBox2Ex
      Left = 548
      Top = 36
      Width = 43
      Height = 23
      Hint = 'Texture filtering (may cause glitches!)'
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
      TabOrder = 14
      Text = '3'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3')
    end
    object FramerateManual: TGaugeBar
      Left = 250
      Top = 128
      Width = 340
      Height = 23
      Hint = 'Multiplier. Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      Max = 1000
      ShowHandleGrip = True
      Position = 100
      OnChange = FramerateManualChange
    end
  end
  object VideoGroupBox: TPanelEx
    Left = 624
    Top = 273
    Width = 205
    Height = 197
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
      Width = 203
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Video'
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
    object RotateLabel: TShadowLabel
      Left = 8
      Top = 84
      Width = 35
      Height = 16
      Caption = 'Rotate'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object NetGameConnectLabel: TShadowLabel
      Left = 8
      Top = 152
      Width = 102
      Height = 16
      Caption = 'Net Game Connect'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Rotate: TComboBox2Ex
      Left = 8
      Top = 100
      Width = 187
      Height = 23
      Hint = 'Overrides ZiNc'#39's default screen rotation setting'
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NetGameConnect: TEditEx
      Left = 8
      Top = 168
      Width = 187
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object AudioGroupBox: TPanelEx
    Left = 624
    Top = 96
    Width = 205
    Height = 160
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
      Width = 203
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
    object SoundFilterCutoffLabel: TShadowLabel
      Left = 98
      Top = 113
      Width = 64
      Height = 16
      Caption = 'Filter Cutoff'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSoundLiteSurroundMultiplier: TShadowLabel
      Left = 173
      Top = 88
      Width = 20
      Height = 16
      AutoSize = False
      Caption = '40'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object SoundFilter: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 111
      Width = 85
      Height = 20
      Hint = 'Provides a quality increase with a tiny amount more CPU'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Sound Filter'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundStereoExciter: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 40
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
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundLiteSurround: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 60
      Width = 132
      Height = 20
      Hint = 'Enables "Lite-Surround". Try it and listen :)'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Lite-Surround Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundFilterCutoff: TComboBox2Ex
      Left = 98
      Top = 129
      Width = 97
      Height = 23
      Hint = 'Sets the filter cutoff frequency'
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
      TabOrder = 3
      Text = '22050 Hz'
      Items.Strings = (
        '11025 Hz'
        '22050 Hz'
        '44100 Hz'
        '48000 Hz')
    end
    object SoundLiteSurroundMultiplier: TGaugeBar
      Left = 8
      Top = 84
      Width = 161
      Height = 23
      Hint = 'Multiplier. Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      ShowHandleGrip = True
      Position = 40
      OnChange = SoundLiteSurroundMultiplierChange
    end
    object SoundEnableSound: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 20
      Width = 92
      Height = 20
      Checked = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Enable Sound'
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
