object FormLastPlayedGamesMega: TFormLastPlayedGamesMega
  Left = 818
  Top = 520
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Last Played Games [Top 25]'
  ClientHeight = 967
  ClientWidth = 1178
  Color = clBlue
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
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelGames: TPanelEx
    Left = 0
    Top = 345
    Width = 1178
    Height = 580
    Align = alBottom
    Color1 = 15856113
    Color2 = 15132390
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LastPlayedList: TEasyListview
      Tag = -1
      Left = 0
      Top = 18
      Width = 1178
      Height = 564
      BorderStyle = bsNone
      BorderWidth = 4
      CellSizes.Tile.Width = 390
      CellSizes.Report.Height = 22
      Color = 15856113
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = FormMain.IL_LeftPanel
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clBlack
      GroupFont.Height = -12
      GroupFont.Name = 'Trebuchet MS'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000005000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000000003F020000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        0001010000000000018C000000FFFFFF1F000100000001000000040000004E00
        61006D006500000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000000B40000
        00FFFFFF1F0001000000010000000D00000053006F0066007400770061007200
        650020004E0061006D0065000000000000000000000000001100000054456173
        79436F6C756D6E53746F726564FFFECE00060000008008000101000103000000
        0100007D000000FFFFFF1F0001000000010000000B0000004C00610073007400
        200050006C006100790065006400000000000000000000000000110000005445
        617379436F6C756D6E53746F726564FFFECE0006000000800800010100010400
        000000000096000000FFFFFF1F0001000000010000000E00000054006F007400
        61006C00200050006C0061007900740069006D00650000000000000000000000
        0000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -11
      Header.Font.Name = 'Verdana'
      Header.Font.Style = []
      Header.Sizeable = False
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      ImagesSmall = FormMain.IL_LeftPanel
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.ImageIndent = 3
      PaintInfoItem.TileDetailCount = 3
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      OnDblClick = LastPlayedListDblClick
      OnItemPaintText = LastPlayedListItemPaintText
      OnKeyAction = LastPlayedListKeyAction
    end
    object PanelPlayedListHeader: TPanelEx
      Left = 0
      Top = 0
      Width = 1178
      Height = 20
      Align = alTop
      Color1 = 14543069
      Color2 = 15856113
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      Frames = [frTop]
      ParentBackground = False
      Style = vgSimple
      object LabelTitleCaption: TLabel
        Left = 14
        Top = 4
        Width = 24
        Height = 13
        Caption = 'Title'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelLastPlayed: TLabel
        Left = 910
        Top = 4
        Width = 65
        Height = 13
        Caption = 'Last Played'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelTotalPlaytime: TLabel
        Left = 1034
        Top = 4
        Width = 81
        Height = 13
        Caption = 'Total Playtime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelSoftwareNameCaption: TLabel
        Left = 730
        Top = 4
        Width = 88
        Height = 13
        Caption = 'Software Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelGameNameCaption: TLabel
        Left = 591
        Top = 4
        Width = 71
        Height = 13
        Caption = 'Game Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        Transparent = True
      end
    end
  end
  object PanelSystems: TPanelEx
    Left = 0
    Top = 0
    Width = 1178
    Height = 345
    Align = alTop
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelSystemTitle: TShadowLabel
      Left = 0
      Top = 329
      Width = 1178
      Height = 16
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
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
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 329
      Width = 51
      Height = 16
      Caption = 'ARCADE'
      Color = 16448250
      Constraints.MaxHeight = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
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
      Top = 0
      Width = 1178
      Height = 328
      BorderStyle = bsNone
      CellSizes.Icon.Height = 82
      CellSizes.Icon.Width = 62
      CellSizes.Tile.Width = 145
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
      GroupFont.Name = 'Trebuchet MS'
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
      Header.Font.Name = 'Trebuchet MS'
      Header.Font.Style = []
      Header.Height = 26
      Header.Visible = True
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      ImagesLarge = IL_Systems
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      ParentFont = False
      ShowThemedBorder = False
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      OnItemPaintText = SystemsItemPaintText
      OnItemSelectionChanged = SystemsItemSelectionChanged
    end
  end
  object PanelBottomButtons: TPanelEx
    Left = 0
    Top = 925
    Width = 1178
    Height = 42
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = 14540253
    Color4 = 14671839
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonSelectGame: TBitBtn
      Left = 420
      Top = 8
      Width = 89
      Height = 25
      Hint = 
        'Select current game in main games list'#13#10'(ENTER key or mouse doub' +
        'le-click shortcuts)'
      Caption = 'Select Game'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonSelectGameClick
    end
    object ButtonClose: TBitBtn
      Left = 668
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close this dialog'
      Caption = 'Close'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonSelectGameExit: TBitBtn
      Tag = 1
      Left = 524
      Top = 8
      Width = 125
      Height = 25
      Hint = 'Select current game in main games list and close this dialog'
      Caption = 'Select Game and Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonSelectGameClick
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 152
    Top = 272
  end
  object PopupLastPlayed: TBcBarPopupMenu
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
    OnMeasureMenuItem = PopupLastPlayedMeasureMenuItem
    Left = 48
    Top = 432
    object PopupDetailsView: TMenuItem
      AutoCheck = True
      Caption = 'Details View'
      Checked = True
      RadioItem = True
      OnClick = PopupDetailsViewClick
    end
    object PopupTilesView: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Tiles View'
      RadioItem = True
      OnClick = PopupDetailsViewClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
end
