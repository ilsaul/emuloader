object FormConsCompSystemsEditor4K: TFormConsCompSystemsEditor4K
  Left = 685
  Top = 431
  Width = 2001
  Height = 1153
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 
    'Console/Computer/Handheld Systems Editor - Assign MAME software ' +
    'lists (4K)'
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object Splitter: TSplitterEx
    Left = 643
    Top = 0
    Width = 6
    Height = 1114
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
  object PanelSoftwareLists: TPanelEx
    Left = 649
    Top = 0
    Width = 1336
    Height = 1114
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
      Width = 1336
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
      Width = 1336
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
        Top = 411
        Width = 1334
        Height = 36
        Hint = ' MAME software lists assigned to '
        Align = alBottom
        AutoSize = False
        Caption = '000000 MAME software lists assigned to MSX'
        CaptionIndent = 10
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
        Width = 1334
        Height = 411
        Align = alClient
        CellSizes.Report.Height = 22
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -21
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
          000600000080080001010001000000000100010C030000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          0001010000000000015E010000FFFFFF1F0001000000010000000D0000005300
          6F0066007400770061007200650020004E0061006D0065000000000000000000
          00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
          008008000101000102000000000001C8000000FFFFFF1F000100000001000000
          050000004D006500640069006100000000000000000000000000}
        Header.Draggable = False
        Header.Height = 38
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = IL_MediaType
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
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
      end
    end
    object PanelRemainingSoftwareList: TPanelEx
      Left = 0
      Top = 456
      Width = 1336
      Height = 587
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
        Top = 549
        Width = 1334
        Height = 36
        Hint = ' MAME software lists not assigned to any system'
        Align = alBottom
        AutoSize = False
        Caption = '000000 MAME software lists not assigned to any system'
        CaptionIndent = 10
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
        Width = 1334
        Height = 549
        Align = alClient
        CellSizes.Report.Height = 22
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -21
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
        Header.Height = 38
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
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
      end
    end
    object PanelBottom: TPanelEx
      Tag = 1
      Left = 0
      Top = 1043
      Width = 1336
      Height = 71
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
      object ButtonOk: TBitBtnEx
        Tag = 1
        Left = 977
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Close and update settings'
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
      end
      object ButtonCancel: TBitBtnEx
        Left = 1156
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Close without updating'
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object SystemsHideScrollBarArea: TAdvOfficeCheckBoxEx
        Left = 368
        Top = 18
        Width = 250
        Height = 36
        Hint = 
          'Allow you to use the lost empty space on the right side'#13#10'when sc' +
          'roll bar is not visible'
        TabOrder = 2
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
        Left = 9
        Top = 18
        Width = 305
        Height = 36
        TabOrder = 3
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
  end
  object PanelSystems: TPanelEx
    Left = 0
    Top = 0
    Width = 643
    Height = 1114
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
      Top = 0
      Width = 643
      Height = 1114
      Align = alClient
      BorderStyle = bsNone
      CellSizes.Icon.Height = 82
      CellSizes.Icon.Width = 62
      CellSizes.Tile.Height = 42
      CellSizes.Tile.Width = 186
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
      ImagesLarge = IL_Systems
      ImagesExLarge = IL_Systems
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
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
    end
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 312
    Top = 800
  end
  object PopupSoftList: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
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
    Left = 560
    Top = 792
    object PopupMoveSelectedToDestination: TMenuItem
      Caption = 'Move Selected to '
    end
  end
  object IL_MediaType: TImageList
    Left = 344
    Top = 800
  end
end
