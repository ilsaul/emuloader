object FormConsCompSelectEmulator: TFormConsCompSelectEmulator
  Left = 1554
  Top = 567
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select Emulator To Be Used For Each System (Console/Computer)'
  ClientHeight = 612
  ClientWidth = 644
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelTips: TLabel
    Left = 8
    Top = 570
    Width = 384
    Height = 36
    Alignment = taCenter
    Caption = 
      'Use games popup menu to enable/disable "mount images on a virtua' +
      'l drive", or quickly select an emulator for a system (mouse righ' +
      't-click).'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
    WordWrap = True
  end
  object BottomFrame: TShape
    Left = 0
    Top = 563
    Width = 644
    Height = 1
    Pen.Color = 7891291
  end
  object EmulatorsList: TEasyListview
    Tag = -1
    Left = 6
    Top = 7
    Width = 638
    Height = 552
    BackGround.Enabled = True
    BackGround.OffsetX = -17
    BackGround.OffsetY = -17
    BackGround.Tile = False
    BorderStyle = bsNone
    CellSizes.Tile.Height = 38
    CellSizes.Tile.Width = 615
    CellSizes.Report.Height = 26
    CellSizes.Report.Width = 466
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001D2010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Height = 23
    ImagesGroup = IL_Systems
    ImagesLarge = IL_EmulatorIcon
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ImageIndent = 6
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 42
    PaintInfoItem.CheckIndent = 15
    PaintInfoItem.CheckSize = 13
    PaintInfoItem.CheckType = ectRadio
    PaintInfoItem.TileDetailCount = 2
    ParentColor = True
    Scrollbars.HorzEnabled = False
    ShowGroupMargins = True
    ShowThemedBorder = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    OnGroupPaintText = EmulatorsListGroupPaintText
    OnItemCheckChange = EmulatorsListItemCheckChange
    OnItemPaintText = EmulatorsListItemPaintText
  end
  object ButtonOk: TBitBtn
    Left = 438
    Top = 576
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Apply'
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TBitBtn
    Left = 544
    Top = 576
    Width = 89
    Height = 25
    Hint = 'Abort changes'
    Caption = 'Abort'
    ModalResult = 2
    TabOrder = 2
  end
  object IL_EmulatorIcon: TImageList
    Height = 24
    Width = 24
    Left = 56
    Top = 160
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 96
    Top = 160
  end
end
