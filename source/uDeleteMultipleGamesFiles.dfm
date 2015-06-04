object FormDeleteMultipleGamesFiles: TFormDeleteMultipleGamesFiles
  Left = 531
  Top = 253
  BorderStyle = bsDialog
  Caption = 'Delete Games Files'
  ClientHeight = 598
  ClientWidth = 956
  Color = 15856113
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
  object GamesList: TEasyListview
    Left = 0
    Top = 0
    Width = 956
    Height = 495
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Report.Height = 26
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
      0600000009000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000100018D010000FFFFFF1F0001000000
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
      64FFFECE0006000000800800010100010400000000000164000000FFFFFF1F00
      01000000010000000B00000044007200690076006500720020004E0061006D00
      6500000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE000600000080080001010001050000000000011E000000FFFFFF
      1F0001000000010000000300000052004F004D000000000001000000FFFFFFFF
      00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
      0080080001010001060000000000011E000000FFFFFF1F000100000001000000
      0300000043004800440000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001070000000000
      011E000000FFFFFF1F0001000000010000000300000043004600470000000000
      0000000000000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010800000000000134000000FFFFFF1F0001000000
      01000000060000004D0065007200670065006400000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Consolas'
    Header.Font.Style = []
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = IL_DeleteGameIcons
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.CaptionLines = 2
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupGames
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
    TabOrder = 0
    View = elsReport
    OnColumnClick = GamesListColumnClick
    OnItemCompare = GamesListItemCompare
    OnItemFreeing = GamesListItemFreeing
    OnItemPaintText = GamesListItemPaintText
    OnItemSelectionChanged = GamesListItemSelectionChanged
    OnKeyAction = GamesListKeyAction
  end
  object PanelOptions: TPanelEx
    Left = 0
    Top = 543
    Width = 956
    Height = 55
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clGray
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSearchGame: TShadowLabel
      Left = 268
      Top = 8
      Width = 108
      Height = 16
      Caption = 'Search Game Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelTotalItems: TShadowLabel
      Left = 456
      Top = 19
      Width = 100
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = '000000 Games'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object FileTypesGroupBox: TAdvGroupBox
      Left = 8
      Top = 6
      Width = 251
      Height = 41
      Hint = 'Check File Types to %'
      CaptionPosition = cpTopCenter
      RoundEdges = True
      ShadowColor = clSilver
      Caption = ' Check File Types to Delete '
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBox
        Left = 136
        Top = 18
        Width = 111
        Height = 16
        Hint = 'Check this option to process game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        Caption = 'CFGs/NVRAMs'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
      end
      object DeleteROMs: TAdvOfficeCheckBox
        Left = 8
        Top = 18
        Width = 55
        Height = 16
        Hint = 'Check this option to process the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        Caption = 'ROMs'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
      end
      object DeleteCHDs: TAdvOfficeCheckBox
        Left = 72
        Top = 18
        Width = 54
        Height = 16
        Hint = 
          'Check this option to process CHD files (if supported by the game' +
          ')'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        Caption = 'CHDs'
        ReturnIsTab = False
        ShadowColor = 14540253
        Themed = True
      end
    end
    object ButtonDeleteFiles: TBitBtn
      Tag = 1
      Left = 765
      Top = 14
      Width = 89
      Height = 35
      Hint = 'Click here to process files of all games on the list'
      Caption = 'Delete Files'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonDeleteFilesClick
    end
    object ButtonNo: TBitBtn
      Left = 860
      Top = 14
      Width = 89
      Height = 35
      Hint = 'Click here to cancel the operation ("Esc" hotkey)'
      Caption = 'Cancel'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object FindGame: TEdit
      Left = 268
      Top = 25
      Width = 123
      Height = 22
      AutoSize = False
      CharCase = ecLowerCase
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = 'type a game name...'
      OnEnter = FindGameEnter
      OnExit = FindGameExit
      OnKeyPress = FindGameKeyPress
    end
    object ButtonFindGame: TBitBtn
      Left = 393
      Top = 25
      Width = 35
      Height = 22
      Hint = 'Find a game by name (partial name support)'
      Caption = 'Find'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonFindGameClick
    end
    object ButtonHelp: TBitBtn
      Tag = 1
      Left = 584
      Top = 21
      Width = 68
      Height = 23
      Hint = 'A litte help on how to use this feature'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonHelpClick
    end
  end
  object PanelDestinationFolder: TPanelEx
    Left = 0
    Top = 495
    Width = 956
    Height = 48
    Align = alBottom
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelDestinationFolder: TShadowLabel
      Left = 8
      Top = 24
      Width = 38
      Height = 19
      Caption = 'Folder'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelCopyMoveDestination: TShadowLabel
      Left = 46
      Top = 4
      Width = 594
      Height = 16
      Caption = 
        'Select a destination folder. CHD files are sent to a "\chd_files' +
        '\" sub-folder. No network paths and full paths only!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object DestinationFolder: TEdit
      Left = 46
      Top = 22
      Width = 460
      Height = 21
      AutoSize = False
      TabOrder = 0
    end
    object ButtonSelectROMsFolder: TBitBtn
      Left = 508
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
      Left = 558
      Top = 22
      Width = 142
      Height = 20
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Overwrite Existing Files'
      ReturnIsTab = False
      Themed = True
    end
  end
  object IL_DeleteGameIcons: TImageList
    Height = 24
    Width = 24
    Left = 48
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
    Left = 232
    Top = 208
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
