object FormThumbnailViewSettings4K: TFormThumbnailViewSettings4K
  Left = 1246
  Top = 570
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Thumbnail Settings (4K)'
  ClientHeight = 1070
  ClientWidth = 840
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelGridWidthSize: TShadowLabel
    Left = 10
    Top = 463
    Width = 287
    Height = 31
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
    Left = 10
    Top = 586
    Width = 259
    Height = 31
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
    Left = 273
    Top = 413
    Width = 295
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Image Size:               pixels'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
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
    Left = 403
    Top = 413
    Width = 93
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = '128x128'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
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
    Left = 200
    Top = 463
    Width = 37
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = '464'
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
    Left = 172
    Top = 586
    Width = 37
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = '464'
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = False
  end
  object GridWidthSizeLabelBottom: TShadowLabel
    Left = 53
    Top = 542
    Width = 735
    Height = 25
    Caption = '120           190            260            330           400'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object GridHeightSizeLabelBottom: TShadowLabel
    Left = 53
    Top = 666
    Width = 735
    Height = 25
    Caption = '120           190            260            330           400'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object BorderColor: TColorBoxEx
    Left = 10
    Top = 756
    Width = 312
    Height = 36
    Hint = 'Cell Border Color'
    DefaultColorColor = 13158600
    Selected = 13158600
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ButtonArrowShowHD = True
  end
  object ShowBorder: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 710
    Width = 150
    Height = 36
    Hint = 'Show border arround the entire frame'
    ShowHint = True
    TabOrder = 1
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Show Border'
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object BorderColorDefault: TBitBtnEx
    Left = 327
    Top = 756
    Width = 89
    Height = 36
    Hint = 'Set default border color'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ShowGameTitles: TAdvOfficeCheckBoxEx
    Left = 233
    Top = 710
    Width = 185
    Height = 36
    Hint = 'Show/hide captions of games'
    Checked = True
    ShowHint = True
    TabOrder = 3
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Show Game Title'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object MaintainAspectRatio: TAdvOfficeCheckBoxEx
    Left = 582
    Top = 710
    Width = 240
    Height = 36
    Hint = 'Generate thumbnails without distorting the image'
    Checked = True
    ShowHint = True
    TabOrder = 4
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Maintain Aspect Ratio'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object ShowPreviewScreenshotsPanel: TAdvOfficeCheckBoxEx
    Left = 582
    Top = 756
    Width = 255
    Height = 36
    Hint = 
      'Show screenshots along with thumbnails (useful if using multiple' +
      ' layouts)'
    Checked = True
    ShowHint = True
    TabOrder = 5
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Show Screenshots Panel'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object ELV_ThumbnailPreview: TEasyListview
    Left = 10
    Top = 10
    Width = 820
    Height = 402
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000161000000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Height = 38
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
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 6
    View = elsThumbnail
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object ButtonGridWidthSize_Decrease: TBitBtnEx
    Tag = -1
    Left = 10
    Top = 496
    Width = 39
    Height = 39
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object ButtonGridWidthSize_Increase: TBitBtnEx
    Tag = 1
    Left = 791
    Top = 493
    Width = 39
    Height = 39
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object ButtonGridHeightSize_Increase: TBitBtnEx
    Tag = 1
    Left = 791
    Top = 617
    Width = 39
    Height = 39
    Caption = #232
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object ButtonGridHeightSize_Decrease: TBitBtnEx
    Tag = -1
    Left = 10
    Top = 620
    Width = 39
    Height = 39
    Caption = #231
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 999
    Width = 840
    Height = 71
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
      Left = 197
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Apply current settings to thumbnails in games list'
      Caption = 'Update'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonConfirm: TBitBtnEx
      Tag = 1
      Left = 373
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Apply current settings and exit'
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonAbort: TBitBtnEx
      Left = 551
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Ignore changes and restore last settings'
      Caption = 'Abort'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonGridDefault: TBitBtnEx
      Left = 8
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Default Grid Size'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object IconsGroupBox: TAdvGroupBoxEx
    Left = 10
    Top = 814
    Width = 820
    Height = 175
    CheckBox.CustomIconsEnabled = False
    CheckBox.CustomEnableIconHD = False
    RoundEdges = True
    Caption = 'Icons'
    TabOrder = 12
    object ShowSystemIcon: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 82
      Width = 95
      Height = 36
      Checked = True
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'System'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowFavoriteIcon: TAdvOfficeCheckBoxEx
      Left = 442
      Top = 82
      Width = 135
      Height = 36
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Favorite'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowMediaTypeIcon: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 128
      Width = 95
      Height = 36
      Checked = True
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Media'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SystemIconSize: TComboBox2Ex
      Left = 112
      Top = 82
      Width = 217
      Height = 36
      Hint = 'System icon size'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 3
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'Mega Large (68x68)'
      Items.Strings = (
        'Medium (24x24)'
        'Large (32x32)'
        'Extra Large (48x48)'
        'Mega Large (68x68)')
    end
    object ShowGameIcon: TAdvOfficeCheckBoxEx
      Left = 442
      Top = 36
      Width = 135
      Height = 36
      Checked = True
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Game'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ThumbLeftAlignIcons: TAdvOfficeRadioButtonEx
      Tag = 1
      Left = 681
      Top = 82
      Width = 135
      Height = 36
      Hint = 'Show icons at thumbnail'#39's top-left'
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Left Align'
      Checked = True
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ThumbRightAlignIcons: TAdvOfficeRadioButtonEx
      Left = 681
      Top = 130
      Width = 135
      Height = 36
      Hint = 'Show icons at thumbnail'#39's top-right'
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Right Align'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ShowIconsWithNoThumbnail: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 36
      Width = 325
      Height = 36
      Hint = 'Show the overlay icons even if no thumbnail is available'
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show Icons With No Thumbnail'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MediaTypeIconSize: TComboBox2Ex
      Left = 112
      Top = 128
      Width = 217
      Height = 36
      Hint = 'Media/Game/Favorite/Special icon size'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Text = 'Medium (24x24)'
      Items.Strings = (
        'Medium (24x24)'
        'Large (32x32)'
        'Extra Large (48x48)')
    end
    object ShowSpecialIcon: TAdvOfficeCheckBoxEx
      Left = 442
      Top = 130
      Width = 135
      Height = 36
      Checked = True
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Special List'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object GridWidthSize: TXiTrackBar
    Left = 53
    Top = 493
    Width = 734
    Height = 45
    BackColor = 15856113
    TickColor = 7500402
    DisabledTickColor = clSilver
    SlideBorderColor = 7500402
    SlideFaceColor = clWhite
    SlideGradColor = 15395562
    DisabledSlideBorderColor = 12500670
    DisabledSlideFaceColor = 14211288
    DisabledSlideGradColor = 15263976
    DisabledThumbBorderColor = 11908533
    DisabledThumbFaceColor = 15395562
    DisabledThumbGradColor = 13619151
    ThumbBorderColor = 6381921
    ThumbFaceColor = clWhite
    ThumbGradColor = 14145495
    OverThumbBorderColor = 7631988
    OverThumbFaceColor = 13750737
    OverThumbGradColor = 9803157
    DownThumbBorderColor = 7631988
    DownThumbFaceColor = 10066329
    DownThumbGradColor = 12698049
    SmoothCorners = True
    ColorScheme = csWhite
    Max = 400
    Min = 120
    Position = 260
    Frequency = 10
    TickStyle = tsAuto
    TickMarks = tmBottomRight
    Orientation = trHorizontal
  end
  object GridHeightSize: TXiTrackBar
    Left = 53
    Top = 617
    Width = 734
    Height = 45
    BackColor = 15856113
    TickColor = 7500402
    DisabledTickColor = clSilver
    SlideBorderColor = 7500402
    SlideFaceColor = clWhite
    SlideGradColor = 15395562
    DisabledSlideBorderColor = 12500670
    DisabledSlideFaceColor = 14211288
    DisabledSlideGradColor = 15263976
    DisabledThumbBorderColor = 11908533
    DisabledThumbFaceColor = 15395562
    DisabledThumbGradColor = 13619151
    ThumbBorderColor = 6381921
    ThumbFaceColor = clWhite
    ThumbGradColor = 14145495
    OverThumbBorderColor = 7631988
    OverThumbFaceColor = 13750737
    OverThumbGradColor = 9803157
    DownThumbBorderColor = 7631988
    DownThumbFaceColor = 10066329
    DownThumbGradColor = 12698049
    SmoothCorners = True
    ColorScheme = csWhite
    Max = 400
    Min = 120
    Position = 260
    Frequency = 10
    TickStyle = tsAuto
    TickMarks = tmBottomRight
    Orientation = trHorizontal
  end
  object IL_Thumbnail: TImageList
    Height = 128
    Width = 128
    Left = 94
    Top = 415
  end
end
