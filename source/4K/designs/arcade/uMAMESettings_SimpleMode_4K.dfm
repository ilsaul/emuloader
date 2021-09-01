object FormMAMESettings_SimpleMode4K: TFormMAMESettings_SimpleMode4K
  Left = 729
  Top = 437
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (Basic Mode) - 4K'
  ClientHeight = 1123
  ClientWidth = 2271
  Color = clMoneyGreen
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
  object ButtonPageVideo1: TSpeedButtonEx
    Tag = 2
    Left = 890
    Top = 160
    Width = 215
    Height = 36
    GroupIndex = 1
    Caption = 'Video / Audio / Input'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageFolders: TSpeedButtonEx
    Tag = 1
    Left = 798
    Top = 160
    Width = 90
    Height = 36
    GroupIndex = 1
    Down = True
    Caption = 'Folders'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object Panel1_Folders: TPanelEx
    Left = 0
    Top = 201
    Width = 1121
    Height = 833
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SampleBox: TPanelEx
      Left = 16
      Top = 16
      Width = 1089
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
      object SampleBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 1087
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Path to ROM Sets and CHD Files'
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
      object FolderROMs: TEasyListview
        Tag = 1
        Left = 10
        Top = 45
        Width = 982
        Height = 272
        Hint = 'Path To ROM Sets And Hard Disk Images'
        BackGround.Enabled = True
        CellSizes.Report.Height = 32
        Color = clWhite
        Ctl3D = True
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
        GroupFont.Color = clBlack
        GroupFont.Height = -12
        GroupFont.Name = 'Segoe UI'
        GroupFont.Style = []
        Groups.Items = {
          060000000100000010000000544561737947726F757053746F726564FFFECE00
          06000000810806000000090000000F00000054456173794974656D53746F7265
          64FFFECE00060000008008010000000300000066006400730000000000000000
          000000000000000000000000000F00000054456173794974656D53746F726564
          FFFECE00060000008008010000000F0000006400660061007300640066007300
          6400200066002000730061006600640000000000000000000000000000000000
          000000000F00000054456173794974656D53746F726564FFFECE000600000080
          08010000000C0000006600640061007300200064006600200061007300640066
          0000000000000000000000000000000000000000000F00000054456173794974
          656D53746F726564FFFECE000600000080080100000042000000440069007300
          610062006C00650020002200460075006C006C0052006F007700530065006C00
          65006300740022002000730065007400740069006E006700200074006F002000
          660069007800200065006E00640020006F006600200074006800650020007300
          65006C0065006300740069006F006E0020006200610072002E002E002E000000
          0000000000000000000000000000000000000F00000054456173794974656D53
          746F726564FFFECE00060000008008010000001F00000066006400730020006A
          006B0073006A00640066006B006C006A007300200061006C006B0064006A0066
          006C00730064006A00E700E700E70020002000E7000000000000000000000000
          0000000000000000000F00000054456173794974656D53746F726564FFFECE00
          06000000800801000000150000006300780078006A00200063006B006C00E700
          E700E70064002000E70061007300E700640061007300E7000000000000000000
          0000000000000000000000000F00000054456173794974656D53746F726564FF
          FECE00060000008008010000000D00000044003A005C0065006D0075006C0061
          0074006F00720073005C0000000000000000000000000000000000000000000F
          00000054456173794974656D53746F726564FFFECE0006000000800801000000
          0E00000066006400670066006400670066006A006600640073006B0067006C00
          00000000000000000000000000000000000000000F0000005445617379497465
          6D53746F726564FFFECE00060000008008010000000A00000067007300640066
          006700660064006A0067006B0000000000000000000000000000000000000000
          0000000000000000000000000000000000}
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000001BF030000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Font.Charset = ANSI_CHARSET
        Header.Font.Color = clBlack
        Header.Font.Height = -12
        Header.Font.Name = 'Segoe UI'
        Header.Font.Style = []
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        PaintInfoItem.ReportViewTextTopBorderIndent = -1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
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
        Left = 1002
        Top = 45
        Width = 75
        Height = 36
        Hint = 'Move selected folder up'
        Caption = 'Up'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        CaptionVertIndent = -1
      end
      object FolderROMsButtonDown: TBitBtnEx
        Left = 1002
        Top = 86
        Width = 75
        Height = 36
        Hint = 'Move selected folder down'
        Caption = 'Down'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        CaptionVertIndent = -1
      end
      object FolderROMsButtonSelect: TBitBtnEx
        Left = 1002
        Top = 155
        Width = 75
        Height = 36
        Hint = 'Click here to select folders'
        Caption = 'Add'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CaptionVertIndent = -1
      end
      object FolderROMsButtonEdit: TBitBtnEx
        Left = 1002
        Top = 197
        Width = 75
        Height = 36
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
      end
      object FolderROMsButtonDelete: TBitBtnEx
        Left = 1002
        Top = 239
        Width = 75
        Height = 36
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
      end
      object FolderROMsButtonClear: TBitBtnEx
        Left = 1002
        Top = 281
        Width = 75
        Height = 36
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
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
    end
    object PanelEx19: TPanelEx
      Left = 16
      Top = 370
      Width = 532
      Height = 211
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
      object ShadowLabel20: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Path to Ini Files'
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
      object EasyListview1: TEasyListview
        Tag = 1
        Left = 10
        Top = 45
        Width = 510
        Height = 108
        Hint = 'Path To ROM Sets And Hard Disk Images'
        BackGround.Enabled = True
        CellSizes.Report.Height = 32
        Color = clWhite
        Ctl3D = True
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
        GroupFont.Color = clBlack
        GroupFont.Height = -12
        GroupFont.Name = 'Segoe UI'
        GroupFont.Style = []
        Groups.Items = {
          060000000100000010000000544561737947726F757053746F726564FFFECE00
          06000000810806000000030000000F00000054456173794974656D53746F7265
          64FFFECE00060000008008010000000300000066006400730000000000000000
          000000000000000000000000000F00000054456173794974656D53746F726564
          FFFECE00060000008008010000000F0000006400660061007300640066007300
          6400200066002000730061006600640000000000000000000000000000000000
          000000000F00000054456173794974656D53746F726564FFFECE000600000080
          08010000001A00000063003A005C006300780078006A00200063006B006C00E7
          00E700E70064002000E70061007300E700640061007300E7002000C100000000
          0000000000000000000000000000000000000000000000000000000000000000
          00}
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000001FA010000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Font.Charset = ANSI_CHARSET
        Header.Font.Color = clBlack
        Header.Font.Height = -12
        Header.Font.Name = 'Segoe UI'
        Header.Font.Style = []
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        PaintInfoItem.ReportViewTextTopBorderIndent = -1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
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
      object FolderIniFilesButtonUp: TBitBtnEx
        Tag = 1
        Left = 10
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Move selected folder up'
        Caption = 'Up'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        CaptionVertIndent = -1
      end
      object FolderIniFilesButtonDown: TBitBtnEx
        Left = 90
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Move selected folder down'
        Caption = 'Down'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        CaptionVertIndent = -1
      end
      object FolderIniFilesButtonSelect: TBitBtnEx
        Left = 205
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to select folders'
        Caption = 'Add'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CaptionVertIndent = -1
      end
      object FolderIniFilesButtonEdit: TBitBtnEx
        Left = 285
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
      end
      object FolderIniFilesButtonDelete: TBitBtnEx
        Left = 365
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
      end
      object FolderIniFilesButtonClear: TBitBtnEx
        Left = 445
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
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
    end
    object PanelEx21: TPanelEx
      Left = 16
      Top = 606
      Width = 532
      Height = 211
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
      object ShadowLabel22: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Path to Artwork Files / Effect Overlay Files'
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
      object EasyListview2: TEasyListview
        Tag = 1
        Left = 10
        Top = 45
        Width = 510
        Height = 108
        Hint = 'Path To ROM Sets And Hard Disk Images'
        BackGround.Enabled = True
        CellSizes.Report.Height = 32
        Color = clWhite
        Ctl3D = True
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
        GroupFont.Color = clBlack
        GroupFont.Height = -12
        GroupFont.Name = 'Segoe UI'
        GroupFont.Style = []
        Groups.Items = {
          060000000100000010000000544561737947726F757053746F726564FFFECE00
          06000000810806000000030000000F00000054456173794974656D53746F7265
          64FFFECE00060000008008010000000300000066006400730000000000000000
          000000000000000000000000000F00000054456173794974656D53746F726564
          FFFECE00060000008008010000000F0000006400660061007300640066007300
          6400200066002000730061006600640000000000000000000000000000000000
          000000000F00000054456173794974656D53746F726564FFFECE000600000080
          08010000001A00000063003A005C006300780078006A00200063006B006C00E7
          00E700E70064002000E70061007300E700640061007300E7002000C100000000
          0000000000000000000000000000000000000000000000000000000000000000
          00}
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000001FA010000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Font.Charset = ANSI_CHARSET
        Header.Font.Color = clBlack
        Header.Font.Height = -12
        Header.Font.Name = 'Segoe UI'
        Header.Font.Style = []
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        PaintInfoItem.ReportViewTextTopBorderIndent = -1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
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
      object BitBtnEx17: TBitBtnEx
        Tag = 1
        Left = 10
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Move selected folder up'
        Caption = 'Up'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        CaptionVertIndent = -1
      end
      object BitBtnEx18: TBitBtnEx
        Left = 90
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Move selected folder down'
        Caption = 'Down'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        CaptionVertIndent = -1
      end
      object BitBtnEx19: TBitBtnEx
        Left = 205
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to select folders'
        Caption = 'Add'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CaptionVertIndent = -1
      end
      object BitBtnEx20: TBitBtnEx
        Left = 285
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        CaptionVertIndent = -1
      end
      object BitBtnEx21: TBitBtnEx
        Left = 365
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        CaptionVertIndent = -1
      end
      object BitBtnEx22: TBitBtnEx
        Left = 445
        Top = 163
        Width = 75
        Height = 36
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
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
    end
    object PanelEx14: TPanelEx
      Left = 573
      Top = 724
      Width = 532
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
      object ShadowLabel15: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Input Device Logs'
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
      object EditEx13: TEditEx
        Left = 10
        Top = 45
        Width = 430
        Height = 36
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object BitBtnEx13: TBitBtnEx
        Left = 445
        Top = 45
        Width = 75
        Height = 36
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CaptionVertIndent = -1
      end
    end
    object PanelEx15: TPanelEx
      Left = 573
      Top = 606
      Width = 532
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
      object ShadowLabel16: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save NVRAM Contents'
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
      object EditEx14: TEditEx
        Left = 10
        Top = 45
        Width = 430
        Height = 36
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object BitBtnEx14: TBitBtnEx
        Left = 445
        Top = 45
        Width = 75
        Height = 36
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CaptionVertIndent = -1
      end
    end
    object PanelEx16: TPanelEx
      Left = 573
      Top = 488
      Width = 532
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
      object ShadowLabel17: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Path to Sample Sets'
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
      object EditEx15: TEditEx
        Left = 10
        Top = 45
        Width = 430
        Height = 36
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object BitBtnEx15: TBitBtnEx
        Left = 445
        Top = 45
        Width = 75
        Height = 36
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CaptionVertIndent = -1
      end
    end
    object PanelEx17: TPanelEx
      Left = 573
      Top = 370
      Width = 532
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
      object ShadowLabel18: TShadowLabel
        Left = 0
        Top = 0
        Width = 530
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Screenshots'
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
      object EditEx16: TEditEx
        Left = 10
        Top = 45
        Width = 430
        Height = 36
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Text = 'fds   D:\emulators\'
      end
      object BitBtnEx16: TBitBtnEx
        Left = 445
        Top = 45
        Width = 75
        Height = 36
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CaptionVertIndent = -1
      end
    end
  end
  object Panel2_VideoAudioInput: TPanelEx
    Left = 1136
    Top = 201
    Width = 1121
    Height = 833
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object Mouse: TAdvOfficeCheckBoxEx
      Left = 16
      Top = 395
      Width = 165
      Height = 36
      Hint = 'Enable mouse input'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Mouse'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Joystick: TAdvOfficeCheckBoxEx
      Left = 16
      Top = 441
      Width = 175
      Height = 36
      Hint = 'Enable joystick input'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Joystick'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SkipGameInfo: TAdvOfficeCheckBoxEx
      Left = 684
      Top = 247
      Width = 175
      Height = 36
      Hint = 'Skip displaying the information screen at startup'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Skip Game Info'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Cheat: TAdvOfficeCheckBoxEx
      Left = 684
      Top = 293
      Width = 180
      Height = 36
      Hint = 'Enable cheat subsystem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Cheats Enabled'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ReadConfigFiles: TAdvOfficeCheckBoxEx
      Left = 684
      Top = 201
      Width = 195
      Height = 36
      Hint = 'Enable loading of configuration files'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Read Config Files'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AudioGroupBox: TPanelEx
      Left = 796
      Top = 407
      Width = 309
      Height = 256
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
      object SampleRateLabel: TShadowLabel
        Left = 10
        Top = 172
        Width = 117
        Height = 31
        Caption = 'Sample Rate'
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
      object VolumeLabel: TShadowLabel
        Left = 10
        Top = 91
        Width = 124
        Height = 31
        Hint = 'Volume [%ddB]'
        Caption = 'Volume [0dB]'
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
      object Samples: TAdvOfficeCheckBoxEx
        Left = 146
        Top = 44
        Width = 150
        Height = 36
        Hint = 'Enable the use of external samples if available'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Use Samples'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SampleRate: TComboBox2Ex
        Left = 10
        Top = 208
        Width = 287
        Height = 36
        Hint = 'Set sound output sample rate'
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
        TabOrder = 1
        Text = '48000 Hz'
        Items.Strings = (
          '11025 Hz'
          '22050 Hz'
          '44100 Hz'
          '48000 Hz'
          '96000 Hz'
          '192000 Hz')
      end
      object Volume: TGaugeBar
        Left = 10
        Top = 127
        Width = 287
        Height = 36
        Hint = 'Sound volume attenuation in decibels (-32 -> low, 0 -> normal)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 30
        LargeChange = 5
        Max = 0
        Min = -32
        ShowHandleGrip = True
        Position = 0
      end
      object EnableSound: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 44
        Width = 95
        Height = 36
        Hint = 'Enable sound output'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Sound'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PerformanceGroupBox: TPanelEx
      Left = 350
      Top = 16
      Width = 309
      Height = 215
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
      object PerformanceGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 307
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Performance'
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
      object FrameskipLabel: TShadowLabel
        Left = 10
        Top = 91
        Width = 197
        Height = 31
        Caption = 'Frameskip 0 (Default)'
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
      object AutoFrameskip: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 44
        Width = 175
        Height = 36
        Hint = 'Enable automatic frameskip selection'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Auto Frameskip'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SyncronizeRefreshRate: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 173
        Width = 200
        Height = 36
        Hint = 
          'Enables speed throttling only to the refresh of your monitor'#13#10'Th' +
          'is means that the game'#39's actual refresh rate is ignored'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Sync Refresh Rate'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Throttle: TAdvOfficeCheckBoxEx
        Left = 201
        Top = 44
        Width = 104
        Height = 36
        Hint = 'Enable throttling to keep game running in sync with real time'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Throttle'
        ReturnIsTab = False
        State = cbChecked
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Frameskip: TGaugeBar
        Left = 10
        Top = 127
        Width = 287
        Height = 36
        Hint = 'Set frameskip to fixed value (autoframeskip must be disabled)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 30
        Max = 12
        ShowHandleGrip = True
        Position = 0
      end
    end
    object FullScreenGroupBox: TPanelEx
      Left = 684
      Top = 16
      Width = 309
      Height = 133
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
      object FullScreenGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 307
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Full Screen'
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
      object TripleBuffer: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 44
        Width = 145
        Height = 36
        Hint = 'Enable triple buffering (override v-sync)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Triple Buffer'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SwitchResolution: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 91
        Width = 200
        Height = 36
        Hint = 'Enable resolution switching (for old systems and CRT monitors)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Switch Resolution'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PanelEx23: TPanelEx
      Left = 16
      Top = 688
      Width = 1089
      Height = 129
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
      object ShadowLabel24: TShadowLabel
        Left = 0
        Top = 0
        Width = 1087
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Vector'
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
      object ShadowLabel1: TShadowLabel
        Left = 10
        Top = 45
        Width = 171
        Height = 31
        Hint = 'Flicker Effect [%3.2f]'
        Caption = 'Beam Width [1.00]'
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
      object VectorBeamWidthMaxLabel: TShadowLabel
        Left = 556
        Top = 45
        Width = 174
        Height = 31
        Hint = 'Beam Max Width [%2.2f]'
        Caption = 'Flicker Effect [0.00]'
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
      object GaugeBar21: TGaugeBar2
        Left = 10
        Top = 81
        Width = 521
        Height = 36
        Hint = 'Set vector flicker effect'
        Backgnd = bgPattern
        ButtonSize = 30
        LargeChange = 10.000000000000000000
        Max = 100.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.500000000000000000
      end
      object VectorBeamWidthMax: TGaugeBar2
        Left = 556
        Top = 81
        Width = 521
        Height = 36
        Hint = 'Set maximum vector beam width'
        Backgnd = bgPattern
        ButtonSize = 30
        LargeChange = 0.100000001490116100
        Max = 10.000000000000000000
        Min = 0.009999999776482582
        ShowHandleGrip = True
        SmallChange = 0.009999999776482582
        Position = 1.000000000000000000
      end
      object AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx
        Left = 290
        Top = -1
        Width = 115
        Height = 36
        Hint = 'Use antialiasing when drawing vectors'
        Checked = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Antialias'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PanelEx25: TPanelEx
      Left = 350
      Top = 256
      Width = 309
      Height = 180
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
      object ShadowLabel26: TShadowLabel
        Left = 0
        Top = 0
        Width = 307
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Screen Rotation'
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
      object AdvOfficeCheckBoxEx2: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 91
        Width = 165
        Height = 36
        Hint = 'Flip screen left-right'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Flip Left-Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx3: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 138
        Width = 200
        Height = 36
        Hint = 'Flip screen upside-down'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Flip Upside-Down'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx4: TAdvOfficeCheckBoxEx
        Left = 175
        Top = 44
        Width = 85
        Height = 36
        Hint = 'Rotate screen clockwise 90 degrees'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx5: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 44
        Width = 70
        Height = 36
        Hint = 'Rotate screen counterclockwise 90 degrees'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Left'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PanelEx22: TPanelEx
      Left = 16
      Top = 16
      Width = 309
      Height = 362
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
      object ShadowLabel23: TShadowLabel
        Left = 0
        Top = 0
        Width = 307
        Height = 35
        Align = alTop
        AutoSize = False
        Caption = 'Video Options'
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
      object ShadowLabel2: TShadowLabel
        Left = 10
        Top = 279
        Width = 98
        Height = 31
        Hint = 'Preferred resolution of'
        Caption = 'Resolution'
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
        Transparent = True
      end
      object ScreenRefreshRate_CustomLabel: TShadowLabel
        Left = 180
        Top = 277
        Width = 26
        Height = 31
        Caption = 'Hz'
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
      object AdvOfficeCheckBoxEx6: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 44
        Width = 287
        Height = 36
        Hint = 'Run games in a window instead of full screen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Window Mode'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx7: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 91
        Width = 240
        Height = 36
        Hint = 'Start emulation with window maximized (window mode only)'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Maximize Window'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx8: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 138
        Width = 205
        Height = 36
        Hint = 'Maintain aspect ratio when scaling to fill output screen/window'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Keep Aspect Ratio'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AdvOfficeCheckBoxEx9: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 232
        Width = 200
        Height = 36
        Hint = 'Enables v-sync to reduce tearing'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Wait Vertical Sync'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object BilinearFilter: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 185
        Width = 227
        Height = 36
        Hint = 'Enable bilinear filtering on screen output'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hardware Stretch'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ComboBox2Ex1: TComboBox2Ex
        Left = 10
        Top = 315
        Width = 145
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
        TabOrder = 5
        Text = '3840x2160'
        Items.Strings = (
          'Auto'
          '3840x2160'
          '320x200'
          '320x240'
          '400x300'
          '480x360'
          '512x384'
          '640x400'
          '640x480'
          '720x480'
          '720x576'
          '800x600'
          '848x480'
          '960x600'
          '1024x768'
          '1088x612'
          '1152x864'
          '1280x720'
          '1280x768'
          '1280x800'
          '1280x960'
          '1280x1024'
          '1360x768'
          '1440s900'
          '1600x900'
          '1600x1024'
          '1600x1200'
          '1680x1050'
          '1920x1080'
          '1920x1200'
          '1920x1440'
          '2048x1536')
        CaptionVertIndent = -1
      end
      object ComboBox2Ex2: TComboBox2Ex
        Left = 180
        Top = 315
        Width = 117
        Height = 36
        Hint = 'Screen refresh rate'
        Style = csOwnerDrawFixed
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 15
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = '240'
        Items.Strings = (
          'Auto'
          '50'
          '59'
          '60'
          '70'
          '72'
          '75'
          '85'
          '100'
          '120'
          '140'
          '144'
          '150'
          '170'
          '200'
          '240')
        CaptionVertIndent = -1
      end
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 2271
    Height = 150
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object LabelGameTitle: TShadowLabel
      Left = 150
      Top = 10
      Width = 960
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 205
      Top = 90
      Width = 700
      Height = 47
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      Left = 10
      Top = 10
      Width = 128
      Height = 128
      Transparent = True
    end
    object GameIcon: TImage
      Left = 149
      Top = 90
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 910
      Top = 87
      Width = 206
      Height = 51
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
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
  object PanelBottom: TPanelEx
    Tag = 1
    Left = 0
    Top = 1034
    Width = 1121
    Height = 71
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ButtonReadFile: TBitBtnEx
      Left = 16
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Reload configuration files'
      Caption = 'Reload Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object ButtonOk: TBitBtnEx
      Left = 839
      Top = 16
      Width = 128
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
      TabOrder = 1
      CaptionVertIndent = -1
    end
    object ButtonCancel: TBitBtnEx
      Left = 977
      Top = 16
      Width = 128
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
      TabOrder = 2
      CaptionVertIndent = -1
    end
    object ButtonResetToDefault: TBitBtnEx
      Left = 194
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Load only emulator default settings'
      Caption = 'Reset to Default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      CaptionVertIndent = -1
    end
    object ButtonReadFileHelp: TBitBtnEx
      Left = 372
      Top = 16
      Width = 45
      Height = 45
      Hint = 'Why two reload buttons ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx
      Left = 437
      Top = 21
      Width = 35
      Height = 35
      Hint = 'What is this settings for ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx
      Left = 478
      Top = 20
      Width = 355
      Height = 36
      Hint = 
        'Check settings from all custom files to avoid duplicates and kee' +
        'p files clean'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Validate All Custom Files on Save'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowColor = clSkyBlue
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
end
