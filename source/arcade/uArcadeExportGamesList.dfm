object FormArcadeExportGamesList: TFormArcadeExportGamesList
  Left = 1132
  Top = 571
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Export MAME and Arcade Games List'
  ClientHeight = 404
  ClientWidth = 424
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelSelectMode: TLabel
    Left = 16
    Top = 8
    Width = 393
    Height = 30
    AutoSize = False
    Caption = 
      '     Choose the output format. Software list games require MAME ' +
      'v0.162 or UME. File "mess.ini" from AntoPISA is required to excl' +
      'ude non-arcade machines.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
    WordWrap = True
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 363
    Width = 424
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 118
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Generate .txt file'
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 216
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without generating .txt file'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object ExportList: TEasyListview
    Left = 8
    Top = 56
    Width = 205
    Height = 251
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
    GroupFont.Height = -11
    GroupFont.Name = 'Tahoma'
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
      0100000005000000000000000000000000000000010000001E00000053006800
      6F0072007400200046006F0072006D006100740020002800670061006D006500
      6E0061006D0065003D00730079007300740065006D0029000000000000000000
      0000000010000000544561737947726F757053746F726564FFFECE0006000000
      810806000000030000000F00000054456173794974656D53746F726564FFFECE
      0006000000800801000000100000004500780070006F0072007400200041006C
      006C002000470061006D00650073000000000001000000060000000000000000
      000000000000000F00000054456173794974656D53746F726564FFFECE000600
      0000800801000000140000004500780070006F00720074002000560069007300
      690062006C0065002000470061006D0065007300000000000100000007000000
      0000000000000000000000000F00000054456173794974656D53746F726564FF
      FECE0006000000800801000000150000004500780070006F0072007400200053
      0065006C00650063007400650064002000470061006D00650073000000000001
      0000000800000000000000000000000000000001000000190000004D0041004D
      004500200043006F006E00740065006E00740020004D0061006E006100670065
      007200200050006C0075007300000000000000000000000000}
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001C9000000FFFFFF1F0001000000
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
    PaintInfoGroup.BandIndent = 10
    PaintInfoGroup.BandLength = 180
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 15
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
  end
  object GroupExportOptionsAllGames: TAdvGroupBox
    Left = 224
    Top = 48
    Width = 193
    Height = 259
    RoundEdges = True
    Caption = 'Export All Games Options'
    Ctl3D = True
    TabOrder = 2
    object LabelExportOption_MAMESoftwareListGames: TLabel
      Left = 23
      Top = 77
      Width = 144
      Height = 15
      Caption = '(console/computer games)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
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
      Top = 97
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
      Top = 117
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
      Height = 21
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
      Height = 21
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
      Height = 21
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
      Height = 21
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
      Height = 21
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
      Height = 21
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
    Width = 205
    Height = 45
    RoundEdges = True
    Caption = 'MAME Content Manager Plus'
    Ctl3D = True
    TabOrder = 3
    object MCMPlus_MAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 20
      Width = 57
      Height = 20
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
end
