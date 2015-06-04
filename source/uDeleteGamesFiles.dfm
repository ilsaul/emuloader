object FormDeleteGamesFiles: TFormDeleteGamesFiles
  Left = 607
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Game Files'
  ClientHeight = 518
  ClientWidth = 614
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
    Width = 614
    Height = 60
    Align = alTop
    Color1 = 15792869
    Color2 = clWhite
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 48
      Height = 48
      Transparent = True
    end
    object GameIcon: TImage
      Left = 58
      Top = 28
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 520
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
      Left = 496
      Top = 26
      Width = 110
      Height = 27
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -11
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
    object LabelGameDetails: TLabel
      Left = 86
      Top = 28
      Width = 287
      Height = 12
      Caption = 'game: gamename [clone of parentname] [bios: biosname]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelEmulatorVersion: TLabel
      Left = 86
      Top = 40
      Width = 85
      Height = 12
      Caption = 'Emulator version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
  end
  object FilesListView: TEasyListview
    Left = 1
    Top = 69
    Width = 613
    Height = 346
    BorderStyle = bsNone
    CellSizes.Tile.Width = 612
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
    Selection.Gradient = True
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
  object PanelBottom: TPanelEx
    Left = 0
    Top = 463
    Width = 614
    Height = 55
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
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
      Left = 517
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
    object ButtonYes: TBitBtn
      Left = 416
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
    object FileTypesGroupBox: TAdvGroupBox
      Left = 8
      Top = 6
      Width = 250
      Height = 41
      CaptionPosition = cpTopCenter
      RoundEdges = True
      ShadowColor = clMedGray
      Caption = ' Auto-Check File Types '
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBox
        Left = 136
        Top = 18
        Width = 106
        Height = 16
        Hint = 'Use this option to check/uncheck game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
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
        Height = 16
        Hint = 'Use this option to check/uncheck the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
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
        Left = 72
        Top = 18
        Width = 55
        Height = 16
        Hint = 
          'Use this option to check/uncheck CHD files (if supported by the ' +
          'game)'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
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
  end
  object PanelDestinationFolder: TPanelEx
    Left = 0
    Top = 415
    Width = 614
    Height = 48
    Align = alBottom
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelCopyMoveDestination: TShadowLabel
      Left = 46
      Top = 4
      Width = 543
      Height = 16
      Caption = 
        'Select a destination folder, full path. CHD files are sent to a ' +
        '"\chd_files\" sub-folder. No network paths!'
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
    object LabelDestinationFolder: TShadowLabel
      Left = 8
      Top = 23
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
    object DestinationFolder: TEdit
      Left = 46
      Top = 22
      Width = 370
      Height = 21
      AutoSize = False
      Color = clWhite
      TabOrder = 0
    end
    object CopyMoveOverwriteFiles: TAdvOfficeCheckBox
      Left = 468
      Top = 22
      Width = 142
      Height = 20
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Overwrite Existing Files'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonSelectROMsFolder: TBitBtn
      Left = 418
      Top = 22
      Width = 43
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonSelectROMsFolderClick
    end
  end
  object IL_MediaType: TImageList
    Height = 48
    Width = 48
    Left = 656
    Top = 104
  end
end
