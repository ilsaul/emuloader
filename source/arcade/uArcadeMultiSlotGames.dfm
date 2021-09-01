object FormArcadeMultiSlotGames: TFormArcadeMultiSlotGames
  Left = 998
  Top = 523
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neo-Geo MVS (Multi Video System)'
  ClientHeight = 736
  ClientWidth = 994
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
    Left = 428
    Top = 243
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
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    WordWrap = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 695
    Width = 994
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
    object ButtonOk: TBitBtnEx
      Left = 401
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtnEx
      Left = 504
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
  object ButtonUp: TBitBtnEx
    Tag = 1
    Left = 4
    Top = 243
    Width = 85
    Height = 25
    Hint = 'Move selected game to upper slot [Ctrl+Up Arrow]'
    Caption = 'Move Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtnEx
    Left = 93
    Top = 243
    Width = 85
    Height = 25
    Hint = 'Move selected game to lower slot [Ctrl+Down Arrow]'
    Caption = 'Move Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonUpClick
  end
  object ButtonRemoveFromList: TBitBtnEx
    Left = 182
    Top = 243
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
    Top = 289
    Width = 986
    Height = 31
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object LabelMultiSlotMachines: TShadowLabel
      Tag = 6
      Left = 11
      Top = 8
      Width = 898
      Height = 15
      Hint = 'neogeo'
      AutoSize = False
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonChangePanelNeoGeoMVS: TBitBtnEx
      Left = 917
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
  object GamesList: TEasyListview
    Left = 4
    Top = 4
    Width = 986
    Height = 230
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
      746F726564FFFECE0006000000800800010100010100000000000022020000FF
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
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 6
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnItemPaintText = GamesListItemPaintText
    OnItemSelectionChanged = GamesListItemSelectionChanged
    OnKeyAction = GamesListKeyAction
  end
  object PanelMultiSlotMachines: TPanelEx
    Left = 8
    Top = 333
    Width = 978
    Height = 290
    Color1 = 15856113
    Color2 = 16448250
    Color3 = 1
    Color4 = 5832704
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableInnerFrame = True
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelMultiSlotMachinesChooseMachineToRun: TShadowLabel
      Left = 15
      Top = 255
      Width = 353
      Height = 17
      Caption = 'Choose machine to run games with, click "Ok" button'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMedGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelMultiSlotMachinesBoldDefaultMachine: TShadowLabel
      Left = 517
      Top = 256
      Width = 169
      Height = 15
      Caption = 'default machine is in bold'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMedGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object MultiSlotMachines: TEasyListview
      Left = 15
      Top = 16
      Width = 946
      Height = 226
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
        0006000000800800010100010000000000000040010000FFFFFF1F0001000000
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
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnDblClick = MultiSlotMachinesDblClick
      OnItemPaintText = MultiSlotMachinesItemPaintText
      OnKeyAction = MultiSlotMachinesKeyAction
    end
    object ButtonOkMultiSlotMachines: TBitBtnEx
      Left = 823
      Top = 252
      Width = 65
      Height = 23
      Hint = 
        'Select another machine to play games with (mouse double-click or' +
        ' ENTER key)'
      Caption = 'Ok'
      TabOrder = 1
      OnClick = ButtonOkMultiSlotMachinesClick
    end
    object ButtonCancelMultiSlotMachines: TBitBtnEx
      Left = 896
      Top = 252
      Width = 65
      Height = 23
      Hint = 
        'Select another machine to play games with (mouse double-click or' +
        ' ENTER key)'
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = ButtonCancelMultiSlotMachinesClick
    end
  end
end
