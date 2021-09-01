object FormArcadeScanGamesResults4K: TFormArcadeScanGamesResults4K
  Left = 1205
  Top = 534
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Games with Missing ROMs/CHDs (4K)'
  ClientHeight = 991
  ClientWidth = 1938
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 30
  object ROMsListView: TEasyListview
    Tag = 1
    Left = 0
    Top = 150
    Width = 1938
    Height = 841
    Align = alClient
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 36
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -24
    GroupFont.Name = 'Verdana'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000000BC020000FFFFFF1F0001000000
      010000000A0000002000200020002000200020004E0061006D00650000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010100000000000078000000FFFFFF1F0001000000
      0100000005000000430052004300330032000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      000102000000000000F8010000FFFFFF1F000100000001000000050000005300
      480041002D003100000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE00060000008008000101000103000000000000B4
      000000FFFFFF1F00010000000100000004000000530069007A00650000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000104000000000000FA000000FFFFFF1F0001000000
      0100000006000000440065007600690063006500000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
      0101000105000000000000B4000000FFFFFF1F00010000000100000006000000
      530074006100740075007300000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -21
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_StandardIconsSmall
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
  end
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 1938
    Height = 150
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 144
      Top = 4
      Width = 962
      Height = 30
      Caption = 
        'Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
        '2)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
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
      Left = 144
      Top = 50
      Width = 816
      Height = 24
      Caption = 
        'Games List: Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP' +
        ' (Jul 24 2012)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
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
      Left = 144
      Top = 99
      Width = 138
      Height = 31
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
      Left = 533
      Top = 98
      Width = 32
      Height = 32
    end
    object LabelSearchBar: TShadowLabel
      Left = 1503
      Top = 99
      Width = 125
      Height = 31
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
      Left = 1655
      Top = 10
      Width = 280
      Height = 38
      Align = alNone
      ButtonHeight = 38
      ButtonWidth = 39
      Color = 15856113
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = FormMain.IL_StandardIconsLarge
      ParentColor = False
      TabOrder = 0
      Transparent = False
      object sysMAME: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 1
        Style = tbsCheck
      end
      object sysSupermodelSEGAModel3: TToolButton
        Left = 39
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 2
        Style = tbsCheck
      end
      object sysDemul: TToolButton
        Left = 78
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 4
        Style = tbsCheck
      end
      object sysHBMAME: TToolButton
        Left = 117
        Top = 0
        Enabled = False
        Grouped = True
        ImageIndex = 5
        Style = tbsCheck
      end
      object sysDICE: TToolButton
        Left = 156
        Top = 0
        Enabled = False
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
      end
      object sysSEGAModel2: TToolButton
        Left = 195
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 7
        Style = tbsCheck
      end
      object sysZiNc: TToolButton
        Left = 234
        Top = 0
        AutoSize = True
        Enabled = False
        Grouped = True
        ImageIndex = 8
        Style = tbsCheck
      end
    end
    object MAMEMachinesFilter: TComboBox2Ex
      Left = 575
      Top = 97
      Width = 215
      Height = 36
      Hint = 'MAME games filter'
      Style = csOwnerDrawFixed
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 2
      ParentFont = False
      TabOrder = 1
      Text = 'Software List Games'
      Items.Strings = (
        'List All'
        'Arcade Games'
        'Software List Games')
    end
    object SearchBarEdit: TEditEx
      Left = 1635
      Top = 97
      Width = 250
      Height = 36
      Hint = 'Enter a game title or game name'
      AutoSize = False
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object SearchBarToolBar: TToolBar
      Left = 1889
      Top = 96
      Width = 45
      Height = 38
      Align = alNone
      ButtonHeight = 38
      ButtonWidth = 39
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
      Images = FormMain.IL_Misc_Large
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Transparent = False
      Wrapable = False
      object ButtonFilterTitleApply_ToolBar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Click here to search'
        AutoSize = True
        Caption = 'Apply'
        ImageIndex = 6
      end
    end
    object SetsFilter_CHDs: TAdvOfficeCheckBoxEx
      Left = 810
      Top = 97
      Width = 135
      Height = 36
      Hint = 'Show/hide sets with CHDs'
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'CHDs Only'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object SetsFilter_DeviceROMs: TAdvOfficeCheckBoxEx
      Left = 954
      Top = 97
      Width = 157
      Height = 36
      Hint = 'Show/hide sets that have device ROMs'
      Checked = True
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Device ROMs'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object SetsFilter_BiosROMs: TAdvOfficeCheckBoxEx
      Left = 1121
      Top = 97
      Width = 132
      Height = 36
      Hint = 'Show/hide sets that have bios ROMs'
      Checked = True
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Bios ROMs'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
  end
  object ButtonToggleTree: TBitBtnEx
    Left = 0
    Top = 151
    Width = 37
    Height = 37
    Hint = 'Toggle tree nodes open/close'
    Caption = '[]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
