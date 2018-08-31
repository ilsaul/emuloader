object FormThumbnailView: TFormThumbnailView
  Left = 600
  Top = 600
  ActiveControl = GridWidthSize
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Thumbnail Settings'
  ClientHeight = 392
  ClientWidth = 619
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
    Top = 8
    Width = 185
    Height = 16
    Hint = 'Cell Horizontal Size [%u pixels]'
    AutoSize = False
    Caption = 'Cell Horizontal Size [144 pixels]'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
  end
  object LabelGridHeightSize: TShadowLabel
    Left = 8
    Top = 80
    Width = 185
    Height = 16
    Hint = 'Cell Vertical Size [%u pixels]'
    AutoSize = False
    Caption = 'Cell Vertical Size [174 pixels]'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
  end
  object LabelImageSize: TShadowLabel
    Left = 396
    Top = 8
    Width = 146
    Height = 18
    Hint = 'Image Size: %ux%u'
    AutoSize = False
    Caption = 'Image Size: 128x128'
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
    Transparent = False
  end
  object GridWidthSize: TExTrackBar
    Left = 25
    Top = 24
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
  object ButtonGridDefault: TBitBtn
    Left = 8
    Top = 150
    Width = 105
    Height = 25
    Caption = 'Default Grid Size'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonGridDefaultClick
  end
  object BorderColor: TColorBox
    Left = 8
    Top = 210
    Width = 181
    Height = 22
    Hint = 'Select a border color'
    DefaultColorColor = 10902593
    Selected = 10902593
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnSelect = BorderColorSelect
  end
  object ShowBorder: TAdvOfficeCheckBox
    Left = 8
    Top = 188
    Width = 161
    Height = 20
    Hint = 'Show border arround the entire frame'
    ShowHint = True
    TabOrder = 3
    OnClick = ShowBorderClick
    Alignment = taLeftJustify
    Caption = 'Show Border'
    ReturnIsTab = False
    Themed = True
  end
  object BorderColorDefault: TBitBtn
    Left = 190
    Top = 210
    Width = 49
    Height = 22
    Hint = 'Set default border color'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BorderColorDefaultClick
  end
  object ShowGameTitles: TAdvOfficeCheckBox
    Left = 8
    Top = 241
    Width = 121
    Height = 20
    Hint = 'Show/hide captions of games'
    Checked = True
    ShowHint = True
    TabOrder = 5
    OnClick = ShowGameTitlesClick
    Alignment = taLeftJustify
    Caption = 'Show Game Title'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ButtonApply: TBitBtn
    Left = 55
    Top = 359
    Width = 89
    Height = 25
    Hint = 'Apply current settings to thumbnails in games list'
    Caption = 'Update'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = ButtonApplyClick
  end
  object ButtonAbort: TBitBtn
    Left = 249
    Top = 359
    Width = 89
    Height = 25
    Hint = 'Ignore changes and restore last settings'
    Caption = 'Abort'
    ModalResult = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = ButtonAbortClick
  end
  object ButtonConfirm: TBitBtn
    Tag = 1
    Left = 151
    Top = 359
    Width = 89
    Height = 25
    Hint = 'Apply current settings and exit'
    Caption = 'Confirm'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ButtonApplyClick
  end
  object MaintainAspectRatio: TAdvOfficeCheckBox
    Left = 8
    Top = 264
    Width = 140
    Height = 20
    Hint = 'Generate thumbnails without distorting the image'
    Checked = True
    ShowHint = True
    TabOrder = 9
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Maintain Aspect Ratio'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowSystemIcon: TAdvOfficeCheckBox
    Left = 256
    Top = 188
    Width = 121
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 10
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Show System Icon'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowFavoriteIcon: TAdvOfficeCheckBox
    Left = 256
    Top = 264
    Width = 121
    Height = 20
    ShowHint = True
    TabOrder = 11
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Show Favorite Icon'
    ReturnIsTab = False
    Themed = True
  end
  object AlphaBlendedIcons: TAdvOfficeCheckBox
    Left = 8
    Top = 287
    Width = 133
    Height = 20
    Hint = 'Don'#39't show the white background'
    Checked = True
    ShowHint = True
    TabOrder = 12
    Visible = False
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Alpha Blended Icons'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object SystemIconSize: TComboBox
    Left = 257
    Top = 210
    Width = 127
    Height = 23
    Hint = 'System icon size'
    Style = csDropDownList
    ItemHeight = 15
    ItemIndex = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Text = 'Large (32x32)'
    OnSelect = SystemIconSizeSelect
    Items.Strings = (
      'Medium (24x24)'
      'Large (32x32)'
      'Extra Large (48x48)')
  end
  object ShowGameIcon: TAdvOfficeCheckBox
    Left = 256
    Top = 241
    Width = 114
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 14
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Show Game Icon'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowPreviewScreenshotsPanel: TAdvOfficeCheckBox
    Left = 8
    Top = 310
    Width = 153
    Height = 20
    Hint = 
      'Show screenshots along with thumbnails (useful if using multiple' +
      ' layouts)'
    Checked = True
    ShowHint = True
    TabOrder = 15
    Alignment = taLeftJustify
    Caption = 'Enable Screenshots Panel'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object GridHeightSize: TExTrackBar
    Left = 25
    Top = 96
    Width = 345
    Height = 45
    Max = 400
    Min = 120
    PageSize = 10
    Frequency = 10
    Position = 174
    TabOrder = 16
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
    Left = 394
    Top = 32
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
    TabOrder = 17
    View = elsThumbnail
    OnItemPaintText = ELV_ThumbnailPreviewItemPaintText
    OnItemThumbnailDraw = ELV_ThumbnailPreviewItemThumbnailDraw
  end
  object ButtonGridWidthSize_Decrease: TBitBtn
    Tag = -1
    Left = 8
    Top = 24
    Width = 22
    Height = 22
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = ButtonGridWidthSize_DecreaseClick
  end
  object ButtonGridWidthSize_Increase: TBitBtn
    Tag = 1
    Left = 365
    Top = 24
    Width = 22
    Height = 22
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = ButtonGridWidthSize_DecreaseClick
  end
  object ButtonGridHeightSize_Increase: TBitBtn
    Tag = 1
    Left = 365
    Top = 96
    Width = 22
    Height = 22
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = ButtonGridHeightSize_DecreaseClick
  end
  object ButtonGridHeightSize_Decrease: TBitBtn
    Tag = -1
    Left = 8
    Top = 96
    Width = 22
    Height = 22
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = ButtonGridHeightSize_DecreaseClick
  end
  object ThumbLeftAlignIcons: TAdvOfficeRadioButton
    Left = 256
    Top = 287
    Width = 107
    Height = 20
    Hint = 'Show icons at thumbnail'#39's top-left'
    TabOrder = 22
    TabStop = True
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Left Align Icons'
    Checked = True
    ReturnIsTab = False
    Themed = True
  end
  object ThumbRightAlignIcons: TAdvOfficeRadioButton
    Left = 256
    Top = 310
    Width = 113
    Height = 20
    Hint = 'Show icons at thumbnail'#39's top-right'
    TabOrder = 23
    OnClick = MaintainAspectRatioClick
    Alignment = taLeftJustify
    Caption = 'Right Align Icons'
    ReturnIsTab = False
    Themed = True
  end
  object IL_Thumbnail: TImageList
    Height = 128
    Width = 128
    Left = 432
    Top = 280
  end
end
