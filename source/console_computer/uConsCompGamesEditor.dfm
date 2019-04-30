object FormConsCompGamesEditor: TFormConsCompGamesEditor
  Left = 627
  Top = 437
  Width = 1580
  Height = 970
  ActiveControl = Systems
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Console/Computer Games Editor'
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter: TSplitterEx
    Left = 392
    Top = 0
    Width = 6
    Height = 932
    ResizeStyle = rsUpdate
    OnMoved = SplitterMoved
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = clBtnFace
    Appearance.ColorTo = clBtnFace
    Appearance.ColorHot = clBtnFace
    Appearance.ColorHotTo = clBtnFace
    Appearance.SingleColor = clBtnFace
    Appearance.SingleColorHot = clGray
    GripStyle = sgDots
    Style = tsSolidColor
  end
  object PanelSystems: TPanelEx
    Left = 0
    Top = 0
    Width = 392
    Height = 932
    Align = alLeft
    BevelOuter = bvNone
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object Systems: TEasyListview
      Tag = -1
      Left = 0
      Top = 24
      Width = 392
      Height = 908
      Align = alClient
      BorderStyle = bsNone
      CellSizes.Icon.Height = 82
      CellSizes.Icon.Width = 62
      CellSizes.Tile.Height = 42
      CellSizes.Tile.Width = 186
      CellSizes.Report.Height = 28
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -9
      EditManager.Font.Name = 'Tahoma'
      EditManager.Font.Style = []
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
      ImagesExLarge = IL_Systems
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.ShowBorder = False
      PaintInfoItem.TileDetailCount = 2
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = False
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      OnItemImageDraw = SystemsItemImageDraw
      OnItemImageGetSize = SystemsItemImageGetSize
      OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
      OnItemPaintText = SystemsItemPaintText
      OnItemSelectionChanged = SystemsItemSelectionChanged
    end
    object PanelSystemTitleBottom: TPanelEx
      Left = 0
      Top = 16
      Width = 392
      Height = 8
      Align = alTop
      Color1 = 15132390
      Color2 = clWhite
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
    end
    object PanelSystemTitle: TPanelEx
      Left = 0
      Top = 0
      Width = 392
      Height = 16
      Align = alTop
      Color1 = 15856113
      Color2 = 15132390
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object LabelSystemTitle: TShadowLabel
        Left = 0
        Top = 0
        Width = 392
        Height = 16
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = 'SYSTEM TITLE'
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
  object PanelCustomGamesSelectedSystem: TPanelEx
    Left = 398
    Top = 0
    Width = 1166
    Height = 932
    Align = alClient
    BevelOuter = bvNone
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelCustomGamesListTotal: TShadowLabel
      Left = 0
      Top = 764
      Width = 1166
      Height = 24
      Hint = ' MAME software lists assigned to '
      Align = alBottom
      AutoSize = False
      Caption = '  00000 games - MSX 2+'
      Color = 15856113
      ParentColor = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 7891291
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object CustomGamesList: TEasyListview
      Left = 0
      Top = 47
      Width = 1166
      Height = 717
      Align = alClient
      CellSizes.SmallIcon.Height = 20
      CellSizes.Tile.Width = 254
      CellSizes.Report.Height = 28
      Color = clWhite
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = FormMain.IL_GroupedMode
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clBlack
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000001000190010000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        00010100000000000141000000FFFFFF1F000100000001000000040000005900
        650061007200000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000001B40000
        00FFFFFF1F0001000000010000000C0000004D0061006E007500660061006300
        7400750072006500720000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
        0150000000FFFFFF1F0001000000010000000700000050006C00610079006500
        72007300000000000000000000000000110000005445617379436F6C756D6E53
        746F726564FFFECE0006000000800800010100010400000000000173000000FF
        FFFF1F00010000000100000009000000470061006D0065002000530069007A00
        6500000000000000000000000000110000005445617379436F6C756D6E53746F
        726564FFFECE000600000080080001010001050000000000012C010000FFFFFF
        1F00010000000100000008000000460069006C0065006E0061006D0065000000
        00000000000000000000}
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
      ImagesSmall = FormMain.IL_StandardIconsStandard
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
      PopupMenu = PopupGamesList
      ShowThemedBorderColor = 7891291
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
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      OnColumnClick = CustomGamesListColumnClick
      OnColumnSizeChanging = CustomGamesListColumnSizeChanging
      OnIncrementalSearch = CustomGamesListIncrementalSearch
      OnItemCompare = CustomGamesListItemCompare
      OnItemEdited = CustomGamesListItemEdited
      OnItemEditEnd = CustomGamesListItemEditEnd
      OnKeyAction = CustomGamesListKeyAction
    end
    object PanelEditSelected: TPanelEx
      Left = 0
      Top = 788
      Width = 1166
      Height = 144
      Align = alBottom
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSolid
      Visible = False
      object LabelEditSelected: TShadowLabel
        Left = 8
        Top = 16
        Width = 511
        Height = 16
        Caption = 
          'Change info of all selected games at once! Make sure to select a' +
          'll fields you want to change.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
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
      object LabelEditSelected_Year: TAdvOfficeCheckBox
        Left = 8
        Top = 65
        Width = 45
        Height = 20
        Checked = True
        TabOrder = 0
        OnClick = LabelEditSelected_YearClick
        Alignment = taLeftJustify
        Caption = 'Year'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object EditSelected_Year: TEditEx
        Left = 104
        Top = 64
        Width = 153
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 4
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object LabelEditSelected_Manufacturer: TAdvOfficeCheckBox
        Left = 8
        Top = 41
        Width = 93
        Height = 20
        Checked = True
        TabOrder = 1
        OnClick = LabelEditSelected_ManufacturerClick
        Alignment = taLeftJustify
        Caption = 'Manufacturer'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object EditSelected_Manufacturer: TEditEx
        Left = 104
        Top = 40
        Width = 417
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 2
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object LabelEditSelected_NumberPlayers: TAdvOfficeCheckBox
        Left = 280
        Top = 65
        Width = 83
        Height = 20
        Checked = True
        TabOrder = 3
        OnClick = LabelEditSelected_NumberPlayersClick
        Alignment = taLeftJustify
        Caption = '# of Players'
        ReturnIsTab = False
        State = cbChecked
      end
      object EditSelected_NumberPlayers: TEditEx
        Left = 368
        Top = 64
        Width = 153
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 5
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object ButtonMultiSelectedInfo_Confirm: TBitBtnEx
        Left = 8
        Top = 104
        Width = 89
        Height = 25
        Caption = 'Confirm'
        TabOrder = 6
        OnClick = ButtonMultiSelectedInfo_ConfirmClick
      end
      object MultiSelectedInfo_Cancel: TBitBtnEx
        Left = 104
        Top = 104
        Width = 89
        Height = 25
        Caption = 'Cancel'
        TabOrder = 7
        OnClick = MultiSelectedInfo_CancelClick
      end
    end
    object PanelToolBarGamesEditor: TPanelEx
      Left = 0
      Top = 0
      Width = 1166
      Height = 47
      Align = alTop
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      ShowHint = True
      Style = vgWindowsTheme
      object LabelHotkeyText: TShadowLabel
        Left = 8
        Top = 33
        Width = 471
        Height = 9
        Caption = 
          'edit hotkeys    :title    :year    :manufacturer    :number of p' +
          'layers    :all'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelHotkeyKeys: TShadowLabel
        Left = 89
        Top = 33
        Width = 363
        Height = 9
        Caption = 'F2        F3       F4               F5                    F6'
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
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object GamesListFontSize: TShadowLabel
        Tag = 9
        Left = 401
        Top = 4
        Width = 24
        Height = 21
        Hint = 'Software lists font size (default 9)'
        Alignment = taCenter
        AutoSize = False
        Caption = '9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 7891291
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
        Transparent = True
        Layout = tlCenter
      end
      object ButtonApplyChanges: TBitBtnEx
        Left = 48
        Top = 3
        Width = 121
        Height = 23
        Hint = 'Close and update main games list with current changes'
        Caption = 'Apply Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonApplyChangesClick
      end
      object ButtonAbortChanges: TBitBtnEx
        Left = 169
        Top = 3
        Width = 121
        Height = 23
        Hint = 'Close and ignore any changes made to the games data'
        Caption = 'Abort Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = ButtonAbortChangesClick
      end
      object ButtonOptions: TBitBtnEx
        Left = 2
        Top = 3
        Width = 24
        Height = 23
        Hint = 'Settings'
        Caption = #234
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = ButtonOptionsClick
      end
      object PanelSearchGames: TPanelEx
        Left = 958
        Top = 0
        Width = 208
        Height = 47
        Align = alRight
        Color1 = clSilver
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clGreen
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgWindowsTheme
        object LabelToolBarFilterTitle: TShadowLabel
          Left = 4
          Top = 4
          Width = 148
          Height = 14
          Caption = 'Search games by Title'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clWhite
          ShadowEnabled = True
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ToolBarFilterTitle: TToolBar
          Left = 155
          Top = 19
          Width = 52
          Height = 24
          Align = alNone
          ButtonHeight = 24
          Caption = 'Search Bar'
          Color = 15856113
          Constraints.MinWidth = 52
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          Images = FormMain.IL_LeftPanel
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Transparent = False
          Wrapable = False
          OnCustomDraw = ToolBarFilterTitleCustomDraw
          object ButtonFilterTitleApply: TToolButton
            Left = 0
            Top = 0
            Hint = 'Click here to apply filter'
            AutoSize = True
            Caption = 'Apply'
            ImageIndex = 6
            OnClick = ButtonFilterTitleApplyClick
          end
          object ButtonFilterTitleReset: TToolButton
            Left = 23
            Top = 0
            Hint = 'Click here to reset filter'
            AutoSize = True
            Caption = 'Reset'
            ImageIndex = 7
            OnClick = ButtonFilterTitleResetClick
          end
        end
        object FilterGameTitle: TEditEx
          Left = 4
          Top = 19
          Width = 149
          Height = 24
          Hint = 'Search games by title'
          AutoSize = False
          BevelOuter = bvNone
          Color = clWhite
          Constraints.MaxHeight = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = FilterGameTitleKeyPress
        end
      end
      object GamesListFontSizeLarger_x4: TBitBtnEx
        Tag = 4
        Left = 451
        Top = 3
        Width = 46
        Height = 23
        Hint = 'Larger font size (4 steps)'
        Caption = #232#232
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeLarger: TBitBtnEx
        Tag = 1
        Left = 427
        Top = 3
        Width = 23
        Height = 23
        Hint = 'Larger font size'
        Caption = #232
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeSmaller_x4: TBitBtnEx
        Tag = -4
        Left = 328
        Top = 3
        Width = 46
        Height = 23
        Hint = 'Smaller font size (4 steps)'
        Caption = #231#231
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeSmaller: TBitBtnEx
        Tag = -1
        Left = 376
        Top = 3
        Width = 23
        Height = 23
        Hint = 'Smaller font size'
        Caption = #231
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = GamesListFontSizeSmallerClick
      end
      object SystemsHideScrollBarArea: TAdvOfficeCheckBox
        Left = 534
        Top = 5
        Width = 146
        Height = 20
        Hint = 
          'Allow you to use the lost empty space on the right side'#13#10'when sc' +
          'roll bar is not visible'
        TabOrder = 5
        OnClick = SystemsHideScrollBarAreaClick
        Alignment = taLeftJustify
        Caption = 'Hide Systems Scroll Bar'
        ReturnIsTab = False
        Themed = True
      end
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 8
    Top = 192
  end
  object PopupGamesList: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clBlack
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
    OnMeasureMenuItem = PopupGamesListMeasureMenuItem
    Left = 416
    Top = 80
    object EditTitle1: TMenuItem
      Caption = 'Edit Title'
      OnClick = EditTitle1Click
    end
    object EditYear1: TMenuItem
      Tag = 1
      Caption = 'Edit Year'
      OnClick = EditTitle1Click
    end
    object EditManufacturer1: TMenuItem
      Tag = 2
      Caption = 'Edit Manufacturer'
      OnClick = EditTitle1Click
    end
    object EditNumberofPlayers1: TMenuItem
      Tag = 3
      Caption = 'Edit Number of Players'
      OnClick = EditTitle1Click
    end
    object EditAll1: TMenuItem
      Tag = -1
      Caption = 'Edit All'
      OnClick = EditTitle1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupMachinesListSidePanelResetColumnsWidth: TMenuItem
      Caption = 'Reset Columns Width'
    end
    object ResetSystemsPanelSize: TMenuItem
      Caption = 'Reset Systems Panel Size'
      OnClick = ResetSystemsPanelSizeClick
    end
  end
  object PopupMenuOptions: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clBlack
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
    OnMeasureMenuItem = PopupGamesListMeasureMenuItem
    Left = 352
    Top = 32
    object PopupSystemsViewMode: TMenuItem
      Tag = 1
      Caption = 'Systems View Mode'
      object PopupSystemsViewMode_Tiles: TMenuItem
        AutoCheck = True
        Caption = 'Tiles View'
        Hint = 'Detailed system type info and icons'
        RadioItem = True
        OnClick = PopupSystemsViewMode_TilesClick
      end
      object PopupSystemsViewMode_LargeIcons: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Large Icons View'
        Checked = True
        Hint = 'System title only'
        RadioItem = True
        OnClick = PopupSystemsViewMode_TilesClick
      end
    end
  end
end
