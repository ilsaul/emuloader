object FormDeleteMultipleGamesViewFiles: TFormDeleteMultipleGamesViewFiles
  Left = 688
  Top = 309
  ActiveControl = FilesListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Multiple Games [Viewing Files Details]'
  ClientHeight = 512
  ClientWidth = 584
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object FilesListView: TEasyListview
    Left = 0
    Top = 0
    Width = 584
    Height = 452
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Tile.Width = 582
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -13
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsBold]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000177020000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    ImagesGroup = FormMain.IL_StandardIconsStandard
    ImagesExLarge = IL_MediaType
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandIndent = 32
    PaintInfoGroup.BandLength = 400
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 60
    PaintInfoGroup.CaptionLines = 2
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ExpandImageIndent = 6
    PaintInfoGroup.ImageIndent = 30
    PaintInfoGroup.MarginBottom.Size = 10
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 40
    PaintInfoItem.ImageIndent = 30
    PaintInfoItem.TileDetailCount = 3
    ParentFont = False
    ParentShowHint = False
    ShowGroupMargins = True
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.Gradient = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    OnGroupImageDraw = FilesListViewGroupImageDraw
    OnGroupImageDrawIsCustom = FilesListViewGroupImageDrawIsCustom
    OnItemPaintText = FilesListViewItemPaintText
    OnKeyAction = FilesListViewKeyAction
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 452
    Width = 584
    Height = 60
    Align = alBottom
    Color1 = 15856113
    Color2 = 1117964
    Color3 = 1117964
    Color4 = clMaroon
    ColorFrame = 7891291
    Frames = [frTop]
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object LabelTotalItems: TShadowLabel
      Left = 8
      Top = 5
      Width = 90
      Height = 18
      Caption = '000000 Games'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelGhostedFiles: TShadowLabel
      Left = 208
      Top = 12
      Width = 261
      Height = 37
      Caption = 
        'NOTE: Ghosted files will not be deleted. They are shown here jus' +
        't for information.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      WordWrap = True
    end
    object ButtonShowFileTypes: TBitBtn
      Left = 8
      Top = 27
      Width = 158
      Height = 25
      Hint = 
        'Show all files or only the ones that will be deleted, based on f' +
        'ile types selection'
      Caption = 'Show Only Files to Delete'
      TabOrder = 0
      OnClick = ButtonShowFileTypesClick
    end
    object ButtonClose: TBitBtn
      Left = 508
      Top = 27
      Width = 68
      Height = 25
      Hint = 'Close this window'
      Caption = 'Close'
      ModalResult = 7
      TabOrder = 1
    end
  end
  object IL_MediaType: TImageList
    Height = 48
    Width = 48
    Left = 16
    Top = 176
  end
end
