object FormFavoritesManager4K: TFormFavoritesManager4K
  Left = 878
  Top = 423
  Width = 1416
  Height = 989
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Favorites Manager (4K)'
  Color = clWhite
  Constraints.MinWidth = 635
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 30
  object FavoritesList: TEasyListview
    Left = 0
    Top = 80
    Width = 1400
    Height = 870
    Align = alClient
    CellSizes.Tile.Width = 254
    CellSizes.Report.Height = 37
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000010001A2020000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000196000000FFFFFF1F000100000001000000050000004700
      61006D0065007300000000000100000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000102000000
      0000015E010000FFFFFF1F00010000000100000008000000460069006C006500
      6E0061006D006500000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE00060000008008000101000103000000000001DC
      000000FFFFFF1F0001000000010000000D000000440061007400650020004D00
      6F00640069006600690065006400000000000000000000000000}
    Header.Draggable = False
    Header.Height = 38
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
    ParentShowHint = False
    ShowThemedBorder = False
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
    TabOrder = 0
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnColumnClick = FavoritesListColumnClick
    OnColumnSizeChanging = FavoritesListColumnSizeChanging
    OnDblClick = FavoritesListDblClick
    OnItemCompare = FavoritesListItemCompare
    OnItemEdited = FavoritesListItemEdited
    OnItemEditEnd = FavoritesListItemEditEnd
    OnItemPaintText = FavoritesListItemPaintText
    OnKeyAction = FavoritesListKeyAction
  end
  object NewFavoritePanel: TPanelEx
    Left = 0
    Top = 0
    Width = 1400
    Height = 80
    Align = alTop
    Color1 = 15856113
    Color2 = clMoneyGreen
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgWindowsTheme
    object LabelHotkeyText: TShadowLabel
      Left = 8
      Top = 50
      Width = 1031
      Height = 19
      Caption = 
        '  :edit title    :edit filename           :set active           ' +
        '         :set active and exit     :exit'
      Font.Charset = OEM_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMoneyGreen
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelHotkeyKeys: TShadowLabel
      Left = 6
      Top = 50
      Width = 981
      Height = 19
      Caption = 
        'F2             F3                Space Bar             Enter/Dou' +
        'ble-click                      Esc'
      Font.Charset = OEM_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMoneyGreen
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonSetSelectedProfileActive: TSpeedButtonEx
      Left = 740
      Top = 2
      Width = 300
      Height = 36
      Hint = 'Change favorites list to selected [Space Bar key]'
      Caption = 'Set Selected Profile Active'
      Flat = True
      ImageIndex = 3
      Images = FormMain.IL_StandardIconsLarge
      OnClick = ButtonSetSelectedProfileActiveClick
    end
    object ButtonSettings: TSpeedButtonEx
      Left = 2
      Top = 2
      Width = 36
      Height = 36
      Hint = 'Settings'
      Flat = True
      ImageIndex = 7
      Images = FormMain.IL_MenuPopup
      OnClick = ButtonSettingsClick
    end
    object ButtonNew: TSpeedButtonEx
      Left = 38
      Top = 2
      Width = 65
      Height = 36
      Hint = 'Create a new favorites list'
      Caption = 'New'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonClearGames: TSpeedButtonEx
      Tag = 2
      Left = 103
      Top = 2
      Width = 135
      Height = 36
      Hint = 'Empty games list of selected favorites'
      Caption = 'Clear Games'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonRemoveInvalidEntries: TSpeedButtonEx
      Tag = 1
      Left = 238
      Top = 2
      Width = 95
      Height = 36
      Hint = 'Remove invalid entries from selected favorites'
      Caption = 'Cleanse'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonReplicate: TSpeedButtonEx
      Tag = 3
      Left = 333
      Top = 2
      Width = 105
      Height = 36
      Hint = 'Create a copy of selected favorites'
      Caption = 'Replicate'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonDelete: TSpeedButtonEx
      Tag = 4
      Left = 438
      Top = 2
      Width = 80
      Height = 36
      Hint = 'Terminate selected favorites [Delete key]'
      Caption = 'Delete'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
  end
  object IL_SystemType: TImageList
    Left = 160
    Top = 88
  end
  object PopupSettings: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = ANSI_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -16
    Bar.BarCaption.Font.Name = 'Trebuchet MS'
    Bar.BarCaption.Font.Style = [fsBold]
    Bar.BarCaption.ShadowColor = clBlack
    Bar.BarCaption.Caption = 'Screenshots Layouts'
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clBlack
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupSettingsMeasureMenuItem
    Left = 120
    Top = 88
    object PopupSettingsSmallFont: TMenuItem
      AutoCheck = True
      Caption = 'Small Font (9 pixels)'
      Checked = True
      RadioItem = True
      OnClick = PopupSettingsSmallFontClick
    end
    object PopupSettingsMediumFont: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Medium Font (12 pixels)'
      RadioItem = True
      OnClick = PopupSettingsSmallFontClick
    end
    object PopupSettingsLargeFont: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Large Font (14 pixels)'
      RadioItem = True
      OnClick = PopupSettingsSmallFontClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object PopupSettingsCenterWindow: TMenuItem
      Caption = 'Center Window'
      OnClick = PopupSettingsCenterWindowClick
    end
  end
end
