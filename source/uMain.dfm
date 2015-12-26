object FormMain: TFormMain
  Left = 490
  Top = 289
  Width = 1000
  Height = 570
  Caption = 'Emu Loader'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 630
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ToolBarPanel: TCoolBar
    Tag = 1
    Left = 0
    Top = 0
    Width = 984
    Height = 47
    AutoSize = True
    BandBorderStyle = bsNone
    BandMaximize = bmNone
    Bands = <
      item
        Control = ToolBarButtons
        ImageIndex = -1
        MinHeight = 47
        Width = 789
      end
      item
        Break = False
        Control = ToolBarFilterTitle
        FixedSize = True
        ImageIndex = -1
        MinHeight = 24
        Width = 195
      end>
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    FixedOrder = True
    OnMouseDown = ToolBarButtonsMouseDown
    object ToolBarButtons: TToolBar
      Left = 0
      Top = 0
      Width = 570
      Height = 47
      ButtonHeight = 46
      ButtonWidth = 51
      Constraints.MaxWidth = 570
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = IL_ToolBarButtons
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      Wrapable = False
      OnMouseDown = ToolBarButtonsMouseDown
      object ButtonMainMenuOptions: TToolButton
        Left = 0
        Top = 0
        Hint = 'Menu options'
        AutoSize = True
        Caption = 'Menu Options'
        DropdownMenu = MainMenuOptions
        ImageIndex = 0
      end
      object ButtonViewMode: TToolButton
        Left = 51
        Top = 0
        Hint = 'Games view mode'
        AutoSize = True
        Caption = 'View Mode'
        DropdownMenu = PopupMenuViewMode
        ImageIndex = 1
      end
      object ButtonGameFilterArcadeSystems: TToolButton
        Left = 102
        Top = 0
        Hint = 'Select systems filter'
        AutoSize = True
        Caption = 'Systems Filter'
        ImageIndex = 2
        OnClick = ButtonGameFilterArcadeSystemsClick
      end
      object ButtonGameFilterFavorites: TToolButton
        Left = 153
        Top = 0
        Hint = 'Show favorites list [Ctrl+F3 toggle ON/OFF]'
        AutoSize = True
        Caption = 'Favorites Filter'
        DropdownMenu = PopupFavorites
        ImageIndex = 3
        Style = tbsCheck
      end
      object ButtonGameFilterMain: TToolButton
        Left = 204
        Top = 0
        Hint = 'Selected arcade games filter'#13#10' -> List All Filters (Default)'
        AutoSize = True
        Caption = 'Arcade Filters'
        ImageIndex = 4
        OnClick = ButtonGameFilterMainClick
      end
      object ButtonGameFilterParentClone: TToolButton
        Left = 255
        Top = 0
        Hint = 'Select parent/clone games filter'
        AutoSize = True
        Caption = 'Parent/Clone Filter'
        DropdownMenu = PopupGameFilterParentClone
        ImageIndex = 5
      end
      object ButtonGameFilterHaveMiss: TToolButton
        Left = 306
        Top = 0
        Hint = 'Select available/missing games filter'
        AutoSize = True
        Caption = 'Have/Miss Filter'
        DropdownMenu = PopupGameFilterHaveMiss
        ImageIndex = 6
      end
      object ButtonGameFilterDriverStatus: TToolButton
        Left = 357
        Top = 0
        Hint = 'Select driver status filter'
        AutoSize = True
        Caption = 'Driver Status Filter'
        ImageIndex = 7
        OnClick = ButtonGameFilterDriverStatusClick
      end
      object ButtonGameFilterMachines: TToolButton
        Left = 408
        Top = 0
        Hint = 'Select machine types to show in the list'
        AutoSize = True
        Caption = 'Machine Filters'
        ImageIndex = 8
        OnClick = ButtonGameFilterMachinesClick
      end
      object ButtonMAMu_Icons: TToolButton
        Left = 459
        Top = 0
        Hint = 'MAMu_ Icons'
        AutoSize = True
        Caption = 'MAMu_ Icons'
        DropdownMenu = PopupMAMu_Icons
        ImageIndex = 9
      end
      object ButtonExtraFilters: TToolButton
        Left = 510
        Top = 0
        Hint = 'Multiple filters for the games list'
        AutoSize = True
        Caption = 'Miscellaneous Filters'
        ImageIndex = 10
        OnClick = ButtonExtraFiltersClick
      end
    end
    object ToolBarFilterTitle: TToolBar
      Left = 789
      Top = 11
      Width = 195
      Height = 24
      AutoSize = True
      ButtonHeight = 24
      Caption = 'Search Bar'
      Constraints.MaxWidth = 195
      Constraints.MinWidth = 195
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Images = IL_LeftPanel
      ParentFont = False
      TabOrder = 1
      Transparent = True
      OnMouseDown = ToolBarButtonsMouseDown
      object PanelTextBarFilter: TPanel
        Left = 0
        Top = 0
        Width = 145
        Height = 24
        BevelOuter = bvNone
        Constraints.MinHeight = 24
        ParentBackground = True
        TabOrder = 0
        object FilterGameTitle: TEdit
          Left = 0
          Top = 0
          Width = 145
          Height = 24
          Hint = 'Search games'#13#10'Filter: Game Title'
          AutoSize = False
          BevelKind = bkFlat
          Color = clWhite
          Constraints.MaxHeight = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = ' Search games...'
          OnClick = FilterGameTitleClick
          OnEnter = FilterGameTitleEnter
          OnExit = FilterGameTitleExit
          OnKeyPress = FilterGameTitleKeyPress
        end
        object FilterBarOptionsButton: TPanelEx
          Left = 125
          Top = 3
          Width = 17
          Height = 18
          Color1 = clWhite
          Color2 = clSilver
          Color3 = clYellow
          Color4 = clTeal
          ColorFrame = 15790320
          Frames = [frLeft, frTop, frRight, frBottom]
          ParentBackground = False
          Style = vgSolid
          object ButtonSearchBarOptions: TLabel
            Left = 3
            Top = 3
            Width = 12
            Height = 14
            Hint = 'Click here to change filter settings'
            AutoSize = False
            Caption = #234
            Color = clMoneyGreen
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Wingdings'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ShowAccelChar = False
            Transparent = True
            OnMouseDown = ButtonSearchBarOptionsMouseDown
            OnMouseEnter = ButtonSearchBarOptionsMouseEnter
            OnMouseLeave = ButtonSearchBarOptionsMouseLeave
          end
        end
      end
      object ButtonFilterTitleApply: TToolButton
        Left = 145
        Top = 0
        Hint = 'Click here to apply filter'
        AutoSize = True
        Caption = 'Apply'
        ImageIndex = 6
        OnClick = ButtonFilterTitleApplyClick
      end
      object ButtonFilterTitleReset: TToolButton
        Left = 168
        Top = 0
        Hint = 'Click here to reset filter to default (main tool bar buttons)'
        AutoSize = True
        Caption = 'Reset'
        ImageIndex = 7
        OnClick = ButtonFilterTitleResetClick
      end
    end
  end
  object PanelGameImages: TPanel
    Left = 0
    Top = 47
    Width = 984
    Height = 485
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Splitter: TSplitterEx
      Left = 608
      Top = 0
      Width = 6
      Height = 485
      Align = alRight
      OnMoved = SplitterMoved
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = 16445929
      Appearance.ColorTo = 15587527
      Appearance.ColorHot = 13891839
      Appearance.ColorHotTo = 7782911
      Appearance.SingleColor = clBtnFace
      Appearance.SingleColorHot = clGray
      GripStyle = sgDots
      Style = tsOffice2007Luna
    end
    object PanelList: TPanel
      Left = 0
      Top = 0
      Width = 608
      Height = 485
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object SplitterMachines: TSplitterEx
        Left = 230
        Top = 24
        Width = 6
        Height = 441
        Visible = False
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = 16445929
        Appearance.ColorTo = 15587527
        Appearance.ColorHot = 13891839
        Appearance.ColorHotTo = 7782911
        Appearance.SingleColor = clBtnFace
        Appearance.SingleColorHot = clGray
        GripStyle = sgDots
        Style = tsOffice2007Luna
      end
      object PanelMachinesList: TPanel
        Left = 0
        Top = 24
        Width = 230
        Height = 441
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object MachinesListSidePanel: TEasyListview
          Left = 0
          Top = 0
          Width = 230
          Height = 441
          Align = alClient
          CellSizes.Report.Height = 20
          Color = clWhite
          DisabledBlendAlpha = 0
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          ImagesState = IL_GroupedMode
          UseDockManager = False
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
            00060000008008000101000100000000010000FA000000FFFFFF1F0001000000
            01000000070000004D0061006300680069006E00650000000000000000000000
            0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
            080001010001010000000000002D000000FFFFFF1F0001000000010000000400
            0000590065006100720000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
            0078000000FFFFFF1F0001000000010000000C0000004D0061006E0075006600
            6100630074007500720065007200000000000000000000000000110000005445
            617379436F6C756D6E53746F726564FFFECE0006000000800800010100010300
            000000000055000000FFFFFF1F000100000001000000040000004E0061006D00
            6500000000000000000000000000110000005445617379436F6C756D6E53746F
            726564FFFECE0006000000800800010100010400000000000055000000FFFFFF
            1F0001000000010000000800000043006C006F006E00650020006F0066000000
            00000000000000000000110000005445617379436F6C756D6E53746F726564FF
            FECE000600000080080001010001050000000000005F000000FFFFFF1F000100
            0000010000000600000044007200690076006500720000000000000000000000
            0000}
          Header.Draggable = False
          Header.Height = 23
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          ImagesSmall = IL_StandardIconsSmall
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
          ParentShowHint = False
          PopupMenu = PopupMachinesList
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
          TabOrder = 0
          View = elsReport
          OnDblClick = MachinesListSidePanelDblClick
          OnIncrementalSearch = MachinesListSidePanelIncrementalSearch
          OnItemCompare = MachinesListSidePanelItemCompare
          OnItemFreeing = MachinesListSidePanelItemFreeing
          OnItemPaintText = MachinesListSidePanelItemPaintText
          OnItemSelectionChanged = MachinesListSidePanelItemSelectionChanged
          OnKeyAction = MachinesListSidePanelKeyAction
        end
      end
      object GamesListView: TEasyListview
        Left = 236
        Top = 24
        Width = 372
        Height = 441
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
        ImagesState = IL_GroupedMode
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
          0600000018000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000001000190010000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          00010100000000000141000000FFFFFF1F000100000001000000040000005900
          650061007200000000000000000000000000110000005445617379436F6C756D
          6E53746F726564FFFECE00060000008008000101000102000000000001B40000
          00FFFFFF1F0001000000010000000C0000004D0061006E007500660061006300
          7400750072006500720000000000000000000000000011000000544561737943
          6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
          0164000000FFFFFF1F0001000000010000000B0000004F007200690065006E00
          74006100740069006F006E000000000000000000000000001100000054456173
          79436F6C756D6E53746F726564FFFECE00060000008008000101000104000000
          0000015A000000FFFFFF1F0001000000010000000A0000005200650073006F00
          6C007500740069006F006E000000000000000000000000001100000054456173
          79436F6C756D6E53746F726564FFFECE00060000008008000101000105000000
          00000164000000FFFFFF1F0001000000010000000C0000005200650066007200
          6500730068002000520061007400650000000000000000000000000011000000
          5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
          06000000000001B4000000FFFFFF1F0001000000010000000800000043006100
          7400650067006F00720079000000000000000000000000001100000054456173
          79436F6C756D6E53746F726564FFFECE00060000008008000101000107000000
          00000164000000FFFFFF1F0001000000010000000D0000005600650072007300
          69006F006E002000410064006400650064000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          00010800000000000164000000FFFFFF1F000100000001000000090000004700
          61006D00650020004E0061006D00650000000000000000000000000011000000
          5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
          0900000000000164000000FFFFFF1F0001000000010000000800000043006C00
          6F006E00650020006F0066000000000000000000000000001100000054456173
          79436F6C756D6E53746F726564FFFECE0006000000800800010100010A000000
          00000169000000FFFFFF1F0001000000010000000B0000004400720069007600
          6500720020004E0061006D006500000000000000000000000000110000005445
          617379436F6C756D6E53746F726564FFFECE0006000000800800010100010B00
          000000000150000000FFFFFF1F0001000000010000000700000050006C006100
          7900650072007300000000000000000000000000110000005445617379436F6C
          756D6E53746F726564FFFECE0006000000800800010100010C0000000000015A
          000000FFFFFF1F00010000000100000006000000440072006900760065007200
          000000000000000000000000110000005445617379436F6C756D6E53746F7265
          64FFFECE0006000000800800010100010D0000000000015A000000FFFFFF1F00
          01000000010000000900000045006D0075006C006100740069006F006E000000
          00000000000000000000110000005445617379436F6C756D6E53746F726564FF
          FECE0006000000800800010100010E0000000000015A000000FFFFFF1F000100
          0000010000000500000043006F006C006F007200000000000000000000000000
          110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
          010100010F0000000000015A000000FFFFFF1F00010000000100000005000000
          53006F0075006E00640000000000000000000000000011000000544561737943
          6F6C756D6E53746F726564FFFECE000600000080080001010001100000000000
          015A000000FFFFFF1F0001000000010000000700000047007200610070006800
          69006300000000000000000000000000110000005445617379436F6C756D6E53
          746F726564FFFECE000600000080080001010001110000000000013C000000FF
          FFFF1F0001000000010000000600000050006C00610079006500640000000000
          0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100011200000000000164000000FFFFFF1F0001000000
          01000000080000004C0061006E00670075006100670065000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          00800800010100011300000000000182000000FFFFFF1F000100000001000000
          0B000000470061006D0065002000530074006100740075007300000000000000
          000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
          000000800800010100011400000000000173000000FFFFFF1F00010000000100
          000009000000470061006D0065002000530069007A0065000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          00800800010100011500000000000182000000FFFFFF1F000100000001000000
          0B0000004C00610073007400200050006C006100790065006400000000000000
          000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
          00000080080001010001160000000000016E000000FFFFFF1F00010000000100
          00000E00000054006F00740061006C00200050006C0061007900740069006D00
          6500000000000000000000000000110000005445617379436F6C756D6E53746F
          726564FFFECE00060000008008000101000117000000000001C8000000FFFFFF
          1F00010000000100000005000000550073006100670065000000000000000000
          00000000}
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
        ImagesSmall = IL_StandardIconsStandard
        ImagesLarge = IL_StandardIconsLarge
        ImagesExLarge = IL_StandardIconsExtraLarge
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
        PopupMenu = PopupMenuGamesList
        PopupMenuHeader = PopupGamesColumns
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
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        OnColumnClick = GamesListViewColumnClick
        OnColumnPaintText = GamesListViewColumnPaintText
        OnColumnSizeChanging = GamesListViewColumnSizeChanging
        OnDblClick = GamesListViewDblClick
        OnIncrementalSearch = GamesListViewIncrementalSearch
        OnItemCompare = GamesListViewItemCompare
        OnItemFreeing = GamesListViewItemFreeing
        OnItemInitialize = GamesListViewItemInitialize
        OnItemPaintText = GamesListViewItemPaintText
        OnItemSelectionChanged = GamesListViewItemSelectionChanged
        OnItemSelectionChanging = GamesListViewItemSelectionChanging
        OnItemThumbnailDraw = GamesListViewItemThumbnailDraw
        OnKeyAction = GamesListViewKeyAction
        OnThreadCallBack = GamesListViewThreadCallBack
      end
      object StatusBarPanel: TPanelEx
        Tag = 1
        Left = 0
        Top = 465
        Width = 608
        Height = 20
        Align = alBottom
        Color1 = 15391180
        Color2 = 16512497
        Color3 = 16641245
        Color4 = 16637122
        ColorFrame = 7891291
        Frames = [frLeft, frTop, frRight, frBottom]
        ParentBackground = False
        Style = vgSimple
        object StatusBar_GamesTotal: TShadowLabel
          Left = 6
          Top = 2
          Width = 78
          Height = 16
          Caption = '000000 Games'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSkyBlue
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object StatusBar_GamesGameName: TShadowLabel
          Left = 109
          Top = 2
          Width = 378
          Height = 16
          Caption = 
            'gamename [clonename] [biosname] [merged] [xml file: softwarename' +
            ']'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSkyBlue
          ShadowEnabled = False
          EllipsType = etNone
          Transparent = True
        end
        object IconGameStatus: TImage
          Tag = -1
          Left = 90
          Top = 2
          Width = 16
          Height = 16
          Transparent = True
        end
      end
      object ToolBarFilterByMainCPU: TToolBar
        Left = 0
        Top = 0
        Width = 608
        Height = 24
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Images = IL_LeftPanel
        ParentFont = False
        TabOrder = 1
        Transparent = True
        Visible = False
        Wrapable = False
        OnCustomDraw = ImagesToolbarButtonsCustomDraw
        object LabelFilterCPU: TPanelEx
          Left = 0
          Top = 0
          Width = 59
          Height = 22
          Color1 = 9547720
          Color2 = clSilver
          Color3 = clYellow
          Color4 = clTeal
          ColorFrame = 7368816
          Frames = [frLeft, frTop, frRight, frBottom]
          ParentBackground = False
          Style = vgSolid
          object ShadowLabel1: TShadowLabel
            Left = 3
            Top = 3
            Width = 54
            Height = 14
            Caption = 'CPU Filter'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ShowAccelChar = False
            ShadowColor = clNavy
            ShadowEnabled = True
            EllipsType = etNone
            Transparent = True
          end
        end
        object FilterCPU: TEdit
          Left = 59
          Top = 0
          Width = 120
          Height = 22
          Hint = 
            'After typing you can hit the "ENTER" hot-key or press the "Apply' +
            '" button'
          AutoSize = False
          BevelKind = bkFlat
          Color = clWhite
          Constraints.MinHeight = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = FilterCPUKeyDown
        end
        object FilterCPUList: TComboBox
          Left = 179
          Top = 0
          Width = 121
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
        end
        object ButtonFilterCPUApply: TToolButton
          Left = 300
          Top = 0
          Hint = 'Click here to apply CPU filter'
          AutoSize = True
          ImageIndex = 6
          OnClick = ButtonFilterCPUApplyClick
        end
        object ButtonFilterCPUReset: TToolButton
          Left = 323
          Top = 0
          Hint = 'Click here to reset filter to default'
          AutoSize = True
          ImageIndex = 7
          OnClick = ButtonFilterCPUResetClick
        end
        object ButtonFilterCPUClose: TToolButton
          Left = 346
          Top = 0
          Hint = 'Disable this feature'
          AutoSize = True
          ImageIndex = 12
          OnClick = ButtonFilterCPUCloseClick
        end
      end
      object ButtonUnicodeFunctions: TBitBtn
        Left = 424
        Top = 350
        Width = 129
        Height = 25
        Caption = 'Unicode Functions'
        TabOrder = 2
        Visible = False
        OnClick = ButtonUnicodeFunctionsClick
      end
      object ButtonGetEmuVersion: TBitBtn
        Left = 424
        Top = 379
        Width = 137
        Height = 25
        Caption = 'Get Emu Version'
        TabOrder = 3
        Visible = False
        OnClick = ButtonGetEmuVersionClick
      end
      object ButtonNoGameROMsWithDevROMs: TBitBtn
        Left = 424
        Top = 408
        Width = 169
        Height = 25
        Caption = 'no ROMs, have dev ROMs'
        TabOrder = 4
        Visible = False
        OnClick = ButtonNoGameROMsWithDevROMsClick
      end
    end
    object PanelScreenshotsArea: TPanelEx
      Left = 614
      Top = 0
      Width = 370
      Height = 485
      Align = alRight
      BevelOuter = bvNone
      Color1 = clBtnFace
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object PanelWebBrowser: TPanel
        Left = 0
        Top = 317
        Width = 370
        Height = 137
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentColor = True
        TabOrder = 1
        Visible = False
        OnResize = PanelWebBrowserResize
        object WebBrowser: TWebBrowser
          Left = 0
          Top = 22
          Width = 366
          Height = 111
          Align = alClient
          TabOrder = 0
          OnEnter = WebBrowserEnter
          OnStatusTextChange = WebBrowserStatusTextChange
          OnBeforeNavigate2 = WebBrowserBeforeNavigate2
          ControlData = {
            4C000000D4250000790B00000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620A000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
        object WebToolBarButtons: TToolBar
          Left = 0
          Top = 0
          Width = 366
          Height = 22
          AutoSize = True
          ButtonWidth = 133
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = IL_LeftPanel
          List = True
          ShowCaptions = True
          TabOrder = 1
          Transparent = False
          Wrapable = False
          OnCustomDraw = ImagesToolbarButtonsCustomDraw
          object WebButtonRefresh: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refresh current web page'
            AutoSize = True
            Caption = 'Refresh'
            ImageIndex = 7
            OnClick = WebButtonRefreshClick
          end
          object WebButtonStop: TToolButton
            Left = 70
            Top = 0
            Hint = 'Stop loading web page'
            AutoSize = True
            Caption = 'Stop'
            ImageIndex = 13
            OnClick = WebButtonStopClick
          end
          object WebButtonExit: TToolButton
            Left = 125
            Top = 0
            Caption = 'Exit Progetto EMMA'
            ImageIndex = 12
            OnClick = WebButtonExitClick
          end
        end
        object WebBrowserStatusPanel: TPanelEx
          Left = 2
          Top = 113
          Width = 72
          Height = 20
          Color1 = clWhite
          Color2 = 14540253
          Color3 = clYellow
          Color4 = clTeal
          ColorFrame = clSilver
          Frames = [frTop, frRight]
          ParentBackground = False
          Style = vgSimple
          Visible = False
          object LabelWebBrowserStatus: TShadowLabel
            Left = 4
            Top = 2
            Width = 60
            Height = 16
            Caption = 'Load Satus'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            Transparent = True
          end
        end
      end
      object PanelImagesDocuments: TPanel
        Left = 0
        Top = 31
        Width = 370
        Height = 270
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentBackground = False
        TabOrder = 0
        object SplitterMAMEInfo: TSplitterEx
          Left = 0
          Top = 151
          Width = 366
          Height = 7
          Cursor = crVSplit
          Align = alTop
          Visible = False
          OnCanResize = SplitterMAMEInfoCanResize
          Appearance.BorderColor = clNone
          Appearance.BorderColorHot = clNone
          Appearance.Color = 16445929
          Appearance.ColorTo = 15587527
          Appearance.ColorHot = 13891839
          Appearance.ColorHotTo = 7782911
          Appearance.SingleColor = clBtnFace
          Appearance.SingleColorHot = clGray
          GripStyle = sgDots
          Style = tsOffice2007Luna
        end
        object PanelImage: TPanel
          Left = 0
          Top = 158
          Width = 366
          Height = 108
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 7
          Color = clBlack
          ParentBackground = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          object Images: TImage32
            Tag = 1
            Left = 7
            Top = 7
            Width = 352
            Height = 94
            Align = alClient
            Bitmap.DrawMode = dmBlend
            Bitmap.ResamplerClassName = 'TKernelResampler'
            Bitmap.Resampler.KernelClassName = 'THermiteKernel'
            Bitmap.Resampler.KernelMode = kmDynamic
            Bitmap.Resampler.TableSize = 32
            BitmapAlign = baCenter
            Color = clBlack
            ParentColor = False
            ParentShowHint = False
            PopupMenu = PopupMenuImages
            Scale = 1.000000000000000000
            ScaleMode = smResize
            ShowHint = True
            TabOrder = 0
          end
        end
        object PanelGameDocuments: TPanel
          Left = 0
          Top = 0
          Width = 366
          Height = 151
          Align = alTop
          BevelOuter = bvNone
          Constraints.MinHeight = 50
          TabOrder = 1
          Visible = False
          object PanelRichEdit: TPanel
            Left = 0
            Top = 0
            Width = 366
            Height = 151
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object MAMEInfoTextHolder: TRichEditURL
              Left = 0
              Top = 0
              Width = 366
              Height = 151
              TabStop = False
              Align = alClient
              BorderStyle = bsNone
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Consolas'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              PopupMenu = PopupGameDocuments
              ReadOnly = True
              ScrollBars = ssBoth
              ShowHint = False
              TabOrder = 0
              WantReturns = False
              OnURLClick = MAMEInfoTextHolderURLClick
            end
          end
        end
      end
      object ImagesToolbarButtons: TToolBar
        Left = 0
        Top = 0
        Width = 370
        Height = 31
        AutoSize = True
        ButtonHeight = 30
        ButtonWidth = 31
        Constraints.MinHeight = 31
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = IL_ImagesToolBarButtons
        Indent = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Transparent = False
        Wrapable = False
        OnCustomDraw = ImagesToolbarButtonsCustomDraw
        object ButtonImageEnableThreads: TToolButton
          Left = 2
          Top = 0
          Hint = 'Enable threads (load images faster)'
          ImageIndex = 10
          Style = tbsCheck
        end
        object ButtonImageViewMode: TToolButton
          Left = 33
          Top = 0
          Hint = 'Toggle view mode [current: classic]'
          ImageIndex = 9
          OnClick = ButtonImageViewModeClick
        end
        object ButtonPreviousImage: TToolButton
          Left = 64
          Top = 0
          Hint = 'Previous image [F11]'
          AutoSize = True
          Caption = 'Previous Image'
          ImageIndex = 0
          OnClick = ButtonNextImageClick
        end
        object ButtonNextImage: TToolButton
          Tag = 1
          Left = 95
          Top = 0
          Hint = 'Next image [F12]'
          AutoSize = True
          Caption = 'Next Image'
          ImageIndex = 1
          OnClick = ButtonNextImageClick
        end
        object ButtonPreviousCategory: TToolButton
          Left = 126
          Top = 0
          Hint = 'Previous image category [Ctrl+F9]'
          AutoSize = True
          Caption = 'Previous Image Category'
          ImageIndex = 3
          OnClick = ButtonNextCategoryClick
        end
        object ButtonNextCategory: TToolButton
          Tag = 1
          Left = 157
          Top = 0
          Hint = 'Next image category [F9]'
          AutoSize = True
          Caption = 'Next Image Category'
          ImageIndex = 4
          OnClick = ButtonNextCategoryClick
        end
        object ButtonImageCategory: TToolButton
          Tag = 1
          Left = 188
          Top = 0
          Hint = 'Category [Game Snapshot]'
          AutoSize = True
          Caption = 'Image Category'
          DropdownMenu = PopupMenuImageCategories
          ImageIndex = 2
        end
        object ButtonScreenshotLayouts: TToolButton
          Left = 219
          Top = 0
          Hint = 'Layout [Single]'
          AutoSize = True
          DropdownMenu = PopupScreenshotLayouts
          ImageIndex = 5
        end
        object ButtonPreviousLayout: TToolButton
          Left = 250
          Top = 0
          Hint = 'Previous layout [Ctrl+F9]'
          AutoSize = True
          Caption = 'Previous Layout'
          ImageIndex = 6
          OnClick = ButtonNextLayoutClick
        end
        object ButtonNextLayout: TToolButton
          Tag = 1
          Left = 281
          Top = 0
          Hint = 'Next layout [F9]'
          AutoSize = True
          Caption = 'Next Layout'
          ImageIndex = 7
          OnClick = ButtonNextLayoutClick
        end
        object ButtonPlayVideoPreview: TToolButton
          Left = 312
          Top = 0
          Hint = 'Play a video of selected game'
          Caption = 'Play Video Preview'
          ImageIndex = 11
          OnClick = ButtonPlayVideoPreviewClick
        end
      end
    end
  end
  object PopupMenuImages: TBcBarPopupMenu
    Tag = 1
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    OnPopup = PopupMenuImagesPopup
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Bar.BarCaption.ShadowColor = clBlack
    Bar.BarCaption.Visible = False
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 632
    Top = 280
    object PopupImageStretch: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Stretch'
      Checked = True
      OnClick = PopupImageStretchClick
    end
    object PopupImageStretchLarger: TMenuItem
      AutoCheck = True
      Caption = 'Stretch Larger Images Only'
      OnClick = PopupImageStretchClick
    end
    object PopupImageDisplayParent: TMenuItem
      AutoCheck = True
      Caption = 'Display Parent Images'
      Checked = True
      OnClick = PopupImageStretchClick
    end
    object N47: TMenuItem
      Caption = '-'
    end
    object PopupShowFirstImage: TMenuItem
      Caption = 'Go To First Image'
      OnClick = PopupShowFirstImageClick
    end
    object ImagePanelSeparator: TMenuItem
      Caption = '-'
    end
    object PopupRenameCurrentImage: TMenuItem
      Caption = 'Rename Image'
      OnClick = PopupRenameCurrentImageClick
    end
    object PopupDeleteCurrentImage: TMenuItem
      Caption = 'Delete Image'
      ImageIndex = 14
      OnClick = PopupDeleteCurrentImageClick
    end
    object N5: TMenuItem
      Caption = '-'
      Hint = 'Layouts view mode'
    end
    object PopupImageCenterAllSplitters: TMenuItem
      Caption = 'Center All Splitters'
      OnClick = PopupImageCenterAllSplittersClick
    end
    object PopupImageShowSplitterGrip: TMenuItem
      AutoCheck = True
      Caption = 'Show Splitter Grip Icon'
      Checked = True
      OnClick = PopupImageShowSplitterGripClick
    end
    object PopupImageCustomizeSplitters: TMenuItem
      Caption = 'Customize Splitters'
      OnClick = PopupImageCustomizeSplittersClick
    end
    object PopupImageShowLayoutDimensions: TMenuItem
      AutoCheck = True
      Caption = 'Show Layout Dimensions'
      OnClick = PopupImageShowLayoutDimensionsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupImageShowToolBar: TMenuItem
      AutoCheck = True
      Caption = 'Show Tool Bar'
      Checked = True
      ShortCut = 16457
      OnClick = PopupImageShowToolBarClick
    end
    object PopupImageCategoryLayoutSettings: TMenuItem
      Caption = 'Category / Layout Settings'
      OnClick = MenuImageCategoryLayoutSettingsClick
    end
  end
  object PopupMenuGamesList: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    OnPopup = PopupMenuGamesListPopup
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Bar.BarCaption.ShadowColor = clBlack
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 312
    Top = 416
    object PopupPlayGameStandard: TMenuItem
      Caption = 'Run Game'
      ImageIndex = 18
      ShortCut = 13
      OnClick = PopupPlayGameStandardClick
    end
    object PopupPlayExtraMAME: TMenuItem
      Caption = 'Run Game (Extra)'
      ImageIndex = 18
      object PopupRunGamePlaybackInput: TMenuItem
        Tag = 20
        Caption = 'Run Game and Playback Input'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object PopupRunGameRecordInput: TMenuItem
        Tag = 21
        Caption = 'Run Game and Record Input'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object PopupRunGameRecordWaveOutput: TMenuItem
        Tag = 23
        Caption = 'Run Game and Record Wave Output'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object PopupRunGameRecordMNGOutput: TMenuItem
        Tag = 24
        Caption = 'Run Game and Record MNG Output'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object PopupRunGameRecordAVIOutput: TMenuItem
        Tag = 25
        Caption = 'Run Game and Record AVI Output'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object PopupRunGameEffectOverlay: TMenuItem
        Tag = 27
        Caption = 'Run Game with Effect Overlay'
        OnClick = PopupRunGamePlaybackInputClick
      end
      object PopupRunGameLoadSaveState: TMenuItem
        Tag = 22
        Caption = 'Run Game and Load a Save State'
        ImageIndex = 16
        Visible = False
        OnClick = PopupRunGamePlaybackInputClick
      end
    end
    object PopupRunGameWithAlterMAME: TMenuItem
      Tag = 1
      Caption = 'Run Game With AlterMAME'
      ImageIndex = 18
      ShortCut = 8205
      OnClick = PopupRunGamePlaybackInputClick
    end
    object PopupMachineToRunGame: TMenuItem
      Caption = 'Machine to Run Game'
      Hint = '(none)'
      OnClick = PopupMachineToRunGameClick
    end
    object PopupPlayVideoPreview: TMenuItem
      Caption = 'Play Video Preview'
      Hint = 'Play a video of selected game'
      ImageIndex = 13
      ShortCut = 8278
      OnClick = ButtonPlayVideoPreviewClick
    end
    object PopupAutorunGameAlterMAME: TMenuItem
      AutoCheck = True
      Caption = 'Autorun Game With AlterMAME'
      Hint = 'Try again with AlterMAME if fails with MAME'
    end
    object N29: TMenuItem
      Caption = '-'
    end
    object PopupCustomSettings: TMenuItem
      Caption = 'Custom Settings'
      object PopupSetCustomOptions: TMenuItem
        Caption = 'Set [gamename] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
        OnClick = PopupSetCustomOptionsClick
      end
      object PopupDeleteCustomOptions: TMenuItem
        Tag = 1
        Caption = 'Delete [gamename] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
        OnClick = PopupSetCustomOptionsClick
      end
      object PopupSetGameDriverCustomOptions: TMenuItem
        Caption = 'Set [drivername] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
        OnClick = PopupSetGameDriverCustomOptionsClick
      end
      object PopupDeleteGameDriverCustomOptions: TMenuItem
        Tag = 1
        Caption = 'Delete [drivername] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
        OnClick = PopupSetGameDriverCustomOptionsClick
      end
      object PopupCustomMAME: TMenuItem
        Caption = 'Extra'
        object PopupSetMAMEHorizontalGamesOptions: TMenuItem
          Caption = 'Set Horizontal Game Options'
          Hint = 'horizont'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteMAMEHorizontalGamesOptions: TMenuItem
          Tag = 1
          Caption = 'Delete Horizontal Game Options'
          Hint = 'horizont'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetMAMEVerticalGamesOptions: TMenuItem
          Caption = 'Set Vertical Game Options'
          Hint = 'vertical'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteMAMEVerticalGamesOptions: TMenuItem
          Tag = 1
          Caption = 'Delete Vertical Game Options'
          Hint = 'vertical'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetDebugCustomOptions: TMenuItem
          Caption = 'Set Debug Custom Options'
          Hint = 'debug'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteDebugCustomOptions: TMenuItem
          Tag = 1
          Caption = 'Delete Debug Custom Options'
          Hint = 'debug'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object N49: TMenuItem
          Caption = '-'
          Hint = 'Screen type'
        end
        object PopupSetMAMERasterGameOptions: TMenuItem
          Caption = 'Set Raster Custom Options'
          Hint = 'raster'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteMAMERasterGameOptions: TMenuItem
          Tag = 1
          Caption = 'Delete Raster Custom Options'
          Hint = 'raster'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetMAMEVectorGamesOptions: TMenuItem
          Caption = 'Set Vector Custom Options'
          Hint = 'vector'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteMAMEVectorGamesOptions: TMenuItem
          Tag = 1
          Caption = 'Delete Vector Custom Options'
          Hint = 'vector'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetMAMELCDGameOptions: TMenuItem
          Caption = 'Set LCD Custom Options'
          Hint = 'lcd'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteMAMELCDGameOptions: TMenuItem
          Tag = 1
          Caption = 'Delete LCD Custom Options'
          Hint = 'lcd'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object N45: TMenuItem
          Caption = '-'
          Hint = 'MAME 0.162 (and newer) / UME'
        end
        object PopupSetArcadeIniCustomOptions: TMenuItem
          Caption = 'Set [arcade.ini] Custom Options'
          Hint = 'arcade'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteArcadeIniCustomOptions: TMenuItem
          Tag = 1
          Caption = 'Delete [arcade.ini] Custom Options'
          Hint = 'arcade'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetConsoleIniCustomOptions: TMenuItem
          Caption = 'Set [console.ini] Custom Options'
          Hint = 'console'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteConsoleIniCustomOptions: TMenuItem
          Tag = 1
          Caption = 'Delete [console.ini] Custom Options'
          Hint = 'console'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetComputerIniCustomOptions: TMenuItem
          Caption = 'Set [computer.ini] Custom Options'
          Hint = 'computer'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteComputerIniCustomOptions: TMenuItem
          Tag = 1
          Caption = 'Delete [computer.ini] Custom Options'
          Hint = 'computer'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupSetOtherSysIniCustomOptions: TMenuItem
          Caption = 'Set [othersys.ini] Custom Options'
          Hint = 'othersys'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
        object PopupDeleteOtherSysIniCustomOptions: TMenuItem
          Tag = 1
          Caption = 'Delete [othersys.ini] Custom Options'
          Hint = 'othersys'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsClick
        end
      end
    end
    object PopupAlterMAMECustomSettings: TMenuItem
      Caption = 'AlterMAME Custom Settings'
      object PopupSetCustomOptionsAlterMAME: TMenuItem
        Caption = 'Set [gamename] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
        OnClick = PopupSetCustomOptionsAlterMAMEClick
      end
      object PopupDeleteCustomOptionsAlterMAME: TMenuItem
        Tag = 1
        Caption = 'Delete [gamename] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
        OnClick = PopupSetCustomOptionsAlterMAMEClick
      end
      object PopupSetGameDriverCustomOptionsAlterMAME: TMenuItem
        Caption = 'Set [drivername] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
        OnClick = PopupSetGameDriverCustomOptionsAlterMAMEClick
      end
      object PopupDeleteGameDriverCustomOptionsAlterMAME: TMenuItem
        Tag = 1
        Caption = 'Delete [drivername] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
        OnClick = PopupSetGameDriverCustomOptionsAlterMAMEClick
      end
      object PopupCustomMAMEAlterMAME: TMenuItem
        Caption = 'Extra'
        object PopupSetMAMEHorizontalGamesOptionsAlterMAME: TMenuItem
          Caption = 'Set Horizontal Game Options'
          Hint = 'horizont'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteMAMEHorizontalGamesOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete Horizontal Game Options'
          Hint = 'horizont'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetMAMEVerticalGamesOptionsAlterMAME: TMenuItem
          Caption = 'Set Vertical Game Options'
          Hint = 'vertical'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteMAMEVerticalGamesOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete Vertical Game Options'
          Hint = 'vertical'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetDebugCustomOptionsAlterMAME: TMenuItem
          Caption = 'Set Debug Custom Options'
          Hint = 'debug'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteDebugCustomOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete Debug Custom Options'
          Hint = 'debug'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object N51: TMenuItem
          Caption = '-'
          Hint = 'Screen type'
        end
        object PopupSetMAMERasterGameOptionsAlterMAME: TMenuItem
          Caption = 'Set Raster Custom Options'
          Hint = 'raster'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteMAMERasterGameOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete Raster Custom Options'
          Hint = 'raster'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetMAMEVectorGamesOptionsAlterMAME: TMenuItem
          Caption = 'Set Vector Custom Options'
          Hint = 'vector'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteMAMEVectorGamesOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete Vector Custom Options'
          Hint = 'vector'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetMAMELCDGameOptionsAlterMAME: TMenuItem
          Caption = 'Set LCD Custom Options'
          Hint = 'lcd'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteMAMELCDGameOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete LCD Custom Options'
          Hint = 'lcd'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object N63: TMenuItem
          Caption = '-'
          Hint = 'MAME 0.162 (and newer) / UME'
        end
        object PopupSetArcadeIniCustomOptionsAlterMAME: TMenuItem
          Caption = 'Set [arcade.ini] Custom Options'
          Hint = 'arcade'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteArcadeIniCustomOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete [arcade.ini] Custom Options'
          Hint = 'arcade'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetConsoleIniCustomOptionsAlterMAME: TMenuItem
          Caption = 'Set [console.ini] Custom Options'
          Hint = 'console'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteConsoleIniCustomOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete [console.ini] Custom Options'
          Hint = 'console'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetComputerIniCustomOptionsAlterMAME: TMenuItem
          Caption = 'Set [computer.ini] Custom Options'
          Hint = 'computer'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteComputerIniCustomOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete [computer.ini] Custom Options'
          Hint = 'computer'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupSetOtherSysIniCustomOptionsAlterMAME: TMenuItem
          Caption = 'Set [othersys.ini] Custom Options'
          Hint = 'othersys'
          ImageIndex = 7
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
        object PopupDeleteOtherSysIniCustomOptionsAlterMAME: TMenuItem
          Tag = 1
          Caption = 'Delete [othersys.ini] Custom Options'
          Hint = 'othersys'
          ImageIndex = 14
          OnClick = PopupSetMAMEHorizontalGamesOptionsAlterMAMEClick
        end
      end
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object PopupSelectSet: TMenuItem
      Caption = 'Select Set'
      Visible = False
    end
    object PopupSelectaRandomGame: TMenuItem
      Caption = 'Select a Random Game'
      ShortCut = 16466
      OnClick = PopupSelectaRandomGameClick
    end
    object PopupSelectGameStartup: TMenuItem
      Caption = 'Select Game at Startup'
      SubMenuImages = IL_StandardIconsStandard
      OnClick = PopupSelectGameStartupClick
      object PopupStartupGameSelectionGameSelected: TMenuItem
        Tag = -1
        Caption = '(none)'
        HelpContext = -1
        Hint = 'Use last selected game'
        OnClick = PopupStartupGameSelectionGameSelectedClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PopupStartupGameSelectionUseCurrentSelection: TMenuItem
        Caption = 'Use Current: Game Title'
        OnClick = PopupStartupGameSelectionUseCurrentSelectionClick
      end
      object PopupStartupGameSelectionClear: TMenuItem
        Caption = 'Clear Selection (Disable)'
        OnClick = PopupStartupGameSelectionClearClick
      end
    end
    object GameInfo1: TMenuItem
      Caption = '-'
      Hint = 'Game info'
    end
    object PopupGameDetails: TMenuItem
      Caption = 'Game Details'
      ImageIndex = 10
      ShortCut = 8265
      OnClick = PopupGameDetailsClick
    end
    object PopupAutomaticGameInformation: TMenuItem
      AutoCheck = True
      Caption = 'View Game Documents'
      ImageIndex = 9
      ShortCut = 114
      OnClick = PopupAutomaticGameInformationClick
    end
    object N28: TMenuItem
      Caption = '-'
      Hint = 'Games Files (ROMs/CHDs)'
    end
    object PopupDeleteSelectedGames: TMenuItem
      Caption = 'Delete Selected Games'
      ImageIndex = 14
      ShortCut = 46
      OnClick = PopupDeleteSelectedGamesClick
    end
    object PopupExtraCopyMoveSelectedGames: TMenuItem
      Caption = 'Copy/Move'
      object PopupCopySelectedGames: TMenuItem
        Tag = 1
        Caption = 'Copy Selected Games to Folder'
        OnClick = PopupDeleteSelectedGamesClick
      end
      object PopupMoveSelectedGames: TMenuItem
        Tag = 2
        Caption = 'Move Selected Games to Folder'
        OnClick = PopupDeleteSelectedGamesClick
      end
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object PopupAddToFavorites: TMenuItem
      Caption = 'Add To Favorites'
      Hint = 'Add To Favorites [%u]'
      ImageIndex = 3
      ShortCut = 8262
      OnClick = PopupAddToFavoritesClick
    end
    object PopupDeleteFromFavorites: TMenuItem
      Caption = 'Remove From Favorites'
      Hint = 'Remove From Favorites [%u]'
      ImageIndex = 3
      ShortCut = 8260
      OnClick = PopupDeleteFromFavoritesClick
    end
    object Separator_FullScreen: TMenuItem
      Caption = '-'
      Hint = 'Full Screen Mode'
      Visible = False
    end
    object PopupReturnToWindowMode: TMenuItem
      Caption = 'Return To Window Mode'
      ShortCut = 8305
      Visible = False
      OnClick = PopupReturnToWindowModeClick
    end
    object PopupExitApplication: TMenuItem
      Caption = 'Exit Application'
      ImageIndex = 2
      Visible = False
      OnClick = MenuExitClick
    end
    object N15: TMenuItem
      Caption = '-'
      Hint = 'Validate Games'
    end
    object PopupSelectScanGamesMode: TMenuItem
      Caption = 'Select Scan Mode'
      HelpContext = -1
      Hint = 'Full Scan (Validate ROMs/CHDs)'
      ImageIndex = 8
      OnClick = PopupSelectScanGamesModeClick
    end
    object PopupScanGames: TMenuItem
      Caption = 'Scan Games (Audit ROMs)'
      HelpContext = -1
      object PopupScanAllSelectedGames: TMenuItem
        Tag = 3
        Caption = 'Selected Games'
        Hint = 'Selected Games [%u]'
        ShortCut = 8308
        OnClick = PopupScanAllGamesClick
      end
      object PopupScanForceSelectedGamesAvailable: TMenuItem
        Tag = 5
        Caption = 'Force Selected Games Available'
        Hint = 'Force Selected Games Available [%u]'
        ShortCut = 8309
        OnClick = PopupScanAllGamesClick
      end
      object N33: TMenuItem
        Caption = '-'
      end
      object PopupScanAvailableGames: TMenuItem
        Tag = 1
        Caption = 'Scan Available Games'
        OnClick = PopupScanAllGamesClick
      end
      object PopupScanMissingGames: TMenuItem
        Tag = 2
        Caption = 'Scan Missing Games'
        OnClick = PopupScanAllGamesClick
      end
      object PopupScanMissingROMsCHDs: TMenuItem
        Tag = 4
        Caption = 'Scan Missing ROMs/CHDs'
        OnClick = PopupScanAllGamesClick
      end
      object PopupScanAllGames: TMenuItem
        Caption = 'Scan All Games'
        ShortCut = 116
        OnClick = PopupScanAllGamesClick
      end
    end
    object PopupScanResults: TMenuItem
      Caption = 'View Missing ROMs/CHDs'
      object PopupScanResultsSelectedGame: TMenuItem
        Caption = 'Selected Game'
        ShortCut = 8257
        OnClick = PopupScanResultsSelectedGameClick
      end
      object PopupScanResultsAllGames: TMenuItem
        Caption = 'All Games'
        ShortCut = 119
        OnClick = PopupScanResultsAllGamesClick
      end
    end
    object N34: TMenuItem
      Caption = '-'
    end
    object PopupFontSettings: TMenuItem
      Caption = 'Font Settings'
      OnClick = MenuFontSettingsClick
    end
    object PopupThumbnails: TMenuItem
      Caption = 'Thumbnails'
      object PopupThumbnailShowParentThumbs: TMenuItem
        AutoCheck = True
        Caption = 'Show Parent Thumbails'
        Checked = True
        Hint = 'Load parent game thumb into clones'
        OnClick = PopupThumbnailShowParentThumbsClick
      end
      object PopupThumbnailKeepAspectRatio: TMenuItem
        AutoCheck = True
        Caption = 'Keep Aspect Ratio'
        Checked = True
        OnClick = PopupThumbnailKeepAspectRatioClick
      end
      object PopupThumbnailShowImagesGameDocsPanel: TMenuItem
        AutoCheck = True
        Caption = 'Show Images/Game Docs Panel'
        Hint = 'Enable preview images/game docs'
        OnClick = PopupThumbnailShowImagesGameDocsPanelClick
      end
      object PopupThumbnailSettings: TMenuItem
        Caption = 'Customize'
        ImageIndex = 7
        OnClick = MenuThumbnailSettingsClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object PopupThumbnailReloadThumbnailsSelectedGames: TMenuItem
        Tag = 1
        Caption = 'Reload Selected'
        OnClick = PopupThumbReloadAllClick
      end
      object PopupThumbReloadAll: TMenuItem
        Caption = 'Reload All'
        OnClick = PopupThumbReloadAllClick
      end
      object N52: TMenuItem
        Caption = '-'
      end
      object PopupThumbDeleteSelectedGameSnapshots: TMenuItem
        Caption = 'Delete Selected Game Snapshots'
        ImageIndex = 14
        ShortCut = 24660
        OnClick = PopupThumbDeleteSelectedGameSnapshotsClick
      end
    end
    object PopupShowToolBar: TMenuItem
      Caption = 'Show Tool Bar'
      ShortCut = 16468
      Visible = False
      OnClick = PopupShowToolBarClick
    end
    object PopupMainMenu: TMenuItem
      Caption = 'Main Menu'
      ImageIndex = 19
      Visible = False
      OnClick = PopupMainMenuClick
    end
  end
  object FontDialog: TFontDialog
    Tag = -1
    OnShow = FontDialogShow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 376
    Top = 416
  end
  object PopupGameFilterHaveMiss: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_FilterHaveMiss_Small
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 168
    Top = 208
    object PopupShowHaveMiss: TMenuItem
      AutoCheck = True
      Caption = 'List All'
      Checked = True
      Default = True
      ImageIndex = 0
      RadioItem = True
      OnClick = PopupShowHaveMissClick
    end
    object PopupShowHave: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Available'
      ImageIndex = 1
      RadioItem = True
      OnClick = PopupShowHaveMissClick
    end
    object PopupShowMiss: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Missing'
      ImageIndex = 2
      RadioItem = True
      OnClick = PopupShowHaveMissClick
    end
    object PopupShowMissROMs: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = 'Missing ROMs/CHDs'
      ImageIndex = 3
      RadioItem = True
      OnClick = PopupShowHaveMissClick
    end
    object PopupShowMissingAndMissingROMsCHDs: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = 'Missing + Missing ROMs/CHDs'
      ImageIndex = 4
      RadioItem = True
      OnClick = PopupShowHaveMissClick
    end
  end
  object ZipForge: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clMax
    CompressionMode = 9
    CurrentVersion = '2.73 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.CreateDirs = False
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    OnProcessFileFailure = ZipForgeProcessFileFailure
    Zip64Mode = zmDisabled
    Left = 312
    Top = 384
  end
  object PopupMenuViewMode: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_ViewMode_Small
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 40
    Top = 208
    object ButtonViewModeDetails: TMenuItem
      AutoCheck = True
      Caption = 'Details (columns)'
      Checked = True
      Default = True
      ImageIndex = 0
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object ButtonViewModeGrouped: TMenuItem
      AutoCheck = True
      Caption = 'Grouped (columns)'
      ImageIndex = 1
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object ButtonViewModeSmallIcons: TMenuItem
      AutoCheck = True
      Caption = 'Small Icons'
      ImageIndex = 2
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object ButtonViewModeLargeIcons: TMenuItem
      AutoCheck = True
      Caption = 'Large Icons'
      ImageIndex = 3
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object ButtonViewModeTiles: TMenuItem
      AutoCheck = True
      Caption = 'Tiles'
      ImageIndex = 4
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object ButtonViewModeThumbnails: TMenuItem
      AutoCheck = True
      Caption = 'Thumbnails'
      ImageIndex = 5
      RadioItem = True
      OnClick = ButtonViewModeDetailsClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object PopupGameIconSize: TMenuItem
      Tag = 2
      Caption = 'Game Icon Size'
      SubMenuImages = IL_MenuPopup
      Hint = 'Details/grouped'
      object PopupIconSizeExtraLarge: TMenuItem
        AutoCheck = True
        Caption = 'Extra Large'
        Hint = '48x48'
        RadioItem = True
        OnClick = PopupIconSizeStandardClick
      end
      object PopupIconSizeLarge: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Large'
        Hint = '32x32'
        RadioItem = True
        OnClick = PopupIconSizeStandardClick
      end
      object PopupIconSizeStandard: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Standard'
        Checked = True
        Default = True
        Hint = '24x24'
        RadioItem = True
        OnClick = PopupIconSizeStandardClick
      end
      object PopupIconSizeSmall: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'Small'
        Hint = '16x16'
        RadioItem = True
        OnClick = PopupIconSizeStandardClick
      end
    end
    object ButtonViewModeThumbnailSettings: TMenuItem
      Caption = 'Thumbnail Settings'
      SubMenuImages = IL_MenuPopup
      object MenuThumbnailShowParentThumbs: TMenuItem
        AutoCheck = True
        Caption = 'Show Parent Thumbails'
        Checked = True
        Hint = 'Load parent game thumb into clones'
        OnClick = MenuThumbnailShowParentThumbsClick
      end
      object MenuThumbnailKeepAspectRatio: TMenuItem
        AutoCheck = True
        Caption = 'Keep Aspect Ratio'
        Checked = True
        OnClick = MenuThumbnailKeepAspectRatioClick
      end
      object MenuThumbnailShowImagesGameDocsPanel: TMenuItem
        AutoCheck = True
        Caption = 'Show Images/Game Docs Panel'
        Hint = 'Enable preview images/game docs'
        OnClick = MenuThumbnailShowImagesGameDocsPanelClick
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object MenuThumbnailSettings: TMenuItem
        Caption = 'Customize'
        ImageIndex = 7
        OnClick = MenuThumbnailSettingsClick
      end
    end
  end
  object PopupGameFilterParentClone: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_FilterParentClone_Small
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 136
    Top = 208
    object PopupShowParentClone: TMenuItem
      AutoCheck = True
      Caption = 'List Both'
      Checked = True
      Default = True
      ImageIndex = 0
      RadioItem = True
      OnClick = PopupShowParentCloneClick
    end
    object PopupShowParent: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Parent'
      ImageIndex = 1
      RadioItem = True
      OnClick = PopupShowParentCloneClick
    end
    object PopupShowClone: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Clone'
      ImageIndex = 2
      RadioItem = True
      OnClick = PopupShowParentCloneClick
    end
  end
  object IL_ToolBarButtons: TImageList
    Height = 40
    Width = 44
    Left = 360
    Top = 144
  end
  object IL_MenuPopup: TImageList
    Left = 312
    Top = 448
  end
  object IL_StandardIconsLarge: TImageList
    Height = 32
    Width = 32
    Left = 168
    Top = 176
  end
  object IL_StandardIconsStandard: TImageList
    Height = 24
    Width = 24
    Left = 200
    Top = 176
  end
  object IL_StandardIconsSmall: TImageList
    Left = 232
    Top = 176
  end
  object IL_ArcadeSystem_Large: TImageList
    Height = 32
    Width = 32
    Left = 328
    Top = 144
  end
  object IL_ArcadeSystem_Small: TImageList
    Height = 24
    Width = 24
    Left = 328
    Top = 112
  end
  object IL_ImagesCategory_Small: TImageList
    Height = 24
    Width = 24
    Left = 264
    Top = 112
  end
  object IL_FilterWorkingNonWorking_Small: TImageList
    Height = 22
    Width = 28
    Left = 200
    Top = 112
  end
  object IL_FilterWorkingNonWorking_Large: TImageList
    Height = 40
    Width = 44
    Left = 200
    Top = 144
  end
  object IL_FilterHaveMiss_Small: TImageList
    Height = 22
    Width = 28
    Left = 168
    Top = 112
  end
  object IL_FilterHaveMiss_Large: TImageList
    Height = 40
    Width = 44
    Left = 168
    Top = 144
  end
  object IL_FilterParentClone_Small: TImageList
    Height = 22
    Width = 28
    Left = 136
    Top = 112
  end
  object IL_FilterParentClone_Large: TImageList
    Height = 40
    Width = 44
    Left = 136
    Top = 144
  end
  object IL_ViewMode_Small: TImageList
    Height = 22
    Width = 28
    Left = 40
    Top = 112
  end
  object IL_ViewMode_Large: TImageList
    Height = 40
    Width = 44
    Left = 40
    Top = 144
  end
  object IL_ArcadeFilter_Small: TImageList
    Height = 22
    Width = 28
    Left = 72
    Top = 112
  end
  object IL_ArcadeFilter_Large: TImageList
    Height = 40
    Width = 44
    Left = 72
    Top = 144
  end
  object BcDrawModule: TBcCustomDrawModule
    OnDrawMenuItem = BcDrawModuleDrawMenuItem
    OnMeasureMenuItem = BcDrawModuleMeasureMenuItem
    Left = 40
    Top = 247
  end
  object PopupMAMu_Icons: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MiscToolBarSmall
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupMAMu_IconsPopup
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 312
    Top = 208
    object PopupEnableMAMu_Icons: TMenuItem
      AutoCheck = True
      Caption = 'Enable MAMu_ Icons'
      Hint = 'Show custom game icons'
      ImageIndex = 5
      ShortCut = 16461
      OnClick = PopupEnableMAMu_IconsClick
    end
    object PopupSetFoldersMAMu_: TMenuItem
      Caption = 'Select a Folder'
      ImageIndex = 2
      OnClick = PopupSetFoldersMAMu_Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PopupShowParentIcons: TMenuItem
      AutoCheck = True
      Caption = 'Enable Parent Icons'
      Checked = True
      Hint = 'Show icons for parent games'
      OnClick = PopupShowParentIconsClick
    end
    object PopupShowCloneIcons: TMenuItem
      AutoCheck = True
      Caption = 'Enable Clone Icons'
      Checked = True
      Hint = 'Show icons for clone games'
      OnClick = PopupShowParentIconsClick
    end
    object PopupEnableDeviceSetCustomIcon: TMenuItem
      AutoCheck = True
      Caption = 'Enable Device Set Custom Icon'
      Hint = 'Use "deviceset.ico" on all device sets'
      OnClick = PopupShowParentIconsClick
    end
    object PopupShowGameBiosIcons: TMenuItem
      AutoCheck = True
      Caption = 'Enable Game Bios Icons'
      Hint = 'Show bios icon if game icon not found'
      OnClick = PopupShowParentIconsClick
    end
    object PopupShowGameDriverIcons: TMenuItem
      AutoCheck = True
      Caption = 'Enable Game Driver Icons'
      Hint = 'Show driver icon if no icons are found'
      OnClick = PopupShowParentIconsClick
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object PopupForceGameBiosIcons: TMenuItem
      AutoCheck = True
      Caption = 'Force Game Bios Icons'
      Hint = 'Show bios icon even if game icon found'
      OnClick = PopupShowParentIconsClick
    end
    object PopupForceGameDriverIcons: TMenuItem
      AutoCheck = True
      Caption = 'Force Game Driver Icons'
      Hint = 'Show driver icon even if game icon found'
      OnClick = PopupShowParentIconsClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object PopupMAMu_IconsManager: TMenuItem
      Caption = 'MAMu_ Icons Manager'
      Hint = 'For missing and not used icons'
      OnClick = PopupMAMu_IconsManagerClick
    end
    object PopupReloadMAMu_Icons: TMenuItem
      Caption = 'Reload All Icons'
      Hint = 'Clear cache and reload icons'
      ImageIndex = 3
      OnClick = PopupShowParentIconsClick
    end
  end
  object IL_LeftPanel: TImageList
    Left = 40
    Top = 432
  end
  object PopupMenuImageCategories: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_ImagesCategory_Small
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 360
    Top = 208
    object ButtonShowTitleSnapshot: TMenuItem
      AutoCheck = True
      Caption = 'Title Snapshot'
      Hint = 'Title Snapshot'
      ImageIndex = 0
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowGameSnapshot: TMenuItem
      AutoCheck = True
      Caption = 'Game Snapshot'
      Checked = True
      Default = True
      Hint = 'Game Snapshot'
      ImageIndex = 1
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowMarquee: TMenuItem
      AutoCheck = True
      Caption = 'Marquee'
      Hint = 'Marquee'
      ImageIndex = 2
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowFlyer: TMenuItem
      AutoCheck = True
      Caption = 'Flyer'
      Hint = 'Flyer'
      ImageIndex = 3
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowCabinet: TMenuItem
      AutoCheck = True
      Caption = 'Cabinet'
      Hint = 'Cabinet'
      ImageIndex = 4
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowControlPanel: TMenuItem
      AutoCheck = True
      Caption = 'Control Panel'
      Hint = 'Control Panel'
      ImageIndex = 5
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowControlPanelLayout: TMenuItem
      AutoCheck = True
      Caption = 'Control Panel Layout'
      Hint = 'Control Panel Layout'
      ImageIndex = 6
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowPCB: TMenuItem
      AutoCheck = True
      Caption = 'PCB'
      Hint = 'PCB'
      ImageIndex = 7
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowInGameArtwork: TMenuItem
      AutoCheck = True
      Caption = 'In-Game Artwork'
      Hint = 'In-Game Artwork'
      ImageIndex = 8
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object ButtonShowMAWSGameInfo: TMenuItem
      AutoCheck = True
      Caption = 'Progetto EMMA Game Info'
      Hint = 'Progetto EMMA Game Info'
      ImageIndex = 9
      RadioItem = True
      OnClick = ButtonShowGameSnapshotClick
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object PopupSetupCategoryFolders: TMenuItem
      Caption = 'Setup Folders'
      OnClick = MenuImageCategoryLayoutSettingsClick
    end
  end
  object PopupScreenshotLayouts: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_ScreenshotLayouts_Small
    OwnerDraw = True
    TrackButton = tbLeftButton
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 392
    Top = 208
    object PopupScrLayoutSingle: TMenuItem
      AutoCheck = True
      Caption = 'Single'
      Checked = True
      Default = True
      ImageIndex = 0
      RadioItem = True
      OnClick = PopupScrLayoutSingleClick
    end
  end
  object PopupGameDocuments: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Bar.BarCaption.ShadowColor = clBlack
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 648
    Top = 120
    object GameDocumentsFont: TMenuItem
      Caption = 'Text Font'
      OnClick = GameDocumentsFontClick
    end
    object GameDocumentsCustomizePanel: TMenuItem
      Caption = 'Customize Panel'
      ImageIndex = 7
      OnClick = GameDocumentsCustomizePanelClick
    end
    object N43: TMenuItem
      Caption = '-'
      Hint = 'Align panel'
    end
    object GameDocumentsLayout1_Top: TMenuItem
      Tag = 151
      AutoCheck = True
      Caption = 'Top'
      Checked = True
      Default = True
      RadioItem = True
      OnClick = GameDocumentsLayout1_TopClick
    end
    object GameDocumentsLayout2_Bottom: TMenuItem
      Tag = 151
      AutoCheck = True
      Caption = 'Bottom'
      HelpContext = 1
      RadioItem = True
      OnClick = GameDocumentsLayout1_TopClick
    end
    object GameDocumentsLayout3_Left: TMenuItem
      Tag = 151
      AutoCheck = True
      Caption = 'Left'
      HelpContext = 2
      RadioItem = True
      OnClick = GameDocumentsLayout1_TopClick
    end
    object GameDocumentsLayout4_Right: TMenuItem
      Tag = 151
      AutoCheck = True
      Caption = 'Right'
      HelpContext = 3
      RadioItem = True
      OnClick = GameDocumentsLayout1_TopClick
    end
    object N27: TMenuItem
      Caption = '-'
      Hint = 'Quick access'
    end
    object GameDocsGoToInformation: TMenuItem
      Tag = -1
      Caption = 'Go To Game Info'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object GameDocsGoToHistory: TMenuItem
      Tag = -1
      Caption = 'Go To History'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object GameDocsGoToDriverInfo: TMenuItem
      Tag = -1
      Caption = 'Go To Driver Info'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object GameDocsGoToStory: TMenuItem
      Tag = -1
      Caption = 'Go To Story'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object GameDocsGoToMarp: TMenuItem
      Tag = -1
      Caption = 'Go To Marp'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object GameDocsGoToGameInit: TMenuItem
      Tag = -1
      Caption = 'Go To Game Initialization'
      Visible = False
      OnClick = GameDocsGoToInformationClick
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object PopupDisableGameDocs: TMenuItem
      Caption = 'Disable'
      ImageIndex = 9
      ShortCut = 114
      Visible = False
      OnClick = PopupDisableGameDocsClick
    end
  end
  object IL_StandardIconsExtraLarge: TImageList
    Height = 48
    Width = 48
    Left = 136
    Top = 176
  end
  object IL_ImagesCategory_Large: TImageList
    Height = 48
    Width = 48
    Left = 264
    Top = 144
  end
  object IL_ScreenshotLayouts_Small: TImageList
    Height = 24
    Width = 24
    Left = 392
    Top = 176
  end
  object IL_ImagesToolBarButtons: TImageList
    Height = 24
    Width = 24
    Left = 392
    Top = 144
  end
  object IL_MiscToolBarPopup: TImageList
    Height = 24
    Width = 24
    Left = 392
    Top = 112
  end
  object IL_ArcadeSystem_ExtraLarge: TImageList
    Height = 48
    Width = 48
    Left = 328
    Top = 176
  end
  object IL_GroupedMode: TImageList
    Left = 264
    Top = 176
  end
  object PopupFilterGameTitle: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = DEFAULT_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'MS Sans Serif'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clBlack
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 754
    Top = 6
    object FilterTextBarIncludeToolBarFilters: TMenuItem
      AutoCheck = True
      Caption = 'Include Tool Bar Filters'
      Checked = True
      ImageIndex = 5
    end
    object N39: TMenuItem
      Caption = '-'
      Hint = 'Search games by...'
    end
    object FilterGameTitle_Title: TMenuItem
      AutoCheck = True
      Caption = 'Game Title'
      Checked = True
      Default = True
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_Year: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Year'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_Manufacturer: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Manufacturer'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_Category: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = 'Category'
      Hint = 'catver.ini required'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_VersionAdded: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = 'Version Added'
      Hint = 'catver.ini required'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_Language: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = 'Language'
      Hint = 'languages.ini required'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_DriverName: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = 'Driver Name'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_BiosName: TMenuItem
      Tag = 7
      AutoCheck = True
      Caption = 'Bios Name'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_ScreenResolution: TMenuItem
      Tag = 8
      AutoCheck = True
      Caption = 'Screen Resolution'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_GameName: TMenuItem
      Tag = 9
      AutoCheck = True
      Caption = 'Game Name'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_CloneOf: TMenuItem
      Tag = 10
      AutoCheck = True
      Caption = 'Clone of'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object FilterGameTitle_NumberofPlayers: TMenuItem
      Tag = 11
      AutoCheck = True
      Caption = '# of Players'
      Hint = 'nplayers.ini optional'
      RadioItem = True
      OnClick = FilterGameTitle_TitleClick
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object FilterSearchBarHelp: TMenuItem
      Caption = 'Help'
      ImageIndex = 10
      OnClick = FilterSearchBarHelpClick
    end
  end
  object IL_Systems: TImageList
    Height = 68
    Width = 68
    Left = 360
    Top = 176
  end
  object IL_MainMenuOptions: TImageList
    Height = 24
    Width = 24
    Left = 72
    Top = 328
  end
  object MainMenuOptions: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = MainMenuOptionsPopup
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 40
    Top = 328
    object MenuPreferences: TMenuItem
      Caption = 'Preferences'
      Hint = 'Modify frontend settings'
      ImageIndex = 7
      OnClick = MenuPreferencesClick
    end
    object MenuEmulatorSetup: TMenuItem
      Caption = 'Emulator Setup'
      Hint = 'Select emulators to play with'
      OnClick = MenuEmulatorSetupClick
    end
    object MenuEmulatorDefaultSettings: TMenuItem
      Caption = 'Emulator Default Settings'
      ImageIndex = 7
      OnClick = MenuEmulatorDefaultSettingsClick
    end
    object MenuAlterMAMEDefaultSettings: TMenuItem
      Caption = 'AlterMAME Default Settings'
      ImageIndex = 7
      OnClick = MenuAlterMAMEDefaultSettingsClick
    end
    object MenuCreateGamesList: TMenuItem
      Caption = 'Create Games List'
      OnClick = MenuCreateGamesListClick
    end
    object MenuCreateSoftwareListGames: TMenuItem
      Tag = 1
      Caption = 'Create Software List Games'
      OnClick = MenuCreateSoftwareListGamesClick
    end
    object MenuCustomizeSoftwareList: TMenuItem
      Caption = 'Customize Software List'
      Hint = 'Enable/disable lists'
      OnClick = MenuCustomizeSoftwareListClick
    end
    object MenuAddMAMEDeviceSetsWithNoROMs: TMenuItem
      Caption = 'Add MAME Device Sets With No ROMs'
      Visible = False
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object MenuViewEmulatorFullCommandLine: TMenuItem
      AutoCheck = True
      Caption = 'Run Game Confirmation Dialog'
    end
    object MenuView: TMenuItem
      Caption = 'View'
      object MenuViewToolBar: TMenuItem
        Caption = 'Tool Bar Buttons'
        object MenuEnableToolBar: TMenuItem
          AutoCheck = True
          Caption = 'Show Tool Bar'
          Checked = True
          ShortCut = 16468
          OnClick = MenuEnableToolBarClick
        end
        object MenuBoundToGamesPanel: TMenuItem
          AutoCheck = True
          Caption = 'Bound to Games Panel'
          Hint = 'Limit panel size to games list'
          OnClick = MenuBoundToGamesPanelClick
        end
        object MenuSmallToolBar: TMenuItem
          AutoCheck = True
          Caption = 'Small Tool Bar'
          Hint = 'Use small icons in main tool bar'
          OnClick = MenuSmallToolBarClick
        end
        object N20: TMenuItem
          Caption = '-'
        end
        object MenuCustomizeToolBar: TMenuItem
          Caption = 'Customize'
          ImageIndex = 7
          OnClick = MenuCustomizeToolBarClick
        end
      end
      object MenuShowGamesStatusBar: TMenuItem
        AutoCheck = True
        Caption = 'Show Games Status Bar'
        Checked = True
        OnClick = MenuShowGamesStatusBarClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MenuROMsFolders: TMenuItem
        Caption = 'ROMs Folders'
        ImageIndex = 4
        OnClick = MenuROMsFoldersClick
      end
      object MenuViewFilesVersions: TMenuItem
        Caption = 'Files Versions'
        Hint = 'Show emulator/games list version info'
        OnClick = MenuViewFilesVersionsClick
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object MenuViewFullScreen: TMenuItem
        AutoCheck = True
        Caption = 'Frontend In Full Screen'
        Hint = 'Hide title bar and tool bars'
        ShortCut = 8305
        OnClick = MenuViewFullScreenClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MenuRestoreDefaultScreenshotsPanelSize: TMenuItem
        Caption = 'Default Screenshots Panel Size'
        OnClick = MenuRestoreDefaultScreenshotsPanelSizeClick
      end
      object MenuRestoreMainScreenDefaultScreenSizePosition: TMenuItem
        Caption = 'Default Screen Size/Position'
        Hint = 'Windowed mode'
        OnClick = MenuRestoreMainScreenDefaultScreenSizePositionClick
      end
    end
    object MenuEmulator: TMenuItem
      Caption = 'Emulator'
      object MenuEmulatorReloadROMsFolders: TMenuItem
        Caption = 'Reload ROMs Folders'
        Hint = 'Clear cache and reload from files'
        ImageIndex = 4
        OnClick = MenuEmulatorReloadROMsFoldersClick
      end
    end
    object MenuGameList: TMenuItem
      Caption = 'Games List'
      object MenuExportGamesListTextFile: TMenuItem
        Caption = 'Export Games List'
        OnClick = MenuExportGamesListTextFileClick
      end
      object NewTitleFormat: TMenuItem
        AutoCheck = True
        Caption = 'Alternate Title Format [Game, The]'
        OnClick = NewTitleFormatClick
      end
      object MenuGameTitleExtraInfo: TMenuItem
        Caption = 'Game Title Extra Info'
        Hint = 'Remove text after first parenthesis'
        object MenuGameTitleExtraInfo_FullTitle: TMenuItem
          AutoCheck = True
          Caption = 'Show Full Title (Default)'
          Checked = True
          Default = True
          RadioItem = True
          OnClick = MenuGameTitleExtraInfo_FullTitleClick
        end
        object MenuGameTitleExtraInfo_RemoveFromParentSets: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Remove From Parent Sets'
          RadioItem = True
          OnClick = MenuGameTitleExtraInfo_FullTitleClick
        end
        object MenuGameTitleExtraInfo_RemoveFromCloneSets: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = 'Remove From Clone Sets'
          RadioItem = True
          OnClick = MenuGameTitleExtraInfo_FullTitleClick
        end
        object MenuGameTitleExtraInfo_RemoveFromAllSets: TMenuItem
          Tag = 3
          AutoCheck = True
          Caption = 'Remove From All Sets'
          RadioItem = True
          OnClick = MenuGameTitleExtraInfo_FullTitleClick
        end
      end
      object MenuIncrementalSearch: TMenuItem
        Caption = 'Incremental Search'
        Hint = 'Type game title/name on keyboard'
        object MenuIncrementalSearchGameTitle: TMenuItem
          AutoCheck = True
          Caption = 'Game Title'
          Checked = True
          Default = True
          RadioItem = True
          OnClick = MenuIncrementalSearchGameTitleClick
        end
        object MenuIncrementalSearchGameName: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Game Name'
          RadioItem = True
          OnClick = MenuIncrementalSearchGameTitleClick
        end
      end
      object MenuFontSettings: TMenuItem
        Caption = 'Font Settings'
        OnClick = MenuFontSettingsClick
      end
      object MenuCustomizeGamesListAppearance: TMenuItem
        Caption = 'Games List Appearance'
        OnClick = MenuCustomizeGamesListAppearanceClick
      end
      object MenuArcadeBrowseGames: TMenuItem
        Caption = 'Browse Games With'
        object MenuArcadeControlKeyboardMouse: TMenuItem
          AutoCheck = True
          Caption = 'Keyboard + Mouse'
          Checked = True
          Default = True
          RadioItem = True
          OnClick = MenuArcadeControlKeyboardMouseClick
        end
        object MenuArcadeControlDevastator2: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Devastator II'
          RadioItem = True
          OnClick = MenuArcadeControlKeyboardMouseClick
        end
        object MenuArcadeControlHotRodSE: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = 'Hot Rod SE'
          RadioItem = True
          OnClick = MenuArcadeControlKeyboardMouseClick
        end
        object MenuArcadeControlSlikStik: TMenuItem
          Tag = 3
          AutoCheck = True
          Caption = 'SlikStik'
          RadioItem = True
          OnClick = MenuArcadeControlKeyboardMouseClick
        end
        object MenuArcadeControlXArcade: TMenuItem
          Tag = 4
          AutoCheck = True
          Caption = 'X-Arcade'
          RadioItem = True
          OnClick = MenuArcadeControlKeyboardMouseClick
        end
        object N40: TMenuItem
          Caption = '-'
          Hint = 'Settings'
        end
        object MenuArcadeControlSlikStik_SwapStick: TMenuItem
          AutoCheck = True
          Caption = 'Swap 2nd Player Up/Down (SlikStik)'
        end
        object MenuArcadeControllersLayout: TMenuItem
          Caption = 'View Arcade Controllers Layout'
          OnClick = MenuArcadeControllersLayoutClick
        end
      end
      object MenuShowPlayersInfoFromNplayersIniOnly: TMenuItem
        AutoCheck = True
        Caption = 'Show Players Info From nplayers.ini Only'
        Hint = 'Do not show players info from MAME'
        OnClick = MenuShowPlayersInfoFromNplayersIniOnlyClick
      end
      object MenuColumns: TMenuItem
        Caption = 'Columns (Details / Grouped View)'
        object MenuCustomizeColumns: TMenuItem
          Caption = 'Customize Columns'
          OnClick = PopupCustomizeColumnsClick
        end
        object MenuCustomizeColumnsHeaderFont: TMenuItem
          Caption = 'Customize Columns Header Font'
          OnClick = PopupCustomizeColumnsHeaderFontClick
        end
        object MenuDefaultColumnsHeaderFont: TMenuItem
          Caption = 'Default Header Font'
          OnClick = PopupDefaultHeaderFontClick
        end
        object N48: TMenuItem
          Caption = '-'
        end
        object MenuResetColumnstoDefaultSizePosition: TMenuItem
          Caption = 'Reset to Default Size/Position'
          OnClick = PopupResetColumnsToDefaultClick
        end
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object MenuScanMAMEAudioSamples: TMenuItem
        Caption = 'Scan MAME/HBMAME Missing Audio Samples'
        Hint = 'Check for missing files (.zip; .7z)'
        OnClick = MenuScanMAMEAudioSamplesClick
      end
    end
    object MenuImages: TMenuItem
      Caption = 'Images'
      OnClick = MenuImagesClick
      object MenuShowImages: TMenuItem
        AutoCheck = True
        Caption = 'Show Images'
        Checked = True
        Hint = 'Enable preview screenshots panel'
        ImageIndex = 6
        ShortCut = 117
        OnClick = MenuShowImagesClick
      end
      object PopupDisplayGameSnapshotifGameArtworkNotFound: TMenuItem
        AutoCheck = True
        Caption = 'Show Game Snap if Artwork Not Found'
        Hint = 'Load in-game snapshot if found (unzipped)'
      end
      object MenuImageResampler: TMenuItem
        Tag = 2
        Caption = 'Resampler'
        Hint = 'Set image resize filter'
        object MenuImageFilterLinear: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Linear'
          HelpContext = 1
          Hint = 'Blurry, fast'
          RadioItem = True
          OnClick = MenuImageFilterOffClick
        end
        object MenuImageFilterHermite: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = 'Hermite'
          Checked = True
          Default = True
          HelpContext = 8
          Hint = 'Sharp, slow'
          RadioItem = True
          OnClick = MenuImageFilterOffClick
        end
        object N41: TMenuItem
          Caption = '-'
        end
        object MenuImageFilterOff: TMenuItem
          AutoCheck = True
          Caption = 'Off'
          RadioItem = True
          OnClick = MenuImageFilterOffClick
        end
      end
      object MenuImagesEnableToolBar: TMenuItem
        AutoCheck = True
        Caption = 'Show Tool Bar'
        Checked = True
        ShortCut = 16457
        OnClick = MenuImagesEnableToolBarClick
      end
      object N8: TMenuItem
        Caption = '-'
        Hint = 'Game info from internet'
      end
      object MenuImageUseProgettoEMMAInternetInfo: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Use ProgettoEMMA Info (Internet)'
        Checked = True
        Default = True
        Hint = 'http://www.progettoemma.net'
        RadioItem = True
        OnClick = MenuImageUseMAWSInternetInfoClick
      end
      object MenuImageUseMAWSInternetInfo: TMenuItem
        AutoCheck = True
        Caption = 'Use MAWS Info (Internet)'
        Hint = 'http://maws.mameworld.info'
        RadioItem = True
        OnClick = MenuImageUseMAWSInternetInfoClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object MenuImageViewMode: TMenuItem
        Caption = 'View Mode'
        object MenuImageViewModeClassic: TMenuItem
          AutoCheck = True
          Caption = 'Classic Mode'
          Checked = True
          Default = True
          Hint = 'Single Image View'
          RadioItem = True
          OnClick = MenuImageViewModeClassicClick
        end
        object MenuImageViewModeLayouts: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Layouts Mode'
          Hint = 'Multiple Images View'
          RadioItem = True
          OnClick = MenuImageViewModeClassicClick
        end
      end
      object MenuImageCategoryLayoutSettings: TMenuItem
        Caption = 'Category / Layout Settings'
        OnClick = MenuImageCategoryLayoutSettingsClick
      end
      object MenuImageCategoryPrevNextAutoSwitch: TMenuItem
        AutoCheck = True
        Caption = 'Category Prev/Next Auto Switch'
        Hint = 'Switch category with prev/next image buttons'
      end
      object MenuImageLayoutPrevNextAutoSwitch: TMenuItem
        AutoCheck = True
        Caption = 'Layout Prev/Next Auto Switch'
        Hint = 'Switch layout with prev/next image buttons'
      end
      object N31: TMenuItem
        Caption = '-'
        Hint = 'Software List Games Snapshot (MAME)'
      end
      object MenuImageUseCustomSoftListSnapName: TMenuItem
        AutoCheck = True
        Caption = 'Use Custom "snapname" To Take Snapshots'
        Hint = '-snapname softlistname/gamename'
      end
      object MenuImageUseCustomSoftListSnapNameHelp: TMenuItem
        Caption = 'Help'
        ImageIndex = 10
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object MenuImagesManager: TMenuItem
        Caption = 'Images Manager'
        Hint = 'For missing and not used images'
        OnClick = MenuImagesManagerClick
      end
      object MenuImagesDeleteCloneGameImages: TMenuItem
        Caption = 'Delete Clone Game Images'
        OnClick = MenuImagesDeleteCloneGameImagesClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = 'Help'
      object MenuVisitHomepage: TMenuItem
        Caption = 'Visit Homepage'
        object MenuVisitEmuLoaderHomepage: TMenuItem
          Caption = 'Emu Loader'
          Hint = 'http://emuloader.mameworld.info'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitMAMEWorldHomepage: TMenuItem
          Caption = 'MAMEWorld'
          Hint = 'http://www.mameworld.info'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object N16: TMenuItem
          Caption = '-'
          Hint = 'Emulators'
        end
        object MenuVisitMAMEHomepage: TMenuItem
          Caption = 'MAME'
          Hint = 'http://mamedev.org'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitZiNcHomepage: TMenuItem
          Caption = 'ZiNc'
          Hint = 'http://www.emuhype.com'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitDaphneHomepage: TMenuItem
          Caption = 'Daphne'
          Hint = 'http://www.daphne-emu.com'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitDemulHomepage: TMenuItem
          Caption = 'Demul'
          Hint = 'http://demul.emulation64.com'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitSEGAModel2Homepage: TMenuItem
          Caption = 'SEGA Model 2'
          Hint = 'http://nebula.emulatronia.com'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitSupermodelHomepage: TMenuItem
          Caption = 'Supermodel'
          Hint = 'http://www.supermodel3.com'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitHBMAMEHomepage: TMenuItem
          Caption = 'HBMAME'
          Hint = 'http://hbmame.the-chronicles.org'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitDICEHomepage: TMenuItem
          Caption = 'DICE'
          Hint = 'http://adamulation.blogspot.com.br'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object N24: TMenuItem
          Caption = '-'
          Hint = 'Resources'
        end
        object MenuVisitMrDoArcadeHomepage: TMenuItem
          Caption = 'Mr. Do'#39's! Arcade - MAME Artwork'
          Hint = 'http://mrdo.mameworld.info'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitMAMu_Homepage: TMenuItem
          Caption = 'MAMu_ - Icons Master'
          Hint = 'http://icons.mameworld.info'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitClrMAMEProHomepage: TMenuItem
          Caption = 'ClrMAMEPro - ROMs Manager'
          Hint = 'http://www.emulab.it/clrmamepro'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object MenuVisitEmuMoviesVideoSnaps: TMenuItem
          Caption = 'EmuMovies - Video Snaps'
          Hint = 
            'http://emumovies.com/forums/index.php/files/category/1-arcade-co' +
            'llections/'
          OnClick = MenuVisitEmuLoaderHomepageClick
        end
        object ArcadeControllers1: TMenuItem
          Caption = 'Arcade Controllers'
          object MenuVisitDevastator2Homepage: TMenuItem
            Caption = 'Devastator II'
            Hint = 'http://www.treyonics.com'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitHotRodHomepage: TMenuItem
            Caption = 'Hot Rod'
            Hint = 'http://www.hanaho.com'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitSlikStikHomepage: TMenuItem
            Caption = 'SlikStik'
            Hint = 'http://www.slikstik.com'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitXArcadeHomepage: TMenuItem
            Caption = 'X-Arcade'
            Hint = 'http://www.x-arcade.com'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
        end
        object Extras1: TMenuItem
          Caption = 'Extras'
          object MenuVisitProgettoEMMAHomepage: TMenuItem
            Caption = 'Progetto EMMA'
            Hint = 'http://www.progettoemma.net'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitMashMameInfo: TMenuItem
            Caption = 'Mash'#39's MameInfo'
            Hint = 'http://www.mameworld.info/mameinfo'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitMAWSHomepage: TMenuItem
            Caption = 'MAWS'
            Hint = 'http://maws.mameworld.info/maws'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitEasyEmu: TMenuItem
            Caption = 'EasyEmu'
            Hint = 'http://www.mameworld.info/easyemu'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitCatlistEMMA: TMenuItem
            Caption = 'Catlist (ProgettoEMMA)'
            Hint = 'http://www.progettoemma.net/index.php?catlist'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
          object MenuVisitCatlistHomepage: TMenuItem
            Caption = 'Catlist'
            Hint = 'http://catlist.mameworld.info'
            OnClick = MenuVisitEmuLoaderHomepageClick
          end
        end
      end
      object MenuHelpMAMEDocsWiki: TMenuItem
        Caption = 'MAME Documentation Wiki'
        Hint = 'http://mamedev.org/devwiki'
        OnClick = MenuVisitEmuLoaderHomepageClick
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object MenuHelpViewQuickSetupGuide: TMenuItem
        Caption = 'View Quick Setup Guide'
        OnClick = MenuHelpViewQuickSetupGuideClick
      end
      object MenuHelpViewReadme: TMenuItem
        Tag = 1
        Caption = 'View Readme'
        ImageIndex = 9
        OnClick = MenuHelpViewQuickSetupGuideClick
      end
      object MenuHelpViewFAQ: TMenuItem
        Tag = 2
        Caption = 'View F.A.Q.'
        OnClick = MenuHelpViewQuickSetupGuideClick
      end
      object N53: TMenuItem
        Caption = '-'
      end
      object MenuAbout: TMenuItem
        Caption = 'About...'
        ImageIndex = 10
        OnClick = MenuAboutClick
      end
      object getsnaps1: TMenuItem
        Caption = 'get_snaps from internet'
        Visible = False
        OnClick = getsnaps1Click
      end
      object MenuValidateMAMECHDTypes: TMenuItem
        Caption = 'Search New CHD and Control Types'
        Visible = False
        OnClick = MenuValidateMAMECHDTypesClick
      end
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object MenuExit: TMenuItem
      Caption = 'Exit'
      ImageIndex = 2
      OnClick = MenuExitClick
    end
    object oldExportGamesToFile1: TMenuItem
      Caption = 'old Export Games To File'
      Visible = False
      object MenuExportAllFilesFullFormat: TMenuItem
        Caption = 'All Games (Full Format)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportVisibleGamesFullFormat: TMenuItem
        Tag = 1
        Caption = 'Visible Games (Full Format)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportAllSelectedGamesGameNameOnly: TMenuItem
        Tag = 4
        Caption = 'Selected Games (Full Format)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object MenuExportAllGamesGameNameOnly: TMenuItem
        Tag = 2
        Caption = 'All Games (Game Name = System)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportVisibleGamesGameNameOnly: TMenuItem
        Tag = 3
        Caption = 'Visible Games (Game Name = System)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportAllSelectedGames: TMenuItem
        Tag = 5
        Caption = 'Selected Games (Game Name = System)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object N11: TMenuItem
        Caption = '-'
        Hint = 'MAME Content Manager Plus'
      end
      object MenuExportMCMPlusAllGames: TMenuItem
        Tag = 6
        Caption = 'All Games (MAME / HBMAME)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportMCMPlusVisibleGames: TMenuItem
        Tag = 7
        Caption = 'Visible Games (MAME / HBMAME)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
      object MenuExportMCMPlusAllSelectedGames: TMenuItem
        Tag = 8
        Caption = 'Selected Games (MAME / HBMAME)'
        OnClick = MenuExportAllFilesFullFormatClick
      end
    end
  end
  object PopupSplitters: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Bar.BarCaption.ShadowColor = clBlack
    Bar.BarCaption.Visible = False
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 728
    Top = 240
    object CenterSplitter1: TMenuItem
      Caption = 'Center This Splitter'
      OnClick = CenterSplitter1Click
    end
    object MenuItem11: TMenuItem
      Caption = 'Center All Splitters'
      OnClick = PopupImageCenterAllSplittersClick
    end
    object PopupShowSplitterGrip: TMenuItem
      AutoCheck = True
      Caption = 'Show Splitter Grip Icon'
      Checked = True
      OnClick = PopupShowSplitterGripClick
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object MenuItem13: TMenuItem
      Caption = 'Customize Splitters'
      OnClick = PopupImageCustomizeSplittersClick
    end
  end
  object PopupFavorites: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MiscToolBarSmall
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupFavoritesPopup
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 80
    Top = 208
    object PopupEnableFavorites: TMenuItem
      AutoCheck = True
      Caption = 'Enable Favorites'
      Hint = 'Default'
      ImageIndex = 6
      ShortCut = 16498
      OnClick = PopupEnableFavoritesClick
    end
    object PopupFavoritesManager: TMenuItem
      Caption = 'More...'
      Hint = 'Manage favorites'
      OnClick = PopupFavoritesManagerClick
    end
    object N46: TMenuItem
      Caption = '-'
    end
    object MenuShowFavoriteIconinGamesList: TMenuItem
      AutoCheck = True
      Caption = 'Show Favorite Icon in Games'
      Hint = 'Enable favorite icon (details/thumbnail view)'
      OnClick = MenuShowFavoriteIconinGamesListClick
    end
  end
  object IL_MiscToolBarSmall: TImageList
    Height = 22
    Width = 28
    Left = 312
    Top = 240
  end
  object PopupGamesColumns: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupGamesColumnsPopup
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 296
    Top = 80
    object PopupCustomizeColumns: TMenuItem
      Caption = 'Customize Columns'
      OnClick = PopupCustomizeColumnsClick
    end
    object PopupCustomizeColumnsHeaderFont: TMenuItem
      Caption = 'Customize Columns Header Font'
      OnClick = PopupCustomizeColumnsHeaderFontClick
    end
    object PopupDefaultHeaderFont: TMenuItem
      Caption = 'Default Header Font'
      OnClick = PopupDefaultHeaderFontClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object PopupResetColumnsToDefault: TMenuItem
      Caption = 'Reset to Default Size/Position'
      OnClick = PopupResetColumnsToDefaultClick
    end
  end
  object PopupMachinesList: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupMachinesListPopup
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
    DrawModule = BcDrawModule
    OnMeasureMenuItem = MainMenuOptionsMeasureMenuItem
    Left = 144
    Top = 432
    object PopupMachinesListSidePanelFiltersHaveMiss: TMenuItem
      Caption = 'Have/Miss Filter'
      object ListBoth1: TMenuItem
        AutoCheck = True
        Caption = 'List All'
        Checked = True
        RadioItem = True
        OnClick = ListBoth1Click
      end
      object Available1: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Available Machines'
        RadioItem = True
        OnClick = ListBoth1Click
      end
      object Missing1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Missing Machines'
        RadioItem = True
        OnClick = ListBoth1Click
      end
      object MissingROMsCHDs1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'Missing ROMs/CHDs'
        RadioItem = True
        OnClick = ListBoth1Click
      end
    end
    object PopupMachinesListSidePanelFiltersDriver: TMenuItem
      Caption = 'Driver Filter'
      object ListAll1: TMenuItem
        AutoCheck = True
        Caption = 'List All'
        Checked = True
        RadioItem = True
        OnClick = ListAll1Click
      end
      object WorkingGoodImperfect1: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Working (Good+Imperfect)'
        RadioItem = True
        OnClick = ListAll1Click
      end
      object WorkingGood1: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Working (Good)'
        RadioItem = True
        OnClick = ListAll1Click
      end
      object WorkingImperfect1: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'Working (Imperfect)'
        RadioItem = True
        OnClick = ListAll1Click
      end
      object NonWorkingPreliminary1: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'Non-Working (Preliminary)'
        RadioItem = True
        OnClick = ListAll1Click
      end
    end
    object PopupMachinesListSidePanelCustomSettings: TMenuItem
      Caption = 'Custom Settings'
      Visible = False
      object PopupMachinesListSidePanelSetCustomOptions: TMenuItem
        Caption = 'Set [gamename] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
      end
      object PopupMachinesListSidePanelDeleteCustomOptions: TMenuItem
        Tag = 1
        Caption = 'Delete [gamename] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
      end
      object PopupMachinesListSidePanelSetGameDriverCustomOptions: TMenuItem
        Caption = 'Set [drivername] Custom Options'
        Hint = 'Set [%s] Custom Options'
        ImageIndex = 7
      end
      object PopupMachinesListSidePanelDeleteGameDriverCustomOptions: TMenuItem
        Tag = 1
        Caption = 'Delete [drivername] Custom Options'
        Hint = 'Delete [%s] Custom Options'
        ImageIndex = 14
      end
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object PopupMachinesListSidePanelResetColumnsWidth: TMenuItem
      Caption = 'Reset Columns Width'
      OnClick = PopupMachinesListSidePanelResetColumnsWidthClick
    end
  end
end
