object FormLastPlayedGames: TFormLastPlayedGames
  Left = 818
  Top = 520
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Last Played Games [Top 25]'
  ClientHeight = 966
  ClientWidth = 1178
  Color = clWhite
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelGames: TPanelEx
    Left = 0
    Top = 344
    Width = 1178
    Height = 580
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
        02000000000000B4000000FFFFFF1F0001000000010000000E00000053006F00
        66007400770061007200650020005400690074006C0065000000000000000000
        00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
        0080080001010001030000000100007D000000FFFFFF1F000100000001000000
        0B0000004C00610073007400200050006C006100790065006400000000000000
        000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
        000000800800010100010400000000000096000000FFFFFF1F00010000000100
        00000E00000054006F00740061006C00200050006C0061007900740069006D00
        6500000000000000000000000000}
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
      OnDblClick = LastPlayedListDblClick
      OnItemPaintText = LastPlayedListItemPaintText
      OnItemSelectionChanged = LastPlayedListItemSelectionChanged
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
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object LabelTitleCaption: TShadowLabel
        Left = 14
        Top = 6
        Width = 25
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
        Width = 66
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
        Width = 81
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
      object LabelSoftwareTitleCaption: TShadowLabel
        Left = 730
        Top = 6
        Width = 80
        Height = 14
        Caption = 'Software Title'
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
        Width = 72
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
  object PanelSystemsTitle: TPanelEx
    Left = 0
    Top = 328
    Width = 1178
    Height = 16
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
      Left = 314
      Top = 0
      Width = 550
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
    end
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 0
      Width = 46
      Height = 19
      Caption = 'ARCADE'
      Color = 16448250
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
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 924
    Width = 1178
    Height = 42
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
    object ButtonClose: TBitBtnEx
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
    object ButtonSelectGameExit: TBitBtnEx
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
    TabOrder = 3
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnItemImageDraw = SystemsItemImageDraw
    OnItemImageGetSize = SystemsItemImageGetSize
    OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
    OnItemPaintText = SystemsItemPaintText
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 152
    Top = 272
  end
end
