object FormDeleteGamesFiles: TFormDeleteGamesFiles
  Left = 560
  Top = 439
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Game Files'
  ClientHeight = 540
  ClientWidth = 824
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
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 824
    Height = 89
    Align = alTop
    Color1 = 15792869
    Color2 = clWhite
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 78
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 710
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 709
      Top = 45
      Width = 110
      Height = 29
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      WordWrap = True
    end
    object LabelGameDetails: TShadowLabel
      Left = 106
      Top = 46
      Width = 341
      Height = 14
      Caption = 'game: gamename [clone of parentname] [bios: biosname]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 59
      Width = 100
      Height = 14
      Caption = 'Emulator version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelSoftwareListTitle: TShadowLabel
      Left = 183
      Top = 72
      Width = 79
      Height = 14
      Caption = '[softlist title] '
      Font.Charset = ANSI_CHARSET
      Font.Color = 21414
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Visible = False
    end
    object LabelSoftwareList: TShadowLabel
      Left = 106
      Top = 72
      Width = 77
      Height = 14
      Caption = 'software list:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Visible = False
    end
  end
  object FilesListView: TEasyListview
    Left = 1
    Top = 89
    Width = 823
    Height = 348
    BorderStyle = bsNone
    CellSizes.Tile.Width = 822
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    Groups.Items = {
      060000000100000010000000544561737947726F757053746F726564FFFECE00
      060000008108060000000000000000000000000000000000000000000000}
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000177020000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesExLarge = IL_MediaType
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.CheckType = ectBox
    PaintInfoItem.TileDetailCount = 3
    ParentShowHint = False
    Scrollbars.HorzEnabled = False
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendColorSelRect = 10902593
    Selection.BlendIcon = False
    Selection.BorderColor = 10902593
    Selection.BorderColorSelRect = 10902593
    Selection.Color = 10902593
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsTile
    OnItemCheckChange = FilesListViewItemCheckChange
    OnItemPaintText = FilesListViewItemPaintText
    OnKeyAction = FilesListViewKeyAction
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 485
    Width = 824
    Height = 55
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTotalFiles: TShadowLabel
      Left = 287
      Top = 15
      Width = 80
      Height = 15
      Alignment = taCenter
      Caption = '00 Total Files'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object LabelTotalFilesChecked: TShadowLabel
      Left = 287
      Top = 31
      Width = 100
      Height = 15
      Alignment = taCenter
      Caption = '00 Files Checked'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object ButtonNo: TBitBtn
      Left = 727
      Top = 14
      Width = 89
      Height = 34
      Hint = 'Click here to cancel the operation'
      Caption = 'Cancel'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object FileTypesGroupBox: TAdvGroupBox
      Left = 8
      Top = 6
      Width = 232
      Height = 41
      CaptionPosition = cpTopCenter
      RoundEdges = True
      ShadowColor = clMedGray
      Caption = ' Auto-Check Arcade File Types '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      TabOrder = 2
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBox
        Left = 122
        Top = 18
        Width = 106
        Height = 18
        Hint = 'Use this option to check/uncheck game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
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
        Height = 18
        Hint = 'Use this option to check/uncheck the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
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
        Left = 67
        Top = 18
        Width = 53
        Height = 18
        Hint = 
          'Use this option to check/uncheck CHD files (if supported by the ' +
          'game)'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 1
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        Caption = 'CHDs'
        ReturnIsTab = False
        ShadowColor = 14540253
        Themed = True
      end
    end
    object DeleteGameFromGamesList: TAdvOfficeCheckBox
      Tag = -1
      Left = 392
      Top = 13
      Width = 200
      Height = 18
      Hint = 'Use this option to delete the game entry from main games list'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      Caption = 'Delete Game From Games List'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
    end
    object DeleteGameFileFromDisk: TAdvOfficeCheckBox
      Left = 392
      Top = 29
      Width = 184
      Height = 18
      Hint = 
        'Auto-check the game file to be deleted (recycle bin not supporte' +
        'd!)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      Caption = 'Delete Game File From Disk'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
    end
    object ButtonYes: TBitBtn
      Left = 626
      Top = 14
      Width = 89
      Height = 34
      Hint = 'Click here to process all checked files'
      Caption = 'Delete Files'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonYesClick
    end
    object ButtonHelp: TBitBtn
      Left = 584
      Top = 20
      Width = 33
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
    Top = 437
    Width = 824
    Height = 48
    Align = alBottom
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelCopyMoveDestination: TShadowLabel
      Left = 8
      Top = 4
      Width = 413
      Height = 16
      Caption = 
        'Select a destination folder. Full paths only, no network paths. ' +
        'ANSI paths only!'
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object DestinationFolder: TEdit
      Left = 8
      Top = 20
      Width = 430
      Height = 21
      AutoSize = False
      Color = clWhite
      TabOrder = 0
    end
    object CopyMoveOverwriteFiles: TAdvOfficeCheckBox
      Left = 490
      Top = 20
      Width = 99
      Height = 20
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Overwrite Files'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonSelectROMsFolder: TBitBtn
      Left = 440
      Top = 20
      Width = 43
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonSelectROMsFolderClick
    end
    object CopyMoveAddSystemFolder: TAdvOfficeCheckBox
      Left = 594
      Top = 20
      Width = 121
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
  object IL_MediaType: TImageList
    Height = 48
    Width = 48
    Left = 656
    Top = 104
  end
end
