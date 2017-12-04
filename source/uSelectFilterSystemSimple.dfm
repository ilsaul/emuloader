object FormSelectFilterSystemSimple: TFormSelectFilterSystemSimple
  Left = 666
  Top = 278
  ActiveControl = ConsCompSystemsListView
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Systems Quick Filter'
  ClientHeight = 351
  ClientWidth = 812
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelButtons: TPanelEx
    Left = 0
    Top = 299
    Width = 812
    Height = 52
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelMultiSelect: TShadowLabel
      Left = 300
      Top = 2
      Width = 212
      Height = 16
      Caption = 'Hold Ctrl or Shift for multiple selections'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object ButtonOk: TBitBtn
      Left = 617
      Top = 19
      Width = 89
      Height = 25
      Hint = 'Close and enable the quick filter'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 715
      Top = 19
      Width = 89
      Height = 25
      Hint = 'Close without changing filters'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonReset: TBitBtn
      Left = 8
      Top = 19
      Width = 89
      Height = 25
      Hint = 'Reset filter selection(s) to current'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonResetClick
    end
    object ButtonHelp: TBitBtn
      Left = 568
      Top = 19
      Width = 43
      Height = 25
      Hint = 'Why another systems filter ?'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
  end
  object ConsCompSystemsListView: TEasyListview
    Tag = -1
    Left = 4
    Top = 2
    Width = 820
    Height = 296
    BorderStyle = bsNone
    CellSizes.Tile.Height = 42
    CellSizes.Tile.Width = 186
    CellSizes.Report.Height = 28
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Trebuchet MS'
    EditManager.Font.Style = []
    UseDockManager = False
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
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000134030000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesExLarge = IL_Systems
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 0
    PaintInfoItem.ImageIndent = 0
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileDetailCount = 2
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
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsTile
    OnDblClick = ConsCompSystemsListViewDblClick
    OnItemImageDraw = ConsCompSystemsListViewItemImageDraw
    OnItemImageGetSize = ConsCompSystemsListViewItemImageGetSize
    OnItemImageDrawIsCustom = ConsCompSystemsListViewItemImageDrawIsCustom
    OnItemPaintText = ConsCompSystemsListViewItemPaintText
    OnItemSelectionChanged = ConsCompSystemsListViewItemSelectionChanged
    OnKeyAction = ConsCompSystemsListViewKeyAction
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 56
    Top = 56
  end
end
