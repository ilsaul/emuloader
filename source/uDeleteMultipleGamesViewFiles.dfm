object FormDeleteMultipleGamesViewFiles: TFormDeleteMultipleGamesViewFiles
  Left = 688
  Top = 309
  ActiveControl = FilesListViewDeleteMulti
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Multiple Games [Viewing Files Details]'
  ClientHeight = 572
  ClientWidth = 734
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
  object FilesListViewDeleteMulti: TEasyListview
    Left = 0
    Top = 0
    Width = 734
    Height = 512
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
    GroupFont.Height = -16
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
    ImagesGroup = FormMain.IL_StandardIconsLarge
    ImagesExLarge = IL_MediaType
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.BandIndent = 40
    PaintInfoGroup.BandLength = 515
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 80
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ExpandImageIndent = 6
    PaintInfoGroup.ImageIndent = 30
    PaintInfoGroup.MarginBottom.Size = 10
    PaintInfoGroup.MarginBottom.Visible = True
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 43
    PaintInfoItem.ImageIndent = 33
    PaintInfoItem.TileCaptionLines = 1
    PaintInfoItem.TileDetailCount = 3
    ParentFont = False
    ParentShowHint = False
    ShowGroupMargins = True
    ShowThemedBorder = False
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
    OnGroupImageDraw = FilesListViewDeleteMultiGroupImageDraw
    OnGroupImageDrawIsCustom = FilesListViewDeleteMultiGroupImageDrawIsCustom
    OnGroupPaintText = FilesListViewDeleteMultiGroupPaintText
    OnItemPaintText = FilesListViewDeleteMultiItemPaintText
    OnKeyAction = FilesListViewDeleteMultiKeyAction
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 512
    Width = 734
    Height = 60
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
      Left = 8
      Top = 5
      Width = 76
      Height = 16
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
      Left = 280
      Top = 12
      Width = 240
      Height = 37
      Caption = 
        'NOTE: Ghosted files will not be deleted. They are shown here jus' +
        't for information.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
    object ButtonClose: TBitBtnEx
      Left = 658
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
