object FormConsCompMultiFloppyGames4K: TFormConsCompMultiFloppyGames4K
  Left = 870
  Top = 724
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Load Multi Floppy Disks Game'
  ClientHeight = 870
  ClientWidth = 1730
  Color = clWhite
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
  object LabelWinVICE: TShadowLabel
    Left = 591
    Top = 750
    Width = 551
    Height = 35
    Alignment = taCenter
    AutoSize = False
    Caption = 'WinVICE disks must be in descending order (last to first)!'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Layout = tlCenter
    Visible = False
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 799
    Width = 1730
    Height = 71
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
      Left = 738
      Top = 23
      Width = 146
      Height = 31
      Caption = '00 Floppy Disks'
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
      Left = 1323
      Top = 16
      Width = 189
      Height = 45
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object ButtonNo: TBitBtnEx
      Left = 1530
      Top = 16
      Width = 189
      Height = 45
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      CaptionVertIndent = -1
    end
    object ButtonUp: TBitBtnEx
      Tag = 1
      Left = 10
      Top = 16
      Width = 225
      Height = 45
      Hint = 'Move selected game one slot up [Ctrl+Up Arrow]'
      Caption = 'Move To Upper Drive'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      CaptionVertIndent = -1
    end
    object ButtonDown: TBitBtnEx
      Left = 250
      Top = 16
      Width = 225
      Height = 45
      Hint = 'Move selected game one slot down [Ctrl+Down Arrow]'
      Caption = 'Move To Lower Drive'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      CaptionVertIndent = -1
    end
    object ButtonRemoveFromList: TBitBtnEx
      Left = 490
      Top = 16
      Width = 225
      Height = 45
      Hint = 'Remove selected games from the list [Delete]'
      Caption = 'Remove From List'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      CaptionVertIndent = -1
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1730
    Height = 150
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
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelSystemTitle: TShadowLabel
      Left = 144
      Top = 10
      Width = 1570
      Height = 30
      AutoSize = False
      Caption = 'System Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 199
      Top = 84
      Width = 1515
      Height = 47
      AutoSize = False
      Caption = 
        'name: gamename [clone of gamename] [bios: biosname] [merged] [so' +
        'ftlist: softwarename]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      WordWrap = True
    end
    object EmulatorIcon: TImage
      Tag = -50
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
  end
  object GamesList: TEasyListview
    Left = 10
    Top = 160
    Width = 1710
    Height = 580
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 22
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = IL_LoadMultiFloppy
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000007000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000043000000FFFFFF1F0001000000
      0100000005000000440072006900760065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000034030000FFFFFF1F000100000001000000050000005400
      690074006C006500000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE0006000000800800010100010200000000000064
      000000FFFFFF1F00010000000100000004000000590065006100720000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001030000000000005E010000FFFFFF1F0001000000
      010000000C0000004D0061006E00750066006100630074007500720065007200
      000000000000000000000000110000005445617379436F6C756D6E53746F7265
      64FFFECE0006000000800800010100010400000000000078000000FFFFFF1F00
      010000000100000004000000460069006C006500000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
      0101000105000000000000F7000000FFFFFF1F00010000000100000006000000
      50006C0061007900650064000000000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008000000101000106000000
      00000132000000FFFFFF1F0001000000010000000C000000460069006C006500
      460075006C006C005000610074006800000000000000000000000000}
    Header.Draggable = False
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
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
    ParentShowHint = False
    ShowThemedBorderColor = clSilver
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
    TabOrder = 2
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
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
