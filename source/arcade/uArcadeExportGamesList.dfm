object FormArcadeExportGamesList: TFormArcadeExportGamesList
  Left = 1132
  Top = 571
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Export MAME and Arcade Games List'
  ClientHeight = 404
  ClientWidth = 620
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object BottomBar: TPanelEx
    Left = 0
    Top = 363
    Width = 620
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonApplyAndExit: TBitBtnEx
      Left = 214
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Generate .txt file and close this dialog'
      Caption = 'Apply and Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonApplyAndExitClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 518
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close this dialog'
      Caption = 'Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
    object ButtonApply: TBitBtnEx
      Left = 311
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Generate .txt file but keep dialog open'
      Caption = 'Apply'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonApplyClick
    end
    object ButtonHelp: TBitBtnEx
      Left = 8
      Top = 8
      Width = 47
      Height = 25
      Hint = 'Gimme some instructions, please'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
  end
  object GroupExportOptionsAllGames: TAdvGroupBox
    Left = 226
    Top = 48
    Width = 193
    Height = 259
    RoundEdges = True
    Caption = 'Export All Games'
    Ctl3D = True
    TabOrder = 1
    object LabelExportOption_MAMESoftwareListGames: TShadowLabel
      Left = 23
      Top = 77
      Width = 147
      Height = 16
      Caption = '(console/computer games)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
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
    object ExportOption_ArcadeGames: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 20
      Width = 176
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Arcade Games (All Emulators)'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_NonArcadeMAMEMachines: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 40
      Width = 179
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Non-Arcade MAME Machines'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_MAMESoftwareListGames: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 60
      Width = 166
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'MAME Software List Games'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_MAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 96
      Width = 57
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'MAME'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_Supermodel3: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 116
      Width = 94
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Supermodel 3'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_Daphne: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 136
      Width = 64
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Daphne'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_Demul: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 156
      Width = 56
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Demul'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_HBMAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 176
      Width = 75
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'HBMAME'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_DICE: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 196
      Width = 47
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'DICE'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_SegaModel2: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 216
      Width = 93
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Sega Model 2'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ExportOption_ZiNc: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 236
      Width = 47
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'ZiNc'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
  end
  object GroupMAMEContentManagerPlus: TAdvGroupBox
    Left = 8
    Top = 312
    Width = 209
    Height = 45
    RoundEdges = True
    Caption = 'MAME Content Manager Plus'
    Ctl3D = True
    TabOrder = 2
    object MCMPlus_MAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 20
      Width = 57
      Height = 20
      Hint = 'Check this option to include games from MAME'
      Checked = True
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'MAME'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object MCMPlus_HBMAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 88
      Top = 20
      Width = 73
      Height = 20
      Hint = 'Check this option to include games from Homebrew MAME'
      Checked = True
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'HBMAME'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
  end
  object GroupExportOptionsGameColumnsFullFormat: TAdvGroupBox
    Left = 428
    Top = 48
    Width = 183
    Height = 309
    RoundEdges = True
    Caption = 'Game Info To Export'
    Ctl3D = True
    TabOrder = 3
    object GameInfoListToExport: TEasyListview
      Left = 8
      Top = 20
      Width = 167
      Height = 211
      BackGround.Enabled = True
      CellSizes.Report.Height = 20
      Color = clWhite
      Ctl3D = True
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        060000008108060000000A0000000F00000054456173794974656D53746F7265
        64FFFECE00060000008108010000000B000000530079007300740065006D0020
        004E0061006D0065000000000000000000000000000000000001000000FFFFFF
        FF0F00000054456173794974656D53746F726564FFFECE000600000081080100
        0000050000005400690074006C00650000000000000000000000000000000000
        01000000000000000F00000054456173794974656D53746F726564FFFECE0006
        0000008108010000000400000059006500610072000000000000000000000000
        000000000001000000010000000F00000054456173794974656D53746F726564
        FFFECE00060000008108010000000C0000004D0061006E007500660061006300
        7400750072006500720000000000000000000000000000000000010000000200
        00000F00000054456173794974656D53746F726564FFFECE0006000000810801
        00000009000000470061006D00650020004E0061006D00650000000000000000
        00000000000000000001000000080000000F00000054456173794974656D5374
        6F726564FFFECE00060000008108010000000800000043006C006F006E006500
        20006F0066000000000000000000000000000000000001000000090000000F00
        000054456173794974656D53746F726564FFFECE00060000008108010000000D
        00000053006F0066007400770061007200650020004E0061006D006500000000
        0000000000000000000000000001000000160000000F00000054456173794974
        656D53746F726564FFFECE000600000081080100000012000000530063007200
        650065006E0020004F007200690065006E0074006100740069006F006E000000
        000000000000000000000000000001000000030000000F000000544561737949
        74656D53746F726564FFFECE0006000000810801000000110000004E0075006D
        0062006500720020006F006600200050006C0061007900650072007300000000
        00000000000000000000000000010000000B0000000F00000054456173794974
        656D53746F726564FFFECE000600000081080100000008000000430061007400
        650067006F007200790000000000000000000000000000000000010000000600
        000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001A3000000FFFFFF1F0001000000
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
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.ShowBorder = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowThemedBorder = False
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
      OnItemPaintText = GameInfoListToExportItemPaintText
    end
    object GameInfoListToExport_MoveUp: TBitBtnEx
      Tag = 1
      Left = 8
      Top = 232
      Width = 40
      Height = 21
      Hint = 'Move selected info up'
      Caption = 'Up'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = GameInfoListToExport_MoveUpClick
    end
    object GameInfoListToExport_MoveDown: TBitBtnEx
      Left = 48
      Top = 232
      Width = 40
      Height = 21
      Hint = 'Move selected info down'
      Caption = 'Down'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = GameInfoListToExport_MoveUpClick
    end
    object GameInfoToExport_MicrosoftExcelFormat: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 284
      Width = 144
      Height = 20
      Hint = 
        'Generate a .txt file in a format compatible with Microsoft Excel' +
        ' import feature'
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Microsoft Excel Format'
      ReturnIsTab = False
      ShadowColor = clSilver
      Themed = True
    end
    object ButtonHelp_GameInfoToExport_MicrosoftExcelFormat: TBitBtnEx
      Left = 154
      Top = 284
      Width = 22
      Height = 18
      Hint = 'What is this settings for ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonHelp_GameInfoToExport_MicrosoftExcelFormatClick
    end
    object GameInfoListToExport_Reset: TBitBtnEx
      Left = 91
      Top = 232
      Width = 40
      Height = 21
      Hint = 'Reset info columns to last settings used'
      Caption = 'Reset'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = GameInfoListToExport_ResetClick
    end
    object GameInfoListToExport_Default: TBitBtnEx
      Left = 131
      Top = 232
      Width = 45
      Height = 21
      Hint = 'Reset info columns to default'
      Caption = 'Default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = GameInfoListToExport_DefaultClick
    end
    object GameInfoToExport_UseGamesListVisibleColumns: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 260
      Width = 152
      Height = 20
      Hint = 'Use main games list visible columns instead of columns above'
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Use Games List Columns'
      ReturnIsTab = False
      ShadowColor = clSilver
      Themed = True
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 620
    Height = 45
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSelectMode: TShadowLabel
      Left = 16
      Top = 8
      Width = 582
      Height = 30
      AutoSize = False
      Caption = 
        '     Choose the output format. Software list games require MAME ' +
        'v0.162 or higher. AntoPISA "mess.ini" file is required for non-a' +
        'rcade machines. You can customize the game info to export, "Full' +
        ' Format" only.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
  end
  object PanelExportList: TPanelEx
    Left = 8
    Top = 56
    Width = 209
    Height = 251
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object ExportList: TEasyListview
      Left = 2
      Top = 2
      Width = 205
      Height = 247
      BorderStyle = bsNone
      CellSizes.Tile.Width = 254
      CellSizes.Report.Height = 20
      Color = clWhite
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clMaroon
      GroupFont.Height = -12
      GroupFont.Name = 'Trebuchet MS'
      GroupFont.Style = []
      Groups.Items = {
        060000000300000010000000544561737947726F757053746F726564FFFECE00
        06000000810806000000030000000F00000054456173794974656D53746F7265
        64FFFECE0006000000800801000000100000004500780070006F007200740020
        0041006C006C002000470061006D006500730000000000010000000000000000
        00000000000000000000000F00000054456173794974656D53746F726564FFFE
        CE0006000000800801000000140000004500780070006F007200740020005600
        69007300690062006C0065002000470061006D00650073000000000001000000
        010000000000000000000000000000000F00000054456173794974656D53746F
        726564FFFECE0006000000800801000000150000004500780070006F00720074
        002000530065006C00650063007400650064002000470061006D006500730000
        0000000100000004000000000000000000000000000000010000000B00000046
        0075006C006C00200046006F0072006D00610074000000000001000000FFFFFF
        FF0000000010000000544561737947726F757053746F726564FFFECE00060000
        00810806000000030000000F00000054456173794974656D53746F726564FFFE
        CE0006000000800801000000100000004500780070006F007200740020004100
        6C006C002000470061006D006500730000000000010000000200000000000000
        00000000000000000F00000054456173794974656D53746F726564FFFECE0006
        000000800801000000140000004500780070006F007200740020005600690073
        00690062006C0065002000470061006D00650073000000000001000000030000
        000000000000000000000000000F00000054456173794974656D53746F726564
        FFFECE0006000000800801000000150000004500780070006F00720074002000
        530065006C00650063007400650064002000470061006D006500730000000000
        0100000005000000000000000000000000000000010000001D00000053006800
        6F0072007400200046006F0072006D00610074003A002000670061006D006500
        6E0061006D0065003D00730079007300740065006D0000000000000000000000
        000010000000544561737947726F757053746F726564FFFECE00060000008108
        06000000030000000F00000054456173794974656D53746F726564FFFECE0006
        000000800801000000100000004500780070006F0072007400200041006C006C
        002000470061006D006500730000000000010000000600000000000000000000
        00000000000F00000054456173794974656D53746F726564FFFECE0006000000
        800801000000140000004500780070006F007200740020005600690073006900
        62006C0065002000470061006D00650073000000000001000000070000000000
        000000000000000000000F00000054456173794974656D53746F726564FFFECE
        0006000000800801000000150000004500780070006F00720074002000530065
        006C00650063007400650064002000470061006D006500730000000000010000
        000800000000000000000000000000000001000000190000004D0041004D0045
        00200043006F006E00740065006E00740020004D0061006E0061006700650072
        00200050006C0075007300000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001CD000000FFFFFF1F0001000000
        010000000C0000004500780070006F007200740020005400690074006C006500
        000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Sizeable = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandColor = clGray
      PaintInfoGroup.BandColorFade = clWhite
      PaintInfoGroup.BandIndent = 5
      PaintInfoGroup.BandLength = 190
      PaintInfoGroup.BandThickness = 1
      PaintInfoGroup.CaptionIndent = 12
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 80
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      PaintInfoItem.TileDetailCount = 2
      ParentFont = False
      ParentShowHint = False
      ShowGroupMargins = True
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendAlphaImage = 0
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
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      OnItemPaintText = ExportListItemPaintText
      OnItemSelectionChanged = ExportListItemSelectionChanged
    end
  end
end
