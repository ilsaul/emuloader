object FormDeleteMultipleGamesFiles4K: TFormDeleteMultipleGamesFiles4K
  Left = 968
  Top = 597
  BorderStyle = bsDialog
  Caption = 'Delete Games Files 4K'
  ClientHeight = 525
  ClientWidth = 1400
  Color = clBlue
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object PanelBottom: TPanelEx
    Left = 0
    Top = 440
    Width = 1400
    Height = 85
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
      Left = 384
      Top = 25
      Width = 48
      Height = 48
    end
    object DeleteGameFileFromDisk: TAdvOfficeCheckBoxEx
      Left = 357
      Top = 47
      Width = 365
      Height = 36
      Hint = 
        'Allow the console/computer game file to be deleted (recycle bin ' +
        'not supported!)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = '         Delete Game File From Disk'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      EnableIconHD = True
    end
    object DeleteGameFromGamesList: TAdvOfficeCheckBoxEx
      Tag = -1
      Left = 357
      Top = 15
      Width = 365
      Height = 36
      Hint = 
        'Use this option to delete the game entry from main games list (c' +
        'onsole/computer only)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = '         Delete Game From Games List'
      DisabledFontColor = clSilver
      ReturnIsTab = False
      ShadowColor = 14540253
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      EnableIconHD = True
    end
    object FileTypesGroupBox: TAdvGroupBoxEx
      Left = 8
      Top = 6
      Width = 335
      Height = 71
      Hint = 'Check File Types to %'
      CaptionPosition = cpTopCenter
      CheckBox.CustomIconsEnabled = False
      RoundEdges = True
      ShadowColor = clSilver
      Caption = ' Check Arcade File Types to Delete '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      TabOrder = 0
      object DeleteCFGsNVRAMs: TAdvOfficeCheckBoxEx
        Left = 183
        Top = 32
        Width = 150
        Height = 36
        Hint = 'Check this option to process game config/RAM files'
        HelpContext = 2
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'CFG/NVRAM'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        EnableIconHD = True
      end
      object DeleteROMs: TAdvOfficeCheckBoxEx
        Left = 7
        Top = 32
        Width = 78
        Height = 36
        Hint = 'Check this option to process the gamename .zip/.7z file'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'ROM'
        ReturnIsTab = False
        ShadowColor = 14540253
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        EnableIconHD = True
      end
      object DeleteCHDs: TAdvOfficeCheckBoxEx
        Left = 97
        Top = 32
        Width = 75
        Height = 36
        Hint = 
          'Check this option to process CHD files (if supported by the game' +
          ')'
        HelpContext = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'CHD'
        ReturnIsTab = False
        ShadowColor = 14540253
        Themed = True
        CustomIconsEnabled = False
        EnableIconHD = True
      end
    end
    object ButtonDeleteFiles: TBitBtnEx
      Tag = 1
      Left = 874
      Top = 30
      Width = 168
      Height = 45
      Hint = 'Click here to process files of all games on the list'
      Caption = 'Delete Files'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonNo: TBitBtnEx
      Left = 1052
      Top = 30
      Width = 168
      Height = 45
      Hint = 'Click here to cancel the operation ("Esc" hotkey)'
      Caption = 'Cancel'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonHelp: TBitBtnEx
      Tag = 1
      Left = 775
      Top = 35
      Width = 89
      Height = 36
      Hint = 'A litte help on how to use this feature'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object PanelDestinationFolder: TPanelEx
    Left = 0
    Top = 362
    Width = 1400
    Height = 78
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
    object DestinationFolderLabel: TShadowLabel
      Left = 8
      Top = 4
      Width = 423
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
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Overwrite Files'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      EnableIconHD = True
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
      EnableIconHD = True
    end
  end
  object GamesList: TEasyListview
    Left = 0
    Top = 0
    Width = 1250
    Height = 313
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
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendAlphaImage = 0
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 2
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
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
end
