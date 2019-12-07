object FormArcadeMAMu_IconsManager: TFormArcadeMAMu_IconsManager
  Left = 702
  Top = 326
  Width = 790
  Height = 550
  Caption = 'MAMu_ Icons Manager (MAME and Arcade Only)'
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000004344
    45005D799800595B5E004F5F6D0155738F0272747528494C4EA7454B4DB96A6C
    6D5475808B075D666F019BA6B10053677B000000000000000000000000002E51
    6100F6CEB20000202C01F1F7FF0574624848374C65C95B8EC4F96FAFE7FB3253
    6AE354484D3A7CC5FE0200000001FFFFFF00354C580000000000000000006C56
    48002A5681006F60580F323D44824F7C9FE27AB6F1FC9EDAFFFD99D4FFFDACF3
    FFFB6EA0CFCD58483C43AFCCEC044A4238008AD1FF0000000000000000004E7B
    930079737800203B4558496F91F5BCB1AEFBC8C1BBFDA69E95FE8D8A81FE394A
    56FD8EC4FEFB608FBADE2213003CC5FFFF014A40350000000000000000001540
    6100FFFFFF0000000C676B8AAFFBFFFFFFFCFFFFFFFEACA8A2FEFFFFFFFE998A
    7AFEF8E7D4FC526D89FB3D678ABBBC95700F70C0FF0000000000000000005363
    6600C7C6CF01434A40634D739DFBD1C6BDFD81898BFE565857FF8A8C8CFF3D43
    41FEE1DAD6FDFFF6E6FC245989DEA9997E1D26589100FFFFFF0000000000393A
    34007198B501120D003D194C72F0FFFFFFFDFFFFFFFEFFFFFFFFFFFFFFFFC6C7
    C6FEFFFFFFFD62676CFC4C7FB2D79D795D197CC1FF010C354C00000000000000
    0000ECFFFF030000007516466DF5747C86FD708FADFE33557AFF1B334DFF8293
    A2FFF2EFEEFD0E1C23FD649ADCC3A27C530D6DCAFF01F0CEB000000000006EB7
    F8009C97A4071D2E41B27EBEFFFC87ACC1FD757F8EFE1F5071FF2C577EFF578B
    B4FF4C7DB5FE6C9ECAFD2F4B61EC10100A6EFEFFFF031B2F3B00000000006574
    87005984A101585E5D602E4C61F04E5C5CFD0D0000FE4A7390FF588CB6FF0000
    00FF2D3B4EFEBFFFFFFD4A7098FC000B079DEFF2FD042659720000000000E3DE
    DA0000000001FFFFFF0E000000C0000000FD1F3851FD5B7AA2FF3C5568FF0000
    00FF000000FE2D3F59FD1E2D39E57F624837185EAC014E351F000000000086CC
    FF0000000001DAD8D7131E3138CC000000FC000000FD041111FE2E404EFF293B
    50FF283945FD000000FD102429EAE8FFFE3000000001FFFFFF0000000000ECCE
    B000195A9600C6C8A717204562D4A4E9FFFC5F83A6FD000000FE96CCFFFEABF2
    FFFEC0FFFFFE86BEF7FC000000F2A69E9747001F4300ABAAA400000000000000
    000005476400D4BDB616051821CA1F3D49FB658DB2FC6891BAFE5D83A6FE6994
    B9FE50708FFC2E485AFC2F393DBA80888A100E1A210076767600000000000000
    00003A535D006F797E0246585F3A384F58D32D464DF72E4C54FD26464FFE2745
    4CFE213639FB23353CD24B50526A7F878A02363E400068777900000000000000
    00002948500083898D006A7B80037F888B3061767C62415E62C74C737CE54463
    6AD7303F42BA50535434545A5C0453555500747577007878780000000000E01F
    FFFFC00FFFFFC00FFFFFC007FFFFC007FFFF8007FFFF8003FFFF8003FFFF8003
    FFFF8003FFFF8003FFFF8003FFFFC007FFFFC007FFFFC007FFFFE00FFFFF}
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object SplitterList: TSplitterEx
    Left = 462
    Top = 47
    Width = 7
    Height = 465
    Align = alRight
    ResizeStyle = rsUpdate
    OnMoved = SplitterListMoved
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
  object PanelNotUsedIcons: TPanel
    Left = 469
    Top = 47
    Width = 305
    Height = 465
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinWidth = 305
    TabOrder = 0
    object SplitterIconHistory: TSplitterEx
      Left = 0
      Top = 320
      Width = 305
      Height = 7
      Cursor = crVSplit
      Align = alTop
      ResizeStyle = rsUpdate
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
    object NotUsedIconsList: TEasyListview
      Left = 0
      Top = 0
      Width = 305
      Height = 320
      Align = alTop
      BorderStyle = bsNone
      CellSizes.Tile.Width = 288
      Color = clWhite
      Constraints.MinHeight = 320
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
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
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000000010E010000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1300
      IncrementalSearch.StartType = eissFocusedNode
      ImagesExLarge = IL_NotUsedIcons
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.TileDetailCount = 3
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupNotUsedIcons
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsTile
      CustomCheckRadioEnabled = False
      OnItemCompare = NotUsedIconsListItemCompare
      OnItemFreeing = NotUsedIconsListItemFreeing
      OnItemPaintText = NotUsedIconsListItemPaintText
      OnItemSelectionChanged = NotUsedIconsListItemSelectionChanged
      OnKeyAction = NotUsedIconsListKeyAction
    end
    object NotUsedIconHistory: TRichEditURL
      Left = 0
      Top = 349
      Width = 305
      Height = 116
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Color = 15856113
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WantReturns = False
      WordWrap = False
    end
    object PanelNotUsedIconHistory: TPanelEx
      Left = 0
      Top = 327
      Width = 305
      Height = 22
      Align = alTop
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgWindowsTheme
      object LabelFileHistory: TShadowLabel
        Left = 2
        Top = 4
        Width = 62
        Height = 16
        Caption = 'File History'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ButtonClearHistoryNotUsed: TSpeedButtonEx
        Left = 66
        Top = 0
        Width = 47
        Height = 22
        Hint = 'Clear history for the selected icon'
        Caption = 'Clear'
        Flat = True
        OnClick = ButtonClearHistoryNotUsedClick
      end
      object ButtonNotUsedDeleteFiles: TSpeedButtonEx
        Left = 170
        Top = 0
        Width = 135
        Height = 22
        Caption = 'Delete Not Used Icons'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = ButtonNotUsedDeleteFilesClick
      end
    end
    object PanelRenameFile: TPanelEx
      Left = 10
      Top = 28
      Width = 290
      Height = 83
      Color1 = clWhite
      Color2 = clGray
      Color3 = 7891291
      Color4 = 16750899
      ColorFrame = clSilver
      ColorInnerFrame = 7891291
      EnableCustomBorder = ecbDouble
      Frames = []
      ParentBackground = False
      Style = vgSimple
      Visible = False
      object RenameFileIcon: TImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        IncrementalDisplay = True
        Transparent = True
      end
      object RenameFileTitleLabel: TShadowLabel
        Left = 47
        Top = 4
        Width = 92
        Height = 17
        Caption = 'Rename File'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object RenameFileOldFileName: TShadowLabel
        Left = 47
        Top = 25
        Width = 232
        Height = 16
        AutoSize = False
        Caption = 'My Current FileName.ico'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object RenameFileNewFileName: TEditEx
        Left = 8
        Top = 48
        Width = 181
        Height = 23
        AutoSize = False
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = RenameFileNewFileNameKeyPress
      end
      object RenameFileButtonOk: TBitBtnEx
        Tag = 1
        Left = 193
        Top = 47
        Width = 43
        Height = 25
        Caption = 'Ok'
        TabOrder = 1
        OnClick = RenameFileButtonOkClick
      end
      object RenameFileButtonAbort: TBitBtnEx
        Left = 237
        Top = 47
        Width = 43
        Height = 25
        Caption = 'Abort'
        TabOrder = 2
        OnClick = RenameFileButtonOkClick
      end
    end
  end
  object MissingIconsList: TEasyListview
    Left = 0
    Top = 47
    Width = 462
    Height = 465
    HelpContext = -1
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Tile.Width = 260
    CellSizes.Report.Height = 20
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_GroupedMode
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -13
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000009000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000001000190010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000164000000FFFFFF1F000100000001000000040000004E00
      61006D006500000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001640000
      00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
      6600000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010300000000000164000000FFFFFF
      1F00010000000100000009000000420069006F00730020004E0061006D006500
      000000000000000000000000110000005445617379436F6C756D6E53746F7265
      64FFFECE0006000000800800010100010400000000000169000000FFFFFF1F00
      01000000010000000B00000044007200690076006500720020004E0061006D00
      6500000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE000600000080080001010001050000000000015A000000FFFFFF
      1F0001000000010000000D000000440072006900760065007200200053007400
      6100740075007300000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE00060000008008000101000106000000000001B4
      000000FFFFFF1F0001000000010000000C0000004D0061006E00750066006100
      6300740075007200650072000000000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000107000000
      0000015A000000FFFFFF1F0001000000010000000D0000005600650072007300
      69006F006E002000410064006400650064000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      0001080000000000014B000000FFFFFF1F0001000000010000000A0000004D00
      65006300680061006E006900630061006C00000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1300
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = IL_MissingIcons
    ImagesExLarge = IL_MissingIcons
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.TileDetailCount = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMissingIcons
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsReport
    CustomCheckRadioEnabled = False
    OnColumnClick = MissingIconsListColumnClick
    OnColumnSizeChanged = MissingIconsListColumnSizeChanged
    OnColumnSizeChanging = MissingIconsListColumnSizeChanging
    OnDblClick = MissingIconsListDblClick
    OnItemCompare = MissingIconsListItemCompare
    OnItemPaintText = MissingIconsListItemPaintText
    OnItemSelectionChanged = MissingIconsListItemSelectionChanged
    OnKeyAction = MissingIconsListKeyAction
  end
  object PanelButtons: TPanelEx
    Left = 0
    Top = 0
    Width = 774
    Height = 47
    Align = alTop
    AutoSize = True
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgVista
    object PanelToolBarButtons: TPanelEx
      Left = 0
      Top = 0
      Width = 774
      Height = 47
      Align = alTop
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgWindowsTheme
      object SystemIcon: TImage
        Left = 325
        Top = 2
        Width = 24
        Height = 24
        OnClick = SystemSelectLabelClick
      end
      object SystemSelectLabel: TShadowLabel
        Tag = 1
        Left = 352
        Top = 2
        Width = 270
        Height = 24
        Hint = 'Click here to select a system'
        AutoSize = False
        Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        Layout = tlCenter
        OnClick = SystemSelectLabelClick
      end
      object OptionsMissingGameIconsButton: TSpeedButtonEx
        Left = 2
        Top = 2
        Width = 22
        Height = 24
        Hint = 'Click here to set options for the missing game icons list'
        Flat = True
        ImageIndex = 7
        Images = FormMain.IL_MenuPopup
        ParentShowHint = False
        ShowHint = True
        OnClick = OptionsMissingGameIconsButtonClick
      end
      object LabelTotalItemsNotUsed: TShadowLabel
        Left = 469
        Top = 29
        Width = 83
        Height = 16
        Caption = 'Not Used Icons'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        Layout = tlCenter
      end
      object LabelTotalItemsMissing: TShadowLabel
        Left = 2
        Top = 29
        Width = 109
        Height = 16
        Caption = 'Missing Game Icons'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        Layout = tlCenter
      end
      object ButtonScanBoth: TBitBtnEx
        Left = 30
        Top = 2
        Width = 65
        Height = 25
        Hint = 'Click here to scan missing and not used icons'
        Caption = 'Scan Both'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonScanBothClick
      end
      object ButtonScanMissing: TBitBtnEx
        Left = 97
        Top = 2
        Width = 90
        Height = 25
        Hint = 'Click here to scan games with missing icons'
        Caption = 'Scan Missing'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonScanMissingClick
      end
      object ButtonScanNotUsed: TBitBtnEx
        Left = 189
        Top = 2
        Width = 90
        Height = 25
        Hint = 'Click here to scan not used icons'
        Caption = 'Scan Not Used'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ButtonScanNotUsedClick
      end
      object ButtonHelp: TBitBtnEx
        Left = 280
        Top = 2
        Width = 38
        Height = 25
        Hint = 'How do I use this thing ? :)'
        Caption = 'Help'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonHelpClick
      end
    end
  end
  object IL_MissingIcons: TImageList
    Left = 16
    Top = 96
  end
  object IL_NotUsedIcons: TImageList
    Height = 32
    Width = 32
    Left = 648
    Top = 176
  end
  object PopupMissingIcons: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    OnPopup = PopupMissingIconsPopup
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
    MenuFont.Color = clWindowText
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupMissingIconsMeasureMenuItem
    Left = 16
    Top = 128
    object PopupRunGame: TMenuItem
      Caption = 'Play'
      ImageIndex = 18
      ShortCut = 13
      OnClick = PopupRunGameClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupMissingRemoveSelected: TMenuItem
      Caption = 'Remove Selected'
      ShortCut = 46
      OnClick = PopupMissingRemoveSelectedClick
    end
    object PopupClearGamesList: TMenuItem
      Caption = 'Clear Games List'
      OnClick = PopupClearGamesListClick
    end
    object PopupReloadIcons: TMenuItem
      Caption = 'Reload All Icons'
      ImageIndex = 15
      OnClick = PopupReloadIconsClick
    end
    object N2: TMenuItem
      Caption = '-'
      Hint = 'Icon Editor'
    end
    object PopupCreateEditIcon: TMenuItem
      Caption = 'Create / Edit'
      Hint = 'Create / Edit'
      ShortCut = 114
      OnClick = PopupCreateEditIconClick
    end
    object PopupCreateBiosEditIcon: TMenuItem
      Tag = 1
      Caption = 'Create / Edit Bios'
      Hint = 'Create / Edit Bios'
      ShortCut = 115
      OnClick = PopupCreateEditIconClick
    end
    object PopupCreateDriverEditIcon: TMenuItem
      Tag = 2
      Caption = 'Create / Edit Driver'
      Hint = 'Create / Edit Driver'
      ShortCut = 116
      OnClick = PopupCreateEditIconClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PopupReloadIconsSelectedGames: TMenuItem
      Caption = 'Reload Icons (Selected Games)'
      Enabled = False
      Visible = False
      OnClick = PopupReloadIconsSelectedGamesClick
    end
    object N5: TMenuItem
      Caption = '-'
      Hint = 'Internet required'
    end
    object PopupMissSearchforGameTitle: TMenuItem
      Caption = 'Search for Game Title'
      OnClick = PopupMissSearchforGameTitleClick
    end
    object PopupMissSearchforManufacturer: TMenuItem
      Tag = 1
      Caption = 'Search for Manufacturer'
      OnClick = PopupMissSearchforGameTitleClick
    end
    object PopupMissSearchforTitleManufacturer: TMenuItem
      Tag = 2
      Caption = 'Search for Manufacturer+Title'
      OnClick = PopupMissSearchforGameTitleClick
    end
    object N9: TMenuItem
      Caption = '-'
      Hint = '"Not Working" Icons'
    end
    object PopupUpdateNotWorkingIconGames: TMenuItem
      Tag = 2
      Caption = 'Update "Not Working" Icon Games'
      OnClick = PopupCopyIconZZZtoSelectedGamesClick
    end
    object PopupUpdateNotWorkingIconGamesHelp: TMenuItem
      Caption = 'About / How to Use'
      ImageIndex = 10
      OnClick = PopupUpdateNotWorkingIconGamesHelpClick
    end
    object PopupCopyIconZZZtoSelectedGames: TMenuItem
      Tag = 1
      Caption = 'Copy "zzz.ico" to  Selected Games'
      OnClick = PopupCopyIconZZZtoSelectedGamesClick
    end
  end
  object PopupNotUsedIcons: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
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
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupMissingIconsMeasureMenuItem
    Left = 648
    Top = 208
    object PopupEditIcon: TMenuItem
      Caption = 'Edit With Associated Editor'
      ShortCut = 13
      OnClick = PopupEditIconClick
    end
    object PopupNotUsedRenameFile: TMenuItem
      Caption = 'Rename File'
      ShortCut = 113
      OnClick = PopupNotUsedRenameFileClick
    end
    object PopupNotUsedClearFileHistory: TMenuItem
      Caption = 'Clear File History'
      OnClick = PopupNotUsedClearFileHistoryClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object PopupNotUsedUpdateIconInfoSelectedIcons: TMenuItem
      Caption = 'Update Selected Icon Info'
      OnClick = PopupNotUsedUpdateIconInfoSelectedIconsClick
    end
    object PopupNotUsedUpdateIconInfoAllIcons: TMenuItem
      Tag = 1
      Caption = 'Update All Icons Info'
      OnClick = PopupNotUsedUpdateIconInfoSelectedIconsClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object PopupNotUsedClearFilesList: TMenuItem
      Caption = 'Clear Files List'
      OnClick = PopupNotUsedClearFilesListClick
    end
    object PopupNotUsedRemoveSelected: TMenuItem
      Caption = 'Remove Selected'
      ShortCut = 46
      OnClick = PopupNotUsedRemoveSelectedClick
    end
    object PopupNotUsedRemoveRenamedIcons: TMenuItem
      Caption = 'Remove Renamed Icons'
      OnClick = PopupNotUsedRemoveRenamedIconsClick
    end
    object PopupMoveSelectedToFolder: TMenuItem
      Caption = 'Move Selected to Folder'
      OnClick = PopupMoveSelectedToFolderClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
      Hint = 'Exclude files from scan'
    end
    object PopupAddSelectedToExcludeFilesList: TMenuItem
      Caption = 'Add Selected To Excluded List'
      Hint = 'Add Selected To Excluded List [%s]'
      OnClick = PopupAddSelectedToExcludeFilesListClick
    end
    object PopupViewExcludedList: TMenuItem
      Caption = 'View/Edit Excluded List'
      OnClick = PopupViewExcludedListClick
    end
    object PopupReloadExcludedList: TMenuItem
      Caption = 'Reload Excluded List'
      OnClick = PopupReloadExcludedListClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PopupNotUsedSaveIconsListToFile: TMenuItem
      Caption = 'Save Not Used Icons List To File'
      OnClick = PopupNotUsedSaveIconsListToFileClick
    end
    object N6: TMenuItem
      Caption = '-'
      Hint = 'Sort files'
    end
    object PopupNotUsedSortListbyFilenames: TMenuItem
      AutoCheck = True
      Caption = 'Sort List by Filenames'
      Checked = True
      RadioItem = True
      OnClick = PopupNotUsedSortListbyFilenamesClick
    end
    object PopupNotUsedSortListbyNewestDateTime: TMenuItem
      AutoCheck = True
      Caption = 'Sort List by Newest Date/Time'
      RadioItem = True
      OnClick = PopupNotUsedSortListbyFilenamesClick
    end
  end
  object PopupMissingIconsOptions: TBcBarPopupMenu
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
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupMissingIconsMeasureMenuItem
    Left = 48
    Top = 128
    object PopupSearchCloneIcons: TMenuItem
      AutoCheck = True
      Caption = 'Search Icons for Clone Games'
    end
    object PopupSearchIconsSoftwarelistGames: TMenuItem
      AutoCheck = True
      Caption = 'Search Icons for Softwarelist Games'
      Visible = False
    end
    object PopupSearchIconsDeviceSets: TMenuItem
      Caption = 'Search Icons for Device Sets'
    end
    object MenuItem12: TMenuItem
      Caption = '-'
      Hint = 'Special icons'
    end
    object PopupShowGameBiosIcons: TMenuItem
      AutoCheck = True
      Caption = 'Force Game Bios Icons'
      OnClick = PopupReloadIconsClick
    end
    object PopupShowGameDriverIcons: TMenuItem
      AutoCheck = True
      Caption = 'Force Game Driver Icons'
      OnClick = PopupReloadIconsClick
    end
    object MenuItem17: TMenuItem
      Caption = '-'
    end
    object PopupMissingIconsViewMode: TMenuItem
      Caption = 'View Mode'
      object PopupMissDetailsViewSmallIcons: TMenuItem
        AutoCheck = True
        Caption = 'Details View (16x16)'
        Checked = True
        RadioItem = True
        OnClick = PopupMissDetailsViewSmallIconsClick
      end
      object PopupMissDetailsViewLargeIcons: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Details View (32x32)'
        RadioItem = True
        OnClick = PopupMissDetailsViewSmallIconsClick
      end
      object PopupMissLargeIconsView: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Tiles View (32x32)'
        RadioItem = True
        OnClick = PopupMissDetailsViewSmallIconsClick
      end
    end
    object PopupGamesViewMode: TMenuItem
      Caption = 'Games Filter'
      object PopupShowAllGames: TMenuItem
        AutoCheck = True
        Caption = 'Show All Games'
        Checked = True
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowParentGamesOnly: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = 'Show Parent Games Only'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowCloneGamesOnly: TMenuItem
        Tag = 2
        AutoCheck = True
        Caption = 'Show Clone Games Only'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowBiosOnly: TMenuItem
        Tag = 3
        AutoCheck = True
        Caption = 'Show Bios Only'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowMechanicalOnly: TMenuItem
        Tag = 4
        AutoCheck = True
        Caption = 'Show Mechanical Only'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowDevicesOnly: TMenuItem
        Tag = 7
        AutoCheck = True
        Caption = 'Show Devices Only'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowSoftwarelistGamesOnly: TMenuItem
        Tag = 8
        AutoCheck = True
        Caption = 'Show Softwarelist Games Only'
        RadioItem = True
        Visible = False
        OnClick = PopupShowAllGamesClick
      end
      object MenuItem32: TMenuItem
        Caption = '-'
        Hint = '"Not Working" Icons'
      end
      object PopupShowAllDriverStatus: TMenuItem
        Tag = 5
        AutoCheck = True
        Caption = 'Show All Driver Status'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
      object PopupShowPreliminaryDriverStatus: TMenuItem
        Tag = 6
        AutoCheck = True
        Caption = 'Show Good/Imperfect Driver Status'
        RadioItem = True
        OnClick = PopupShowAllGamesClick
      end
    end
    object MenuItem26: TMenuItem
      Caption = '-'
    end
    object PopupSaveListToFile: TMenuItem
      Caption = 'Save Games List To File'
      OnClick = PopupSaveListToFileClick
    end
    object PopupRestoreColumnsSizes: TMenuItem
      Caption = 'Restore Columns Sizes'
      OnClick = PopupRestoreColumnsSizesClick
    end
  end
end
