object FormConsCompSystemsEditor: TFormConsCompSystemsEditor
  Left = 779
  Top = 584
  Width = 1021
  Height = 970
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Console/Computer Systems Editor - Assign MAME software lists'
  Color = 15856113
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
  object PanelSoftwareLists: TPanelEx
    Left = 398
    Top = 0
    Width = 607
    Height = 932
    Align = alClient
    BevelOuter = bvNone
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object SplitterMainSoftware: TSplitterEx
      Left = 0
      Top = 449
      Width = 607
      Height = 7
      Cursor = crVSplit
      Align = alTop
      ResizeStyle = rsUpdate
      Appearance.BorderColor = 7891291
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
    object PanelAssignedSoftwareList: TPanelEx
      Left = 0
      Top = 0
      Width = 607
      Height = 449
      Align = alTop
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object LabelSoftListAssignedToSystem: TShadowLabel
        Left = 0
        Top = 423
        Width = 605
        Height = 24
        Hint = ' MAME software lists assigned to '
        Align = alBottom
        AutoSize = False
        Caption = '  00000 MAME software lists assigned to MSX'
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
      object SoftListAssignedToSystem: TEasyListview
        Left = 0
        Top = 0
        Width = 605
        Height = 423
        Align = alClient
        CellSizes.Report.Height = 22
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000001000166010000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          00010100000000000182000000FFFFFF1F0001000000010000000D0000005300
          6F0066007400770061007200650020004E0061006D0065000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          00800800010100010200000000000164000000FFFFFF1F000100000001000000
          050000004D006500640069006100000000000000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = IL_MediaType
        PaintInfoColumn.CaptionIndent = 0
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentShowHint = False
        PopupMenu = PopupSoftList
        ShowThemedBorder = False
        ShowThemedBorderColor = 7891291
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.EnableDragSelect = True
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
        OnColumnSizeChanged = SoftListAssignedToSystemColumnSizeChanged
        OnDblClick = SoftListAssignedToSystemDblClick
        OnItemSelectionChanged = SoftListAssignedToSystemItemSelectionChanged
        OnKeyAction = SoftListAssignedToSystemKeyAction
      end
    end
    object PanelRemainingSoftwareList: TPanelEx
      Left = 0
      Top = 456
      Width = 607
      Height = 435
      Align = alClient
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object LabelSoftListFilesNotAssigned: TShadowLabel
        Left = 0
        Top = 409
        Width = 605
        Height = 24
        Hint = ' MAME software lists not assigned to any system'
        Align = alBottom
        AutoSize = False
        Caption = '  00000 MAME software lists not assigned to any system'
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
      object SoftListFilesNotAssigned: TEasyListview
        Left = 0
        Top = 0
        Width = 605
        Height = 409
        Align = alClient
        CellSizes.Report.Height = 22
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000001000166010000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          00010100000000000182000000FFFFFF1F0001000000010000000D0000005300
          6F0066007400770061007200650020004E0061006D0065000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          00800800010100010200000000000164000000FFFFFF1F000100000001000000
          050000004D006500640069006100000000000000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = IL_MediaType
        PaintInfoColumn.CaptionIndent = 0
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentShowHint = False
        PopupMenu = PopupSoftList
        ShowThemedBorder = False
        ShowThemedBorderColor = 7891291
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.EnableDragSelect = True
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
        OnColumnClick = SoftListFilesNotAssignedColumnClick
        OnColumnSizeChanged = SoftListFilesNotAssignedColumnSizeChanged
        OnDblClick = SoftListFilesNotAssignedDblClick
        OnItemCompare = SoftListFilesNotAssignedItemCompare
        OnItemSelectionChanged = SoftListFilesNotAssignedItemSelectionChanged
      end
    end
    object PanelBottom: TPanelEx
      Tag = 1
      Left = 0
      Top = 891
      Width = 607
      Height = 41
      Align = alBottom
      Color1 = 15856113
      Color2 = 14540253
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      OnResize = PanelBottomResize
      object GamesListFontSize: TShadowLabel
        Tag = 9
        Left = 132
        Top = 10
        Width = 25
        Height = 23
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
      object ButtonOptions: TSpeedButtonEx
        Left = 9
        Top = 9
        Width = 22
        Height = 24
        Hint = 'Settings'
        Flat = True
        ImageIndex = 7
        Images = FormMain.IL_MenuPopup
        OnClick = ButtonOptionsClick
      end
      object ButtonOk: TBitBtnEx
        Tag = 1
        Left = 414
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close and update settings'
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
      end
      object ButtonCancel: TBitBtnEx
        Left = 512
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close without updating'
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx
        Left = 248
        Top = 11
        Width = 146
        Height = 20
        Hint = 
          'Allow you to use the lost empty space on the right side'#13#10'when sc' +
          'roll bar is not visible'
        TabOrder = 2
        OnClick = SystemsHideScrollBarAreaClick
        Alignment = taLeftJustify
        Caption = 'Hide Systems Scroll Bar'
        ReturnIsTab = False
        Themed = True
      end
      object GamesListFontSizeSmaller: TBitBtnEx
        Tag = -1
        Left = 105
        Top = 9
        Width = 25
        Height = 25
        Hint = 'Smaller font size'
        Caption = #231
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeLarger: TBitBtnEx
        Tag = 1
        Left = 159
        Top = 9
        Width = 25
        Height = 25
        Hint = 'Larger font size'
        Caption = #232
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeSmaller_x4: TBitBtnEx
        Tag = -4
        Left = 57
        Top = 9
        Width = 46
        Height = 25
        Hint = 'Smaller font size (4 steps)'
        Caption = #231#231
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = GamesListFontSizeSmallerClick
      end
      object GamesListFontSizeLarger_x4: TBitBtnEx
        Tag = 4
        Left = 185
        Top = 9
        Width = 46
        Height = 25
        Hint = 'Larger font size (4 steps)'
        Caption = #232#232
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = GamesListFontSizeSmallerClick
      end
    end
  end
  object PanelSystems: TPanelEx
    Left = 0
    Top = 0
    Width = 392
    Height = 932
    Align = alLeft
    BevelOuter = bvNone
    Color1 = clWhite
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
  end
  object PanelSearchGames: TPanelEx
    Left = 188
    Top = 112
    Width = 380
    Height = 129
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object PanelSearchGamesCaptionBar: TShadowLabel
      Left = 1
      Top = 1
      Width = 374
      Height = 25
      AutoSize = False
      Caption = '   Interface Settings'
      Color = clMedGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
      Layout = tlCenter
    end
    object ButtonFilterTitleClose: TShadowLabel
      Left = 330
      Top = 3
      Width = 43
      Height = 21
      Hint = 'Close'
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = 2519212
      ColorInnerFrame = clBlack
      EnableInnerFrame = True
      Frames = [lfrLeft, lfrTop, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object LabelSearchGamesFilter: TShadowLabel
      Left = 8
      Top = 32
      Width = 130
      Height = 14
      Caption = 'Systems View Mode'
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
    end
    object LabelSystemViewMode_Tiles: TLabel
      Left = 32
      Top = 65
      Width = 123
      Height = 18
      Caption = 'Detailed info and icon'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelSystemViewMode_LargeIcons: TLabel
      Left = 32
      Top = 105
      Width = 94
      Height = 18
      Caption = 'System title only'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object SystemViewMode_Tiles: TAdvOfficeRadioButtonEx
      Left = 16
      Top = 48
      Width = 80
      Height = 20
      TabOrder = 0
      OnClick = SystemViewMode_TilesClick
      Alignment = taLeftJustify
      Caption = 'Tiles View'
      ReturnIsTab = False
      Themed = True
    end
    object SystemViewMode_LargeIcons: TAdvOfficeRadioButtonEx
      Tag = 1
      Left = 16
      Top = 88
      Width = 118
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = SystemViewMode_TilesClick
      Alignment = taLeftJustify
      Caption = 'Large Icons View'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 288
    Top = 888
  end
  object PopupSoftList: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupSoftListPopup
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -11
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = []
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
    OnMeasureMenuItem = PopupSoftListMeasureMenuItem
    Left = 560
    Top = 792
    object PopupMoveSelectedToDestination: TMenuItem
      Caption = 'Move Selected to '
      OnClick = PopupMoveSelectedToDestinationClick
    end
  end
  object IL_MediaType: TImageList
    Left = 320
    Top = 888
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
    Left = 360
    Top = 888
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
