object FormArcadeGamesFilter: TFormArcadeGamesFilter
  Left = 728
  Top = 280
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Arcade Games Filters'
  ClientHeight = 486
  ClientWidth = 522
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
  object FiltersListView: TEasyListview
    Tag = 1
    Left = 0
    Top = 0
    Width = 522
    Height = 437
    HelpContext = 1
    Align = alClient
    BorderStyle = bsNone
    BorderWidth = 4
    CellSizes.Tile.Width = 193
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = 3289650
    GroupFont.Height = -11
    GroupFont.Name = 'Verdana'
    GroupFont.Style = [fsBold]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001DD000000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_MenuPopup
    ImagesLarge = IL_MainFiltersMAME
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandIndent = 40
    PaintInfoGroup.BandLength = 318
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 5
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ExpandImageIndent = 25
    PaintInfoGroup.ImageIndent = 35
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 25
    PaintInfoItem.Border = 1
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 0
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    ShowGroupMargins = True
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
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnGroupClick = FiltersListViewGroupClick
    OnItemDblClick = FiltersListViewItemDblClick
    OnItemSelectionChanged = FiltersListViewItemSelectionChanged
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 437
    Width = 522
    Height = 49
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelToolBarIconSize: TShadowLabel
      Tag = 2
      Left = 105
      Top = 5
      Width = 75
      Height = 16
      Caption = 'View Icon Size'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelIconSizeValue: TShadowLabel
      Left = 206
      Top = 22
      Width = 82
      Height = 16
      Caption = '> Large (48x48)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object IconSizeExtraLarge: TSpeedButtonEx
      Tag = 1
      Left = 130
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Extra large icons (68x68)'
      GroupIndex = 1
      Caption = 'XL'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object IconSizeLarge: TSpeedButtonEx
      Tag = 2
      Left = 155
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Large icons (48x48)'
      GroupIndex = 1
      Down = True
      Caption = 'L'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object IconSizeSmall: TSpeedButtonEx
      Tag = 3
      Left = 180
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Small Icons (30x24)'
      GroupIndex = 1
      Caption = 'S'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object IconSize4KUltraHD: TSpeedButtonEx
      Left = 105
      Top = 20
      Width = 24
      Height = 20
      Hint = '4K UltraHD icons (128x128)'
      GroupIndex = 1
      Caption = '4K'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object ButtonGoToCurrentFilter: TBitBtnEx
      Left = 8
      Top = 16
      Width = 89
      Height = 25
      Hint = 'Select current filter'
      Caption = 'Go to Current'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonGoToCurrentFilterClick
    end
    object ButtonOk: TBitBtnEx
      Left = 328
      Top = 16
      Width = 89
      Height = 25
      Hint = 'Close and update filter'
      Caption = 'Apply'
      ModalResult = 1
      TabOrder = 1
    end
    object ButtonCancel: TBitBtnEx
      Left = 425
      Top = 16
      Width = 89
      Height = 25
      Hint = 'Close without changing filter'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object IL_MainFiltersMAME: TImageList
    Height = 48
    Width = 48
    Left = 184
    Top = 360
  end
end
