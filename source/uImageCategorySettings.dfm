object FormImageCategorySettings: TFormImageCategorySettings
  Left = 892
  Top = 468
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Category Settings (Folders, Visibility, Background Color)'
  ClientHeight = 671
  ClientWidth = 930
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelCategoryTitle: TShadowLabel
    Left = 628
    Top = 446
    Width = 110
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'TITLE SNAPSHOT'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Layout = tlCenter
  end
  object LabelImageCategoryBackgroundColor: TShadowLabel
    Left = 634
    Top = 517
    Width = 133
    Height = 16
    Hint = 'Folder [%s]'
    Caption = 'Image Background Color'
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelShowHideCategories: TShadowLabel
    Left = 634
    Top = 479
    Width = 160
    Height = 22
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'HIDE ALL CATEGORIES'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    ColorFrame = clSilver
    ColorInnerFrame = clBlack
    Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
    Transparent = False
    Layout = tlCenter
    OnClick = LabelShowHideCategoriesClick
    OnMouseEnter = LabelShowHideCategoriesMouseEnter
    OnMouseLeave = LabelShowHideCategoriesMouseLeave
  end
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 955
    Height = 410
    BorderStyle = bsNone
    CellSizes.Icon.Height = 82
    CellSizes.Icon.Width = 62
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -9
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000181010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesLarge = IL_Systems
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    ParentFont = False
    ShowThemedBorder = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnItemImageDraw = SystemsItemImageDraw
    OnItemImageGetSize = SystemsItemImageGetSize
    OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
    OnItemPaintText = SystemsItemPaintText
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object PanelImageCategories: TPanelEx
    Left = 0
    Top = 438
    Width = 624
    Height = 233
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ImageCategory_Selector: TEasyListview
      Tag = 1
      Left = 6
      Top = 5
      Width = 632
      Height = 228
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Icon.Height = 78
      CellSizes.Icon.Width = 78
      CellSizes.Tile.Height = 76
      CellSizes.Tile.Width = 102
      Color = 15856113
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -11
      EditManager.Font.Name = 'Consolas'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clBlack
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001DD000000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        00010100000000000132000000FFFFFF1F000100000001000000120000004300
        61007400650067006F00720079002000460075006C006C002000500061007400
        6800000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesExLarge = IL_ImageCategory_ExtraLarge
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.HideCaption = True
      PaintInfoItem.ImageIndent = 0
      PaintInfoItem.ShowBorder = False
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
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
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      OnItemCheckChange = ImageCategory_SelectorItemCheckChange
      OnItemSelectionChanged = ImageCategory_SelectorItemSelectionChanged
    end
  end
  object PanelCategoriesBottom: TPanelEx
    Left = 518
    Top = 617
    Width = 412
    Height = 54
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelImageCategoryFolder: TShadowLabel
      Left = 8
      Top = 12
      Width = 182
      Height = 16
      Hint = 'Image Category Folder [%s]'
      Caption = 'Image Category Folder [.png; .jpg]'
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ImageCategoryFolder: TEditEx
      Tag = 1
      Left = 8
      Top = 29
      Width = 350
      Height = 21
      Hint = 'Select a Folder for Game Snapshots'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      OnChange = ImageCategoryFolderChange
    end
    object ButtonSelectImageCategoryFolder: TBitBtnEx
      Left = 361
      Top = 29
      Width = 47
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonSelectImageCategoryFolderClick
    end
    object ButtonDefaultImageCategoryFolder: TBitBtnEx
      Left = 361
      Top = 6
      Width = 47
      Height = 21
      Hint = 'Use a default folder name assigned by the frontend'
      Caption = 'Default'
      TabOrder = 2
      OnClick = ButtonDefaultImageCategoryFolderClick
    end
    object ButtonResetImageCategoryFolder: TBitBtnEx
      Left = 315
      Top = 6
      Width = 43
      Height = 21
      Hint = 'Reset folder to current'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonResetImageCategoryFolderClick
    end
    object ButtonClearImageCategoryFolder: TBitBtnEx
      Left = 269
      Top = 6
      Width = 43
      Height = 21
      Caption = 'Clear'
      TabOrder = 4
      OnClick = ButtonClearImageCategoryFolderClick
    end
  end
  object ImageCategoryBackgroundColor: TColorBoxEx
    Left = 634
    Top = 533
    Width = 185
    Height = 22
    Hint = 'Image Category Background Color'
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Color = clWhite
    ItemHeight = 16
    TabOrder = 3
    OnSelect = ImageCategoryBackgroundColorSelect
  end
  object ButtonImageCategoryBackgroundColorReset: TBitBtnEx
    Left = 822
    Top = 533
    Width = 43
    Height = 22
    Hint = 'Reset color to current'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonImageCategoryBackgroundColorResetClick
  end
  object ImageSingleBackgroundColorEnabled: TAdvOfficeCheckBoxEx
    Left = 634
    Top = 572
    Width = 155
    Height = 18
    Hint = 'One color to rule them all'
    TabOrder = 5
    Alignment = taLeftJustify
    Caption = 'Single Background Color'
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object ImageSingleBackgroundColor: TColorBoxEx
    Left = 634
    Top = 590
    Width = 185
    Height = 22
    Hint = 'Image Single Background Color'
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Color = clWhite
    ItemHeight = 16
    TabOrder = 6
  end
  object ImageSingleBackgroundColorButtonReset: TBitBtnEx
    Left = 822
    Top = 590
    Width = 43
    Height = 22
    Hint = 'Reset color to current'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object PanelSystemsTitleBottom: TPanelEx
    Left = 0
    Top = 426
    Width = 930
    Height = 12
    Color1 = 15132390
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
  end
  object PanelSystemsTitle: TPanelEx
    Left = 0
    Top = 410
    Width = 930
    Height = 16
    Color1 = clWhite
    Color2 = 15132390
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSystemTitle: TShadowLabel
      Left = 240
      Top = 0
      Width = 450
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 0
      Width = 46
      Height = 19
      Caption = 'ARCADE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSystemNotAvailable: TShadowLabel
      Left = 719
      Top = 0
      Width = 177
      Height = 19
      Caption = 'THIS SYSTEM IS NOT AVAILABLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Visible = False
    end
  end
  object ButtonZippedImages: TBitBtnEx
    Left = 895
    Top = 520
    Width = 25
    Height = 25
    Hint = 'How to use zipped images'
    Caption = '?'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = ButtonZippedImagesClick
  end
  object PanelBottom: TPanelEx
    Left = 822
    Top = 445
    Width = 107
    Height = 72
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Left = 9
      Top = 9
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 9
      Top = 38
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 160
    Top = 120
  end
  object IL_ImageCategory_ExtraLarge: TImageList
    Height = 68
    Width = 68
    Left = 702
    Top = 112
  end
end
