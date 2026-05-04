object FormSelectFilterSystemSimple: TFormSelectFilterSystemSimple
  Left = 666
  Top = 278
  ActiveControl = ConsCompSystemsListView
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Systems Quick Filter'
  ClientHeight = 351
  ClientWidth = 812
  Color = clWhite
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelBottom: TPanelEx
    Left = 0
    Top = 299
    Width = 812
    Height = 52
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelMultiSelect: TShadowLabel
      Left = 300
      Top = 2
      Width = 210
      Height = 16
      Caption = 'Hold Ctrl or Shift for multiple selections'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSysTotalSelected: TShadowLabel
      Left = 235
      Top = 26
      Width = 112
      Height = 16
      Caption = '100 Systems Selected'
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonOk: TBitBtnEx
      Left = 619
      Top = 21
      Width = 89
      Height = 25
      Hint = 'Close and enable the quick filter'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 717
      Top = 21
      Width = 89
      Height = 25
      Hint = 'Close without changing filters'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonReload: TBitBtnEx
      Left = 6
      Top = 21
      Width = 89
      Height = 25
      Hint = 'Reload quick filter selection(s) to current'
      Caption = 'Reload'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonReloadClick
    end
    object ButtonHelp: TBitBtnEx
      Left = 570
      Top = 21
      Width = 43
      Height = 25
      Hint = 'Why another systems filter ?'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
    object ResetToMachineTypeSystemsMegaFilter: TBitBtnEx
      Tag = 1
      Left = 99
      Top = 21
      Width = 129
      Height = 25
      Hint = 
        'Disable quick filter and reset to machine type / systems full fi' +
        'lter'
      Caption = 'Disable Quick Filter'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ResetToMachineTypeSystemsMegaFilterClick
    end
  end
  object ConsCompSystemsListView: TEasyListview
    Tag = -1
    Left = 4
    Top = 2
    Width = 820
    Height = 296
    BorderStyle = bsNone
    CellSizes.Tile.Height = 42
    CellSizes.Tile.Width = 192
    CellSizes.Report.Height = 28
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Trebuchet MS'
    EditManager.Font.Style = []
    UseDockManager = False
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
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000134030000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesExLarge = IL_Systems
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 0
    PaintInfoItem.ImageIndent = 0
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileDetailCount = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupSystems
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendColorSelRect = 10902593
    Selection.BlendIcon = False
    Selection.BorderColor = 10902593
    Selection.BorderColorSelRect = 10902593
    Selection.Color = 10902593
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnDblClick = ConsCompSystemsListViewDblClick
    OnItemImageDraw = ConsCompSystemsListViewItemImageDraw
    OnItemImageGetSize = ConsCompSystemsListViewItemImageGetSize
    OnItemImageDrawIsCustom = ConsCompSystemsListViewItemImageDrawIsCustom
    OnItemPaintText = ConsCompSystemsListViewItemPaintText
    OnItemSelectionChanged = ConsCompSystemsListViewItemSelectionChanged
    OnKeyAction = ConsCompSystemsListViewKeyAction
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 56
    Top = 56
  end
  object PopupSystems: TBcBarPopupMenu
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
    OnMeasureMenuItem = PopupSystemsMeasureMenuItem
    Left = 120
    Top = 248
    object PopupCheckAllArcadeSystems: TMenuItem
      Tag = 1
      Caption = 'Select All Arcade Systems'
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllArcadeSystems: TMenuItem
      Caption = 'Unselect All Arcade Systems'
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllConsoleSystems: TMenuItem
      Tag = 1
      Caption = 'Select All Console Systems'
      HelpContext = 2
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllConsoleSystems: TMenuItem
      Caption = 'Unselect All Console Systems'
      HelpContext = 2
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllComputerSystems: TMenuItem
      Tag = 1
      Caption = 'Select All Computer Systems'
      HelpContext = 3
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllComputerSystems: TMenuItem
      Caption = 'Unselect All Computer Systems'
      HelpContext = 3
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllHandheldSystems: TMenuItem
      Tag = 1
      Caption = 'Select All Handheld Systems'
      HelpContext = 4
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllHandheldSystems: TMenuItem
      Caption = 'Unselect All Handheld Systems'
      HelpContext = 4
      OnClick = PopupCheckAllArcadeSystemsClick
    end
  end
end
