object FormConsCompMultiFloppyGames: TFormConsCompMultiFloppyGames
  Left = 1162
  Top = 720
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Load Multi Floppy Disks Game'
  ClientHeight = 462
  ClientWidth = 885
  Color = clWhite
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
  object PanelBottom: TPanelEx
    Left = 0
    Top = 421
    Width = 885
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = 15856113
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTotalFloppyDisks: TShadowLabel
      Left = 418
      Top = 14
      Width = 45
      Height = 16
      Caption = '00 Disks'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14606046
      ShadowEnabled = True
      EllipsType = etPathEllips
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonOk: TBitBtnEx
      Left = 683
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtnEx
      Left = 778
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonUp: TBitBtnEx
      Tag = 1
      Left = 8
      Top = 8
      Width = 128
      Height = 25
      Hint = 'Move selected game one slot up [Ctrl+Up Arrow]'
      Caption = 'Move To Upper Drive'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonUpClick
    end
    object ButtonDown: TBitBtnEx
      Left = 144
      Top = 8
      Width = 128
      Height = 25
      Hint = 'Move selected game one slot down [Ctrl+Down Arrow]'
      Caption = 'Move To Lower Drive'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonUpClick
    end
    object ButtonRemoveFromList: TBitBtnEx
      Left = 280
      Top = 8
      Width = 125
      Height = 25
      Hint = 'Remove selected games from the list [Delete]'
      Caption = 'Remove From List'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonRemoveFromListClick
    end
  end
  object PanelWinViceLabel: TPanelEx
    Left = 80
    Top = 65
    Width = 299
    Height = 17
    Color1 = clSilver
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object LabelWinVICE: TLabel
      Left = 2
      Top = 2
      Width = 295
      Height = 13
      Caption = 'WinVICE disks must be in descending order (last to first)!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 885
    Height = 83
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Tag = -50
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelSystemTitle: TShadowLabel
      Left = 79
      Top = 7
      Width = 781
      Height = 17
      AutoSize = False
      Caption = 'System Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSkyBlue
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelEmulatorDetails: TShadowLabel
      Left = 109
      Top = 46
      Width = 759
      Height = 27
      AutoSize = False
      Caption = 
        'name: gamename [clone of gamename] [bios: biosname] [merged] [so' +
        'ftlist: softwarename]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object EmulatorIcon: TImage
      Tag = -50
      Left = 79
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
  end
  object FrameGamesList: TPanelEx
    Left = 4
    Top = 88
    Width = 877
    Height = 300
    Color1 = clWhite
    Color2 = clSilver
    Color3 = 7891291
    Color4 = 7891291
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object GamesList: TEasyListview
      Left = 1
      Top = 2
      Width = 875
      Height = 297
      CellSizes.Tile.Width = 254
      CellSizes.Report.Height = 22
      Color = clWhite
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = IL_LoadMultiFloppy
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000007000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000019000000FFFFFF1F0001000000
        0100000001000000440000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001010000000000
        0086010000FFFFFF1F000100000001000000050000005400690074006C006500
        000000000000000000000000110000005445617379436F6C756D6E53746F7265
        64FFFECE000600000080080001010001020000000000003C000000FFFFFF1F00
        0100000001000000040000005900650061007200000000000000000000000000
        110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
        0101000103000000000000B9000000FFFFFF1F0001000000010000000C000000
        4D0061006E007500660061006300740075007200650072000000000000000000
        00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
        0080080001010001040000000000003C000000FFFFFF1F000100000001000000
        04000000460069006C0065000000000000000000000000001100000054456173
        79436F6C756D6E53746F726564FFFECE00060000008008000101000105000000
        0000009B000000FFFFFF1F0001000000010000000600000050006C0061007900
        65006400000000000000000000000000110000005445617379436F6C756D6E53
        746F726564FFFECE0006000000800000010100010600000000000132000000FF
        FFFF1F0001000000010000000C000000460069006C006500460075006C006C00
        5000610074006800000000000000000000000000}
      Header.Draggable = False
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
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
      CustomCheckRadioEnabled = False
      OnItemCompare = GamesListItemCompare
      OnItemPaintText = GamesListItemPaintText
      OnKeyAction = GamesListKeyAction
    end
  end
  object IL_LoadMultiFloppy: TImageList
    Left = 16
    Top = 320
  end
  object IL_EmulatorIcon: TImageList
    Height = 24
    Width = 24
    Left = 72
    Top = 320
  end
end
