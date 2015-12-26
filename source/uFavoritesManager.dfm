object FormFavoritesManager: TFormFavoritesManager
  Left = 644
  Top = 354
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Favorites Manager'
  ClientHeight = 402
  ClientWidth = 614
  Color = clWhite
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ToolbarButtons: TToolBar
    Left = 0
    Top = 0
    Width = 614
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
    object ToolButtonNew: TToolButton
      Left = 2
      Top = 0
      Hint = 'Create a new favorites list'
      AutoSize = True
      Caption = '  New'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonClearGames: TToolButton
      Tag = 2
      Left = 43
      Top = 0
      Hint = 'Empty games list of selected favorites'
      AutoSize = True
      Caption = '  Clear Games'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonRemoveInvalidEntries: TToolButton
      Tag = 1
      Left = 126
      Top = 0
      Hint = 'Remove invalid entries from selected favorites'
      AutoSize = True
      Caption = '  Cleanse'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonDuplicate: TToolButton
      Tag = 3
      Left = 184
      Top = 0
      Hint = 'Create a copy of selected favorites'
      AutoSize = True
      Caption = '  Replicate'
      OnClick = ToolButtonNewClick
    end
    object ToolButtonDelete: TToolButton
      Tag = 4
      Left = 249
      Top = 0
      Hint = 'Terminate selected favorites [Delete key]'
      AutoSize = True
      Caption = '  Delete'
      OnClick = ToolButtonNewClick
    end
    object ToolButton3: TToolButton
      Left = 299
      Top = 0
      AutoSize = True
      Caption = '              '
      Enabled = False
    end
    object ToolBarSetSelectedProfileActive: TToolButton
      Left = 352
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
    Width = 614
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
      00060000008008000101000100000000010001FA000000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000142000000FFFFFF1F000100000001000000050000004700
      61006D0065007300000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE0006000000800800010100010200000000000194
      000000FFFFFF1F00010000000100000008000000460069006C0065006E006100
      6D006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE0006000000800800010100010300000000000182000000FF
      FFFF1F0001000000010000000D000000440061007400650020004D006F006400
      69006600690065006400000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Sizeable = False
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
    Selection.Gradient = True
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
    OnDblClick = FavoritesListDblClick
    OnItemCompare = FavoritesListItemCompare
    OnItemEdited = FavoritesListItemEdited
    OnItemEditEnd = FavoritesListItemEditEnd
    OnItemPaintText = FavoritesListItemPaintText
    OnKeyAction = FavoritesListKeyAction
  end
  object NewFavoritePanel: TPanelEx
    Left = 0
    Top = 22
    Width = 614
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
    Left = 132
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
end
