object FormDeleteGameFiles4K: TFormDeleteGameFiles4K
  Left = 1246
  Top = 624
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Game Files 4K'
  ClientHeight = 1102
  ClientWidth = 1360
  Color = clWhite
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 30
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1360
    Height = 159
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
    Steps = 89
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 128
      Height = 128
      Transparent = True
    end
    object GameIcon: TImage
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 144
      Top = 4
      Width = 1205
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 1150
      Top = 81
      Width = 195
      Height = 51
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
    object LabelGameDetails: TShadowLabel
      Left = 199
      Top = 84
      Width = 568
      Height = 24
      Caption = 'game: gamename [clone of parentname] [bios: biosname]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
    object LabelEmulatorVersion: TShadowLabel
      Left = 198
      Top = 107
      Width = 164
      Height = 24
      Caption = 'Emulator version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
    object LabelSoftwareListTitle: TShadowLabel
      Left = 329
      Top = 130
      Width = 135
      Height = 24
      Caption = '[softlist title] '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 21414
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Visible = False
    end
    object LabelSoftwareList: TShadowLabel
      Left = 199
      Top = 130
      Width = 128
      Height = 24
      Caption = 'software list:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      Visible = False
    end
  end
  object FilesListView: TEasyListview
    Left = 1
    Top = 159
    Width = 1359
    Height = 780
    BorderStyle = bsNone
    CellSizes.Tile.Height = 78
    CellSizes.Tile.Width = 1358
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
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
    Header.Height = 38
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
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = True
    OnItemCheckChange = FilesListViewItemCheckChange
    OnItemPaintText = FilesListViewItemPaintText
    OnKeyAction = FilesListViewKeyAction
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 1017
    Width = 1360
    Height = 85
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
      Left = 703
      Top = 20
      Width = 122
      Height = 26
      Alignment = taCenter
      Caption = '00 Total Files'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelTotalFilesChecked: TShadowLabel
      Left = 703
      Top = 53
      Width = 155
      Height = 26
      Alignment = taCenter
      Caption = '00 Files Checked'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonNo: TBitBtnEx
      Left = 1182
      Top = 30
      Width = 168
      Height = 45
      Hint = 'Click here to cancel the operation'
      Caption = 'Cancel'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object FileTypesGroupBox: TAdvGroupBoxEx
      Left = 8
      Top = 6
      Width = 335
      Height = 71
      CaptionPosition = cpTopCenter
      CheckBox.CustomIconsEnabled = False
      CheckBox.CustomEnableIconHD = False
      RoundEdges = True
      ShadowColor = clMedGray
      Caption = ' Auto-Check Arcade File Types '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      TabOrder = 2
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBoxEx
        Left = 183
        Top = 32
        Width = 150
        Height = 36
        Hint = 'Use this option to check/uncheck game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = True
        TabOrder = 2
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'CFG/NVRAM'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object DeleteROMs: TAdvOfficeCheckBoxEx
        Left = 7
        Top = 32
        Width = 78
        Height = 36
        Hint = 'Use this option to check/uncheck the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'ROM'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
      object DeleteCHDs: TAdvOfficeCheckBoxEx
        Left = 97
        Top = 32
        Width = 75
        Height = 36
        Hint = 
          'Use this option to check/uncheck CHD files (if supported by the ' +
          'game)'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = True
        TabOrder = 1
        OnClick = DeleteCHDsClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'CHD'
        ReturnIsTab = False
        ShadowColor = 14540253
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
      end
    end
    object DeleteGameFromGamesList: TAdvOfficeCheckBoxEx
      Tag = -1
      Left = 357
      Top = 15
      Width = 315
      Height = 36
      Hint = 'Use this option to delete the game entry from main games list'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Delete Game From Games List'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object DeleteGameFileFromDisk: TAdvOfficeCheckBoxEx
      Left = 357
      Top = 47
      Width = 315
      Height = 36
      Hint = 
        'Auto-check the game file to be deleted (recycle bin not supporte' +
        'd!)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = DeleteCHDsClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Delete Game File From Disk'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object ButtonYes: TBitBtnEx
      Left = 1004
      Top = 30
      Width = 168
      Height = 45
      Hint = 'Click here to process all checked files'
      Caption = 'Delete Files'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonYesClick
    end
    object ButtonHelp: TBitBtnEx
      Left = 929
      Top = 30
      Width = 68
      Height = 45
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
    Top = 939
    Width = 1360
    Height = 78
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
    object DestinationFolderLabel: TShadowLabel
      Left = 8
      Top = 4
      Width = 421
      Height = 31
      Caption = 'Destination folder. Full path, no network path'
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
      Top = 35
      Width = 670
      Height = 36
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object CopyMoveOverwriteFiles: TAdvOfficeCheckBoxEx
      Left = 786
      Top = 35
      Width = 165
      Height = 36
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Overwrite Files'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object ButtonSelectROMsFolder: TBitBtnEx
      Left = 680
      Top = 35
      Width = 89
      Height = 36
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonSelectROMsFolderClick
    end
    object CopyMoveAddSystemFolder: TAdvOfficeCheckBoxEx
      Left = 960
      Top = 35
      Width = 205
      Height = 36
      Hint = 
        'Use this option to include a "system name" sub-folder in the des' +
        'tination path'
      Checked = True
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Add System Folder'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
  end
  object IL_MediaType: TImageList
    Height = 68
    Width = 68
    Left = 24
    Top = 168
  end
end
