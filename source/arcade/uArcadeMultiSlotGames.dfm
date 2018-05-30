object FormArcadeMultiSlotGames: TFormArcadeMultiSlotGames
  Left = 679
  Top = 584
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neo-Geo MVS (Multi Video System)'
  ClientHeight = 736
  ClientWidth = 874
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
  object LabelHelpText: TShadowLabel
    Left = 368
    Top = 242
    Width = 380
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Choose a cartridge slot for each game (%u slots max)'#13'MAME v%s mi' +
      'nimum required'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    WordWrap = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 695
    Width = 874
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 341
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtn
      Left = 444
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 4
    Top = 242
    Width = 85
    Height = 25
    Hint = 'Move selected game to upper slot [Ctrl+Up Arrow]'
    Caption = 'Move Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
    Left = 93
    Top = 242
    Width = 85
    Height = 25
    Hint = 'Move selected game to lower slot [Ctrl+Down Arrow]'
    Caption = 'Move Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonUpClick
  end
  object ButtonRemoveFromList: TBitBtn
    Left = 182
    Top = 242
    Width = 85
    Height = 25
    Hint = 'Remove selected games from the list [Delete]'
    Caption = 'Remove'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonRemoveFromListClick
  end
  object PanelNeoGeoMVS: TPanelEx
    Left = 4
    Top = 288
    Width = 866
    Height = 31
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object LabelMultiSlotMachines: TShadowLabel
      Tag = 6
      Left = 11
      Top = 8
      Width = 395
      Height = 15
      Hint = 'neogeo'
      Caption = 'Use Machine: Neo-Geo MV-6F    1990    6-slot    [neogeo]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ButtonChangePanelNeoGeoMVS: TBitBtn
      Left = 797
      Top = 4
      Width = 65
      Height = 23
      Hint = 'Select another machine to play games with'
      Caption = 'Change'
      TabOrder = 0
      Visible = False
      OnClick = ButtonChangePanelNeoGeoMVSClick
    end
  end
  object PanelGamesList: TPanelEx
    Left = 4
    Top = 4
    Width = 866
    Height = 233
    Color1 = clSilver
    Color2 = clSilver
    Color3 = 7891291
    Color4 = 7891291
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object GamesList: TEasyListview
      Left = 2
      Top = 2
      Width = 862
      Height = 229
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
        746F726564FFFECE00060000008008000101000101000000000000AA010000FF
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
  end
  object PanelMultiSlotMachines: TPanelEx
    Left = 8
    Top = 332
    Width = 858
    Height = 287
    Color1 = 5832704
    Color2 = 1
    Color3 = 1
    Color4 = 5832704
    ColorFrame = 16750899
    ColorInnerFrame = clBlue
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object LabelMultiSlotMachinesChooseMachineToRun: TShadowLabel
      Left = 16
      Top = 251
      Width = 388
      Height = 17
      Caption = 'Choose machine to run games with, click "Ok" button'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object LabelMultiSlotMachinesBoldDefaultMachine: TShadowLabel
      Left = 506
      Top = 252
      Width = 155
      Height = 15
      Caption = 'bold is default machine'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object MultiSlotMachines: TEasyListview
      Left = 16
      Top = 14
      Width = 826
      Height = 225
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
      GroupFont.Color = clBlack
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000000C8000000FFFFFF1F0001000000
        010000000D0000004D0061006300680069006E00650020005400690074006C00
        6500000000000000000000000000110000005445617379436F6C756D6E53746F
        726564FFFECE0006000000800800010100010100000000000025000000FFFFFF
        1F00010000000100000004000000590065006100720000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        080001010001020000000000002D000000FFFFFF1F0001000000010000000500
        000053006C006F00740073000000000000000000000000001100000054456173
        79436F6C756D6E53746F726564FFFECE00060000008008000101000103000000
        00000064000000FFFFFF1F0001000000010000000D0000005600690064006500
        6F00200043006800690070007300650074000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        00010400000000000078000000FFFFFF1F000100000001000000040000004E00
        61006D006500000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000105000000000000320000
        00FFFFFF1F000100000001000000050000004E006F0074006500730000000000
        0000000000000000}
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
      OnDblClick = MultiSlotMachinesDblClick
      OnKeyAction = MultiSlotMachinesKeyAction
    end
    object ButtonOkMultiSlotMachines: TBitBtn
      Left = 777
      Top = 248
      Width = 65
      Height = 23
      Hint = 
        'Select another machine to play games with (mouse double-click or' +
        ' ENTER key)'
      Caption = 'Ok'
      TabOrder = 1
      OnClick = ButtonOkMultiSlotMachinesClick
    end
  end
end
