object FormDeleteMultipleGamesViewFiles4K: TFormDeleteMultipleGamesViewFiles4K
  Left = 889
  Top = 466
  ActiveControl = FilesListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Multiple Games [Viewing Files Details] 4K'
  ClientHeight = 572
  ClientWidth = 1400
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
  object FilesListView: TEasyListview
    Left = 0
    Top = 0
    Width = 1400
    Height = 487
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Tile.Width = 732
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
    GroupFont.Name = 'Verdana'
    GroupFont.Style = [fsBold]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000000018D020000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    ImagesGroup = FormDeleteMultipleGamesFiles.IL_StandardIcons68
    ImagesExLarge = IL_MediaType
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandIndent = 28
    PaintInfoGroup.BandLength = 515
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 56
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ExpandImageIndent = 6
    PaintInfoGroup.ImageIndent = 30
    PaintInfoGroup.MarginBottom.Size = 10
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 40
    PaintInfoItem.ImageIndent = 20
    PaintInfoItem.TileDetailCount = 3
    ParentFont = False
    ParentShowHint = False
    ShowGroupMargins = True
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 487
    Width = 1400
    Height = 85
    Align = alBottom
    Color1 = 15856113
    Color2 = 1117964
    Color3 = 1117964
    Color4 = clMaroon
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object LabelTotalItems: TShadowLabel
      Left = 274
      Top = 37
      Width = 138
      Height = 31
      Caption = '000000 Games'
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelGhostedFiles: TShadowLabel
      Left = 595
      Top = 14
      Width = 413
      Height = 55
      Caption = 
        'NOTE: Ghosted files will not be deleted. They are shown here jus' +
        't for information.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
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
      WordWrap = True
    end
    object ButtonShowFileTypes: TBitBtnEx
      Left = 8
      Top = 30
      Width = 260
      Height = 45
      Hint = 
        'Show all files or only the ones that will be deleted, based on f' +
        'ile types selection'
      Caption = 'Show Only Files to Delete'
      TabOrder = 0
    end
    object ButtonClose: TBitBtnEx
      Left = 1222
      Top = 30
      Width = 168
      Height = 45
      Hint = 'Close this window'
      Caption = 'Close'
      ModalResult = 7
      TabOrder = 1
    end
  end
  object IL_MediaType: TImageList
    Height = 68
    Width = 68
    Left = 16
    Top = 176
  end
end
