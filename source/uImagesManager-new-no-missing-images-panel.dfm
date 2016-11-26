object FormImagesManager: TFormImagesManager
  Left = 479
  Top = 244
  Width = 684
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
  object SplitterNotUsed: TSplitterEx
    Left = 305
    Top = 31
    Width = 7
    Height = 456
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
  object BottomBar: TCoolBar
    Left = 0
    Top = 487
    Width = 668
    Height = 25
    Align = alBottom
    BandBorderStyle = bsNone
    BandMaximize = bmNone
    Bands = <>
    EdgeBorders = [ebTop]
    FixedOrder = True
    object LabelTotalItemsNotUsed: TLabel
      Left = 2
      Top = 0
      Width = 130
      Height = 23
      Caption = ' 000000 not Used Images'
      Constraints.MinHeight = 23
      Layout = tlCenter
    end
    object ButtonNotUsedDeleteFiles: TSpeedButton
      Left = 160
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
    Width = 668
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
      Tag = 1
      Left = 1
      Top = 3
      Width = 24
      Height = 24
      Hint = 'Click here to select a system'
      ParentShowHint = False
      ShowHint = True
      OnClick = SystemIconClick
    end
    object ImageCategoryIcon: TImage
      Tag = 1
      Left = 109
      Top = 3
      Width = 24
      Height = 24
      OnClick = ImageCategoryIconClick
    end
    object LabelSystemSelector: TShadowLabel
      Left = 29
      Top = 8
      Width = 69
      Height = 14
      Caption = 'SEGA Model 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = SystemIconClick
    end
    object LabelImageCategory: TShadowLabel
      Left = 138
      Top = 8
      Width = 103
      Height = 14
      Caption = 'Control Panel Layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = ImageCategoryIconClick
    end
    object ButtonScanNotUsed: TBitBtn
      Left = 252
      Top = 2
      Width = 47
      Height = 26
      Hint = 'Click here to scan not used images'
      Caption = 'Scan'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonScanNotUsedClick
    end
    object ButtonHelp: TBitBtn
      Left = 310
      Top = 2
      Width = 26
      Height = 26
      Hint = 'How do I use this thing ? :)'
      Caption = '?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonHelpClick
    end
  end
  object NotUsedImagesList: TEasyListview
    Left = 0
    Top = 31
    Width = 305
    Height = 456
    Align = alLeft
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
    TabOrder = 2
    View = elsTile
    OnDblClick = NotUsedImagesListDblClick
    OnItemPaintText = NotUsedImagesListItemPaintText
    OnItemSelectionChanged = NotUsedImagesListItemSelectionChanged
    OnKeyAction = NotUsedImagesListKeyAction
  end
  object ImagePreview: TImage32
    Left = 312
    Top = 31
    Width = 356
    Height = 456
    Align = alClient
    Bitmap.ResamplerClassName = 'TKernelResampler'
    Bitmap.Resampler.KernelClassName = 'THermiteKernel'
    Bitmap.Resampler.KernelMode = kmDynamic
    Bitmap.Resampler.TableSize = 32
    BitmapAlign = baCenter
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smResize
    TabOrder = 3
    OnClick = ImagePreviewClick
  end
  object IL_Buttons: TImageList
    Height = 24
    Width = 24
    Left = 88
    Top = 152
  end
  object IL_SystemsImages: TImageList
    Height = 48
    Width = 48
    Left = 48
    Top = 152
  end
  object IL_NotUsedImages: TImageList
    Height = 48
    Width = 48
    Left = 80
    Top = 112
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
    Left = 48
    Top = 112
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
    Left = 128
    Top = 152
  end
end
