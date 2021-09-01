object FormArcadeMultiSlotGames4K: TFormArcadeMultiSlotGames4K
  Left = 732
  Top = 460
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neo-Geo MVS (Multi Video System) 4K'
  ClientHeight = 1180
  ClientWidth = 1995
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
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelHelpText: TShadowLabel
    Left = 1002
    Top = 439
    Width = 522
    Height = 47
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Choose a cartridge slot for each game (%u slots max)'#13'MAME v%s mi' +
      'nimum required'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
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
    Top = 1109
    Width = 1995
    Height = 71
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
      Left = 822
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtnEx
      Left = 1005
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object ButtonUp: TBitBtnEx
    Tag = 1
    Left = 10
    Top = 439
    Width = 168
    Height = 36
    Hint = 'Move selected game to upper slot [Ctrl+Up Arrow]'
    Caption = 'Move Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ButtonDown: TBitBtnEx
    Left = 188
    Top = 439
    Width = 168
    Height = 36
    Hint = 'Move selected game to lower slot [Ctrl+Down Arrow]'
    Caption = 'Move Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ButtonRemoveFromList: TBitBtnEx
    Left = 366
    Top = 439
    Width = 168
    Height = 36
    Hint = 'Remove selected games from the list [Delete]'
    Caption = 'Remove'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object PanelNeoGeoMVS: TPanelEx
    Left = 10
    Top = 543
    Width = 1975
    Height = 44
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
      Left = 10
      Top = 10
      Width = 1862
      Height = 25
      Hint = 'neogeo'
      AutoSize = False
      Caption = 'Use Machine: Neo-Geo MV-6F    1990    6-slot    [neogeo]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Left = 1881
      Top = 4
      Width = 89
      Height = 36
      Hint = 'Select another machine to play games with'
      Caption = 'Change'
      TabOrder = 0
      Visible = False
    end
  end
  object GamesList: TEasyListview
    Left = 10
    Top = 10
    Width = 1975
    Height = 419
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 37
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_GroupedMode
    UseDockManager = False
    Groups.Items = {
      060000000100000010000000544561737947726F757053746F726564FFFECE00
      060000008108060000000A0000000F00000054456173794974656D53746F7265
      64FFFECE00060000008008010000000200000032003000000000000000000000
      00000000000000000000000F00000054456173794974656D53746F726564FFFE
      CE00060000008008010000000200000033003400000000000000000000000000
      00000000000000000F00000054456173794974656D53746F726564FFFECE0006
      0000008008010000000200000031003100000000000000000000000000000000
      00000000000F00000054456173794974656D53746F726564FFFECE0006000000
      8008010000000200000039003900000000000000000000000000000000000000
      00000F00000054456173794974656D53746F726564FFFECE0006000000800801
      000000020000003000300000000000000000000000000000000000000000000F
      00000054456173794974656D53746F726564FFFECE0006000000800801000000
      020000003400350000000000000000000000000000000000000000000F000000
      54456173794974656D53746F726564FFFECE0006000000800801000000020000
      003700320000000000000000000000000000000000000000000F000000544561
      73794974656D53746F726564FFFECE0006000000800801000000020000003600
      360000000000000000000000000000000000000000000F000000544561737949
      74656D53746F726564FFFECE0006000000800801000000020000003100380000
      000000000000000000000000000000000000000F00000054456173794974656D
      53746F726564FFFECE0006000000800801000000020000003800380000000000
      0000000000000000000000000000000000000000000000000000000000000000}
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000008000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800801010100010000000000000023000000FFFFFF1F0001000000
      00000000000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE00060000008008000101000101000000000000B6030000FF
      FFFF1F000100000001000000050000005400690074006C006500000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      0000008008000101000102000000000000FA000000FFFFFF1F00010000000100
      0000040000004E0061006D006500000000000000000000000000110000005445
      617379436F6C756D6E53746F726564FFFECE0006000000800800010100010300
      0000000000FA000000FFFFFF1F0001000000010000000800000043006C006F00
      6E00650020006F00660000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001040000000000
      00C8000000FFFFFF1F0001000000010000000600000050006C00610079006500
      6400000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010500000000000096000000FFFFFF
      1F0001000000010000000700000050006C006100790065007200730000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010600000000000064000000FFFFFF1F0001000000
      0100000004000000590065006100720000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0700000000000023000000FFFFFF1F0001000000010000000000000000000000
      0000000000000000}
    Header.Draggable = False
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsLarge
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
  end
  object PanelMultiSlotMachines: TPanelEx
    Left = 26
    Top = 602
    Width = 1943
    Height = 378
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
      Left = 23
      Top = 323
      Width = 519
      Height = 24
      Caption = 'Choose machine to run games with, click "Ok" button'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
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
      Left = 992
      Top = 323
      Width = 285
      Height = 24
      Caption = 'default machine is in bold'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
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
      Left = 23
      Top = 23
      Width = 1895
      Height = 271
      CellSizes.Tile.Width = 254
      CellSizes.Report.Height = 37
      Color = clWhite
      DisabledBlendAlpha = 0
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
      GroupFont.Height = -21
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        06000000810806000000060000000F00000054456173794974656D53746F7265
        64FFFECE00060000008008010000001600000041007400610072006900200035
        00320030003000200053007500700065007200530079007300740065006D0000
        000000000000000000000000000000000000000F00000054456173794974656D
        53746F726564FFFECE0006000000800801000000070000004E0065006F002D00
        470065006F0000000000000000000000000000000000000000000F0000005445
        6173794974656D53746F726564FFFECE0006000000800801000000160000004E
        0069006E00740065006E0064006F00200050006C0061007900430068006F0069
        00630065002D003100300000000000000000000000000000000000000000000F
        00000054456173794974656D53746F726564FFFECE0006000000800801000000
        120000004D0075006C00740069002D0073006C006F00740020004D0061006300
        680069006E00650000000000000000000000000000000000000000000F000000
        54456173794974656D53746F726564FFFECE0006000000800801000000030000
        004D005600530000000000000000000000000000000000000000000F00000054
        456173794974656D53746F726564FFFECE000600000080080100000015000000
        4C0061007300740020004900740065006D0020004F006E002000540068006500
        20004C0069007300740000000000000000000000000000000000000000000000
        0000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000000E8010000FFFFFF1F0001000000
        010000000D0000004D0061006300680069006E00650020005400690074006C00
        6500000000000000000000000000110000005445617379436F6C756D6E53746F
        726564FFFECE0006000000800800010100010100000000000064000000FFFFFF
        1F00010000000100000004000000590065006100720000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        0800010100010200000000000096000000FFFFFF1F0001000000010000000500
        000053006C006F00740073000000000000000000000000001100000054456173
        79436F6C756D6E53746F726564FFFECE00060000008008000101000103000000
        00000090010000FFFFFF1F0001000000010000000D0000005600690064006500
        6F00200043006800690070007300650074000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        000104000000000000FA000000FFFFFF1F000100000001000000040000004E00
        61006D006500000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000105000000000000F40100
        00FFFFFF1F000100000001000000050000004E006F0074006500730000000000
        0000000000000000}
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
    end
    object ButtonOkMultiSlotMachines: TBitBtnEx
      Left = 1730
      Top = 317
      Width = 89
      Height = 36
      Hint = 
        'Select another machine to play games with (mouse double-click or' +
        ' ENTER key)'
      Caption = 'Ok'
      TabOrder = 1
    end
    object ButtonCancelMultiSlotMachines: TBitBtnEx
      Left = 1829
      Top = 317
      Width = 89
      Height = 36
      Hint = 
        'Select another machine to play games with (mouse double-click or' +
        ' ENTER key)'
      Caption = 'Cancel'
      TabOrder = 2
    end
  end
end
