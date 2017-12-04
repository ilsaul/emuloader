object FormFavoritesManager: TFormFavoritesManager
  Left = 974
  Top = 635
  Width = 797
  Height = 440
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Favorites Manager'
  Color = clWhite
  Constraints.MinWidth = 635
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ToolbarButtons: TToolBar
    Left = 0
    Top = 0
    Width = 781
    Height = 22
    AutoSize = True
    ButtonWidth = 163
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = FormMain.IL_MenuPopup
    Indent = 2
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Transparent = True
    Wrapable = False
    OnCustomDraw = ToolbarButtonsCustomDraw
    object ToolButtonFavSettings: TToolButton
      Left = 2
      Top = 0
      Hint = 'Settings'
      AutoSize = True
      ImageIndex = 7
      OnClick = ToolButtonFavSettingsClick
    end
    object ToolButtonNew: TToolButton
      Left = 36
      Top = 0
      Hint = 'Create a new favorites list'
      AutoSize = True
      Caption = '  New'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonClearGames: TToolButton
      Tag = 2
      Left = 77
      Top = 0
      Hint = 'Empty games list of selected favorites'
      AutoSize = True
      Caption = '  Clear Games'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonRemoveInvalidEntries: TToolButton
      Tag = 1
      Left = 160
      Top = 0
      Hint = 'Remove invalid entries from selected favorites'
      AutoSize = True
      Caption = '  Cleanse'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonDuplicate: TToolButton
      Tag = 3
      Left = 218
      Top = 0
      Hint = 'Create a copy of selected favorites'
      AutoSize = True
      Caption = '  Replicate'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonDelete: TToolButton
      Tag = 4
      Left = 283
      Top = 0
      Hint = 'Terminate selected favorites [Delete key]'
      AutoSize = True
      Caption = '  Delete'
      OnClick = ToolButtonNewClick
    end
    object ToolButton3: TToolButton
      Left = 333
      Top = 0
      AutoSize = True
      Caption = '              '
      Enabled = False
    end
    object ToolBarSetSelectedProfileActive: TToolButton
      Left = 386
      Top = 0
      Hint = 'Change favorites list to selected [Space Bar key]'
      AutoSize = True
      Caption = 'Set Selected Profile Active'
      ImageIndex = 3
      OnClick = ToolBarSetSelectedProfileActiveClick
    end
  end
  object FavoritesList: TEasyListview
    Left = 0
    Top = 44
    Width = 781
    Height = 358
    Align = alClient
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 22
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
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
      0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000100012C010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000146000000FFFFFF1F000100000001000000050000004700
      61006D0065007300000000000100000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000102000000
      000001FA000000FFFFFF1F00010000000100000008000000460069006C006500
      6E0061006D006500000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE000600000080080001010001030000000000019B
      000000FFFFFF1F0001000000010000000D000000440061007400650020004D00
      6F00640069006600690065006400000000000000000000000000}
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
    ImagesSmall = FormMain.IL_MenuPopup
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
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsReport
    OnColumnClick = FavoritesListColumnClick
    OnColumnSizeChanging = FavoritesListColumnSizeChanging
    OnDblClick = FavoritesListDblClick
    OnItemCompare = FavoritesListItemCompare
    OnItemEdited = FavoritesListItemEdited
    OnItemEditEnd = FavoritesListItemEditEnd
    OnKeyAction = FavoritesListKeyAction
  end
  object NewFavoritePanel: TPanelEx
    Left = 0
    Top = 22
    Width = 781
    Height = 22
    Align = alTop
    Color1 = 16445669
    Color2 = clMoneyGreen
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object LabelHotkeyText: TShadowLabel
      Left = 8
      Top = 7
      Width = 597
      Height = 9
      Caption = 
        '  :edit title   :edit filename          :set active             ' +
        '      :set active and exit    :exit'
      Font.Charset = OEM_CHARSET
      Font.Color = 3684408
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMoneyGreen
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object LabelHotkeyKeys: TShadowLabel
      Left = 7
      Top = 7
      Width = 567
      Height = 9
      Caption = 
        'F2            F3               Space Bar            Enter/Double' +
        '-click                     Esc'
      Font.Charset = OEM_CHARSET
      Font.Color = 191
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMoneyGreen
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
  end
  object PanelUpdatingFavTagInGames: TPanelEx
    Left = 317
    Top = 176
    Width = 350
    Height = 41
    Color1 = clLime
    Color2 = clTeal
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    Visible = False
    object LabelTaskMessage: TShadowLabel
      Left = 8
      Top = 13
      Width = 333
      Height = 15
      AutoSize = False
      Caption = 'Updating favorite tags in games list, please wait...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
  end
  object PanelFavSettings: TPanelEx
    Left = 4
    Top = 226
    Width = 301
    Height = 87
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    Visible = False
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 38
      Height = 15
      Caption = '9 pixels'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 120
      Top = 24
      Width = 44
      Height = 15
      Caption = '12 pixels'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 232
      Top = 24
      Width = 44
      Height = 15
      Caption = '14 pixels'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object ButtonClosePanelFavSettings: TBitBtn
      Left = 218
      Top = 56
      Width = 75
      Height = 23
      Caption = 'Close'
      TabOrder = 0
      OnClick = ButtonClosePanelFavSettingsClick
    end
    object ButtonCenterPanelFavSettings: TBitBtn
      Left = 8
      Top = 56
      Width = 75
      Height = 23
      Hint = 'Align window to center screen'
      Caption = 'Center'
      TabOrder = 1
      OnClick = ButtonCenterPanelFavSettingsClick
    end
    object FavSettingSmallFont: TAdvOfficeRadioButton
      Left = 8
      Top = 8
      Width = 78
      Height = 18
      TabOrder = 2
      TabStop = True
      OnClick = FavSettingSmallFontClick
      Alignment = taLeftJustify
      Caption = 'Small Font'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object FavSettingLargeFont: TAdvOfficeRadioButton
      Tag = 2
      Left = 216
      Top = 8
      Width = 78
      Height = 18
      TabOrder = 3
      OnClick = FavSettingSmallFontClick
      Alignment = taLeftJustify
      Caption = 'Large Font'
      ReturnIsTab = False
      Themed = True
    end
    object FavSettingMediumFont: TAdvOfficeRadioButton
      Tag = 1
      Left = 104
      Top = 8
      Width = 93
      Height = 18
      TabOrder = 4
      OnClick = FavSettingSmallFontClick
      Alignment = taLeftJustify
      Caption = 'Medium Font'
      ReturnIsTab = False
      Themed = True
    end
  end
  object IL_SystemType: TImageList
    Left = 160
    Top = 88
  end
end
