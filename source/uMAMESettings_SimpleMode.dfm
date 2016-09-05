object FormMAMESettings_SimpleMode: TFormMAMESettings_SimpleMode
  Left = 539
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (Basic Mode)'
  ClientHeight = 414
  ClientWidth = 565
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
    Top = 72
    Width = 565
    Height = 311
    Color = 15856113
    ParentColor = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Folders'
      object FolderROMsDisksBox: TLabel
        Left = 9
        Top = 15
        Width = 169
        Height = 15
        Caption = 'Path to ROM Sets and CHD Files'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelFolderGameSnapshots: TLabel
        Left = 9
        Top = 211
        Width = 155
        Height = 15
        Caption = 'Directory to Save Screenshots'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderNVRAM: TLabel
        Left = 295
        Top = 211
        Width = 185
        Height = 15
        Caption = 'Directory to Save NVRAM Contents'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderArtworks: TLabel
        Left = 295
        Top = 120
        Width = 219
        Height = 15
        Caption = 'Path to Artwork Files / Effect Overlay Files'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderSamples: TLabel
        Left = 9
        Top = 257
        Width = 104
        Height = 15
        Caption = 'Path to Sample Sets'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderInputDeviceLogs: TLabel
        Left = 294
        Top = 257
        Width = 186
        Height = 15
        Caption = 'Directory to Save Input Device Logs'
        ParentShowHint = False
        ShowHint = False
      end
      object LabelFolderIniFiles: TLabel
        Left = 9
        Top = 120
        Width = 80
        Height = 15
        Caption = 'Path to Ini Files'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = False
        Transparent = True
      end
      object FolderROMs: TEasyListview
        Tag = 1
        Left = 8
        Top = 32
        Width = 462
        Height = 80
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
          00060000008008000101000100000000000001CA010000FFFFFF1F0001000000
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
        Selection.Gradient = True
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
        Left = 471
        Top = 32
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
        Left = 514
        Top = 32
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
        Left = 471
        Top = 70
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
        Left = 514
        Top = 70
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 4
        OnClick = FolderROMsButtonEditClick
      end
      object FolderROMsButtonDelete: TBitBtn
        Left = 471
        Top = 91
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 5
        OnClick = FolderROMsButtonDeleteClick
      end
      object FolderROMsButtonClear: TBitBtn
        Left = 514
        Top = 91
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
        Left = 9
        Top = 274
        Width = 217
        Height = 21
        Hint = 'Path to Sample Sets'
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
        Left = 228
        Top = 274
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
        Left = 9
        Top = 228
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
        Left = 228
        Top = 228
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = FolderGameSnapshotsButtonSelectClick
      end
      object FolderNVRAM: TEdit
        Left = 295
        Top = 228
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
        TabOrder = 11
      end
      object FolderNVRAMButtonSelect: TBitBtn
        Left = 514
        Top = 228
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = FolderNVRAMButtonSelectClick
      end
      object FolderArtworks: TEasyListview
        Tag = 1
        Left = 295
        Top = 137
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
        Selection.Gradient = True
        Selection.GradientColorBottom = 16506264
        Selection.GradientColorTop = 15582647
        Selection.InactiveBorderColor = 10902593
        Selection.InactiveColor = 15582647
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 13
        View = elsReport
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderArtworksKeyAction
      end
      object FolderArtworksButtonUp: TBitBtn
        Tag = 1
        Left = 295
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonDown: TBitBtn
        Left = 338
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        TabStop = False
        OnClick = FolderArtworksButtonUpClick
      end
      object FolderArtworksButtonSelect: TBitBtn
        Left = 385
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = FolderArtworksButtonSelectClick
      end
      object FolderArtworksButtonEdit: TBitBtn
        Left = 428
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 17
        OnClick = FolderArtworksButtonEditClick
      end
      object FolderArtworksButtonDelete: TBitBtn
        Left = 471
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 18
        OnClick = FolderArtworksButtonDeleteClick
      end
      object FolderArtworksButtonClear: TBitBtn
        Left = 514
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = FolderArtworksButtonClearClick
      end
      object FolderInputDeviceLogs: TEdit
        Left = 294
        Top = 274
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
        TabOrder = 20
      end
      object FolderInputDeviceLogsButtonSelect: TBitBtn
        Left = 513
        Top = 274
        Width = 43
        Height = 21
        Hint = 'Click here to select a folder'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnClick = FolderInputDeviceLogsButtonSelectClick
      end
      object FolderIniFiles: TEasyListview
        Tag = 1
        Left = 8
        Top = 137
        Width = 262
        Height = 44
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
        Selection.Gradient = True
        Selection.GradientColorBottom = 16506264
        Selection.GradientColorTop = 15582647
        Selection.InactiveBorderColor = 10902593
        Selection.InactiveColor = 15582647
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.MultiSelect = True
        Selection.RoundRectRadius = 2
        Selection.TextColor = clBlack
        Selection.UseFocusRect = False
        TabOrder = 22
        View = elsReport
        OnItemEdited = FolderROMsItemEdited
        OnItemEditEnd = FolderROMsItemEditEnd
        OnKeyAction = FolderIniFilesKeyAction
      end
      object FolderIniFilesButtonUp: TBitBtn
        Tag = 1
        Left = 8
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Move selected folder up'
        Caption = 'Up'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonDown: TBitBtn
        Left = 51
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Move selected folder down'
        Caption = 'Down'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        TabStop = False
        OnClick = FolderIniFilesButtonUpClick
      end
      object FolderIniFilesButtonSelect: TBitBtn
        Left = 98
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to select folders'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        OnClick = FolderIniFilesButtonSelectClick
      end
      object FolderIniFilesButtonEdit: TBitBtn
        Left = 141
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to edit the selected folder [F2]'
        Caption = 'Edit'
        TabOrder = 26
        OnClick = FolderIniFilesButtonEditClick
      end
      object FolderIniFilesButtonDelete: TBitBtn
        Left = 184
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to delete selected folders [DEL]'
        Caption = 'Delete'
        TabOrder = 27
        OnClick = FolderIniFilesButtonDeleteClick
      end
      object FolderIniFilesButtonClear: TBitBtn
        Left = 227
        Top = 183
        Width = 43
        Height = 21
        Hint = 'Click here to clear folders list'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnClick = FolderIniFilesButtonClearClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Video and Audio'
      object LabelVideoOutputMode: TAdvGroupBox
        Left = 8
        Top = 15
        Width = 141
        Height = 165
        RoundEdges = True
        Caption = 'Output Mode'
        ParentCtl3D = True
        TabOrder = 1
        object LabelScreenResolution: TLabel
          Left = 8
          Top = 120
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
          Left = 85
          Top = 120
          Width = 14
          Height = 15
          Caption = 'Hz'
          Transparent = True
        end
        object WindowMode: TAdvOfficeCheckBox
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
        object MaximizeWindow: TAdvOfficeCheckBox
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
        end
        object KeepAspectRatio: TAdvOfficeCheckBox
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
        end
        object WaitVerticalSync: TAdvOfficeCheckBox
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
        end
        object HardwareStretch: TAdvOfficeCheckBox
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
        end
        object ScreenResolution: TComboBox
          Left = 8
          Top = 136
          Width = 76
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
        object ScreenRefreshRate: TComboBox
          Left = 85
          Top = 136
          Width = 48
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
      object FullScreenBox: TAdvGroupBox
        Left = 412
        Top = 15
        Width = 125
        Height = 63
        RoundEdges = True
        Caption = 'Full Screen'
        ParentCtl3D = True
        TabOrder = 3
        object TripleBuffer: TAdvOfficeCheckBox
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
        end
        object SwitchResolution: TAdvOfficeCheckBox
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
        end
      end
      object PerformanceGroupBox: TAdvGroupBox
        Left = 164
        Top = 15
        Width = 233
        Height = 63
        Transparent = False
        RoundEdges = True
        Caption = 'Performance'
        ParentCtl3D = True
        TabOrder = 2
        object LabelFrameskip: TLabel
          Left = 214
          Top = 22
          Width = 6
          Height = 15
          Caption = '0'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object AutoFrameskip: TAdvOfficeCheckBox
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
        end
        object Throttle: TAdvOfficeCheckBox
          Left = 127
          Top = 40
          Width = 63
          Height = 20
          Hint = 'Enable throttling to keep game running in sync with real time'
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Throttle'
          ReturnIsTab = False
          State = cbChecked
          Themed = True
        end
        object SyncronizeRefreshRate: TAdvOfficeCheckBox
          Left = 8
          Top = 40
          Width = 113
          Height = 20
          Hint = 
            'Enables speed throttling only to the refresh of your monitor'#13#10'Th' +
            'is means that the game'#39's actual refresh rate is ignored'
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Sync Refresh Rate'
          ReturnIsTab = False
          Themed = True
        end
        object Frameskip: TGaugeBar
          Left = 128
          Top = 20
          Width = 81
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
      object Mouse: TAdvOfficeCheckBox
        Left = 164
        Top = 162
        Width = 97
        Height = 20
        Hint = 'Enable mouse input'
        TabOrder = 5
        Alignment = taLeftJustify
        Caption = 'Enable Mouse'
        ReturnIsTab = False
        Themed = True
      end
      object Joystick: TAdvOfficeCheckBox
        Left = 300
        Top = 162
        Width = 99
        Height = 20
        Hint = 'Enable joystick input'
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'Enable Joystick'
        ReturnIsTab = False
        Themed = True
      end
      object SkipGameInfo: TAdvOfficeCheckBox
        Left = 412
        Top = 115
        Width = 103
        Height = 20
        Hint = 'Skip displaying the information screen at startup'
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'Skip Game Info'
        ReturnIsTab = False
        Themed = True
      end
      object Cheat: TAdvOfficeCheckBox
        Left = 412
        Top = 135
        Width = 105
        Height = 20
        Hint = 'Enable cheat subsystem'
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Cheats Enabled'
        ReturnIsTab = False
        Themed = True
      end
      object LabelScreenRotation: TAdvGroupBox
        Left = 164
        Top = 91
        Width = 233
        Height = 63
        RoundEdges = True
        Caption = 'Screen Rotation'
        ParentCtl3D = True
        TabOrder = 9
        object FlipX: TAdvOfficeCheckBox
          Left = 8
          Top = 40
          Width = 96
          Height = 20
          Hint = 'Flip screen upside-down'
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = 'Flip Left-Right'
          ReturnIsTab = False
          Themed = True
        end
        object FlipY: TAdvOfficeCheckBox
          Left = 117
          Top = 40
          Width = 113
          Height = 20
          Hint = 'Flip screen left-right'
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Flip Upside-Down'
          ReturnIsTab = False
          Themed = True
        end
        object RotateRight: TAdvOfficeCheckBox
          Left = 117
          Top = 20
          Width = 51
          Height = 20
          Hint = 'Rotate screen clockwise 90 degrees'
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = 'Right'
          ReturnIsTab = False
          Themed = True
        end
        object RotateLeft: TAdvOfficeCheckBox
          Left = 8
          Top = 20
          Width = 41
          Height = 20
          Hint = 'Rotate screen counterclockwise 90 degrees'
          TabOrder = 3
          Alignment = taLeftJustify
          Caption = 'Left'
          ReturnIsTab = False
          Themed = True
        end
      end
      object ReadConfigFiles: TAdvOfficeCheckBox
        Left = 412
        Top = 95
        Width = 113
        Height = 20
        Hint = 'Enable loading of configuration files'
        Checked = True
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Read Config Files'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
      end
      object GroupBoxAudio: TAdvGroupBox
        Left = 364
        Top = 192
        Width = 189
        Height = 84
        RoundEdges = True
        ShadowColor = clSilver
        Caption = 'Audio'
        ParentCtl3D = True
        TabOrder = 4
        object LabelSampleRate: TLabel
          Left = 100
          Top = 40
          Width = 65
          Height = 15
          Caption = 'Sample Rate'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelVolume: TLabel
          Left = 8
          Top = 40
          Width = 72
          Height = 15
          Hint = 'Volume [%ddB]'
          Caption = 'Volume [0dB]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object Samples: TAdvOfficeCheckBox
          Left = 100
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
        end
        object SampleRate: TComboBox
          Left = 100
          Top = 56
          Width = 82
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
          Top = 56
          Width = 85
          Height = 20
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
        object EnableSound: TAdvOfficeCheckBox
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
        end
      end
      object VectorGroupBox: TAdvGroupBox
        Left = 8
        Top = 192
        Width = 328
        Height = 84
        RoundEdges = True
        Caption = 'Vector'
        ParentCtl3D = True
        TabOrder = 0
        object LabelVectorBeamWidth: TLabel
          Left = 8
          Top = 40
          Width = 113
          Height = 15
          Hint = 'Beam Width [%2.2f]'
          AutoSize = False
          Caption = 'Beam Width [1.00]'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = False
          Transparent = False
        end
        object LabelVectorFlickerEffect: TLabel
          Left = 168
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
        object Antialias: TAdvOfficeCheckBox
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
        end
        object VectorBeamWidth: TGaugeBar2
          Left = 8
          Top = 56
          Width = 153
          Height = 20
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
          Left = 168
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
      end
    end
  end
  object ButtonReadFile: TBitBtn
    Left = 8
    Top = 383
    Width = 89
    Height = 25
    Hint = 'Reload configuration files'
    Caption = 'Reload Settings'
    TabOrder = 1
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 370
    Top = 383
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TBitBtn
    Left = 468
    Top = 383
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
    Height = 60
    Color1 = 15792869
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 477
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
    object LabelEmulatorVersion: TShadowLabel
      Left = 86
      Top = 28
      Width = 370
      Height = 25
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 48
      Height = 48
      Transparent = True
    end
    object GameIcon: TImage
      Left = 56
      Top = 28
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 453
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
  end
  object ToolBarPages: TToolBar
    Left = 365
    Top = 60
    Width = 200
    Height = 21
    Align = alNone
    ButtonWidth = 126
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
      Caption = 'Video / Audio / Input'
      Grouped = True
      ImageIndex = 500
      Style = tbsCheck
      OnClick = ButtonPageFoldersClick
    end
  end
  object ButtonResetToDefault: TBitBtn
    Left = 101
    Top = 383
    Width = 89
    Height = 25
    Hint = 'Load only emulator default settings'
    Caption = 'Reset to Default'
    TabOrder = 6
    OnClick = ButtonResetToDefaultClick
  end
  object ButtonReadFileHelp: TBitBtn
    Left = 194
    Top = 388
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
    Left = 144
    Top = 62
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
    TabOrder = 9
    OnClick = ButtonHelpSaveValidateAllCustomFilesClick
  end
  object SaveValidateAllCustomFiles: TAdvOfficeCheckBox
    Left = 162
    Top = 60
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
  end
end
