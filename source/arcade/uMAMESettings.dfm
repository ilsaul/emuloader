object FormMAMESettings: TFormMAMESettings
  Left = 996
  Top = 454
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
      object FolderROMsDisksBox: TLabel
        Left = 16
        Top = 13
        Width = 169
        Height = 15
        Caption = 'Path to ROM Sets and CHD Files'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelFolderIniFiles: TLabel
        Left = 16
        Top = 140
        Width = 80
        Height = 15
        Caption = 'Path to Ini Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Transparent = True
      end
      object LabelFolderGameSnapshots: TLabel
        Left = 303
        Top = 140
        Width = 155
        Height = 15
        Caption = 'Directory to Save Screenshots'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderGamesConfigurations: TLabel
        Left = 303
        Top = 346
        Width = 171
        Height = 15
        Caption = 'Directory to Save Configurations'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderCheatFiles: TLabel
        Left = 590
        Top = 108
        Width = 98
        Height = 15
        Caption = 'Path to Cheat Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderMemoryCards: TLabel
        Left = 590
        Top = 347
        Width = 216
        Height = 15
        Caption = 'Directory to Save Memory Card Contents'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderDiff: TLabel
        Left = 590
        Top = 60
        Width = 200
        Height = 15
        Caption = 'Directory to Save CHD Difference Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderSaveStates: TLabel
        Left = 304
        Top = 296
        Width = 123
        Height = 15
        Caption = 'Directory to Save States'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderNVRAM: TLabel
        Left = 303
        Top = 394
        Width = 185
        Height = 15
        Caption = 'Directory to Save NVRAM Contents'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderHashFiles: TLabel
        Left = 16
        Top = 394
        Width = 206
        Height = 15
        Caption = 'Path to Software Definition Files (Hash)'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderArtworks: TLabel
        Left = 16
        Top = 252
        Width = 219
        Height = 15
        Caption = 'Path to Artwork Files / Effect Overlay Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderSamples: TLabel
        Left = 16
        Top = 346
        Width = 139
        Height = 15
        Caption = 'Path to Audio Sample Sets'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderInputDeviceLogs: TLabel
        Left = 590
        Top = 299
        Width = 186
        Height = 15
        Caption = 'Directory to Save Input Device Logs'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderControllerDefinitions: TLabel
        Left = 590
        Top = 155
        Width = 154
        Height = 15
        Caption = 'Path to Controller Definitions'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderCrosshairFiles: TLabel
        Left = 590
        Top = 203
        Width = 116
        Height = 15
        Caption = 'Path to Crosshair Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderFontFiles: TLabel
        Left = 590
        Top = 251
        Width = 91
        Height = 15
        Caption = 'Path to Font Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Transparent = True
      end
      object LabelFolderDebuggerComments: TLabel
        Left = 590
        Top = 13
        Width = 206
        Height = 15
        Caption = 'Directory to Save Debugger Comments'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderLanguageFiles: TLabel
        Left = 303
        Top = 192
        Width = 140
        Height = 15
        Caption = 'Path to UI Translation Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderPluginFiles: TLabel
        Left = 303
        Top = 244
        Width = 101
        Height = 15
        Caption = 'Path to Plugin Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderManualsPDF: TLabel
        Left = 590
        Top = 394
        Width = 197
        Height = 15
        Caption = 'Directory to Game Manual Files (PDF)'
        ParentShowHint = False
        ShowHint = False
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
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderROMsKeyAction
      end
      object FolderROMsButtonUp: TBitBtn
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
      object FolderROMsButtonDown: TBitBtn
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
      object FolderROMsButtonSelect: TBitBtn
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
      object FolderROMsButtonEdit: TBitBtn
        Left = 522
        Top = 51
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderROMsButtonEditClick
      end
      object FolderROMsButtonDelete: TBitBtn
        Left = 522
        Top = 72
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderROMsButtonDeleteClick
      end
      object FolderROMsButtonClear: TBitBtn
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
      object FolderSamples: TEdit
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
      object FolderSamplesButtonSelect: TBitBtn
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
      object FolderGameSnapshots: TEdit
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
      object FolderGameSnapshotsButtonSelect: TBitBtn
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
      object FolderGamesConfigurations: TEdit
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
      object FolderGamesConfigurationsButtonSelect: TBitBtn
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
      object FolderCheatFiles: TEdit
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
      object FolderCheatFilesButtonSelect: TBitBtn
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
      object FolderMemoryCards: TEdit
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
      object FolderMemoryCardsButtonSelect: TBitBtn
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
      object FolderDiff: TEdit
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
      object FolderDiffButtonSelect: TBitBtn
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
      object FolderSaveStates: TEdit
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
      object FolderSaveStatesButtonSelect: TBitBtn
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
      object FolderNVRAM: TEdit
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
      object FolderNVRAMButtonSelect: TBitBtn
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
      object FolderHashFiles: TEdit
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
      object FolderHashFilesButtonSelect: TBitBtn
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
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderArtworksKeyAction
      end
      object FolderArtworksButtonUp: TBitBtn
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
      object FolderArtworksButtonDown: TBitBtn
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
      object FolderArtworksButtonSelect: TBitBtn
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
      object FolderArtworksButtonEdit: TBitBtn
        Left = 149
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 29
        OnClick = FolderArtworksButtonEditClick
      end
      object FolderArtworksButtonDelete: TBitBtn
        Left = 192
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 30
        OnClick = FolderArtworksButtonDeleteClick
      end
      object FolderArtworksButtonClear: TBitBtn
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
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderIniFilesKeyAction
      end
      object FolderIniFilesButtonUp: TBitBtn
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
      object FolderIniFilesButtonDown: TBitBtn
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
      object FolderIniFilesButtonSelect: TBitBtn
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
      object FolderIniFilesButtonEdit: TBitBtn
        Left = 149
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 36
        OnClick = FolderIniFilesButtonEditClick
      end
      object FolderIniFilesButtonDelete: TBitBtn
        Left = 192
        Top = 222
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 37
        OnClick = FolderIniFilesButtonDeleteClick
      end
      object FolderIniFilesButtonClear: TBitBtn
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
      object FolderInputDeviceLogs: TEdit
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
      object FolderInputDeviceLogsButtonSelect: TBitBtn
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
      object FolderControllerDefinitionsButtonSelect: TBitBtn
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
      object FolderCrosshairFilesButtonSelect: TBitBtn
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
      object FolderFontFiles: TEdit
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
      object FolderFontFilesButtonSelect: TBitBtn
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
      object FolderControllerDefinitions: TEdit
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
      object FolderCrosshairFiles: TEdit
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
      object FolderDebuggerCommentsButtonSelect: TBitBtn
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
      object FolderDebuggerComments: TEdit
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
      object FolderLanguageFilesButtonSelect: TBitBtn
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
      object FolderLanguageFiles: TEdit
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
      object FolderPluginFilesButtonSelect: TBitBtn
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
      object FolderPluginFiles: TEdit
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
      object FolderManualsPDF: TEdit
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
      object FolderManualsPDFButtonSelect: TBitBtn
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
        RoundEdges = True
        Caption = 'Render Options'
        ParentCtl3D = True
        TabOrder = 2
        object LabelIntegerScaleFactorVertical: TLabel
          Left = 92
          Top = 225
          Width = 21
          Height = 15
          Caption = 'Vert'
          Enabled = False
          ShowAccelChar = False
          Transparent = True
        end
        object LabelIntegerScaleFactorHorizontal: TLabel
          Left = 24
          Top = 225
          Width = 20
          Height = 15
          Caption = 'Hor'
          Enabled = False
          ShowAccelChar = False
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
        end
        object IntegerScaleFactorHorizontal: TEdit
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
        object IntegerScaleFactorVertical: TEdit
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
        end
      end
      object VectorGroupBox: TAdvGroupBoxEx
        Left = 384
        Top = 214
        Width = 169
        Height = 213
        RoundEdges = True
        Caption = 'Vector'
        ParentCtl3D = True
        TabOrder = 1
        object LabelVectorFlickerEffect: TLabel
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
          Transparent = False
        end
        object LabelVectorBeamWidthMin: TLabel
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
          Transparent = False
        end
        object LabelVectorBeamWidthMax: TLabel
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
          Transparent = False
        end
        object LabelVectorBeamIntensityWeight: TLabel
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
        end
      end
      object ScreenOptionsBox: TAdvGroupBoxEx
        Left = 200
        Top = 12
        Width = 169
        Height = 279
        RoundEdges = True
        Caption = 'Game Screen'
        Ctl3D = True
        TabOrder = 4
        object LabelBrightness: TLabel
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
          Transparent = False
        end
        object LabelPrescale_ScaleScreen: TLabel
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
          Transparent = False
        end
        object LabelContrast: TLabel
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
          Transparent = False
        end
        object LabelGamma: TLabel
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
          Transparent = False
        end
        object LabelPauseBrightness: TLabel
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
          Transparent = False
        end
        object Label9: TLabel
          Left = 8
          Top = 235
          Width = 133
          Height = 15
          Caption = 'Visual Effects Overlay File'
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
        object EffectOverlay: TEdit
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
        object EffectOverlayBrowse: TBitBtn
          Left = 118
          Top = 251
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = EffectOverlayBrowseClick
        end
      end
      object FullScreenBox: TAdvGroupBoxEx
        Left = 384
        Top = 12
        Width = 169
        Height = 193
        RoundEdges = True
        Caption = 'Full Screen'
        ParentCtl3D = True
        TabOrder = 5
        object LabelFullScreenBrightness: TLabel
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
          Transparent = False
        end
        object LabelFullScreenContrast: TLabel
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
          Transparent = False
        end
        object LabelFullScreenGamma: TLabel
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
      object LabelSnapshotsBox: TAdvGroupBoxEx
        Left = 568
        Top = 227
        Width = 169
        Height = 200
        RoundEdges = True
        Caption = 'Snapshots / Movies'
        ParentCtl3D = True
        TabOrder = 6
        object LabelSnapshotNameFormat: TLabel
          Left = 8
          Top = 20
          Width = 73
          Height = 15
          Caption = 'Name Format'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelSnapshotView: TLabel
          Left = 8
          Top = 64
          Width = 25
          Height = 15
          Caption = 'View'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelSnapSizeCustomX: TLabel
          Left = 111
          Top = 134
          Width = 7
          Height = 15
          Caption = 'X'
          Enabled = False
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelSnapSizeCustom: TLabel
          Left = 24
          Top = 134
          Width = 42
          Height = 15
          Caption = 'Custom'
          Enabled = False
          ShowAccelChar = False
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
        end
        object ButtonSnapNameDefault: TBitBtn
          Left = 125
          Top = 36
          Width = 38
          Height = 21
          Hint = 'Set default snapshot name'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ButtonSnapNameDefaultClick
        end
        object SnapView: TComboBox
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
        object ButtonSnapViewDefault: TBitBtn
          Left = 124
          Top = 80
          Width = 38
          Height = 21
          Hint = 'Set default snapshot / movie view'
          Caption = 'Reset'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = ButtonSnapViewDefaultClick
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
        end
        object SnapSizeWidth: TEdit
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
        object SnapSizeHeight: TEdit
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
        object SnapName: TEdit
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
        end
      end
      object ArtworkGroupBox: TAdvGroupBoxEx
        Left = 568
        Top = 12
        Width = 169
        Height = 181
        RoundEdges = True
        Caption = 'Artwork'
        ParentCtl3D = True
        TabOrder = 0
        object LabelFallbackArtwork: TLabel
          Left = 8
          Top = 88
          Width = 88
          Height = 15
          Caption = 'Fallback Artwork'
          Enabled = False
          ShowAccelChar = False
          Transparent = True
        end
        object LabelOverrideArtwork: TLabel
          Left = 8
          Top = 136
          Width = 90
          Height = 15
          Caption = 'Override Artwork'
          Enabled = False
          ShowAccelChar = False
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
        end
        object FallbackArtwork: TEdit
          Left = 8
          Top = 104
          Width = 153
          Height = 23
          Hint = 
            'Fallback artwork if no external artwork or internal driver layou' +
            't defined'
          Enabled = False
          TabOrder = 6
        end
        object OverrideArtwork: TEdit
          Left = 8
          Top = 152
          Width = 153
          Height = 23
          Hint = 'Override artwork for external artwork and internal driver layout'
          Enabled = False
          TabOrder = 7
        end
      end
      object LabelScreenRotation: TAdvGroupBoxEx
        Left = 200
        Top = 297
        Width = 169
        Height = 131
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
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 2'
      object LabelMonitorProvider: TLabel
        Left = 336
        Top = 13
        Width = 90
        Height = 15
        Caption = 'Monitor Provider'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Transparent = True
      end
      object PerformanceGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 12
        Width = 308
        Height = 194
        Transparent = False
        RoundEdges = True
        Caption = 'Performance'
        ParentCtl3D = True
        TabOrder = 0
        object LabelSpeed: TLabel
          Left = 8
          Top = 107
          Width = 120
          Height = 15
          Hint = 'Gameplay Speed [%3.2f]'
          Caption = 'Gameplay Speed [1.00]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object LabelFrameskip: TLabel
          Left = 108
          Top = 63
          Width = 54
          Height = 15
          Caption = 'Frameskip'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelThreadPriority: TLabel
          Left = 208
          Top = 63
          Width = 78
          Height = 15
          Caption = 'Thread Priority'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelNumberProcessors: TLabel
          Left = 8
          Top = 63
          Width = 80
          Height = 15
          Caption = '# of Processors'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelBenchmark: TLabel
          Left = 158
          Top = 107
          Width = 118
          Height = 15
          Hint = 'sec'
          Caption = 'Benchmark [00:00 sec]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object LabelSecondsToRun: TLabel
          Left = 8
          Top = 150
          Width = 275
          Height = 15
          Hint = 'sec'
          Caption = 'Time to Run Before Automatically Exiting [00:00 sec]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
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
        end
        object Speed: TGaugeBar2
          Left = 8
          Top = 123
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
        object Frameskip: TComboBox
          Left = 108
          Top = 79
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
        object ThreadPriority: TComboBox
          Left = 208
          Top = 79
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
        object NumberProcessors: TComboBox
          Left = 8
          Top = 79
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
          Top = 123
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
          Top = 166
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
      end
      object ScreensBox: TAdvGroupBoxEx
        Left = 16
        Top = 222
        Width = 176
        Height = 193
        Transparent = False
        RoundEdges = True
        Caption = 'Screens'
        ParentCtl3D = True
        TabOrder = 1
        object LabelScreenName: TLabel
          Left = 8
          Top = 60
          Width = 32
          Height = 15
          Hint = 'Explicit name of'
          Caption = 'Name'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelScreenAspectRatio: TLabel
          Left = 101
          Top = 104
          Width = 66
          Height = 15
          Hint = 'Aspect ratio of'
          Caption = 'Aspect Ratio'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelScreenResolution: TLabel
          Left = 8
          Top = 148
          Width = 56
          Height = 15
          Hint = 'Preferred resolution of'
          Caption = 'Resolution'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelScreenRefreshRate_Custom: TLabel
          Left = 101
          Top = 148
          Width = 14
          Height = 15
          Caption = 'Hz'
          Transparent = True
        end
        object LabelScreenView: TLabel
          Left = 7
          Top = 104
          Width = 25
          Height = 15
          Hint = 'Preferred view for'
          Caption = 'View'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object LabelScreensSelector: TLabel
          Left = 81
          Top = 16
          Width = 80
          Height = 15
          Hint = 'Explicit name of'
          Caption = 'Set Options On'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = True
        end
        object ScreenName: TComboBox
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
        object ScreenAspectRatio: TComboBox
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
        object ScreenResolution: TComboBox
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
        object ScreenRefreshRate: TComboBox
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
        object ScreenView: TComboBox
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
        object NumberScreens: TExTrackBar
          Left = 4
          Top = 16
          Width = 50
          Height = 41
          Hint = 
            'Number of screens to create (usually you want just one)'#13#10'Multi-s' +
            'creen games can have different screen settings'
          Max = 4
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 5
          ThumbLength = 18
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          LabelsLeftTop = 26
          LabelsFactor = 1
          LabelsFactorOperation = foMul
          LabelsInterval = 1
          SelEnable = False
        end
        object ScreensSelector: TComboBox
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
          TabOrder = 6
          Text = 'All Screens'
          OnSelect = ScreensSelectorSelect
          Items.Strings = (
            'All Screens'
            'Screen 1'
            'Screen 2'
            'Screen 3'
            'Screen 4')
        end
        object ButtonScreenDefaultSettings: TBitBtn
          Left = 129
          Top = 56
          Width = 38
          Height = 21
          Hint = 'Set default values for the selected screen'
          Caption = 'Reset'
          TabOrder = 7
          OnClick = ButtonScreenDefaultSettingsClick
        end
      end
      object MonitorProvider: TComboBox
        Left = 336
        Top = 29
        Width = 121
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video 3'
      object LabelVideoOutputMode: TLabel
        Left = 595
        Top = 19
        Width = 105
        Height = 15
        Caption = 'Video Output Mode'
        ShowAccelChar = False
        Transparent = True
      end
      object VideoOutputMode: TComboBox
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
        ItemHeight = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ButtonHelpVideoOutputMode: TBitBtn
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
        OnClick = ButtonHelpVideoOutputModeClick
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
          object LabelBGFXPath: TLabel
            Left = 8
            Top = 56
            Width = 95
            Height = 15
            Caption = 'Path to BGFX Files'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object Label14: TLabel
            Left = 8
            Top = 12
            Width = 81
            Height = 15
            Caption = 'Backend to Use'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelBGFXShadowMaskTextureName: TLabel
            Left = 8
            Top = 100
            Width = 115
            Height = 15
            Caption = 'Shadow Mask Texture'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelBGFXScreenShaderChains: TLabel
            Left = 8
            Top = 144
            Width = 113
            Height = 15
            Caption = 'Screen Shader Chains'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelBGFXScreenShaderChainsDetailsHTML: TLabel
            Left = 469
            Top = 145
            Width = 138
            Height = 14
            Hint = 
              'http://docs.mamedev.org/advanced/bgfx.html#configuration-setting' +
              's'
            Caption = '(click here for usage details)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
            OnClick = LabelBGFXScreenShaderChainsDetailsHTMLClick
            OnMouseEnter = LabelBGFXScreenShaderChainsDetailsHTMLMouseEnter
            OnMouseLeave = LabelBGFXScreenShaderChainsDetailsHTMLMouseLeave
          end
          object LabelBGFXScreenShaderChainsHelp: TLabel
            Left = 126
            Top = 145
            Width = 209
            Height = 14
            Caption = 'select a shader in the list or type in edit box'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelBGFXLUTTextureName: TLabel
            Left = 384
            Top = 100
            Width = 98
            Height = 15
            Caption = 'LUT Texture Name'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object BGFXPath: TEdit
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
          object BGFXPathButtonSelect: TBitBtn
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
          object BGFXBackend: TComboBox
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
          end
          object BGFXShadowMaskTextureName: TEdit
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
          object BGFXShadowMaskTextureNameButtonSelect: TBitBtn
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
          object BGFXShadowMaskTextureNameButtonReset: TBitBtn
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
          object BGFXScreenShaderChains: TEdit
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
          object BGFXScreenShaderChainsButtonReload: TBitBtn
            Left = 518
            Top = 160
            Width = 47
            Height = 21
            Hint = 'Click here to reset shader to current value'
            Caption = 'Reload'
            TabOrder = 8
            OnClick = BGFXScreenShaderChainsButtonReloadClick
          end
          object BGFXScreenShaderChainsButtonSelect: TBitBtn
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
            OnDblClick = BGFXScreenShaderChains_ListViewDblClick
            OnItemCompare = BGFXScreenShaderChains_ListViewItemCompare
            OnItemPaintText = BGFXScreenShaderChains_ListViewItemPaintText
          end
          object BGFXScreenShaderChains_ListViewButtonAdd: TBitBtn
            Left = 56
            Top = 350
            Width = 43
            Height = 21
            Hint = 'Add selected shader to the list (for multiple screens games)'
            Caption = 'Add'
            TabOrder = 11
            OnClick = BGFXScreenShaderChains_ListViewButtonAddClick
          end
          object BGFXScreenShaderChains_ListViewButtonSelect: TBitBtn
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
          object BGFXScreenShaderChainsButtonReset: TBitBtn
            Left = 565
            Top = 160
            Width = 43
            Height = 21
            Hint = 'Click here to reset shader to default value'
            Caption = 'Reset'
            TabOrder = 13
            OnClick = BGFXScreenShaderChainsButtonResetClick
          end
          object BGFXLUTTextureName: TEdit
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
          object BGFXLUTTextureNameButtonSelect: TBitBtn
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
          object BGFXLUTTextureNameButtonReset: TBitBtn
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
          object LabelShadowMaskTexture: TLabel
            Left = 8
            Top = 98
            Width = 115
            Height = 15
            Caption = 'Shadow Mask Texture'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelHLSLPath: TLabel
            Left = 8
            Top = 54
            Width = 94
            Height = 15
            Caption = 'Path to HLSL Files'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object Label7: TLabel
            Left = 52
            Top = 224
            Width = 7
            Height = 15
            Caption = 'X'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelHLSLUpscaleSnapshot: TLabel
            Left = 8
            Top = 206
            Width = 136
            Height = 15
            Caption = 'Upscaled Snap Resolution'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelShadowMaskTileMode: TLabel
            Left = 8
            Top = 146
            Width = 129
            Height = 15
            Caption = 'Shadow Mask Tile Mode'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
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
          end
          object ShadowMaskTexture: TEdit
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
          object ButtonSelectShadowMaskTexture: TBitBtn
            Left = 279
            Top = 114
            Width = 43
            Height = 21
            Hint = 'Click here to select a file'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = ButtonSelectShadowMaskTextureClick
          end
          object HLSLPath: TEdit
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
          object ButtonSelectHLSLPath: TBitBtn
            Left = 322
            Top = 70
            Width = 43
            Height = 21
            Hint = 'Click here to select a folder'
            Caption = 'Select'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = ButtonSelectHLSLPathClick
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
          end
          object HLSLIniFile: TEdit
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
          object HLSLIniFileButtonReset: TBitBtn
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
          object HLSLUpscaleSnapX: TEdit
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
          object HLSLUpscaleSnapY: TEdit
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
          object ButtonHLSLUpscaleSnapReset: TBitBtn
            Left = 113
            Top = 222
            Width = 43
            Height = 21
            Hint = 'Click here to set default upscale resolution'
            Caption = 'Reset'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnClick = ButtonHLSLUpscaleSnapResetClick
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
          end
          object ShadowMaskTileMode: TComboBox
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
          object ShadowMaskTextureButtonReset: TBitBtn
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
          object VectorPostProcessingBox: TAdvGroupBoxEx
            Left = 432
            Top = 54
            Width = 330
            Height = 107
            RoundEdges = True
            Caption = 'Vector Post-Processing'
            Ctl3D = True
            Enabled = False
            TabOrder = 16
            object LabelVectorBeamSmooth: TLabel
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
              Transparent = False
            end
            object LabelVectorMaximumAttenuation: TLabel
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
              Transparent = False
            end
            object LabelVectorMinimumLengthAttenuation: TLabel
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
          object HLSLBloomPostProcessingBox: TAdvGroupBoxEx
            Left = 432
            Top = 192
            Width = 329
            Height = 161
            RoundEdges = True
            Caption = 'Bloom Post-Processing'
            Ctl3D = True
            TabOrder = 17
            object LabelBloomBlendMode: TLabel
              Left = 8
              Top = 20
              Width = 102
              Height = 15
              Caption = 'Bloom Blend Mode'
              ParentShowHint = False
              ShowAccelChar = False
              ShowHint = False
              Transparent = True
            end
            object BloomBlendMode: TComboBox
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
            object BloomLUTTextureScreen: TEdit
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
            object BloomLUTTextureScreenButtonSelect: TBitBtn
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
            object BloomLUTTextureScreenButtonReset: TBitBtn
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
            end
            object BloomLUTTextureUI: TEdit
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
            object BloomLUTTextureUIButtonSelect: TBitBtn
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
            object BloomLUTTextureUIButtonReset: TBitBtn
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
          object LabelEnableOpenGLFilterNotFF: TLabel
            Left = 253
            Top = 50
            Width = 188
            Height = 11
            Caption = 'Checked: Bilinear (Default); Unchecked: Plain'
            Font.Charset = ANSI_CHARSET
            Font.Color = 10900224
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME: TLabel
            Left = 18
            Top = 76
            Width = 191
            Height = 13
            Caption = 'Custom OpenGL GLSL Shader Set MAME'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen: TLabel
            Left = 239
            Top = 76
            Width = 176
            Height = 13
            Caption = 'Custom OpenGL GLSL Shader Screen'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen0: TLabel
            Left = 230
            Top = 95
            Width = 6
            Height = 15
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen1: TLabel
            Left = 230
            Top = 117
            Width = 6
            Height = 15
            Caption = '1'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen2: TLabel
            Left = 230
            Top = 139
            Width = 6
            Height = 15
            Caption = '2'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen3: TLabel
            Left = 230
            Top = 161
            Width = 6
            Height = 15
            Caption = '3'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen4: TLabel
            Left = 230
            Top = 183
            Width = 6
            Height = 15
            Caption = '4'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen5: TLabel
            Left = 230
            Top = 205
            Width = 6
            Height = 15
            Caption = '5'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen6: TLabel
            Left = 230
            Top = 227
            Width = 6
            Height = 15
            Caption = '6'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen7: TLabel
            Left = 230
            Top = 249
            Width = 6
            Height = 15
            Caption = '7'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen8: TLabel
            Left = 230
            Top = 271
            Width = 6
            Height = 15
            Caption = '8'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_Screen9: TLabel
            Left = 230
            Top = 293
            Width = 6
            Height = 15
            Caption = '9'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME0: TLabel
            Left = 8
            Top = 103
            Width = 6
            Height = 15
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME1: TLabel
            Left = 8
            Top = 125
            Width = 6
            Height = 15
            Caption = '1'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME2: TLabel
            Left = 8
            Top = 147
            Width = 6
            Height = 15
            Caption = '2'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME3: TLabel
            Left = 8
            Top = 169
            Width = 6
            Height = 15
            Caption = '3'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME4: TLabel
            Left = 8
            Top = 191
            Width = 6
            Height = 15
            Caption = '4'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME5: TLabel
            Left = 8
            Top = 213
            Width = 6
            Height = 15
            Caption = '5'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME6: TLabel
            Left = 8
            Top = 235
            Width = 6
            Height = 15
            Caption = '6'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME7: TLabel
            Left = 8
            Top = 257
            Width = 6
            Height = 15
            Caption = '7'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME8: TLabel
            Left = 8
            Top = 279
            Width = 6
            Height = 15
            Caption = '8'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGLSL_Shader_MAME9: TLabel
            Left = 8
            Top = 301
            Width = 6
            Height = 15
            Caption = '9'
            ShowAccelChar = False
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
          end
          object EnableOpenGLFilterNotFF: TAdvOfficeCheckBoxEx
            Left = 235
            Top = 32
            Width = 214
            Height = 20
            Checked = True
            TabOrder = 5
            Alignment = taLeftJustify
            Caption = 'Use OpenGL Filter Instead of FF Filter'
            ReturnIsTab = False
            State = cbChecked
            Themed = True
          end
          object GLSL_Shader_Screen0: TEdit
            Left = 239
            Top = 92
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 6
          end
          object ButtonGLSL_Shader_Screen0: TBitBtn
            Left = 421
            Top = 92
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = ButtonGLSL_Shader_Screen0Click
          end
          object GLSL_Shader_Screen1: TEdit
            Left = 239
            Top = 114
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 8
          end
          object ButtonGLSL_Shader_Screen1: TBitBtn
            Left = 421
            Top = 114
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = ButtonGLSL_Shader_Screen1Click
          end
          object GLSL_Shader_Screen2: TEdit
            Left = 239
            Top = 136
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 10
          end
          object ButtonGLSL_Shader_Screen2: TBitBtn
            Left = 421
            Top = 136
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = ButtonGLSL_Shader_Screen2Click
          end
          object GLSL_Shader_Screen3: TEdit
            Left = 239
            Top = 158
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 12
          end
          object ButtonGLSL_Shader_Screen3: TBitBtn
            Left = 421
            Top = 158
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnClick = ButtonGLSL_Shader_Screen3Click
          end
          object GLSL_Shader_Screen4: TEdit
            Left = 239
            Top = 180
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 14
          end
          object ButtonGLSL_Shader_Screen4: TBitBtn
            Left = 421
            Top = 180
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = ButtonGLSL_Shader_Screen4Click
          end
          object GLSL_Shader_Screen5: TEdit
            Left = 239
            Top = 202
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 16
          end
          object ButtonGLSL_Shader_Screen5: TBitBtn
            Left = 421
            Top = 202
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            OnClick = ButtonGLSL_Shader_Screen5Click
          end
          object GLSL_Shader_Screen6: TEdit
            Left = 239
            Top = 224
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 18
          end
          object ButtonGLSL_Shader_Screen6: TBitBtn
            Left = 421
            Top = 224
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
            OnClick = ButtonGLSL_Shader_Screen6Click
          end
          object GLSL_Shader_Screen7: TEdit
            Left = 239
            Top = 246
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 20
          end
          object ButtonGLSL_Shader_Screen7: TBitBtn
            Left = 421
            Top = 246
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = ButtonGLSL_Shader_Screen7Click
          end
          object GLSL_Shader_Screen8: TEdit
            Left = 239
            Top = 268
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 22
          end
          object ButtonGLSL_Shader_Screen8: TBitBtn
            Left = 421
            Top = 268
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 23
            OnClick = ButtonGLSL_Shader_Screen8Click
          end
          object GLSL_Shader_Screen9: TEdit
            Left = 239
            Top = 290
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 24
          end
          object ButtonGLSL_Shader_Screen9: TBitBtn
            Left = 421
            Top = 290
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 25
            OnClick = ButtonGLSL_Shader_Screen9Click
          end
          object GLSL_Shader_MAME0: TEdit
            Left = 17
            Top = 92
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 26
          end
          object ButtonGLSL_Shader_MAME0: TBitBtn
            Left = 199
            Top = 92
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 27
            OnClick = ButtonGLSL_Shader_MAME0Click
          end
          object GLSL_Shader_MAME1: TEdit
            Left = 17
            Top = 114
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 28
          end
          object ButtonGLSL_Shader_MAME1: TBitBtn
            Left = 199
            Top = 114
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 29
            OnClick = ButtonGLSL_Shader_MAME1Click
          end
          object GLSL_Shader_MAME2: TEdit
            Left = 17
            Top = 136
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 30
          end
          object ButtonGLSL_Shader_MAME2: TBitBtn
            Left = 199
            Top = 136
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 31
            OnClick = ButtonGLSL_Shader_MAME2Click
          end
          object GLSL_Shader_MAME3: TEdit
            Left = 17
            Top = 158
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 32
          end
          object ButtonGLSL_Shader_MAME3: TBitBtn
            Left = 199
            Top = 158
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = ButtonGLSL_Shader_MAME3Click
          end
          object GLSL_Shader_MAME4: TEdit
            Left = 17
            Top = 180
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 34
          end
          object ButtonGLSL_Shader_MAME4: TBitBtn
            Left = 199
            Top = 180
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 35
            OnClick = ButtonGLSL_Shader_MAME4Click
          end
          object GLSL_Shader_MAME5: TEdit
            Left = 17
            Top = 202
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 36
          end
          object ButtonGLSL_Shader_MAME5: TBitBtn
            Left = 199
            Top = 202
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 37
            OnClick = ButtonGLSL_Shader_MAME5Click
          end
          object GLSL_Shader_MAME6: TEdit
            Left = 17
            Top = 224
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 38
          end
          object ButtonGLSL_Shader_MAME6: TBitBtn
            Left = 199
            Top = 224
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = ButtonGLSL_Shader_MAME6Click
          end
          object GLSL_Shader_MAME7: TEdit
            Left = 17
            Top = 246
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 40
          end
          object ButtonGLSL_Shader_MAME7: TBitBtn
            Left = 199
            Top = 246
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 41
            OnClick = ButtonGLSL_Shader_MAME7Click
          end
          object GLSL_Shader_MAME8: TEdit
            Left = 17
            Top = 268
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 42
          end
          object ButtonGLSL_Shader_MAME8: TBitBtn
            Left = 199
            Top = 268
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 43
            OnClick = ButtonGLSL_Shader_MAME8Click
          end
          object GLSL_Shader_MAME9: TEdit
            Left = 17
            Top = 290
            Width = 180
            Height = 21
            AutoSize = False
            TabOrder = 44
          end
          object ButtonGLSL_Shader_MAME9: TBitBtn
            Left = 199
            Top = 290
            Width = 21
            Height = 21
            Hint = 'Click here to select a file'
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 45
            OnClick = ButtonGLSL_Shader_MAME9Click
          end
        end
      end
      object ToolBarVideoPostProcessingEffectsPages: TToolBar
        Tag = 1
        Left = 16
        Top = 16
        Width = 549
        Height = 21
        Align = alNone
        ButtonWidth = 184
        EdgeBorders = [ebBottom]
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Images = FormMain.IL_MenuPopup
        List = True
        ParentFont = False
        ShowCaptions = True
        TabOrder = 3
        Transparent = True
        Wrapable = False
        object ButtonPageVideoEffectsBGFX: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'BGFX Post-Processing Effects'
          Enabled = False
          Grouped = True
          ImageIndex = 500
          Style = tbsCheck
          OnClick = ButtonPageVideoEffectsBGFXClick
        end
        object ButtonPageVideoEffectsHLSL: TToolButton
          Tag = 1
          Left = 172
          Top = 0
          AutoSize = True
          Caption = 'Direct3D Post-Processing Effects'
          Down = True
          Enabled = False
          Grouped = True
          ImageIndex = 1
          Style = tbsCheck
          OnClick = ButtonPageVideoEffectsBGFXClick
        end
        object ButtonPageVideoEffectsGLSL: TToolButton
          Tag = 2
          Left = 360
          Top = 0
          AutoSize = True
          Caption = 'OpenGL Post-Processing Effects'
          Enabled = False
          Grouped = True
          ImageIndex = 500
          Style = tbsCheck
          OnClick = ButtonPageVideoEffectsBGFXClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'LUA'
      object LabelLUAPluginsToEnable: TLabel
        Left = 16
        Top = 35
        Width = 151
        Height = 15
        Caption = 'List of LUA Plugins to Enable'
        Enabled = False
        Transparent = True
      end
      object LabelLUAPluginsToEnable2: TLabel
        Left = 171
        Top = 36
        Width = 107
        Height = 14
        Caption = '(check plugins to use)'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object AutobootBox: TAdvGroupBoxEx
        Left = 16
        Top = 289
        Width = 297
        Height = 152
        RoundEdges = True
        Caption = 'Auto-boot (LUA Scripts)'
        Ctl3D = True
        Enabled = False
        TabOrder = 0
        object LabelAutobootCommand: TLabel
          Left = 8
          Top = 20
          Width = 206
          Height = 15
          Caption = 'Execute Command After Machine Boot'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAutobootDelay: TLabel
          Left = 8
          Top = 64
          Width = 121
          Height = 15
          Hint = 'Delay Timer [%s]'
          HelpType = htKeyword
          HelpKeyword = 'sec'
          Caption = 'Delay Timer [00:00 sec]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object LabelAutobootLuaScript: TLabel
          Left = 8
          Top = 107
          Width = 218
          Height = 15
          Hint = 'Delay Timer [%u sec]'
          Caption = 'LUA Script to Execute After Machine Boot'
          ShowAccelChar = False
          Transparent = True
        end
        object AutobootCommand: TEdit
          Left = 8
          Top = 36
          Width = 236
          Height = 21
          Hint = 'Command to execute after machine boot'
          AutoSize = False
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
        object AutobootLuaScript: TEdit
          Left = 8
          Top = 123
          Width = 236
          Height = 21
          Hint = 'Script for debugger'
          TabStop = False
          AutoSize = False
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object AutobootLuaScriptSelectButton: TBitBtn
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
        object AutobootCommandButtonClear: TBitBtn
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
      end
      object GroupBoxAudio: TAdvGroupBoxEx
        Left = 632
        Top = 65
        Width = 222
        Height = 152
        RoundEdges = True
        ShadowColor = clSilver
        Caption = 'Audio'
        ParentCtl3D = True
        TabOrder = 4
        object LabelAudioLatency: TLabel
          Left = 95
          Top = 107
          Width = 76
          Height = 15
          Caption = 'Audio Latency'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSampleRate: TLabel
          Left = 8
          Top = 107
          Width = 65
          Height = 15
          Caption = 'Sample Rate'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelVolume: TLabel
          Left = 8
          Top = 64
          Width = 138
          Height = 15
          Hint = 'Volume Attenuation [%ddB]'
          Caption = 'Volume Attenuation [0dB]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object LabelSoundOutputMethod: TLabel
          Left = 8
          Top = 20
          Width = 109
          Height = 15
          Caption = 'Sound Output Mode'
          ShowAccelChar = False
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
        end
        object AudioLatency: TComboBox
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
        object SampleRate: TComboBox
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
        object ButtonAudioLatencyReset: TBitBtn
          Left = 177
          Top = 123
          Width = 38
          Height = 21
          Hint = 'Set default latency'
          Caption = 'Reset'
          TabOrder = 4
          OnClick = ButtonAudioLatencyResetClick
        end
        object SoundOutputMethod: TComboBox
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
        RoundEdges = True
        Caption = 'PortAudio Settings'
        Ctl3D = True
        TabOrder = 5
        object LabelPortAudioAPI: TLabel
          Left = 8
          Top = 20
          Width = 18
          Height = 15
          Caption = 'API'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelPortAudioDevice: TLabel
          Left = 8
          Top = 64
          Width = 35
          Height = 15
          Caption = 'Device'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelPortAudioLatency: TLabel
          Left = 8
          Top = 107
          Width = 103
          Height = 15
          Caption = 'Latency, in seconds'
          ShowAccelChar = False
          Transparent = True
        end
        object ButtonClearPortAudioAPI: TBitBtn
          Left = 172
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Click here to set API to "none"'
          Caption = 'Clear'
          TabOrder = 0
        end
        object PortAudioAPI: TEdit
          Left = 8
          Top = 36
          Width = 161
          Height = 21
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
        end
        object PortAudioDevice: TEdit
          Left = 8
          Top = 80
          Width = 161
          Height = 21
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object ButtonClearPortAudioDevice: TBitBtn
          Left = 172
          Top = 80
          Width = 43
          Height = 21
          Hint = 'Click here to set Device to "none"'
          Caption = 'Clear'
          TabOrder = 3
        end
        object PortAudioLatency: TEdit
          Left = 8
          Top = 124
          Width = 161
          Height = 21
          AutoSize = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnKeyPress = PortAudioLatencyKeyPress
        end
        object ButtonResetPortAudioLatency: TBitBtn
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
      object LabelCoinImpulse: TLabel
        Left = 168
        Top = 120
        Width = 100
        Height = 15
        Caption = 'Coin Impulse Time'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelControllerDefinitions: TLabel
        Left = 16
        Top = 120
        Width = 113
        Height = 15
        Caption = 'Controller Definitions'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelRecordInputTimecodeFile: TShadowLabel
        Left = 32
        Top = 398
        Width = 147
        Height = 15
        Caption = '(to be used with record input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object LabelExitAfterInputPlayback: TShadowLabel
        Left = 232
        Top = 398
        Width = 158
        Height = 15
        Caption = '(to be used with playback input)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
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
      end
      object CoinLockout: TAdvOfficeCheckBoxEx
        Left = 168
        Top = 92
        Width = 97
        Height = 20
        Hint = 'Ignore coin inputs if coin lockout ouput is active'
        Checked = True
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Coin Lockout'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
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
      end
      object JoystickBox: TAdvGroupBoxEx
        Left = 16
        Top = 163
        Width = 297
        Height = 85
        RoundEdges = True
        Caption = 'Joystick'
        ParentCtl3D = True
        TabOrder = 10
        object LabelJoystickDeadzone: TLabel
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
          Transparent = False
        end
        object LabelJoystickSaturation: TLabel
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
      object LabelAnalogSettings: TAdvGroupBoxEx
        Left = 562
        Top = 12
        Width = 289
        Height = 197
        RoundEdges = True
        Caption = 'Automatic Device Selection [Analog Controls]'
        ParentCtl3D = True
        TabOrder = 11
        object LabelAnalog_Paddle: TLabel
          Left = 8
          Top = 20
          Width = 36
          Height = 15
          Caption = 'Paddle'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Joystick: TLabel
          Left = 8
          Top = 64
          Width = 82
          Height = 15
          Caption = 'Analog Joystick'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_LightGun: TLabel
          Left = 152
          Top = 108
          Width = 52
          Height = 15
          Caption = 'Light Gun'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Pedal: TLabel
          Left = 152
          Top = 20
          Width = 29
          Height = 15
          Caption = 'Pedal'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Dial: TLabel
          Left = 152
          Top = 64
          Width = 20
          Height = 15
          Caption = 'Dial'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Trackball: TLabel
          Left = 152
          Top = 152
          Width = 48
          Height = 15
          Caption = 'Trackball'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Positional: TLabel
          Left = 8
          Top = 108
          Width = 52
          Height = 15
          Caption = 'Positional'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelAnalog_Mouse: TLabel
          Left = 8
          Top = 152
          Width = 36
          Height = 15
          Caption = 'Mouse'
          ShowAccelChar = False
          Transparent = True
        end
        object Analog_Paddle: TComboBox
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
        object Analog_Joystick: TComboBox
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
        object Analog_LightGun: TComboBox
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
        object Analog_Pedal: TComboBox
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
        object Analog_Dial: TComboBox
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
        object Analog_Trackball: TComboBox
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
        object Analog_Positional: TComboBox
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
        object Analog_Mouse: TComboBox
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
      end
      object CoinImpulse: TComboBox
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
      object ControllerDefinitions: TComboBox
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
        CheckBox.Hint = 'Enable local http server'
        CheckBox.Visible = True
        RoundEdges = True
        Caption = 'Enable HTTP Server'
        Enabled = False
        ParentCtl3D = True
        TabOrder = 15
        object Label2: TLabel
          Left = 8
          Top = 20
          Width = 22
          Height = 15
          Caption = 'Port'
          Enabled = False
          ShowAccelChar = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 56
          Top = 20
          Width = 119
          Height = 15
          Caption = 'Root Path to Web Files'
          Enabled = False
          ShowAccelChar = False
          Transparent = True
        end
        object HTTPPort: TEdit
          Left = 8
          Top = 36
          Width = 45
          Height = 21
          Hint = 'HTTP server listener port'
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = HTTPPortKeyPress
        end
        object HTTPPath: TEdit
          Left = 57
          Top = 36
          Width = 178
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object ButtonResetHTTPServer: TBitBtn
          Left = 238
          Top = 36
          Width = 43
          Height = 21
          Hint = 'Reset to default values'
          Caption = 'Reset'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ButtonResetHTTPServerClick
        end
      end
      object UIModeBox: TAdvGroupBoxEx
        Left = 562
        Top = 224
        Width = 289
        Height = 69
        RoundEdges = True
        Caption = 'Full Keyboard Emulation (User Interface Disabled)'
        ParentCtl3D = True
        TabOrder = 16
        object LabelUIModeKeyCustom: TLabel
          Left = 8
          Top = 24
          Width = 66
          Height = 15
          Caption = 'ON/OFF Key'
          ShowAccelChar = False
          Transparent = True
        end
        object UIModeKeyCustom: TEdit
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
        object ButtonUIModeKeyDetectKey: TBitBtn
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
          OnClick = ButtonUIModeKeyDetectKeyClick
        end
      end
      object CommOptionsBox: TAdvGroupBoxEx
        Left = 328
        Top = 12
        Width = 219
        Height = 236
        RoundEdges = True
        Caption = 'Comm Options'
        Ctl3D = True
        TabOrder = 17
        object LabelCommLocalHost: TLabel
          Left = 8
          Top = 20
          Width = 128
          Height = 15
          Caption = 'Local Address to Bind to'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelCommLocalPort: TLabel
          Left = 8
          Top = 64
          Width = 108
          Height = 15
          Caption = 'Local Port to Bind to'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelCommRemoteHost: TLabel
          Left = 8
          Top = 108
          Width = 128
          Height = 15
          Caption = 'Local Address to Bind to'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelCommRemotePort: TLabel
          Left = 8
          Top = 152
          Width = 108
          Height = 15
          Caption = 'Local Port to Bind to'
          ShowAccelChar = False
          Transparent = True
        end
        object CommLocalHost: TEdit
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
        object CommLocalPort: TEdit
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
        object CommRemoteHost: TEdit
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
        object CommRemotePort: TEdit
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
        object CommLocalHostButtonReset: TBitBtn
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
        object CommLocalPortButtonReset: TBitBtn
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
        object CommRemoteHostButtonReset: TBitBtn
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
        object CommRemotePortButtonReset: TBitBtn
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
      end
      object OSDInputOptionsGroupBox: TAdvGroupBoxEx
        Left = 16
        Top = 256
        Width = 297
        Height = 109
        Transparent = False
        RoundEdges = True
        Caption = 'OSD Input Options'
        Ctl3D = True
        Enabled = False
        TabOrder = 21
        object LabelOSDInputKeyboardProvider: TLabel
          Left = 8
          Top = 20
          Width = 97
          Height = 15
          Caption = 'Keyboard Provider'
          Transparent = True
        end
        object LabelOSDInputMouseProvider: TLabel
          Left = 8
          Top = 64
          Width = 83
          Height = 15
          Caption = 'Mouse Provider'
          Transparent = True
        end
        object LabelOSDInputLightgunProvider: TLabel
          Left = 152
          Top = 20
          Width = 95
          Height = 15
          Caption = 'Lightgun Provider'
          Transparent = True
        end
        object LabelOSDInputJoystickProvider: TLabel
          Left = 152
          Top = 64
          Width = 88
          Height = 15
          Caption = 'Joystick Provider'
          Transparent = True
        end
        object OSDInputKeyboardProvider: TComboBox
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
        object OSDInputMouseProvider: TComboBox
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
        object OSDInputLightgunProvider: TComboBox
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
        object OSDInputJoystickProvider: TComboBox
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
      object OSDOutputOptionsBox: TAdvGroupBoxEx
        Left = 328
        Top = 300
        Width = 217
        Height = 65
        RoundEdges = True
        Caption = 'OSD Output Options'
        Ctl3D = True
        TabOrder = 22
        object LabelOSDOutputProvider: TLabel
          Left = 8
          Top = 20
          Width = 85
          Height = 15
          Caption = 'Output Provider'
        end
        object OSDOutputProvider: TComboBox
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
      object LabelRAMSize: TLabel
        Left = 252
        Top = 100
        Width = 124
        Height = 15
        Caption = 'RAM Size (if supported)'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelSystemBios: TLabel
        Left = 465
        Top = 14
        Width = 156
        Height = 15
        Caption = 'Select the System BIOS to Use'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUIFont: TLabel
        Left = 252
        Top = 398
        Width = 95
        Height = 15
        Caption = 'User Inteface Font'
        Enabled = False
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUIFontProvider: TLabel
        Left = 372
        Top = 354
        Width = 44
        Height = 15
        Caption = 'Provider'
      end
      object LabelTypeUserInterface: TLabel
        Left = 252
        Top = 354
        Width = 115
        Height = 15
        Caption = 'Type of User Interface'
      end
      object LabelDisplayLanguage: TLabel
        Left = 16
        Top = 220
        Width = 168
        Height = 15
        Caption = 'User Interface Display Language'
        Enabled = False
      end
      object LabelSaveStateRewindBufferSize: TLabel
        Left = 16
        Top = 132
        Width = 187
        Height = 15
        Hint = 'Rewind Buffer Size [%u MegaBytes]'
        Caption = 'Rewind Buffer Size [100 MegaBytes]'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Transparent = False
      end
      object LabelSaveStateName: TLabel
        Left = 16
        Top = 176
        Width = 88
        Height = 15
        Caption = 'Save State Name'
        ShowAccelChar = False
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
      end
      object RAMSize: TEdit
        Left = 252
        Top = 116
        Width = 153
        Height = 21
        Hint = 'Size of RAM (if supported by driver)'
        AutoSize = False
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
      end
      object DebugGroupBox: TAdvGroupBoxEx
        Left = 252
        Top = 146
        Width = 197
        Height = 156
        CheckBox.Action = caNone
        CheckBox.Hint = 'Enable/disable debugger'
        CheckBox.Visible = True
        Transparent = False
        RoundEdges = True
        Caption = 'Enable Debugger'
        ParentCtl3D = True
        TabOrder = 6
        object LabelDebuggerScript: TLabel
          Left = 8
          Top = 110
          Width = 85
          Height = 15
          Caption = 'Debugger Script'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelWatchdog: TLabel
          Left = 8
          Top = 64
          Width = 55
          Height = 15
          Hint = 
            'Creates new thread that kills the application after a few second' +
            's'
          Caption = 'Watchdog'
        end
        object Label4: TLabel
          Left = 92
          Top = 64
          Width = 91
          Height = 15
          Caption = 'Debugger To Use'
          ShowAccelChar = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 55
          Top = 83
          Width = 22
          Height = 15
          Hint = 
            'Creates new thread that kills the application after a few second' +
            's'
          Caption = 'secs'
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
        end
        object DebuggerScript: TEdit
          Left = 8
          Top = 128
          Width = 137
          Height = 21
          Hint = 'Script for debugger'
          TabStop = False
          AutoSize = False
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object DebuggerScriptBrowse: TBitBtn
          Left = 146
          Top = 128
          Width = 43
          Height = 21
          Hint = 'Click here to select a file'
          Caption = 'Select'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = DebuggerScriptBrowseClick
        end
        object Watchdog: TEdit
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
        object Debugger: TComboBox
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
        OnItemCompare = BiosSetsListViewItemCompare
      end
      object UIFont: TEdit
        Left = 252
        Top = 414
        Width = 153
        Height = 21
        Hint = 'Specify a font to use'
        AutoSize = False
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 8
      end
      object UIFontSelectFontButton: TBitBtn
        Left = 407
        Top = 414
        Width = 43
        Height = 21
        Hint = 'Click here to select a font'
        Caption = 'Select'
        Enabled = False
        TabOrder = 9
        OnClick = UIFontSelectFontButtonClick
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
      end
      object RAMSizeButtonClear: TBitBtn
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
      end
      object UIFontProvider: TComboBox
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
      object TypeUserInterface: TComboBox
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
        Top = 238
        Width = 220
        Height = 199
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
      end
      object SaveNVRAMOnExit: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 72
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
      end
      object AutoSave: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 92
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
      end
      object EnableSaveStateRewind: TAdvOfficeCheckBoxEx
        Left = 16
        Top = 112
        Width = 152
        Height = 20
        Hint = 'Enable rewind save states'
        TabOrder = 20
        Alignment = taLeftJustify
        Caption = 'Enable Save State Rewind'
        ReturnIsTab = False
        Themed = True
      end
      object SaveStateRewindBufferSize: TGaugeBar
        Left = 16
        Top = 148
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
      object SaveStateName: TEdit
        Left = 16
        Top = 192
        Width = 175
        Height = 21
        Hint = 'Override of the default state subfolder naming; %g == gamename'
        AutoSize = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 22
      end
      object ButtonSaveStateNameReset: TBitBtn
        Left = 193
        Top = 192
        Width = 43
        Height = 21
        Hint = 'Set default save state name'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnClick = ButtonSaveStateNameResetClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'SDL'
      object SDKKeyboardMappingBox: TAdvGroupBoxEx
        Left = 16
        Top = 20
        Width = 249
        Height = 65
        CheckBox.Visible = True
        RoundEdges = True
        Caption = 'Enable SDL Keyboard Mapping'
        Ctl3D = True
        TabOrder = 0
        object LabelSDLKeymapFilename: TLabel
          Left = 8
          Top = 20
          Width = 94
          Height = 15
          Caption = 'Keymap Filename'
          Enabled = False
          ShowAccelChar = False
          Transparent = True
        end
        object SDLKeymapFilename: TEdit
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
        object ButtonSDLKeymapFilenameSelect: TBitBtn
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
          OnClick = ButtonSDLKeymapFilenameSelectClick
        end
        object ButtonSDLKeymapFilenameReset: TBitBtn
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
          OnClick = ButtonSDLKeymapFilenameResetClick
        end
      end
      object SDLJoystickMappingBox: TAdvGroupBoxEx
        Left = 362
        Top = 236
        Width = 240
        Height = 207
        RoundEdges = True
        Caption = 'Joystick Mapping                                             '
        Ctl3D = True
        TabOrder = 1
        object LabelSDLJoystickMapping1: TLabel
          Left = 8
          Top = 26
          Width = 13
          Height = 15
          Caption = '#1'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping2: TLabel
          Left = 8
          Top = 48
          Width = 13
          Height = 15
          Caption = '#2'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping3: TLabel
          Left = 8
          Top = 71
          Width = 13
          Height = 15
          Caption = '#3'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping4: TLabel
          Left = 8
          Top = 93
          Width = 13
          Height = 15
          Caption = '#4'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping5: TLabel
          Left = 8
          Top = 115
          Width = 13
          Height = 15
          Caption = '#5'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping6: TLabel
          Left = 8
          Top = 137
          Width = 13
          Height = 15
          Caption = '#6'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping7: TLabel
          Left = 8
          Top = 159
          Width = 13
          Height = 15
          Caption = '#7'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLJoystickMapping8: TLabel
          Left = 8
          Top = 181
          Width = 13
          Height = 15
          Caption = '#8'
          ShowAccelChar = False
          Transparent = True
        end
        object SDLJoystickMapping1: TComboBox
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
        object SDLJoystickMapping1Custom: TEdit
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping2: TComboBox
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
        object SDLJoystickMapping2Custom: TEdit
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping3: TComboBox
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
        object SDLJoystickMapping3Custom: TEdit
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping4: TComboBox
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
        object SDLJoystickMapping4Custom: TEdit
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping5: TComboBox
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
        object SDLJoystickMapping5Custom: TEdit
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping6: TComboBox
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
        object SDLJoystickMapping6Custom: TEdit
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping7: TComboBox
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
        object SDLJoystickMapping7Custom: TEdit
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLJoystickMapping8: TComboBox
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
        object SDLJoystickMapping8Custom: TEdit
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
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
          Themed = True
        end
      end
      object SDLLightgunMappingBox: TAdvGroupBoxEx
        Left = 617
        Top = 236
        Width = 240
        Height = 207
        RoundEdges = True
        Caption = 'Lightgun Mapping (XInput)'
        Ctl3D = True
        TabOrder = 2
        object LabelSDLLightgunMapping1: TLabel
          Left = 8
          Top = 27
          Width = 13
          Height = 15
          Caption = '#1'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping2: TLabel
          Left = 8
          Top = 49
          Width = 13
          Height = 15
          Caption = '#2'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping3: TLabel
          Left = 8
          Top = 71
          Width = 13
          Height = 15
          Caption = '#3'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping4: TLabel
          Left = 8
          Top = 93
          Width = 13
          Height = 15
          Caption = '#4'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping5: TLabel
          Left = 8
          Top = 115
          Width = 13
          Height = 15
          Caption = '#5'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping6: TLabel
          Left = 8
          Top = 137
          Width = 13
          Height = 15
          Caption = '#6'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping7: TLabel
          Left = 8
          Top = 158
          Width = 13
          Height = 15
          Caption = '#7'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLLightgunMapping8: TLabel
          Left = 8
          Top = 180
          Width = 13
          Height = 15
          Caption = '#8'
          ShowAccelChar = False
          Transparent = True
        end
        object SDLLightgunMapping1: TComboBox
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
        object SDLLightgunMapping1Custom: TEdit
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping2: TComboBox
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
        object SDLLightgunMapping2Custom: TEdit
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping3: TComboBox
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
        object SDLLightgunMapping3Custom: TEdit
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping4: TComboBox
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
        object SDLLightgunMapping4Custom: TEdit
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping5: TComboBox
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
        object SDLLightgunMapping5Custom: TEdit
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping6: TComboBox
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
        object SDLLightgunMapping6Custom: TEdit
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping7: TComboBox
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
        object SDLLightgunMapping7Custom: TEdit
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDLLightgunMapping8: TComboBox
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
        object SDLLightgunMapping8Custom: TEdit
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
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
      object SDL2MouseMappingBox: TAdvGroupBoxEx
        Left = 617
        Top = 20
        Width = 240
        Height = 207
        RoundEdges = True
        Caption = 'Mouse Mapping (SDL 2)'
        Ctl3D = True
        TabOrder = 3
        object LabelSDL2MouseMapping1: TLabel
          Left = 8
          Top = 27
          Width = 13
          Height = 15
          Caption = '#1'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping2: TLabel
          Left = 8
          Top = 49
          Width = 13
          Height = 15
          Caption = '#2'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping3: TLabel
          Left = 8
          Top = 71
          Width = 13
          Height = 15
          Caption = '#3'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping4: TLabel
          Left = 8
          Top = 93
          Width = 13
          Height = 15
          Caption = '#4'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping5: TLabel
          Left = 8
          Top = 115
          Width = 13
          Height = 15
          Caption = '#5'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping6: TLabel
          Left = 8
          Top = 137
          Width = 13
          Height = 15
          Caption = '#6'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping7: TLabel
          Left = 8
          Top = 158
          Width = 13
          Height = 15
          Caption = '#7'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2MouseMapping8: TLabel
          Left = 8
          Top = 180
          Width = 13
          Height = 15
          Caption = '#8'
          ShowAccelChar = False
          Transparent = True
        end
        object SDL2MouseMapping1: TComboBox
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
        object SDL2MouseMapping1Custom: TEdit
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping2: TComboBox
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
        object SDL2MouseMapping2Custom: TEdit
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping3: TComboBox
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
        object SDL2MouseMapping3Custom: TEdit
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping4: TComboBox
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
        object SDL2MouseMapping4Custom: TEdit
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping5: TComboBox
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
        object SDL2MouseMapping5Custom: TEdit
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping6: TComboBox
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
        object SDL2MouseMapping6Custom: TEdit
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping7: TComboBox
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
        object SDL2MouseMapping7Custom: TEdit
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2MouseMapping8: TComboBox
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
        object SDL2MouseMapping8Custom: TEdit
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
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
      object SDL2KeyboardMappingBox: TAdvGroupBoxEx
        Left = 362
        Top = 20
        Width = 240
        Height = 207
        RoundEdges = True
        Caption = 'Keyboard Mapping (SDL 2)'
        Ctl3D = True
        TabOrder = 4
        object LabelSDL2KeyboardMapping1: TLabel
          Left = 8
          Top = 27
          Width = 13
          Height = 15
          Caption = '#1'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping2: TLabel
          Left = 8
          Top = 49
          Width = 13
          Height = 15
          Caption = '#2'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping3: TLabel
          Left = 8
          Top = 71
          Width = 13
          Height = 15
          Caption = '#3'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping4: TLabel
          Left = 8
          Top = 93
          Width = 13
          Height = 15
          Caption = '#4'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping5: TLabel
          Left = 8
          Top = 115
          Width = 13
          Height = 15
          Caption = '#5'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping6: TLabel
          Left = 8
          Top = 137
          Width = 13
          Height = 15
          Caption = '#6'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping7: TLabel
          Left = 8
          Top = 158
          Width = 13
          Height = 15
          Caption = '#7'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2KeyboardMapping8: TLabel
          Left = 8
          Top = 180
          Width = 13
          Height = 15
          Caption = '#8'
          ShowAccelChar = False
          Transparent = True
        end
        object SDL2KeyboardMapping1: TComboBox
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
        object SDL2KeyboardMapping1Custom: TEdit
          Left = 129
          Top = 24
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping2: TComboBox
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
        object SDL2KeyboardMapping2Custom: TEdit
          Left = 129
          Top = 46
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping3: TComboBox
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
        object SDL2KeyboardMapping3Custom: TEdit
          Left = 129
          Top = 68
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping4: TComboBox
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
        object SDL2KeyboardMapping4Custom: TEdit
          Left = 129
          Top = 90
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping5: TComboBox
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
        object SDL2KeyboardMapping5Custom: TEdit
          Left = 129
          Top = 112
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping6: TComboBox
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
        object SDL2KeyboardMapping6Custom: TEdit
          Left = 129
          Top = 134
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping7: TComboBox
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
        object SDL2KeyboardMapping7Custom: TEdit
          Left = 129
          Top = 156
          Width = 103
          Height = 21
          AutoSize = False
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
        object SDL2KeyboardMapping8: TComboBox
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
        object SDL2KeyboardMapping8Custom: TEdit
          Left = 129
          Top = 178
          Width = 103
          Height = 21
          AutoSize = False
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
      end
      object SDLOutputModeBox: TAdvGroupBoxEx
        Left = 16
        Top = 166
        Width = 249
        Height = 87
        RoundEdges = True
        Caption = 'Output Mode'
        ParentCtl3D = True
        TabOrder = 6
        object LabelSDLScaleMode: TLabel
          Left = 8
          Top = 42
          Width = 196
          Height = 15
          Caption = 'Scale Mode (Software Renderer Only)'
          ShowAccelChar = False
          Transparent = True
        end
        object SDLCenterHorizontally: TAdvOfficeCheckBoxEx
          Left = 8
          Top = 20
          Width = 129
          Height = 20
          Hint = 'Center horizontally within the view area'
          Checked = True
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Center Horizontally'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
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
        end
        object SDLScaleMode: TComboBox
          Left = 8
          Top = 58
          Width = 233
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
      end
      object SDLLowLevelDriver: TAdvGroupBoxEx
        Left = 16
        Top = 334
        Width = 331
        Height = 109
        RoundEdges = True
        Caption = 'SDL Low Level Driver'
        Ctl3D = True
        TabOrder = 8
        object LabelSDLVideoDriverToUse: TLabel
          Left = 8
          Top = 20
          Width = 87
          Height = 15
          Caption = 'SDL Video Driver'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDL2RenderDriverToUse: TLabel
          Left = 112
          Top = 20
          Width = 103
          Height = 15
          Caption = 'SDL 2 Render Driver'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLAudioDriverToUse: TLabel
          Left = 222
          Top = 20
          Width = 89
          Height = 15
          Caption = 'SDL Audio Driver'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelSDLAlternativeLibGLToUse: TLabel
          Left = 8
          Top = 64
          Width = 102
          Height = 15
          Caption = 'Alternative libGL.so'
          ShowAccelChar = False
          Transparent = True
        end
        object SDLVideoDriverToUse: TComboBox
          Left = 8
          Top = 36
          Width = 101
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
            'X11'
            'DirectFB')
        end
        object SDL2RenderDriverToUse: TComboBox
          Left = 112
          Top = 36
          Width = 107
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
            'Software'
            'OpenGL'
            'DirectFB')
        end
        object SDLAudioDriverToUse: TComboBox
          Left = 222
          Top = 36
          Width = 101
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
            'Alsa'
            'Arts')
        end
        object SDLAlternativeLibGLToUse: TComboBox
          Left = 8
          Top = 80
          Width = 103
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
          OnSelect = SDLAlternativeLibGLToUseSelect
          Items.Strings = (
            'Auto'
            'Custom')
        end
        object SDLAlternativeLibGLToUseCustom: TEdit
          Left = 114
          Top = 80
          Width = 165
          Height = 21
          AutoSize = False
          Enabled = False
          TabOrder = 4
        end
        object ButtonSDLAlternativeLibGLToUseCustom: TBitBtn
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
          OnClick = ButtonSDLAlternativeLibGLToUseCustomClick
        end
      end
    end
  end
  object ButtonReadFile: TBitBtn
    Left = 16
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Reload configuration files'
    Caption = 'Reload Settings'
    TabOrder = 1
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 665
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TBitBtn
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
  object ToolBarPages: TToolBar
    Left = 300
    Top = 80
    Width = 568
    Height = 21
    Align = alNone
    ButtonWidth = 97
    Color = clBtnFace
    Constraints.MaxWidth = 900
    EdgeBorders = [ebBottom]
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = FormMain.IL_MenuPopup
    List = True
    ParentColor = False
    ParentFont = False
    ShowCaptions = True
    TabOrder = 5
    Transparent = True
    Wrapable = False
    object ButtonPageFolders: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'Folders'
      Down = True
      Grouped = True
      ImageIndex = 1
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageVideo1: TToolButton
      Tag = 1
      Left = 66
      Top = 0
      AutoSize = True
      Caption = 'Video'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageVideo2: TToolButton
      Tag = 2
      Left = 123
      Top = 0
      AutoSize = True
      Caption = 'Video 2'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageVideo3: TToolButton
      Tag = 3
      Left = 189
      Top = 0
      AutoSize = True
      Caption = 'Video 3'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageLUA_Audio: TToolButton
      Tag = 4
      Left = 255
      Top = 0
      AutoSize = True
      Caption = 'LUA and Audio'
      Grouped = True
      ImageIndex = 501
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageInput: TToolButton
      Tag = 5
      Left = 356
      Top = 0
      AutoSize = True
      Caption = 'Input'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageMisc: TToolButton
      Tag = 6
      Left = 413
      Top = 0
      AutoSize = True
      Caption = 'Miscellaneous'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
    object ButtonPageSDLMAMEInput: TToolButton
      Tag = 7
      Left = 509
      Top = 0
      AutoSize = True
      Caption = 'SDL'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
  end
  object ButtonResetToDefault: TBitBtn
    Left = 109
    Top = 546
    Width = 89
    Height = 25
    Hint = 'Load only emulator default settings'
    Caption = 'Reset to Default'
    TabOrder = 6
    OnClick = ButtonResetToDefaultClick
  end
  object ButtonReadFileHelp: TBitBtn
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
    TabOrder = 7
    OnClick = ButtonReadFileHelpClick
  end
  object ButtonHelpSaveValidateAllCustomFiles: TBitBtn
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
    TabOrder = 8
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
    TabOrder = 9
    OnClick = SaveValidateAllCustomFilesClick
    Alignment = taLeftJustify
    Caption = 'Validate All Custom Files on Save'
    ReturnIsTab = False
    ShadowColor = clSkyBlue
    Themed = True
  end
end
