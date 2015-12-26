object FormColumnsEditor: TFormColumnsEditor
  Left = 693
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customize Columns (Details / Grouped)'
  ClientHeight = 416
  ClientWidth = 460
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
  object LabelButtonUpDown: TLabel
    Left = 304
    Top = 45
    Width = 119
    Height = 15
    Caption = '[Ctrl+Up / Ctrl+Down]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelButtonEditWidth: TLabel
    Left = 304
    Top = 73
    Width = 139
    Height = 15
    Caption = '[F2 / Mouse Double-Click]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelButtonSize: TLabel
    Left = 304
    Top = 100
    Width = 121
    Height = 15
    Caption = '[Ctrl+Left / Ctrl+Right]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelButtonDefaultSize: TLabel
    Left = 304
    Top = 152
    Width = 20
    Height = 15
    Caption = '[F3]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelButtonResetSize: TLabel
    Left = 304
    Top = 126
    Width = 20
    Height = 15
    Caption = '[F4]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelButtonReloadProfileDefaultSettings: TLabel
    Left = 304
    Top = 217
    Width = 20
    Height = 15
    Caption = '[F5]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Shape2: TShape
    Left = 211
    Top = 0
    Width = 1
    Height = 416
    Brush.Color = clBtnFace
    Pen.Color = 7891291
  end
  object LabelToggleVisibility: TLabel
    Left = 304
    Top = 176
    Width = 146
    Height = 15
    Caption = '[Space Bar] Toggle Visibility'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 304
    Top = 249
    Width = 20
    Height = 15
    Caption = '[F6]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 222
    Top = 320
    Width = 231
    Height = 52
    AutoSize = False
    Caption = 
      'You can access this dialog and other options in columns header p' +
      'opup menu (mouse right-click).'#13#10#13#10'There are more options in pref' +
      'erences screen.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
    WordWrap = True
  end
  object ColumnsListView: TEasyListview
    Left = 0
    Top = 0
    Width = 211
    Height = 416
    BackGround.Enabled = True
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Trebuchet MS'
    EditManager.Font.Style = []
    UseDockManager = False
    DragManager.Enabled = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.AutoSizeHeightMargin = 6
    Header.Columns.Items = {
      0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000000000100000000000000A0000000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000000
      00010100000000000031000000FFFFFF1F000100000001000000040000005300
      69007A006500000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -9
    Header.Font.Name = 'Verdana'
    Header.Font.Style = []
    Header.Height = 18
    Header.Sizeable = False
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    PaintInfoColumn.Border = 2
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CheckIndent = 1
    PaintInfoItem.CheckSize = 13
    PaintInfoItem.CheckType = ectBox
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
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
    TabOrder = 0
    View = elsReport
    OnDblClick = ColumnsListViewDblClick
    OnItemCheckChange = ColumnsListViewItemCheckChange
    OnItemEdited = ColumnsListViewItemEdited
    OnItemEditEnd = ColumnsListViewItemEditEnd
    OnItemPaintText = ColumnsListViewItemPaintText
    OnKeyAction = ColumnsListViewKeyAction
  end
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 220
    Top = 40
    Width = 39
    Height = 25
    Hint = 'Move selected column up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
    Left = 261
    Top = 40
    Width = 39
    Height = 25
    Hint = 'Move selected column down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonUpClick
  end
  object ButtonEditWidth: TBitBtn
    Tag = 1
    Left = 220
    Top = 68
    Width = 80
    Height = 25
    Hint = 'Edit selected column width, in pixels'
    Caption = 'Edit Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonEditWidthClick
  end
  object ButtonReloadProfile: TBitBtn
    Left = 220
    Top = 212
    Width = 80
    Height = 25
    Hint = 'Reload current columns settings from main games list'
    Caption = 'Reset All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonReloadProfileClick
  end
  object ButtonDefault: TBitBtn
    Left = 220
    Top = 244
    Width = 80
    Height = 25
    Hint = 'Reset all columns to frontend default settings'
    Caption = 'Default All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ButtonDefaultClick
  end
  object ButtonDefaultSize: TBitBtn
    Left = 220
    Top = 147
    Width = 80
    Height = 25
    Hint = 'Reset selected column width to default size'
    Caption = 'Default Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = ButtonDefaultSizeClick
  end
  object ButtonResetSize: TBitBtn
    Left = 220
    Top = 121
    Width = 80
    Height = 25
    Hint = 'Reset selected column width to current size'
    Caption = 'Reset Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = ButtonResetSizeClick
  end
  object ButtonSizeDecrease: TBitBtn
    Left = 220
    Top = 95
    Width = 39
    Height = 25
    Hint = 'Decrease selected column size'
    Caption = '-'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ButtonSizeDecreaseClick
  end
  object ButtonSizeIncrease: TBitBtn
    Tag = 1
    Left = 261
    Top = 95
    Width = 39
    Height = 25
    Hint = 'Increase selected column size'
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = ButtonSizeDecreaseClick
  end
  object PanelButtons: TPanelEx
    Left = 212
    Top = 375
    Width = 248
    Height = 41
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 29
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 129
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object PanelEx2: TPanelEx
    Left = 212
    Top = 0
    Width = 248
    Height = 30
    Color1 = 16445669
    Color2 = 15856113
    Color3 = 16707808
    Color4 = 16445669
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object Label1: TLabel
      Left = 9
      Top = 2
      Width = 229
      Height = 26
      AutoSize = False
      Caption = 
        'Change column position, size, visibility. Use the checkbox to sh' +
        'ow/hide column.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
  end
  object ButtonCustomizeColumnHeaderFont: TBitBtn
    Left = 220
    Top = 288
    Width = 142
    Height = 23
    Caption = 'Customize Header Font'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = ButtonCustomizeColumnHeaderFontClick
  end
  object ButtonCustomizeColumnHeaderFontSetDefault: TBitBtn
    Left = 364
    Top = 288
    Width = 80
    Height = 23
    Caption = 'Default Font'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = ButtonCustomizeColumnHeaderFontSetDefaultClick
  end
end
