object FormColumnsEditor: TFormColumnsEditor
  Left = 693
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customize Columns (Details / Grouped)'
  ClientHeight = 445
  ClientWidth = 466
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
  object LabelButtonUpDown: TShadowLabel
    Left = 313
    Top = 45
    Width = 122
    Height = 16
    Caption = '[Ctrl+Up / Ctrl+Down]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 73
    Width = 142
    Height = 16
    Caption = '[F2 / Mouse Double-Click]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 100
    Width = 124
    Height = 16
    Caption = '[Ctrl+Left / Ctrl+Right]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 152
    Width = 23
    Height = 16
    Caption = '[F3]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 126
    Width = 23
    Height = 16
    Caption = '[F4]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 217
    Width = 23
    Height = 16
    Caption = '[F5]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 176
    Width = 149
    Height = 16
    Caption = '[Space Bar] Toggle Visibility'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 313
    Top = 249
    Width = 23
    Height = 16
    Caption = '[F6]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
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
    Left = 231
    Top = 317
    Width = 212
    Height = 65
    AutoSize = False
    Caption = 
      'You can access this dialog and other options in columns header p' +
      'opup menu (mouse right-click).'#13#10#13#10'More options in preferences sc' +
      'reen.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -11
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
    Left = 230
    Top = 40
    Width = 39
    Height = 25
    Hint = 'Move selected column up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtnEx
    Left = 270
    Top = 40
    Width = 39
    Height = 25
    Hint = 'Move selected column down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonUpClick
  end
  object ButtonEditWidth: TBitBtnEx
    Tag = 1
    Left = 229
    Top = 68
    Width = 80
    Height = 25
    Hint = 'Edit selected column width, in pixels'
    Caption = 'Edit Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonEditWidthClick
  end
  object ButtonReloadProfile: TBitBtnEx
    Left = 229
    Top = 212
    Width = 80
    Height = 25
    Hint = 'Reload current columns settings from main games list'
    Caption = 'Reset All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonReloadProfileClick
  end
  object ButtonDefault: TBitBtnEx
    Left = 229
    Top = 244
    Width = 80
    Height = 25
    Hint = 'Reset all columns to frontend default settings'
    Caption = 'Default All'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonDefaultClick
  end
  object ButtonDefaultSize: TBitBtnEx
    Left = 229
    Top = 147
    Width = 80
    Height = 25
    Hint = 'Reset selected column width to default size'
    Caption = 'Default Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ButtonDefaultSizeClick
  end
  object ButtonResetSize: TBitBtnEx
    Left = 229
    Top = 121
    Width = 80
    Height = 25
    Hint = 'Reset selected column width to current size'
    Caption = 'Reset Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = ButtonResetSizeClick
  end
  object ButtonSizeDecrease: TBitBtnEx
    Left = 230
    Top = 95
    Width = 39
    Height = 25
    Hint = 'Decrease selected column size'
    Caption = '-'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = ButtonSizeDecreaseClick
  end
  object ButtonSizeIncrease: TBitBtnEx
    Tag = 1
    Left = 270
    Top = 95
    Width = 39
    Height = 25
    Hint = 'Increase selected column size'
    Caption = '+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ButtonSizeDecreaseClick
  end
  object PanelBottom: TPanelEx
    Left = 218
    Top = 404
    Width = 248
    Height = 41
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
    object ButtonCancel: TBitBtnEx
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
  object PanelTitleTip: TPanelEx
    Left = 218
    Top = 0
    Width = 248
    Height = 34
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
    Left = 229
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
    TabOrder = 11
    OnClick = ButtonCustomizeColumnHeaderFontClick
  end
  object ButtonCustomizeColumnHeaderFontSetDefault: TBitBtnEx
    Left = 373
    Top = 288
    Width = 80
    Height = 23
    Caption = 'Default Font'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = ButtonCustomizeColumnHeaderFontSetDefaultClick
  end
  object PanelColumnsList: TPanelEx
    Left = 0
    Top = 0
    Width = 218
    Height = 445
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = 7891291
    Frames = [frRight]
    ParentBackground = False
    Style = vgSolid
    object ColumnsListView: TEasyListview
      Left = 4
      Top = 2
      Width = 211
      Height = 444
      BackGround.Enabled = True
      CellSizes.Report.Height = 19
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -13
      EditManager.Font.Name = 'Consolas'
      EditManager.Font.Style = []
      UseDockManager = False
      DragManager.Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
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
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
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
      TabOrder = 0
      View = elsReport
      OnDblClick = ColumnsListViewDblClick
      OnItemCheckChange = ColumnsListViewItemCheckChange
      OnItemEdited = ColumnsListViewItemEdited
      OnItemEditEnd = ColumnsListViewItemEditEnd
      OnItemPaintText = ColumnsListViewItemPaintText
      OnKeyAction = ColumnsListViewKeyAction
    end
  end
end
