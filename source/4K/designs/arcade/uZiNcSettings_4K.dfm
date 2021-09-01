object FormZiNcSettings4K: TFormZiNcSettings4K
  Left = 774
  Top = 490
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (4K)'
  ClientHeight = 1199
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
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 200
    Top = 1145
    Width = 1110
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
    EllipsType = etNone
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
    Left = 16
    Top = 1138
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
    TabOrder = 1
    CaptionVertIndent = -1
  end
  object ButtonOk: TBitBtnEx
    Left = 1338
    Top = 1138
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
    TabOrder = 2
    CaptionVertIndent = -1
  end
  object ButtonCancel: TBitBtnEx
    Left = 1492
    Top = 1138
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
    TabOrder = 3
    CaptionVertIndent = -1
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
    end
    object ButtonUp: TBitBtnEx
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
    end
    object ButtonDown: TBitBtnEx
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
    end
    object FolderROMButtonSelect: TBitBtnEx
      Left = 412
      Top = 134
      Width = 43
      Height = 21
      Hint = 'Click here to add folders'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    end
  end
  object ControllerZNCGroupBox: TPanelEx
    Left = 16
    Top = 514
    Width = 643
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
    object ControllerZNCGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Controller [.znc file]'
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
    object ControllerZNCButtonSelect: TBitBtnEx
      Left = 561
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Click here to select a controller file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object ControllerZNC: TEditEx
      Left = 10
      Top = 45
      Width = 546
      Height = 36
      Hint = 'Choose controller plugin'
      TabStop = False
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
      TabOrder = 1
    end
  end
  object ControllerConfigFileGroupBox: TPanelEx
    Left = 684
    Top = 514
    Width = 643
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
    object ControllerConfigFileGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Controller Config [.cfg file]'
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
    object ControllerConfigFileButtonSelect: TBitBtnEx
      Left = 561
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Click here to select a controller config file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object ControllerConfigFile: TEditEx
      Left = 10
      Top = 45
      Width = 546
      Height = 36
      Hint = 
        'Gets controller config info from the specified file. The default' +
        ' keyboard plugin ignores this'
      TabStop = False
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
      TabOrder = 1
    end
  end
  object RendererZNCGroupBox: TPanelEx
    Left = 16
    Top = 627
    Width = 643
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
    object RendererZNCGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Renderer [.znc file]'
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
    object RendererZNCButtonSelect: TBitBtnEx
      Left = 561
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Click here to select a renderer file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object RendererZNC: TEditEx
      Left = 10
      Top = 45
      Width = 546
      Height = 36
      Hint = 'Choose renderer to use'
      TabStop = False
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
      TabOrder = 1
    end
  end
  object RendererConfigFileGroupBox: TPanelEx
    Left = 684
    Top = 627
    Width = 643
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
    object RendererConfigFileGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Renderer Config [.cfg file]'
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
    object RendererConfigFileButtonSelect: TBitBtnEx
      Left = 561
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Click here to select a renderer config file'
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object RendererConfigFile: TEditEx
      Left = 10
      Top = 45
      Width = 546
      Height = 36
      Hint = 'Gets renderer config info from the filename specified'
      TabStop = False
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
      TabOrder = 1
    end
  end
  object OpenGLD3DRendererGroupBox: TPanelEx
    Left = 16
    Top = 745
    Width = 977
    Height = 373
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
      Width = 975
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'OpenGL / Direct3D Renderer'
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
      Left = 10
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
    object ColorDepthLabel: TShadowLabel
      Left = 10
      Top = 127
      Width = 113
      Height = 31
      Caption = 'Color Depth'
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
    object ScanLinesLabel: TShadowLabel
      Left = 10
      Top = 208
      Width = 87
      Height = 31
      Caption = 'Scanlines'
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
    object BlendingLabel: TShadowLabel
      Left = 222
      Top = 45
      Width = 82
      Height = 31
      Caption = 'Blending'
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
    object FramerateManualLabel: TShadowLabel
      Left = 10
      Top = 289
      Width = 285
      Height = 31
      Hint = 'Manual Framerate ['
      AutoSize = False
      Caption = 'Manual Framerate [100 fps]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object TurnDisplayLabel: TShadowLabel
      Left = 222
      Top = 247
      Width = 156
      Height = 31
      Caption = 'Turn The Display'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object TextureSettingsLabel: TShadowLabel
      Left = 559
      Top = 45
      Width = 148
      Height = 31
      Caption = 'Texture Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object TextureTypeLabel: TShadowLabel
      Left = 559
      Top = 83
      Width = 44
      Height = 31
      Caption = 'Type'
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
    object TextureCacheLabel: TShadowLabel
      Left = 717
      Top = 83
      Width = 58
      Height = 31
      Caption = 'Cache'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object TextureFilterLabel: TShadowLabel
      Left = 854
      Top = 83
      Width = 46
      Height = 31
      Caption = 'Filter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object Resolution: TComboBox2Ex
      Left = 10
      Top = 81
      Width = 187
      Height = 36
      Hint = 'Specifies an exact resolution to run in'
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
    object FullScreen: TAdvOfficeCheckBoxEx
      Left = 222
      Top = 175
      Width = 135
      Height = 36
      Hint = 'Run in full screen or in window'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    object ColorDepth: TComboBox2Ex
      Left = 10
      Top = 164
      Width = 187
      Height = 36
      Hint = 'Full screen color depth'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
      Left = 10
      Top = 245
      Width = 187
      Height = 36
      Hint = 'Emulate scanlines'
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
      TabOrder = 3
      Text = 'None'
      Items.Strings = (
        'None'
        'Black'
        'Bright')
    end
    object Blending: TComboBox2Ex
      Left = 222
      Top = 81
      Width = 221
      Height = 36
      Hint = 'Enhanced color blend'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
      Left = 222
      Top = 128
      Width = 195
      Height = 36
      Hint = 'Image dithering (only needed in 16 bit color depth)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Dithering (16-bit)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowFPS: TAdvOfficeCheckBoxEx
      Left = 511
      Top = 128
      Width = 140
      Height = 36
      Hint = 'FPS display on startup'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show FPS'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FrameLimitation: TAdvOfficeCheckBoxEx
      Left = 751
      Top = 175
      Width = 190
      Height = 36
      Hint = 'Limit fps to monitor refresh rate'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Frame Limitation'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FrameSkip: TAdvOfficeCheckBoxEx
      Left = 511
      Top = 175
      Width = 140
      Height = 36
      Hint = 'Skip frames to increase speed'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Frame Skip'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FramerateDetection: TAdvOfficeCheckBoxEx
      Left = 751
      Top = 128
      Width = 220
      Height = 36
      Hint = 'Auto framerate detection'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Framerate Detection'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TurnDisplay: TComboBox2Ex
      Left = 383
      Top = 245
      Width = 60
      Height = 36
      Hint = 'Rotate the whole display'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
    object EnableKeys: TAdvOfficeCheckBoxEx
      Left = 511
      Top = 218
      Width = 235
      Height = 36
      Hint = 'Enables keys for the fps menu/pause'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Renderer Keys'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TextureType: TComboBox2Ex
      Left = 610
      Top = 81
      Width = 90
      Height = 36
      Hint = 'Textures color format ("Auto" = card'#39's default)'
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
      TabOrder = 12
      Text = 'Auto'
      Items.Strings = (
        'Auto'
        '4-bit'
        '5-bit'
        '8-bit')
    end
    object TextureCache: TComboBox2Ex
      Left = 779
      Top = 81
      Width = 60
      Height = 36
      Hint = 'Level of texture caching'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
      Left = 905
      Top = 81
      Width = 60
      Height = 36
      Hint = 'Texture filtering (may cause glitches!)'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
      Left = 10
      Top = 325
      Width = 955
      Height = 36
      Hint = 'Multiplier. Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 30
      LargeChange = 10
      Max = 1000
      ShowHandleGrip = True
      Position = 100
    end
  end
  object VideoGroupBox: TPanelEx
    Left = 1018
    Top = 745
    Width = 309
    Height = 373
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
      Width = 307
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
    object RotateLabel: TShadowLabel
      Left = 10
      Top = 187
      Width = 61
      Height = 31
      Caption = 'Rotate'
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
    object NetGameConnectLabel: TShadowLabel
      Left = 10
      Top = 289
      Width = 178
      Height = 31
      Caption = 'Net Game Connect'
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
    end
    object SlowGeometry: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 44
      Width = 175
      Height = 36
      Hint = 
        'Uses slower but more accurate geometry calculations. If you see ' +
        'errors, try this as a fix. Gallop Racer 3 in particular benefits' +
        ' from using the "slow" geometry - the ground breaks up otherwise'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Slow Geometry'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MemoryPrediction: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 91
      Width = 215
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
      Caption = 'Memory Prediction'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object StackInRAMHack: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 138
      Width = 225
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
      Caption = 'Stack In RAM (Hack)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Rotate: TComboBox2Ex
      Left = 75
      Top = 185
      Width = 222
      Height = 36
      Hint = 'Overrides ZiNc'#39's default screen rotation setting'
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
      TabOrder = 3
      Text = 'No Rotation'
      Items.Strings = (
        'No Rotation'
        '90 Degrees'
        '180 Degrees'
        '280 Degrees')
    end
    object NetGameServer: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 244
      Width = 195
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Net Game Server'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NetGameConnect: TEditEx
      Left = 10
      Top = 325
      Width = 287
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object AudioGroupBox: TPanelEx
    Left = 1352
    Top = 514
    Width = 309
    Height = 354
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
      Width = 307
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
    object SoundFilterCutoffLabel: TShadowLabel
      Left = 37
      Top = 270
      Width = 110
      Height = 31
      Caption = 'Filter Cutoff'
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
    object LabelSoundLiteSurroundMultiplier: TShadowLabel
      Left = 266
      Top = 187
      Width = 40
      Height = 31
      AutoSize = False
      Caption = '100'
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
    object SoundFilter: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 231
      Width = 145
      Height = 36
      Hint = 'Provides a quality increase with a tiny amount more CPU'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Sound Filter'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundStereoExciter: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 91
      Width = 160
      Height = 36
      Hint = 
        'Enables "stereo exciter" which widens the stereo image. Try it a' +
        'nd listen :)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Stereo Exciter'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundLiteSurround: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 138
      Width = 230
      Height = 36
      Hint = 'Enables "Lite-Surround". Try it and listen :)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Lite-Surround Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SoundFilterCutoff: TComboBox2Ex
      Left = 37
      Top = 306
      Width = 260
      Height = 36
      Hint = 'Sets the filter cutoff frequency'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
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
      Left = 10
      Top = 185
      Width = 250
      Height = 36
      Hint = 'Multiplier. Adjusts how powerful the lite-surround is'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 30
      LargeChange = 10
      ShowHandleGrip = True
      Position = 40
    end
    object SoundEnableSound: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 44
      Width = 160
      Height = 36
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Sound'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
end
