object FormGameDetails: TFormGameDetails
  Left = 567
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Game Details'
  ClientHeight = 563
  ClientWidth = 968
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
    Top = 69
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
    Transparent = True
  end
  object LabelYearValue: TShadowLabel
    Left = 93
    Top = 69
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
    Transparent = True
  end
  object FrameROMsListView: TShape
    Left = 297
    Top = 69
    Width = 664
    Height = 488
    Brush.Color = 15856113
    Pen.Color = 7891291
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 968
    Height = 60
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = clMoneyGreen
    Color4 = 1117964
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 875
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object GameIcon: TImage
      Left = 56
      Top = 28
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 86
      Top = 28
      Width = 715
      Height = 25
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Supermode' +
        'l: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 2012)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelScanMode: TShadowLabel
      Left = 853
      Top = 26
      Width = 106
      Height = 27
      Hint = 'Scan Mode'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Scan Mode'#13#10'Force Game Available'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      WordWrap = True
    end
  end
  object ROMsListView: TEasyListview
    Tag = 1
    Left = 298
    Top = 70
    Width = 662
    Height = 486
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 20
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
      0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001BE000000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000140000000FFFFFF1F0001000000010000000500000043005200
      430033003200000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001200100
      00FFFFFF1F000100000001000000050000005300480041002D00310000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010300000000000178000000FFFFFF1F0001000000
      0100000006000000530074006100740075007300000000000000000000000000}
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
    PaintInfoColumn.HotTrack = False
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
    TabOrder = 1
    View = elsReport
    OnColumnClick = ROMsListViewColumnClick
    OnItemCompare = ROMsListViewItemCompare
    OnItemPaintText = ROMsListViewItemPaintText
    OnItemSelectionChanged = ROMsListViewItemSelectionChanged
  end
  object IL_FileType: TImageList
    Left = 248
    Top = 96
  end
end
