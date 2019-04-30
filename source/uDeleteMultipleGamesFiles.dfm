object FormDeleteMultipleGamesFiles: TFormDeleteMultipleGamesFiles
  Left = 853
  Top = 431
  BorderStyle = bsDialog
  Caption = 'Delete Games Files'
  ClientHeight = 525
  ClientWidth = 1230
  Color = clBlue
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
  object BottomBar: TPanelEx
    Left = 0
    Top = 475
    Width = 1230
    Height = 50
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clGray
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object DeleteGameConsoleComputerIcon: TImage
      Left = 264
      Top = 15
      Width = 24
      Height = 24
    end
    object DeleteGameFileFromDisk: TAdvOfficeCheckBox
      Left = 248
      Top = 26
      Width = 216
      Height = 18
      Hint = 
        'Allow the console/computer game file to be deleted (recycle bin ' +
        'not supported!)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = '       Delete Game File From Disk'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
    end
    object DeleteGameFromGamesList: TAdvOfficeCheckBox
      Tag = -1
      Left = 248
      Top = 9
      Width = 227
      Height = 18
      Hint = 
        'Use this option to delete the game entry from main games list (c' +
        'onsole/computer only)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = '       Delete Game From Games List'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
    end
    object FileTypesGroupBox: TAdvGroupBox
      Left = 8
      Top = 1
      Width = 231
      Height = 41
      Hint = 'Check File Types to %'
      CaptionPosition = cpTopCenter
      RoundEdges = True
      ShadowColor = clSilver
      Caption = ' Check Arcade File Types to Delete '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      TabOrder = 0
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBox
        Left = 121
        Top = 18
        Width = 107
        Height = 18
        Hint = 'Check this option to process game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlBottom
        Caption = 'CFGs/NVRAMs'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
      end
      object DeleteROMs: TAdvOfficeCheckBox
        Left = 7
        Top = 18
        Width = 55
        Height = 18
        Hint = 'Check this option to process the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlBottom
        Caption = 'ROMs'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
      end
      object DeleteCHDs: TAdvOfficeCheckBox
        Left = 66
        Top = 18
        Width = 53
        Height = 18
        Hint = 
          'Check this option to process CHD files (if supported by the game' +
          ')'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlBottom
        Caption = 'CHDs'
        ReturnIsTab = False
        ShadowColor = 14540253
        Themed = True
      end
    end
    object ButtonDeleteFiles: TBitBtnEx
      Tag = 1
      Left = 1042
      Top = 9
      Width = 89
      Height = 35
      Hint = 'Click here to process files of all games on the list'
      Caption = 'Delete Files'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonDeleteFilesClick
    end
    object ButtonNo: TBitBtnEx
      Left = 1136
      Top = 9
      Width = 89
      Height = 35
      Hint = 'Click here to cancel the operation ("Esc" hotkey)'
      Caption = 'Cancel'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonHelp: TBitBtnEx
      Tag = 1
      Left = 1002
      Top = 16
      Width = 33
      Height = 23
      Hint = 'A litte help on how to use this feature'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
  end
  object PanelDestinationFolder: TPanelEx
    Left = 0
    Top = 427
    Width = 1230
    Height = 48
    Align = alBottom
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelCopyMoveDestination: TShadowLabel
      Left = 8
      Top = 6
      Width = 413
      Height = 16
      Caption = 
        'Select a destination folder. Full paths only, no network paths. ' +
        'ANSI paths only!'
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object DestinationFolder: TEditEx
      Left = 8
      Top = 22
      Width = 361
      Height = 21
      AutoSize = False
      TabOrder = 0
    end
    object ButtonSelectROMsFolder: TBitBtnEx
      Left = 371
      Top = 22
      Width = 43
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonSelectROMsFolderClick
    end
    object CopyMoveOverwriteFiles: TAdvOfficeCheckBox
      Left = 421
      Top = 22
      Width = 98
      Height = 20
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Overwrite Files'
      ReturnIsTab = False
      Themed = True
    end
    object CopyMoveAddSystemFolder: TAdvOfficeCheckBox
      Left = 525
      Top = 22
      Width = 120
      Height = 20
      Hint = 
        'Use this option to include a "system name" sub-folder in the des' +
        'tination path'
      Checked = True
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Add System Folder'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
  end
  object GamesList: TEasyListview
    Left = 0
    Top = 0
    Width = 1250
    Height = 377
    BorderStyle = bsNone
    CellSizes.Tile.Height = 42
    CellSizes.Tile.Width = 615
    CellSizes.Report.Height = 28
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = IL_DeleteGameIcons
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
      0600000008000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000001000190010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000164000000FFFFFF1F000100000001000000090000004700
      61006D00650020004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0200000000000164000000FFFFFF1F0001000000010000000800000043006C00
      6F006E00650020006F0066000000000000000000000000001100000054456173
      79436F6C756D6E53746F726564FFFECE00060000008008000101000103000000
      000001C8000000FFFFFF1F0001000000010000000D00000053006F0066007400
      770061007200650020004C006900730074000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010400000000000187000000FFFFFF1F0001000000010000000B0000004400
      7200690076006500720020004E0061006D006500000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
      01010001050000000000011E000000FFFFFF1F00010000000100000003000000
      52004F004D000000000001000000FFFFFFFF0000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001060000000000
      011E000000FFFFFF1F0001000000010000000300000043004800440000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001070000000000011E000000FFFFFF1F0001000000
      0100000003000000430046004700000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Sizeable = False
    Header.Visible = True
    HotTrack.Color = clBlack
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsStandard
    ImagesExLarge = FormMain.IL_StandardIconsLarge
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.ImageIndent = 0
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileCaptionLines = 1
    PaintInfoItem.TileDetailCount = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupGames
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 2
    View = elsTile
    OnColumnClick = GamesListColumnClick
    OnItemCompare = GamesListItemCompare
    OnItemFreeing = GamesListItemFreeing
    OnItemImageDraw = GamesListItemImageDraw
    OnItemImageGetSize = GamesListItemImageGetSize
    OnItemImageDrawIsCustom = GamesListItemImageDrawIsCustom
    OnItemPaintText = GamesListItemPaintText
    OnItemSelectionChanged = GamesListItemSelectionChanged
    OnKeyAction = GamesListKeyAction
  end
  object Panel1: TPanel
    Left = 8
    Top = 112
    Width = 1041
    Height = 49
    Caption = 'Thiis is for debugging only... never set this panel to VISIBLE'
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    Visible = False
  end
  object IL_DeleteGameIcons: TImageList
    Left = 8
    Top = 328
  end
  object PopupGames: TBcBarPopupMenu
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
    OnMeasureMenuItem = PopupGamesMeasureMenuItem
    Left = 40
    Top = 328
    object PopupRemoveSelectedGames: TMenuItem
      Caption = 'Remove Selected Games'
      ShortCut = 46
      OnClick = PopupRemoveSelectedGamesClick
    end
    object PopupParentGame: TMenuItem
      Caption = 'Select Parent Game'
      OnClick = PopupParentGameClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupViewSelectedFilesList: TMenuItem
      Tag = 1
      Caption = 'View Selected Files List'
      OnClick = PopupViewFilesListAllGamesClick
    end
    object PopupViewFilesListAllGames: TMenuItem
      Caption = 'View Files List (All Games)'
      OnClick = PopupViewFilesListAllGamesClick
    end
  end
end
