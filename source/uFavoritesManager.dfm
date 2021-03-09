object FormFavoritesManager: TFormFavoritesManager
  Left = 878
  Top = 423
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object FavoritesList: TEasyListview
    Left = 0
    Top = 47
    Width = 781
    Height = 354
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
    Width = 781
    Height = 47
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
      Top = 33
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
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelHotkeyKeys: TShadowLabel
      Left = 7
      Top = 33
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
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonSetSelectedProfileActive: TSpeedButtonEx
      Left = 394
      Top = 2
      Width = 162
      Height = 22
      Hint = 'Change favorites list to selected [Space Bar key]'
      Caption = 'Set Selected Profile Active'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 3
      Images = FormMain.IL_MenuPopup
      ParentFont = False
      OnClick = ButtonSetSelectedProfileActiveClick
    end
    object ButtonSettings: TSpeedButtonEx
      Left = 2
      Top = 2
      Width = 22
      Height = 24
      Hint = 'Settings'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 7
      Images = FormMain.IL_MenuPopup
      ParentFont = False
      OnClick = ButtonSettingsClick
    end
    object ButtonNew: TSpeedButtonEx
      Left = 24
      Top = 2
      Width = 47
      Height = 24
      Hint = 'Create a new favorites list'
      Caption = 'New'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonClearGames: TSpeedButtonEx
      Tag = 2
      Left = 71
      Top = 2
      Width = 90
      Height = 24
      Hint = 'Empty games list of selected favorites'
      Caption = 'Clear Games'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonRemoveInvalidEntries: TSpeedButtonEx
      Tag = 1
      Left = 161
      Top = 2
      Width = 64
      Height = 24
      Hint = 'Remove invalid entries from selected favorites'
      Caption = 'Cleanse'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonReplicate: TSpeedButtonEx
      Tag = 3
      Left = 225
      Top = 2
      Width = 72
      Height = 24
      Hint = 'Create a copy of selected favorites'
      Caption = 'Replicate'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = ButtonNewClick
    end
    object ButtonDelete: TSpeedButtonEx
      Tag = 4
      Left = 297
      Top = 2
      Width = 56
      Height = 24
      Hint = 'Terminate selected favorites [Delete key]'
      Caption = 'Delete'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
