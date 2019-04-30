object FormArcadeScanGamesResults: TFormArcadeScanGamesResults
  Left = 1205
  Top = 429
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Games with Missing ROMs/CHDs'
  ClientHeight = 615
  ClientWidth = 999
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ROMsListView: TEasyListview
    Tag = 1
    Left = 0
    Top = 81
    Width = 999
    Height = 534
    Align = alClient
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 22
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = IL_ScanResults
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -13
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsBold, fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000000BA010000FFFFFF1F0001000000
      010000000E00000020002000200020002000200020002000200020004E006100
      6D006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE0006000000800800010100010100000000000040000000FF
      FFFF1F0001000000010000000500000043005200430033003200000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      000000800800010100010200000000000020010000FFFFFF1F00010000000100
      0000050000005300480041002D00310000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0300000000000023000000FFFFFF1F0001000000010000000400000053006900
      7A006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE0006000000800800010100010400000000000032000000FF
      FFFF1F0001000000010000000600000044006500760069006300650000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010500000000000078000000FFFFFF1F0001000000
      0100000006000000530074006100740075007300000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_StandardIconsSmall
    ImagesSmall = IL_ScanResults
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandIndent = 24
    PaintInfoGroup.BandLength = 550
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 7
    PaintInfoGroup.ExpandImageIndent = 6
    PaintInfoGroup.ImageIndent = 9
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ImageIndent = 3
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ShowGroupMargins = True
    ShowThemedBorder = False
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
    OnGroupCompare = ROMsListViewGroupCompare
    OnItemCompare = ROMsListViewItemCompare
    OnItemPaintText = ROMsListViewItemPaintText
    OnItemSelectionChanged = ROMsListViewItemSelectionChanged
  end
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 999
    Height = 81
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = clYellow
    Color4 = clTeal
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
    object LabelEmulatorVersion: TShadowLabel
      Left = 79
      Top = 4
      Width = 515
      Height = 17
      Caption = 
        'Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
        '2)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelGamesListVersion: TShadowLabel
      Left = 105
      Top = 24
      Width = 412
      Height = 14
      Caption = 
        'Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
        '2)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelGamesListList: TShadowLabel
      Left = 79
      Top = 24
      Width = 27
      Height = 14
      Caption = 'List:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelTotalGames: TShadowLabel
      Left = 79
      Top = 54
      Width = 78
      Height = 16
      Caption = '000000 Games'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clCream
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object MAMEMachinesFilterIcon: TImage
      Left = 301
      Top = 53
      Width = 16
      Height = 16
    end
    object LabelSearchBar: TShadowLabel
      Left = 690
      Top = 53
      Width = 72
      Height = 16
      Caption = 'Search Game'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clCream
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object SystemSelectorToolBar: TToolBar
      Left = 773
      Top = 8
      Width = 225
      Height = 30
      Align = alNone
      ButtonHeight = 30
      ButtonWidth = 31
      Color = 15856113
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = FormMain.IL_ArcadeSystem_Small
      ParentColor = False
      TabOrder = 0
      Transparent = False
      OnCustomDraw = SystemSelectorToolBarCustomDraw
      object sysMAME: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 1
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysSupermodelSEGAModel3: TToolButton
        Left = 31
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 2
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysDemul: TToolButton
        Left = 62
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 4
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysHBMAME: TToolButton
        Left = 93
        Top = 0
        Enabled = False
        Grouped = True
        ImageIndex = 5
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysDICE: TToolButton
        Left = 124
        Top = 0
        Enabled = False
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysSEGAModel2: TToolButton
        Left = 155
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 7
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
      object sysZiNc: TToolButton
        Left = 186
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 8
        Style = tbsCheck
        OnClick = sysMAMEClick
      end
    end
    object MAMEMachinesFilter: TComboBox
      Left = 320
      Top = 50
      Width = 185
      Height = 21
      Hint = 'MAME games filter'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'List All'
      OnSelect = MAMEMachinesFilterSelect
      Items.Strings = (
        'List All'
        'MAME Games Only'
        'MAME Software List Games Only')
    end
    object SearchBarEdit: TEditEx
      Left = 766
      Top = 48
      Width = 189
      Height = 24
      Hint = 'Enter a game title or game name'
      AutoSize = False
      BevelOuter = bvNone
      Color = clWhite
      Constraints.MaxHeight = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = SearchBarEditKeyPress
    end
    object SearchBarToolBar: TToolBar
      Left = 958
      Top = 45
      Width = 37
      Height = 30
      Align = alNone
      ButtonHeight = 30
      ButtonWidth = 31
      Color = 15856113
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Images = FormMain.IL_MiscToolBarPopup
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Transparent = False
      Wrapable = False
      OnCustomDraw = SystemSelectorToolBarCustomDraw
      object ButtonFilterTitleApply_ToolBar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Click here to search'
        AutoSize = True
        Caption = 'Apply'
        ImageIndex = 9
        OnClick = ButtonFilterTitleApply_ToolBarClick
      end
    end
  end
  object ButtonToggleTree: TBitBtn
    Left = 0
    Top = 81
    Width = 24
    Height = 23
    Hint = 'Toggle tree nodes open/close'
    Caption = '[]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonToggleTreeClick
  end
  object IL_ScanResults: TImageList
    Left = 576
    Top = 120
  end
  object PopupSplitters: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Bar.BarCaption.ShadowColor = clBlack
    Bar.BarCaption.Visible = False
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clBlack
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupSplittersMeasureMenuItem
    Left = 616
    Top = 120
    object CenterSplitter1: TMenuItem
      Caption = 'Center This Splitter'
    end
    object MenuItem11: TMenuItem
      Caption = 'Center All Splitters'
    end
    object PopupShowSplitterGrip: TMenuItem
      AutoCheck = True
      Caption = 'Show Splitter Grip Icon'
      Checked = True
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object MenuItem13: TMenuItem
      Caption = 'Customize Splitters'
    end
  end
end
