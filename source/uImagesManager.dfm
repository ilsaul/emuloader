object FormImagesManager: TFormImagesManager
  Left = 479
  Top = 244
  Width = 931
  Height = 550
  Caption = 'Images Manager'
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object SplitterList: TSplitterEx
    Left = 604
    Top = 31
    Width = 6
    Height = 456
    Align = alRight
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
  object MissingImagesList: TEasyListview
    Left = 0
    Top = 31
    Width = 604
    Height = 456
    Align = alClient
    BorderStyle = bsNone
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
    GroupFont.Style = [fsBold, fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000009000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000100010E010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000164000000FFFFFF1F000100000001000000040000004E00
      61006D006500000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001640000
      00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
      6600000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010300000000000169000000FFFFFF
      1F0001000000010000000B00000044007200690076006500720020004E006100
      6D006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE000600000080080001010001040000000000011B000000FF
      FFFF1F0001000000010000000300000044007200760000000000000000000000
      0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
      080001010001050000000000011B000000FFFFFF1F0001000000010000000300
      000045006D007500000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE000600000080080001010001060000000000011B
      000000FFFFFF1F0001000000010000000300000043006C007200000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      00000080080001010001070000000000011B000000FFFFFF1F00010000000100
      00000300000053006E0064000000000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000108000000
      0000011B000000FFFFFF1F000100000001000000030000004700720070000000
      00000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Consolas'
    Header.Font.Style = []
    Header.Height = 22
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1300
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = IL_ImageCategory
    ImagesSmall = FormMain.IL_StandardIconsSmall
    ImagesExLarge = FormMain.IL_StandardIconsExtraLarge
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ImageIndent = 20
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.TileDetailCount = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMissingImages
    ShowGroupMargins = True
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.Gradient = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    OnColumnClick = MissingImagesListColumnClick
    OnColumnPaintText = MissingImagesListColumnPaintText
    OnColumnSizeChanged = MissingImagesListColumnSizeChanged
    OnColumnSizeChanging = MissingImagesListColumnSizeChanging
    OnDblClick = MissingImagesListDblClick
    OnItemCompare = MissingImagesListItemCompare
    OnItemPaintText = MissingImagesListItemPaintText
    OnItemSelectionChanged = MissingImagesListItemSelectionChanged
    OnKeyAction = MissingImagesListKeyAction
  end
  object PanelNotUsed: TPanel
    Left = 610
    Top = 31
    Width = 305
    Height = 456
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinWidth = 305
    TabOrder = 1
    object SplitterNotUsed: TSplitterEx
      Left = 0
      Top = 249
      Width = 305
      Height = 7
      Cursor = crVSplit
      Align = alBottom
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
    object ImagePreview: TImage32
      Left = 0
      Top = 256
      Width = 305
      Height = 200
      Align = alBottom
      Bitmap.ResamplerClassName = 'TKernelResampler'
      Bitmap.Resampler.KernelClassName = 'THermiteKernel'
      Bitmap.Resampler.KernelMode = kmDynamic
      Bitmap.Resampler.TableSize = 32
      BitmapAlign = baCenter
      Color = clBlack
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smResize
      TabOrder = 0
      OnClick = ImagePreviewClick
    end
    object NotUsedImagesList: TEasyListview
      Left = 0
      Top = 0
      Width = 305
      Height = 249
      Align = alClient
      BorderStyle = bsNone
      CellSizes.Tile.Width = 288
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clWindowText
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000000018F010000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Visible = True
      ImagesGroup = IL_ImageCategory
      ImagesExLarge = IL_NotUsedImages
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandColor = clGray
      PaintInfoGroup.BandColorFade = 16448250
      PaintInfoGroup.BandIndent = 28
      PaintInfoGroup.BandLength = 278
      PaintInfoGroup.BandThickness = 1
      PaintInfoGroup.CaptionIndent = 9
      PaintInfoGroup.ExpandImageIndent = 6
      PaintInfoGroup.ImageIndent = 11
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.TileDetailCount = 3
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupNotUsedIcons
      ShowGroupMargins = True
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.Gradient = True
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 1
      View = elsTile
      OnDblClick = NotUsedImagesListDblClick
      OnItemPaintText = NotUsedImagesListItemPaintText
      OnItemSelectionChanged = NotUsedImagesListItemSelectionChanged
      OnKeyAction = NotUsedImagesListKeyAction
    end
  end
  object BottomBar: TCoolBar
    Left = 0
    Top = 487
    Width = 915
    Height = 25
    Align = alBottom
    BandBorderStyle = bsNone
    BandMaximize = bmNone
    Bands = <>
    EdgeBorders = [ebTop]
    FixedOrder = True
    object LabelTotalItemsMissing: TLabel
      Left = 2
      Top = 0
      Width = 130
      Height = 23
      Hint = ' %u Missing Images'
      Caption = ' 000000 Missing Images'
      Constraints.MinHeight = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object LabelTotalItemsNotUsed: TLabel
      Left = 610
      Top = 0
      Width = 136
      Height = 23
      Caption = ' 000000 not Used Images'
      Constraints.MinHeight = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object ButtonNotUsedDeleteFiles: TSpeedButton
      Left = 768
      Top = 0
      Width = 145
      Height = 22
      Caption = 'Delete Not Used Images'
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
  object PanelToolBarButtons: TPanelEx
    Left = 0
    Top = 0
    Width = 915
    Height = 31
    Align = alTop
    Color1 = 16448250
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 1
      Top = 3
      Width = 24
      Height = 24
    end
    object ImageCategoryIcon: TImage
      Left = 381
      Top = 3
      Width = 24
      Height = 24
    end
    object ButtonSystem: TBitBtn
      Tag = 1
      Left = 27
      Top = 2
      Width = 345
      Height = 26
      Hint = 'Click here to select a system'
      Caption = 'HBMAME: HomeBrew Multiple Arcade Machine Emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonSystemClick
    end
    object ButtonImageCategory: TBitBtn
      Tag = 1
      Left = 407
      Top = 2
      Width = 140
      Height = 26
      Hint = 'Click here to select a image category'
      Caption = 'Control Panel Layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonImageCategoryClick
    end
    object ButtonScanBoth: TBitBtn
      Left = 560
      Top = 2
      Width = 65
      Height = 26
      Hint = 'Click here to scan missing and not used images'
      Caption = 'Scan Both'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonScanBothClick
    end
    object ButtonScanMissing: TBitBtn
      Left = 631
      Top = 2
      Width = 90
      Height = 26
      Hint = 'Click here to scan games with missing  images'
      Caption = 'Scan Missing'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonScanMissingClick
    end
    object ButtonScanNotUsed: TBitBtn
      Left = 727
      Top = 2
      Width = 90
      Height = 26
      Hint = 'Click here to scan not used images'
      Caption = 'Scan Not Used'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ButtonScanNotUsedClick
    end
    object ButtonHelp: TBitBtn
      Left = 830
      Top = 2
      Width = 38
      Height = 26
      Hint = 'How do I use this thing ? :)'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonHelpClick
    end
    object ButtonExit: TBitBtn
      Left = 874
      Top = 2
      Width = 38
      Height = 26
      Hint = 'Close this window'
      Caption = 'Exit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonExitClick
    end
  end
  object IL_Buttons: TImageList
    Height = 24
    Width = 24
    Left = 352
    Top = 224
  end
  object IL_SystemsImages: TImageList
    Height = 48
    Width = 48
    Left = 312
    Top = 224
  end
  object PopupMissingImages: TBcBarPopupMenu
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
    OnMeasureMenuItem = PopupMissingImagesMeasureMenuItem
    Left = 24
    Top = 136
    object PopupPlayGame: TMenuItem
      Caption = 'Play'
      ImageIndex = 18
      ShortCut = 13
      OnClick = PopupPlayGameClick
    end
    object N2: TMenuItem
      Caption = '-'
      Hint = 'Scan settings'
    end
    object PopupSearchCloneImages: TMenuItem
      AutoCheck = True
      Caption = 'Search Clone Images'
    end
    object PopupScanMissingGames: TMenuItem
      AutoCheck = True
      Caption = 'Scan Missing Games'
    end
    object PopupScanBiosGames: TMenuItem
      AutoCheck = True
      Caption = 'Scan Bios Sets'
    end
    object PopupScanDeviceSets: TMenuItem
      AutoCheck = True
      Caption = 'Scan Device Sets'
    end
    object PopupScanDevicesWithNoROMs: TMenuItem
      AutoCheck = True
      Caption = 'Scan Devices With No ROMs'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupMissingRemoveSelected: TMenuItem
      Caption = 'Remove Selected'
      ShortCut = 46
      OnClick = PopupMissingRemoveSelectedClick
    end
    object PopupMissingClearList: TMenuItem
      Caption = 'Clear Games List'
      OnClick = PopupMissingClearListClick
    end
    object PopupViewMode: TMenuItem
      Caption = '-'
      Hint = 'View mode'
    end
    object PopupViewDetailsSmallIcons: TMenuItem
      AutoCheck = True
      Caption = 'Details View (16x16)'
      Checked = True
      RadioItem = True
      OnClick = PopupViewDetailsSmallIconsClick
    end
    object PopupViewDetailsLargeIcons: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Details View (32x32)'
      RadioItem = True
      OnClick = PopupViewDetailsSmallIconsClick
    end
    object PopupViewTiles: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Tiles View (48x48)'
      RadioItem = True
      OnClick = PopupViewDetailsSmallIconsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PopupGamesFilter: TMenuItem
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
    end
    object PopupMissingSaveToFile: TMenuItem
      Caption = 'Save Games List To File'
      OnClick = PopupMissingSaveToFileClick
    end
    object PopupRestoreColumnsSizes: TMenuItem
      Caption = 'Restore Columns Sizes'
      OnClick = PopupRestoreColumnsSizesClick
    end
  end
  object IL_NotUsedImages: TImageList
    Height = 48
    Width = 48
    Left = 856
    Top = 144
  end
  object PopupNotUsedIcons: TBcBarPopupMenu
    AutoHotkeys = maManual
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
    OnMeasureMenuItem = PopupMissingImagesMeasureMenuItem
    Left = 824
    Top = 144
    object PopupNotUsedViewFullScreen: TMenuItem
      Caption = 'View with Associated App'
      ShortCut = 13
      OnClick = PopupNotUsedViewFullScreenClick
    end
    object PopupNotUsedRenameFile: TMenuItem
      Caption = 'Rename File'
      ShortCut = 113
      OnClick = PopupNotUsedRenameFileClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object PopupNotUsedUpdateIconInfoSelectedIcons: TMenuItem
      Caption = 'Update Selected Image Info'
      OnClick = PopupNotUsedUpdateIconInfoSelectedIconsClick
    end
    object PopupNotUsedUpdateIconInfoAllIcons: TMenuItem
      Tag = 1
      Caption = 'Update All Images Info'
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
      Caption = 'Remove Renamed Images'
      Visible = False
      OnClick = PopupNotUsedRemoveRenamedIconsClick
    end
    object PopupMoveSelectedToFolder: TMenuItem
      Caption = 'Move Selected to Folder'
      OnClick = PopupMoveSelectedToFolderClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PopupNotUsedSaveIconsListToFile: TMenuItem
      Caption = 'Save List To File'
      OnClick = PopupNotUsedSaveIconsListToFileClick
    end
  end
  object IL_ImageCategory: TImageList
    Left = 392
    Top = 224
  end
end
