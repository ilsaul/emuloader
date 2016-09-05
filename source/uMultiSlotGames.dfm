object FormMultiSlotGames: TFormMultiSlotGames
  Left = 612
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neo-Geo MVS (Multi Video System)'
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
  object LabelHelpText: TLabel
    Left = 196
    Top = 290
    Width = 380
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Choose the cartridge slot for each game (%u slots max)'#13'MAME v%s ' +
      'minimum required'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object GamesList: TEasyListview
    Left = 4
    Top = 4
    Width = 763
    Height = 231
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 20
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_GroupedMode
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000008000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800801010100010000000000000017000000FFFFFF1F0001000000
      00000000000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE0006000000800800010100010100000000000047010000FF
      FFFF1F000100000001000000050000005400690074006C006500000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      00000080080001010001020000000000005F000000FFFFFF1F00010000000100
      0000040000004E0061006D006500000000000000000000000000110000005445
      617379436F6C756D6E53746F726564FFFECE0006000000800800010100010300
      00000000005F000000FFFFFF1F0001000000010000000800000043006C006F00
      6E00650020006F00660000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001040000000000
      0078000000FFFFFF1F0001000000010000000600000050006C00610079006500
      6400000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010500000000000031000000FFFFFF
      1F0001000000010000000700000050006C006100790065007200730000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010600000000000023000000FFFFFF1F0001000000
      0100000004000000590065006100720000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0700000000000011000000FFFFFF1F0001000000010000000000000000000000
      0000000000000000}
    Header.Draggable = False
    Header.Height = 23
    Header.Sizeable = False
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
    OnItemPaintText = GamesListItemPaintText
    OnItemSelectionChanged = GamesListItemSelectionChanged
    OnKeyAction = GamesListKeyAction
  end
  object PanelButtons: TPanelEx
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
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 4
    Top = 242
    Width = 125
    Height = 25
    Hint = 'Move selected game to upper slot [Ctrl+Up Arrow]'
    Caption = 'Move To Upper Slot'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
    Left = 141
    Top = 242
    Width = 125
    Height = 25
    Hint = 'Move selected game to lower slot [Ctrl+Down Arrow]'
    Caption = 'Move To Lower Slot'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonUpClick
  end
  object ButtonRemoveFromList: TBitBtn
    Left = 277
    Top = 242
    Width = 125
    Height = 25
    Hint = 'Remove selected games from the list [Delete]'
    Caption = 'Remove From List'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonRemoveFromListClick
  end
end
