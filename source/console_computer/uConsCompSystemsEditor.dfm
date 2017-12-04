object FormConsCompSystemsEditor: TFormConsCompSystemsEditor
  Left = 779
  Top = 584
  Width = 1021
  Height = 958
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter: TSplitterEx
    Left = 392
    Top = 0
    Width = 6
    Height = 920
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
  object PanelSoftwareLists: TPanel
    Left = 398
    Top = 0
    Width = 607
    Height = 920
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object SplitterMainSoftware: TSplitterEx
      Left = 0
      Top = 449
      Width = 607
      Height = 10
      Cursor = crVSplit
      Align = alTop
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
    object PanelAssignedSoftwareList: TPanel
      Left = 0
      Top = 0
      Width = 607
      Height = 449
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object GamesListPanelCustomBackgroundColor: TPanel
        Left = 0
        Top = 0
        Width = 607
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object GamesListBackgroundColor: TColorBox
          Left = 224
          Top = 4
          Width = 225
          Height = 22
          Hint = 'Games list background color'
          DefaultColorColor = clWhite
          Selected = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
          OnSelect = GamesListBackgroundColorSelect
        end
        object ButtonGamesListFont: TBitBtn
          Left = 180
          Top = 4
          Width = 43
          Height = 22
          Caption = 'Font'
          TabOrder = 1
          OnClick = ButtonGamesListFontClick
        end
      end
      object PanelBottomSoftListAssignedToSystem: TPanelEx
        Left = 0
        Top = 427
        Width = 607
        Height = 22
        Align = alBottom
        Color1 = 15856113
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = 11775403
        Frames = [frLeft, frRight, frBottom]
        ParentBackground = False
        Style = vgSolid
        object LabelSoftListAssignedToSystem: TLabel
          Left = 8
          Top = 3
          Width = 230
          Height = 15
          Hint = ' MAME software lists assigned to '
          Caption = '00000 MAME software lists assigned to MSX'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
      end
      object SoftListAssignedToSystem: TEasyListview
        Left = 0
        Top = 31
        Width = 607
        Height = 396
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
        TabOrder = 2
        View = elsReport
        OnColumnSizeChanged = SoftListAssignedToSystemColumnSizeChanged
        OnDblClick = SoftListAssignedToSystemDblClick
        OnItemSelectionChanged = SoftListAssignedToSystemItemSelectionChanged
        OnKeyAction = SoftListAssignedToSystemKeyAction
      end
    end
    object PanelRemainingSoftwareList: TPanel
      Left = 0
      Top = 459
      Width = 607
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object SoftListFilesNotAssigned: TEasyListview
        Left = 0
        Top = 0
        Width = 607
        Height = 398
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
      object PanelBottomSoftListFilesNotAssigned: TPanelEx
        Left = 0
        Top = 398
        Width = 607
        Height = 22
        Align = alBottom
        Color1 = 15856113
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = 11775403
        Frames = [frLeft, frRight, frBottom]
        ParentBackground = False
        Style = vgSolid
        object LabelSoftListFilesNotAssigned: TLabel
          Left = 8
          Top = 3
          Width = 286
          Height = 15
          Hint = ' MAME software lists not assigned to any system'
          Caption = '00000 MAME software lists not assigned to any system'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
      end
    end
    object PanelButtons: TPanelEx
      Left = 0
      Top = 879
      Width = 607
      Height = 41
      Align = alBottom
      Color1 = 15856113
      Color2 = 14540253
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object ButtonOk: TBitBtn
        Tag = 1
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close and update settings'
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
      end
      object ButtonCancel: TBitBtn
        Left = 106
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close without updating'
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PanelSystems: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 920
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object LabelSystemTitle: TShadowLabel
      Left = 0
      Top = 0
      Width = 392
      Height = 16
      Align = alTop
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
      Transparent = False
      Layout = tlCenter
    end
    object Systems: TEasyListview
      Tag = -1
      Left = 0
      Top = 16
      Width = 392
      Height = 904
      Align = alClient
      CellSizes.Icon.Height = 82
      CellSizes.Icon.Width = 62
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
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      OnItemSelectionChanged = SystemsItemSelectionChanged
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 384
    Top = 56
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
    Left = 384
    Top = 96
  end
end
