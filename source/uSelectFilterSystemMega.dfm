object FormSelectFilterSystemMega: TFormSelectFilterSystemMega
  Left = 1365
  Top = 620
  ActiveControl = SystemsListView
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Machine Type and Systems Filters'
  ClientHeight = 569
  ClientWidth = 608
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelSelectMode: TLabel
    Left = 0
    Top = 0
    Width = 608
    Height = 25
    Align = alTop
    Caption = 
      '              Choose what machine types you want to see in the g' +
      'ames list.'
    Color = clWhite
    Constraints.MinHeight = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    Transparent = False
    Layout = tlCenter
    WordWrap = True
  end
  object PanelButtons: TPanelEx
    Left = 0
    Top = 528
    Width = 608
    Height = 41
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
    object LabelCategoryIniForMESS: TLabel
      Left = 180
      Top = 8
      Width = 202
      Height = 13
      Cursor = crHandPoint
      Hint = 'http://www.progettosnaps.net/renameset/'
      Caption = 'click here to download version.ini pack'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      Transparent = True
      OnClick = LabelCategoryIniForMESSClick
      OnMouseEnter = LabelCategoryIniForMESSMouseEnter
      OnMouseLeave = LabelCategoryIniForMESSMouseLeave
    end
    object LabelCategoryIniFolderForMESS: TLabel
      Left = 160
      Top = 21
      Width = 242
      Height = 16
      Caption = '(place "mess.ini" file in "\arcade\filters\" folder)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object ButtonOk: TBitBtn
      Left = 415
      Top = 10
      Width = 89
      Height = 25
      Hint = 'Close and update filters'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 513
      Top = 10
      Width = 89
      Height = 25
      Hint = 'Close without changing filters'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonReset: TBitBtn
      Left = 6
      Top = 10
      Width = 89
      Height = 25
      Hint = 'Reset filter selection(s) to current'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonResetClick
    end
    object ButtonHelp: TBitBtn
      Left = 99
      Top = 10
      Width = 47
      Height = 25
      Hint = 'I need a little help here!'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
  end
  object SystemsListView: TEasyListview
    Tag = -1
    Left = 4
    Top = 205
    Width = 628
    Height = 294
    AllowHiddenCheckedItems = True
    BorderStyle = bsNone
    CellSizes.Tile.Height = 44
    CellSizes.Tile.Width = 200
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
      0006000000800800010100010000000000000174020000FFFFFF1F0001000000
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
    PaintInfoItem.CheckType = ectBox
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
    OnItemCheckChange = SystemsListViewItemCheckChange
    OnItemImageDraw = SystemsListViewItemImageDraw
    OnItemImageGetSize = SystemsListViewItemImageGetSize
    OnItemImageDrawIsCustom = SystemsListViewItemImageDrawIsCustom
    OnItemPaintText = SystemsListViewItemPaintText
    OnKeyAction = SystemsListViewKeyAction
  end
  object PanelMachinesType: TPanelEx
    Left = 0
    Top = 25
    Width = 608
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object MachinesTypeList: TEasyListview
      Tag = -1
      Left = 4
      Top = 0
      Width = 628
      Height = 176
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Tile.Height = 42
      CellSizes.Tile.Width = 300
      CellSizes.Report.Height = 28
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000174020000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      ImagesLarge = IL_MachinesFilters
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.ShowBorder = False
      PaintInfoItem.TileDetailCount = 2
      ParentShowHint = False
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
      Selection.RectSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsTile
      OnItemCheckChange = MachinesTypeListItemCheckChange
      OnItemPaintText = MachinesTypeListItemPaintText
    end
  end
  object IL_Systems: TImageList
    Height = 32
    Width = 32
    Left = 184
    Top = 464
  end
  object IL_MachinesFilters: TImageList
    Height = 32
    Width = 32
    Left = 512
    Top = 128
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
      Caption = 'Check All Arcade Systems'
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllArcadeSystems: TMenuItem
      Caption = 'Uncheck All Arcade Systems'
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N46: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllConsCompSystems: TMenuItem
      Tag = 1
      Caption = 'Check All Console/Computer/Handheld Systems'
      HelpContext = 1
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllConsCompSystems: TMenuItem
      Caption = 'Uncheck All Console/Computer/Handheld Systems'
      HelpContext = 1
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllConsoleSystems: TMenuItem
      Tag = 1
      Caption = 'Check All Console Systems'
      HelpContext = 2
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllConsoleSystems: TMenuItem
      Caption = 'Uncheck All Console Systems'
      HelpContext = 2
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllComputerSystems: TMenuItem
      Tag = 1
      Caption = 'Check All Computer Systems'
      HelpContext = 3
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllComputerSystems: TMenuItem
      Caption = 'Uncheck All Computer Systems'
      HelpContext = 3
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PopupCheckAllHandheldSystems: TMenuItem
      Tag = 1
      Caption = 'Check All Handheld Systems'
      HelpContext = 4
      OnClick = PopupCheckAllArcadeSystemsClick
    end
    object PopupUncheckAllHandheldSystems: TMenuItem
      Caption = 'Uncheck All Handheld Systems'
      HelpContext = 4
      OnClick = PopupCheckAllArcadeSystemsClick
    end
  end
end
