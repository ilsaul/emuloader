object FormImageCategorySettings: TFormImageCategorySettings
  Left = 503
  Top = 294
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Category Settings (Folders, Visibility, Background Color)'
  ClientHeight = 664
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
  object LabelEmuTitle: TShadowLabel
    Left = 0
    Top = 410
    Width = 930
    Height = 16
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'SYSTEM TYPE    SYSTEM TITLE'
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
    Transparent = False
    Layout = tlCenter
  end
  object LabelSystemType: TShadowLabel
    Left = 32
    Top = 410
    Width = 51
    Height = 16
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
    Transparent = False
    Layout = tlCenter
  end
  object LabelSystemNotAvailable: TShadowLabel
    Left = 697
    Top = 410
    Width = 203
    Height = 16
    Caption = 'THIS SYSTEM IS NOT AVAILABLE'
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
    Transparent = False
    Layout = tlCenter
    Visible = False
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
    OnItemPaintText = SystemsItemPaintText
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object PanelImageCategories: TPanelEx
    Left = 0
    Top = 426
    Width = 930
    Height = 238
    Align = alBottom
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frTop]
    ParentBackground = False
    Style = vgSolid
    object LabelShowHideCategories: TShadowLabel
      Left = 0
      Top = 165
      Width = 314
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'CLICK HERE TO HIDE ALL CATEGORIES'
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
      Transparent = False
      Layout = tlCenter
      OnClick = LabelShowHideCategoriesClick
      OnMouseEnter = LabelShowHideCategoriesMouseEnter
      OnMouseLeave = LabelShowHideCategoriesMouseLeave
    end
    object LabelCategoryTitle: TShadowLabel
      Left = 416
      Top = 164
      Width = 361
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
      Transparent = False
      Layout = tlCenter
    end
    object ImageCategory_Selector: TEasyListview
      Tag = 1
      Left = 6
      Top = 7
      Width = 945
      Height = 152
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
    object PanelImageCategorySelector: TPanelEx
      Left = 0
      Top = 180
      Width = 930
      Height = 58
      Align = alBottom
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      Frames = [frLeft, frTop]
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
        Transparent = True
      end
      object LabelImageBackgroundColor: TShadowLabel
        Left = 368
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
        Transparent = True
      end
      object ButtonResetImageCategoryFolder: TBitBtn
        Left = 266
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
      object ButtonClearImageCategoryFolder: TBitBtn
        Left = 222
        Top = 7
        Width = 43
        Height = 21
        Caption = 'Clear'
        TabOrder = 1
        OnClick = ButtonClearImageCategoryFolderClick
      end
      object ButtonImageCategoryFolder: TBitBtn
        Left = 310
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
      object ImageCategoryFolder: TEdit
        Tag = 1
        Left = 8
        Top = 29
        Width = 299
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
        Left = 368
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
      object ButtonImageCategoryBackgroundColorReset: TBitBtn
        Left = 510
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
      object ButtonDefaultImageCategoryFolder: TBitBtn
        Left = 310
        Top = 7
        Width = 47
        Height = 21
        Hint = 'Use a default folder name assigned by the frontend'
        Caption = 'Default'
        TabOrder = 6
      end
      object ButtonZippedImages: TBitBtn
        Left = 650
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
      object ButtonOk: TBitBtn
        Left = 729
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
      object ButtonCancel: TBitBtn
        Left = 825
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
  end
  object SystemTitlePanel: TPanelEx
    Left = 680
    Top = 344
    Width = 100
    Height = 41
    Color1 = clBlue
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
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
