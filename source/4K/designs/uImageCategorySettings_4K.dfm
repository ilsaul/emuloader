object FormImageCategorySettings4K: TFormImageCategorySettings4K
  Left = 668
  Top = 456
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 
    'Image Category Settings (Folders, Visibility, Background Color) ' +
    '(4K)'
  ClientHeight = 1366
  ClientWidth = 2387
  Color = clTeal
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
  object LabelImageCategoryFolder: TShadowLabel
    Left = 1641
    Top = 989
    Width = 226
    Height = 31
    Hint = 'Image Category Folder [%s]'
    Caption = 'Image Folder [.png; .jpg]'
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
    Left = 1641
    Top = 933
    Width = 230
    Height = 31
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
  object LabelCategoryTitle: TShadowLabel
    Left = 1641
    Top = 882
    Width = 200
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'TITLE SNAPSHOT'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
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
  object ShadowLabel1: TShadowLabel
    Left = 2019
    Top = 882
    Width = 350
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'SYSTEM TITLE'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
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
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 2376
    Height = 860
    BorderStyle = bsNone
    BorderWidth = 8
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
  end
  object PanelImageCategorySelector: TPanelEx
    Left = 1631
    Top = 1145
    Width = 745
    Height = 71
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSolid
    object LabelShowHideCategories: TShadowLabel
      Left = 10
      Top = 16
      Width = 246
      Height = 45
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = 'HIDE ALL CATEGORIES'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
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
    end
    object ButtonZippedImages: TBitBtnEx
      Left = 274
      Top = 16
      Width = 89
      Height = 45
      Hint = 'How to use zipped images'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonOk: TBitBtnEx
      Left = 378
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonCancel: TBitBtnEx
      Left = 560
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close without updating'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object ImageCategoryFolder: TEditEx
    Tag = 1
    Left = 1641
    Top = 1025
    Width = 630
    Height = 36
    Hint = 'Select a Folder for Game Snapshots'
    AutoSize = False
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
  end
  object ButtonClearImageCategoryFolder: TBitBtnEx
    Left = 2074
    Top = 986
    Width = 89
    Height = 36
    Caption = 'Clear'
    TabOrder = 3
  end
  object ButtonResetImageCategoryFolder: TBitBtnEx
    Left = 2174
    Top = 986
    Width = 89
    Height = 36
    Hint = 'Reset folder to current'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object ButtonDefaultImageCategoryFolder: TBitBtnEx
    Left = 2280
    Top = 986
    Width = 89
    Height = 36
    Hint = 'Use a default folder name assigned by the frontend'
    Caption = 'Default'
    TabOrder = 5
  end
  object ButtonImageCategoryFolder: TBitBtnEx
    Left = 2280
    Top = 1025
    Width = 89
    Height = 36
    Hint = 'Click here to select a folder'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object ImageSingleBackgroundColorButtonReset: TBitBtnEx
    Left = 2280
    Top = 1090
    Width = 89
    Height = 36
    Hint = 'Reset background color to current'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object ImageSingleBackgroundColor: TColorBoxEx
    Left = 1962
    Top = 1090
    Width = 312
    Height = 36
    Hint = 'Image Single Background Color'
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Color = clWhite
    ItemHeight = 30
    TabOrder = 8
  end
  object ImageSingleBackgroundColorEnabled: TAdvOfficeCheckBoxEx
    Left = 1641
    Top = 1090
    Width = 260
    Height = 36
    TabOrder = 10
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Single Background Color'
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object PanelCategoryTitleBottom: TPanelEx
    Left = 0
    Top = 860
    Width = 2376
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
  object ButtonImageCategoryBackgroundColorReset: TBitBtnEx
    Left = 2280
    Top = 930
    Width = 89
    Height = 36
    Hint = 'Reset background color to current'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object ImageCategoryBackgroundColor: TColorBoxEx
    Left = 1965
    Top = 930
    Width = 312
    Height = 36
    Hint = 'Image Category Background Color'
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    Color = clWhite
    ItemHeight = 30
    TabOrder = 13
  end
  object PanelImageCategories: TPanelEx
    Left = 0
    Top = 872
    Width = 1631
    Height = 344
    Color1 = clWhite
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
      Left = 8
      Top = 8
      Width = 1615
      Height = 328
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Icon.Height = 78
      CellSizes.Icon.Width = 78
      CellSizes.Tile.Height = 76
      CellSizes.Tile.Width = 102
      Color = clSilver
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
