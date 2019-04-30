object FormGameDetails: TFormGameDetails
  Left = 567
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Game Details'
  ClientHeight = 585
  ClientWidth = 1085
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelYear: TShadowLabel
    Left = 6
    Top = 89
    Width = 28
    Height = 16
    Caption = 'Year'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
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
  object LabelYearValue: TShadowLabel
    Left = 93
    Top = 89
    Width = 35
    Height = 16
    Caption = 'Year 8'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSkyBlue
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1085
    Height = 80
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = clMoneyGreen
    Color4 = 1117964
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 852
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
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
    object GameIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 46
      Width = 720
      Height = 27
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Supermode' +
        'l: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 2012)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
    end
    object LabelScanMode: TShadowLabel
      Left = 841
      Top = 45
      Width = 118
      Height = 29
      Hint = 'Scan Mode'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Scan Mode'#13#10'Force Game Available'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
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
  object FrameROMsListView: TPanelEx
    Left = 297
    Top = 89
    Width = 781
    Height = 490
    Color1 = 15856113
    Color2 = 1
    Color3 = 7891291
    Color4 = 16750899
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object ROMsListView: TEasyListview
      Tag = 1
      Left = 2
      Top = 2
      Width = 777
      Height = 486
      BackGround.Enabled = True
      BorderStyle = bsNone
      CellSizes.Report.Height = 22
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = FormMain.IL_LeftPanel
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
        00060000008008000101000100000000000001BE000000FFFFFF1F0001000000
        01000000040000004E0061006D00650000000000000000000000000011000000
        5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
        0100000000000140000000FFFFFF1F0001000000010000000500000043005200
        430033003200000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000001200100
        00FFFFFF1F000100000001000000050000005300480041002D00310000000000
        0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010300000000000173000000FFFFFF1F0001000000
        0100000004000000530069007A00650000000000000000000000000011000000
        5445617379436F6C756D6E53746F726564FFFECE000600000080000001010001
        0400000000000178000000FFFFFF1F0001000000010000000600000044006500
        7600690063006500000000000000000000000000110000005445617379436F6C
        756D6E53746F726564FFFECE0006000000800800010100010500000000000178
        000000FFFFFF1F00010000000100000006000000530074006100740075007300
        000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      ImagesSmall = FormMain.IL_LeftPanel
      PaintInfoColumn.Border = 2
      PaintInfoColumn.CaptionIndent = 0
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      ParentFont = False
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
      OnColumnClick = ROMsListViewColumnClick
      OnItemCompare = ROMsListViewItemCompare
      OnItemPaintText = ROMsListViewItemPaintText
      OnItemSelectionChanged = ROMsListViewItemSelectionChanged
    end
  end
  object IL_FileType: TImageList
    Left = 248
    Top = 96
  end
end
