object FormMAMESettings4K: TFormMAMESettings4K
  Left = 861
  Top = 245
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (4K)'
  ClientHeight = 1597
  ClientWidth = 1677
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 30
  object ButtonPageFolders: TSpeedButtonEx
    Left = 930
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
  object ButtonPageVideo1: TSpeedButtonEx
    Tag = 1
    Left = 1022
    Top = 160
    Width = 90
    Height = 36
    GroupIndex = 1
    Caption = 'Video'
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
  object ButtonPageVideo2: TSpeedButtonEx
    Tag = 2
    Left = 16
    Top = 160
    Width = 225
    Height = 36
    GroupIndex = 1
    Caption = 'Video 2 (page is empty)'
    Enabled = False
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
  object ButtonPageVideo3: TSpeedButtonEx
    Tag = 3
    Left = 1114
    Top = 160
    Width = 90
    Height = 36
    GroupIndex = 1
    Caption = 'Video 3'
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
  object ButtonPageLUAandAudio: TSpeedButtonEx
    Tag = 4
    Left = 1206
    Top = 160
    Width = 160
    Height = 36
    GroupIndex = 1
    Caption = 'LUA and Audio'
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
  object ButtonPageInput: TSpeedButtonEx
    Tag = 5
    Left = 1368
    Top = 160
    Width = 75
    Height = 36
    GroupIndex = 1
    Caption = 'Input'
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
  object ButtonPageMisc: TSpeedButtonEx
    Tag = 6
    Left = 1445
    Top = 160
    Width = 155
    Height = 36
    GroupIndex = 1
    Caption = 'Miscellaneous'
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
  object ButtonPageSDLMAMEInput: TSpeedButtonEx
    Tag = 6
    Left = 1602
    Top = 160
    Width = 70
    Height = 36
    GroupIndex = 1
    Caption = 'SDL'
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
  object NotebookPages: TNotebook
    Left = 0
    Top = 201
    Width = 1677
    Height = 1187
    Color = 15856113
    PageIndex = 4
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Folders'
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
          Width = 987
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
            00060000008008000101000100000000000001C4030000FFFFFF1F0001000000
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
      object PanelEx1: TPanelEx
        Left = 1129
        Top = 1078
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
        object ShadowLabel2: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory to Save Debugger Comments'
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
        object FolderDebuggerComments: TEditEx
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
        object FolderDebuggerCommentsButtonSelect: TBitBtnEx
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
      object PanelEx2: TPanelEx
        Left = 16
        Top = 1078
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
        object ShadowLabel3: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory to Save CHD Difference Files'
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
        object EditEx1: TEditEx
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
        object BitBtnEx1: TBitBtnEx
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
        end
      end
      object PanelEx3: TPanelEx
        Left = 1129
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
        object ShadowLabel4: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to UI Translation Files'
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
        object EditEx2: TEditEx
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
        object BitBtnEx2: TBitBtnEx
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
        end
      end
      object PanelEx4: TPanelEx
        Left = 573
        Top = 1078
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
        object ShadowLabel5: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Cheat Files'
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
        object EditEx3: TEditEx
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
        object BitBtnEx3: TBitBtnEx
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
        end
      end
      object PanelEx5: TPanelEx
        Left = 1129
        Top = 842
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
        object ShadowLabel6: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory to Save Memory Card Contents'
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
        object EditEx4: TEditEx
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
        object BitBtnEx4: TBitBtnEx
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
        end
      end
      object PanelEx6: TPanelEx
        Left = 1129
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
        object ShadowLabel7: TShadowLabel
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
        object EditEx5: TEditEx
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
        object BitBtnEx5: TBitBtnEx
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
        end
      end
      object PanelEx7: TPanelEx
        Left = 1129
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
        object ShadowLabel8: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Font Files !mulitple paths'
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
        object EditEx6: TEditEx
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
        object BitBtnEx6: TBitBtnEx
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
        end
      end
      object PanelEx8: TPanelEx
        Left = 1129
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
        object ShadowLabel9: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Crosshair Files'
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
        object EditEx7: TEditEx
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
        object BitBtnEx7: TBitBtnEx
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
        end
      end
      object PanelEx9: TPanelEx
        Left = 1129
        Top = 960
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
        object ShadowLabel10: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory to Game Manual Files (PDF)'
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
        object EditEx8: TEditEx
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
        object BitBtnEx8: TBitBtnEx
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
      object PanelEx10: TPanelEx
        Left = 16
        Top = 960
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
        object ShadowLabel11: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Software Definition Files (Hash) -!multiple paths'
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
        object EditEx9: TEditEx
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
        object BitBtnEx9: TBitBtnEx
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
      object PanelEx11: TPanelEx
        Left = 16
        Top = 842
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
        object ShadowLabel12: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Audio Sample Sets -!multiple paths'
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
        object EditEx10: TEditEx
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
        object BitBtnEx10: TBitBtnEx
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
      object PanelEx12: TPanelEx
        Left = 573
        Top = 960
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
        object ShadowLabel13: TShadowLabel
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
        object EditEx11: TEditEx
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
        object BitBtnEx11: TBitBtnEx
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
      object PanelEx13: TPanelEx
        Left = 573
        Top = 842
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
        object ShadowLabel14: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory to Save Configurations'
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
        object EditEx12: TEditEx
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
        object BitBtnEx12: TBitBtnEx
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
          Caption = 'Directory to Save States'
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
          Caption = 'Path For LUA Plugins To Store Data (Read/Write)'
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
          Caption = 'Path to LUA Plugin Files'
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
      object PanelEx62: TPanelEx
        Left = 1129
        Top = 16
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
        object ShadowLabel141: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Directory To Share With Emulated Machines'
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
        object EditEx56: TEditEx
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
        object BitBtnEx68: TBitBtnEx
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
        end
      end
      object PanelEx63: TPanelEx
        Left = 1129
        Top = 252
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
        object ShadowLabel145: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path to Controller Definitions !-multiple paths'
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
        object EditEx93: TEditEx
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
        object BitBtnEx69: TBitBtnEx
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
        end
      end
      object PanelEx69: TPanelEx
        Left = 1129
        Top = 134
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
        object ShadowLabel146: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Path To Loose Software (Not Listed In Software Lists)'
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
        object EditEx94: TEditEx
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
        object BitBtnEx70: TBitBtnEx
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
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video'
      object PanelEx30: TPanelEx
        Left = 1352
        Top = 16
        Width = 309
        Height = 371
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
        object ShadowLabel31: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Screens'
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
        object ScreenNameLabel: TShadowLabel
          Left = 10
          Top = 123
          Width = 57
          Height = 31
          Hint = 'Explicit name of'
          Caption = 'Name'
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
        object ScreenAspectRatioLabel: TShadowLabel
          Left = 180
          Top = 205
          Width = 118
          Height = 31
          Hint = 'Aspect ratio of'
          Caption = 'Aspect Ratio'
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
        object ScreenResolutionLabel: TShadowLabel
          Left = 10
          Top = 287
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
          Top = 287
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
        object ScreenViewLabel: TShadowLabel
          Left = 9
          Top = 205
          Width = 45
          Height = 31
          Hint = 'Preferred view for'
          Caption = 'View'
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
        object NumberScreensLabel: TShadowLabel
          Left = 11
          Top = 82
          Width = 85
          Height = 25
          Caption = '1 2 3 4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ScreenName: TComboBox2Ex
          Left = 10
          Top = 159
          Width = 287
          Height = 36
          Style = csOwnerDrawFixed
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 2
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '\\.\DISPLAY2'
          Items.Strings = (
            'Auto'
            '\\.\DISPLAY1'
            '\\.\DISPLAY2'
            '\\.\DISPLAY3'
            '\\.\DISPLAY4'
            '\\.\DISPLAY5'
            '\\.\DISPLAY6'
            '\\.\DISPLAY7'
            '\\.\DISPLAY8')
          CaptionVertIndent = -1
        end
        object ScreenAspectRatio: TComboBox2Ex
          Left = 180
          Top = 241
          Width = 117
          Height = 36
          Style = csOwnerDrawFixed
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 3
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '16:10'
          Items.Strings = (
            'Auto'
            '16:9'
            '4:3'
            '16:10'
            '3:2'
            '3:4'
            '5:2'
            '5:3')
          CaptionVertIndent = -1
        end
        object ScreenResolution: TComboBox2Ex
          Left = 10
          Top = 323
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
          TabOrder = 2
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
        object ScreenRefreshRate: TComboBox2Ex
          Left = 180
          Top = 323
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
          TabOrder = 3
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
        object ScreenView: TComboBox2Ex
          Left = 10
          Top = 241
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
          ItemIndex = 3
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'Pixel Aspect'
          Items.Strings = (
            'Auto'
            'Standard'
            'Native'
            'Pixel Aspect'
            'Cocktail'
            'Cropped'
            'Stretched')
          CaptionVertIndent = -1
        end
        object ScreensSelector: TComboBox2Ex
          Tag = -1
          Left = 161
          Top = 45
          Width = 136
          Height = 36
          Hint = 'Select the screen you want to configure'
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
          TabOrder = 5
          Text = 'All Screens'
          Items.Strings = (
            'All Screens'
            'Screen 1'
            'Screen 2'
            'Screen 3'
            'Screen 4')
          CaptionVertIndent = -1
        end
        object ScreenButtonDefaultSettings: TBitBtnEx
          Left = 227
          Top = 86
          Width = 70
          Height = 36
          Hint = 'Set default values for the selected screen'
          Caption = 'Reset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          CaptionVertIndent = -1
        end
        object NumberScreens: TXiTrackBar
          Left = 10
          Top = 45
          Width = 85
          Height = 36
          Hint = 'Number of screens to create (usually you want just one)'
          BackColor = 15856113
          TickColor = 7500402
          DisabledTickColor = clSilver
          SlideBorderColor = 7500402
          SlideFaceColor = clWhite
          SlideGradColor = 15395562
          DisabledSlideBorderColor = 12500670
          DisabledSlideFaceColor = 14211288
          DisabledSlideGradColor = 15263976
          DisabledThumbBorderColor = 11908533
          DisabledThumbFaceColor = 15395562
          DisabledThumbGradColor = 13619151
          ThumbBorderColor = 6381921
          ThumbFaceColor = clWhite
          ThumbGradColor = 14145495
          OverThumbBorderColor = 7631988
          OverThumbFaceColor = 13750737
          OverThumbGradColor = 9803157
          DownThumbBorderColor = 7631988
          DownThumbFaceColor = 10066329
          DownThumbGradColor = 12698049
          SmoothCorners = True
          ColorScheme = csWhite
          Max = 4
          Min = 1
          Position = 1
          TickStyle = tsAuto
          TickMarks = tmBottomRight
          Orientation = trHorizontal
        end
      end
      object PanelEx20: TPanelEx
        Left = 1352
        Top = 427
        Width = 309
        Height = 389
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
        object ShadowLabel21: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Snapshots / Movies'
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
        object SnapshotNameFormatLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 128
          Height = 31
          Caption = 'Name Format'
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
        object SnapshotViewLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 45
          Height = 31
          Caption = 'View'
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
        object SnapSizeCustomXLabel: TShadowLabel
          Left = 191
          Top = 257
          Width = 13
          Height = 31
          Caption = 'X'
          Enabled = False
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
        object SnapSizeCustomLabel: TShadowLabel
          Left = 36
          Top = 257
          Width = 72
          Height = 31
          Caption = 'Custom'
          Enabled = False
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
        object SnapBurnIn: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 347
          Width = 195
          Height = 36
          Hint = 'Create burn-in snapshots for each screen'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Burn-in Snapshot'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object SnapNameButtonDefault: TBitBtnEx
          Left = 227
          Top = 81
          Width = 70
          Height = 36
          Hint = 'Set default snapshot name'
          Caption = 'Reset'
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
        object SnapView: TComboBox2Ex
          Left = 10
          Top = 163
          Width = 212
          Height = 36
          Hint = 
            'Specify snapshot/movie view'#13#10'Select the default '#39'internal'#39' to us' +
            'e internal pixel-aspect views'
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
          TabOrder = 2
          Text = 'Internal'
          Items.Strings = (
            'Internal'
            'Auto'
            'Standard'
            'Native'
            'Pixel Aspect'
            'Cocktail')
        end
        object SnapViewButtonDefault: TBitBtnEx
          Left = 226
          Top = 163
          Width = 70
          Height = 36
          Hint = 'Set default snapshot / movie view'
          Caption = 'Reset'
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
        object SnapSizeAuto: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 209
          Width = 185
          Height = 36
          Hint = 'Set resolution to game'#39's original size (raw pixels)'
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
          Caption = 'Auto Resolution'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object SnapSizeWidth: TEditEx
          Left = 116
          Top = 255
          Width = 70
          Height = 36
          Hint = 'Custom resolution width'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object SnapSizeHeight: TEditEx
          Left = 208
          Top = 255
          Width = 70
          Height = 36
          Hint = 'Custom resolution height'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object SnapName: TEditEx
          Left = 10
          Top = 81
          Width = 212
          Height = 36
          Hint = 
            'Override the default snapshot naming; %g == gamename, %i == inde' +
            'x'
          AutoSize = False
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
        end
        object SnapBilinear: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 301
          Width = 215
          Height = 36
          Hint = 
            'Specify if the snapshot/movie should have bilinear filtering app' +
            'lied'
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
          Caption = 'Apply Bilinear Filter'
          ReturnIsTab = False
          State = cbChecked
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
        Height = 843
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
          Caption = 'Render Options'
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
        object IntegerScaleFactorVerticalLabel: TShadowLabel
          Left = 180
          Top = 508
          Width = 38
          Height = 31
          Caption = 'Vert'
          Enabled = False
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
        object IntegerScaleFactorHorizontalLabel: TShadowLabel
          Left = 36
          Top = 508
          Width = 35
          Height = 31
          Caption = 'Hor'
          Enabled = False
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
        object MonitorProviderLabel: TShadowLabel
          Left = 12
          Top = 599
          Width = 157
          Height = 31
          Caption = 'Monitor Provider'
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
        object AttachWindowLabel: TShadowLabel
          Left = 10
          Top = 684
          Width = 257
          Height = 31
          Caption = 'Attach To Arbitrary Window'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object WindowMode: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
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
        object MaximizeWindow: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 92
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
        object KeepAspectRatio: TAdvOfficeCheckBoxEx
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
        object WaitVerticalSync: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 230
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
          Top = 184
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
          Caption = 'Use Bilinear Filter'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object UnevenStretch: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 276
          Width = 175
          Height = 36
          Hint = 
            'Allow non-integer ratios when scaling to fill output screen/wind' +
            'ow horizontally or vertically'
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Uneven Stretch'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object UnevenStretchX: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 368
          Width = 225
          Height = 36
          Hint = 
            'Allow non-integer ratios when scaling to fill output screen/wind' +
            'ow horizontally'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Uneven Stretch (Hor)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object IntegerScaleFactorHorizontal: TEditEx
          Left = 80
          Top = 506
          Width = 70
          Height = 36
          Hint = 'Set horizontal integer scale factor'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Text = '46042'
        end
        object IntegerScaleFactorVertical: TEditEx
          Left = 227
          Top = 506
          Width = 70
          Height = 36
          Hint = 'Set vertical integer scale factor'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object IntegerScaleOverscan: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 460
          Width = 245
          Height = 36
          Hint = 'Allow overscan on integer scaled targets'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Integer Scale Overscan'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object UnevenStretchY: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 414
          Width = 227
          Height = 36
          Hint = 
            'Allow non-integer ratios when scaling to fill otuput screen/wind' +
            'ow vertially'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Uneven Stretch (Vert)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object AutoUnevenStretchXY: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 322
          Width = 225
          Height = 36
          Hint = 
            'Automatically apply uneven stretch hor/vert based on source nati' +
            've orientation'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Auto Uneven Stretch'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object MonitorProvider: TComboBox2Ex
          Left = 10
          Top = 635
          Width = 287
          Height = 36
          Hint = 'Monitor Discovery Method'
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
          TabOrder = 12
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Win32'
            'DXGI'
            'SDL')
        end
        object EnableMenuBar: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 552
          Width = 195
          Height = 36
          Hint = 'Enables menu bar if available by UI implementation'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Enable Menu Bar'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object AttachWindow: TEditEx
          Left = 10
          Top = 720
          Width = 287
          Height = 38
          Hint = 'Use an existing window as the first emulation window'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
      end
      object PanelEx24: TPanelEx
        Left = 684
        Top = 16
        Width = 309
        Height = 386
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
        object ShadowLabel25: TShadowLabel
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
        object FullScreenBrightnessLabel: TShadowLabel
          Left = 10
          Top = 138
          Width = 255
          Height = 31
          Hint = 'Brightness Correction [%1.2f]'
          AutoSize = False
          Caption = 'Brightness Correction [1.00]'
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
        object FullScreenContrastLabel: TShadowLabel
          Left = 10
          Top = 220
          Width = 237
          Height = 31
          Hint = 'Contrast Correction [%1.2f]'
          AutoSize = False
          Caption = 'Contrast Correction [1.00]'
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
        object FullScreenGammaLabel: TShadowLabel
          Left = 10
          Top = 302
          Width = 231
          Height = 31
          Hint = 'Gamma Correction [%1.2f]'
          AutoSize = False
          Caption = 'Gamma Correction [1.00]'
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
        object TripleBuffer: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
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
          Top = 92
          Width = 195
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
        object FullScreenBrightness: TGaugeBar2
          Left = 10
          Top = 174
          Width = 287
          Height = 36
          Hint = 'Brightness value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
        end
        object FullScreenContrast: TGaugeBar2
          Left = 10
          Top = 256
          Width = 287
          Height = 36
          Hint = 'Contrast value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
        end
        object FullScreenGamma: TGaugeBar2
          Left = 10
          Top = 338
          Width = 287
          Height = 36
          Hint = 'Gamma value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 3.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
        end
      end
      object PanelEx25: TPanelEx
        Left = 350
        Top = 580
        Width = 309
        Height = 279
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
        object FlipX: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 184
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
        object FlipY: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 230
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
        object RotateRight: TAdvOfficeCheckBoxEx
          Left = 171
          Top = 92
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
        object RotateLeft: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 92
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
        object AutoRotateRight: TAdvOfficeCheckBoxEx
          Left = 171
          Top = 138
          Width = 132
          Height = 36
          Hint = 'Automatically rotate screen clockwise 90 degrees if vertical'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Auto Right'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object AutoRotateLeft: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 138
          Width = 132
          Height = 36
          Hint = 
            'Automatically rotate screen counterclockwise 90 degrees if verti' +
            'cal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Auto Left'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object Rotate: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
          Width = 80
          Height = 36
          Hint = 
            'Rotate the game screen according to the game'#39's orientation needs' +
            ' it'
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
          Caption = 'Auto'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object PanelEx26: TPanelEx
        Left = 350
        Top = 16
        Width = 309
        Height = 539
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
        object ShadowLabel27: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Game Screen'
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
        object BrightnessLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 243
          Height = 31
          Hint = 'Brightness Correction [%1.2f]'
          Caption = 'Brightness Correction 0.05'
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
        object Prescale_ScaleScreenLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 218
          Height = 31
          Hint = 'Scale Screen '#39'Prescale'#39' [%ux]'
          Caption = 'Resolution Prescale 10x'
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
        object ContrastLabel: TShadowLabel
          Left = 10
          Top = 208
          Width = 225
          Height = 31
          Hint = 'Contrast Correction [%1.2f]'
          Caption = 'Contrast Correction 1.00'
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
        object GammaLabel: TShadowLabel
          Left = 10
          Top = 291
          Width = 219
          Height = 31
          Hint = 'Gamma Correction [%1.2f]'
          Caption = 'Gamma Correction 1.00'
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
        object PauseBrightnessLabel: TShadowLabel
          Left = 10
          Top = 373
          Width = 201
          Height = 31
          Hint = 'Pause Brightness [%1.2f]'
          Caption = 'Pause Brightness 0.65'
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
        object EffectOverlayLabel: TShadowLabel
          Left = 10
          Top = 455
          Width = 200
          Height = 31
          Caption = 'Visual Effects Overlay'
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
        object Prescale_ScaleScreen: TGaugeBar
          Left = 10
          Top = 81
          Width = 287
          Height = 36
          Hint = 
            'Scale screen resolution rendering (1x for game'#39's original resolu' +
            'tion)'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 30
          Max = 8
          Min = 1
          ShowHandleGrip = True
          Position = 1
        end
        object Brightness: TGaugeBar2
          Left = 10
          Top = 163
          Width = 287
          Height = 36
          Hint = 
            'Default screen brightness correction (does not affect the artwor' +
            'k or other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
        end
        object Contrast: TGaugeBar2
          Left = 10
          Top = 245
          Width = 287
          Height = 36
          Hint = 
            'Default screen contrast correction (does not affect the artwork ' +
            'or other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
        end
        object Gamma: TGaugeBar2
          Left = 10
          Top = 327
          Width = 287
          Height = 36
          Hint = 
            'Default screen gamma correction (does not affect the artwork or ' +
            'other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 3.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
        end
        object PauseBrightness: TGaugeBar2
          Left = 10
          Top = 409
          Width = 287
          Height = 36
          Hint = 'Additional pause brightness'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.500000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.649999976158142100
        end
        object EffectOverlay: TEditEx
          Left = 10
          Top = 491
          Width = 212
          Height = 36
          Hint = 'Name of a PNG file to use for visual effects'
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
          ShowHint = True
          TabOrder = 5
          Text = 'myfilename_r44'
        end
        object EffectOverlayButtonSelect: TBitBtnEx
          Left = 227
          Top = 491
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
      end
      object PanelEx28: TPanelEx
        Left = 1018
        Top = 16
        Width = 309
        Height = 352
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
        object ShadowLabel29: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Artwork'
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
        object FallbackArtworkLabel: TShadowLabel
          Left = 10
          Top = 184
          Width = 152
          Height = 31
          Caption = 'Fallback Artwork'
          Enabled = False
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
        object OverrideArtworkLabel: TShadowLabel
          Left = 10
          Top = 266
          Width = 158
          Height = 31
          Caption = 'Override Artwork'
          Enabled = False
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
        object ArtworkBackdrops: TAdvOfficeCheckBoxEx
          Left = 176
          Top = 92
          Width = 130
          Height = 36
          Hint = 'Enable the display of backdrops'
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Backdrops'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object ArtworkBezels: TAdvOfficeCheckBoxEx
          Left = 213
          Top = 138
          Width = 90
          Height = 36
          Hint = 'Enable the display of bezels'
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Bezels'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object ArtworkOverlays: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 92
          Width = 115
          Height = 36
          Hint = 'Enable the display of overlays'
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
          Caption = 'Overlays'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object ArtworkCrop: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
          Width = 80
          Height = 36
          Hint = 
            'Crop artwork so emulated screen image fills output screen/window' +
            ' in one axis'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Crop'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object ArtworkControlPanels: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 138
          Width = 164
          Height = 36
          Hint = 'Enable the display of control panels'
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Control Panels'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object ArtworkMarquees: TAdvOfficeCheckBoxEx
          Left = 176
          Top = 45
          Width = 125
          Height = 36
          Hint = 'Enable the display of marquees'
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Marquees'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object FallbackArtwork: TEditEx
          Left = 10
          Top = 220
          Width = 287
          Height = 38
          Hint = 
            'Fallback artwork if no external artwork or internal driver layou' +
            't defined'
          Color = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object OverrideArtwork: TEditEx
          Left = 10
          Top = 302
          Width = 287
          Height = 38
          Hint = 'Override artwork for external artwork and internal driver layout'
          Color = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
      object PanelEx23: TPanelEx
        Left = 16
        Top = 960
        Width = 1645
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
        object ShadowLabel24: TShadowLabel
          Left = 0
          Top = 0
          Width = 1643
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
        object VectorFlickerEffectLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 174
          Height = 31
          Hint = 'Flicker Effect [%3.2f]'
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
        object VectorBeamWidthMinLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 213
          Height = 31
          Hint = 'Beam Min Width [%2.2f]'
          Caption = 'Beam Min Width [1.00]'
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
          Left = 834
          Top = 127
          Width = 217
          Height = 31
          Hint = 'Beam Max Width [%2.2f]'
          Caption = 'Beam Max Width [1.00]'
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
        object VectorBeamIntensityWeightLabel: TShadowLabel
          Left = 422
          Top = 45
          Width = 266
          Height = 31
          Hint = 'Beam Intensity Weight %1.2f'
          Caption = 'Beam Intensity Weight [0.00]'
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
        object VectorBeamDotSizeLabel: TShadowLabel
          Left = 834
          Top = 45
          Width = 192
          Height = 31
          Hint = 'Beam Dot Size [%2.2f]'
          Caption = 'Beam Dot Size [1.00]'
          Enabled = False
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
        object VectorFlickerEffect: TGaugeBar2
          Left = 10
          Top = 81
          Width = 387
          Height = 36
          Hint = 'Set vector flicker effect'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 10.000000000000000000
          Max = 100.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.500000000000000000
        end
        object VectorBeamWidthMin: TGaugeBar2
          Left = 10
          Top = 163
          Width = 799
          Height = 36
          Hint = 'Set minimum vector beam width'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.100000001490116100
          Max = 10.000000000000000000
          Min = 0.009999999776482582
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
        end
        object VectorBeamWidthMax: TGaugeBar2
          Left = 834
          Top = 163
          Width = 799
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
        object VectorBeamIntensityWeight: TGaugeBar2
          Left = 422
          Top = 81
          Width = 387
          Height = 36
          Hint = 'Set maximum vector beam width'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          Min = -1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
        end
        object Antialias: TAdvOfficeCheckBoxEx
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
          TabOrder = 4
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
        object VectorBeamDotSize: TGaugeBar2
          Left = 834
          Top = 81
          Width = 799
          Height = 36
          Hint = 'Set vector beam size for dots'
          Backgnd = bgPattern
          ButtonSize = 30
          Enabled = False
          LargeChange = 0.100000001490116100
          Max = 10.000000000000000000
          Min = 1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
        end
      end
      object PanelEx27: TPanelEx
        Left = 684
        Top = 427
        Width = 643
        Height = 432
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
        object ShadowLabel28: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
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
        object SpeedLabel: TShadowLabel
          Left = 10
          Top = 266
          Width = 212
          Height = 31
          Hint = 'Gameplay Speed [%3.2f]'
          Caption = 'Gameplay Speed [1.00]'
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
        object FrameskipLabel: TShadowLabel
          Left = 224
          Top = 184
          Width = 193
          Height = 31
          AutoSize = False
          Caption = 'Frameskip'
          Color = clTeal
          Font.Charset = ANSI_CHARSET
          Font.Color = clYellow
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
        object ThreadPriorityLabel: TShadowLabel
          Left = 438
          Top = 184
          Width = 193
          Height = 31
          AutoSize = False
          Caption = 'Thread Priority'
          Color = clTeal
          Font.Charset = ANSI_CHARSET
          Font.Color = clYellow
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
        object NumberProcessorsLabel: TShadowLabel
          Left = 10
          Top = 184
          Width = 193
          Height = 31
          AutoSize = False
          Caption = '# of CPUs'
          Color = clTeal
          Font.Charset = ANSI_CHARSET
          Font.Color = clYellow
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
        object BenchmarkLabel: TShadowLabel
          Left = 333
          Top = 266
          Width = 207
          Height = 31
          Hint = 'sec'
          Caption = 'Benchmark [00:00 sec]'
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
        object SecondsToRunLabel: TShadowLabel
          Left = 10
          Top = 348
          Width = 484
          Height = 31
          Hint = 'sec'
          Caption = 'Time to Run Before Automatically Exiting [00:00 sec]'
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
          Left = 224
          Top = 93
          Width = 180
          Height = 36
          Hint = 
            'Enable automatic frameskip adjustment to maintain emulation spee' +
            'd'
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
        object Throttle: TAdvOfficeCheckBoxEx
          Left = 224
          Top = 45
          Width = 200
          Height = 36
          Hint = 'Throttle emulation to keep system running in sync with real time'
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
          Caption = 'Throttle'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object Sleep: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
          Width = 200
          Height = 36
          Hint = 
            'Enable sleeping, which gives time back to other applications whe' +
            'n idle'
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
          Caption = 'Sleep'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object Multithreading: TAdvOfficeCheckBoxEx
          Left = 438
          Top = 92
          Width = 170
          Height = 36
          Hint = 
            'Enable multithreading; this enables rendering and blitting on a ' +
            'separate thread'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Multithreading'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object RefreshSpeed: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 92
          Width = 165
          Height = 36
          Hint = 
            'Automatically adjust emulation speed to keep the emulated refres' +
            'h rate slower than the host screen'
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
          Caption = 'Refresh Speed'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object SyncronizeRefreshRate: TAdvOfficeCheckBoxEx
          Left = 438
          Top = 45
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
          TabOrder = 5
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
        object Speed: TGaugeBar2
          Left = 10
          Top = 302
          Width = 298
          Height = 36
          Hint = 
            'Controls the speed of gameplay, relative to realtime; smaller nu' +
            'mbers are slower'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.500000000000000000
          Max = 100.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.100000001490116100
          Position = 1.000000000000000000
        end
        object Frameskip: TComboBox2Ex
          Left = 224
          Top = 220
          Width = 193
          Height = 36
          Hint = 'Set frameskip to fixed value (autoframeskip must be disabled)'
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          Text = '0 (Default)'
          Items.Strings = (
            '0 (Default)'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12')
          CaptionVertIndent = -1
        end
        object ThreadPriority: TComboBox2Ex
          Left = 438
          Top = 220
          Width = 193
          Height = 36
          Hint = 'Thread priority for the main game thread'
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 15
          ParentFont = False
          TabOrder = 8
          Text = '0 (Normal)'
          Items.Strings = (
            '-15'
            '-14'
            '-13'
            '-12'
            '-11'
            '-10'
            '-9'
            '-8'
            '-7'
            '-6'
            '-5'
            '-4'
            '-3'
            '-2'
            '-1'
            '0 (Normal)'
            '1')
          CaptionVertIndent = -1
        end
        object NumberProcessors: TComboBox2Ex
          Left = 10
          Top = 220
          Width = 193
          Height = 36
          Hint = 
            'Specify the number of processors to use for work queues. Auto se' +
            'tting uses all CPUs found by the OS'
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
          TabOrder = 9
          Text = 'Auto'
          Items.Strings = (
            'Auto')
          CaptionVertIndent = -1
        end
        object Benchmark: TGaugeBar
          Tag = 14
          Left = 333
          Top = 302
          Width = 298
          Height = 36
          Hint = 'Implies: -video none -sound none -nothrottle'
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 60
          Max = 900
          ShowHandleGrip = True
          Position = 0
        end
        object SecondsToRun: TGaugeBar
          Tag = 14
          Left = 10
          Top = 384
          Width = 621
          Height = 36
          Hint = 'Time to Run Before Automatically Exiting ['
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 60
          Max = 900
          ShowHandleGrip = True
          Position = 0
        end
        object LowLatency: TAdvOfficeCheckBoxEx
          Left = 438
          Top = 138
          Width = 150
          Height = 36
          Hint = 'Draws new frame before throttling to reduce input latency'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Low Latency'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 2'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 3'
      object VideoOutputModeLabel: TShadowLabel
        Left = 1138
        Top = 14
        Width = 186
        Height = 31
        Caption = 'Video Output Mode'
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
      object ButtonPageVideoEffectsBGFX: TSpeedButtonEx
        Left = 32
        Top = 11
        Width = 325
        Height = 36
        GroupIndex = 2
        Caption = 'BGFX Post-Processing Effects'
        Enabled = False
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
      object ButtonPageVideoEffectsHLSL: TSpeedButtonEx
        Tag = 1
        Left = 360
        Top = 11
        Width = 325
        Height = 36
        GroupIndex = 2
        Down = True
        Caption = 'Direct3D Post-Processing Effects'
        Enabled = False
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
      object ButtonPageVideoEffectsGLSL: TSpeedButtonEx
        Tag = 2
        Left = 688
        Top = 11
        Width = 325
        Height = 36
        GroupIndex = 2
        Caption = 'OpenGL Post-Processing Effects'
        Enabled = False
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
      object VideoOutputMode: TComboBox2Ex
        Left = 1335
        Top = 11
        Width = 287
        Height = 36
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'This is atest kj'
        Items.Strings = (
          'This is atest kj')
      end
      object VideoOutputModeButtonHelp: TBitBtnEx
        Left = 1625
        Top = 11
        Width = 36
        Height = 36
        Hint = 'Why ???'
        Caption = '?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object NotebookVideoPostProcessingEffectsPages: TNotebook
        Left = 0
        Top = 49
        Width = 1677
        Height = 1138
        PageIndex = 2
        TabOrder = 2
        object TPage
          Left = 0
          Top = 0
          Caption = 'BGFX'
          object BGFXDebug: TAdvOfficeCheckBoxEx
            Left = 696
            Top = 16
            Width = 290
            Height = 36
            Hint = 'Debug for advance users'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Enable Debugging Statistics'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object PanelEx41: TPanelEx
            Left = 16
            Top = 16
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
            object ShadowLabel66: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'BGFX Backend to Use'
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
            object BGFXBackend: TComboBox2Ex
              Left = 10
              Top = 45
              Width = 621
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
              Text = 'Auto'
              Items.Strings = (
                'Auto'
                'Direct3D 9'
                'Direct3D 11'
                'Direct3D 12 (Requires Windows 10 / Windows 11)'
                'OpenGL (Requires OpenGL drivers)'
                'OpenGL ES (Requires SDLMAME)'
                'Metal Apple Graphics API (Requires OS X 10.11 El Capitan)'
                'Vulkan (Requires Vulkan drivers)')
            end
          end
          object PanelEx43: TPanelEx
            Left = 1018
            Top = 16
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
            object ShadowLabel68: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Path to BGFX Files'
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
            object EditEx47: TEditEx
              Left = 10
              Top = 45
              Width = 546
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
            object BitBtnEx55: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
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
          object PanelEx44: TPanelEx
            Left = 16
            Top = 134
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
            object ShadowLabel69: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Shadow Mask Texture'
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
            object BitBtnEx53: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
              Caption = 'Reset'
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
            object EditEx45: TEditEx
              Left = 10
              Top = 45
              Width = 473
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
              TabOrder = 1
            end
            object BitBtnEx56: TBitBtnEx
              Left = 488
              Top = 45
              Width = 70
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
              TabOrder = 2
              CaptionVertIndent = -1
            end
          end
          object PanelEx45: TPanelEx
            Left = 1018
            Top = 134
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
            object ShadowLabel70: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'LUT Texture Name'
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
            object BitBtnEx57: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
              Caption = 'Reset'
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
            object EditEx48: TEditEx
              Left = 10
              Top = 45
              Width = 473
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
              TabOrder = 1
            end
            object BitBtnEx58: TBitBtnEx
              Left = 488
              Top = 45
              Width = 70
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
              TabOrder = 2
              CaptionVertIndent = -1
            end
          end
          object PanelEx42: TPanelEx
            Left = 16
            Top = 252
            Width = 1645
            Height = 870
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
            object ShadowLabel67: TShadowLabel
              Left = 0
              Top = 0
              Width = 1643
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Screen Shader Chains'
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
            object BGFXScreenShaderChainsDetailsHTMLLabel: TShadowLabel
              Left = 1376
              Top = 0
              Width = 259
              Height = 31
              Hint = 
                'http://docs.mamedev.org/advanced/bgfx.html#configuration-setting' +
                's'
              Caption = '(click here for usage details)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowAccelChar = False
              ShowHint = True
              ShadowColor = clGray
              ShadowEnabled = False
              EllipsType = etNone
              ColorFrame = clBlack
              ColorInnerFrame = clBlack
              Frames = []
              Transparent = True
            end
            object BGFXScreenShaderChainsHelpLabel: TShadowLabel
              Left = 238
              Top = 0
              Width = 405
              Height = 31
              Caption = 'select a shader in the list or type in edit box'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
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
            object EditEx43: TEditEx
              Left = 10
              Top = 45
              Width = 1466
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
            object BitBtnEx51: TBitBtnEx
              Left = 1483
              Top = 45
              Width = 77
              Height = 36
              Hint = 'Click here to select a folder'
              Caption = 'Reload'
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
            object BitBtnEx52: TBitBtnEx
              Left = 1563
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
              Caption = 'Reset'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              CaptionVertIndent = -1
            end
            object BGFXScreenShaderChainsButtonSelect: TBitBtnEx
              Left = 1563
              Top = 822
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
              TabOrder = 3
              Visible = False
            end
            object BGFXScreenShaderChains_ListView: TEasyListview
              Left = 10
              Top = 91
              Width = 1623
              Height = 726
              BackGround.Enabled = True
              CellSizes.Report.Height = 32
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
              GroupFont.Color = clBlack
              GroupFont.Height = -12
              GroupFont.Name = 'Segoe UI'
              GroupFont.Style = []
              HintType = ehtToolTip
              Header.Columns.Items = {
                0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
                0006000000800800010100010000000000000098030000FFFFFF1F0001000000
                01000000050000005400690074006C0065000000000000000000000000001100
                00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
                0001010000000000002C010000FFFFFF1F000100000001000000040000004E00
                61006D006500000000000000000000000000110000005445617379436F6C756D
                6E53746F726564FFFECE00060000008008000101000102000000000000900100
                00FFFFFF1F0001000000010000000600000041007500740068006F0072000000
                00000000000000000000}
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
              PaintInfoGroup.Expandable = False
              PaintInfoGroup.MarginBottom.CaptionIndent = 4
              PaintInfoItem.BorderColor = 16370824
              PaintInfoItem.ShowBorder = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
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
              TabOrder = 4
              View = elsReport
              CustomCheckRadioEnabled = False
              CustomEnableIconHD = False
            end
            object BGFXScreenShaderChains_ListViewButtonAdd: TBitBtnEx
              Left = 125
              Top = 822
              Width = 70
              Height = 36
              Hint = 'Add selected shader to the list (for multiple screens games)'
              Caption = 'Add'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object BGFXScreenShaderChains_ListViewButtonSelect: TBitBtnEx
              Left = 10
              Top = 822
              Width = 110
              Height = 36
              Hint = 
                'Click here to set selected shader active (mouse double-click in ' +
                'the list)'
              Caption = 'Set Active'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          HelpContext = 1
          Caption = 'Direct3D'
          object HLSLEnable: TAdvOfficeCheckBoxEx
            Left = 16
            Top = 16
            Width = 155
            Height = 36
            Hint = 'Enables HLSL post-processing (Pixel Shader 3.0 required)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Enable HLSL'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object YIQEnable: TAdvOfficeCheckBoxEx
            Left = 419
            Top = 62
            Width = 245
            Height = 36
            Hint = 
              'Enables YIQ-colorspace post-processing. Causes a performance dro' +
              'p but gives a much more authentic'#13#10'NTSC TV appearance on TV-base' +
              'd systems when configured properly'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Enable YIQ Colorspace'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object HLSLOversampling: TAdvOfficeCheckBoxEx
            Left = 16
            Top = 62
            Width = 285
            Height = 36
            Hint = 
              'Render the image in a resolution twice as high, which can help t' +
              'o reduces moir'#233'-effects'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Enable HLSL Oversampling'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object PanelEx29: TPanelEx
            Left = 350
            Top = 346
            Width = 309
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
            object ShadowLabel30: TShadowLabel
              Left = 0
              Top = 0
              Width = 307
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Upscaled Snap Resolution'
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
            object ShadowLabel38: TShadowLabel
              Left = 110
              Top = 47
              Width = 13
              Height = 31
              Caption = 'X'
              Enabled = False
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
            object EditEx19: TEditEx
              Left = 10
              Top = 45
              Width = 95
              Height = 36
              Hint = 'Custom resolution width'
              AutoSize = False
              Color = clWhite
              Ctl3D = True
              Enabled = False
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object EditEx20: TEditEx
              Left = 128
              Top = 45
              Width = 94
              Height = 36
              Hint = 'Custom resolution height'
              AutoSize = False
              Color = clWhite
              Ctl3D = True
              Enabled = False
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BitBtnEx26: TBitBtnEx
              Left = 227
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to select a file'
              Caption = 'Reset'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              CaptionVertIndent = -1
            end
          end
          object PanelEx31: TPanelEx
            Left = 16
            Top = 582
            Width = 1645
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
            object ShadowLabel32: TShadowLabel
              Left = 0
              Top = 0
              Width = 1643
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Vector Post-Processing'
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
            object ShadowLabel39: TShadowLabel
              Left = 10
              Top = 45
              Width = 187
              Height = 31
              Hint = 'Gameplay Speed [%3.2f]'
              Caption = 'Beam Smooth [0.00]'
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
            object ShadowLabel40: TShadowLabel
              Left = 834
              Top = 45
              Width = 266
              Height = 31
              Hint = 'sec'
              Caption = 'Maximum Attenuation [0.50]'
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
            object ShadowLabel41: TShadowLabel
              Left = 10
              Top = 127
              Width = 343
              Height = 31
              Hint = 'sec'
              Caption = 'Minimum Attenuation Length [0.500]'
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
            object GaugeBar1: TGaugeBar
              Tag = 14
              Left = 834
              Top = 81
              Width = 799
              Height = 36
              Hint = 'Implies: -video none -sound none -nothrottle'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 30
              LargeChange = 60
              Max = 900
              ShowHandleGrip = True
              Position = 0
            end
            object GaugeBar21: TGaugeBar2
              Left = 10
              Top = 81
              Width = 799
              Height = 36
              Hint = 
                'Controls the speed of gameplay, relative to realtime; smaller nu' +
                'mbers are slower'
              Color = 5263440
              Backgnd = bgSolid
              ButtonSize = 30
              LargeChange = 0.500000000000000000
              Max = 100.000000000000000000
              Min = 0.100000001490116100
              ShowHandleGrip = True
              Style = rbsMac
              SmallChange = 0.100000001490116100
              Position = 1.000000000000000000
            end
            object GaugeBar2: TGaugeBar
              Tag = 14
              Left = 10
              Top = 163
              Width = 1623
              Height = 36
              Hint = 'Time to Run Before Automatically Exiting ['
              Color = 3289650
              Backgnd = bgSolid
              ButtonSize = 30
              LargeChange = 60
              Max = 900
              ShowHandleGrip = True
              Style = rbsMac
              Position = 0
            end
          end
          object PanelEx32: TPanelEx
            Left = 16
            Top = 228
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
            object ShadowLabel33: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Shadow Mask Texture'
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
            object BitBtnEx24: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
              Caption = 'Reset'
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
            object EditEx18: TEditEx
              Left = 10
              Top = 45
              Width = 473
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
              TabOrder = 1
            end
            object BitBtnEx25: TBitBtnEx
              Left = 488
              Top = 45
              Width = 70
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
              TabOrder = 2
              CaptionVertIndent = -1
            end
          end
          object PanelEx33: TPanelEx
            Left = 16
            Top = 464
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
            object ShadowLabel34: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'HLSL Custom Ini File'
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
            object ReadCustomHLSLFile: TAdvOfficeCheckBoxEx
              Left = 10
              Top = 46
              Width = 115
              Height = 36
              Hint = 'Enable custom HLSL ini reading'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Alignment = taLeftJustify
              ButtonVertAlign = tlCenter
              Caption = 'Read File'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
              CustomEnableIconHD = True
              CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
              CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
            end
            object WriteCustomHLSLFile: TAdvOfficeCheckBoxEx
              Left = 134
              Top = 46
              Width = 120
              Height = 36
              Hint = 'Enable custom HLSL ini writing'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Alignment = taLeftJustify
              ButtonVertAlign = tlCenter
              Caption = 'Write File'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
              CustomEnableIconHD = True
              CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
              CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
            end
            object HLSLIniFile: TEditEx
              Left = 257
              Top = 45
              Width = 299
              Height = 36
              Hint = 'HLSL ini file name for this game'
              AutoSize = False
              Color = clWhite
              Ctl3D = True
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
            end
            object HLSLIniFileButtonReset: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
              Height = 36
              Hint = 'Click here to reset HLSL custom filename to default'
              Caption = 'Reset'
              Enabled = False
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
          end
          object PanelEx34: TPanelEx
            Left = 1018
            Top = 110
            Width = 643
            Height = 322
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
            object ShadowLabel35: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Bloom Post-Processing'
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
            object BloomBlendModeLabel: TShadowLabel
              Left = 10
              Top = 45
              Width = 178
              Height = 31
              Caption = 'Bloom Blend Mode'
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
            object BloomBlendMode: TComboBox2Ex
              Left = 10
              Top = 81
              Width = 287
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
              Text = 'Brighten'
              Items.Strings = (
                'Brighten'
                'Darken')
              CaptionVertIndent = -1
            end
            object AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx
              Left = 10
              Top = 127
              Width = 280
              Height = 36
              Hint = 'Enables HLSL post-processing (Pixel Shader 3.0 required)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Alignment = taLeftJustify
              ButtonVertAlign = tlCenter
              Caption = 'Enable Screen LUT Texture'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
              CustomEnableIconHD = True
              CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
              CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
            end
            object AdvOfficeCheckBoxEx2: TAdvOfficeCheckBoxEx
              Left = 10
              Top = 225
              Width = 330
              Height = 36
              Hint = 
                'Render the image in a resolution twice as high, which can help t' +
                'o reduces moir'#233'-effects'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Alignment = taLeftJustify
              ButtonVertAlign = tlCenter
              Caption = 'Enable UI / Artwork LUT Texture'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
              CustomEnableIconHD = True
              CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
              CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
            end
            object EditEx21: TEditEx
              Left = 10
              Top = 176
              Width = 473
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
              TabOrder = 3
            end
            object BitBtnEx27: TBitBtnEx
              Left = 480
              Top = 176
              Width = 70
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
              TabOrder = 4
              CaptionVertIndent = -1
            end
            object BitBtnEx28: TBitBtnEx
              Left = 553
              Top = 176
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
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
              CaptionVertIndent = -1
            end
            object EditEx22: TEditEx
              Left = 10
              Top = 274
              Width = 473
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
              TabOrder = 6
            end
            object BitBtnEx29: TBitBtnEx
              Left = 488
              Top = 274
              Width = 70
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
              TabOrder = 7
              CaptionVertIndent = -1
            end
            object BitBtnEx30: TBitBtnEx
              Left = 561
              Top = 274
              Width = 70
              Height = 36
              Hint = 'Click here to select a folder'
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
          end
          object PanelEx35: TPanelEx
            Left = 16
            Top = 346
            Width = 309
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
            object ShadowLabel36: TShadowLabel
              Left = 0
              Top = 0
              Width = 307
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Shadow Mask Tile Mode'
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
            object ShadowMaskTileMode: TComboBox2Ex
              Left = 10
              Top = 45
              Width = 287
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
              Text = 'Screen Based'
              Items.Strings = (
                'Screen Based'
                'Source Based')
            end
          end
          object PanelEx36: TPanelEx
            Left = 16
            Top = 110
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
            object ShadowLabel37: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Path to HLSL Files'
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
            object EditEx17: TEditEx
              Left = 10
              Top = 45
              Width = 546
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
            object BitBtnEx23: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
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
        object TPage
          Left = 0
          Top = 0
          HelpContext = 2
          Caption = 'OpenGL'
          object EnableOpenGLFilterNotFFLabel: TShadowLabel
            Left = 1045
            Top = 97
            Width = 431
            Height = 28
            Caption = 'Checked: Bilinear (Default); Unchecked: Plain'
            Font.Charset = ANSI_CHARSET
            Font.Color = 10900224
            Font.Height = -21
            Font.Name = 'Trebuchet MS'
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
          object OpenGLForcePowerTwoTextures: TAdvOfficeCheckBoxEx
            Left = 16
            Top = 62
            Width = 300
            Height = 36
            Hint = 
              'Always use only power-of-2 sized textures'#13#10'Can cause graphic cor' +
              'ruption on recent video cards!'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Force Power of Two Textures'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object OpenGLDisableUseGL_ARBTextureRectangle: TAdvOfficeCheckBoxEx
            Left = 1018
            Top = 16
            Width = 375
            Height = 36
            Hint = 'Can cause graphic corruption on recent video cards!'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Don'#39't Use GL_ARB Texture Rectangle'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object EnableOpenGL_VBO: TAdvOfficeCheckBoxEx
            Left = 16
            Top = 108
            Width = 145
            Height = 36
            Hint = 'Enable OpenGL VBO, if available'
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
            Caption = 'Enable VBO'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object EnableOpenGL_PBO: TAdvOfficeCheckBoxEx
            Left = 262
            Top = 108
            Width = 145
            Height = 36
            Hint = 'Enable OpenGL PBO, if available'
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
            Caption = 'Enable PBO'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object EnableGLSL: TAdvOfficeCheckBoxEx
            Left = 16
            Top = 16
            Width = 150
            Height = 36
            Hint = 'Enable OpenGL GLSL, if available'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Enable GLSL'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object EnableOpenGLFilterNotFF: TAdvOfficeCheckBoxEx
            Left = 1018
            Top = 62
            Width = 375
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
            Caption = 'Use OpenGL Filter Instead of FF Filter'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object PanelEx37: TPanelEx
            Left = 16
            Top = 154
            Width = 643
            Height = 507
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
            object ShadowLabel42: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Custom OpenGL GLSL Shader Set MAME'
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
            object ShadowLabel43: TShadowLabel
              Left = 10
              Top = 47
              Width = 12
              Height = 31
              Caption = '0'
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
            object ShadowLabel44: TShadowLabel
              Left = 10
              Top = 93
              Width = 12
              Height = 31
              Caption = '1'
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
            object ShadowLabel45: TShadowLabel
              Left = 10
              Top = 139
              Width = 12
              Height = 31
              Caption = '2'
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
            object ShadowLabel46: TShadowLabel
              Left = 10
              Top = 185
              Width = 12
              Height = 31
              Caption = '3'
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
            object ShadowLabel47: TShadowLabel
              Left = 10
              Top = 231
              Width = 12
              Height = 31
              Caption = '4'
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
            object ShadowLabel48: TShadowLabel
              Left = 10
              Top = 277
              Width = 12
              Height = 31
              Caption = '5'
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
            object ShadowLabel49: TShadowLabel
              Left = 10
              Top = 323
              Width = 12
              Height = 31
              Caption = '6'
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
            object ShadowLabel50: TShadowLabel
              Left = 10
              Top = 369
              Width = 12
              Height = 31
              Caption = '7'
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
            object ShadowLabel51: TShadowLabel
              Left = 10
              Top = 415
              Width = 12
              Height = 31
              Caption = '8'
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
            object ShadowLabel52: TShadowLabel
              Left = 10
              Top = 461
              Width = 12
              Height = 31
              Caption = '9'
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
            object EditEx23: TEditEx
              Left = 31
              Top = 45
              Width = 525
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
            object BitBtnEx31: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
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
            object BitBtnEx32: TBitBtnEx
              Left = 561
              Top = 91
              Width = 70
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
              TabOrder = 2
              CaptionVertIndent = -1
            end
            object EditEx24: TEditEx
              Left = 31
              Top = 91
              Width = 525
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
              TabOrder = 3
            end
            object EditEx25: TEditEx
              Left = 31
              Top = 137
              Width = 525
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
              TabOrder = 4
            end
            object BitBtnEx33: TBitBtnEx
              Left = 561
              Top = 137
              Width = 70
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
              TabOrder = 5
              CaptionVertIndent = -1
            end
            object BitBtnEx34: TBitBtnEx
              Left = 561
              Top = 183
              Width = 70
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
              TabOrder = 6
              CaptionVertIndent = -1
            end
            object EditEx26: TEditEx
              Left = 31
              Top = 183
              Width = 525
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
              TabOrder = 7
            end
            object EditEx27: TEditEx
              Left = 31
              Top = 229
              Width = 525
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
              TabOrder = 8
            end
            object BitBtnEx35: TBitBtnEx
              Left = 561
              Top = 229
              Width = 70
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
              TabOrder = 9
              CaptionVertIndent = -1
            end
            object BitBtnEx36: TBitBtnEx
              Left = 561
              Top = 275
              Width = 70
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
              TabOrder = 10
              CaptionVertIndent = -1
            end
            object EditEx28: TEditEx
              Left = 31
              Top = 275
              Width = 525
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
              TabOrder = 11
            end
            object EditEx29: TEditEx
              Left = 31
              Top = 321
              Width = 525
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
              TabOrder = 12
            end
            object BitBtnEx37: TBitBtnEx
              Left = 561
              Top = 321
              Width = 70
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
              TabOrder = 13
              CaptionVertIndent = -1
            end
            object BitBtnEx38: TBitBtnEx
              Left = 561
              Top = 367
              Width = 70
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
              TabOrder = 14
              CaptionVertIndent = -1
            end
            object EditEx30: TEditEx
              Left = 31
              Top = 367
              Width = 525
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
              TabOrder = 15
            end
            object EditEx31: TEditEx
              Left = 31
              Top = 413
              Width = 525
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
              TabOrder = 16
            end
            object BitBtnEx39: TBitBtnEx
              Left = 561
              Top = 413
              Width = 70
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
              TabOrder = 17
              CaptionVertIndent = -1
            end
            object BitBtnEx40: TBitBtnEx
              Left = 561
              Top = 459
              Width = 70
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
              TabOrder = 18
              CaptionVertIndent = -1
            end
            object EditEx32: TEditEx
              Left = 31
              Top = 459
              Width = 525
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
              TabOrder = 19
            end
          end
          object PanelEx38: TPanelEx
            Left = 1018
            Top = 154
            Width = 643
            Height = 507
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
            object ShadowLabel53: TShadowLabel
              Left = 0
              Top = 0
              Width = 641
              Height = 35
              Align = alTop
              AutoSize = False
              Caption = 'Custom OpenGL GLSL Shader Screen'
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
            object ShadowLabel54: TShadowLabel
              Left = 10
              Top = 47
              Width = 12
              Height = 31
              Caption = '0'
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
            object ShadowLabel55: TShadowLabel
              Left = 10
              Top = 93
              Width = 12
              Height = 31
              Caption = '1'
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
            object ShadowLabel56: TShadowLabel
              Left = 10
              Top = 139
              Width = 12
              Height = 31
              Caption = '2'
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
            object ShadowLabel57: TShadowLabel
              Left = 10
              Top = 185
              Width = 12
              Height = 31
              Caption = '3'
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
            object ShadowLabel58: TShadowLabel
              Left = 10
              Top = 231
              Width = 12
              Height = 31
              Caption = '4'
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
            object ShadowLabel59: TShadowLabel
              Left = 10
              Top = 277
              Width = 12
              Height = 31
              Caption = '5'
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
            object ShadowLabel60: TShadowLabel
              Left = 10
              Top = 323
              Width = 12
              Height = 31
              Caption = '6'
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
            object ShadowLabel61: TShadowLabel
              Left = 10
              Top = 369
              Width = 12
              Height = 31
              Caption = '7'
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
            object ShadowLabel62: TShadowLabel
              Left = 10
              Top = 415
              Width = 12
              Height = 31
              Caption = '8'
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
            object ShadowLabel63: TShadowLabel
              Left = 10
              Top = 461
              Width = 12
              Height = 31
              Caption = '9'
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
            object EditEx33: TEditEx
              Left = 31
              Top = 45
              Width = 525
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
            object BitBtnEx41: TBitBtnEx
              Left = 561
              Top = 45
              Width = 70
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
            object BitBtnEx42: TBitBtnEx
              Left = 561
              Top = 91
              Width = 70
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
              TabOrder = 2
              CaptionVertIndent = -1
            end
            object EditEx34: TEditEx
              Left = 31
              Top = 91
              Width = 525
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
              TabOrder = 3
            end
            object EditEx35: TEditEx
              Left = 31
              Top = 137
              Width = 525
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
              TabOrder = 4
            end
            object BitBtnEx43: TBitBtnEx
              Left = 561
              Top = 137
              Width = 70
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
              TabOrder = 5
              CaptionVertIndent = -1
            end
            object BitBtnEx44: TBitBtnEx
              Left = 561
              Top = 183
              Width = 70
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
              TabOrder = 6
              CaptionVertIndent = -1
            end
            object EditEx36: TEditEx
              Left = 31
              Top = 183
              Width = 525
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
              TabOrder = 7
            end
            object EditEx37: TEditEx
              Left = 31
              Top = 229
              Width = 525
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
              TabOrder = 8
            end
            object BitBtnEx45: TBitBtnEx
              Left = 561
              Top = 229
              Width = 70
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
              TabOrder = 9
              CaptionVertIndent = -1
            end
            object BitBtnEx46: TBitBtnEx
              Left = 561
              Top = 275
              Width = 70
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
              TabOrder = 10
              CaptionVertIndent = -1
            end
            object EditEx38: TEditEx
              Left = 31
              Top = 275
              Width = 525
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
              TabOrder = 11
            end
            object EditEx39: TEditEx
              Left = 31
              Top = 321
              Width = 525
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
              TabOrder = 12
            end
            object BitBtnEx47: TBitBtnEx
              Left = 561
              Top = 321
              Width = 70
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
              TabOrder = 13
              CaptionVertIndent = -1
            end
            object BitBtnEx48: TBitBtnEx
              Left = 561
              Top = 367
              Width = 70
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
              TabOrder = 14
              CaptionVertIndent = -1
            end
            object EditEx40: TEditEx
              Left = 31
              Top = 367
              Width = 525
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
              TabOrder = 15
            end
            object EditEx41: TEditEx
              Left = 31
              Top = 413
              Width = 525
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
              TabOrder = 16
            end
            object BitBtnEx49: TBitBtnEx
              Left = 561
              Top = 413
              Width = 70
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
              TabOrder = 17
              CaptionVertIndent = -1
            end
            object BitBtnEx50: TBitBtnEx
              Left = 561
              Top = 459
              Width = 70
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
              TabOrder = 18
              CaptionVertIndent = -1
            end
            object EditEx42: TEditEx
              Left = 31
              Top = 459
              Width = 525
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
              TabOrder = 19
            end
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'LUA'
      object PanelEx39: TPanelEx
        Left = 16
        Top = 16
        Width = 1645
        Height = 683
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
        object ShadowLabel64: TShadowLabel
          Left = 0
          Top = 0
          Width = 1643
          Height = 35
          Align = alTop
          AutoSize = False
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
        object LUAPluginsToEnable2Label: TShadowLabel
          Left = 331
          Top = 0
          Width = 202
          Height = 31
          Caption = '(check plugins to use)'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
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
        object LUAPluginsToEnable: TEasyListview
          Left = 10
          Top = 45
          Width = 1623
          Height = 626
          BackGround.Enabled = True
          CellSizes.Report.Height = 32
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          Enabled = False
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
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            00060000008008000101000100000000000000AF020000FFFFFF1F0001000000
            01000000050000005400690074006C0065000000000000000000000000001100
            00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
            000101000000000000FA000000FFFFFF1F000100000001000000040000004E00
            61006D006500000000000000000000000000110000005445617379436F6C756D
            6E53746F726564FFFECE00060000008008000101000102000000000000960000
            00FFFFFF1F00010000000100000007000000560065007200730069006F006E00
            000000000000000000000000110000005445617379436F6C756D6E53746F7265
            64FFFECE0006000000800800010100010300000000000012020000FFFFFF1F00
            01000000010000000600000041007500740068006F0072000000000000000000
            00000000}
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
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.CheckType = ectBox
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
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
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object EnableLUAPluginSupport: TAdvOfficeCheckBoxEx
          Left = 8
          Top = -2
          Width = 285
          Height = 36
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Enable LUA Plugin Support'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object PanelEx47: TPanelEx
        Left = 16
        Top = 724
        Width = 1645
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
        object ShadowLabel72: TShadowLabel
          Left = 0
          Top = 0
          Width = 1643
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Auto-boot (LUA Scripts)'
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
        object ShadowLabel75: TShadowLabel
          Left = 10
          Top = 45
          Width = 389
          Height = 31
          Caption = 'Command To Execute After Machine Boot'
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
        object ShadowLabel76: TShadowLabel
          Left = 656
          Top = 46
          Width = 214
          Height = 31
          Hint = 'sec'
          Caption = 'Delay Timer [00:00 sec]'
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
        object ShadowLabel77: TShadowLabel
          Left = 1012
          Top = 45
          Width = 386
          Height = 31
          Caption = 'LUA Script to Execute After Machine Boot'
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
        object EditEx50: TEditEx
          Left = 10
          Top = 81
          Width = 546
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
        object BitBtnEx61: TBitBtnEx
          Left = 561
          Top = 81
          Width = 70
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
        object GaugeBar3: TGaugeBar
          Tag = 14
          Left = 656
          Top = 81
          Width = 331
          Height = 36
          Hint = 'Time to Run Before Automatically Exiting ['
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 5
          Max = 180
          ShowHandleGrip = True
          Position = 0
        end
        object BitBtnEx64: TBitBtnEx
          Left = 1563
          Top = 81
          Width = 70
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
          TabOrder = 3
          CaptionVertIndent = -1
        end
        object EditEx53: TEditEx
          Left = 1012
          Top = 81
          Width = 546
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
          TabOrder = 4
        end
        object EnableEmulatorLUAConsole: TAdvOfficeCheckBoxEx
          Left = 325
          Top = -2
          Width = 310
          Height = 36
          Hint = 
            'Start emulator with LUA console enabled'#13#10'For MAME v0.154 and new' +
            'er'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Enable Emulator LUA Console'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object PanelEx48: TPanelEx
        Left = 1018
        Top = 878
        Width = 643
        Height = 293
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
        object ShadowLabel73: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'PortAudio Settings'
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
        object ShadowLabel78: TShadowLabel
          Left = 10
          Top = 45
          Width = 33
          Height = 31
          Caption = 'API'
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
        object ShadowLabel79: TShadowLabel
          Left = 10
          Top = 127
          Width = 63
          Height = 31
          Caption = 'Device'
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
        object ShadowLabel80: TShadowLabel
          Left = 10
          Top = 209
          Width = 184
          Height = 31
          Caption = 'Latency, In Seconds'
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
        object EditEx51: TEditEx
          Left = 10
          Top = 81
          Width = 546
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
        object BitBtnEx62: TBitBtnEx
          Left = 561
          Top = 81
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Clear'
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
        object BitBtnEx54: TBitBtnEx
          Left = 561
          Top = 163
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Clear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CaptionVertIndent = -1
        end
        object EditEx44: TEditEx
          Left = 10
          Top = 163
          Width = 546
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
          TabOrder = 3
        end
        object BitBtnEx65: TBitBtnEx
          Left = 561
          Top = 245
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Clear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CaptionVertIndent = -1
        end
        object EditEx54: TEditEx
          Left = 10
          Top = 245
          Width = 546
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
          TabOrder = 5
        end
      end
      object PanelEx49: TPanelEx
        Left = 16
        Top = 878
        Width = 643
        Height = 293
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
        object ShadowLabel74: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
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
        object AudioLatencyLabel: TShadowLabel
          Left = 333
          Top = 127
          Width = 133
          Height = 31
          Caption = 'Audio Latency'
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
        object SampleRateLabel: TShadowLabel
          Left = 10
          Top = 127
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
          Top = 209
          Width = 240
          Height = 31
          Hint = 'Volume Attenuation [%ddB]'
          Caption = 'Volume Attenuation [0dB]'
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
        object SoundOutputMethodLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 192
          Height = 31
          Caption = 'Sound Output Mode'
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
        object SpeakerReportLabel: TShadowLabel
          Left = 333
          Top = 209
          Width = 141
          Height = 31
          Caption = 'Speaker Report'
          Enabled = False
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
        object BitBtnEx63: TBitBtnEx
          Left = 561
          Top = 163
          Width = 70
          Height = 36
          Hint = 'Set default latency'
          Caption = 'Reset'
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
        object Samples: TAdvOfficeCheckBoxEx
          Left = 333
          Top = 45
          Width = 232
          Height = 36
          Hint = 'Enable the use of external samples if available'
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
          Caption = 'Use External Samples'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object AudioLatency: TComboBox2Ex
          Left = 333
          Top = 163
          Width = 223
          Height = 36
          Hint = 
            'Set audio latency (increase to reduce glitches, decrease for res' +
            'ponsiveness)'
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
          Text = '2/5'
          Items.Strings = (
            '1/5'
            '2/5'
            '3/5'
            '4/5'
            '5/5')
          CaptionVertIndent = -1
        end
        object SampleRate: TComboBox2Ex
          Left = 10
          Top = 163
          Width = 298
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
          TabOrder = 3
          Text = '48000 Hz'
          Items.Strings = (
            '11025 Hz'
            '22050 Hz'
            '44100 Hz'
            '48000 Hz'
            '96000 Hz'
            '192000 Hz')
          CaptionVertIndent = -1
        end
        object Volume: TGaugeBar
          Left = 10
          Top = 245
          Width = 298
          Height = 36
          Hint = 'Sound volume in decibels (-32 -> low, 0 -> normal)'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 5
          Max = 0
          Min = -32
          ShowHandleGrip = True
          Position = 0
        end
        object SoundOutputMethod: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 298
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
          TabOrder = 5
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'DirectSound'
            'XAudio2 (Win8+)'
            'SDL'
            'PortAudio'
            'None')
          CaptionVertIndent = -1
        end
        object SpeakerReport: TComboBox2Ex
          Left = 333
          Top = 245
          Width = 298
          Height = 36
          Hint = 
            'Print report of speaker ouput maxima (0=none, or 1-4 for more de' +
            'tail)'
          Style = csOwnerDrawFixed
          Enabled = False
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
          TabOrder = 6
          Text = 'None'
          Items.Strings = (
            'None'
            'Details (Level 1)'
            'Details (Level 2)'
            'Details (Level 3)'
            'Details (Level 4)')
          CaptionVertIndent = -1
        end
        object AdvOfficeCheckBoxEx3: TAdvOfficeCheckBoxEx
          Left = 333
          Top = 87
          Width = 275
          Height = 36
          Hint = 'Enable the use of external samples if available'
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
          Caption = 'Enable Audio Compressor'
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
    object TPage
      Left = 0
      Top = 0
      Caption = 'Input'
      object RecordInputTimecodeFileLabel: TShadowLabel
        Left = 43
        Top = 1061
        Width = 229
        Height = 28
        Caption = '(used with record input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
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
      object ExitAfterInputPlaybackLabel: TShadowLabel
        Left = 379
        Top = 1061
        Width = 250
        Height = 28
        Caption = '(used with playback input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
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
      object MultiKeyboard: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 108
        Width = 298
        Height = 36
        Hint = 'Enable separate input from each keyboard device (if present)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Mutli-Keyboard'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Mouse: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 16
        Width = 298
        Height = 36
        Hint = 'Enable mouse input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Mouse'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object MultiMouse: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 62
        Width = 298
        Height = 36
        Hint = 'Enable separate input from each mouse device (if present)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Multi-Mouse'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object LightGun: TAdvOfficeCheckBoxEx
        Left = 339
        Top = 16
        Width = 298
        Height = 36
        Hint = 'Enable lightgun input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Light Gun'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DualLightGun: TAdvOfficeCheckBoxEx
        Left = 339
        Top = 62
        Width = 298
        Height = 36
        Hint = 'Enable dual lightgun input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Dual Light Gun'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object LightGunOffScreenReload: TAdvOfficeCheckBoxEx
        Left = 339
        Top = 108
        Width = 298
        Height = 36
        Hint = 'Convert lightgun button 2 into offscreen reload'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Off-Screen Reload'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object NaturalKeyboard: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 154
        Width = 298
        Height = 36
        Hint = 'Specifies whether to use a natural keyboard mode or not'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Natural Keyboard'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SteadyKey: TAdvOfficeCheckBoxEx
        Left = 339
        Top = 154
        Width = 298
        Height = 36
        Hint = 'Use a different handling for multiple keys presses at once'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Steady Key'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object CoinLockout: TAdvOfficeCheckBoxEx
        Left = 339
        Top = 200
        Width = 298
        Height = 36
        Hint = 'Ignore coin inputs if coin lockout output is active'
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
        Caption = 'Coin Lockout'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UIMouse: TAdvOfficeCheckBoxEx
        Left = 1018
        Top = 465
        Width = 375
        Height = 36
        Hint = 
          'Displays a mouse cursor when using the built-in user interface f' +
          'or MAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Display User Interface Mouse Cursor'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object UIActive: TAdvOfficeCheckBoxEx
        Left = 1018
        Top = 511
        Width = 580
        Height = 36
        Hint = 
          'Enable access to the built-in user interface in MAME on top of e' +
          'mulated keyboard'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enable Partial Keyboard Emulation (User Interface Enabled)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EnableGlobalInputs: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 200
        Width = 298
        Height = 36
        Hint = 'Read inputs even when the MAME window is not in focus'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enable Global Inputs'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RecordInputTimecodeFile: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 1026
        Width = 315
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Record an Input Timecode File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ExitAfterInputPlayback: TAdvOfficeCheckBoxEx
        Left = 352
        Top = 1026
        Width = 350
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Exit Emulator After Input Playback'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object PanelEx50: TPanelEx
        Left = 16
        Top = 246
        Width = 643
        Height = 258
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
        object ShadowLabel81: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Joystick'
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
        object JoystickSaturationLabel: TShadowLabel
          Left = 14
          Top = 174
          Width = 229
          Height = 31
          Hint = 'Joystick Saturation [%1.2f]'
          AutoSize = False
          Caption = 'Joystick Saturation [0.85]'
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
        object JoystickDeadzoneLabel: TShadowLabel
          Left = 10
          Top = 92
          Width = 228
          Height = 31
          Hint = 'Joystick Deadzone [%1.2f]'
          AutoSize = False
          Caption = 'Joystick Deadzone [0.30]'
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
        object Joystick: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
          Width = 175
          Height = 36
          Hint = 'Enable joystick input'
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
          Caption = 'Enable Joystick'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object JoystickContradictory: TAdvOfficeCheckBoxEx
          Left = 333
          Top = 45
          Width = 235
          Height = 36
          Hint = 
            'Enable contradictory direction digital joystick input at the sam' +
            'e time (left/right, up/down)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Joystick Contradictory'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object JoystickDeadzone: TGaugeBar2
          Left = 10
          Top = 128
          Width = 621
          Height = 36
          Hint = 
            'Center deadzone range for joystick where change is ignored (0.0 ' +
            'center, 1.0 end)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.300000011920929000
        end
        object JoystickSaturation: TGaugeBar2
          Left = 10
          Top = 210
          Width = 621
          Height = 36
          Hint = 
            'End of axis saturation range for joystick where change is ignore' +
            'd (0.0 center, 1.0 end)'
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.850000023841857900
        end
      end
      object PanelEx51: TPanelEx
        Left = 1018
        Top = 557
        Width = 643
        Height = 156
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
        object ShadowLabel82: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Full Keyboard Emulation (User Interface Disabled)'
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
        object ShadowLabel94: TShadowLabel
          Left = 10
          Top = 45
          Width = 422
          Height = 61
          Caption = 
            'Key to Enable/Disable MAME Controls When Emulated System Has Key' +
            'board Inputs'
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
          WordWrap = True
        end
        object EditEx55: TEditEx
          Left = 10
          Top = 110
          Width = 546
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
        object BitBtnEx67: TBitBtnEx
          Left = 561
          Top = 110
          Width = 70
          Height = 36
          Hint = 'Click here to set default value'
          Caption = 'Reset'
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
      object PanelEx53: TPanelEx
        Left = 1018
        Top = 766
        Width = 643
        Height = 251
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
        object ShadowLabel84: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Comm Options'
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
        object ShadowLabel90: TShadowLabel
          Left = 10
          Top = 45
          Width = 226
          Height = 31
          Caption = 'Local Address to Bind to'
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
        object ShadowLabel91: TShadowLabel
          Left = 466
          Top = 45
          Width = 38
          Height = 31
          Caption = 'Port'
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
        object ShadowLabel92: TShadowLabel
          Left = 10
          Top = 127
          Width = 285
          Height = 31
          Caption = 'Remote Address to Connect to'
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
        object ShadowLabel93: TShadowLabel
          Left = 466
          Top = 127
          Width = 38
          Height = 31
          Caption = 'Port'
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
        object EditEx57: TEditEx
          Left = 10
          Top = 81
          Width = 446
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
          Text = '192.200.200.1'
        end
        object BitBtnEx66: TBitBtnEx
          Left = 561
          Top = 81
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Reset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          CaptionVertIndent = -1
        end
        object EditEx59: TEditEx
          Left = 10
          Top = 163
          Width = 446
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
          TabOrder = 3
        end
        object BitBtnEx72: TBitBtnEx
          Left = 561
          Top = 163
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Reset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          CaptionVertIndent = -1
        end
        object EditEx60: TEditEx
          Left = 466
          Top = 163
          Width = 90
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
          TabOrder = 5
        end
        object CommSyncFrame: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 209
          Width = 205
          Height = 36
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Syncronize Frames'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object EditEx52: TEditEx
          Left = 466
          Top = 81
          Width = 90
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
          TabOrder = 1
          Text = '803233'
        end
      end
      object PanelEx54: TPanelEx
        Left = 1018
        Top = 1042
        Width = 643
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
        object HTTPPortLabel: TShadowLabel
          Left = 466
          Top = 45
          Width = 38
          Height = 31
          Caption = 'Port'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object HTTPPathLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 210
          Height = 31
          Caption = 'Root Path to Web Files'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel85: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
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
        object HTTPPort: TEditEx
          Left = 466
          Top = 81
          Width = 90
          Height = 36
          Hint = 'HTTP server listener port'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          Text = '4388235'
        end
        object HTTPPath: TEditEx
          Left = 11
          Top = 81
          Width = 446
          Height = 36
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
        end
        object HTTPServerButtonReset: TBitBtnEx
          Left = 561
          Top = 81
          Width = 70
          Height = 36
          Hint = 'Reset to default values'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object HTTPServer: TAdvOfficeCheckBoxEx
          Left = 8
          Top = -2
          Width = 220
          Height = 36
          Hint = 'Enable mouse input'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'Enable HTTP Server'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
      end
      object PanelEx56: TPanelEx
        Left = 16
        Top = 882
        Width = 309
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
        object ShadowLabel87: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'OSD Output Options'
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
        object OSDOutputProviderLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 149
          Height = 31
          Caption = 'Output Provider'
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
        object OSDOutputProvider: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 289
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
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Console'
            'Network'
            'Windows'
            'None')
          CaptionVertIndent = -1
        end
      end
      object PanelEx57: TPanelEx
        Left = 16
        Top = 528
        Width = 309
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
        object ShadowLabel88: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Coin Impulse Time'
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
        object CoinImpulse: TComboBox2Ex
          Left = 10
          Top = 45
          Width = 287
          Height = 36
          Hint = 'Set coin impulse time'
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
          TabOrder = 0
          Text = 'Obbey Driver'
          Items.Strings = (
            'Disabled'
            'Obbey Driver'
            '1 second'
            '2 seconds'
            '3 seconds'
            '4 seconds'
            '5 seconds'
            '6 seconds'
            '7 seconds'
            '8 seconds'
            '9 seconds'
            '10 seconds')
          CaptionVertIndent = -1
        end
      end
      object PanelEx58: TPanelEx
        Left = 350
        Top = 528
        Width = 309
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
        object ShadowLabel89: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Controller Definitions'
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
        object ControllerDefinitions: TComboBox2Ex
          Left = 10
          Top = 45
          Width = 287
          Height = 36
          Hint = 'Pre-configure for specified controller'
          Style = csOwnerDrawFixed
          DropDownCount = 20
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
          Text = '(None)'
          Items.Strings = (
            '(None)')
          CaptionVertIndent = -1
        end
      end
      object PanelEx55: TPanelEx
        Left = 16
        Top = 646
        Width = 643
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
        object ShadowLabel86: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'OSD Input Options'
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
        object OSDInputJoystickProviderLabel: TShadowLabel
          Left = 333
          Top = 127
          Width = 154
          Height = 31
          Caption = 'Joystick Provider'
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
        object OSDInputLightgunProviderLabel: TShadowLabel
          Left = 333
          Top = 45
          Width = 165
          Height = 31
          Caption = 'Lightgun Provider'
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
        object OSDInputKeyboardProviderLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 170
          Height = 31
          Caption = 'Keyboard Provider'
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
        object OSDInputMouseProviderLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 146
          Height = 31
          Caption = 'Mouse Provider'
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
        object OSDInputJoystickProvider: TComboBox2Ex
          Left = 333
          Top = 163
          Width = 298
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
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'DirectInput'
            'XInput'
            'Hybrid DInput/XInput'
            'UWP (Windows 10)'
            'None')
          CaptionVertIndent = -1
        end
        object OSDInputLightgunProvider: TComboBox2Ex
          Left = 333
          Top = 81
          Width = 298
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
          TabOrder = 1
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Win32 Input'
            'None')
          CaptionVertIndent = -1
        end
        object OSDInputKeyboardProvider: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 298
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
          TabOrder = 2
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Raw Input'
            'DirectInput'
            'Win32 Input'
            'UWP (Windows 10)'
            'None')
          CaptionVertIndent = -1
        end
        object OSDInputMouseProvider: TComboBox2Ex
          Left = 10
          Top = 163
          Width = 298
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
          TabOrder = 3
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Raw Input'
            'DirectInput'
            'Win32 Input'
            'None')
          CaptionVertIndent = -1
        end
      end
      object PanelEx46: TPanelEx
        Left = 1018
        Top = 16
        Width = 643
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
        object ShadowLabel71: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Automatic Device Selection [Analog Controls]'
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
        object Analog_PaddleLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 63
          Height = 31
          Caption = 'Paddle'
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
        object Analog_JoystickLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 144
          Height = 31
          Caption = 'Analog Joystick'
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
        object Analog_LightGunLabel: TShadowLabel
          Left = 332
          Top = 208
          Width = 91
          Height = 31
          Caption = 'Light Gun'
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
        object Analog_PedalLabel: TShadowLabel
          Left = 332
          Top = 45
          Width = 51
          Height = 31
          Caption = 'Pedal'
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
        object Analog_DialLabel: TShadowLabel
          Left = 332
          Top = 127
          Width = 37
          Height = 31
          Caption = 'Dial'
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
        object Analog_TrackballLabel: TShadowLabel
          Left = 332
          Top = 289
          Width = 81
          Height = 31
          Caption = 'Trackball'
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
        object Analog_PositionalLabel: TShadowLabel
          Left = 10
          Top = 208
          Width = 90
          Height = 31
          Caption = 'Positional'
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
        object Analog_MouseLabel: TShadowLabel
          Left = 10
          Top = 289
          Width = 64
          Height = 31
          Caption = 'Mouse'
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
        object Analog_Paddle: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 298
          Height = 36
          Hint = 'Enable it if a paddle control is present'
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
          TabOrder = 0
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Joystick: TComboBox2Ex
          Left = 10
          Top = 162
          Width = 298
          Height = 36
          Hint = 'Enable it if an analog joystick control is present'
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
          TabOrder = 1
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_LightGun: TComboBox2Ex
          Left = 333
          Top = 243
          Width = 298
          Height = 36
          Hint = 'Enable it if a lightgun control is present'
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
          TabOrder = 2
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Pedal: TComboBox2Ex
          Left = 333
          Top = 81
          Width = 298
          Height = 36
          Hint = 'Enable it if a pedal control is present'
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
          TabOrder = 3
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Dial: TComboBox2Ex
          Left = 333
          Top = 162
          Width = 298
          Height = 36
          Hint = 'Enable it if a dial control is present'
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
          TabOrder = 4
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Trackball: TComboBox2Ex
          Left = 333
          Top = 325
          Width = 298
          Height = 36
          Hint = 'Enable it if a trackball control is present'
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
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Positional: TComboBox2Ex
          Left = 10
          Top = 243
          Width = 298
          Height = 36
          Hint = 'Enable it if a positional control is present'
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
          TabOrder = 6
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
        object Analog_Mouse: TComboBox2Ex
          Left = 10
          Top = 325
          Width = 298
          Height = 36
          Hint = 'Enable it if a mouse control is present'
          Style = csOwnerDrawFixed
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 2
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Text = 'Mouse'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
          CaptionVertIndent = -1
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Miscellaneous'
      object SkipGameInfo: TAdvOfficeCheckBoxEx
        Left = 380
        Top = 164
        Width = 175
        Height = 36
        Hint = 'Skip displaying the system information screen at startup'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
      object ReadConfigFiles: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 164
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
        TabOrder = 1
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
      object WriteConfigFiles: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 210
        Width = 200
        Height = 36
        Hint = 'Write configuration to (driver).ini on exit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Write Config Files'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Cheat: TAdvOfficeCheckBoxEx
        Left = 380
        Top = 256
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
      object ConfirmQuit: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 256
        Width = 155
        Height = 36
        Hint = 'Ask for confirmation before exiting'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Confirm Quit'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DRC: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 450
        Width = 240
        Height = 36
        Hint = 'Enable DRC CPU core if available'
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
        Caption = 'Enable DRC CPU Core'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DRCUseC: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 496
        Width = 305
        Height = 36
        Hint = 'Force DRC to use C backend'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = False
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Force DRC To Use C Backend'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DRCLogUML: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 542
        Width = 345
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Write DRC UML Disassembly Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object DRCLogNative: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 588
        Width = 360
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Write DRC Native Disassembly Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SaveNVRAMOnExit: TAdvOfficeCheckBoxEx
        Left = 380
        Top = 300
        Width = 230
        Height = 36
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
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
        Caption = 'Save NVRAM on Exit'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AutoSave: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 16
        Width = 180
        Height = 36
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Auto Save State'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EnableSaveStateRewind: TAdvOfficeCheckBoxEx
        Left = 380
        Top = 16
        Width = 275
        Height = 36
        Hint = 'Enable rewind save states'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enable Save State Rewind'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SkipMandatoryFileMan: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 302
        Width = 350
        Height = 36
        Hint = 
          'Skip prompting the user for any mandatory images with the file m' +
          'anager at startup'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Skip Mandatory Images at Startup'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SkipWarnings: TAdvOfficeCheckBoxEx
        Left = 380
        Top = 210
        Width = 165
        Height = 36
        Hint = 'Display fewer repeated warnings about imperfect emulation'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Skip Warnings'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object PanelEx40: TPanelEx
        Left = 1018
        Top = 832
        Width = 643
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
        object ShadowLabel65: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
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
        object DebugGroupBox: TAdvGroupBoxEx
          Left = 0
          Top = 0
          Width = 638
          Height = 334
          BorderStyle = bsAdvNone
          CheckBox.Action = caNone
          CheckBox.Hint = 'Enable/disable debugger'
          CheckBox.Visible = True
          CheckBox.CustomIconsEnabled = False
          CheckBox.CustomEnableIconHD = True
          CheckBox.CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CheckBox.CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          CheckBox.CaptionVertIndent = -1
          RoundEdges = True
          Caption = 'Enable Debugger'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = True
          ParentFont = False
          TabOrder = 0
          object DebuggerScriptLabel: TShadowLabel
            Left = 10
            Top = 255
            Width = 151
            Height = 31
            Caption = 'Debugger Script'
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
          object WatchdogLabel: TShadowLabel
            Left = 333
            Top = 91
            Width = 96
            Height = 31
            Hint = 
              'Creates new thread that kills the application after a few second' +
              's'
            Caption = 'Watchdog'
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
          object DebuggerLabel: TShadowLabel
            Left = 333
            Top = 173
            Width = 160
            Height = 31
            Caption = 'Debugger To Use'
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
          object WatchdogSecsLabel: TShadowLabel
            Left = 438
            Top = 129
            Width = 40
            Height = 31
            Hint = 
              'Creates new thread that kills the application after a few second' +
              's'
            Caption = 'secs'
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
          object ShadowLabel1: TShadowLabel
            Left = 466
            Top = 255
            Width = 38
            Height = 31
            Caption = 'Port'
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
          object DebuggerFont: TShadowLabel
            Left = 10
            Top = 200
            Width = 223
            Height = 46
            Hint = 'Lucida Console [Auto]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Font'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clGray
            ColorInnerFrame = clBlack
            Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
            Transparent = False
            Layout = tlCenter
          end
          object DebuggerFontSizeLabel: TShadowLabel
            Left = 10
            Top = 91
            Width = 148
            Height = 31
            AutoSize = False
            Caption = 'Font Size [Auto]'
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
          object Log: TAdvOfficeCheckBoxEx
            Left = 456
            Top = 45
            Width = 70
            Height = 36
            Hint = 'Generate an error.log file'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Log'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object OSLog: TAdvOfficeCheckBoxEx
            Left = 539
            Top = 45
            Width = 99
            Height = 36
            Hint = 
              'Output error.log data to system diagnostic output (debugger or s' +
              'tandard error)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'OS Log'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object Verbose: TAdvOfficeCheckBoxEx
            Left = 10
            Top = 45
            Width = 110
            Height = 36
            Hint = 'Display additional diagnostic information'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Verbose'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object UpdateInPause: TAdvOfficeCheckBoxEx
            Left = 133
            Top = 45
            Width = 185
            Height = 36
            Hint = 'Keep calling video updates while in pause'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Update In Pause'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object DebuggerScript: TEditEx
            Left = 10
            Top = 291
            Width = 372
            Height = 36
            Hint = 'Script for debugger'
            TabStop = False
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object DebuggerScriptButtonSelect: TBitBtnEx
            Left = 387
            Top = 291
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
          object Watchdog: TEditEx
            Left = 333
            Top = 127
            Width = 100
            Height = 36
            Hint = 
              'Creates new thread that kills the application after a few second' +
              's'
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Text = '2500000'
          end
          object Debugger: TComboBox2Ex
            Left = 333
            Top = 209
            Width = 298
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
            TabOrder = 7
            Text = 'Auto'
            Items.Strings = (
              'Auto'
              'Internal'
              'Windows'
              'None')
          end
          object DebuggerPort: TEditEx
            Left = 466
            Top = 291
            Width = 90
            Height = 36
            Hint = 'Port to use for GDB stub debugger'
            TabStop = False
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
          object DebuggerPortButtonReset: TBitBtnEx
            Left = 561
            Top = 291
            Width = 70
            Height = 36
            Hint = 'Click here to use the default port'
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
          object DebugLogConsole: TAdvOfficeCheckBoxEx
            Left = 333
            Top = 45
            Width = 105
            Height = 36
            Hint = 'Write debug console output to debug.log'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            Alignment = taLeftJustify
            ButtonVertAlign = tlCenter
            Caption = 'Console'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
            CustomEnableIconHD = True
            CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
            CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          end
          object DebuggerFontButtonReset: TBitBtnEx
            Left = 238
            Top = 127
            Width = 70
            Height = 36
            Hint = 'Click here to reset to default'
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
          end
          object DebuggerFontSize: TGaugeBar
            Left = 10
            Top = 127
            Width = 223
            Height = 36
            Color = clWhite
            Backgnd = bgPattern
            ButtonSize = 30
            LargeChange = 4
            Max = 48
            Min = -1
            ShowHint = False
            ShowHandleGrip = True
            Position = 0
          end
        end
      end
      object PanelEx52: TPanelEx
        Left = 16
        Top = 634
        Width = 309
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
        object ShadowLabel83: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'RAM Size (if supported by drivefr)'
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
        object ShadowLabel98: TShadowLabel
          Left = 10
          Top = 45
          Width = 243
          Height = 31
          Caption = 'Select a Size For The RAM'
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
        object ComboBox2Ex25: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 287
          Height = 36
          Hint = 'Type of user interface'
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 1
          ParentFont = False
          TabOrder = 0
          Text = 'Cabinet'
          Items.Strings = (
            'Simple'
            'Cabinet')
        end
      end
      object PanelEx59: TPanelEx
        Left = 16
        Top = 348
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
        object ShadowLabel95: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Save State Name'
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
        object EditEx49: TEditEx
          Left = 10
          Top = 45
          Width = 546
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
        object BitBtnEx60: TBitBtnEx
          Left = 561
          Top = 45
          Width = 70
          Height = 36
          Hint = 'Click here to select a folder'
          Caption = 'Reset'
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
      object PanelEx60: TPanelEx
        Left = 16
        Top = 62
        Width = 977
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
        object ShadowLabel96: TShadowLabel
          Left = 0
          Top = 0
          Width = 975
          Height = 35
          Hint = 'Rewind Buffer Size [%u MegaBytes]'
          Align = alTop
          AutoSize = False
          Caption = 'Rewind Buffer Size [100 MegaBytes]'
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
        object SaveStateRewindBufferSize: TGaugeBar
          Left = 10
          Top = 45
          Width = 955
          Height = 36
          Hint = 'Rewind buffer size in megabytes'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 30
          LargeChange = 5
          Max = 2048
          Min = 1
          ShowHandleGrip = True
          Position = 100
        end
      end
      object PanelEx61: TPanelEx
        Left = 1018
        Top = 16
        Width = 643
        Height = 791
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
        object ShadowLabel97: TShadowLabel
          Left = 0
          Top = 0
          Width = 641
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Select the System BIOS to Use'
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
        object BiosSetsListView: TEasyListview
          Left = 10
          Top = 45
          Width = 623
          Height = 734
          BackGround.Enabled = True
          CellSizes.Report.Height = 32
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
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            000600000080080001010001000000000000006F010000FFFFFF1F0001000000
            010000001B00000053006500740020005400690074006C006500200028006400
            65006600610075006C007400200069006E00200062006F006C00640029000000
            00000000000000000000110000005445617379436F6C756D6E53746F726564FF
            FECE00060000008008000101000101000000000000FA000000FFFFFF1F000100
            0000010000000800000053006500740020004E0061006D006500000000000000
            000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
            00000080000001010001020000000000015F000000FFFFFF1F00010000000100
            00001000000050006100720065006E0074002000420069006F00730020004E00
            61006D006500000000000000000000000000110000005445617379436F6C756D
            6E53746F726564FFFECE000600000080000001010001030000000000012D0000
            00FFFFFF1F0001000000010000000B000000440065006600610075006C007400
            2000530065007400000000000000000000000000}
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
          ImagesSmall = FormMain.IL_MenuPopup
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
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
      end
      object PanelEx64: TPanelEx
        Left = 684
        Top = 180
        Width = 309
        Height = 991
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
        object ShadowLabel100: TShadowLabel
          Left = 0
          Top = 0
          Width = 307
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'User Interface Language'
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
        object ShadowLabel142: TShadowLabel
          Left = 10
          Top = 45
          Width = 165
          Height = 31
          Caption = 'Display Language'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel143: TShadowLabel
          Left = 10
          Top = 745
          Width = 271
          Height = 31
          Caption = 'Type of User Interface To Use'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel144: TShadowLabel
          Left = 10
          Top = 826
          Width = 283
          Height = 31
          Caption = 'Frovider For UI Font Rendering'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ShadowLabel99: TShadowLabel
          Left = 10
          Top = 907
          Width = 283
          Height = 31
          Caption = 'Frovider For UI Font Rendering'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object DisplayLanguageList: TEasyListview
          Left = 10
          Top = 81
          Width = 287
          Height = 648
          BackGround.Enabled = True
          CellSizes.Report.Height = 32
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          Enabled = False
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
            64FFFECE000600000080080100000015000000440069007300610062006C0065
            002000460075006C006C0052006F007700530065006C00650063007400000000
            00000000000000000000000000000000000F00000054456173794974656D5374
            6F726564FFFECE00060000008008010000001400000074006F00200066006900
            78002000730065006C0065006300740069006F006E0020006200610072000000
            0000000000000000000000000000000000000F00000054456173794974656D53
            746F726564FFFECE0006000000800801000000140000006F006E002000730069
            006E0067006C006500200063006F006C0075006D006E00200045004C00560000
            0000000000000000000000000000000000000000000000000000000000000000
            000000}
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
            000600000080080001010001000000000000001B010000FFFFFF1F0001000000
            010000001A0000004C0061006E00670075006100670065002000280064006500
            6600610075006C007400200069006E00200062006F006C006400290000000000
            0000000000000000}
          Header.Draggable = False
          Header.FixedSingleColumn = True
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -21
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 38
          Header.Sizeable = False
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          ImagesSmall = FormMain.IL_MenuPopup
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
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
          Selection.RoundRectRadius = 2
          Selection.TextColor = clBlack
          Selection.UseFocusRect = False
          TabOrder = 0
          View = elsReport
          CustomCheckRadioEnabled = False
          CustomEnableIconHD = False
        end
        object TypeUserInterface: TComboBox2Ex
          Left = 10
          Top = 781
          Width = 287
          Height = 36
          Hint = 'Type of user interface'
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 1
          ParentFont = False
          TabOrder = 1
          Text = 'Cabinet'
          Items.Strings = (
            'Simple'
            'Cabinet')
        end
        object UIFontProvider: TComboBox2Ex
          Left = 10
          Top = 862
          Width = 287
          Height = 36
          Hint = 'Provider for user interface font'
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 2
          ParentFont = False
          TabOrder = 2
          Text = 'Windows'
          Items.Strings = (
            'Auto'
            'None'
            'Windows'
            'SDL'
            'OSX')
        end
        object BitBtnEx74: TBitBtnEx
          Left = 227
          Top = 943
          Width = 70
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
          TabOrder = 3
          CaptionVertIndent = -1
        end
        object EditEx62: TEditEx
          Left = 10
          Top = 943
          Width = 212
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
          TabOrder = 4
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'SDL'
      object SDLVideoPerformance: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 361
        Width = 310
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show SDL Video Performance'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SDLSplitFullScreenMonitors: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 407
        Width = 400
        Height = 36
        Hint = 'Multi-monitors (X11 only)'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Split Full Screen Image Across Monitors'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object PanelEx65: TPanelEx
        Left = 16
        Top = 692
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
        object ShadowLabel101: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Attach To Arbitrary Window'
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
        object SDLAttachWindowButtonClear: TBitBtnEx
          Left = 450
          Top = 45
          Width = 70
          Height = 36
          Hint = 'Click here to select a font'
          Caption = 'Clear'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          CaptionVertIndent = -1
        end
        object SDLAttachWindow: TEditEx
          Left = 10
          Top = 45
          Width = 435
          Height = 36
          Hint = 'Specify a font to use'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object PanelEx68: TPanelEx
        Left = 16
        Top = 16
        Width = 532
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
        object ShadowLabel104: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
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
        object SDKKeyboardMappingGroupBox: TAdvGroupBoxEx
          Left = 0
          Top = 0
          Width = 528
          Height = 125
          BorderStyle = bsAdvNone
          CheckBox.Visible = True
          CheckBox.CustomIconsEnabled = False
          CheckBox.CustomEnableIconHD = True
          CheckBox.CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CheckBox.CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
          CheckBox.CaptionVertIndent = -1
          RoundEdges = True
          Caption = 'Enable SDL Keyboard Mapping'
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object SDLKeymapFilenameLabel: TShadowLabel
            Left = 10
            Top = 45
            Width = 164
            Height = 31
            Caption = 'Keymap Filename'
            Enabled = False
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object SDLKeymapFilename: TEditEx
            Left = 10
            Top = 81
            Width = 362
            Height = 36
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            Enabled = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object SDLKeymapFilenameButtonSelect: TBitBtnEx
            Left = 377
            Top = 81
            Width = 70
            Height = 36
            Hint = 'Click here to disable this feature'
            Caption = 'Select'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            CaptionVertIndent = -1
          end
          object SDLKeymapFilenameButtonReset: TBitBtnEx
            Left = 450
            Top = 81
            Width = 70
            Height = 36
            Hint = 'Click here to reset filename to default'
            Caption = 'Reset'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            CaptionVertIndent = -1
          end
        end
      end
      object PanelEx71: TPanelEx
        Left = 16
        Top = 170
        Width = 532
        Height = 175
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
        object ShadowLabel107: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Output Mode'
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
        object SDLScaleModeLabel: TShadowLabel
          Left = 10
          Top = 91
          Width = 346
          Height = 31
          Caption = 'Scale Mode (Software Renderer Only)'
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
        object SDLCenterHorizontally: TAdvOfficeCheckBoxEx
          Left = 10
          Top = 45
          Width = 215
          Height = 36
          Hint = 'Center horizontally within the view area'
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
          Caption = 'Center Horizontally'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object SDLCenterVertically: TAdvOfficeCheckBoxEx
          Left = 343
          Top = 45
          Width = 185
          Height = 36
          Hint = 'Center vertically within the view area'
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
          Caption = 'Center Vertically'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
          CustomEnableIconHD = True
          CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
          CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
        end
        object SDLScaleMode: TComboBox2Ex
          Left = 10
          Top = 127
          Width = 510
          Height = 36
          Style = csOwnerDrawFixed
          Color = clWhite
          DropDownCount = 20
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'None'
          Items.Strings = (
            'None'
            'Async'
            'YV12'
            'YUY2'
            'YV12x2'
            'YUY2x2'
            'Hardware Blit (SDL 2)'
            'Hardware Best (SDL 2)')
          CaptionVertIndent = -1
        end
      end
      object PanelEx72: TPanelEx
        Left = 16
        Top = 456
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
        object ShadowLabel108: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'SDL Low Level Driver'
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
        object SDLVideoDriverToUseLabel: TShadowLabel
          Left = 10
          Top = 45
          Width = 157
          Height = 31
          Caption = 'SDL Video Driver'
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
        object SDL2RenderDriverToUseLabel: TShadowLabel
          Left = 185
          Top = 45
          Width = 169
          Height = 31
          Caption = 'SDL Render Driver'
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
        object SDLAudioDriverToUseLabel: TShadowLabel
          Left = 360
          Top = 45
          Width = 159
          Height = 31
          Caption = 'SDL Audio Driver'
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
        object SDLAlternativeLibGLToUseLabel: TShadowLabel
          Left = 10
          Top = 127
          Width = 438
          Height = 31
          Caption = 'Alternative libGL.so to use; '#39'auto'#39' is SDL default'
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
        object BitBtnEx59: TBitBtnEx
          Left = 450
          Top = 163
          Width = 70
          Height = 36
          Hint = 'Click here to select a font'
          Caption = 'Select'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          CaptionVertIndent = -1
        end
        object EditEx92: TEditEx
          Left = 125
          Top = 163
          Width = 320
          Height = 36
          Hint = 'Specify a font to use'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object SDLVideoDriverToUse: TComboBox2Ex
          Left = 10
          Top = 81
          Width = 160
          Height = 36
          Style = csOwnerDrawFixed
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'X11'
            'DirectFB')
          CaptionVertIndent = -1
        end
        object SDL2RenderDriverToUse: TComboBox2Ex
          Left = 185
          Top = 81
          Width = 160
          Height = 36
          Style = csOwnerDrawFixed
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Software'
            'OpenGL'
            'DirectFB')
          CaptionVertIndent = -1
        end
        object SDLAudioDriverToUse: TComboBox2Ex
          Left = 360
          Top = 81
          Width = 160
          Height = 36
          Style = csOwnerDrawFixed
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Alsa'
            'Arts')
          CaptionVertIndent = -1
        end
        object SDLAlternativeLibGLToUse: TComboBox2Ex
          Left = 10
          Top = 163
          Width = 105
          Height = 36
          Style = csOwnerDrawFixed
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 30
          ItemIndex = 1
          ParentFont = False
          TabOrder = 5
          Text = 'Custom'
          Items.Strings = (
            'Auto'
            'Custom')
          CaptionVertIndent = -1
        end
      end
      object PanelEx74: TPanelEx
        Left = 1129
        Top = 16
        Width = 532
        Height = 415
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
        object ShadowLabel120: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Mouse Mapping (SDL 2)'
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
        object ShadowLabel122: TShadowLabel
          Left = 10
          Top = 47
          Width = 24
          Height = 31
          Caption = '#1'
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
        object ShadowLabel123: TShadowLabel
          Left = 10
          Top = 93
          Width = 24
          Height = 31
          Caption = '#2'
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
        object ShadowLabel124: TShadowLabel
          Left = 10
          Top = 139
          Width = 24
          Height = 31
          Caption = '#3'
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
        object ShadowLabel125: TShadowLabel
          Left = 10
          Top = 185
          Width = 24
          Height = 31
          Caption = '#4'
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
        object ShadowLabel126: TShadowLabel
          Left = 10
          Top = 231
          Width = 24
          Height = 31
          Caption = '#5'
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
        object ShadowLabel127: TShadowLabel
          Left = 10
          Top = 277
          Width = 24
          Height = 31
          Caption = '#6'
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
        object ShadowLabel128: TShadowLabel
          Left = 10
          Top = 323
          Width = 24
          Height = 31
          Caption = '#7'
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
        object ShadowLabel129: TShadowLabel
          Left = 10
          Top = 369
          Width = 24
          Height = 31
          Caption = '#8'
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
        object EditEx72: TEditEx
          Left = 221
          Top = 91
          Width = 299
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
          TabOrder = 1
        end
        object EditEx73: TEditEx
          Left = 221
          Top = 137
          Width = 299
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
          TabOrder = 2
        end
        object EditEx74: TEditEx
          Left = 221
          Top = 183
          Width = 299
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
          TabOrder = 3
        end
        object EditEx75: TEditEx
          Left = 221
          Top = 229
          Width = 299
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
          TabOrder = 4
        end
        object EditEx76: TEditEx
          Left = 221
          Top = 275
          Width = 299
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
          TabOrder = 5
        end
        object EditEx77: TEditEx
          Left = 221
          Top = 321
          Width = 299
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
          TabOrder = 6
        end
        object EditEx78: TEditEx
          Left = 221
          Top = 367
          Width = 299
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
          TabOrder = 7
        end
        object EditEx71: TEditEx
          Left = 221
          Top = 45
          Width = 299
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
        object SDL2MouseMapping1: TComboBox2Ex
          Left = 43
          Top = 45
          Width = 168
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
          TabOrder = 8
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping2: TComboBox2Ex
          Left = 43
          Top = 91
          Width = 168
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
          TabOrder = 9
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping3: TComboBox2Ex
          Left = 43
          Top = 137
          Width = 168
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
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping4: TComboBox2Ex
          Left = 43
          Top = 183
          Width = 168
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
          TabOrder = 11
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping5: TComboBox2Ex
          Left = 43
          Top = 229
          Width = 168
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
          TabOrder = 12
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping6: TComboBox2Ex
          Left = 43
          Top = 275
          Width = 168
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
          TabOrder = 13
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping7: TComboBox2Ex
          Left = 43
          Top = 321
          Width = 168
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
          TabOrder = 14
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object SDL2MouseMapping8: TComboBox2Ex
          Left = 43
          Top = 367
          Width = 168
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
          TabOrder = 15
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
      end
      object PanelEx73: TPanelEx
        Left = 573
        Top = 16
        Width = 532
        Height = 415
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
        object ShadowLabel109: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Keyboard Mapping (SDL 2)'
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
        object ShadowLabel110: TShadowLabel
          Left = 10
          Top = 47
          Width = 24
          Height = 31
          Caption = '#1'
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
        object ShadowLabel111: TShadowLabel
          Left = 10
          Top = 93
          Width = 24
          Height = 31
          Caption = '#2'
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
        object ShadowLabel112: TShadowLabel
          Left = 10
          Top = 139
          Width = 24
          Height = 31
          Caption = '#3'
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
        object ShadowLabel113: TShadowLabel
          Left = 10
          Top = 185
          Width = 24
          Height = 31
          Caption = '#4'
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
        object ShadowLabel114: TShadowLabel
          Left = 10
          Top = 231
          Width = 24
          Height = 31
          Caption = '#5'
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
        object ShadowLabel115: TShadowLabel
          Left = 10
          Top = 277
          Width = 24
          Height = 31
          Caption = '#6'
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
        object ShadowLabel116: TShadowLabel
          Left = 10
          Top = 323
          Width = 24
          Height = 31
          Caption = '#7'
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
        object ShadowLabel117: TShadowLabel
          Left = 10
          Top = 369
          Width = 24
          Height = 31
          Caption = '#8'
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
        object EditEx46: TEditEx
          Left = 221
          Top = 91
          Width = 299
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
          TabOrder = 1
        end
        object EditEx58: TEditEx
          Left = 221
          Top = 137
          Width = 299
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
          TabOrder = 2
        end
        object EditEx61: TEditEx
          Left = 221
          Top = 183
          Width = 299
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
          TabOrder = 3
        end
        object EditEx63: TEditEx
          Left = 221
          Top = 229
          Width = 299
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
          TabOrder = 4
        end
        object EditEx64: TEditEx
          Left = 221
          Top = 275
          Width = 299
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
          TabOrder = 5
        end
        object EditEx65: TEditEx
          Left = 221
          Top = 321
          Width = 299
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
          TabOrder = 6
        end
        object EditEx66: TEditEx
          Left = 221
          Top = 367
          Width = 299
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
          TabOrder = 7
        end
        object EditEx67: TEditEx
          Left = 221
          Top = 45
          Width = 299
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
        object ComboBox2Ex1: TComboBox2Ex
          Left = 43
          Top = 45
          Width = 168
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
          TabOrder = 8
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex2: TComboBox2Ex
          Left = 43
          Top = 91
          Width = 168
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
          TabOrder = 9
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex3: TComboBox2Ex
          Left = 43
          Top = 137
          Width = 168
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
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex4: TComboBox2Ex
          Left = 43
          Top = 183
          Width = 168
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
          TabOrder = 11
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex5: TComboBox2Ex
          Left = 43
          Top = 229
          Width = 168
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
          TabOrder = 12
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex6: TComboBox2Ex
          Left = 43
          Top = 275
          Width = 168
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
          TabOrder = 13
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex7: TComboBox2Ex
          Left = 43
          Top = 321
          Width = 168
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
          TabOrder = 14
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex8: TComboBox2Ex
          Left = 43
          Top = 367
          Width = 168
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
          TabOrder = 15
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
      end
      object PanelEx66: TPanelEx
        Left = 573
        Top = 456
        Width = 532
        Height = 415
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
        object ShadowLabel102: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Joystick Mapping                                             '
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
        object ShadowLabel103: TShadowLabel
          Left = 10
          Top = 47
          Width = 24
          Height = 31
          Caption = '#1'
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
        object ShadowLabel105: TShadowLabel
          Left = 10
          Top = 93
          Width = 24
          Height = 31
          Caption = '#2'
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
        object ShadowLabel106: TShadowLabel
          Left = 10
          Top = 139
          Width = 24
          Height = 31
          Caption = '#3'
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
        object ShadowLabel118: TShadowLabel
          Left = 10
          Top = 185
          Width = 24
          Height = 31
          Caption = '#4'
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
        object ShadowLabel119: TShadowLabel
          Left = 10
          Top = 231
          Width = 24
          Height = 31
          Caption = '#5'
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
        object ShadowLabel121: TShadowLabel
          Left = 10
          Top = 277
          Width = 24
          Height = 31
          Caption = '#6'
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
        object ShadowLabel130: TShadowLabel
          Left = 10
          Top = 323
          Width = 24
          Height = 31
          Caption = '#7'
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
        object ShadowLabel131: TShadowLabel
          Left = 10
          Top = 369
          Width = 24
          Height = 31
          Caption = '#8'
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
        object EditEx68: TEditEx
          Left = 221
          Top = 91
          Width = 299
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
          TabOrder = 1
        end
        object EditEx69: TEditEx
          Left = 221
          Top = 137
          Width = 299
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
          TabOrder = 2
        end
        object EditEx70: TEditEx
          Left = 221
          Top = 183
          Width = 299
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
          TabOrder = 3
        end
        object EditEx79: TEditEx
          Left = 221
          Top = 229
          Width = 299
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
          TabOrder = 4
        end
        object EditEx80: TEditEx
          Left = 221
          Top = 275
          Width = 299
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
          TabOrder = 5
        end
        object EditEx81: TEditEx
          Left = 221
          Top = 321
          Width = 299
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
          TabOrder = 6
        end
        object EditEx82: TEditEx
          Left = 221
          Top = 367
          Width = 299
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
          TabOrder = 7
        end
        object EditEx83: TEditEx
          Left = 221
          Top = 45
          Width = 299
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
        object ComboBox2Ex9: TComboBox2Ex
          Left = 43
          Top = 45
          Width = 168
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
          TabOrder = 8
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex10: TComboBox2Ex
          Left = 43
          Top = 91
          Width = 168
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
          TabOrder = 9
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex11: TComboBox2Ex
          Left = 43
          Top = 137
          Width = 168
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
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex12: TComboBox2Ex
          Left = 43
          Top = 183
          Width = 168
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
          TabOrder = 11
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex13: TComboBox2Ex
          Left = 43
          Top = 229
          Width = 168
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
          TabOrder = 12
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex14: TComboBox2Ex
          Left = 43
          Top = 275
          Width = 168
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
          TabOrder = 13
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex15: TComboBox2Ex
          Left = 43
          Top = 321
          Width = 168
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
          TabOrder = 14
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex16: TComboBox2Ex
          Left = 43
          Top = 367
          Width = 168
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
          TabOrder = 15
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object PS3SixaxisControllers: TAdvOfficeCheckBoxEx
          Left = 294
          Top = -2
          Width = 232
          Height = 36
          Hint = 'Use special handling for PS3 Sixaxis controllers'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          Alignment = taLeftJustify
          ButtonVertAlign = tlCenter
          Caption = 'PS3 Sixaxis Controller'
          ReturnIsTab = False
          CustomIconsEnabled = False
          CustomEnableIconHD = True
        end
      end
      object PanelEx67: TPanelEx
        Left = 1129
        Top = 456
        Width = 532
        Height = 415
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
        object ShadowLabel132: TShadowLabel
          Left = 0
          Top = 0
          Width = 530
          Height = 35
          Align = alTop
          AutoSize = False
          Caption = 'Lightgun Mapping (XInput)'
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
        object ShadowLabel133: TShadowLabel
          Left = 10
          Top = 47
          Width = 24
          Height = 31
          Caption = '#1'
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
        object ShadowLabel134: TShadowLabel
          Left = 10
          Top = 93
          Width = 24
          Height = 31
          Caption = '#2'
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
        object ShadowLabel135: TShadowLabel
          Left = 10
          Top = 139
          Width = 24
          Height = 31
          Caption = '#3'
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
        object ShadowLabel136: TShadowLabel
          Left = 10
          Top = 185
          Width = 24
          Height = 31
          Caption = '#4'
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
        object ShadowLabel137: TShadowLabel
          Left = 10
          Top = 231
          Width = 24
          Height = 31
          Caption = '#5'
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
        object ShadowLabel138: TShadowLabel
          Left = 10
          Top = 277
          Width = 24
          Height = 31
          Caption = '#6'
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
        object ShadowLabel139: TShadowLabel
          Left = 10
          Top = 323
          Width = 24
          Height = 31
          Caption = '#7'
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
        object ShadowLabel140: TShadowLabel
          Left = 10
          Top = 369
          Width = 24
          Height = 31
          Caption = '#8'
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
        object EditEx84: TEditEx
          Left = 221
          Top = 91
          Width = 299
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
          TabOrder = 1
        end
        object EditEx85: TEditEx
          Left = 221
          Top = 137
          Width = 299
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
          TabOrder = 2
        end
        object EditEx86: TEditEx
          Left = 221
          Top = 183
          Width = 299
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
          TabOrder = 3
        end
        object EditEx87: TEditEx
          Left = 221
          Top = 229
          Width = 299
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
          TabOrder = 4
        end
        object EditEx88: TEditEx
          Left = 221
          Top = 275
          Width = 299
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
          TabOrder = 5
        end
        object EditEx89: TEditEx
          Left = 221
          Top = 321
          Width = 299
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
          TabOrder = 6
        end
        object EditEx90: TEditEx
          Left = 221
          Top = 367
          Width = 299
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
          TabOrder = 7
        end
        object EditEx91: TEditEx
          Left = 221
          Top = 45
          Width = 299
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
        object ComboBox2Ex17: TComboBox2Ex
          Left = 43
          Top = 45
          Width = 168
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
          TabOrder = 8
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex18: TComboBox2Ex
          Left = 43
          Top = 91
          Width = 168
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
          TabOrder = 9
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex19: TComboBox2Ex
          Left = 43
          Top = 137
          Width = 168
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
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex20: TComboBox2Ex
          Left = 43
          Top = 183
          Width = 168
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
          TabOrder = 11
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex21: TComboBox2Ex
          Left = 43
          Top = 229
          Width = 168
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
          TabOrder = 12
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex22: TComboBox2Ex
          Left = 43
          Top = 275
          Width = 168
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
          TabOrder = 13
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex23: TComboBox2Ex
          Left = 43
          Top = 321
          Width = 168
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
          TabOrder = 14
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
        object ComboBox2Ex24: TComboBox2Ex
          Left = 43
          Top = 367
          Width = 168
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
          TabOrder = 15
          Text = 'Custom Name'
          Items.Strings = (
            'auto'
            'Custom Name')
          CaptionVertIndent = -1
        end
      end
    end
  end
  object ButtonReadFile: TBitBtnEx
    Left = 10
    Top = 1514
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
    TabOrder = 1
    CaptionVertIndent = -1
  end
  object ButtonOk: TBitBtnEx
    Left = 1323
    Top = 1514
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
    Left = 1501
    Top = 1514
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
    CaptionVertIndent = -1
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1677
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
      Width = 1515
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
      Width = 1245
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
      Left = 1460
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
  object ButtonResetToDefault: TBitBtnEx
    Left = 191
    Top = 1514
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
    TabOrder = 5
    CaptionVertIndent = -1
  end
  object ButtonReadFileHelp: TBitBtnEx
    Left = 380
    Top = 1514
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
    TabOrder = 6
  end
  object ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx
    Left = 632
    Top = 1514
    Width = 45
    Height = 45
    Hint = 'What is this settings for ?'
    Caption = '?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx
    Left = 690
    Top = 1520
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
    TabOrder = 8
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
  object PanelEx18: TPanelEx
    Left = 884
    Top = 1392
    Width = 583
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
    object ShadowLabel19: TShadowLabel
      Left = 0
      Top = 0
      Width = 581
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = '1573 width TNotebook'
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
  end
end
