object FormFavoritesManagerCleanseProfile: TFormFavoritesManagerCleanseProfile
  Left = 1403
  Top = 755
  Width = 730
  Height = 680
  BorderIcons = [biSystemMenu]
  Caption = 'Cleanse Favorites Profile of Impurities'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelTopMessage: TShadowLabel
    Left = 12
    Top = 8
    Width = 392
    Height = 16
    Caption = 
      'Invalid entries from current games list. Remove the ones you wis' +
      'h to keep.'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelTotal: TShadowLabel
    Left = 586
    Top = 8
    Width = 121
    Height = 16
    Alignment = taRightJustify
    Caption = 'Total: 000000 of 000000'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object FavoritesCleanseList: TEasyListview
    Left = 8
    Top = 32
    Width = 698
    Height = 561
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 22
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_MenuPopup
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clWindowText
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000001000190010000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000113010000FFFFFF1F0001000000010000000600000053007900
      7300740065006D00000000000100000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008000000101000102000000
      00000132000000FFFFFF1F00010000000100000011000000470061006D006500
      200045006E00740072007900200053007400720069006E006700000000000000
      000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsLarge
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.Size = 0
    PaintInfoGroup.MarginBottom.Visible = True
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 20
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileDetailCount = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Selection.BlendAlphaImage = 0
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
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnColumnClick = FavoritesCleanseListColumnClick
    OnItemCompare = FavoritesCleanseListItemCompare
    OnKeyAction = FavoritesCleanseListKeyAction
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 600
    Width = 714
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonAbort: TBitBtnEx
      Left = 363
      Top = 10
      Width = 75
      Height = 23
      Caption = 'Abort'
      ModalResult = 2
      TabOrder = 0
    end
    object ButtonConfirm: TBitBtnEx
      Left = 275
      Top = 10
      Width = 75
      Height = 23
      Caption = 'Continue'
      ModalResult = 1
      TabOrder = 1
    end
    object ButtonRemoveSelected: TBitBtnEx
      Left = 10
      Top = 10
      Width = 135
      Height = 23
      Caption = 'Remove Selected [DEL]'
      TabOrder = 2
      OnClick = ButtonRemoveSelectedClick
    end
  end
end
