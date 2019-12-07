object FormImagesManager: TFormImagesManager
  Left = 1112
  Top = 552
  Width = 931
  Height = 550
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'MAME Images Manager (Unzipped Images Only!)'
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
    Height = 457
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
    Height = 457
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Report.Height = 28
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
    GroupFont.Style = [fsBold]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000100010E010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000155000000FFFFFF1F000100000001000000040000004E00
      61006D006500000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001550000
      00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
      6600000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010300000000000196000000FFFFFF
      1F0001000000010000000D00000053006F006600740077006100720065002000
      4C00690073007400000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE000600000080080001010001040000000000015A
      000000FFFFFF1F0001000000010000000B000000440072006900760065007200
      20004E0061006D00650000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001050000000000
      0155000000FFFFFF1F0001000000010000000D00000044007200690076006500
      72002000530074006100740075007300000000000000000000000000}
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
    ImagesGroup = IL_ImageCategory
    ImagesSmall = FormMain.IL_StandardIconsStandard
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
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    CustomCheckRadioEnabled = False
    OnColumnClick = MissingImagesListColumnClick
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
    Height = 457
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinWidth = 305
    TabOrder = 1
    object SplitterNotUsed: TSplitterEx
      Left = 0
      Top = 250
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
      Top = 257
      Width = 305
      Height = 200
      Align = alBottom
      Bitmap.ResamplerClassName = 'TKernelResampler'
      Bitmap.Resampler.KernelClassName = 'TCosineKernel'
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
      Height = 250
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
      GroupFont.Style = [fsBold]
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
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 1
      View = elsTile
      CustomCheckRadioEnabled = False
      OnDblClick = NotUsedImagesListDblClick
      OnItemPaintText = NotUsedImagesListItemPaintText
      OnItemSelectionChanged = NotUsedImagesListItemSelectionChanged
      OnKeyAction = NotUsedImagesListKeyAction
    end
    object PanelRenameFile: TPanelEx
      Left = 10
      Top = 28
      Width = 290
      Height = 101
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
      object RenameFileIconFrame: TBevelEx
        Left = 7
        Top = 7
        Width = 50
        Height = 50
        Style = bsCustomColors
        CustomColor1 = clGray
        CustomColor2 = clGray
      end
      object RenameFileIcon: TImage
        Left = 8
        Top = 8
        Width = 48
        Height = 48
        IncrementalDisplay = True
        Transparent = True
      end
      object RenameFileTitleLabel: TShadowLabel
        Left = 65
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
        Left = 65
        Top = 42
        Width = 214
        Height = 16
        AutoSize = False
        Caption = 'My Current Image FileName.png'
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
        Top = 66
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
        Top = 65
        Width = 43
        Height = 25
        Caption = 'Ok'
        TabOrder = 1
        OnClick = RenameFileButtonOkClick
      end
      object RenameFileButtonAbort: TBitBtnEx
        Left = 237
        Top = 65
        Width = 43
        Height = 25
        Caption = 'Abort'
        TabOrder = 2
        OnClick = RenameFileButtonOkClick
      end
    end
  end
  object PanelToolBarButtons: TPanelEx
    Left = 0
    Top = 0
    Width = 915
    Height = 31
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
    object ImageCategoryIcon: TImage
      Left = 2
      Top = 3
      Width = 24
      Height = 24
      OnClick = ImageCategorySelectLabelClick
    end
    object ImageCategorySelectLabel: TShadowLabel
      Tag = 1
      Left = 30
      Top = 3
      Width = 100
      Height = 24
      Hint = 'Click here to select an image category'
      AutoSize = False
      Caption = 'Game Snapshot'
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
      OnClick = ImageCategorySelectLabelClick
    end
    object ButtonScanMissing: TBitBtnEx
      Left = 135
      Top = 2
      Width = 124
      Height = 26
      Hint = 'Click here to scan games with missing  images'
      Caption = 'Scan Missing Images'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonScanMissingClick
    end
    object ButtonScanInvalidImages: TBitBtnEx
      Left = 441
      Top = 2
      Width = 118
      Height = 26
      Hint = 'Click here to scan unknown image filenames, not used by any game'
      Caption = 'Scan Invalid Images'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonScanInvalidImagesClick
    end
    object ButtonHelp: TBitBtnEx
      Left = 565
      Top = 2
      Width = 38
      Height = 26
      Hint = 'How do I use this thing ? :)'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonHelpClick
    end
    object ButtonScanNotUsedImages: TBitBtnEx
      Left = 263
      Top = 2
      Width = 174
      Height = 26
      Hint = 'Click here to search available images for missing games'
      Caption = 'Scan Images of Missing Games'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonScanNotUsedImagesClick
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 488
    Width = 915
    Height = 24
    Align = alBottom
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgWindowsTheme
    object LabelTotalItemsMissing: TShadowLabel
      Left = 4
      Top = 1
      Width = 85
      Height = 22
      Caption = 'Missing Images'
      Constraints.MinHeight = 22
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Layout = tlCenter
    end
    object ButtonNotUsedImagesDeleteFiles: TSpeedButtonEx
      Left = 162
      Top = 1
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
      OnClick = ButtonNotUsedImagesDeleteFilesClick
    end
    object LabelTotalItemsNotUsed: TShadowLabel
      Left = 614
      Top = 0
      Width = 79
      Height = 23
      Caption = 'Invalid Images'
      Constraints.MinHeight = 23
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Layout = tlCenter
    end
    object ButtonInvalidImagesDeleteFiles: TSpeedButtonEx
      Left = 772
      Top = 0
      Width = 137
      Height = 22
      Caption = 'Delete Invalid Images'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonInvalidImagesDeleteFilesClick
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
      Hint = 'Scan Settings'
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
    object PopupScanArcadeMachines: TMenuItem
      AutoCheck = True
      Caption = 'Scan Arcade Games'
      Checked = True
    end
    object PopupScanSoftwareListGames: TMenuItem
      AutoCheck = True
      Caption = 'Scan Software List Games'
    end
    object PopupScanNonArcadeMachines: TMenuItem
      AutoCheck = True
      Caption = 'Scan Non-Arcade Machines'
      Checked = True
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
    object N5: TMenuItem
      Caption = '-'
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
    Top = 168
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
    Top = 168
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
