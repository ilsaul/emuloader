object FormArcadeMAMu_SelectIconFile: TFormArcadeMAMu_SelectIconFile
  Left = 566
  Top = 280
  ActiveControl = FilesListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select Icon Source File'
  ClientHeight = 402
  ClientWidth = 606
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Shape1: TShape
    Left = 0
    Top = 370
    Width = 620
    Height = 1
    Brush.Color = clBtnFace
    Pen.Color = 7891291
  end
  object LabelCurrentSourceFile: TShadowLabel
    Left = 12
    Top = 379
    Width = 106
    Height = 16
    Caption = 'Current Source File:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
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
  object FilesListView: TEasyListview
    Left = 0
    Top = 0
    Width = 606
    Height = 370
    Align = alTop
    BackGround.Enabled = True
    CellSizes.Tile.Height = 52
    CellSizes.Tile.Width = 194
    CellSizes.Report.Height = 20
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000010001FA000000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000173000000FFFFFF1F0001000000010000000400000053006900
      7A006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE00060000008008000101010102000000000001EB000000FF
      FFFF1F0001000000010000000B000000440061007400650020002F0020005400
      69006D006500000000000000000000000000}
    Header.Draggable = False
    Header.Height = 23
    Header.Sizeable = False
    Header.Visible = True
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesExLarge = IL_IconFiles
    PaintInfoColumn.Border = 2
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileDetailCount = 2
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
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnItemCompare = FilesListViewItemCompare
    OnItemPaintText = FilesListViewItemPaintText
  end
  object ButtonOk: TBitBtnEx
    Left = 413
    Top = 374
    Width = 89
    Height = 25
    Hint = 'Close and update selected file'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TBitBtnEx
    Left = 511
    Top = 374
    Width = 89
    Height = 25
    Hint = 'Close without updating selected file'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object IL_IconFiles: TImageList
    Height = 32
    Width = 32
    Left = 48
    Top = 344
  end
end
