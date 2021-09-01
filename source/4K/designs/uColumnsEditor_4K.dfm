object FormColumnsEditor4K: TFormColumnsEditor4K
  Left = 693
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customize Columns (4K)'
  ClientHeight = 908
  ClientWidth = 865
  Color = clTeal
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
  object LabelButtonUpDown: TShadowLabel
    Left = 597
    Top = 102
    Width = 207
    Height = 31
    Caption = '[Ctrl+Up / Ctrl+Down]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonEditWidth: TShadowLabel
    Left = 597
    Top = 148
    Width = 243
    Height = 31
    Caption = '[F2 / Mouse Double-Click]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonSize: TShadowLabel
    Left = 597
    Top = 194
    Width = 211
    Height = 31
    Caption = '[Ctrl+Left / Ctrl+Right]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonDefaultSize: TShadowLabel
    Left = 597
    Top = 286
    Width = 36
    Height = 31
    Caption = '[F3]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonResetSize: TShadowLabel
    Left = 597
    Top = 240
    Width = 36
    Height = 31
    Caption = '[F4]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonReloadProfileDefaultSettings: TShadowLabel
    Left = 597
    Top = 376
    Width = 36
    Height = 31
    Caption = '[F5]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelToggleVisibility: TShadowLabel
    Left = 597
    Top = 327
    Width = 255
    Height = 31
    Caption = '[Space Bar] Toggle Visibility'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelButtonSetDefaultAll: TShadowLabel
    Left = 597
    Top = 422
    Width = 36
    Height = 31
    Caption = '[F6]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI'
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
  end
  object LabelTips: TShadowLabel
    Left = 420
    Top = 653
    Width = 432
    Height = 116
    Caption = 
      'You can access this dialog and other options in columns header p' +
      'opup menu (mouse right-click).'#13#10#13#10'More options in preferences sc' +
      'reen.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
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
  object ButtonUp: TBitBtnEx
    Tag = 1
    Left = 420
    Top = 100
    Width = 79
    Height = 36
    Hint = 'Move selected column up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object ButtonDown: TBitBtnEx
    Left = 508
    Top = 100
    Width = 79
    Height = 36
    Hint = 'Move selected column down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ButtonEditWidth: TBitBtnEx
    Tag = 1
    Left = 419
    Top = 146
    Width = 168
    Height = 36
    Hint = 'Edit selected column width, in pixels'
    Caption = 'Edit Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ButtonReloadProfile: TBitBtnEx
    Left = 419
    Top = 374
    Width = 168
    Height = 36
    Hint = 'Reload current columns settings from main games list'
    Caption = 'Reset All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object ButtonDefault: TBitBtnEx
    Left = 419
    Top = 420
    Width = 168
    Height = 36
    Hint = 'Reset all columns to frontend default settings'
    Caption = 'Default All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object ButtonDefaultSize: TBitBtnEx
    Left = 419
    Top = 284
    Width = 168
    Height = 36
    Hint = 'Reset selected column width to default size'
    Caption = 'Default Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object ButtonResetSize: TBitBtnEx
    Left = 419
    Top = 238
    Width = 168
    Height = 36
    Hint = 'Reset selected column width to current size'
    Caption = 'Reset Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object ButtonSizeDecrease: TBitBtnEx
    Left = 420
    Top = 192
    Width = 79
    Height = 36
    Hint = 'Decrease selected column size'
    Caption = '-'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object ButtonSizeIncrease: TBitBtnEx
    Tag = 1
    Left = 508
    Top = 192
    Width = 79
    Height = 36
    Hint = 'Increase selected column size'
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object PanelBottom: TPanelEx
    Left = 410
    Top = 837
    Width = 455
    Height = 71
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
      Left = 53
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 233
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object PanelTitleTip: TPanelEx
    Left = 410
    Top = 0
    Width = 455
    Height = 90
    Color1 = 16445669
    Color2 = 15856113
    Color3 = 16707808
    Color4 = 16445669
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTitleTip: TShadowLabel
      Left = 31
      Top = 6
      Width = 393
      Height = 47
      Caption = 
        'Change column position, size, visibility. Use the checkbox to sh' +
        'ow/hide column.'
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
  end
  object ButtonCustomizeColumnHeaderFont: TBitBtnEx
    Left = 421
    Top = 548
    Width = 235
    Height = 36
    Caption = 'Customize Header Font'
    TabOrder = 11
  end
  object ButtonCustomizeColumnHeaderFontSetDefault: TBitBtnEx
    Left = 686
    Top = 548
    Width = 168
    Height = 36
    Caption = 'Default Font'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object ColumnsListView: TEasyListview
    Left = 0
    Top = -2
    Width = 410
    Height = 913
    BackGround.Enabled = True
    BorderWidth = 8
    CellSizes.Report.Height = 37
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Consolas'
    EditManager.Font.Style = []
    UseDockManager = False
    DragManager.Enabled = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Consolas'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    Groups.Items = {
      060000000100000010000000544561737947726F757053746F726564FFFECE00
      06000000810806000000180000000F00000054456173794974656D53746F7265
      64FFFECE0006000000800C010000001000000045006D0075006C006100740069
      006F006E00200053007400610074007500730000000000000000000000000000
      000000000000000F00000054456173794974656D53746F726564FFFECE000600
      000080080000000000000000000000000000000000000000000000000F000000
      54456173794974656D53746F726564FFFECE0006000000800800000000000000
      00000000000000000000000000000000000F00000054456173794974656D5374
      6F726564FFFECE00060000008008000000000000000000000000000000000000
      0000000000000F00000054456173794974656D53746F726564FFFECE00060000
      0080080000000000000000000000000000000000000000000000000F00000054
      456173794974656D53746F726564FFFECE000600000080080000000000000000
      000000000000000000000000000000000F00000054456173794974656D53746F
      726564FFFECE0006000000800800000000000000000000000000000000000000
      00000000000F00000054456173794974656D53746F726564FFFECE0006000000
      80080000000000000000000000000000000000000000000000000F0000005445
      6173794974656D53746F726564FFFECE00060000008008000000000000000000
      0000000000000000000000000000000F00000054456173794974656D53746F72
      6564FFFECE000600000080080000000000000000000000000000000000000000
      000000000F00000054456173794974656D53746F726564FFFECE000600000080
      080000000000000000000000000000000000000000000000000F000000544561
      73794974656D53746F726564FFFECE0006000000800800000000000000000000
      00000000000000000000000000000F00000054456173794974656D53746F7265
      64FFFECE00060000008008000000000000000000000000000000000000000000
      0000000F00000054456173794974656D53746F726564FFFECE00060000008008
      0000000000000000000000000000000000000000000000000F00000054456173
      794974656D53746F726564FFFECE000600000080080000000000000000000000
      000000000000000000000000000F00000054456173794974656D53746F726564
      FFFECE0006000000800800000000000000000000000000000000000000000000
      00000F00000054456173794974656D53746F726564FFFECE0006000000800800
      00000000000000000000000000000000000000000000000F0000005445617379
      4974656D53746F726564FFFECE00060000008008000000000000000000000000
      0000000000000000000000000F00000054456173794974656D53746F726564FF
      FECE000600000080080000000000000000000000000000000000000000000000
      000F00000054456173794974656D53746F726564FFFECE000600000080080000
      000000000000000000000000000000000000000000000F000000544561737949
      74656D53746F726564FFFECE0006000000800800000000000000000000000000
      00000000000000000000000F00000054456173794974656D53746F726564FFFE
      CE00060000008008000000000000000000000000000000000000000000000000
      0F00000054456173794974656D53746F726564FFFECE00060000008008000000
      0000000000000000000000000000000000000000000F00000054456173794974
      656D53746F726564FFFECE00060000008008010000001000000045006D007500
      6C006100740069006F006E002000530074006100740075007300000000000000
      000000000000000000000000000000000000000000000000000000000000}
    HintType = ehtToolTip
    Header.AutoSizeHeightMargin = 6
    Header.Columns.Items = {
      0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080000000001000000000000000E010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000000
      00010100000000000046000000FFFFFF1F000100000001000000040000005300
      69007A006500000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -9
    Header.Font.Name = 'Verdana'
    Header.Font.Style = []
    Header.Height = 18
    Header.Sizeable = False
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CheckSize = 23
    PaintInfoItem.CheckType = ectBox
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    ShowThemedBorder = False
    ShowHint = False
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
    TabOrder = 13
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = True
  end
end
