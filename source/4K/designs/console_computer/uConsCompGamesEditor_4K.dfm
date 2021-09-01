object FormConsCompGamesEditor4K: TFormConsCompGamesEditor4K
  Left = 621
  Top = 371
  Width = 2701
  Height = 1410
  ActiveControl = Systems
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Console/Computer/Handheld Games Editor (4K)'
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object Splitter: TSplitterEx
    Left = 657
    Top = 0
    Width = 6
    Height = 1371
    ResizeStyle = rsUpdate
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
    Width = 657
    Height = 1371
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
      Width = 657
      Height = 1371
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
  end
  object PanelCustomGamesSelectedSystem: TPanelEx
    Left = 663
    Top = 0
    Width = 2022
    Height = 1371
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
    object CustomGamesList: TEasyListview
      Left = 0
      Top = 75
      Width = 2022
      Height = 1260
      Align = alClient
      CellSizes.SmallIcon.Height = 20
      CellSizes.Tile.Width = 254
      CellSizes.Report.Height = 38
      Color = clWhite
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -21
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = FormMain.IL_GroupedMode
      UseDockManager = False
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        06000000810806000000020000000F00000054456173794974656D53746F7265
        64FFFECE00060000008008010000000D0000006600640066007300640066006A
        006B00730064006C0066006A0000000000000000000000000000000000000000
        000F00000054456173794974656D53746F726564FFFECE000600000080080000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000100010C030000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        0001010000000000015A000000FFFFFF1F000100000001000000040000005900
        650061007200000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000001C20100
        00FFFFFF1F0001000000010000000C0000004D0061006E007500660061006300
        7400750072006500720000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
        0178000000FFFFFF1F0001000000010000000700000050006C00610079006500
        72007300000000000000000000000000110000005445617379436F6C756D6E53
        746F726564FFFECE0006000000800800010100010400000000000196000000FF
        FFFF1F00010000000100000009000000470061006D0065002000530069007A00
        6500000000000000000000000000110000005445617379436F6C756D6E53746F
        726564FFFECE00060000008008000101000105000000000001B0010000FFFFFF
        1F00010000000100000008000000460069006C0065006E0061006D0065000000
        00000000000000000000}
      Header.Draggable = False
      Header.Height = 38
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
      PaintInfoItem.TileDetailCount = 2
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
    end
    object PanelToolBarGamesEditor: TPanelEx
      Left = 0
      Top = 0
      Width = 2022
      Height = 75
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
        Left = 11
        Top = 49
        Width = 641
        Height = 19
        Caption = '  :title    :year    :manufacturer    :number of players    :all'
        Font.Charset = OEM_CHARSET
        Font.Color = 3684408
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
        Left = 10
        Top = 49
        Width = 601
        Height = 19
        Caption = 'F2        F3       F4               F5                    F6'
        Font.Charset = OEM_CHARSET
        Font.Color = 191
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
      object ButtonApplyChanges: TBitBtnEx
        Left = 720
        Top = 15
        Width = 168
        Height = 45
        Hint = 'Close and update main games list with current changes'
        Caption = 'Apply Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ButtonAbortChanges: TBitBtnEx
        Left = 905
        Top = 15
        Width = 168
        Height = 45
        Hint = 'Close and ignore any changes made to the games data'
        Caption = 'Abort Changes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object PanelSearchGames: TPanelEx
        Left = 1649
        Top = 0
        Width = 373
        Height = 75
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
          Left = 8
          Top = 4
          Width = 214
          Height = 24
          Caption = 'Search games by Title'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
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
          Left = 292
          Top = 32
          Width = 36
          Height = 37
          Hint = 'Click here to apply filter'
          Flat = True
          ImageIndex = 9
          Images = FormMain.IL_MiscToolBarPopup
        end
        object ButtonFilterTitleReset: TSpeedButtonEx
          Left = 329
          Top = 32
          Width = 36
          Height = 37
          Hint = 'Click here to reset filter'
          Flat = True
          ImageIndex = 3
          Images = FormMain.IL_MiscToolBarPopup
        end
        object FilterGameTitle: TTntEditEx
          Left = 8
          Top = 33
          Width = 280
          Height = 34
          Hint = 'Search games by title'
          AutoSize = False
          BevelOuter = bvNone
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx
        Left = 405
        Top = 9
        Width = 250
        Height = 36
        Hint = 
          'Allow you to use the lost empty space on the right side'#13#10'when sc' +
          'roll bar is not visible'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Hide Systems Scroll Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ShowBiggerGamesListFont: TAdvOfficeCheckBoxEx
        Left = 10
        Top = 9
        Width = 305
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Show Bigger Games List Font'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object StatusBarPanelMachines: TPanelEx
      Left = 0
      Top = 1335
      Width = 2022
      Height = 36
      Align = alBottom
      Color1 = 15391180
      Color2 = 16512497
      Color3 = 16641245
      Color4 = 16637122
      ColorFrame = 11775403
      ColorInnerFrame = 7891291
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object IconMachineDriverStatus: TImage
        Tag = -1
        Left = 10
        Top = 2
        Width = 32
        Height = 32
        Transparent = True
      end
      object LabelCustomGamesListTotal: TShadowLabel
        Left = 52
        Top = 2
        Width = 228
        Height = 31
        Hint = ' MAME software lists assigned to '
        AutoSize = False
        Caption = '00000 games - MSX 2+'
        Color = 15856113
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 7891291
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        Layout = tlCenter
      end
    end
    object PanelEditSelected: TPanelEx
      Left = 547
      Top = 473
      Width = 927
      Height = 424
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
      object LabelEditSelected: TShadowLabel
        Left = 32
        Top = 32
        Width = 863
        Height = 55
        Caption = 
          'Edit info of multiple selected games at once, even if they are n' +
          'ot from the same system.'#13#10'Make sure to tick checkboxes of all fi' +
          'elds you want to change.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
      end
      object LabelEditSelected_Total: TShadowLabel
        Left = 32
        Top = 354
        Width = 216
        Height = 31
        Caption = '000000 games selected'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object LabelEditSelectedDrag: TShadowLabel
        Left = 455
        Top = 96
        Width = 439
        Height = 28
        Caption = 'drag this panel around to get it out of of way!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
      end
      object LabelEditSelected_Year: TAdvOfficeCheckBoxEx
        Left = 32
        Top = 221
        Width = 75
        Height = 36
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Year'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_Year: TEditEx
        Left = 200
        Top = 221
        Width = 220
        Height = 36
        AutoSize = False
        Color = clWhite
        TabOrder = 4
      end
      object LabelEditSelected_Manufacturer: TAdvOfficeCheckBoxEx
        Left = 32
        Top = 165
        Width = 160
        Height = 36
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Manufacturer'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_Manufacturer: TEditEx
        Left = 200
        Top = 165
        Width = 695
        Height = 36
        AutoSize = False
        Color = clWhite
        TabOrder = 2
      end
      object LabelEditSelected_NumberPlayers: TAdvOfficeCheckBoxEx
        Left = 528
        Top = 221
        Width = 140
        Height = 36
        Checked = True
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = '# of Players'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object EditSelected_NumberPlayers: TEditEx
        Left = 675
        Top = 221
        Width = 220
        Height = 36
        AutoSize = False
        Color = clWhite
        TabOrder = 5
      end
      object ButtonMultiSelectedInfo_Confirm: TBitBtnEx
        Left = 549
        Top = 347
        Width = 168
        Height = 45
        Caption = 'Confirm'
        TabOrder = 6
      end
      object MultiSelectedInfo_Cancel: TBitBtnEx
        Left = 727
        Top = 347
        Width = 168
        Height = 45
        Caption = 'Cancel'
        TabOrder = 7
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
    Left = 424
    Top = 144
    object PopupEditTitle: TMenuItem
      Caption = 'Edit Title'
    end
    object PopupEditYear: TMenuItem
      Tag = 1
      Caption = 'Edit Year'
    end
    object PopupEditManufacturer: TMenuItem
      Tag = 2
      Caption = 'Edit Manufacturer'
    end
    object PopupEditNumberofPlayers: TMenuItem
      Tag = 3
      Caption = 'Edit Number of Players'
    end
    object PopupEditAll: TMenuItem
      Tag = -1
      Caption = 'Edit All'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupMachinesListSidePanelResetColumnsWidth: TMenuItem
      Caption = 'Reset Columns Width'
    end
    object PopupResetSystemsPanelSize: TMenuItem
      Caption = 'Reset Systems Panel Size'
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
      end
      object PopupSystemsViewMode_LargeIcons: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Large Icons View'
        Checked = True
        Hint = 'System title only'
        RadioItem = True
      end
    end
  end
end
