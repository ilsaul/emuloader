object FormImageCategorySettings: TFormImageCategorySettings
  Left = 892
  Top = 468
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Category Settings (Folders, Visibility, Background Color)'
  ClientHeight = 632
  ClientWidth = 1000
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
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 712
    Height = 574
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
    OnItemPaintText = SystemsItemPaintText
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object PanelImageCategories: TPanelEx
    Left = 682
    Top = 0
    Width = 318
    Height = 481
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft]
    ParentBackground = False
    Style = vgSolid
    object ImageCategory_Selector: TEasyListview
      Tag = 1
      Left = 6
      Top = 5
      Width = 340
      Height = 460
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Icon.Height = 78
      CellSizes.Icon.Width = 78
      CellSizes.Tile.Height = 76
      CellSizes.Tile.Width = 102
      Color = clWhite
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
      OnItemCheckChange = ImageCategory_SelectorItemCheckChange
      OnItemSelectionChanged = ImageCategory_SelectorItemSelectionChanged
    end
    object PanelCategoryTitle: TPanelEx
      Left = 1
      Top = 465
      Width = 317
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
      object LabelCategoryTitle: TShadowLabel
        Left = 8
        Top = 0
        Width = 302
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'CATEGORY TITLE'
        Color = 16448250
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold, fsItalic]
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
    end
  end
  object PanelImageCategorySelector: TPanelEx
    Left = 0
    Top = 574
    Width = 1000
    Height = 58
    Align = alBottom
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSolid
    object LabelImageCategoryFolder: TShadowLabel
      Left = 8
      Top = 12
      Width = 142
      Height = 16
      Hint = 'Images Folder [%s]'
      Caption = 'Images Folder [.png; .jpg]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelImageBackgroundColor: TShadowLabel
      Left = 496
      Top = 12
      Width = 102
      Height = 16
      Hint = 'Folder [%s]'
      Caption = 'Background Color'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonResetImageCategoryFolder: TBitBtnEx
      Left = 382
      Top = 7
      Width = 43
      Height = 21
      Hint = 'Reset folder to current'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonResetImageCategoryFolderClick
    end
    object ButtonClearImageCategoryFolder: TBitBtnEx
      Left = 338
      Top = 7
      Width = 43
      Height = 21
      Caption = 'Clear'
      TabOrder = 1
      OnClick = ButtonClearImageCategoryFolderClick
    end
    object ButtonImageCategoryFolder: TBitBtnEx
      Left = 426
      Top = 29
      Width = 47
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonImageCategoryFolderClick
    end
    object ImageCategoryFolder: TEditEx
      Tag = 1
      Left = 8
      Top = 29
      Width = 416
      Height = 21
      Hint = 'Select a Folder for Game Snapshots'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      OnChange = ImageCategoryFolderChange
    end
    object ImageCategoryBackgroundColor: TColorBox
      Left = 496
      Top = 29
      Width = 187
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnSelect = ImageCategoryBackgroundColorSelect
    end
    object ButtonImageCategoryBackgroundColorReset: TBitBtnEx
      Left = 638
      Top = 7
      Width = 43
      Height = 21
      Hint = 'Reset background color to current'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonImageCategoryBackgroundColorResetClick
    end
    object ButtonDefaultImageCategoryFolder: TBitBtnEx
      Left = 426
      Top = 7
      Width = 47
      Height = 21
      Hint = 'Use a default folder name assigned by the frontend'
      Caption = 'Default'
      TabOrder = 6
      OnClick = ButtonDefaultImageCategoryFolderClick
    end
    object ButtonZippedImages: TBitBtnEx
      Left = 754
      Top = 17
      Width = 43
      Height = 25
      Hint = 'How to use zipped images'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = ButtonZippedImagesClick
    end
    object ButtonOk: TBitBtnEx
      Left = 809
      Top = 17
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object ButtonCancel: TBitBtnEx
      Left = 905
      Top = 17
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
  end
  object PanelCategoriesBottom: TPanelEx
    Left = 682
    Top = 481
    Width = 318
    Height = 93
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft]
    ParentBackground = False
    Style = vgSolid
    object LabelShowHideCategories: TShadowLabel
      Left = 113
      Top = 19
      Width = 92
      Height = 56
      Alignment = taCenter
      AutoSize = False
      Caption = 'CLICK HERE TO SHOW ALL CATEGORIES'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
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
      WordWrap = True
      OnClick = LabelShowHideCategoriesClick
      OnMouseEnter = LabelShowHideCategoriesMouseEnter
      OnMouseLeave = LabelShowHideCategoriesMouseLeave
    end
    object PanelCategoryTitleBottom: TPanelEx
      Left = 1
      Top = 0
      Width = 317
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
  end
  object PanelSystemTitle: TPanelEx
    Left = 498
    Top = 494
    Width = 184
    Height = 80
    Color1 = 16448250
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft, frTop]
    ParentBackground = False
    Style = vgSolid
    object LabelSystemType: TShadowLabel
      Left = 39
      Top = 8
      Width = 105
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'ARCADE'
      Color = 16448250
      Constraints.MaxHeight = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
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
    object LabelSystemTitle: TShadowLabel
      Left = 2
      Top = 24
      Width = 180
      Height = 37
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL: A SEGA MODEL 3 ARCADE EMULATOR'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
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
      WordWrap = True
    end
    object LabelSystemNotAvailable: TShadowLabel
      Left = 14
      Top = 61
      Width = 155
      Height = 16
      Caption = 'SYSTEM NOT AVAILABLE'
      Color = 16448250
      Constraints.MaxHeight = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
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
      Visible = False
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
