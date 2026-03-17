object FormLastPlayedGamesMega4K: TFormLastPlayedGamesMega4K
  Left = 509
  Top = 453
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Last Played Games [Top 25] (4K)'
  ClientHeight = 967
  ClientWidth = 2980
  Color = clBlue
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object PanelGames: TPanelEx
    Left = 0
    Top = 345
    Width = 2980
    Height = 551
    Align = alBottom
    Color1 = 15856113
    Color2 = 15132390
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
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
        0001010000000000018C000000FFFFFF1F000100000001000000090000004700
        61006D00650020004E0061006D00650000000000000000000000000011000000
        5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
        02000000000000B4000000FFFFFF1F0001000000010000000D00000053006F00
        66007400770061007200650020004E0061006D00650000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        080001010001030000000100007D000000FFFFFF1F0001000000010000000B00
        00004C00610073007400200050006C0061007900650064000000000000000000
        00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
        00800800010100010400000000000096000000FFFFFF1F000100000001000000
        0E00000054006F00740061006C00200050006C0061007900740069006D006500
        000000000000000000000000}
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
    object PanelPlayedListHeader: TPanelEx
      Left = 0
      Top = 0
      Width = 2980
      Height = 20
      Align = alTop
      Color1 = 14543069
      Color2 = 15856113
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object LabelTitleCaption: TShadowLabel
        Left = 14
        Top = 6
        Width = 27
        Height = 14
        Caption = 'Title'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
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
      object LabelLastPlayed: TShadowLabel
        Left = 910
        Top = 6
        Width = 68
        Height = 14
        Caption = 'Last Played'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
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
      object LabelTotalPlaytime: TShadowLabel
        Left = 1034
        Top = 6
        Width = 83
        Height = 14
        Caption = 'Total Playtime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
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
      object LabelSoftwareNameCaption: TShadowLabel
        Left = 730
        Top = 6
        Width = 91
        Height = 14
        Caption = 'Software Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
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
      object LabelGameNameCaption: TShadowLabel
        Left = 591
        Top = 6
        Width = 74
        Height = 14
        Caption = 'Game Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
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
    end
  end
  object PanelSystems: TPanelEx
    Left = 0
    Top = 0
    Width = 2980
    Height = 329
    Align = alTop
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 896
    Width = 2980
    Height = 71
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = 14540253
    Color4 = 14671839
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonSelectGame: TBitBtnEx
      Left = 1199
      Top = 16
      Width = 168
      Height = 45
      Hint = 
        'Select current game in main games list'#13#10'(ENTER key or mouse doub' +
        'le-click shortcuts)'
      Caption = 'Select Game'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonClose: TBitBtnEx
      Left = 1613
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close this dialog'
      Caption = 'Close'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonSelectGameExit: TBitBtnEx
      Tag = 1
      Left = 1381
      Top = 16
      Width = 220
      Height = 45
      Hint = 'Select current game in main games list and close this dialog'
      Caption = 'Select Game and Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object PanelSystemsTitle: TPanelEx
    Left = 0
    Top = 329
    Width = 2980
    Height = 16
    Align = alTop
    Color1 = clWhite
    Color2 = 14543069
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSystemTitle: TShadowLabel
      Left = 8
      Top = 0
      Width = 1162
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
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
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 0
      Width = 48
      Height = 16
      Caption = 'ARCADE'
      Color = 16448250
      Constraints.MaxHeight = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
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
    Left = 48
    Top = 432
    object PopupDetailsView: TMenuItem
      AutoCheck = True
      Caption = 'Details View'
      Checked = True
      RadioItem = True
    end
    object PopupTilesView: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Tiles View'
      RadioItem = True
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
end
