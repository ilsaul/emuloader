object FormGameDetails: TFormGameDetails
  Left = 567
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Game Details'
  ClientHeight = 563
  ClientWidth = 676
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
    Width = 373
    Height = 488
    Brush.Color = 15856113
    Pen.Color = 7891291
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 676
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
      Width = 583
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
      Width = 440
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
      Left = 563
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
    Width = 371
    Height = 486
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 18
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -11
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
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
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000000BE000000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      010000000000003C000000FFFFFF1F0001000000010000000800000043006800
      650063006B00730075006D000000000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000102000000
      00000078000000FFFFFF1F000100000001000000060000005300740061007400
      75007300000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Sizeable = False
    Header.Visible = True
    ImagesSmall = FormMain.IL_LeftPanel
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
    Selection.Gradient = True
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
    OnItemPaintText = ROMsListViewItemPaintText
    OnItemSelectionChanged = ROMsListViewItemSelectionChanged
  end
end
