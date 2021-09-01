object FormMAMESettings_SimpleMode: TFormMAMESettings_SimpleMode
  Left = 933
  Top = 325
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (Basic Mode)'
  ClientHeight = 1080
  ClientWidth = 618
  Color = clMoneyGreen
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ButtonPageVideo1: TSpeedButtonEx
    Tag = 2
    Left = 480
    Top = 80
    Width = 130
    Height = 22
    GroupIndex = 1
    Caption = 'Video / Audio / Input'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object ButtonPageFolders: TSpeedButtonEx
    Tag = 1
    Left = 414
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Down = True
    Caption = 'Folders'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
    FontColorDisabled = clBtnShadow
    FontShadowColorDisabled = clBtnHighlight
    GradientColorTop_Disabled = clSilver
    GradientColorBottom_Disabled = clMedGray
    FrameColor_Disabled = clGray
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 618
    Height = 80
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 525
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 48
      Width = 395
      Height = 27
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
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
      Layout = tlCenter
      WordWrap = True
    end
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 508
      Top = 45
      Width = 107
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
  end
  object PanelBottom: TPanelEx
    Tag = 1
    Left = 0
    Top = 561
    Width = 618
    Height = 35
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ButtonCancel: TBitBtnEx
      Left = 541
      Top = 2
      Width = 69
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object ButtonOk: TBitBtnEx
      Left = 464
      Top = 2
      Width = 69
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
    end
    object ButtonReadFileHelp: TBitBtnEx
      Left = 202
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Why two reload buttons ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonReadFileHelpClick
    end
    object ButtonResetToDefault: TBitBtnEx
      Left = 105
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Load only emulator default settings'
      Caption = 'Reset to Default'
      TabOrder = 3
      OnClick = ButtonResetToDefaultClick
    end
    object ButtonReadFile: TBitBtnEx
      Left = 8
      Top = 2
      Width = 89
      Height = 25
      Hint = 'Reload configuration files'
      Caption = 'Reload Settings'
      TabOrder = 4
      OnClick = ButtonReadFileClick
    end
    object ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx
      Left = 243
      Top = 7
      Width = 15
      Height = 15
      Hint = 'What is this settings for ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = ButtonHelpSaveValidateAllCustomFilesClick
    end
    object SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx
      Left = 263
      Top = 5
      Width = 195
      Height = 20
      Hint = 
        'Check settings from all custom files to avoid duplicates and kee' +
        'p files clean'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = SaveValidateAllCustomFilesClick
      Alignment = taLeftJustify
      Caption = 'Validate All Custom Files on Save'
      ReturnIsTab = False
      ShadowColor = clSkyBlue
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object Panel1_Folders: TPanelEx
    Left = 0
    Top = 101
    Width = 618
    Height = 460
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object FolderGameSnapshotsGroupBox: TPanelEx
      Left = 8
      Top = 338
      Width = 293
      Height = 49
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderGameSnapshotsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Screenshots'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderGameSnapshotsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderGameSnapshotsButtonSelectClick
      end
      object FolderGameSnapshots: TEditEx
        Left = 2
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Screenshots (.png Format)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderArtworksGroupBox: TPanelEx
      Left = 317
      Top = 187
      Width = 293
      Height = 135
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderArtworksGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Artwork Files / Effect Overlay Files'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderArtworks: TEasyListview
        Tag = 1
        Left = 4
        Top = 22
        Width = 283
        Height = 83
        Hint = 'Path to Artwork Files / Path to Effect Overlay Files'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
        Color = clWhite
        Ctl3D = True
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000117010000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.Border = 1
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.CaptionIndent = 2
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
        Selection.FullRowSelect = True
        Selection.GradientColorBottom = 16506264
        Selection.GradientColorTop = 15582647
        Selection.InactiveBorderColor = 10902593
        Selection.InactiveColor = 15582647
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderArtworksKeyAction
      end
      object FolderArtworksButtonUp: TBitBtnEx
        Tag = 1
        Left = 4
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonDown: TBitBtnEx
        Left = 48
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonSelect: TBitBtnEx
        Left = 112
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderArtworksButtonSelectClick
      end
      object FolderArtworksButtonEdit: TBitBtnEx
        Left = 156
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderArtworksButtonEditClick
      end
      object FolderArtworksButtonDelete: TBitBtnEx
        Left = 200
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderArtworksButtonDeleteClick
      end
      object FolderArtworksButtonClear: TBitBtnEx
        Left = 244
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderArtworksButtonClearClick
      end
    end
    object FolderIniFilesGroupBox: TPanelEx
      Left = 8
      Top = 187
      Width = 293
      Height = 135
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderIniFilesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Ini Files'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderIniFiles: TEasyListview
        Tag = 1
        Left = 4
        Top = 22
        Width = 283
        Height = 83
        Hint = 'Path to ini files'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
        Color = clWhite
        Ctl3D = True
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000117010000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
        Selection.FullRowSelect = True
        Selection.GradientColorBottom = 16506264
        Selection.GradientColorTop = 15582647
        Selection.InactiveBorderColor = 10902593
        Selection.InactiveColor = 15582647
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderIniFilesKeyAction
      end
      object FolderIniFilesButtonUp: TBitBtnEx
        Tag = 1
        Left = 4
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonDown: TBitBtnEx
        Left = 48
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonSelect: TBitBtnEx
        Left = 112
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderIniFilesButtonSelectClick
      end
      object FolderIniFilesButtonEdit: TBitBtnEx
        Left = 156
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderIniFilesButtonEditClick
      end
      object FolderIniFilesButtonDelete: TBitBtnEx
        Left = 200
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderIniFilesButtonDeleteClick
      end
      object FolderIniFilesButtonClear: TBitBtnEx
        Left = 244
        Top = 108
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderIniFilesButtonClearClick
      end
    end
    object FolderInputDeviceLogsGroupBox: TPanelEx
      Left = 317
      Top = 403
      Width = 293
      Height = 49
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderInputDeviceLogsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save Input Device Logs'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderInputDeviceLogs: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory For Recordings (Input Device Logs)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderInputDeviceLogsButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderInputDeviceLogsButtonSelectClick
      end
    end
    object FolderNVRAMGroupBox: TPanelEx
      Left = 317
      Top = 338
      Width = 293
      Height = 49
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderNVRAMGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Directory to Save NVRAM Contents'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderNVRAM: TEditEx
        Left = 4
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Directory To Save NVRAM Contents'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object FolderNVRAMButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FolderNVRAMButtonSelectClick
      end
    end
    object FolderSamplesGroupBox: TPanelEx
      Left = 8
      Top = 403
      Width = 293
      Height = 49
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderSamplesGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 291
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to Sample Sets'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderSamplesButtonSelect: TBitBtnEx
        Left = 244
        Top = 22
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = FolderSamplesButtonSelectClick
      end
      object FolderSamples: TEditEx
        Left = 2
        Top = 22
        Width = 237
        Height = 21
        Hint = 'Path to Sample Sets'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object FolderROMsGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 602
      Height = 159
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FolderROMsGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 600
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Path to ROM Sets and CHD Files'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FolderROMs: TEasyListview
        Tag = 1
        Left = 4
        Top = 22
        Width = 546
        Height = 132
        Hint = 'Path To ROM Sets And Hard Disk Images'
        BackGround.Enabled = True
        CellSizes.Report.Height = 18
        Color = clWhite
        Ctl3D = True
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          000600000080080001010001000000000000011C020000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        Selection.BlendColorSelRect = 10902593
        Selection.BlendIcon = False
        Selection.BorderColor = 10902593
        Selection.BorderColorSelRect = 10902593
        Selection.Color = 10902593
        Selection.FullCellPaint = True
        Selection.FullItemPaint = True
        Selection.FullRowSelect = True
        Selection.GradientColorBottom = 16506264
        Selection.GradientColorTop = 15582647
        Selection.InactiveBorderColor = 10902593
        Selection.InactiveColor = 15582647
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        CustomCheckRadioEnabled = False
        CustomEnableIconHD = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnItemPaintText = FolderROMsItemPaintText
        OnKeyAction = FolderROMsKeyAction
      end
      object FolderROMsButtonUp: TBitBtnEx
        Tag = 1
        Left = 553
        Top = 21
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = FolderROMsButtonUpClick
      end
      object FolderROMsButtonDown: TBitBtnEx
        Left = 553
        Top = 43
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = FolderROMsButtonUpClick
      end
      object FolderROMsButtonSelect: TBitBtnEx
        Left = 553
        Top = 66
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FolderROMsButtonSelectClick
      end
      object FolderROMsButtonEdit: TBitBtnEx
        Left = 553
        Top = 88
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderROMsButtonEditClick
      end
      object FolderROMsButtonDelete: TBitBtnEx
        Left = 553
        Top = 110
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderROMsButtonDeleteClick
      end
      object FolderROMsButtonClear: TBitBtnEx
        Left = 553
        Top = 132
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderROMsButtonClearClick
      end
    end
  end
  object Panel2_VideoAudioInput: TPanelEx
    Left = 0
    Top = 608
    Width = 618
    Height = 460
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object Mouse: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 205
      Width = 97
      Height = 20
      Hint = 'Enable mouse input'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Enable Mouse'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Joystick: TAdvOfficeCheckBoxEx
      Left = 128
      Top = 205
      Width = 99
      Height = 20
      Hint = 'Enable joystick input'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Enable Joystick'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SkipGameInfo: TAdvOfficeCheckBoxEx
      Left = 472
      Top = 121
      Width = 103
      Height = 20
      Hint = 'Skip displaying the information screen at startup'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Skip Game Info'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Cheat: TAdvOfficeCheckBoxEx
      Left = 472
      Top = 141
      Width = 105
      Height = 20
      Hint = 'Enable cheat subsystem'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Cheats Enabled'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ReadConfigFiles: TAdvOfficeCheckBoxEx
      Left = 472
      Top = 101
      Width = 113
      Height = 20
      Hint = 'Enable loading of configuration files'
      Checked = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Read Config Files'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AudioGroupBox: TPanelEx
      Left = 240
      Top = 101
      Width = 216
      Height = 91
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object AudioGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Audio'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object SampleRateLabel: TShadowLabel
        Left = 120
        Top = 42
        Width = 66
        Height = 16
        Caption = 'Sample Rate'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object VolumeLabel: TShadowLabel
        Left = 8
        Top = 42
        Width = 72
        Height = 16
        Hint = 'Volume [%ddB]'
        Caption = 'Volume [0dB]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object Samples: TAdvOfficeCheckBoxEx
        Left = 120
        Top = 20
        Width = 86
        Height = 20
        Hint = 'Enable the use of external samples if available'
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Use Samples'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SampleRate: TComboBox2Ex
        Left = 120
        Top = 58
        Width = 86
        Height = 23
        Hint = 'Set sound output sample rate'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 3
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '48000 Hz'
        Items.Strings = (
          '11025 Hz'
          '22050 Hz'
          '44100 Hz'
          '48000 Hz'
          '96000 Hz'
          '192000 Hz')
      end
      object Volume: TGaugeBar
        Left = 8
        Top = 58
        Width = 87
        Height = 23
        Hint = 'Sound volume attenuation in decibels (-32 -> low, 0 -> normal)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 5
        Max = 0
        Min = -32
        ShowHandleGrip = True
        Position = 0
        OnChange = VolumeChange
      end
      object EnableSound: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 55
        Height = 20
        Hint = 'Enable sound output'
        Checked = True
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Sound'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object VectorGroupBox: TPanelEx
      Left = 8
      Top = 361
      Width = 448
      Height = 91
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object VectorGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 446
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Vector'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object VectorBeamWidthLabel: TShadowLabel
        Left = 8
        Top = 42
        Width = 170
        Height = 15
        Hint = 'Beam Width [%2.2f]'
        AutoSize = False
        Caption = 'Beam Width [1.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object VectorFlickerEffectLabel: TShadowLabel
        Left = 233
        Top = 42
        Width = 170
        Height = 15
        Hint = 'Flicker Effect [%3.2f]'
        AutoSize = False
        Caption = 'Flicker Effect [0.00]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object Antialias: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 73
        Height = 20
        Hint = 'Use antialiasing when drawing vectors'
        Checked = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Antialias'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object VectorBeamWidth: TGaugeBar2
        Left = 8
        Top = 58
        Width = 205
        Height = 23
        Hint = 'Set vector beam width'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 0.100000001490116100
        Max = 10.000000000000000000
        Min = 0.100000001490116100
        ShowHandleGrip = True
        SmallChange = 0.050000000745058060
        Position = 1.000000000000000000
        OnChange = VectorBeamWidthChange
      end
      object VectorFlickerEffect: TGaugeBar2
        Left = 233
        Top = 58
        Width = 205
        Height = 23
        Hint = 'Set vector flicker effect'
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 10.000000000000000000
        Max = 100.000000000000000000
        ShowHandleGrip = True
        SmallChange = 0.500000000000000000
        OnChange = VectorFlickerEffectChange
      end
    end
    object VideoOutputModeGroupBox: TPanelEx
      Left = 8
      Top = 12
      Width = 216
      Height = 169
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object VideoOutputModeGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Video Options'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object ScreenResolutionLabel: TShadowLabel
        Left = 8
        Top = 120
        Width = 57
        Height = 16
        Hint = 'Preferred resolution of'
        Caption = 'Resolution'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ScreenRefreshRateLabel: TShadowLabel
        Left = 127
        Top = 120
        Width = 15
        Height = 16
        Caption = 'Hz'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object WindowMode: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 101
        Height = 20
        Hint = 'Run games in a window instead of full screen'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Window Mode'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object MaximizeWindow: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 40
        Width = 117
        Height = 20
        Hint = 'Start emulation with window maximized (window mode only)'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Maximize Window'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object KeepAspectRatio: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 60
        Width = 117
        Height = 20
        Hint = 'Enables aspect ratio enforcement, so games look like they should'
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Keep Aspect Ratio'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object WaitVerticalSync: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 80
        Width = 116
        Height = 20
        Hint = 'Enables v-sync to reduce tearing'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Wait Vertical Sync'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object HardwareStretch: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 100
        Width = 113
        Height = 20
        Hint = 
          'Enable screen stretching by using your video card (DirectDraw on' +
          'ly)'
        Checked = True
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Hardware Stretch'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ScreenResolution: TComboBox2Ex
        Left = 8
        Top = 136
        Width = 99
        Height = 23
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = 'auto'
        Items.Strings = (
          'auto'
          '0x0'
          '320x200'
          '320x240'
          '400x300'
          '480x360'
          '512x384'
          '640x400'
          '640x480'
          '720x480'
          '720x576'
          '800x600'
          '848x480'
          '960x600'
          '1024x768'
          '1088x612'
          '1152x864'
          '1280x720'
          '1280x768'
          '1280x800'
          '1280x960'
          '1280x1024'
          '1360x768'
          '1440s900'
          '1600x900'
          '1600x1024'
          '1600x1200'
          '1680x1050'
          '1920x1080'
          '1920x1200'
          '1920x1440'
          '2048x1536')
      end
      object ScreenRefreshRate: TComboBox2Ex
        Left = 127
        Top = 136
        Width = 79
        Height = 23
        Hint = 'Screen refresh rate'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'auto'
        Items.Strings = (
          'auto'
          '50'
          '59'
          '60'
          '70'
          '72'
          '75'
          '85'
          '100'
          '120'
          '140'
          '144'
          '150'
          '170'
          '200'
          '240')
      end
    end
    object PerformanceGroupBox: TPanelEx
      Left = 240
      Top = 12
      Width = 216
      Height = 73
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object PerformanceGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 214
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Performance'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object FrameskipLabel: TShadowLabel
        Left = 197
        Top = 45
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '0'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = False
      end
      object AutoFrameskip: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 103
        Height = 20
        Hint = 'Enable automatic frameskip selection'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Auto Frameskip'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SyncronizeRefreshRate: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 40
        Width = 113
        Height = 20
        Hint = 
          'Enables speed throttling only to the refresh of your monitor'#13#10'Th' +
          'is means that the game'#39's actual refresh rate is ignored'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Sync Refresh Rate'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Throttle: TAdvOfficeCheckBoxEx
        Left = 127
        Top = 21
        Width = 63
        Height = 20
        Hint = 'Enable throttling to keep game running in sync with real time'
        Checked = True
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Throttle'
        ReturnIsTab = False
        State = cbChecked
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object Frameskip: TGaugeBar
        Left = 127
        Top = 43
        Width = 67
        Height = 20
        Hint = 'Set frameskip to fixed value (autoframeskip must be disabled)'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        Max = 12
        ShowHandleGrip = True
        Position = 0
        OnChange = FrameskipChange
      end
    end
    object ScreenRotationGroupBox: TPanelEx
      Left = 472
      Top = 361
      Width = 138
      Height = 91
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object ScreenRotationGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 136
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Screen Rotation'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object RotateLeft: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 41
        Height = 20
        Hint = 'Rotate screen counterclockwise 90 degrees'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Left'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RotateRight: TAdvOfficeCheckBoxEx
        Left = 83
        Top = 20
        Width = 51
        Height = 20
        Hint = 'Rotate screen clockwise 90 degrees'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object FlipX: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 40
        Width = 96
        Height = 20
        Hint = 'Flip screen upside-down'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Flip Left-Right'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object FlipY: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 60
        Width = 113
        Height = 20
        Hint = 'Flip screen left-right'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Flip Upside-Down'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
    object FullScreenGroupBox: TPanelEx
      Left = 472
      Top = 12
      Width = 138
      Height = 66
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      EnableCustomBorder = ecbSingle
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object FullScreenGroupBoxLabel: TShadowLabel
        Left = 0
        Top = 0
        Width = 136
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Full Screen'
        CaptionIndent = 3
        Color = clCream
        ParentColor = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = 15132390
        ColorInnerFrame = clBlack
        Frames = [lfrLeft, lfrRight, lfrBottom]
        Transparent = False
      end
      object TripleBuffer: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 20
        Width = 86
        Height = 20
        Hint = 'Enable triple buffering (override v-sync)'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Triple Buffer'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object SwitchResolution: TAdvOfficeCheckBoxEx
        Left = 8
        Top = 40
        Width = 113
        Height = 20
        Hint = 'Enable resolution switching (for old systems and CRT monitors)'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Switch Resolution'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = False
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
  end
end
