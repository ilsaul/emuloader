object FormGameDetails4K: TFormGameDetails4K
  Left = 567
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Game Details 4K'
  ClientHeight = 676
  ClientWidth = 2018
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelYear: TShadowLabel
    Left = 10
    Top = 168
    Width = 41
    Height = 31
    Caption = 'Year'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
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
    Left = 174
    Top = 168
    Width = 57
    Height = 31
    Caption = 'Year 8'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -21
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
    Width = 2018
    Height = 159
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
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 199
      Top = 4
      Width = 1642
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 199
      Top = 84
      Width = 1378
      Height = 47
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Supermode' +
        'l: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 2012)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      Left = 1664
      Top = 81
      Width = 145
      Height = 51
      Hint = 'Scan Mode'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Scan Mode'#13#10'Force Available'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
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
  object ROMsListView: TEasyListview
    Tag = 1
    Left = 580
    Top = 168
    Width = 1428
    Height = 490
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 38
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_Misc_Large
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
      00060000008008000101000100000000000001F4010000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000178000000FFFFFF1F0001000000010000000500000043005200
      430033003200000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001F80100
      00FFFFFF1F000100000001000000050000005300480041002D00310000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000103000000000001B4000000FFFFFF1F0001000000
      0100000004000000530069007A00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080000001010001
      04000000000001B4000000FFFFFF1F0001000000010000000600000044006500
      7600690063006500000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE0006000000800800010100010500000000000178
      000000FFFFFF1F00010000000100000006000000530074006100740075007300
      000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -21
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    ImagesSmall = FormMain.IL_MediaType_Large
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ImageIndent = 3
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.ReportViewTextTopBorderIndent = -1
    ParentFont = False
    ParentShowHint = False
    ShowThemedBorderColor = clSilver
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
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
end
