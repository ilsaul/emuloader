object FormArcadeScanGamesResults: TFormArcadeScanGamesResults
  Left = 1205
  Top = 534
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
    ImagesState = FormMain.IL_LeftPanel
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -13
    GroupFont.Name = 'Verdana'
    GroupFont.Style = []
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
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_StandardIconsSmall
    ImagesSmall = FormMain.IL_LeftPanel
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
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnGroupCompare = ROMsListViewGroupCompare
    OnItemCompare = ROMsListViewItemCompare
    OnItemPaintText = ROMsListViewItemPaintText
    OnItemSelectionChanged = ROMsListViewItemSelectionChanged
  end
  object TopBar: TPanelEx
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
    Steps = 80
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
      Width = 513
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
      Left = 79
      Top = 24
      Width = 404
      Height = 14
      Caption = 
        'Games List: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
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
    object LabelTotalGames: TShadowLabel
      Left = 79
      Top = 54
      Width = 76
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
      Left = 219
      Top = 53
      Width = 16
      Height = 16
    end
    object LabelSearchBar: TShadowLabel
      Left = 704
      Top = 53
      Width = 70
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
    object ButtonFilterTitleApply_ToolBar: TSpeedButtonEx
      Left = 965
      Top = 47
      Width = 26
      Height = 27
      Hint = 'Click here to search'
      Flat = True
      ImageIndex = 9
      Images = FormMain.IL_MiscToolBarPopup
      OnClick = ButtonFilterTitleApply_ToolBarClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysMAME: TSpeedButtonEx
      Left = 803
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 1
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysSupermodelSEGAModel3: TSpeedButtonEx
      Left = 830
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 2
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysDemul: TSpeedButtonEx
      Left = 857
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 4
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysHBMAME: TSpeedButtonEx
      Left = 884
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 5
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysDICE: TSpeedButtonEx
      Left = 911
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 6
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysSEGAModel2: TSpeedButtonEx
      Left = 938
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 7
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object sysZiNc: TSpeedButtonEx
      Left = 965
      Top = 8
      Width = 26
      Height = 27
      GroupIndex = 1
      Enabled = False
      Flat = True
      ImageIndex = 8
      Images = FormMain.IL_StandardIconsStandard
      OnClick = sysMAMEClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object MAMEMachinesFilter: TComboBox2Ex
      Left = 238
      Top = 50
      Width = 135
      Height = 23
      Hint = 'MAME games filter'
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
      Text = 'List All'
      OnSelect = MAMEMachinesFilterSelect
      Items.Strings = (
        'List All'
        'Arcade Games'
        'Software List Games')
    end
    object SearchBarEdit: TTntEditEx
      Left = 780
      Top = 48
      Width = 182
      Height = 24
      Hint = 'Enter a game title or game name'
      AutoSize = False
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = SearchBarEditKeyPress
    end
    object SetsFilter_CHDs: TAdvOfficeCheckBoxEx
      Left = 383
      Top = 51
      Width = 80
      Height = 20
      Hint = 'Show only sets with CHDs (HDD, CD, Flash Card, VHS)'
      TabOrder = 2
      OnClick = SetsFilter_CHDsClick
      Alignment = taLeftJustify
      Caption = 'CHDs Only'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
    object SetsFilter_DeviceROMs: TAdvOfficeCheckBoxEx
      Left = 466
      Top = 51
      Width = 92
      Height = 20
      Hint = 'Show/hide sets that have device ROMs'
      Checked = True
      TabOrder = 3
      OnClick = SetsFilter_CHDsClick
      Alignment = taLeftJustify
      Caption = 'Device ROMs'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
    object SetsFilter_BiosROMs: TAdvOfficeCheckBoxEx
      Left = 561
      Top = 51
      Width = 80
      Height = 20
      Hint = 'Show/hide sets that have bios ROMs'
      Checked = True
      TabOrder = 4
      OnClick = SetsFilter_CHDsClick
      Alignment = taLeftJustify
      Caption = 'Bios ROMs'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
  end
  object ButtonToggleTree: TBitBtnEx
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
end
