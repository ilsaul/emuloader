object FormMAMESettings: TFormMAMESettings
  Left = 996
  Top = 454
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 580
  ClientWidth = 868
  Color = 15856113
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
  object ButtonPageFolders: TSpeedButtonEx
    Left = 305
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
  end
  object ButtonPageVideo1: TSpeedButtonEx
    Tag = 1
    Left = 371
    Top = 80
    Width = 57
    Height = 22
    GroupIndex = 1
    Caption = 'Video'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageVideo2: TSpeedButtonEx
    Tag = 2
    Left = 428
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Caption = 'Video 2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageVideo3: TSpeedButtonEx
    Tag = 3
    Left = 494
    Top = 80
    Width = 66
    Height = 22
    GroupIndex = 1
    Caption = 'Video 3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageLUAandAudio: TSpeedButtonEx
    Tag = 4
    Left = 560
    Top = 80
    Width = 101
    Height = 22
    GroupIndex = 1
    Caption = 'LUA and Audio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageInput: TSpeedButtonEx
    Tag = 5
    Left = 661
    Top = 80
    Width = 57
    Height = 22
    GroupIndex = 1
    Caption = 'Input'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageMisc: TSpeedButtonEx
    Tag = 6
    Left = 718
    Top = 80
    Width = 96
    Height = 22
    GroupIndex = 1
    Caption = 'Miscellaneous'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object ButtonPageSDLMAMEInput: TSpeedButtonEx
    Tag = 6
    Left = 814
    Top = 80
    Width = 49
    Height = 22
    GroupIndex = 1
    Caption = 'SDL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonPageFoldersClick
  end
  object NotebookPages: TNotebook
    Left = 0
    Top = 100
    Width = 868
    Height = 454
    Color = 15856113
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Folders'
      object FolderROMsLabel: TShadowLabel
        Left = 16
        Top = 13
        Width = 172
        Height = 16
        Caption = 'Path to ROM Sets and CHD Files'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object FolderIniFilesLabel: TShadowLabel
        Left = 16
        Top = 140
        Width = 83
        Height = 16
        Caption = 'Path to Ini Files'
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
      object FolderGameSnapshotsLabel: TShadowLabel
        Left = 303
        Top = 140
        Width = 158
        Height = 16
        Caption = 'Directory to Save Screenshots'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderGamesConfigurationsLabel: TShadowLabel
        Left = 303
        Top = 346
        Width = 174
        Height = 16
        Caption = 'Directory to Save Configurations'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderCheatFilesLabel: TShadowLabel
        Left = 590
        Top = 108
        Width = 101
        Height = 16
        Caption = 'Path to Cheat Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderMemoryCardsLabel: TShadowLabel
        Left = 590
        Top = 347
        Width = 219
        Height = 16
        Caption = 'Directory to Save Memory Card Contents'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderDiffLabel: TShadowLabel
        Left = 590
        Top = 60
        Width = 203
        Height = 16
        Caption = 'Directory to Save CHD Difference Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderSaveStatesLabel: TShadowLabel
        Left = 304
        Top = 296
        Width = 126
        Height = 16
        Caption = 'Directory to Save States'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderNVRAMLabel: TShadowLabel
        Left = 303
        Top = 394
        Width = 188
        Height = 16
        Caption = 'Directory to Save NVRAM Contents'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderHashFilesLabel: TShadowLabel
        Left = 16
        Top = 394
        Width = 209
        Height = 16
        Caption = 'Path to Software Definition Files (Hash)'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderArtworksLabel: TShadowLabel
        Left = 16
        Top = 252
        Width = 222
        Height = 16
        Caption = 'Path to Artwork Files / Effect Overlay Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderSamplesLabel: TShadowLabel
        Left = 16
        Top = 346
        Width = 142
        Height = 16
        Caption = 'Path to Audio Sample Sets'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderInputDeviceLogsLabel: TShadowLabel
        Left = 590
        Top = 299
        Width = 189
        Height = 16
        Caption = 'Directory to Save Input Device Logs'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderControllerDefinitionsLabel: TShadowLabel
        Left = 590
        Top = 155
        Width = 157
        Height = 16
        Caption = 'Path to Controller Definitions'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderCrosshairFilesLabel: TShadowLabel
        Left = 590
        Top = 203
        Width = 119
        Height = 16
        Caption = 'Path to Crosshair Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderFontFilesLabel: TShadowLabel
        Left = 590
        Top = 251
        Width = 94
        Height = 16
        Caption = 'Path to Font Files'
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
      object FolderDebuggerCommentsLabel: TShadowLabel
        Left = 590
        Top = 13
        Width = 209
        Height = 16
        Caption = 'Directory to Save Debugger Comments'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderLanguageFilesLabel: TShadowLabel
        Left = 303
        Top = 192
        Width = 143
        Height = 16
        Caption = 'Path to UI Translation Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderPluginFilesLabel: TShadowLabel
        Left = 303
        Top = 244
        Width = 104
        Height = 16
        Caption = 'Path to Plugin Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderManualsPDFLabel: TShadowLabel
        Left = 590
        Top = 394
        Width = 200
        Height = 16
        Caption = 'Directory to Game Manual Files (PDF)'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object FolderROMs: TEasyListview
        Tag = 1
        Left = 16
        Top = 31
        Width = 460
        Height = 98
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
          00060000008008000101000100000000000001C8010000FFFFFF1F0001000000
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
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderROMsKeyAction
      end
      object FolderROMsButtonUp: TBitBtnEx
        Tag = 1
        Left = 478
        Top = 30
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
        Left = 478
        Top = 51
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
        Left = 522
        Top = 30
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
        Left = 522
        Top = 51
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderROMsButtonEditClick
      end
      object FolderROMsButtonDelete: TBitBtnEx
        Left = 522
        Top = 72
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderROMsButtonDeleteClick
      end
      object FolderROMsButtonClear: TBitBtnEx
        Left = 522
        Top = 93
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = FolderROMsButtonClearClick
      end
      object FolderSamples: TEditEx
        Left = 16
        Top = 364
        Width = 217
        Height = 21
        Hint = 'Path to Audio Sample Sets'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object FolderSamplesButtonSelect: TBitBtnEx
        Left = 235
        Top = 364
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = FolderSamplesButtonSelectClick
      end
      object FolderGameSnapshots: TEditEx
        Left = 303
        Top = 158
        Width = 217
        Height = 21
        Hint = 'Directory For Screenshots (.png Format)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
      end
      object FolderGameSnapshotsButtonSelect: TBitBtnEx
        Left = 522
        Top = 158
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = FolderGameSnapshotsButtonSelectClick
      end
      object FolderGamesConfigurations: TEditEx
        Left = 303
        Top = 364
        Width = 217
        Height = 21
        Hint = 'Directory To Save Configurations'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
      end
      object FolderGamesConfigurationsButtonSelect: TBitBtnEx
        Left = 522
        Top = 364
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = FolderGamesConfigurationsButtonSelectClick
      end
      object FolderCheatFiles: TEditEx
        Left = 590
        Top = 126
        Width = 217
        Height = 21
        Hint = 'Path To Cheat Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
      end
      object FolderCheatFilesButtonSelect: TBitBtnEx
        Left = 809
        Top = 126
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = FolderCheatFilesButtonSelectClick
      end
      object FolderMemoryCards: TEditEx
        Left = 590
        Top = 365
        Width = 217
        Height = 21
        Hint = 'Directory To Save Memory Card Contents'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
      end
      object FolderMemoryCardsButtonSelect: TBitBtnEx
        Left = 809
        Top = 367
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = FolderMemoryCardsButtonSelectClick
      end
      object FolderDiff: TEditEx
        Left = 590
        Top = 78
        Width = 217
        Height = 21
        Hint = 'Directory For Hard Drive Image Difference Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 17
      end
      object FolderDiffButtonSelect: TBitBtnEx
        Left = 809
        Top = 78
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnClick = FolderDiffButtonSelectClick
      end
      object FolderSaveStates: TEditEx
        Left = 303
        Top = 314
        Width = 217
        Height = 21
        Hint = 'Directory To Save States'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 19
      end
      object FolderSaveStatesButtonSelect: TBitBtnEx
        Left = 522
        Top = 314
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnClick = FolderSaveStatesButtonSelectClick
      end
      object FolderNVRAM: TEditEx
        Left = 303
        Top = 412
        Width = 217
        Height = 21
        Hint = 'Directory To Save NVRAM Contents'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 21
      end
      object FolderNVRAMButtonSelect: TBitBtnEx
        Left = 522
        Top = 412
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        OnClick = FolderNVRAMButtonSelectClick
      end
      object FolderHashFiles: TEditEx
        Left = 16
        Top = 412
        Width = 217
        Height = 21
        Hint = 'Path to Software Definition Files (Hash)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 23
      end
      object FolderHashFilesButtonSelect: TBitBtnEx
        Left = 235
        Top = 412
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        OnClick = FolderHashFilesButtonSelectClick
      end
      object FolderArtworks: TEasyListview
        Tag = 1
        Left = 16
        Top = 270
        Width = 262
        Height = 44
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
          0006000000800800010100010000000000000102010000FFFFFF1F0001000000
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
        TabOrder = 25
        View = elsReport
        CustomCheckRadioEnabled = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderArtworksKeyAction
      end
      object FolderArtworksButtonUp: TBitBtnEx
        Tag = 1
        Left = 16
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonDown: TBitBtnEx
        Left = 59
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonSelect: TBitBtnEx
        Left = 106
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnClick = FolderArtworksButtonSelectClick
      end
      object FolderArtworksButtonEdit: TBitBtnEx
        Left = 149
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 29
        OnClick = FolderArtworksButtonEditClick
      end
      object FolderArtworksButtonDelete: TBitBtnEx
        Left = 192
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 30
        OnClick = FolderArtworksButtonDeleteClick
      end
      object FolderArtworksButtonClear: TBitBtnEx
        Left = 235
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
        OnClick = FolderArtworksButtonClearClick
      end
      object FolderIniFiles: TEasyListview
        Tag = 1
        Left = 16
        Top = 158
        Width = 262
        Height = 62
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
          0006000000800800010100010000000000000102010000FFFFFF1F0001000000
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
        TabOrder = 32
        View = elsReport
        CustomCheckRadioEnabled = False
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderIniFilesKeyAction
      end
      object FolderIniFilesButtonUp: TBitBtnEx
        Tag = 1
        Left = 16
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 33
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonDown: TBitBtnEx
        Left = 59
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 34
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonSelect: TBitBtnEx
        Left = 106
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 35
        OnClick = FolderIniFilesButtonSelectClick
      end
      object FolderIniFilesButtonEdit: TBitBtnEx
        Left = 149
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 36
        OnClick = FolderIniFilesButtonEditClick
      end
      object FolderIniFilesButtonDelete: TBitBtnEx
        Left = 192
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 37
        OnClick = FolderIniFilesButtonDeleteClick
      end
      object FolderIniFilesButtonClear: TBitBtnEx
        Left = 235
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        OnClick = FolderIniFilesButtonClearClick
      end
      object FolderInputDeviceLogs: TEditEx
        Left = 590
        Top = 317
        Width = 217
        Height = 21
        Hint = 'Directory For Recordings (Input Device Logs)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 39
      end
      object FolderInputDeviceLogsButtonSelect: TBitBtnEx
        Left = 809
        Top = 317
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 40
        OnClick = FolderInputDeviceLogsButtonSelectClick
      end
      object FolderControllerDefinitionsButtonSelect: TBitBtnEx
        Left = 809
        Top = 173
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 41
        OnClick = FolderControllerDefinitionsButtonSelectClick
      end
      object FolderCrosshairFilesButtonSelect: TBitBtnEx
        Left = 809
        Top = 221
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 42
        OnClick = FolderCrosshairFilesButtonSelectClick
      end
      object FolderFontFiles: TEditEx
        Left = 590
        Top = 269
        Width = 217
        Height = 21
        Hint = 'Path to font files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 43
      end
      object FolderFontFilesButtonSelect: TBitBtnEx
        Left = 809
        Top = 269
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 44
        OnClick = FolderFontFilesButtonSelectClick
      end
      object FolderControllerDefinitions: TEditEx
        Left = 590
        Top = 173
        Width = 217
        Height = 21
        Hint = 'Directory For Preconfigured Controller Keys'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 45
      end
      object FolderCrosshairFiles: TEditEx
        Left = 590
        Top = 221
        Width = 217
        Height = 21
        Hint = 'Path To Crosshair Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 46
      end
      object FolderDebuggerCommentsButtonSelect: TBitBtnEx
        Left = 809
        Top = 31
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 47
        OnClick = FolderDebuggerCommentsButtonSelectClick
      end
      object FolderDebuggerComments: TEditEx
        Left = 590
        Top = 31
        Width = 217
        Height = 21
        Hint = 'Directory to Save Debugger Comments'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 48
      end
      object FolderLanguageFilesButtonSelect: TBitBtnEx
        Left = 522
        Top = 210
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 49
        OnClick = FolderLanguageFilesButtonSelectClick
      end
      object FolderLanguageFiles: TEditEx
        Left = 303
        Top = 210
        Width = 217
        Height = 21
        Hint = 'Path to UI Translation Files'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 50
      end
      object FolderPluginFilesButtonSelect: TBitBtnEx
        Left = 522
        Top = 262
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 51
        OnClick = FolderPluginFilesButtonSelectClick
      end
      object FolderPluginFiles: TEditEx
        Left = 303
        Top = 262
        Width = 217
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 52
      end
      object FolderManualsPDF: TEditEx
        Left = 590
        Top = 412
        Width = 217
        Height = 21
        Hint = 'Directory to Game Manual Files (PDF)'
        TabStop = False
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 53
      end
      object FolderManualsPDFButtonSelect: TBitBtnEx
        Left = 809
        Top = 412
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 54
        OnClick = FolderManualsPDFButtonSelectClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video'
      object VideoRenderOptionsGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 169
        Height = 417
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Render Options'
        ParentCtl3D = True
        TabOrder = 2
        object IntegerScaleFactorVerticalLabel: TShadowLabel
          Left = 92
          Top = 225
          Width = 24
          Height = 16
          Caption = 'Vert'
          Enabled = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object IntegerScaleFactorHorizontalLabel: TShadowLabel
          Left = 24
          Top = 225
          Width = 23
          Height = 16
          Caption = 'Hor'
          Enabled = False
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
        end
        object MaximizeWindow: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 119
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
        end
        object KeepAspectRatio: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 60
          Width = 117
          Height = 20
          Hint = 'Maintain aspect ratio when scaling to fill output screen/window'
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Keep Aspect Ratio'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object WaitVerticalSync: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 100
          Width = 116
          Height = 20
          Hint = 'Enables v-sync to reduce tearing'
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Wait Vertical Sync'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object BilinearFilter: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 80
          Width = 113
          Height = 20
          Hint = 'Enable bilinear filtering on screen output'
          Checked = True
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Use Bilinear Filter'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object UnevenStretch: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 120
          Width = 104
          Height = 20
          Hint = 
            'Allow non-integer ratios when scaling to fill output screen/wind' +
            'ow horizontally or vertically'
          Checked = True
          Enabled = False
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = 'Uneven Stretch'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object UnevenStretchX: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 140
          Width = 132
          Height = 20
          Hint = 
            'Allow non-integer ratios when scaling to fill output screen/wind' +
            'ow horizontally'
          Enabled = False
          TabOrder = 6
          Alignment = taLeftJustify
          Caption = 'Uneven Stretch (Hor)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object IntegerScaleFactorHorizontal: TEditEx
          Left = 47
          Top = 222
          Width = 40
          Height = 21
          Hint = 'Set horizontal integer scale factor'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnKeyPress = IntegerScaleFactorHorizontalKeyPress
        end
        object IntegerScaleFactorVertical: TEditEx
          Left = 116
          Top = 222
          Width = 40
          Height = 21
          Hint = 'Set vertical integer scale factor'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnKeyPress = IntegerScaleFactorVerticalKeyPress
        end
        object IntegerScaleOverscan: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 200
          Width = 140
          Height = 20
          Hint = 'Allow overscan on integer scaled targets'
          Enabled = False
          TabOrder = 9
          Alignment = taLeftJustify
          Caption = 'Integer Scale Overscan'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object UnevenStretchY: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 160
          Width = 132
          Height = 20
          Hint = 
            'Allow non-integer ratios when scaling to fill otuput screen/wind' +
            'ow vertially'
          Enabled = False
          TabOrder = 10
          Alignment = taLeftJustify
          Caption = 'Uneven Stretch (Vert)'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object AutoUnevenStretchXY: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 180
          Width = 130
          Height = 20
          Hint = 
            'Automatically apply uneven stretch hor/vert based on source nati' +
            've orientation'
          Enabled = False
          TabOrder = 11
          Alignment = taLeftJustify
          Caption = 'Auto Uneven Stretch'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object VectorGroupBox: TAdvGroupBoxEx
        Left = 384
        Top = 214
        Width = 169
        Height = 213
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Vector'
        ParentCtl3D = True
        TabOrder = 1
        object VectorFlickerEffectLabel: TShadowLabel
          Left = 8
          Top = 40
          Width = 121
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
        object VectorBeamWidthMinLabel: TShadowLabel
          Left = 8
          Top = 83
          Width = 145
          Height = 15
          Hint = 'Beam Min Width [%2.2f]'
          AutoSize = False
          Caption = 'Beam Min Width [1.00]'
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
        object VectorBeamWidthMaxLabel: TShadowLabel
          Left = 8
          Top = 126
          Width = 145
          Height = 15
          Hint = 'Beam Max Width [%2.2f]'
          AutoSize = False
          Caption = 'Beam Max Width [1.00]'
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
        object VectorBeamIntensityWeightLabel: TShadowLabel
          Left = 8
          Top = 169
          Width = 158
          Height = 15
          Hint = 'Beam Intensity Weight [%1.2f]'
          AutoSize = False
          Caption = 'Beam Intensity Weight [0.00]'
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
        object VectorFlickerEffect: TGaugeBar2
          Left = 8
          Top = 56
          Width = 153
          Height = 20
          Hint = 'Set vector flicker effect'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 10.000000000000000000
          Max = 100.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.500000000000000000
          OnChange = VectorFlickerEffectChange
        end
        object VectorBeamWidthMin: TGaugeBar2
          Left = 8
          Top = 99
          Width = 153
          Height = 20
          Hint = 'Set minimum vector beam width'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.100000001490116100
          Max = 10.000000000000000000
          Min = 0.009999999776482582
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
          OnChange = VectorBeamWidthMinChange
        end
        object VectorBeamWidthMax: TGaugeBar2
          Left = 8
          Top = 142
          Width = 153
          Height = 20
          Hint = 'Set maximum vector beam width'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.100000001490116100
          Max = 10.000000000000000000
          Min = 0.009999999776482582
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
          OnChange = VectorBeamWidthMaxChange
        end
        object VectorBeamIntensityWeight: TGaugeBar2
          Left = 8
          Top = 185
          Width = 153
          Height = 20
          Hint = 'Set maximum vector beam width'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          Min = -1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          OnChange = VectorBeamIntensityWeightChange
        end
        object Antialias: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 65
          Height = 19
          Hint = 'Use antialiasing when drawing vectors'
          Checked = True
          Enabled = False
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Antialias'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object ScreenOptionsGroupBox: TAdvGroupBoxEx
        Left = 200
        Top = 12
        Width = 169
        Height = 279
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Game Screen'
        Ctl3D = True
        TabOrder = 4
        object BrightnessLabel: TShadowLabel
          Left = 8
          Top = 63
          Width = 153
          Height = 15
          Hint = 'Brightness Correction [%1.2f]'
          AutoSize = False
          Caption = 'Brightness Correction [1.00]'
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
        object Prescale_ScaleScreenLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 153
          Height = 15
          Hint = 'Scale Screen '#39'Prescale'#39' [%ux]'
          AutoSize = False
          Caption = 'Scale Screen '#39'Prescale'#39' [1x]'
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
        object ContrastLabel: TShadowLabel
          Left = 8
          Top = 106
          Width = 153
          Height = 15
          Hint = 'Contrast Correction [%1.2f]'
          AutoSize = False
          Caption = 'Contrast Correction [1.00]'
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
        object GammaLabel: TShadowLabel
          Left = 8
          Top = 149
          Width = 153
          Height = 15
          Hint = 'Gamma Correction [%1.2f]'
          AutoSize = False
          Caption = 'Gamma Correction [1.00]'
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
        object PauseBrightnessLabel: TShadowLabel
          Left = 8
          Top = 192
          Width = 153
          Height = 15
          Hint = 'Pause Brightness [%1.2f]'
          AutoSize = False
          Caption = 'Pause Brightness [0.65]'
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
        object EffectOverlayLabel: TShadowLabel
          Left = 8
          Top = 235
          Width = 136
          Height = 16
          Caption = 'Visual Effects Overlay File'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object Prescale_ScaleScreen: TGaugeBar
          Left = 8
          Top = 36
          Width = 153
          Height = 20
          Hint = 
            'Scale screen resolution rendering (1x for game'#39's original resolu' +
            'tion)'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 12
          Max = 8
          Min = 1
          ShowHandleGrip = True
          Position = 1
          OnChange = Prescale_ScaleScreenChange
        end
        object Brightness: TGaugeBar2
          Left = 8
          Top = 79
          Width = 153
          Height = 20
          Hint = 
            'Default screen brightness correction (does not affect the artwor' +
            'k or other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
          OnChange = BrightnessChange
        end
        object Contrast: TGaugeBar2
          Left = 8
          Top = 122
          Width = 153
          Height = 20
          Hint = 
            'Default screen contrast correction (does not affect the artwork ' +
            'or other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
          OnChange = ContrastChange
        end
        object Gamma: TGaugeBar2
          Left = 8
          Top = 165
          Width = 153
          Height = 20
          Hint = 
            'Default screen gamma correction (does not affect the artwork or ' +
            'other parts of the display)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 3.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
          OnChange = GammaChange
        end
        object PauseBrightness: TGaugeBar2
          Left = 8
          Top = 208
          Width = 153
          Height = 20
          Hint = 'Additional pause brightness'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.500000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.649999976158142100
          OnChange = PauseBrightnessChange
        end
        object EffectOverlay: TEditEx
          Left = 8
          Top = 251
          Width = 108
          Height = 21
          Hint = 'Name of a PNG file to use for visual effects'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object EffectOverlayButtonSelect: TBitBtnEx
          Left = 118
          Top = 251
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = EffectOverlayButtonSelectClick
        end
      end
      object FullScreenGroupBox: TAdvGroupBoxEx
        Left = 384
        Top = 12
        Width = 169
        Height = 193
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Full Screen'
        ParentCtl3D = True
        TabOrder = 5
        object FullScreenBrightnessLabel: TShadowLabel
          Left = 8
          Top = 63
          Width = 153
          Height = 15
          Hint = 'Brightness Correction [%1.2f]'
          AutoSize = False
          Caption = 'Brightness Correction [1.00]'
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
        object FullScreenContrastLabel: TShadowLabel
          Left = 8
          Top = 106
          Width = 153
          Height = 15
          Hint = 'Contrast Correction [%1.2f]'
          AutoSize = False
          Caption = 'Contrast Correction [1.00]'
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
        object FullScreenGammaLabel: TShadowLabel
          Left = 8
          Top = 149
          Width = 153
          Height = 15
          Hint = 'Gamma Correction [%1.2f]'
          AutoSize = False
          Caption = 'Gamma Correction [1.00]'
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
        object TripleBuffer: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 89
          Height = 20
          Hint = 'Enable triple buffering (override v-sync)'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Triple Buffer'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object SwitchResolution: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 121
          Height = 20
          Hint = 'Enable resolution switching (for old systems and CRT monitors)'
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Switch Resolution'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object FullScreenBrightness: TGaugeBar2
          Left = 8
          Top = 79
          Width = 153
          Height = 20
          Hint = 'Brightness value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.009999999776482582
          Position = 1.000000000000000000
          OnChange = FullScreenBrightnessChange
        end
        object FullScreenContrast: TGaugeBar2
          Left = 8
          Top = 122
          Width = 153
          Height = 20
          Hint = 'Contrast value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 2.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
          OnChange = FullScreenContrastChange
        end
        object FullScreenGamma: TGaugeBar2
          Left = 8
          Top = 165
          Width = 153
          Height = 20
          Hint = 'Gamma value in full screen mode (entire screen)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.050000000745058060
          Max = 3.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 1.000000000000000000
          OnChange = FullScreenGammaChange
        end
      end
      object SnapshotsGroupBox: TAdvGroupBoxEx
        Left = 568
        Top = 227
        Width = 169
        Height = 200
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Snapshots / Movies'
        ParentCtl3D = True
        TabOrder = 6
        object SnapshotNameFormatLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 76
          Height = 16
          Caption = 'Name Format'
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
        object SnapshotViewLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 28
          Height = 16
          Caption = 'View'
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
        object SnapSizeCustomXLabel: TShadowLabel
          Left = 111
          Top = 134
          Width = 10
          Height = 16
          Caption = 'X'
          Enabled = False
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
        object SnapSizeCustomLabel: TShadowLabel
          Left = 24
          Top = 134
          Width = 45
          Height = 16
          Caption = 'Custom'
          Enabled = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SnapBurnIn: TAdvOfficeCheckBoxEx
          Left = 7
          Top = 176
          Width = 113
          Height = 20
          Hint = 'Create burn-in snapshots for each screen'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Burn-in Snapshot'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object SnapNameButtonDefault: TBitBtnEx
          Left = 125
          Top = 36
          Width = 38
          Height = 21
          Hint = 'Set default snapshot name'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = SnapNameButtonDefaultClick
        end
        object SnapView: TComboBox2Ex
          Left = 8
          Top = 80
          Width = 115
          Height = 21
          Hint = 
            'Specify snapshot/movie view'#13#10'Select the default '#39'internal'#39' to us' +
            'e internal pixel-aspect views'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'Internal'
          Items.Strings = (
            'Internal'
            'Auto'
            'Standard'
            'Native'
            'Pixel Aspect'
            'Cocktail')
        end
        object SnapViewButtonDefault: TBitBtnEx
          Left = 124
          Top = 80
          Width = 38
          Height = 21
          Hint = 'Set default snapshot / movie view'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = SnapViewButtonDefaultClick
        end
        object SnapSizeAuto: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 111
          Width = 106
          Height = 20
          Hint = 'Set resolution to game'#39's original size (raw pixels)'
          Checked = True
          TabOrder = 4
          OnClick = SnapSizeAutoClick
          Alignment = taLeftJustify
          Caption = 'Auto Resolution'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object SnapSizeWidth: TEditEx
          Left = 68
          Top = 131
          Width = 40
          Height = 21
          Hint = 'Custom resolution width'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnKeyPress = SnapSizeWidthKeyPress
        end
        object SnapSizeHeight: TEditEx
          Left = 122
          Top = 131
          Width = 40
          Height = 21
          Hint = 'Custom resolution height'
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnKeyPress = SnapSizeHeightKeyPress
        end
        object SnapName: TEditEx
          Left = 8
          Top = 36
          Width = 115
          Height = 21
          Hint = 
            'Override the default snapshot naming; %g == gamename, %i == inde' +
            'x'
          AutoSize = False
          Color = clWhite
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
        end
        object SnapBilinear: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 156
          Width = 123
          Height = 20
          Hint = 
            'Specify if the snapshot/movie should have bilinear filtering app' +
            'lied'
          Checked = True
          TabOrder = 8
          Alignment = taLeftJustify
          Caption = 'Apply Bilinear Filter'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object ArtworkGroupBox: TAdvGroupBoxEx
        Left = 568
        Top = 12
        Width = 169
        Height = 181
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Artwork'
        ParentCtl3D = True
        TabOrder = 0
        object FallbackArtworkLabel: TShadowLabel
          Left = 8
          Top = 88
          Width = 91
          Height = 16
          Caption = 'Fallback Artwork'
          Enabled = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object OverrideArtworkLabel: TShadowLabel
          Left = 8
          Top = 136
          Width = 93
          Height = 16
          Caption = 'Override Artwork'
          Enabled = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ArtworkBackdrops: TAdvOfficeCheckBoxEx
          Left = 88
          Top = 40
          Width = 77
          Height = 20
          Hint = 'Enable the display of backdrops'
          Checked = True
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Backdrops'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object ArtworkBezels: TAdvOfficeCheckBoxEx
          Left = 110
          Top = 60
          Width = 53
          Height = 20
          Hint = 'Enable the display of bezels'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Bezels'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object ArtworkOverlays: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 68
          Height = 20
          Hint = 'Enable the display of overlays'
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Overlays'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object ArtworkCrop: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 49
          Height = 20
          Hint = 
            'Crop artwork so emulated screen image fills output screen/window' +
            ' in one axis'
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Crop'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object ArtworkControlPanels: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 60
          Width = 99
          Height = 20
          Hint = 'Enable the display of control panels'
          Checked = True
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Control Panels'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object ArtworkMarquees: TAdvOfficeCheckBoxEx
          Left = 88
          Top = 20
          Width = 75
          Height = 20
          Hint = 'Enable the display of marquees'
          Checked = True
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = 'Marquees'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object FallbackArtwork: TEditEx
          Left = 8
          Top = 104
          Width = 153
          Height = 23
          Hint = 
            'Fallback artwork if no external artwork or internal driver layou' +
            't defined'
          Color = clWhite
          Enabled = False
          TabOrder = 6
        end
        object OverrideArtwork: TEditEx
          Left = 8
          Top = 152
          Width = 153
          Height = 23
          Hint = 'Override artwork for external artwork and internal driver layout'
          Color = clWhite
          Enabled = False
          TabOrder = 7
        end
      end
      object ScreenRotationGroupBox: TAdvGroupBoxEx
        Left = 200
        Top = 297
        Width = 169
        Height = 131
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Screen Rotation'
        ParentCtl3D = True
        TabOrder = 3
        object FlipX: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 84
          Width = 96
          Height = 20
          Hint = 'Flip screen left-right'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Flip Left-Right'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object FlipY: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 104
          Width = 112
          Height = 20
          Hint = 'Flip screen upside-down'
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Flip Upside-Down'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object RotateRight: TAdvOfficeCheckBoxEx
          Left = 88
          Top = 40
          Width = 51
          Height = 20
          Hint = 'Rotate screen clockwise 90 degrees'
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Right'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object RotateLeft: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 41
          Height = 20
          Hint = 'Rotate screen counterclockwise 90 degrees'
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Left'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object AutoRotateRight: TAdvOfficeCheckBoxEx
          Left = 88
          Top = 60
          Width = 81
          Height = 20
          Hint = 'Automatically rotate screen clockwise 90 degrees if vertical'
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Auto Right'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object AutoRotateLeft: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 60
          Width = 73
          Height = 20
          Hint = 
            'Automatically rotate screen counterclockwise 90 degrees if verti' +
            'cal'
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = 'Auto Left'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object Rotate: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 45
          Height = 19
          Hint = 
            'Rotate the game screen according to the game'#39's orientation needs' +
            ' it'
          Checked = True
          TabOrder = 6
          Alignment = taLeftJustify
          Caption = 'Auto'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 2'
      object MonitorProviderLabel: TShadowLabel
        Left = 336
        Top = 13
        Width = 93
        Height = 16
        Caption = 'Monitor Provider'
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
      object AttachWindowLabel: TShadowLabel
        Left = 336
        Top = 79
        Width = 151
        Height = 16
        Caption = 'Attach To Arbitrary Window'
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object PerformanceGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 308
        Height = 214
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Performance'
        ParentCtl3D = True
        TabOrder = 0
        object SpeedLabel: TShadowLabel
          Left = 8
          Top = 130
          Width = 123
          Height = 16
          Hint = 'Gameplay Speed [%3.2f]'
          Caption = 'Gameplay Speed [1.00]'
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
        object FrameskipLabel: TShadowLabel
          Left = 108
          Top = 86
          Width = 57
          Height = 16
          Caption = 'Frameskip'
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
        object ThreadPriorityLabel: TShadowLabel
          Left = 208
          Top = 86
          Width = 81
          Height = 16
          Caption = 'Thread Priority'
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
        object NumberProcessorsLabel: TShadowLabel
          Left = 8
          Top = 86
          Width = 83
          Height = 16
          Caption = '# of Processors'
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
        object BenchmarkLabel: TShadowLabel
          Left = 158
          Top = 130
          Width = 121
          Height = 16
          Hint = 'sec'
          Caption = 'Benchmark [00:00 sec]'
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
        object SecondsToRunLabel: TShadowLabel
          Left = 8
          Top = 173
          Width = 278
          Height = 16
          Hint = 'sec'
          Caption = 'Time to Run Before Automatically Exiting [00:00 sec]'
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
          Left = 79
          Top = 40
          Width = 103
          Height = 20
          Hint = 
            'Enable automatic frameskip adjustment to maintain emulation spee' +
            'd'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Auto Frameskip'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object Throttle: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 63
          Height = 20
          Hint = 'Throttle emulation to keep system running in sync with real time'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Throttle'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object Sleep: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 51
          Height = 20
          Hint = 
            'Enable sleeping, which gives time back to other applications whe' +
            'n idle'
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Sleep'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object Multithreading: TAdvOfficeCheckBoxEx
          Left = 79
          Top = 20
          Width = 100
          Height = 20
          Hint = 
            'Enable multithreading; this enables rendering and blitting on a ' +
            'separate thread'
          Enabled = False
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Multithreading'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object RefreshSpeed: TAdvOfficeCheckBoxEx
          Left = 191
          Top = 40
          Width = 95
          Height = 20
          Hint = 
            'Automatically adjust emulation speed to keep the emulated refres' +
            'h rate slower than the host screen'
          Checked = True
          TabOrder = 4
          Alignment = taLeftJustify
          Caption = 'Refresh Speed'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object SyncronizeRefreshRate: TAdvOfficeCheckBoxEx
          Left = 191
          Top = 20
          Width = 113
          Height = 20
          Hint = 
            'Enables speed throttling only to the refresh of your monitor'#13#10'Th' +
            'is means that the game'#39's actual refresh rate is ignored'
          TabOrder = 5
          Alignment = taLeftJustify
          Caption = 'Sync Refresh Rate'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object Speed: TGaugeBar2
          Left = 8
          Top = 146
          Width = 142
          Height = 20
          Hint = 
            'Controls the speed of gameplay, relative to realtime; smaller nu' +
            'mbers are slower'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.500000000000000000
          Max = 100.000000000000000000
          Min = 0.100000001490116100
          ShowHandleGrip = True
          SmallChange = 0.100000001490116100
          Position = 1.000000000000000000
          OnChange = SpeedChange
          OnMouseDown = SpeedMouseDown
        end
        object Frameskip: TComboBox2Ex
          Left = 108
          Top = 102
          Width = 93
          Height = 21
          Hint = 'Set frameskip to fixed value (autoframeskip must be disabled)'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          Text = '0 (Default)'
          Items.Strings = (
            '0 (Default)'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12')
        end
        object ThreadPriority: TComboBox2Ex
          Left = 208
          Top = 102
          Width = 92
          Height = 21
          Hint = 'Thread priority for the main game thread'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 15
          ParentFont = False
          TabOrder = 8
          Text = '0 (Normal)'
          Items.Strings = (
            '-15'
            '-14'
            '-13'
            '-12'
            '-11'
            '-10'
            '-9'
            '-8'
            '-7'
            '-6'
            '-5'
            '-4'
            '-3'
            '-2'
            '-1'
            '0 (Normal)'
            '1')
        end
        object NumberProcessors: TComboBox2Ex
          Left = 8
          Top = 102
          Width = 93
          Height = 21
          Hint = 
            'Specify the number of processors to use for work queues. Auto se' +
            'tting uses all CPUs found by the OS'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Text = 'Auto'
          Items.Strings = (
            'Auto')
        end
        object Benchmark: TGaugeBar
          Tag = 14
          Left = 158
          Top = 146
          Width = 142
          Height = 20
          Hint = 'Implies: -video none -sound none -nothrottle'
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 60
          Max = 900
          ShowHandleGrip = True
          Position = 0
          OnChange = BenchmarkChange
        end
        object SecondsToRun: TGaugeBar
          Tag = 14
          Left = 8
          Top = 189
          Width = 293
          Height = 20
          Hint = 'Time to Run Before Automatically Exiting ['
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 60
          Max = 900
          ShowHandleGrip = True
          Position = 0
          OnChange = SecondsToRunChange
        end
        object LowLatency: TAdvOfficeCheckBoxEx
          Left = 191
          Top = 60
          Width = 95
          Height = 20
          Hint = 'Draws new frame before throttling to reduce input latency'
          Enabled = False
          TabOrder = 12
          Alignment = taLeftJustify
          Caption = 'Low Latency'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object ScreensGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 242
        Width = 176
        Height = 193
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Screens'
        ParentCtl3D = True
        TabOrder = 1
        object ScreenNameLabel: TShadowLabel
          Left = 8
          Top = 60
          Width = 35
          Height = 16
          Hint = 'Explicit name of'
          Caption = 'Name'
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
        object ScreenAspectRatioLabel: TShadowLabel
          Left = 101
          Top = 104
          Width = 69
          Height = 16
          Hint = 'Aspect ratio of'
          Caption = 'Aspect Ratio'
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
        object ScreenResolutionLabel: TShadowLabel
          Left = 8
          Top = 148
          Width = 59
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
        object ScreenRefreshRate_CustomLabel: TShadowLabel
          Left = 101
          Top = 148
          Width = 17
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
        object ScreenViewLabel: TShadowLabel
          Left = 7
          Top = 104
          Width = 28
          Height = 16
          Hint = 'Preferred view for'
          Caption = 'View'
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
        object ScreensSelectorLabel: TShadowLabel
          Left = 81
          Top = 16
          Width = 83
          Height = 16
          Hint = 'Explicit name of'
          Caption = 'Set Options On'
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
        object NumberScreensLabel: TShadowLabel
          Left = 11
          Top = 42
          Width = 45
          Height = 14
          Caption = '1 2 3 4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object ScreenName: TComboBox2Ex
          Left = 8
          Top = 76
          Width = 89
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'Auto'
          OnSelect = ScreenNameSelect
          Items.Strings = (
            'Auto'
            '\\.\DISPLAY1'
            '\\.\DISPLAY2'
            '\\.\DISPLAY3'
            '\\.\DISPLAY4'
            '\\.\DISPLAY5'
            '\\.\DISPLAY6'
            '\\.\DISPLAY7'
            '\\.\DISPLAY8')
        end
        object ScreenAspectRatio: TComboBox2Ex
          Left = 101
          Top = 120
          Width = 68
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = 'Auto'
          OnSelect = ScreenAspectRatioSelect
          Items.Strings = (
            'Auto'
            '16:9'
            '4:3'
            '16:10'
            '3:2'
            '3:4'
            '5:2'
            '5:3')
        end
        object ScreenResolution: TComboBox2Ex
          Left = 8
          Top = 164
          Width = 89
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'Auto'
          OnSelect = ScreenResolutionSelect
          Items.Strings = (
            'Auto'
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
          Left = 101
          Top = 164
          Width = 68
          Height = 21
          Hint = 'Screen refresh rate'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = 'Auto'
          OnSelect = ScreenRefreshRateSelect
          Items.Strings = (
            'Auto'
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
        object ScreenView: TComboBox2Ex
          Left = 8
          Top = 120
          Width = 89
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'Auto'
          OnSelect = ScreenViewSelect
          Items.Strings = (
            'Auto'
            'Standard'
            'Native'
            'Pixel Aspect'
            'Cocktail'
            'Cropped'
            'Stretched')
        end
        object ScreensSelector: TComboBox2Ex
          Tag = -1
          Left = 81
          Top = 32
          Width = 86
          Height = 21
          Hint = 'Select the screen you want to configure'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          Text = 'All Screens'
          OnSelect = ScreensSelectorSelect
          Items.Strings = (
            'All Screens'
            'Screen 1'
            'Screen 2'
            'Screen 3'
            'Screen 4')
        end
        object ScreenButtonDefaultSettings: TBitBtnEx
          Left = 129
          Top = 56
          Width = 38
          Height = 21
          Hint = 'Set default values for the selected screen'
          Caption = 'Reset'
          TabOrder = 6
          OnClick = ScreenButtonDefaultSettingsClick
        end
        object NumberScreens: TXiTrackBar
          Left = 8
          Top = 14
          Width = 47
          Height = 28
          Hint = 'Number of screens to create (usually you want just one)'
          BackColor = 15856113
          TickColor = 7500402
          DisabledTickColor = clSilver
          SlideBorderColor = 7500402
          SlideFaceColor = clWhite
          SlideGradColor = 15395562
          DisabledSlideBorderColor = 12500670
          DisabledSlideFaceColor = 14211288
          DisabledSlideGradColor = 15263976
          DisabledThumbBorderColor = 11908533
          DisabledThumbFaceColor = 15395562
          DisabledThumbGradColor = 13619151
          ThumbBorderColor = 6381921
          ThumbFaceColor = clWhite
          ThumbGradColor = 14145495
          OverThumbBorderColor = 7631988
          OverThumbFaceColor = 13750737
          OverThumbGradColor = 9803157
          DownThumbBorderColor = 7631988
          DownThumbFaceColor = 10066329
          DownThumbGradColor = 12698049
          SmoothCorners = True
          ColorScheme = csWhite
          Max = 4
          Min = 1
          Position = 1
          TickStyle = tsAuto
          TickMarks = tmBottomRight
          Orientation = trHorizontal
        end
      end
      object MonitorProvider: TComboBox2Ex
        Left = 336
        Top = 29
        Width = 153
        Height = 21
        Hint = 'Monitor Discovery Method'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'Win32'
          'DXGI'
          'SDL')
      end
      object EnableMenuBar: TAdvOfficeCheckBoxEx
        Left = 336
        Top = 56
        Width = 120
        Height = 20
        Hint = 'Enables menu bar if available by UI implementation'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Enable Menu Bar'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object AttachWindow: TEditEx
        Left = 336
        Top = 95
        Width = 153
        Height = 23
        Hint = 'Use an existing window as the first emulation window'
        Color = clWhite
        TabOrder = 4
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 3'
      object VideoOutputModeLabel: TShadowLabel
        Left = 595
        Top = 19
        Width = 108
        Height = 16
        Caption = 'Video Output Mode'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ButtonPageVideoEffectsBGFX: TSpeedButtonEx
        Left = 16
        Top = 16
        Width = 172
        Height = 22
        GroupIndex = 2
        Caption = 'BGFX Post-Processing Effects'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = ButtonPageVideoEffectsBGFXClick
      end
      object ButtonPageVideoEffectsHLSL: TSpeedButtonEx
        Tag = 1
        Left = 188
        Top = 16
        Width = 188
        Height = 22
        GroupIndex = 2
        Down = True
        Caption = 'Direct3D Post-Processing Effects'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = ButtonPageVideoEffectsBGFXClick
      end
      object ButtonPageVideoEffectsGLSL: TSpeedButtonEx
        Tag = 2
        Left = 376
        Top = 16
        Width = 185
        Height = 22
        GroupIndex = 2
        Caption = 'OpenGL Post-Processing Effects'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = ButtonPageVideoEffectsBGFXClick
      end
      object VideoOutputMode: TComboBox2Ex
        Left = 704
        Top = 16
        Width = 129
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object VideoOutputModeButtonHelp: TBitBtnEx
        Left = 834
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Why ???'
        Caption = '?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = VideoOutputModeButtonHelpClick
      end
      object NotebookVideoPostProcessingEffectsPages: TNotebook
        Left = 16
        Top = 40
        Width = 833
        Height = 393
        PageIndex = 1
        TabOrder = 2
        object TPage
          Left = 0
          Top = 0
          Caption = 'BGFX'
          object BGFXPathLabel: TShadowLabel
            Left = 8
            Top = 56
            Width = 98
            Height = 16
            Caption = 'Path to BGFX Files'
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
          object BGFXBackendLabel: TShadowLabel
            Left = 8
            Top = 12
            Width = 84
            Height = 16
            Caption = 'Backend to Use'
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
          object BGFXShadowMaskTextureNameLabel: TShadowLabel
            Left = 8
            Top = 100
            Width = 118
            Height = 16
            Caption = 'Shadow Mask Texture'
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
          object BGFXScreenShaderChainsLabel: TShadowLabel
            Left = 8
            Top = 144
            Width = 116
            Height = 16
            Caption = 'Screen Shader Chains'
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
          object BGFXScreenShaderChainsDetailsHTMLLabel: TShadowLabel
            Left = 459
            Top = 144
            Width = 150
            Height = 16
            Hint = 
              'http://docs.mamedev.org/advanced/bgfx.html#configuration-setting' +
              's'
            Caption = '(click here for usage details)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
            OnClick = BGFXScreenShaderChainsDetailsHTMLLabelClick
            OnMouseEnter = BGFXScreenShaderChainsDetailsHTMLLabelMouseEnter
            OnMouseLeave = BGFXScreenShaderChainsDetailsHTMLLabelMouseLeave
          end
          object BGFXScreenShaderChainsHelpLabel: TShadowLabel
            Left = 126
            Top = 144
            Width = 229
            Height = 16
            Caption = 'select a shader in the list or type in edit box'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
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
          object BGFXLUTTextureNameLabel: TShadowLabel
            Left = 384
            Top = 100
            Width = 101
            Height = 16
            Caption = 'LUT Texture Name'
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
          object BGFXPath: TEditEx
            Left = 8
            Top = 72
            Width = 312
            Height = 21
            Hint = 'Path to BGFX related files'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object BGFXPathButtonSelect: TBitBtnEx
            Left = 322
            Top = 72
            Width = 43
            Height = 21
            Hint = 'Click here to select a folder'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BGFXPathButtonSelectClick
          end
          object BGFXBackend: TComboBox2Ex
            Left = 8
            Top = 28
            Width = 129
            Height = 21
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Text = 'Auto'
            Items.Strings = (
              'Auto'
              'Direct3D 9'
              'Direct3D 11'
              'OpenGL'
              'OpenGL ES')
          end
          object BGFXDebug: TAdvOfficeCheckBoxEx
            Left = 384
            Top = 10
            Width = 167
            Height = 20
            Hint = 'Debug for advance users'
            TabOrder = 3
            Alignment = taLeftJustify
            Caption = 'Enable Debugging Statistics'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object BGFXShadowMaskTextureName: TEditEx
            Left = 8
            Top = 116
            Width = 269
            Height = 21
            Hint = 'Shadow mask texture filename'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object BGFXShadowMaskTextureNameButtonSelect: TBitBtnEx
            Left = 279
            Top = 116
            Width = 43
            Height = 21
            Hint = 'Click here to select a file'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = BGFXShadowMaskTextureNameButtonSelectClick
          end
          object BGFXShadowMaskTextureNameButtonReset: TBitBtnEx
            Left = 322
            Top = 116
            Width = 43
            Height = 21
            Hint = 'Click here to set default filename'
            Caption = 'Reset'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = BGFXShadowMaskTextureNameButtonResetClick
          end
          object BGFXScreenShaderChains: TEditEx
            Left = 8
            Top = 160
            Width = 508
            Height = 21
            Hint = 
              'Comma-delimited list of screen chain JSON names (without file ex' +
              'tension), colon-delimited per-window'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
          end
          object BGFXScreenShaderChainsButtonReload: TBitBtnEx
            Left = 518
            Top = 160
            Width = 47
            Height = 21
            Hint = 'Click here to reset shader to current value'
            Caption = 'Reload'
            TabOrder = 8
            OnClick = BGFXScreenShaderChainsButtonReloadClick
          end
          object BGFXScreenShaderChainsButtonSelect: TBitBtnEx
            Left = 565
            Top = 350
            Width = 43
            Height = 21
            Hint = 'Click here to select a file'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            Visible = False
            OnClick = BGFXScreenShaderChainsButtonSelectClick
          end
          object BGFXScreenShaderChains_ListView: TEasyListview
            Left = 8
            Top = 184
            Width = 601
            Height = 164
            BackGround.Enabled = True
            CellSizes.Report.Height = 19
            Color = clWhite
            EditManager.Font.Charset = ANSI_CHARSET
            EditManager.Font.Color = clBlack
            EditManager.Font.Height = -12
            EditManager.Font.Name = 'Segoe UI'
            EditManager.Font.Style = []
            UseDockManager = False
            HintType = ehtToolTip
            Header.Columns.Items = {
              0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
              00060000008008000101000100000000000000FA000000FFFFFF1F0001000000
              01000000050000005400690074006C0065000000000000000000000000001100
              00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
              00010100000000000096000000FFFFFF1F000100000001000000040000004E00
              61006D006500000000000000000000000000110000005445617379436F6C756D
              6E53746F726564FFFECE00060000008008000101000102000000000000B40000
              00FFFFFF1F0001000000010000000600000041007500740068006F0072000000
              00000000000000000000}
            Header.Draggable = False
            Header.Height = 23
            Header.Sizeable = False
            Header.Visible = True
            IncrementalSearch.Enabled = True
            IncrementalSearch.ResetTime = 1000
            IncrementalSearch.StartType = eissFocusedNode
            PaintInfoColumn.Border = 2
            PaintInfoColumn.CaptionIndent = 0
            PaintInfoGroup.Expandable = False
            PaintInfoGroup.MarginBottom.CaptionIndent = 4
            PaintInfoItem.BorderColor = 16370824
            PaintInfoItem.ShowBorder = False
            ParentShowHint = False
            ShowHint = True
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
            Selection.RoundRectRadius = 2
            Selection.TextColor = clBlack
            Selection.UseFocusRect = False
            TabOrder = 10
            View = elsReport
            CustomCheckRadioEnabled = False
            OnDblClick = BGFXScreenShaderChains_ListViewDblClick
            OnItemCompare = BGFXScreenShaderChains_ListViewItemCompare
            OnItemPaintText = BGFXScreenShaderChains_ListViewItemPaintText
          end
          object BGFXScreenShaderChains_ListViewButtonAdd: TBitBtnEx
            Left = 56
            Top = 350
            Width = 43
            Height = 21
            Hint = 'Add selected shader to the list (for multiple screens games)'
            Caption = 'Add'
            TabOrder = 11
            OnClick = BGFXScreenShaderChains_ListViewButtonAddClick
          end
          object BGFXScreenShaderChains_ListViewButtonSelect: TBitBtnEx
            Left = 8
            Top = 350
            Width = 47
            Height = 21
            Hint = 
              'Click here to set selected shader active (mouse double-click in ' +
              'the list)'
            Caption = 'Select'
            TabOrder = 12
            OnClick = BGFXScreenShaderChains_ListViewButtonSelectClick
          end
          object BGFXScreenShaderChainsButtonReset: TBitBtnEx
            Left = 565
            Top = 160
            Width = 43
            Height = 21
            Hint = 'Click here to reset shader to default value'
            Caption = 'Reset'
            TabOrder = 13
            OnClick = BGFXScreenShaderChainsButtonResetClick
          end
          object BGFXLUTTextureName: TEditEx
            Left = 384
            Top = 116
            Width = 269
            Height = 21
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
          end
          object BGFXLUTTextureNameButtonSelect: TBitBtnEx
            Left = 655
            Top = 116
            Width = 43
            Height = 21
            Hint = 'Click here to select a file'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = BGFXLUTTextureNameButtonSelectClick
          end
          object BGFXLUTTextureNameButtonReset: TBitBtnEx
            Left = 698
            Top = 116
            Width = 43
            Height = 21
            Hint = 'Click here to set default filename (empty)'
            Caption = 'Reset'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
            OnClick = BGFXLUTTextureNameButtonResetClick
          end
        end
        object TPage
          Left = 0
          Top = 0
          HelpContext = 1
          Caption = 'Direct3D'
          object ShadowMaskTextureLabel: TShadowLabel
            Left = 8
            Top = 98
            Width = 118
            Height = 16
            Caption = 'Shadow Mask Texture'
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
          object HLSLPathLabel: TShadowLabel
            Left = 8
            Top = 54
            Width = 97
            Height = 16
            Caption = 'Path to HLSL Files'
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
          object HLSLUpscaleSnapshotXLabel: TShadowLabel
            Left = 52
            Top = 224
            Width = 10
            Height = 16
            Caption = 'X'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object HLSLUpscaleSnapshotLabel: TShadowLabel
            Left = 8
            Top = 206
            Width = 139
            Height = 16
            Caption = 'Upscaled Snap Resolution'
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
          object ShadowMaskTileModeLabel: TShadowLabel
            Left = 8
            Top = 146
            Width = 132
            Height = 16
            Caption = 'Shadow Mask Tile Mode'
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
          object HLSLEnable: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 12
            Width = 88
            Height = 20
            Hint = 'Enables HLSL post-processing (Pixel Shader 3.0 required)'
            TabOrder = 0
            OnClick = HLSLEnableClick
            Alignment = taLeftJustify
            Caption = 'Enable HLSL'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object YIQEnable: TAdvOfficeCheckBoxEx
            Left = 195
            Top = 32
            Width = 141
            Height = 20
            Hint = 
              'Enables YIQ-colorspace post-processing. Causes a performance dro' +
              'p but gives a much more authentic'#13#10'NTSC TV appearance on TV-base' +
              'd systems when configured properly'
            TabOrder = 1
            Alignment = taLeftJustify
            Caption = 'Enable YIQ Colorspace'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object ShadowMaskTexture: TEditEx
            Left = 8
            Top = 114
            Width = 269
            Height = 21
            Hint = 'A PNG that defines the shadow mask for each pixel'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
          end
          object ShadowMaskTextureButtonSelect: TBitBtnEx
            Left = 279
            Top = 114
            Width = 43
            Height = 21
            Hint = 'Click here to select a file'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = ShadowMaskTextureButtonSelectClick
          end
          object HLSLPath: TEditEx
            Left = 8
            Top = 70
            Width = 312
            Height = 21
            Hint = 'Path to the .fx files that are in use'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object HLSLPathButtonSelect: TBitBtnEx
            Left = 322
            Top = 70
            Width = 43
            Height = 21
            Hint = 'Click here to select a folder'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = HLSLPathButtonSelectClick
          end
          object ReadCustomHLSLFile: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 260
            Width = 112
            Height = 20
            Hint = 'Enable custom HLSL ini reading'
            Enabled = False
            TabOrder = 6
            Alignment = taLeftJustify
            Caption = 'Read Custom File'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object WriteCustomHLSLFile: TAdvOfficeCheckBoxEx
            Left = 124
            Top = 260
            Width = 114
            Height = 20
            Hint = 'Enable custom HLSL ini writing'
            Enabled = False
            TabOrder = 7
            Alignment = taLeftJustify
            Caption = 'Write Custom File'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object HLSLIniFile: TEditEx
            Left = 239
            Top = 259
            Width = 84
            Height = 21
            Hint = 'HLSL ini file name for this game'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            Enabled = False
            ParentCtl3D = False
            TabOrder = 8
          end
          object HLSLIniFileButtonReset: TBitBtnEx
            Left = 325
            Top = 259
            Width = 39
            Height = 21
            Hint = 'Click here to reset HLSL custom filename to default'
            Caption = 'Reset'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = HLSLIniFileButtonResetClick
          end
          object HLSLUpscaleSnapX: TEditEx
            Left = 8
            Top = 222
            Width = 41
            Height = 21
            Hint = 'Width'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnKeyPress = HLSLUpscaleSnapXKeyPress
          end
          object HLSLUpscaleSnapY: TEditEx
            Left = 62
            Top = 222
            Width = 41
            Height = 21
            Hint = 'Height'
            AutoSize = False
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnKeyPress = HLSLUpscaleSnapYKeyPress
          end
          object HLSLUpscaleSnapButtonReset: TBitBtnEx
            Left = 113
            Top = 222
            Width = 43
            Height = 21
            Hint = 'Click here to set default upscale resolution'
            Caption = 'Reset'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnClick = HLSLUpscaleSnapButtonResetClick
          end
          object HLSLOversampling: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 32
            Width = 162
            Height = 20
            Hint = 
              'Render the image in a resolution twice as high, which can help t' +
              'o reduces moir'#233'-effects'
            TabOrder = 13
            Alignment = taLeftJustify
            Caption = 'Enable HLSL Oversampling'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object ShadowMaskTileMode: TComboBox2Ex
            Left = 8
            Top = 162
            Width = 129
            Height = 21
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            Text = 'Screen Based'
            Items.Strings = (
              'Screen Based'
              'Source Based')
          end
          object ShadowMaskTextureButtonReset: TBitBtnEx
            Left = 323
            Top = 114
            Width = 43
            Height = 21
            Hint = 'Click here to set default filename'
            Caption = 'Reset'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = ShadowMaskTextureButtonResetClick
          end
          object VectorPostProcessingGroupBox: TAdvGroupBoxEx
            Left = 432
            Top = 54
            Width = 330
            Height = 107
            CheckBox.CustomIconsEnabled = False
            RoundEdges = True
            Caption = 'Vector Post-Processing'
            Ctl3D = True
            Enabled = False
            TabOrder = 16
            object VectorBeamSmoothLabel: TShadowLabel
              Left = 8
              Top = 20
              Width = 119
              Height = 15
              Hint = 'Beam Smooth [%1.2f]'
              AutoSize = False
              Caption = 'Beam Smooth [0.00]'
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
            object VectorMaximumAttenuationLabel: TShadowLabel
              Left = 169
              Top = 20
              Width = 156
              Height = 15
              Hint = 'Maximum Attenuation [%1.2f]'
              AutoSize = False
              Caption = 'Maximum Attenuation [0.50]'
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
            object VectorMinimumLengthAttenuationLabel: TShadowLabel
              Left = 8
              Top = 63
              Width = 203
              Height = 15
              Hint = 'Minimum Attenuation Length [%1.3f]'
              AutoSize = False
              Caption = 'Minimum Attenuation Length [0.500]'
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
            object VectorBeamSmooth: TGaugeBar2
              Left = 8
              Top = 36
              Width = 153
              Height = 20
              Hint = 'The vector beam smoothness'
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.100000001490116100
              Max = 1.000000000000000000
              ShowHandleGrip = True
              SmallChange = 0.009999999776482582
              OnChange = VectorBeamSmoothChange
            end
            object VectorMaximumAttenuation: TGaugeBar2
              Left = 169
              Top = 36
              Width = 153
              Height = 20
              Hint = 'The maximum vector attenuation'
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.100000001490116100
              Max = 1.000000000000000000
              ShowHandleGrip = True
              SmallChange = 0.009999999776482582
              Position = 0.500000000000000000
              OnChange = VectorMaximumAttenuationChange
            end
            object VectorMinimumLengthAttenuation: TGaugeBar2
              Left = 8
              Top = 79
              Width = 313
              Height = 20
              Hint = 
                'The minimum vector length (vector length to screen size ratio) t' +
                'hat is affected by the attenuation'
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.009999999776482582
              Max = 1.000000000000000000
              Min = 0.001000000047497451
              ThreeDecimalDigits = True
              ShowHandleGrip = True
              SmallChange = 0.001000000047497451
              Position = 0.500000000000000000
              OnChange = VectorMinimumLengthAttenuationChange
            end
          end
          object HLSLBloomPostProcessingGroupBox: TAdvGroupBoxEx
            Left = 432
            Top = 192
            Width = 329
            Height = 161
            CheckBox.CustomIconsEnabled = False
            RoundEdges = True
            Caption = 'Bloom Post-Processing'
            Ctl3D = True
            TabOrder = 17
            object BloomBlendModeLabel: TShadowLabel
              Left = 8
              Top = 20
              Width = 105
              Height = 16
              Caption = 'Bloom Blend Mode'
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
            object BloomBlendMode: TComboBox2Ex
              Left = 8
              Top = 36
              Width = 129
              Height = 21
              Style = csDropDownList
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Brighten'
              Items.Strings = (
                'Brighten'
                'Darken')
            end
            object BloomLUTTextureScreen: TEditEx
              Left = 8
              Top = 84
              Width = 222
              Height = 21
              Hint = '3D LUT texture filename for screen'
              AutoSize = False
              Color = clWhite
              Ctl3D = True
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BloomLUTTextureScreenButtonSelect: TBitBtnEx
              Left = 232
              Top = 84
              Width = 43
              Height = 21
              Hint = 'Click here to select a file'
              Caption = 'Select'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BloomLUTTextureScreenButtonSelectClick
            end
            object BloomLUTTextureScreenButtonReset: TBitBtnEx
              Left = 276
              Top = 84
              Width = 43
              Height = 21
              Hint = 'Click here to set default filename (empty)'
              Caption = 'Reset'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BloomLUTTextureScreenButtonResetClick
            end
            object BloomLUTEnabled: TAdvOfficeCheckBoxEx
              Left = 8
              Top = 64
              Width = 162
              Height = 20
              Hint = 'Enables 3D LUT to be applied to screen after post-processing'
              TabOrder = 4
              Alignment = taLeftJustify
              Caption = 'Enable Screen LUT Texture'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
            end
            object BloomLOOTUIEnabled: TAdvOfficeCheckBoxEx
              Left = 8
              Top = 112
              Width = 191
              Height = 20
              Hint = 
                'Enables 3D LUT to be applied to UI and artwork after post-proces' +
                'sing'
              TabOrder = 5
              Alignment = taLeftJustify
              Caption = 'Enable UI / Artwork LUT Texture'
              ReturnIsTab = False
              Themed = True
              CustomIconsEnabled = False
            end
            object BloomLUTTextureUI: TEditEx
              Left = 8
              Top = 132
              Width = 222
              Height = 21
              Hint = '3D LUT texture filename of UI'
              AutoSize = False
              Color = clWhite
              Ctl3D = True
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object BloomLUTTextureUIButtonSelect: TBitBtnEx
              Left = 232
              Top = 132
              Width = 43
              Height = 21
              Hint = 'Click here to select a file'
              Caption = 'Select'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BloomLUTTextureUIButtonSelectClick
            end
            object BloomLUTTextureUIButtonReset: TBitBtnEx
              Left = 276
              Top = 132
              Width = 43
              Height = 21
              Hint = 'Click here to set default filename (empty)'
              Caption = 'Reset'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              OnClick = BloomLUTTextureUIButtonResetClick
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          HelpContext = 2
          Caption = 'OpenGL'
          object EnableOpenGLFilterNotFFLabel: TShadowLabel
            Left = 253
            Top = 50
            Width = 229
            Height = 17
            Caption = 'Checked: Bilinear (Default); Unchecked: Plain'
            Font.Charset = ANSI_CHARSET
            Font.Color = 10900224
            Font.Height = -11
            Font.Name = 'Trebuchet MS'
            Font.Style = []
            ParentFont = False
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
          object GLSL_Shader_MAMELabel: TShadowLabel
            Left = 18
            Top = 76
            Width = 194
            Height = 14
            Caption = 'Custom OpenGL GLSL Shader Set MAME'
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
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_ScreenLabel: TShadowLabel
            Left = 239
            Top = 76
            Width = 179
            Height = 14
            Caption = 'Custom OpenGL GLSL Shader Screen'
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
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen0Label: TShadowLabel
            Left = 230
            Top = 95
            Width = 9
            Height = 16
            Caption = '0'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen1Label: TShadowLabel
            Left = 230
            Top = 117
            Width = 9
            Height = 16
            Caption = '1'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen2Label: TShadowLabel
            Left = 230
            Top = 139
            Width = 9
            Height = 16
            Caption = '2'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen3Label: TShadowLabel
            Left = 230
            Top = 161
            Width = 9
            Height = 16
            Caption = '3'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen4Label: TShadowLabel
            Left = 230
            Top = 183
            Width = 9
            Height = 16
            Caption = '4'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen5Label: TShadowLabel
            Left = 230
            Top = 205
            Width = 9
            Height = 16
            Caption = '5'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen6Label: TShadowLabel
            Left = 230
            Top = 227
            Width = 9
            Height = 16
            Caption = '6'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen7Label: TShadowLabel
            Left = 230
            Top = 249
            Width = 9
            Height = 16
            Caption = '7'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen8Label: TShadowLabel
            Left = 230
            Top = 271
            Width = 9
            Height = 16
            Caption = '8'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_Screen9Label: TShadowLabel
            Left = 230
            Top = 293
            Width = 9
            Height = 16
            Caption = '9'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME0Label: TShadowLabel
            Left = 8
            Top = 95
            Width = 9
            Height = 16
            Caption = '0'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME1Label: TShadowLabel
            Left = 8
            Top = 117
            Width = 9
            Height = 16
            Caption = '1'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME2Label: TShadowLabel
            Left = 8
            Top = 139
            Width = 9
            Height = 16
            Caption = '2'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME3Label: TShadowLabel
            Left = 8
            Top = 161
            Width = 9
            Height = 16
            Caption = '3'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME4Label: TShadowLabel
            Left = 8
            Top = 183
            Width = 9
            Height = 16
            Caption = '4'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME5Label: TShadowLabel
            Left = 8
            Top = 205
            Width = 9
            Height = 16
            Caption = '5'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME6Label: TShadowLabel
            Left = 8
            Top = 227
            Width = 9
            Height = 16
            Caption = '6'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME7Label: TShadowLabel
            Left = 8
            Top = 249
            Width = 9
            Height = 16
            Caption = '7'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME8Label: TShadowLabel
            Left = 8
            Top = 271
            Width = 9
            Height = 16
            Caption = '8'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object GLSL_Shader_MAME9Label: TShadowLabel
            Left = 8
            Top = 293
            Width = 9
            Height = 16
            Caption = '9'
            ShowAccelChar = False
            ShadowColor = clGray
            ShadowEnabled = False
            EllipsType = etNone
            ColorFrame = clBlack
            ColorInnerFrame = clBlack
            Frames = []
            Transparent = True
          end
          object OpenGLForcePowerTwoTextures: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 32
            Width = 172
            Height = 20
            Hint = 
              'Always use only power-of-2 sized textures'#13#10'Can cause graphic cor' +
              'ruption on recent video cards!'
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = 'Force Power of Two Textures'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object OpenGLDisableUseGL_ARBTextureRectangle: TAdvOfficeCheckBoxEx
            Left = 235
            Top = 12
            Width = 214
            Height = 20
            Hint = 'Can cause graphic corruption on recent video cards!'
            TabOrder = 1
            Alignment = taLeftJustify
            Caption = 'Don'#39't Use GL_ARB Texture Rectangle'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object EnableOpenGL_VBO: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 52
            Width = 81
            Height = 20
            Hint = 'Enable OpenGL VBO, if available'
            Checked = True
            TabOrder = 2
            Alignment = taLeftJustify
            Caption = 'Enable VBO'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
          end
          object EnableOpenGL_PBO: TAdvOfficeCheckBoxEx
            Left = 132
            Top = 52
            Width = 82
            Height = 20
            Hint = 'Enable OpenGL PBO, if available'
            Checked = True
            TabOrder = 3
            Alignment = taLeftJustify
            Caption = 'Enable PBO'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
          end
          object EnableGLSL: TAdvOfficeCheckBoxEx
            Left = 8
            Top = 12
            Width = 89
            Height = 20
            Hint = 'Enable OpenGL GLSL, if available'
            TabOrder = 4
            OnClick = EnableGLSLClick
            Alignment = taLeftJustify
            Caption = 'Enable GLSL'
            ReturnIsTab = False
            Themed = True
            CustomIconsEnabled = False
          end
          object EnableOpenGLFilterNotFF: TAdvOfficeCheckBoxEx
            Left = 235
            Top = 32
            Width = 214
            Height = 18
            Checked = True
            TabOrder = 5
            Alignment = taLeftJustify
            Caption = 'Use OpenGL Filter Instead of FF Filter'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
            CustomIconsEnabled = False
          end
          object GLSL_Shader_Screen0: TEditEx
            Left = 239
            Top = 92
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 6
          end
          object GLSL_Shader_Screen0ButtonSelect: TBitBtnEx
            Left = 421
            Top = 92
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = GLSL_Shader_Screen0ButtonSelectClick
          end
          object GLSL_Shader_Screen1: TEditEx
            Left = 239
            Top = 114
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 8
          end
          object GLSL_Shader_Screen1ButtonSelect: TBitBtnEx
            Left = 421
            Top = 114
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = GLSL_Shader_Screen1ButtonSelectClick
          end
          object GLSL_Shader_Screen2: TEditEx
            Left = 239
            Top = 136
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 10
          end
          object GLSL_Shader_Screen2ButtonSelect: TBitBtnEx
            Left = 421
            Top = 136
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = GLSL_Shader_Screen2ButtonSelectClick
          end
          object GLSL_Shader_Screen3: TEditEx
            Left = 239
            Top = 158
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 12
          end
          object GLSL_Shader_Screen3ButtonSelect: TBitBtnEx
            Left = 421
            Top = 158
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnClick = GLSL_Shader_Screen3ButtonSelectClick
          end
          object GLSL_Shader_Screen4: TEditEx
            Left = 239
            Top = 180
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 14
          end
          object GLSL_Shader_Screen4ButtonSelect: TBitBtnEx
            Left = 421
            Top = 180
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = GLSL_Shader_Screen4ButtonSelectClick
          end
          object GLSL_Shader_Screen5: TEditEx
            Left = 239
            Top = 202
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 16
          end
          object GLSL_Shader_Screen5ButtonSelect: TBitBtnEx
            Left = 421
            Top = 202
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            OnClick = GLSL_Shader_Screen5ButtonSelectClick
          end
          object GLSL_Shader_Screen6: TEditEx
            Left = 239
            Top = 224
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 18
          end
          object GLSL_Shader_Screen6ButtonSelect: TBitBtnEx
            Left = 421
            Top = 224
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
            OnClick = GLSL_Shader_Screen6ButtonSelectClick
          end
          object GLSL_Shader_Screen7: TEditEx
            Left = 239
            Top = 246
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 20
          end
          object GLSL_Shader_Screen7ButtonSelect: TBitBtnEx
            Left = 421
            Top = 246
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = GLSL_Shader_Screen7ButtonSelectClick
          end
          object GLSL_Shader_Screen8: TEditEx
            Left = 239
            Top = 268
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 22
          end
          object GLSL_Shader_Screen8ButtonSelect: TBitBtnEx
            Left = 421
            Top = 268
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 23
            OnClick = GLSL_Shader_Screen8ButtonSelectClick
          end
          object GLSL_Shader_Screen9: TEditEx
            Left = 239
            Top = 290
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 24
          end
          object GLSL_Shader_Screen9ButtonSelect: TBitBtnEx
            Left = 421
            Top = 290
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 25
            OnClick = GLSL_Shader_Screen9ButtonSelectClick
          end
          object GLSL_Shader_MAME0: TEditEx
            Left = 17
            Top = 92
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 26
          end
          object GLSL_Shader_MAME0ButtonSelect: TBitBtnEx
            Left = 199
            Top = 92
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 27
            OnClick = GLSL_Shader_MAME0ButtonSelectClick
          end
          object GLSL_Shader_MAME1: TEditEx
            Left = 17
            Top = 114
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 28
          end
          object GLSL_Shader_MAME1ButtonSelect: TBitBtnEx
            Left = 199
            Top = 114
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 29
            OnClick = GLSL_Shader_MAME1ButtonSelectClick
          end
          object GLSL_Shader_MAME2: TEditEx
            Left = 17
            Top = 136
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 30
          end
          object GLSL_Shader_MAME2ButtonSelect: TBitBtnEx
            Left = 199
            Top = 136
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 31
            OnClick = GLSL_Shader_MAME2ButtonSelectClick
          end
          object GLSL_Shader_MAME3: TEditEx
            Left = 17
            Top = 158
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 32
          end
          object GLSL_Shader_MAME3ButtonSelect: TBitBtnEx
            Left = 199
            Top = 158
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = GLSL_Shader_MAME3ButtonSelectClick
          end
          object GLSL_Shader_MAME4: TEditEx
            Left = 17
            Top = 180
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 34
          end
          object GLSL_Shader_MAME4ButtonSelect: TBitBtnEx
            Left = 199
            Top = 180
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 35
            OnClick = GLSL_Shader_MAME4ButtonSelectClick
          end
          object GLSL_Shader_MAME5: TEditEx
            Left = 17
            Top = 202
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 36
          end
          object GLSL_Shader_MAME5ButtonSelect: TBitBtnEx
            Left = 199
            Top = 202
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 37
            OnClick = GLSL_Shader_MAME5ButtonSelectClick
          end
          object GLSL_Shader_MAME6: TEditEx
            Left = 17
            Top = 224
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 38
          end
          object GLSL_Shader_MAME6ButtonSelect: TBitBtnEx
            Left = 199
            Top = 224
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = GLSL_Shader_MAME6ButtonSelectClick
          end
          object GLSL_Shader_MAME7: TEditEx
            Left = 17
            Top = 246
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 40
          end
          object GLSL_Shader_MAME7ButtonSelect: TBitBtnEx
            Left = 199
            Top = 246
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 41
            OnClick = GLSL_Shader_MAME7ButtonSelectClick
          end
          object GLSL_Shader_MAME8: TEditEx
            Left = 17
            Top = 268
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 42
          end
          object GLSL_Shader_MAME8ButtonSelect: TBitBtnEx
            Left = 199
            Top = 268
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 43
            OnClick = GLSL_Shader_MAME8ButtonSelectClick
          end
          object GLSL_Shader_MAME9: TEditEx
            Left = 17
            Top = 290
            Width = 180
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 44
          end
          object GLSL_Shader_MAME9ButtonSelect: TBitBtnEx
            Left = 199
            Top = 290
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 45
            OnClick = GLSL_Shader_MAME9ButtonSelectClick
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'LUA'
      object LUAPluginsToEnableLabel: TShadowLabel
        Left = 16
        Top = 35
        Width = 154
        Height = 16
        Caption = 'List of LUA Plugins to Enable'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LUAPluginsToEnable2Label: TShadowLabel
        Left = 171
        Top = 35
        Width = 119
        Height = 16
        Caption = '(check plugins to use)'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object AutobootGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 289
        Width = 297
        Height = 152
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Auto-boot (LUA Scripts)'
        Ctl3D = True
        Enabled = False
        TabOrder = 0
        object AutobootCommandLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 209
          Height = 16
          Caption = 'Execute Command After Machine Boot'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object AutobootDelayLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 124
          Height = 16
          Hint = 'Delay Timer [%s]'
          HelpType = htKeyword
          HelpKeyword = 'sec'
          Caption = 'Delay Timer [00:00 sec]'
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
        object AutobootLuaScriptLabel: TShadowLabel
          Left = 8
          Top = 107
          Width = 221
          Height = 16
          Hint = 'Delay Timer [%u sec]'
          Caption = 'LUA Script to Execute After Machine Boot'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object AutobootCommand: TEditEx
          Left = 8
          Top = 36
          Width = 236
          Height = 21
          Hint = 'Command to execute after machine boot'
          AutoSize = False
          Color = clWhite
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object AutobootDelay: TGaugeBar
          Left = 8
          Top = 80
          Width = 281
          Height = 20
          Hint = 'Delay before executing autoboot command'
          Color = clWhite
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 5
          Max = 180
          ShowHandleGrip = True
          Position = 0
          OnChange = AutobootDelayChange
        end
        object AutobootLuaScript: TEditEx
          Left = 8
          Top = 123
          Width = 236
          Height = 21
          Hint = 'Script for debugger'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object AutobootLuaScriptSelectButton: TBitBtnEx
          Left = 246
          Top = 123
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = AutobootLuaScriptSelectButtonClick
        end
        object AutobootCommandButtonClear: TBitBtnEx
          Left = 246
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Click here to clear the parameters'
          Caption = 'Clear'
          TabOrder = 4
          OnClick = AutobootCommandButtonClearClick
        end
      end
      object EnableEmulatorLUAConsole: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 268
        Width = 179
        Height = 20
        Hint = 
          'Start emulator with LUA console enabled'#13#10'For MAME v0.154 and new' +
          'er'
        Enabled = False
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Enable Emulator LUA Console'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object EnableLUAPluginSupport: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 13
        Width = 163
        Height = 20
        Checked = True
        Enabled = False
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Enable LUA Plugin Support'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object LUAPluginsToEnable: TEasyListview
        Left = 16
        Top = 51
        Width = 601
        Height = 164
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        Enabled = False
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000000E6000000FFFFFF1F0001000000
          01000000050000005400690074006C0065000000000000000000000000001100
          00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
          00010100000000000064000000FFFFFF1F000100000001000000040000004E00
          61006D006500000000000000000000000000110000005445617379436F6C756D
          6E53746F726564FFFECE00060000008008000101000102000000000000460000
          00FFFFFF1F00010000000100000007000000560065007200730069006F006E00
          000000000000000000000000110000005445617379436F6C756D6E53746F7265
          64FFFECE00060000008008000101000103000000000000B4000000FFFFFF1F00
          01000000010000000600000041007500740068006F0072000000000000000000
          00000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        PaintInfoColumn.Border = 2
        PaintInfoColumn.CaptionIndent = 0
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.CheckType = ectBox
        PaintInfoItem.ShowBorder = False
        ParentShowHint = False
        ShowHint = True
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
        TabOrder = 3
        View = elsReport
        CustomCheckRadioEnabled = False
      end
      object AudioGroupBox: TAdvGroupBoxEx
        Left = 632
        Top = 65
        Width = 222
        Height = 152
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        ShadowColor = clSilver
        Caption = 'Audio'
        ParentCtl3D = True
        TabOrder = 4
        object AudioLatencyLabel: TShadowLabel
          Left = 95
          Top = 107
          Width = 79
          Height = 16
          Caption = 'Audio Latency'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SampleRateLabel: TShadowLabel
          Left = 8
          Top = 107
          Width = 68
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
          Top = 64
          Width = 141
          Height = 16
          Hint = 'Volume Attenuation [%ddB]'
          Caption = 'Volume Attenuation [0dB]'
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
        object SoundOutputMethodLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 112
          Height = 16
          Caption = 'Sound Output Mode'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Samples: TAdvOfficeCheckBoxEx
          Left = 130
          Top = 36
          Width = 87
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
        end
        object AudioLatency: TComboBox2Ex
          Left = 95
          Top = 123
          Width = 81
          Height = 21
          Hint = 
            'Set audio latency (increase to reduce glitches, decrease for res' +
            'ponsiveness)'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '2/5'
          Items.Strings = (
            '1/5'
            '2/5'
            '3/5'
            '4/5'
            '5/5')
        end
        object SampleRate: TComboBox2Ex
          Left = 8
          Top = 123
          Width = 80
          Height = 21
          Hint = 'Set sound output sample rate'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
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
          Top = 80
          Width = 150
          Height = 20
          Hint = 'Sound volume in decibels (-32 -> low, 0 -> normal)'
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
        object AudioLatencyButtonReset: TBitBtnEx
          Left = 177
          Top = 123
          Width = 38
          Height = 21
          Hint = 'Set default latency'
          Caption = 'Reset'
          TabOrder = 4
          OnClick = AudioLatencyButtonResetClick
        end
        object SoundOutputMethod: TComboBox2Ex
          Left = 8
          Top = 36
          Width = 115
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'DirectSound'
            'XAudio2 (Win8+)'
            'SDL'
            'PortAudio'
            'None')
        end
      end
      object PortAudioSettingsGroupBox: TAdvGroupBoxEx
        Left = 632
        Top = 240
        Width = 222
        Height = 153
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'PortAudio Settings'
        Ctl3D = True
        TabOrder = 5
        object PortAudioAPILabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 21
          Height = 16
          Caption = 'API'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object PortAudioDeviceLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 38
          Height = 16
          Caption = 'Device'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object PortAudioLatencyLabel: TShadowLabel
          Left = 8
          Top = 107
          Width = 106
          Height = 16
          Caption = 'Latency, in seconds'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object PortAudioAPIButtonClear: TBitBtnEx
          Left = 172
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Click here to set API to "none"'
          Caption = 'Clear'
          TabOrder = 0
        end
        object PortAudioAPI: TEditEx
          Left = 8
          Top = 36
          Width = 161
          Height = 21
          AutoSize = False
          Color = clWhite
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
        end
        object PortAudioDevice: TEditEx
          Left = 8
          Top = 80
          Width = 161
          Height = 21
          AutoSize = False
          Color = clWhite
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object PortAudioDeviceButtonClear: TBitBtnEx
          Left = 172
          Top = 80
          Width = 43
          Height = 21
          Hint = 'Click here to set Device to "none"'
          Caption = 'Clear'
          TabOrder = 3
        end
        object PortAudioLatency: TEditEx
          Left = 8
          Top = 124
          Width = 161
          Height = 21
          AutoSize = False
          Color = clWhite
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnKeyPress = PortAudioLatencyKeyPress
        end
        object PortAudioLatencyButtonReset: TBitBtnEx
          Left = 172
          Top = 124
          Width = 43
          Height = 21
          Hint = 'Click here to set default value'
          Caption = 'Reset'
          TabOrder = 5
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Input'
      object CoinImpulseLabel: TShadowLabel
        Left = 168
        Top = 120
        Width = 103
        Height = 16
        Caption = 'Coin Impulse Time'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object ControllerDefinitionsLabel: TShadowLabel
        Left = 16
        Top = 120
        Width = 116
        Height = 16
        Caption = 'Controller Definitions'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object RecordInputTimecodeFileLabel: TShadowLabel
        Left = 32
        Top = 397
        Width = 140
        Height = 19
        Caption = '(used with record input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object ExitAfterInputPlaybackLabel: TShadowLabel
        Left = 232
        Top = 397
        Width = 150
        Height = 19
        Caption = '(used with playback input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
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
      object MultiKeyboard: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 52
        Width = 105
        Height = 20
        Hint = 'Enable separate input from each keyboard device (if present)'
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Mutli-Keyboard'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object Mouse: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 12
        Width = 65
        Height = 20
        Hint = 'Enable mouse input'
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Mouse'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object MultiMouse: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 32
        Width = 89
        Height = 20
        Hint = 'Enable separate input from each mouse device (if present)'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Multi-Mouse'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object LightGun: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 12
        Width = 73
        Height = 20
        Hint = 'Enable lightgun input'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Light Gun'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DualLightGun: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 32
        Width = 100
        Height = 20
        Hint = 'Enable dual lightgun input'
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Dual Light Gun'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object LightGunOffScreenReload: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 52
        Width = 121
        Height = 20
        Hint = 'Convert lightgun button 2 into offscreen reload'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Off-Screen Reload'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object NaturalKeyboard: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 72
        Width = 113
        Height = 20
        Hint = 'Specifies whether to use a natural keyboard mode or not'
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Natural Keyboard'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object SteadyKey: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 72
        Width = 81
        Height = 20
        Hint = 'Use a different handling for multiple keys presses at once'
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'Steady Key'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object CoinLockout: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 92
        Width = 97
        Height = 20
        Hint = 'Ignore coin inputs if coin lockout output is active'
        Checked = True
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Coin Lockout'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object UIMouse: TAdvOfficeCheckBoxEx
        Left = 564
        Top = 323
        Width = 212
        Height = 20
        Hint = 
          'Displays a mouse cursor when using the built-in user interface f' +
          'or MAME'
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Display User Interface Mouse Cursor'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object JoystickGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 163
        Width = 297
        Height = 85
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Joystick'
        ParentCtl3D = True
        TabOrder = 10
        object JoystickDeadzoneLabel: TShadowLabel
          Left = 8
          Top = 42
          Width = 136
          Height = 15
          Hint = 'Joystick Deadzone [%1.2f]'
          AutoSize = False
          Caption = 'Joystick Deadzone [0.30]'
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
        object JoystickSaturationLabel: TShadowLabel
          Left = 152
          Top = 42
          Width = 136
          Height = 15
          Hint = 'Joystick Saturation [%1.2f]'
          AutoSize = False
          Caption = 'Joystick Saturation [0.85]'
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
        object JoystickDeadzone: TGaugeBar2
          Left = 8
          Top = 58
          Width = 137
          Height = 20
          Hint = 
            'Center deadzone range for joystick where change is ignored (0.0 ' +
            'center, 1.0 end)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.300000011920929000
          OnChange = JoystickDeadzoneChange
        end
        object Joystick: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 125
          Height = 20
          Hint = 'Enable joystick input'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Enable Joystick'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object JoystickContradictory: TAdvOfficeCheckBoxEx
          Left = 151
          Top = 20
          Width = 138
          Height = 20
          Hint = 
            'Enable contradictory direction digital joystick input at the sam' +
            'e time (left/right, up/down)'
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Joystick Contradictory'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object JoystickSaturation: TGaugeBar2
          Left = 152
          Top = 58
          Width = 137
          Height = 20
          Hint = 
            'End of axis saturation range for joystick where change is ignore' +
            'd (0.0 center, 1.0 end)'
          Backgnd = bgPattern
          ButtonSize = 12
          LargeChange = 0.100000001490116100
          Max = 1.000000000000000000
          ShowHandleGrip = True
          SmallChange = 0.050000000745058060
          Position = 0.850000023841857900
          OnChange = JoystickSaturationChange
        end
      end
      object AnalogSettingsGroupBox: TAdvGroupBoxEx
        Left = 562
        Top = 12
        Width = 289
        Height = 197
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Automatic Device Selection [Analog Controls]'
        ParentCtl3D = True
        TabOrder = 11
        object Analog_PaddleLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 39
          Height = 16
          Caption = 'Paddle'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_JoystickLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 85
          Height = 16
          Caption = 'Analog Joystick'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_LightGunLabel: TShadowLabel
          Left = 152
          Top = 108
          Width = 55
          Height = 16
          Caption = 'Light Gun'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_PedalLabel: TShadowLabel
          Left = 152
          Top = 20
          Width = 32
          Height = 16
          Caption = 'Pedal'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_DialLabel: TShadowLabel
          Left = 152
          Top = 64
          Width = 23
          Height = 16
          Caption = 'Dial'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_TrackballLabel: TShadowLabel
          Left = 152
          Top = 152
          Width = 51
          Height = 16
          Caption = 'Trackball'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_PositionalLabel: TShadowLabel
          Left = 8
          Top = 108
          Width = 55
          Height = 16
          Caption = 'Positional'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_MouseLabel: TShadowLabel
          Left = 8
          Top = 152
          Width = 39
          Height = 16
          Caption = 'Mouse'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Analog_Paddle: TComboBox2Ex
          Left = 8
          Top = 36
          Width = 129
          Height = 21
          Hint = 'Enable it if a paddle control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Joystick: TComboBox2Ex
          Left = 8
          Top = 80
          Width = 129
          Height = 21
          Hint = 'Enable it if an analog joystick control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_LightGun: TComboBox2Ex
          Left = 152
          Top = 124
          Width = 129
          Height = 21
          Hint = 'Enable it if a lightgun control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Pedal: TComboBox2Ex
          Left = 152
          Top = 36
          Width = 129
          Height = 21
          Hint = 'Enable it if a pedal control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Dial: TComboBox2Ex
          Left = 152
          Top = 80
          Width = 129
          Height = 21
          Hint = 'Enable it if a dial control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Trackball: TComboBox2Ex
          Left = 152
          Top = 168
          Width = 129
          Height = 21
          Hint = 'Enable it if a trackball control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Positional: TComboBox2Ex
          Left = 8
          Top = 124
          Width = 129
          Height = 21
          Hint = 'Enable it if a positional control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'Keyboard'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
        object Analog_Mouse: TComboBox2Ex
          Left = 8
          Top = 168
          Width = 129
          Height = 21
          Hint = 'Enable it if a mouse control is present'
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 2
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Text = 'Mouse'
          Items.Strings = (
            'None'
            'Keyboard'
            'Mouse'
            'Joystick'
            'Lightgun')
        end
      end
      object UIActive: TAdvOfficeCheckBoxEx
        Left = 564
        Top = 303
        Width = 272
        Height = 20
        Hint = 
          'Enable access to the built-in user interface in MAME on top of e' +
          'mulated keyboard'
        TabOrder = 12
        Alignment = taLeftJustify
        Caption = 'Enable Partial Keyboard Emulation (UI Enabled)'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object CoinImpulse: TComboBox2Ex
        Left = 168
        Top = 136
        Width = 145
        Height = 21
        Hint = 'Set coin impulse time'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Text = 'Obbey Driver'
        Items.Strings = (
          'Disabled'
          'Obbey Driver'
          '1 second'
          '2 seconds'
          '3 seconds'
          '4 seconds'
          '5 seconds'
          '6 seconds'
          '7 seconds'
          '8 seconds'
          '9 seconds'
          '10 seconds')
      end
      object ControllerDefinitions: TComboBox2Ex
        Left = 16
        Top = 136
        Width = 145
        Height = 21
        Hint = 'Pre-configure for specified controller'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = '(None)'
        Items.Strings = (
          '(None)')
      end
      object HTTPServer: TAdvGroupBoxEx
        Left = 562
        Top = 372
        Width = 289
        Height = 65
        CheckBox.Action = caNone
        CheckBox.Hint = 'Enable local http server'
        CheckBox.Visible = True
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Enable HTTP Server'
        ParentCtl3D = True
        TabOrder = 15
        object HTTPPortLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 25
          Height = 16
          Caption = 'Port'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object HTTPPathLabel: TShadowLabel
          Left = 56
          Top = 20
          Width = 122
          Height = 16
          Caption = 'Root Path to Web Files'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object HTTPPort: TEditEx
          Left = 8
          Top = 36
          Width = 45
          Height = 21
          Hint = 'HTTP server listener port'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = HTTPPortKeyPress
        end
        object HTTPPath: TEditEx
          Left = 57
          Top = 36
          Width = 178
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
        end
        object HTTPServerButtonReset: TBitBtnEx
          Left = 238
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Reset to default values'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = HTTPServerButtonResetClick
        end
      end
      object UIModeGroupBox: TAdvGroupBoxEx
        Left = 562
        Top = 224
        Width = 289
        Height = 69
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Full Keyboard Emulation (User Interface Disabled)'
        ParentCtl3D = True
        TabOrder = 16
        object UIModeKeyCustomLabel: TShadowLabel
          Left = 8
          Top = 24
          Width = 69
          Height = 16
          Caption = 'ON/OFF Key'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object UIModeKeyCustom: TEditEx
          Left = 8
          Top = 40
          Width = 273
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object UIModeKeyButtonDetectKey: TBitBtnEx
          Left = 122
          Top = 18
          Width = 21
          Height = 21
          Hint = 'Click here to select a hot-key'
          Caption = '...'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          Visible = False
          OnClick = UIModeKeyButtonDetectKeyClick
        end
      end
      object CommOptionsGroupBox: TAdvGroupBoxEx
        Left = 328
        Top = 12
        Width = 219
        Height = 236
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Comm Options'
        Ctl3D = True
        TabOrder = 17
        object CommLocalHostLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 131
          Height = 16
          Caption = 'Local Address to Bind to'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object CommLocalPortLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 111
          Height = 16
          Caption = 'Local Port to Bind to'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object CommRemoteHostLabel: TShadowLabel
          Left = 8
          Top = 108
          Width = 131
          Height = 16
          Caption = 'Local Address to Bind to'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object CommRemotePortLabel: TShadowLabel
          Left = 8
          Top = 152
          Width = 111
          Height = 16
          Caption = 'Local Port to Bind to'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
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
        object CommLocalHost: TEditEx
          Left = 8
          Top = 36
          Width = 157
          Height = 21
          Hint = '0.0.0.0'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnKeyPress = CommLocalHostKeyPress
        end
        object CommLocalPort: TEditEx
          Left = 8
          Top = 80
          Width = 157
          Height = 21
          Hint = '15112'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnKeyPress = CommLocalPortKeyPress
        end
        object CommRemoteHost: TEditEx
          Left = 8
          Top = 124
          Width = 157
          Height = 21
          Hint = '127.0.0.1'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          OnKeyPress = CommLocalHostKeyPress
        end
        object CommRemotePort: TEditEx
          Left = 8
          Top = 168
          Width = 157
          Height = 21
          Hint = '15112'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnKeyPress = CommLocalPortKeyPress
        end
        object CommLocalHostButtonReset: TBitBtnEx
          Left = 168
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Reset to default address'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = CommLocalHostButtonResetClick
        end
        object CommLocalPortButtonReset: TBitBtnEx
          Left = 168
          Top = 80
          Width = 43
          Height = 21
          Hint = 'Reset to default port'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = CommLocalPortButtonResetClick
        end
        object CommRemoteHostButtonReset: TBitBtnEx
          Left = 168
          Top = 124
          Width = 43
          Height = 21
          Hint = 'Reset to default address'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = CommRemoteHostButtonResetClick
        end
        object CommRemotePortButtonReset: TBitBtnEx
          Left = 168
          Top = 168
          Width = 43
          Height = 21
          Hint = 'Reset to default port'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = CommRemotePortButtonResetClick
        end
        object CommSyncFrame: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 200
          Width = 120
          Height = 20
          TabOrder = 8
          Alignment = taLeftJustify
          Caption = 'Syncronize Frames'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
      end
      object EnableGlobalInputs: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 92
        Width = 128
        Height = 20
        Hint = 'Read inputs even when the MAME window is not in focus'
        TabOrder = 18
        Alignment = taLeftJustify
        Caption = 'Enable Global Inputs'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object RecordInputTimecodeFile: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 380
        Width = 185
        Height = 18
        TabOrder = 19
        Alignment = taLeftJustify
        Caption = 'Record an Input Timecode File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object ExitAfterInputPlayback: TAdvOfficeCheckBoxEx
        Left = 216
        Top = 380
        Width = 200
        Height = 18
        TabOrder = 20
        Alignment = taLeftJustify
        Caption = 'Exit Emulator After Input Playback'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object OSDInputOptionsGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 256
        Width = 297
        Height = 109
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'OSD Input Options'
        Ctl3D = True
        Enabled = False
        TabOrder = 21
        object OSDInputKeyboardProviderLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 100
          Height = 16
          Caption = 'Keyboard Provider'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object OSDInputMouseProviderLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 86
          Height = 16
          Caption = 'Mouse Provider'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object OSDInputLightgunProviderLabel: TShadowLabel
          Left = 152
          Top = 20
          Width = 98
          Height = 16
          Caption = 'Lightgun Provider'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object OSDInputJoystickProviderLabel: TShadowLabel
          Left = 152
          Top = 64
          Width = 91
          Height = 16
          Caption = 'Joystick Provider'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object OSDInputKeyboardProvider: TComboBox2Ex
          Left = 8
          Top = 36
          Width = 137
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Raw Input'
            'DirectInput'
            'Win32 Input'
            'UWP (Windows 10)'
            'None')
        end
        object OSDInputMouseProvider: TComboBox2Ex
          Left = 8
          Top = 80
          Width = 137
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Raw Input'
            'DirectInput'
            'Win32 Input'
            'None')
        end
        object OSDInputLightgunProvider: TComboBox2Ex
          Left = 152
          Top = 36
          Width = 137
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Win32 Input'
            'None')
        end
        object OSDInputJoystickProvider: TComboBox2Ex
          Left = 152
          Top = 80
          Width = 137
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'DirectInput'
            'XInput'
            'Hybrid DInput/XInput'
            'UWP (Windows 10)'
            'None')
        end
      end
      object OSDOutputOptionsGroupBox: TAdvGroupBoxEx
        Left = 328
        Top = 300
        Width = 217
        Height = 65
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'OSD Output Options'
        ParentCtl3D = True
        TabOrder = 22
        object OSDOutputProviderLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 88
          Height = 16
          Caption = 'Output Provider'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object OSDOutputProvider: TComboBox2Ex
          Left = 8
          Top = 36
          Width = 137
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Console'
            'Network'
            'Windows'
            'None')
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Miscellaneous'
      object RAMSizeLabel: TShadowLabel
        Left = 252
        Top = 100
        Width = 127
        Height = 16
        Caption = 'RAM Size (if supported)'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SystemBiosLabel: TShadowLabel
        Left = 465
        Top = 14
        Width = 159
        Height = 16
        Caption = 'Select the System BIOS to Use'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object UIFontLabel: TShadowLabel
        Left = 252
        Top = 398
        Width = 98
        Height = 16
        Caption = 'User Inteface Font'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object UIFontProviderLabel: TShadowLabel
        Left = 372
        Top = 354
        Width = 47
        Height = 16
        Caption = 'Provider'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object TypeUserInterfaceLabel: TShadowLabel
        Left = 252
        Top = 354
        Width = 118
        Height = 16
        Caption = 'Type of User Interface'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object DisplayLanguageLabel: TShadowLabel
        Left = 16
        Top = 240
        Width = 171
        Height = 16
        Caption = 'User Interface Display Language'
        Enabled = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object SaveStateRewindBufferSizeLabel: TShadowLabel
        Left = 16
        Top = 152
        Width = 190
        Height = 16
        Hint = 'Rewind Buffer Size [%u MegaBytes]'
        Caption = 'Rewind Buffer Size [100 MegaBytes]'
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
      object SaveStateNameLabel: TShadowLabel
        Left = 16
        Top = 196
        Width = 91
        Height = 16
        Caption = 'Save State Name'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object SkipGameInfo: TAdvOfficeCheckBoxEx
        Left = 138
        Top = 12
        Width = 105
        Height = 20
        Hint = 'Skip displaying the system information screen at startup'
        Enabled = False
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Skip Game Info'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object ReadConfigFiles: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 12
        Width = 115
        Height = 20
        Hint = 'Enable loading of configuration files'
        Checked = True
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Read Config Files'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object WriteConfigFiles: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 32
        Width = 121
        Height = 20
        Hint = 'Write configuration to (driver).ini on exit'
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = 'Write Config Files'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object Cheat: TAdvOfficeCheckBoxEx
        Left = 138
        Top = 32
        Width = 105
        Height = 20
        Hint = 'Enable cheat subsystem'
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = 'Cheats Enabled'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object RAMSize: TEditEx
        Left = 252
        Top = 116
        Width = 153
        Height = 21
        Hint = 'Size of RAM (if supported by driver)'
        AutoSize = False
        Color = clWhite
        TabOrder = 4
        OnKeyPress = RAMSizeKeyPress
      end
      object ConfirmQuit: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 52
        Width = 97
        Height = 20
        Hint = 'Ask for confirmation before exiting'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Confirm Quit'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DebugGroupBox: TAdvGroupBoxEx
        Left = 252
        Top = 146
        Width = 197
        Height = 197
        CheckBox.Action = caNone
        CheckBox.Hint = 'Enable/disable debugger'
        CheckBox.Visible = True
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Enable Debugger'
        ParentCtl3D = True
        TabOrder = 6
        object DebuggerScriptLabel: TShadowLabel
          Left = 8
          Top = 150
          Width = 88
          Height = 16
          Caption = 'Debugger Script'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object WatchdogLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 58
          Height = 16
          Hint = 
            'Creates new thread that kills the application after a few second' +
            's'
          Caption = 'Watchdog'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object DebuggerLabel: TShadowLabel
          Left = 92
          Top = 64
          Width = 94
          Height = 16
          Caption = 'Debugger To Use'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object WatchdogSecsLabel: TShadowLabel
          Left = 55
          Top = 83
          Width = 25
          Height = 16
          Hint = 
            'Creates new thread that kills the application after a few second' +
            's'
          Caption = 'secs'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
        end
        object ShadowLabel1: TShadowLabel
          Left = 8
          Top = 110
          Width = 80
          Height = 16
          Caption = 'Debugger Port'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object Log: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 40
          Width = 57
          Height = 20
          Hint = 'Generate an error.log file'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Log'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object OSLog: TAdvOfficeCheckBoxEx
          Left = 81
          Top = 40
          Width = 112
          Height = 20
          Hint = 
            'Output error.log data to system diagnostic output (debugger or s' +
            'tandard error)'
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Log to Debugger'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object Verbose: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 81
          Height = 20
          Hint = 'Display additional diagnostic information'
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Verbose'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object UpdateInPause: TAdvOfficeCheckBoxEx
          Left = 81
          Top = 20
          Width = 109
          Height = 20
          Hint = 'Keep calling video updates while in pause'
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Update In Pause'
          ReturnIsTab = False
          Themed = True
          CustomIconsEnabled = False
        end
        object DebuggerScript: TEditEx
          Left = 8
          Top = 168
          Width = 137
          Height = 21
          Hint = 'Script for debugger'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object DebuggerScriptButtonSelect: TBitBtnEx
          Left = 146
          Top = 168
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = DebuggerScriptButtonSelectClick
        end
        object Watchdog: TEditEx
          Left = 11
          Top = 80
          Width = 40
          Height = 21
          Hint = 
            'Creates new thread that kills the application after a few second' +
            's'
          AutoSize = False
          TabOrder = 6
          Text = '2500'
          OnKeyPress = WatchdogKeyPress
        end
        object Debugger: TComboBox2Ex
          Left = 92
          Top = 80
          Width = 97
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Internal'
            'Windows'
            'None')
        end
        object DebuggerPort: TEditEx
          Left = 8
          Top = 128
          Width = 137
          Height = 21
          Hint = 'Port to use for GDB stub debugger'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object DebuggerPortButtonReset: TBitBtnEx
          Left = 146
          Top = 128
          Width = 43
          Height = 21
          Hint = 'Click here to use the default port'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = DebuggerPortButtonResetClick
        end
      end
      object BiosSetsListView: TEasyListview
        Left = 465
        Top = 30
        Width = 385
        Height = 407
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
          0006000000800800010100010000000000000013010000FFFFFF1F0001000000
          010000001B00000053006500740020005400690074006C006500200028006400
          65006600610075006C007400200069006E00200062006F006C00640029000000
          00000000000000000000110000005445617379436F6C756D6E53746F726564FF
          FECE000600000080080001010001010000000000006B000000FFFFFF1F000100
          0000010000000800000053006500740020004E0061006D006500000000000000
          000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
          00000080000001010001020000000000015F000000FFFFFF1F00010000000100
          00001000000050006100720065006E0074002000420069006F00730020004E00
          61006D006500000000000000000000000000110000005445617379436F6C756D
          6E53746F726564FFFECE000600000080000001010001030000000000012D0000
          00FFFFFF1F0001000000010000000B000000440065006600610075006C007400
          2000530065007400000000000000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        Header.Visible = True
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = FormMain.IL_MenuPopup
        PaintInfoColumn.Border = 2
        PaintInfoColumn.CaptionIndent = 0
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentShowHint = False
        ShowHint = True
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
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 7
        View = elsReport
        CustomCheckRadioEnabled = False
        OnItemCompare = BiosSetsListViewItemCompare
      end
      object UIFont: TEditEx
        Left = 252
        Top = 414
        Width = 153
        Height = 21
        Hint = 'Specify a font to use'
        AutoSize = False
        Color = clWhite
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 8
      end
      object UIFontSelectFontButtonSelect: TBitBtnEx
        Left = 407
        Top = 414
        Width = 43
        Height = 21
        Hint = 'Click here to select a font'
        Caption = 'Select'
        Enabled = False
        TabOrder = 9
        OnClick = UIFontSelectFontButtonSelectClick
      end
      object DRC: TAdvOfficeCheckBoxEx
        Left = 252
        Top = 12
        Width = 141
        Height = 20
        Hint = 'Enable DRC CPU core if available'
        Checked = True
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Enable DRC CPU Core'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object DRCUseC: TAdvOfficeCheckBoxEx
        Left = 252
        Top = 32
        Width = 189
        Height = 20
        Hint = 'Force DRC to use C backend'
        ShowHint = False
        TabOrder = 11
        Alignment = taLeftJustify
        Caption = 'Force DRC To Use C Backend'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object RAMSizeButtonClear: TBitBtnEx
        Left = 407
        Top = 116
        Width = 43
        Height = 21
        Hint = 'Click here to clear RAM size'
        Caption = 'Clear'
        TabOrder = 12
        OnClick = RAMSizeButtonClearClick
      end
      object DRCLogUML: TAdvOfficeCheckBoxEx
        Left = 252
        Top = 52
        Width = 194
        Height = 20
        TabOrder = 13
        Alignment = taLeftJustify
        Caption = 'Write DRC UML Disassembly Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object DRCLogNative: TAdvOfficeCheckBoxEx
        Left = 252
        Top = 72
        Width = 201
        Height = 20
        TabOrder = 14
        Alignment = taLeftJustify
        Caption = 'Write DRC Native Disassembly Log'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object UIFontProvider: TComboBox2Ex
        Left = 372
        Top = 370
        Width = 78
        Height = 21
        Hint = 'Provider for user interface font'
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 15
        Text = 'Auto'
        Items.Strings = (
          'Auto'
          'None'
          'Windows'
          'SDL'
          'OSX')
      end
      object TypeUserInterface: TComboBox2Ex
        Left = 252
        Top = 370
        Width = 119
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 1
        ParentFont = False
        TabOrder = 16
        Text = 'Cabinet'
        Items.Strings = (
          'Simple'
          'Cabinet')
      end
      object DisplayLanguageList: TEasyListview
        Left = 16
        Top = 258
        Width = 220
        Height = 179
        BackGround.Enabled = True
        CellSizes.Report.Height = 19
        Color = clWhite
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clBlack
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        Enabled = False
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000000D9000000FFFFFF1F0001000000
          010000001A0000004C0061006E00670075006100670065002000280064006500
          6600610075006C007400200069006E00200062006F006C006400290000000000
          0000000000000000}
        Header.Draggable = False
        Header.Height = 23
        Header.Sizeable = False
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = FormMain.IL_MenuPopup
        PaintInfoColumn.Border = 2
        PaintInfoColumn.CaptionIndent = 0
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.ShowBorder = False
        ParentShowHint = False
        ShowHint = True
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
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 17
        View = elsReport
        CustomCheckRadioEnabled = False
      end
      object SaveNVRAMOnExit: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 92
        Width = 128
        Height = 20
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        Checked = True
        TabOrder = 18
        Alignment = taLeftJustify
        Caption = 'Save NVRAM on Exit'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        CustomIconsEnabled = False
      end
      object AutoSave: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 112
        Width = 103
        Height = 20
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        TabOrder = 19
        Alignment = taLeftJustify
        Caption = 'Auto Save State'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object EnableSaveStateRewind: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 132
        Width = 152
        Height = 20
        Hint = 'Enable rewind save states'
        TabOrder = 20
        Alignment = taLeftJustify
        Caption = 'Enable Save State Rewind'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object SaveStateRewindBufferSize: TGaugeBar
        Left = 16
        Top = 168
        Width = 220
        Height = 20
        Hint = 'Rewind buffer size in megabytes'
        Color = clWhite
        Backgnd = bgPattern
        ButtonSize = 12
        LargeChange = 5
        Max = 2048
        Min = 1
        ShowHandleGrip = True
        Position = 100
        OnChange = SaveStateRewindBufferSizeChange
      end
      object SaveStateName: TEditEx
        Left = 16
        Top = 212
        Width = 175
        Height = 21
        Hint = 'Override of the default state subfolder naming; %g == gamename'
        AutoSize = False
        Color = clWhite
        ParentShowHint = False
        ShowHint = False
        TabOrder = 22
      end
      object SaveStateNameButtonReset: TBitBtnEx
        Left = 193
        Top = 212
        Width = 43
        Height = 21
        Hint = 'Set default save state name'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = SaveStateNameButtonResetClick
      end
      object SkipMandatoryFileMan: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 72
        Width = 202
        Height = 20
        Hint = 
          'Skip prompting the user for any mandatory images with the file m' +
          'anager at startup'
        TabOrder = 24
        Alignment = taLeftJustify
        Caption = 'Skip Mandatory Images at Startup'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'SDL'
      object SDKKeyboardMappingGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 20
        Width = 249
        Height = 65
        CheckBox.Visible = True
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Enable SDL Keyboard Mapping'
        Ctl3D = True
        TabOrder = 0
        object SDLKeymapFilenameLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 97
          Height = 16
          Caption = 'Keymap Filename'
          Enabled = False
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLKeymapFilename: TEditEx
          Left = 8
          Top = 36
          Width = 144
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object SDLKeymapFilenameButtonSelect: TBitBtnEx
          Left = 154
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Click here to disable this feature'
          Caption = 'Select'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = SDLKeymapFilenameButtonSelectClick
        end
        object SDLKeymapFilenameButtonReset: TBitBtnEx
          Left = 197
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Click here to reset filename to default'
          Caption = 'Reset'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = SDLKeymapFilenameButtonResetClick
        end
      end
      object SDLJoystickMappingGroupBox: TAdvGroupBoxEx
        Left = 362
        Top = 236
        Width = 240
        Height = 207
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Joystick Mapping                                             '
        Ctl3D = True
        TabOrder = 1
        object SDLJoystickMapping1Label: TShadowLabel
          Left = 8
          Top = 26
          Width = 16
          Height = 16
          Caption = '#1'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping2Label: TShadowLabel
          Left = 8
          Top = 48
          Width = 16
          Height = 16
          Caption = '#2'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping3Label: TShadowLabel
          Left = 8
          Top = 71
          Width = 16
          Height = 16
          Caption = '#3'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping4Label: TShadowLabel
          Left = 8
          Top = 93
          Width = 16
          Height = 16
          Caption = '#4'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping5Label: TShadowLabel
          Left = 8
          Top = 115
          Width = 16
          Height = 16
          Caption = '#5'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping6Label: TShadowLabel
          Left = 8
          Top = 137
          Width = 16
          Height = 16
          Caption = '#6'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping7Label: TShadowLabel
          Left = 8
          Top = 159
          Width = 16
          Height = 16
          Caption = '#7'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping8Label: TShadowLabel
          Left = 8
          Top = 181
          Width = 16
          Height = 16
          Caption = '#8'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLJoystickMapping1: TComboBox2Ex
          Left = 24
          Top = 24
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'auto'
          OnSelect = SDLJoystickMapping1Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping1Custom: TEditEx
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object SDLJoystickMapping2: TComboBox2Ex
          Left = 24
          Top = 46
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'auto'
          OnSelect = SDLJoystickMapping2Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping2Custom: TEditEx
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object SDLJoystickMapping3: TComboBox2Ex
          Left = 24
          Top = 68
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'auto'
          OnSelect = SDLJoystickMapping3Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping3Custom: TEditEx
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object SDLJoystickMapping4: TComboBox2Ex
          Left = 24
          Top = 90
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'auto'
          OnSelect = SDLJoystickMapping4Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping4Custom: TEditEx
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object SDLJoystickMapping5: TComboBox2Ex
          Left = 24
          Top = 112
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Text = 'auto'
          OnSelect = SDLJoystickMapping5Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping5Custom: TEditEx
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object SDLJoystickMapping6: TComboBox2Ex
          Left = 24
          Top = 134
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Text = 'auto'
          OnSelect = SDLJoystickMapping6Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping6Custom: TEditEx
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object SDLJoystickMapping7: TComboBox2Ex
          Left = 24
          Top = 156
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Text = 'auto'
          OnSelect = SDLJoystickMapping7Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping7Custom: TEditEx
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object SDLJoystickMapping8: TComboBox2Ex
          Left = 24
          Top = 178
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Text = 'auto'
          OnSelect = SDLJoystickMapping8Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLJoystickMapping8Custom: TEditEx
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
        object PS3SixaxisControllers: TAdvOfficeCheckBoxEx
          Left = 106
          Top = -1
          Width = 130
          Height = 20
          Hint = 'Use special handling for PS3 Sixaxis controllers'
          TabOrder = 16
          Alignment = taLeftJustify
          Caption = 'PS3 Sixaxis Controller'
          ReturnIsTab = False
          CustomIconsEnabled = False
        end
      end
      object SDLLightgunMappingGroupBox: TAdvGroupBoxEx
        Left = 617
        Top = 236
        Width = 240
        Height = 207
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Lightgun Mapping (XInput)'
        Ctl3D = True
        TabOrder = 2
        object SDLLightgunMapping1Label: TShadowLabel
          Left = 8
          Top = 27
          Width = 16
          Height = 16
          Caption = '#1'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping2Label: TShadowLabel
          Left = 8
          Top = 49
          Width = 16
          Height = 16
          Caption = '#2'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping3Label: TShadowLabel
          Left = 8
          Top = 71
          Width = 16
          Height = 16
          Caption = '#3'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping4Label: TShadowLabel
          Left = 8
          Top = 93
          Width = 16
          Height = 16
          Caption = '#4'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping5Label: TShadowLabel
          Left = 8
          Top = 115
          Width = 16
          Height = 16
          Caption = '#5'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping6Label: TShadowLabel
          Left = 8
          Top = 137
          Width = 16
          Height = 16
          Caption = '#6'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping7Label: TShadowLabel
          Left = 8
          Top = 158
          Width = 16
          Height = 16
          Caption = '#7'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping8Label: TShadowLabel
          Left = 8
          Top = 180
          Width = 16
          Height = 16
          Caption = '#8'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLLightgunMapping1: TComboBox2Ex
          Left = 24
          Top = 24
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'auto'
          OnSelect = SDLLightgunMapping1Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping1Custom: TEditEx
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object SDLLightgunMapping2: TComboBox2Ex
          Left = 24
          Top = 46
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'auto'
          OnSelect = SDLLightgunMapping2Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping2Custom: TEditEx
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object SDLLightgunMapping3: TComboBox2Ex
          Left = 24
          Top = 68
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'auto'
          OnSelect = SDLLightgunMapping3Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping3Custom: TEditEx
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object SDLLightgunMapping4: TComboBox2Ex
          Left = 24
          Top = 90
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'auto'
          OnSelect = SDLLightgunMapping4Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping4Custom: TEditEx
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object SDLLightgunMapping5: TComboBox2Ex
          Left = 24
          Top = 112
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Text = 'auto'
          OnSelect = SDLLightgunMapping5Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping5Custom: TEditEx
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object SDLLightgunMapping6: TComboBox2Ex
          Left = 24
          Top = 134
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Text = 'auto'
          OnSelect = SDLLightgunMapping6Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping6Custom: TEditEx
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object SDLLightgunMapping7: TComboBox2Ex
          Left = 24
          Top = 156
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Text = 'auto'
          OnSelect = SDLLightgunMapping7Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping7Custom: TEditEx
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object SDLLightgunMapping8: TComboBox2Ex
          Left = 24
          Top = 178
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Text = 'auto'
          OnSelect = SDLLightgunMapping8Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDLLightgunMapping8Custom: TEditEx
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
      end
      object SDL2MouseMappingGroupBox: TAdvGroupBoxEx
        Left = 617
        Top = 20
        Width = 240
        Height = 207
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Mouse Mapping (SDL 2)'
        Ctl3D = True
        TabOrder = 3
        object SDL2MouseMapping1Label: TShadowLabel
          Left = 8
          Top = 27
          Width = 16
          Height = 16
          Caption = '#1'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping2Label: TShadowLabel
          Left = 8
          Top = 49
          Width = 16
          Height = 16
          Caption = '#2'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping3Label: TShadowLabel
          Left = 8
          Top = 71
          Width = 16
          Height = 16
          Caption = '#3'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping4Label: TShadowLabel
          Left = 8
          Top = 93
          Width = 16
          Height = 16
          Caption = '#4'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping5Label: TShadowLabel
          Left = 8
          Top = 115
          Width = 16
          Height = 16
          Caption = '#5'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping6Label: TShadowLabel
          Left = 8
          Top = 137
          Width = 16
          Height = 16
          Caption = '#6'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping7Label: TShadowLabel
          Left = 8
          Top = 158
          Width = 16
          Height = 16
          Caption = '#7'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping8Label: TShadowLabel
          Left = 8
          Top = 180
          Width = 16
          Height = 16
          Caption = '#8'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2MouseMapping1: TComboBox2Ex
          Left = 24
          Top = 24
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'auto'
          OnSelect = SDL2MouseMapping1Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping1Custom: TEditEx
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object SDL2MouseMapping2: TComboBox2Ex
          Left = 24
          Top = 46
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'auto'
          OnSelect = SDL2MouseMapping2Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping2Custom: TEditEx
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object SDL2MouseMapping3: TComboBox2Ex
          Left = 24
          Top = 68
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'auto'
          OnSelect = SDL2MouseMapping3Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping3Custom: TEditEx
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object SDL2MouseMapping4: TComboBox2Ex
          Left = 24
          Top = 90
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'auto'
          OnSelect = SDL2MouseMapping4Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping4Custom: TEditEx
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object SDL2MouseMapping5: TComboBox2Ex
          Left = 24
          Top = 112
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Text = 'auto'
          OnSelect = SDL2MouseMapping5Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping5Custom: TEditEx
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object SDL2MouseMapping6: TComboBox2Ex
          Left = 24
          Top = 134
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Text = 'auto'
          OnSelect = SDL2MouseMapping6Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping6Custom: TEditEx
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object SDL2MouseMapping7: TComboBox2Ex
          Left = 24
          Top = 156
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Text = 'auto'
          OnSelect = SDL2MouseMapping7Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping7Custom: TEditEx
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object SDL2MouseMapping8: TComboBox2Ex
          Left = 24
          Top = 178
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Text = 'auto'
          OnSelect = SDL2MouseMapping8Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2MouseMapping8Custom: TEditEx
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
      end
      object SDL2KeyboardMappingGroupBox: TAdvGroupBoxEx
        Left = 362
        Top = 20
        Width = 240
        Height = 207
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Keyboard Mapping (SDL 2)'
        Ctl3D = True
        TabOrder = 4
        object SDL2KeyboardMapping1Label: TShadowLabel
          Left = 8
          Top = 27
          Width = 16
          Height = 16
          Caption = '#1'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping2Label: TShadowLabel
          Left = 8
          Top = 49
          Width = 16
          Height = 16
          Caption = '#2'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping3Label: TShadowLabel
          Left = 8
          Top = 71
          Width = 16
          Height = 16
          Caption = '#3'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping4Label: TShadowLabel
          Left = 8
          Top = 93
          Width = 16
          Height = 16
          Caption = '#4'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping5Label: TShadowLabel
          Left = 8
          Top = 115
          Width = 16
          Height = 16
          Caption = '#5'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping6Label: TShadowLabel
          Left = 8
          Top = 137
          Width = 16
          Height = 16
          Caption = '#6'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping7Label: TShadowLabel
          Left = 8
          Top = 158
          Width = 16
          Height = 16
          Caption = '#7'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping8Label: TShadowLabel
          Left = 8
          Top = 180
          Width = 16
          Height = 16
          Caption = '#8'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2KeyboardMapping1: TComboBox2Ex
          Left = 24
          Top = 24
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping1Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping1Custom: TEditEx
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object SDL2KeyboardMapping2: TComboBox2Ex
          Left = 24
          Top = 46
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping2Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping2Custom: TEditEx
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object SDL2KeyboardMapping3: TComboBox2Ex
          Left = 24
          Top = 68
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping3Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping3Custom: TEditEx
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object SDL2KeyboardMapping4: TComboBox2Ex
          Left = 24
          Top = 90
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping4Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping4Custom: TEditEx
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object SDL2KeyboardMapping5: TComboBox2Ex
          Left = 24
          Top = 112
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping5Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping5Custom: TEditEx
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object SDL2KeyboardMapping6: TComboBox2Ex
          Left = 24
          Top = 134
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping6Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping6Custom: TEditEx
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object SDL2KeyboardMapping7: TComboBox2Ex
          Left = 24
          Top = 156
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping7Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping7Custom: TEditEx
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
        end
        object SDL2KeyboardMapping8: TComboBox2Ex
          Left = 24
          Top = 178
          Width = 103
          Height = 21
          Style = csDropDownList
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Text = 'auto'
          OnSelect = SDL2KeyboardMapping8Select
          Items.Strings = (
            'auto'
            'Custom Name')
        end
        object SDL2KeyboardMapping8Custom: TEditEx
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
      end
      object SDLVideoPerformance: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 142
        Width = 177
        Height = 20
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Show SDL Video Performance'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object SDLOutputModeGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 166
        Width = 249
        Height = 87
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'Output Mode'
        ParentCtl3D = True
        TabOrder = 6
        object SDLScaleModeLabel: TShadowLabel
          Left = 8
          Top = 42
          Width = 199
          Height = 16
          Caption = 'Scale Mode (Software Renderer Only)'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLCenterHorizontally: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 124
          Height = 20
          Hint = 'Center horizontally within the view area'
          Checked = True
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Center Horizontally'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object SDLCenterVertically: TAdvOfficeCheckBoxEx
          Left = 136
          Top = 20
          Width = 107
          Height = 20
          Hint = 'Center vertically within the view area'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Center Vertically'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
          CustomIconsEnabled = False
        end
        object SDLScaleMode: TComboBox2Ex
          Left = 8
          Top = 58
          Width = 233
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'None'
          Items.Strings = (
            'None'
            'Async'
            'YV12'
            'YUY2'
            'YV12x2'
            'YUY2x2'
            'Hardware Blit (SDL 2)'
            'Hardware Best (SDL 2)')
        end
      end
      object SDLSplitFullScreenMonitors: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 262
        Width = 231
        Height = 20
        Hint = 'Multi-monitors (X11 only)'
        Enabled = False
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'Split Full Screen Image Across Monitors'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
      end
      object SDLLowLevelDriverGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 334
        Width = 331
        Height = 109
        CheckBox.CustomIconsEnabled = False
        RoundEdges = True
        Caption = 'SDL Low Level Driver'
        Ctl3D = True
        TabOrder = 8
        object SDLVideoDriverToUseLabel: TShadowLabel
          Left = 8
          Top = 20
          Width = 90
          Height = 16
          Caption = 'SDL Video Driver'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDL2RenderDriverToUseLabel: TShadowLabel
          Left = 112
          Top = 20
          Width = 106
          Height = 16
          Caption = 'SDL 2 Render Driver'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLAudioDriverToUseLabel: TShadowLabel
          Left = 222
          Top = 20
          Width = 92
          Height = 16
          Caption = 'SDL Audio Driver'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLAlternativeLibGLToUseLabel: TShadowLabel
          Left = 8
          Top = 64
          Width = 105
          Height = 16
          Caption = 'Alternative libGL.so'
          ShowAccelChar = False
          ShadowColor = clGray
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
        end
        object SDLVideoDriverToUse: TComboBox2Ex
          Left = 8
          Top = 36
          Width = 101
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'X11'
            'DirectFB')
        end
        object SDL2RenderDriverToUse: TComboBox2Ex
          Left = 112
          Top = 36
          Width = 107
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Software'
            'OpenGL'
            'DirectFB')
        end
        object SDLAudioDriverToUse: TComboBox2Ex
          Left = 222
          Top = 36
          Width = 101
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Alsa'
            'Arts')
        end
        object SDLAlternativeLibGLToUse: TComboBox2Ex
          Left = 8
          Top = 80
          Width = 103
          Height = 21
          Style = csDropDownList
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = 'Auto'
          OnSelect = SDLAlternativeLibGLToUseSelect
          Items.Strings = (
            'Auto'
            'Custom')
        end
        object SDLAlternativeLibGLToUseCustom: TEditEx
          Left = 114
          Top = 80
          Width = 165
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          TabOrder = 4
        end
        object SDLAlternativeLibGLToUseCustomButtonSelect: TBitBtnEx
          Left = 281
          Top = 80
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = SDLAlternativeLibGLToUseCustomButtonSelectClick
        end
      end
    end
  end
  object ButtonReadFile: TBitBtnEx
    Left = 16
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Reload configuration files'
    Caption = 'Reload Settings'
    TabOrder = 1
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtnEx
    Left = 665
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TBitBtnEx
    Left = 763
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 868
    Height = 80
    Color1 = 15792869
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 771
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
      Width = 580
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
      Left = 753
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
  object ButtonResetToDefault: TBitBtnEx
    Left = 109
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Load only emulator default settings'
    Caption = 'Reset to Default'
    TabOrder = 5
    OnClick = ButtonResetToDefaultClick
  end
  object ButtonReadFileHelp: TBitBtnEx
    Left = 202
    Top = 551
    Width = 15
    Height = 15
    Hint = 'Why two reload buttons ?'
    Caption = '?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = ButtonReadFileHelpClick
  end
  object ButtonHelpSaveValidateAllCustomFiles: TBitBtnEx
    Left = 437
    Top = 551
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
    TabOrder = 7
    OnClick = ButtonHelpSaveValidateAllCustomFilesClick
  end
  object SaveValidateAllCustomFiles: TAdvOfficeCheckBoxEx
    Left = 455
    Top = 549
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
    TabOrder = 8
    OnClick = SaveValidateAllCustomFilesClick
    Alignment = taLeftJustify
    Caption = 'Validate All Custom Files on Save'
    ReturnIsTab = False
    ShadowColor = clSkyBlue
    Themed = True
    CustomIconsEnabled = False
  end
end
