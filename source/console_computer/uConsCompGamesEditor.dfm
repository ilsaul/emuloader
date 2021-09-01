object FormConsCompGamesEditor: TFormConsCompGamesEditor
  Left = 627
  Top = 437
  Width = 1580
  Height = 946
  ActiveControl = Systems
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Console/Computer/Handheld Games Editor'
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
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter: TSplitterEx
    Left = 392
    Top = 0
    Width = 6
    Height = 907
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
    Height = 907
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
      Top = 0
      Width = 392
      Height = 907
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
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Trebuchet MS'
      EditManager.Font.Style = []
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
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
      ImagesExLarge = IL_Systems
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.CaptionIndent = 0
      PaintInfoItem.ImageIndent = 0
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
      View = elsTile
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnItemImageDraw = SystemsItemImageDraw
      OnItemImageGetSize = SystemsItemImageGetSize
      OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
      OnItemPaintText = SystemsItemPaintText
      OnItemSelectionChanged = SystemsItemSelectionChanged
    end
  end
  object PanelCustomGames: TPanelEx
    Left = 398
    Top = 0
    Width = 1166
    Height = 907
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
      Top = 883
      Width = 1166
      Height = 24
      Hint = ' MAME software lists assigned to '
      Align = alBottom
      AutoSize = False
      Caption = '00000 games - MSX 2+'
      CaptionIndent = 6
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
      Frames = []
      Transparent = False
      Layout = tlCenter
    end
    object CustomGamesList: TEasyListview
      Left = 0
      Top = 47
      Width = 1166
      Height = 836
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
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandEnabled = False
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 0
      PaintInfoGroup.MarginBottom.Visible = True
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupGamesList
      ShowThemedBorder = False
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnColumnClick = CustomGamesListColumnClick
      OnColumnSizeChanging = CustomGamesListColumnSizeChanging
      OnHintCustomInfo = CustomGamesListHintCustomInfo
      OnIncrementalSearch = CustomGamesListIncrementalSearch
      OnItemCompare = CustomGamesListItemCompare
      OnItemEdited = CustomGamesListItemEdited
      OnItemEditEnd = CustomGamesListItemEditEnd
      OnItemPaintText = CustomGamesListItemPaintText
      OnKeyAction = CustomGamesListKeyAction
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
        Width = 385
        Height = 9
        Caption = '  :title    :year    :manufacturer    :number of players    :all'
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
        Width = 361
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
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ButtonApplyChanges: TBitBtnEx
        Left = 416
        Top = 11
        Width = 121
        Height = 25
        Hint = 'Close and update main games list with current changes'
        Caption = 'Apply Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonApplyChangesClick
      end
      object ButtonAbortChanges: TBitBtnEx
        Left = 546
        Top = 11
        Width = 121
        Height = 25
        Hint = 'Close and ignore any changes made to the games data'
        Caption = 'Abort Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = ButtonAbortChangesClick
      end
      object PanelSearchGames: TPanelEx
        Left = 951
        Top = 0
        Width = 215
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
          Width = 129
          Height = 14
          Caption = 'Search games by Title'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clWhite
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ButtonFilterTitleApply: TSpeedButtonEx
          Left = 156
          Top = 18
          Width = 26
          Height = 27
          Hint = 'Click here to apply filter'
          Flat = True
          ImageIndex = 9
          Images = FormMain.IL_MiscToolBarPopup
          OnClick = ButtonFilterTitleApplyClick
          FontColorDisabled = clBtnShadow
          FontShadowColorDisabled = clBtnHighlight
          GradientColorTop_Disabled = clSilver
          GradientColorBottom_Disabled = clMedGray
          FrameColor_Disabled = clGray
        end
        object ButtonFilterTitleReset: TSpeedButtonEx
          Left = 183
          Top = 18
          Width = 26
          Height = 27
          Hint = 'Click here to reset filter'
          Flat = True
          ImageIndex = 3
          Images = FormMain.IL_MiscToolBarPopup
          OnClick = ButtonFilterTitleResetClick
          FontColorDisabled = clBtnShadow
          FontShadowColorDisabled = clBtnHighlight
          GradientColorTop_Disabled = clSilver
          GradientColorBottom_Disabled = clMedGray
          FrameColor_Disabled = clGray
        end
        object FilterGameTitle: TTntEditEx
          Left = 4
          Top = 19
          Width = 149
          Height = 24
          Hint = 'Search games by title'
          AutoSize = False
          BevelOuter = bvNone
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = FilterGameTitleKeyPress
        end
      end
      object SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx
        Left = 250
        Top = 5
        Width = 146
        Height = 20
        Hint = 
          'Allow you to use the lost empty space on the right side'#13#10'when sc' +
          'roll bar is not visible'
        TabOrder = 1
        OnClick = SystemsHideScrollBarAreaClick
        Alignment = taLeftJustify
        Caption = 'Hide Systems Scroll Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ShowBiggerGamesListFont: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 5
        Width = 175
        Height = 20
        TabOrder = 4
        OnClick = ShowBiggerGamesListFontClick
        Alignment = taLeftJustify
        Caption = 'Show Bigger Games List Font'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object PanelEditSelected: TPanelEx
      Left = 308
      Top = 370
      Width = 549
      Height = 231
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      Frames = [frLeft, frTop, frRight, frBottom]
      ParentBackground = False
      Style = vgSolid
      Visible = False
      OnMouseDown = PanelEditSelectedMouseDown
      object LabelEditSelected: TShadowLabel
        Left = 21
        Top = 16
        Width = 507
        Height = 37
        Caption = 
          'Edit info of multiple selected games at once, even if they are n' +
          'ot from the same system.'#13#10'Make sure to tick checkboxes of all fi' +
          'elds you want to change.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
        OnMouseDown = PanelEditSelectedMouseDown
      end
      object LabelEditSelected_Total: TShadowLabel
        Left = 18
        Top = 193
        Width = 121
        Height = 16
        Caption = '000000 games selected'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object LabelEditSelectedDrag: TShadowLabel
        Left = 271
        Top = 56
        Width = 256
        Height = 19
        Caption = 'drag this panel around to get it out of of way!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnMouseDown = PanelEditSelectedMouseDown
      end
      object LabelEditSelected_Year: TAdvOfficeCheckBoxEx
        Left = 18
        Top = 134
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
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_Year: TEditEx
        Left = 114
        Top = 133
        Width = 153
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 4
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object LabelEditSelected_Manufacturer: TAdvOfficeCheckBoxEx
        Left = 18
        Top = 101
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
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_Manufacturer: TEditEx
        Left = 114
        Top = 100
        Width = 417
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 2
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object LabelEditSelected_NumberPlayers: TAdvOfficeCheckBoxEx
        Left = 290
        Top = 134
        Width = 83
        Height = 20
        Checked = True
        TabOrder = 3
        OnClick = LabelEditSelected_NumberPlayersClick
        Alignment = taLeftJustify
        Caption = '# of Players'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_NumberPlayers: TEditEx
        Left = 378
        Top = 133
        Width = 153
        Height = 23
        AutoSize = False
        Color = clWhite
        TabOrder = 5
        OnKeyPress = EditSelected_ManufacturerKeyPress
      end
      object ButtonMultiSelectedInfo_Confirm: TBitBtnEx
        Left = 339
        Top = 188
        Width = 89
        Height = 25
        Caption = 'Confirm'
        TabOrder = 6
        OnClick = ButtonMultiSelectedInfo_ConfirmClick
      end
      object MultiSelectedInfo_Cancel: TBitBtnEx
        Left = 442
        Top = 188
        Width = 89
        Height = 25
        Caption = 'Cancel'
        TabOrder = 7
        OnClick = MultiSelectedInfo_CancelClick
      end
    end
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
    object PopupEditTitle: TMenuItem
      Caption = 'Edit Title'
      OnClick = PopupEditTitleClick
    end
    object PopupEditYear: TMenuItem
      Tag = 1
      Caption = 'Edit Year'
      OnClick = PopupEditTitleClick
    end
    object PopupEditManufacturer: TMenuItem
      Tag = 2
      Caption = 'Edit Manufacturer'
      OnClick = PopupEditTitleClick
    end
    object PopupEditNumberofPlayers: TMenuItem
      Tag = 3
      Caption = 'Edit Number of Players'
      OnClick = PopupEditTitleClick
    end
    object PopupEditAll: TMenuItem
      Tag = -1
      Caption = 'Edit All'
      OnClick = PopupEditTitleClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupMachinesListSidePanelResetColumnsWidth: TMenuItem
      Caption = 'Reset Columns Width'
    end
    object PopupResetSystemsPanelSize: TMenuItem
      Caption = 'Reset Systems Panel Size'
      OnClick = PopupResetSystemsPanelSizeClick
    end
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 342
    Top = 72
  end
end
