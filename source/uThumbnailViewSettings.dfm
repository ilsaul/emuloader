object FormThumbnailView: TFormThumbnailView
  Left = 600
  Top = 600
  ActiveControl = GridWidthSize
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Thumbnail Settings'
  ClientHeight = 632
  ClientWidth = 836
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
  object LabelGridWidthSize: TShadowLabel
    Left = 8
    Top = 446
    Width = 160
    Height = 16
    Hint = 'Cell Horizontal Size [%u pixels]'
    AutoSize = False
    Caption = 'Cell Horizontal Size:        pixels'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelGridHeightSize: TShadowLabel
    Left = 8
    Top = 518
    Width = 144
    Height = 16
    AutoSize = False
    Caption = 'Cell Vertical Size:        pixels'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelImageSize: TShadowLabel
    Left = 333
    Top = 413
    Width = 170
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Image Size:              pixels'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
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
  object LabelImageSizeValue: TShadowLabel
    Left = 407
    Top = 413
    Width = 54
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '128x128'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
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
  object LabelGridWidthSizeValue: TShadowLabel
    Left = 112
    Top = 446
    Width = 25
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = '144'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = False
  end
  object LabelGridHeightSizeValue: TShadowLabel
    Left = 96
    Top = 518
    Width = 25
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = '178'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = False
  end
  object GridWidthSize: TExTrackBar
    Left = 25
    Top = 462
    Width = 345
    Height = 45
    Max = 400
    Min = 120
    PageSize = 10
    Frequency = 10
    Position = 144
    TabOrder = 0
    OnChange = GridWidthSizeChange
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    LabelsFactor = 1
    LabelsFactorOperation = foMul
    LabelsInterval = 40
    SelEnable = False
  end
  object BorderColor: TColorBoxEx
    Left = 430
    Top = 466
    Width = 189
    Height = 22
    Hint = 'Cell Border Color'
    DefaultColorColor = 10902593
    Selected = 10902593
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnSelect = BorderColorSelect
  end
  object ShowBorder: TAdvOfficeCheckBoxEx
    Left = 430
    Top = 444
    Width = 99
    Height = 20
    Hint = 'Show border arround the entire frame'
    ShowHint = True
    TabOrder = 2
    OnClick = ShowBorderClick
    Alignment = taLeftJustify
    Caption = 'Show Border'
    ReturnIsTab = False
    Themed = True
  end
  object BorderColorDefault: TBitBtnEx
    Left = 620
    Top = 466
    Width = 49
    Height = 22
    Hint = 'Set default border color'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BorderColorDefaultClick
  end
  object ShowGameTitles: TAdvOfficeCheckBoxEx
    Left = 561
    Top = 444
    Width = 112
    Height = 20
    Hint = 'Show/hide captions of games'
    Checked = True
    ShowHint = True
    TabOrder = 4
    OnClick = ShowGameTitlesClick
    Alignment = taLeftJustify
    Caption = 'Show Game Title'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object MaintainAspectRatio: TAdvOfficeCheckBoxEx
    Left = 684
    Top = 444
    Width = 140
    Height = 20
    Hint = 'Generate thumbnails without distorting the image'
    Checked = True
    ShowHint = True
    TabOrder = 5
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Maintain Aspect Ratio'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowPreviewScreenshotsPanel: TAdvOfficeCheckBoxEx
    Left = 684
    Top = 468
    Width = 150
    Height = 20
    Hint = 
      'Show screenshots along with thumbnails (useful if using multiple' +
      ' layouts)'
    Checked = True
    ShowHint = True
    TabOrder = 6
    Alignment = taLeftJustify
    Caption = 'Show Screenshots Panel'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object GridHeightSize: TExTrackBar
    Left = 25
    Top = 534
    Width = 345
    Height = 45
    Max = 400
    Min = 120
    PageSize = 10
    Frequency = 10
    Position = 178
    TabOrder = 7
    OnChange = GridHeightSizeChange
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    LabelsFactor = 1
    LabelsFactorOperation = foMul
    LabelsInterval = 40
    SelEnable = False
  end
  object ELV_ThumbnailPreview: TEasyListview
    Left = 8
    Top = 8
    Width = 146
    Height = 176
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000161000000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Height = 23
    ImagesExLarge = IL_Thumbnail
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    Scrollbars.HorzEnabled = False
    Scrollbars.SnapHorzView = False
    Scrollbars.VertEnabled = False
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
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 8
    View = elsThumbnail
    OnItemPaintText = ELV_ThumbnailPreviewItemPaintText
    OnItemThumbnailDraw = ELV_ThumbnailPreviewItemThumbnailDraw
  end
  object ButtonGridWidthSize_Decrease: TBitBtnEx
    Tag = -1
    Left = 8
    Top = 462
    Width = 22
    Height = 22
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = ButtonGridWidthSize_DecreaseClick
  end
  object ButtonGridWidthSize_Increase: TBitBtnEx
    Tag = 1
    Left = 365
    Top = 462
    Width = 22
    Height = 22
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = ButtonGridWidthSize_DecreaseClick
  end
  object ButtonGridHeightSize_Increase: TBitBtnEx
    Tag = 1
    Left = 365
    Top = 534
    Width = 22
    Height = 22
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = ButtonGridHeightSize_DecreaseClick
  end
  object ButtonGridHeightSize_Decrease: TBitBtnEx
    Tag = -1
    Left = 8
    Top = 534
    Width = 22
    Height = 22
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = ButtonGridHeightSize_DecreaseClick
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 590
    Width = 836
    Height = 42
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonApply: TBitBtnEx
      Left = 277
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Apply current settings to thumbnails in games list'
      Caption = 'Update'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonApplyClick
    end
    object ButtonConfirm: TBitBtnEx
      Tag = 1
      Left = 373
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Apply current settings and exit'
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonApplyClick
    end
    object ButtonAbort: TBitBtnEx
      Left = 471
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Ignore changes and restore last settings'
      Caption = 'Abort'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonAbortClick
    end
    object ButtonGridDefault: TBitBtnEx
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Default Grid Size'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonGridDefaultClick
    end
  end
  object IconsGroupBox: TAdvGroupBoxEx
    Left = 430
    Top = 488
    Width = 397
    Height = 95
    Transparent = False
    RoundEdges = True
    Caption = 'Icons'
    TabOrder = 14
    object ShowSystemIcon: TAdvOfficeCheckBoxEx
      Left = 6
      Top = 44
      Width = 62
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 0
      OnClick = ShowSystemIconClick
      Alignment = taLeftJustify
      Caption = 'System'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object ShowFavoriteIcon: TAdvOfficeCheckBoxEx
      Left = 204
      Top = 44
      Width = 67
      Height = 20
      ShowHint = True
      TabOrder = 1
      OnClick = ShowFavoriteIconClick
      Alignment = taLeftJustify
      Caption = 'Favorite'
      ReturnIsTab = False
      Themed = True
    end
    object ShowMediaTypeIcon: TAdvOfficeCheckBoxEx
      Left = 6
      Top = 68
      Width = 59
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 2
      OnClick = ShowMediaTypeIconClick
      Alignment = taLeftJustify
      Caption = 'Media'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object SystemIconSize: TComboBox2Ex
      Left = 68
      Top = 42
      Width = 125
      Height = 23
      Hint = 'System icon size'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 15
      ItemIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'Large (32x32)'
      OnSelect = SystemIconSizeSelect
      Items.Strings = (
        'Medium (24x24)'
        'Large (32x32)'
        'Extra Large (48x48)')
    end
    object ShowGameIcon: TAdvOfficeCheckBoxEx
      Left = 204
      Top = 20
      Width = 57
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 4
      OnClick = ShowGameIconClick
      Alignment = taLeftJustify
      Caption = 'Game'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object ThumbLeftAlignIcons: TAdvOfficeRadioButtonEx
      Tag = 1
      Left = 316
      Top = 44
      Width = 75
      Height = 20
      Hint = 'Show icons at thumbnail'#39's top-left'
      TabOrder = 5
      TabStop = True
      OnClick = ThumbLeftAlignIconsClick
      Alignment = taLeftJustify
      Caption = 'Left Align'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object ThumbRightAlignIcons: TAdvOfficeRadioButtonEx
      Left = 316
      Top = 68
      Width = 79
      Height = 20
      Hint = 'Show icons at thumbnail'#39's top-right'
      TabOrder = 6
      OnClick = ThumbLeftAlignIconsClick
      Alignment = taLeftJustify
      Caption = 'Right Align'
      ReturnIsTab = False
      Themed = True
    end
    object ShowIconsWithNoThumbnail: TAdvOfficeCheckBoxEx
      Left = 6
      Top = 20
      Width = 190
      Height = 20
      Hint = 'Show the overlay icons even if no thumbnail is available'
      ShowHint = True
      TabOrder = 7
      OnClick = ShowIconsWithNoThumbnailClick
      Alignment = taLeftJustify
      Caption = 'Show Icons With No Thumbnail'
      ReturnIsTab = False
      Themed = True
    end
    object MediaTypeIconSize: TComboBox2Ex
      Left = 68
      Top = 66
      Width = 125
      Height = 23
      Hint = 'Media/Game/Favorite/Special icon size'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 15
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Text = 'Medium (24x24)'
      OnSelect = MediaTypeIconSizeSelect
      Items.Strings = (
        'Medium (24x24)'
        'Large (32x32)'
        'Extra Large (48x48)')
    end
    object ShowSpecialIcon: TAdvOfficeCheckBoxEx
      Left = 204
      Top = 68
      Width = 78
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 9
      OnClick = ShowSpecialIconClick
      Alignment = taLeftJustify
      Caption = 'Special List'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
  end
  object IL_Thumbnail: TImageList
    Height = 128
    Width = 128
    Left = 300
    Top = 424
  end
end
