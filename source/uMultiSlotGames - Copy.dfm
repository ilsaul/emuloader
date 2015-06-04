object FormMultiSlotGames: TFormMultiSlotGames
  Left = 612
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neo-Geo MVS'
  ClientHeight = 402
  ClientWidth = 771
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
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GamesList: TEasyListview
    Left = 20
    Top = 4
    Width = 747
    Height = 232
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 20
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -11
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_GroupedMode
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000007000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000051010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      0001010000000000005F000000FFFFFF1F000100000001000000040000004E00
      61006D006500000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE000600000080080001010001020000000000005F0000
      00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
      6600000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010300000000000078000000FFFFFF
      1F0001000000010000000600000050006C006100790065006400000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      00000080080001010001040000000000002F000000FFFFFF1F00010000000100
      00000700000050006C0061007900650072007300000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
      010100010500000000000022000000FFFFFF1F00010000000100000004000000
      5900650061007200000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE0006000000800800010100010600000000000011
      000000FFFFFF1F00010000000100000000000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Height = 24
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsSmall
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.Size = 0
    PaintInfoGroup.MarginBottom.Visible = True
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 20
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ImageIndent = 0
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
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
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    OnColumnPaintText = GamesListColumnPaintText
    OnItemPaintText = GamesListItemPaintText
    OnItemSelectionChanged = GamesListItemSelectionChanged
  end
  object PanelSlots: TPanelEx
    Left = 4
    Top = 27
    Width = 17
    Height = 209
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 11775403
    Frames = [frLeft, frTop, frBottom]
    ParentBackground = False
    Style = vgSolid
    object Label11: TLabel
      Left = 9
      Top = 7
      Width = 7
      Height = 13
      Caption = '1'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 9
      Top = 27
      Width = 7
      Height = 13
      Caption = '2'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 9
      Top = 47
      Width = 7
      Height = 13
      Caption = '3'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 9
      Top = 67
      Width = 7
      Height = 13
      Caption = '4'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 9
      Top = 87
      Width = 7
      Height = 13
      Caption = '5'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 9
      Top = 107
      Width = 7
      Height = 13
      Caption = '6'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 9
      Top = 127
      Width = 7
      Height = 13
      Caption = '7'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 9
      Top = 147
      Width = 7
      Height = 13
      Caption = '8'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label19: TLabel
      Left = 9
      Top = 167
      Width = 7
      Height = 13
      Caption = '9'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 2
      Top = 187
      Width = 14
      Height = 13
      Caption = '10'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 361
    Width = 771
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 290
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtn
      Left = 393
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
end
