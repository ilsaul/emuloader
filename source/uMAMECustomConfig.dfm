object FormMAMECustomConfiguration: TFormMAMECustomConfiguration
  Left = 224
  Top = 208
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'MAME Custom Configuration'
  ClientHeight = 422
  ClientWidth = 626
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -1
    Top = -1
    Width = 628
    Height = 43
  end
  object LabelGameDescription: TLabel
    Left = 48
    Top = 14
    Width = 561
    Height = 15
    AutoSize = False
    Caption = 'This is the description of the selected game'
    ShowAccelChar = False
    Transparent = True
  end
  object GameIcon: TImage
    Left = 8
    Top = 4
    Width = 32
    Height = 32
    AutoSize = True
    Transparent = True
  end
  object ButtonOk: TButton
    Left = 456
    Top = 392
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 544
    Top = 392
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object ButtonReadMAMEgamenameIni: TButton
    Left = 8
    Top = 392
    Width = 153
    Height = 23
    Hint = 'Read all data from file "gamename.ini"'
    Caption = '&Read "gamename.ini"'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonReadMAMEgamenameIniClick
  end
  object PageControlMAMEOptions: TPageControl
    Left = 8
    Top = 48
    Width = 609
    Height = 337
    ActivePage = TabSheetMAMEOptions
    HotTrack = True
    Images = MAMEConfigImageList
    TabIndex = 1
    TabOrder = 3
    TabStop = False
    object TabSheetMAMEFolders: TTabSheet
      Caption = 'Folders'
      object PageControlFolders: TPageControl
        Left = 8
        Top = 8
        Width = 585
        Height = 289
        ActivePage = TabSheet2
        Images = MAMEConfigImageList
        ParentShowHint = False
        ShowHint = True
        TabIndex = 0
        TabOrder = 0
        object TabSheet2: TTabSheet
          object GeneralFolders1Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 0
            Transparent = True
          end
          object LabelFolderROMs: TGroupBox
            Left = 64
            Top = 16
            Width = 249
            Height = 57
            Caption = 'ROMs'
            TabOrder = 1
            object FolderROMs: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Path to romsets'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderROMsButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select folders (can have more than one)'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderSaveStates: TGroupBox
            Left = 320
            Top = 16
            Width = 249
            Height = 57
            Caption = 'Save States'
            TabOrder = 2
            object FolderSaveStates: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory to save states'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderSaveStatesButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderSamples: TGroupBox
            Left = 64
            Top = 80
            Width = 249
            Height = 57
            Caption = 'Samples'
            TabOrder = 3
            object FolderSamples: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Path to samplesets'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderSamplesButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderGamesConfiguration: TGroupBox
            Left = 64
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Games Configuration'
            TabOrder = 4
            object FolderGamesConfiguration: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory to save configurations'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderGamesConfigurationButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderHighScores: TGroupBox
            Left = 320
            Top = 80
            Width = 249
            Height = 57
            Caption = 'High Scores'
            TabOrder = 5
            object FolderHighScores: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory to save hiscores'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderHighScoresButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderNVRAM: TGroupBox
            Left = 320
            Top = 144
            Width = 249
            Height = 57
            Caption = 'NVRAM'
            TabOrder = 6
            object FolderNVRAM: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory to save nvram contents'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderNVRAMButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
        object TabSheet3: TTabSheet
          object GeneralFolders2Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 0
            Transparent = True
          end
          object LabelFolderMemoryCards: TGroupBox
            Left = 64
            Top = 16
            Width = 249
            Height = 57
            Caption = 'Memory Cards'
            TabOrder = 1
            object FolderMemoryCards: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory to save memory card contents'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderMemoryCardsButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderDiff: TGroupBox
            Left = 320
            Top = 16
            Width = 249
            Height = 57
            Caption = 'Diff'
            TabOrder = 2
            object FolderDiff: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for hard drive image difference files'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderDiffButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderGamesRecording: TGroupBox
            Left = 64
            Top = 80
            Width = 249
            Height = 57
            Caption = 'Inputs Recording'
            TabOrder = 3
            object FolderInputsRecording: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for recordings'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderInputsRecordingButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderArtworks: TGroupBox
            Left = 64
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Artworks'
            TabOrder = 4
            object FolderArtworksButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderArtworks: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for Artwork (Overlays etc.)'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderInGameSnapshots: TGroupBox
            Left = 320
            Top = 80
            Width = 249
            Height = 57
            Caption = 'Snapshots'
            TabOrder = 5
            object FolderSnapshots: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for screenshots (.png format)'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderSnapshotsButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderKeysMapping: TGroupBox
            Left = 320
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Keys Mapping'
            TabOrder = 6
            object FolderKeysMapping: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for preconfigured controller keys'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderKeysMappingButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
      end
    end
    object TabSheetMAMEOptions: TTabSheet
      Caption = 'Options'
      ImageIndex = 1
      object PageControlGeneralOptions: TPageControl
        Left = 8
        Top = 8
        Width = 585
        Height = 289
        ActivePage = TabSheetMAMEDisplay
        HotTrack = True
        Images = MAMEConfigImageList
        TabIndex = 0
        TabOrder = 0
        TabStop = False
        object TabSheetMAMEDisplay: TTabSheet
          Caption = 'Display'
          ImageIndex = 2
          object LabelResolution: TLabel
            Left = 64
            Top = 16
            Width = 50
            Height = 13
            Caption = 'Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGamma: TLabel
            Left = 408
            Top = 16
            Width = 35
            Height = 13
            Caption = 'Gamma'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGammaValue: TLabel
            Left = 474
            Top = 35
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCustomResolution: TLabel
            Left = 232
            Top = 16
            Width = 57
            Height = 13
            Caption = 'Custom Res'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelResolutionValue: TLabel
            Left = 130
            Top = 35
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object Gamma: TGaugeBar2
            Left = 408
            Top = 32
            Width = 65
            Height = 20
            Hint = 'Set the global gamma correction in the game'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.5
            Max = 2
            Min = 0.5
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.01
            Position = 0.5
            OnChange = GammaChange
          end
          object AutoFrameSkip: TCheckBox
            Left = 64
            Top = 72
            Width = 153
            Height = 17
            Hint = 
              'Automatically determines the frameskip level while you'#39're playin' +
              'g the game to keep the game running at full speed'
            Caption = 'Auto Frame Skip'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
          end
          object HardwareStretch: TCheckBox
            Left = 64
            Top = 168
            Width = 153
            Height = 17
            Hint = 'Stretch video using the hardware (direct draw must be on)'
            Caption = 'Hardware Stretch'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
          end
          object DirectDraw: TCheckBox
            Left = 232
            Top = 192
            Width = 153
            Height = 17
            Hint = 'Use DirectDraw for rendering'
            Caption = 'Direct Draw'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 3
          end
          object SwitchResolution: TCheckBox
            Left = 232
            Top = 96
            Width = 153
            Height = 17
            Hint = 
              'Switch resolutions to best fit (direct draw and full screen must' +
              ' be on)'
            Caption = 'Switch Resolution'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 4
          end
          object SwitchColorDepth: TCheckBox
            Left = 64
            Top = 96
            Width = 153
            Height = 17
            Hint = 'Switch color depths to best fit (Direct Draw must be on)'
            Caption = 'Switch Color Depth'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
          end
          object Window: TCheckBox
            Left = 64
            Top = 120
            Width = 153
            Height = 17
            Hint = 
              'Run in a window. Current Windows resolution and depth will be us' +
              'ed'
            Caption = 'Run In Window'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
          end
          object Scanlines: TCheckBox
            Left = 400
            Top = 192
            Width = 153
            Height = 17
            Hint = 'Emulate scanlines (hardware stretch needs to be off)'
            Caption = 'Scanlines'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
          end
          object NoRotate: TCheckBox
            Left = 400
            Top = 72
            Width = 153
            Height = 17
            Hint = 'Do not apply rotation in screen'
            Caption = 'No Rotate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
          object RotateLeft: TCheckBox
            Left = 400
            Top = 96
            Width = 153
            Height = 17
            Hint = 'Rotate screen anti-clockwise'
            Caption = 'Rotate Left'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
          end
          object RotateRight: TCheckBox
            Left = 400
            Top = 120
            Width = 153
            Height = 17
            Hint = 'Rotate screen clockwise'
            Caption = 'Rotate Right'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
          end
          object TripleBuffer: TCheckBox
            Left = 64
            Top = 192
            Width = 153
            Height = 17
            Hint = 'Enable/disable triple buffering (only if fullscreen)'
            Caption = 'Triple Buffer'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
          object FlipX: TCheckBox
            Left = 400
            Top = 144
            Width = 153
            Height = 17
            Hint = 'Flip screen upside-down'
            Caption = 'Flip X'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
          end
          object FlipY: TCheckBox
            Left = 400
            Top = 168
            Width = 153
            Height = 17
            Hint = 'Flip screen left-right'
            Caption = 'Flip Y'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
          end
          object WaitVSync: TCheckBox
            Left = 232
            Top = 144
            Width = 153
            Height = 17
            Hint = 
              'Wait for vertical syncronization to reduce tearing (direct draw ' +
              'must be on)'
            Caption = 'Wait Vertical Sync'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
          end
          object Maximize: TCheckBox
            Left = 64
            Top = 144
            Width = 153
            Height = 17
            Hint = 
              'Controls initial window size in windowed mode (run in window mus' +
              't be on)'
            Caption = 'Maximize'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 15
          end
          object KeepAspectRatio: TCheckBox
            Left = 232
            Top = 72
            Width = 153
            Height = 17
            Hint = 'Enforce aspect ratio'
            Caption = 'Keep Aspect Ratio'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 16
          end
          object MatchRefreshRate: TCheckBox
            Left = 232
            Top = 120
            Width = 153
            Height = 17
            Hint = 
              'Attempt to match the game'#39's refresh rate (direct draw must be on' +
              ' and run in window must be off)'
            Caption = 'Match Refresh Rate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
          end
          object SyncronizeRefreshRate: TCheckBox
            Left = 232
            Top = 168
            Width = 153
            Height = 17
            Hint = 'Syncronize only to the monitor refresh (direct draw must be on)'
            Caption = 'Sync Refresh Rate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
          end
          object CustomResolution: TEdit
            Left = 232
            Top = 32
            Width = 89
            Height = 21
            Hint = 'Specifies a custom resolution to run in'
            TabStop = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
          end
          object Sleep: TCheckBox
            Left = 64
            Top = 216
            Width = 153
            Height = 17
            Hint = 'Allow MAME to give back time to the system when it'#39's not needed'
            Caption = 'Sleep'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 20
          end
          object DisplayImage: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 21
            Transparent = True
          end
          object Resolution: TGaugeBar
            Left = 64
            Top = 32
            Width = 65
            Height = 20
            Hint = 'Specifies an exact resolution to run in'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 35
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = ResolutionChange
          end
          object rdtsc: TCheckBox
            Left = 232
            Top = 216
            Width = 153
            Height = 17
            Hint = 'Prefer RDTSC over QueryPerformanceCounter for timing'
            Caption = 'RDTSC'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 23
          end
        end
        object TabSheetMAMEDisplay2: TTabSheet
          Caption = 'Display 2'
          ImageIndex = 2
          object LabelDebuggerResolution: TLabel
            Left = 224
            Top = 168
            Width = 100
            Height = 13
            Caption = 'Debugger Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelRefreshRate: TLabel
            Left = 64
            Top = 120
            Width = 64
            Height = 13
            Caption = 'Refresh Rate'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFramesToRun: TLabel
            Left = 224
            Top = 120
            Width = 72
            Height = 13
            Caption = 'Frames To Run'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFramesToRunValue: TLabel
            Left = 322
            Top = 147
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFullScreenBrightness: TLabel
            Left = 64
            Top = 168
            Width = 105
            Height = 13
            Caption = 'Full Screen Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = False
            Transparent = True
          end
          object LabelRefreshRateValue: TLabel
            Left = 154
            Top = 139
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFullScreenBrightnessValue: TLabel
            Left = 130
            Top = 187
            Width = 22
            Height = 13
            Caption = '0.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelEffect: TLabel
            Left = 368
            Top = 120
            Width = 29
            Height = 13
            Caption = 'Effect'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelEffectValue: TLabel
            Left = 434
            Top = 139
            Width = 25
            Height = 13
            Caption = 'None'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScreenAspect: TLabel
            Left = 368
            Top = 168
            Width = 97
            Height = 13
            Caption = 'Screen Aspect Ratio'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScreenAspectValue: TLabel
            Left = 434
            Top = 187
            Width = 16
            Height = 13
            Caption = '4:3'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkip: TLabel
            Left = 64
            Top = 216
            Width = 52
            Height = 13
            Caption = 'Frame Skip'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkipValue: TLabel
            Left = 130
            Top = 235
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelBrightness: TLabel
            Left = 224
            Top = 216
            Width = 50
            Height = 13
            Caption = 'Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelBrightnessValue: TLabel
            Left = 290
            Top = 235
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDebuggerResolutionValue: TLabel
            Left = 290
            Top = 187
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelPauseBrightness: TLabel
            Left = 368
            Top = 216
            Width = 82
            Height = 13
            Caption = 'Pause Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelPauseBrightnessValue: TLabel
            Left = 434
            Top = 235
            Width = 22
            Height = 13
            Caption = '0.65'
            ShowAccelChar = False
            Transparent = True
          end
          object FramesToRun: TGaugeBar
            Left = 224
            Top = 136
            Width = 97
            Height = 20
            Hint = 'Sets the number of frames to run within the game'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 100
            Max = 40000000
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = FramesToRunChange
          end
          object RefreshRate: TGaugeBar
            Left = 64
            Top = 136
            Width = 89
            Height = 20
            Hint = 
              'Set specific monitor refresh rate (direct draw must be on and ru' +
              'n in window must be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 240
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = RefreshRateChange
          end
          object FullScreenBrightness: TGaugeBar2
            Left = 64
            Top = 184
            Width = 65
            Height = 20
            Hint = 
              'Sets the brightness in full screen mode if available (direct dra' +
              'w must be on and run in window must be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 1
            Max = 4
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.01
            OnChange = FullScreenBrightnessChange
          end
          object Effect: TGaugeBar
            Left = 368
            Top = 136
            Width = 65
            Height = 20
            Hint = 'Specify the blitting effect'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 11
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = EffectChange
          end
          object ScreenAspect: TGaugeBar
            Left = 368
            Top = 184
            Width = 65
            Height = 20
            Hint = 'Specify an alternate monitor aspect ratio'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 32
            ShowHint = True
            ShowHandleGrip = True
            Position = 14
            OnChange = ScreenAspectChange
          end
          object FrameSkip: TGaugeBar
            Left = 64
            Top = 232
            Width = 65
            Height = 20
            Hint = 'Set frameskip explicitly (autoframeskip needs to be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 12
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = FrameSkipChange
          end
          object LabelVector: TGroupBox
            Left = 64
            Top = 16
            Width = 393
            Height = 97
            Caption = 'Vector'
            TabOrder = 6
            object LabelFlicker: TLabel
              Left = 8
              Top = 48
              Width = 30
              Height = 13
              Caption = 'Flicker'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelFlickerValue: TLabel
              Left = 74
              Top = 67
              Width = 22
              Height = 13
              Caption = '0.00'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelBeam: TLabel
              Left = 128
              Top = 48
              Width = 26
              Height = 13
              Caption = 'Beam'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelBeamValue: TLabel
              Left = 194
              Top = 67
              Width = 22
              Height = 13
              Caption = '1.00'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelIntensityValue: TLabel
              Left = 354
              Top = 67
              Width = 22
              Height = 13
              Caption = '1.50'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelIntensity: TLabel
              Left = 256
              Top = 48
              Width = 43
              Height = 13
              Caption = 'Intensity'
              ShowAccelChar = False
              Transparent = True
            end
            object Antialias: TCheckBox
              Left = 8
              Top = 24
              Width = 121
              Height = 17
              Hint = 'Draw antialiased vectors'
              Caption = 'Antialias'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
            end
            object Flicker: TGaugeBar2
              Left = 8
              Top = 64
              Width = 65
              Height = 20
              Hint = 'Set flickering in vector games'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 5
              Max = 100
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 5
              OnChange = FlickerChange
            end
            object Translucency: TCheckBox
              Left = 128
              Top = 24
              Width = 113
              Height = 17
              Hint = 'Draw translucent vectors'
              Caption = 'Translucency'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
            end
            object Beam: TGaugeBar2
              Left = 128
              Top = 64
              Width = 65
              Height = 20
              Hint = 'Set beam width in vector games'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.1
              Max = 16
              Min = 1
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.01
              Position = 1
              OnChange = BeamChange
            end
            object Intensity: TGaugeBar2
              Left = 256
              Top = 64
              Width = 97
              Height = 20
              Hint = 'Set intensity in vector games'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.1
              Max = 3
              Min = 0.5
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.01
              Position = 1.5
              OnChange = IntensityChange
            end
          end
          object Brightness: TGaugeBar2
            Left = 224
            Top = 232
            Width = 65
            Height = 20
            Hint = 'Brightness correction'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.1
            Max = 2
            Min = 0.5
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.01
            Position = 1
            OnChange = BrightnessChange
          end
          object Display2Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 8
            Transparent = True
          end
          object DebuggerResolution: TGaugeBar
            Left = 224
            Top = 184
            Width = 65
            Height = 20
            Hint = 'Set resolution for debugger window (run in window must be on)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 31
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = DebuggerResolutionChange
          end
          object PauseBrightness: TGaugeBar2
            Left = 368
            Top = 232
            Width = 65
            Height = 20
            Hint = 'Additional pause brightness'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.1
            Max = 2
            Min = 0.5
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.01
            Position = 0.65
            OnChange = PauseBrightnessChange
          end
        end
        object TabSheetMAMESoundControllers: TTabSheet
          Caption = 'Sound / Controllers'
          ImageIndex = 3
          object LabelSoundOptions: TGroupBox
            Left = 64
            Top = 16
            Width = 505
            Height = 97
            Caption = 'Sound'
            TabOrder = 0
            object LabelSampleRate: TLabel
              Left = 8
              Top = 24
              Width = 60
              Height = 13
              Caption = 'Sample Rate'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelSampleRateValue: TLabel
              Left = 74
              Top = 43
              Width = 45
              Height = 13
              Caption = '44100 Hz'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelCustomSampleRate: TLabel
              Left = 160
              Top = 24
              Width = 52
              Height = 13
              Caption = 'Custom SR'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelCustomSampleRateValue: TLabel
              Left = 226
              Top = 43
              Width = 40
              Height = 13
              Caption = 'Disabled'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVolume: TLabel
              Left = 312
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Volume'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVolumeValue: TLabel
              Left = 378
              Top = 43
              Width = 21
              Height = 13
              Caption = '0 dB'
              ShowAccelChar = False
              Transparent = True
            end
            object SampleRate: TGaugeBar
              Left = 8
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Set samplerate'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 3
              ShowHint = True
              ShowHandleGrip = True
              Position = 2
              OnChange = SampleRateChange
            end
            object CustomSampleRate: TGaugeBar
              Left = 160
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Set a custom samplerate (will override samplerate)'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 100
              Max = 50000
              Min = 4999
              ShowHint = True
              ShowHandleGrip = True
              Position = 4999
              OnChange = CustomSampleRateChange
            end
            object Volume: TGaugeBar
              Left = 312
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Volume attenuation (in dB)'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 5
              Max = 0
              Min = -32
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = VolumeChange
            end
            object Sound: TCheckBox
              Left = 8
              Top = 72
              Width = 137
              Height = 17
              Hint = 'Enable/disable sound and sound CPUs'
              Caption = 'Sound'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
            end
            object Samples: TCheckBox
              Left = 160
              Top = 72
              Width = 137
              Height = 17
              Hint = 'Use of samples files'
              Caption = 'Samples'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 4
            end
            object ResampleFilter: TCheckBox
              Left = 312
              Top = 72
              Width = 153
              Height = 17
              Hint = 'Resample if samplerate does not match'
              Caption = 'Resample Filter'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 5
            end
          end
          object LabelControllersOptions: TGroupBox
            Left = 64
            Top = 128
            Width = 505
            Height = 121
            Caption = 'Controllers'
            TabOrder = 1
            object LabelAnalogDigitalDeadzone: TLabel
              Left = 8
              Top = 72
              Width = 129
              Height = 13
              Caption = 'Analog to Digital Deadzone'
              ParentShowHint = False
              ShowAccelChar = False
              ShowHint = True
              Transparent = True
            end
            object LabelAnalogDigitalDeadzoneValue: TLabel
              Left = 106
              Top = 91
              Width = 22
              Height = 13
              Caption = '0.30'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelControllerKeysMapping: TLabel
              Left = 312
              Top = 72
              Width = 66
              Height = 13
              Caption = 'Keys Mapping'
              ShowAccelChar = False
              Transparent = True
            end
            object Joystick: TCheckBox
              Left = 8
              Top = 24
              Width = 137
              Height = 17
              Hint = 'Enable joystick input'
              Caption = 'Joystick'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object SteadyKey: TCheckBox
              Left = 312
              Top = 48
              Width = 137
              Height = 17
              Hint = 
                'It selects a different handling for simultaneous button presses ' +
                'but the controls are less responsive'
              Caption = 'Steady Key'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object Mouse: TCheckBox
              Left = 160
              Top = 24
              Width = 137
              Height = 17
              Hint = 'Enable mouse input (Windows mouse will be unavailable)'
              Caption = 'Mouse'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object Lightgun: TCheckBox
              Left = 8
              Top = 48
              Width = 137
              Height = 17
              Hint = 'Enable lightgun input'
              Caption = 'Light Gun'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object KeyboardLEDs: TCheckBox
              Left = 160
              Top = 48
              Width = 137
              Height = 17
              Hint = 'Enable keyboard LED emulation'
              Caption = 'Keyboard LEDs'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 4
            end
            object AnalogDigitalDeadzone: TGaugeBar2
              Left = 8
              Top = 88
              Width = 97
              Height = 20
              Hint = 'Minimal analog value for digital input'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.05
              Max = 1
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.01
              Position = 0.3
              OnChange = AnalogDigitalDeadzoneChange
            end
            object ControllerKeysMapping: TComboBox
              Left = 312
              Top = 88
              Width = 169
              Height = 21
              Hint = 'Pre-configure for specified controller'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              Text = '(None)'
              Items.Strings = (
                '(None)')
            end
          end
          object SoundControllersImage: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 2
            Transparent = True
          end
        end
        object TabSheetMAMEMiscellaneous: TTabSheet
          Caption = 'Miscellaneous'
          ImageIndex = 4
          object LabelTweaks: TGroupBox
            Left = 64
            Top = 16
            Width = 505
            Height = 121
            Caption = 'Tweaks'
            TabOrder = 0
            object Throttle: TCheckBox
              Left = 8
              Top = 24
              Width = 145
              Height = 17
              Hint = 'Throttle speed to the game'#39's framerate'
              Caption = 'Throttle'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
            end
            object Verbose: TCheckBox
              Left = 176
              Top = 24
              Width = 105
              Height = 17
              Hint = 'Displays some diagnostic information at startup'
              Caption = 'Verbose'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object Cheat: TCheckBox
              Left = 176
              Top = 72
              Width = 145
              Height = 17
              Hint = 'Enable/disable cheat subsystem'
              Caption = 'Cheat'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object Clones: TCheckBox
              Left = 176
              Top = 48
              Width = 145
              Height = 17
              Hint = 'Enable/disable clones'
              Caption = 'Clones'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
            end
            object ReadConfigFile: TCheckBox
              Left = 8
              Top = 96
              Width = 145
              Height = 17
              Hint = 'Enable/disable the reading of the config files'
              Caption = 'Read Config File'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 4
            end
            object Log: TCheckBox
              Left = 8
              Top = 48
              Width = 105
              Height = 17
              Hint = 'Generate error.log file'
              Caption = 'Log'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object Debug: TCheckBox
              Left = 176
              Top = 96
              Width = 105
              Height = 17
              Hint = 'Enable/disable debugger (only if available)'
              Caption = 'Debug'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object OSDebug: TCheckBox
              Left = 8
              Top = 72
              Width = 121
              Height = 17
              Hint = 'Output error log to debugger'
              Caption = 'Log to Debug'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
            object SkipDisclaimer: TCheckBox
              Left = 344
              Top = 24
              Width = 121
              Height = 17
              Hint = 'Skip displaying the disclaimer screen'
              Caption = 'Skip Disclaimer'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
            end
            object SkipGameInfo: TCheckBox
              Left = 344
              Top = 48
              Width = 121
              Height = 17
              Hint = 'Skip displaying the game info screen'
              Caption = 'Skip Game Info'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
            end
          end
          object LabelArtwork: TGroupBox
            Left = 64
            Top = 152
            Width = 505
            Height = 97
            Caption = 'Artwork'
            TabOrder = 1
            object LabelArtworkResolution: TLabel
              Left = 344
              Top = 48
              Width = 91
              Height = 13
              Caption = 'Artwork Resolution'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelArtworkResolutionValue: TLabel
              Left = 434
              Top = 67
              Width = 23
              Height = 13
              Caption = 'Auto'
              ShowAccelChar = False
              Transparent = True
            end
            object Artwork: TCheckBox
              Left = 8
              Top = 24
              Width = 137
              Height = 17
              Hint = 'Use additional game artwork'
              Caption = 'Artwork'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
            end
            object Backdrop: TCheckBox
              Left = 8
              Top = 48
              Width = 137
              Height = 17
              Hint = 'Use backdrop artwork'
              Caption = 'Backdrop'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 1
            end
            object Overlay: TCheckBox
              Left = 176
              Top = 48
              Width = 137
              Height = 17
              Hint = 'Use overlay artwork'
              Caption = 'Overlay'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
            end
            object Bezel: TCheckBox
              Left = 176
              Top = 24
              Width = 137
              Height = 17
              Hint = 'Use bezel artwork'
              Caption = 'Bezel'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
            end
            object Crop: TCheckBox
              Left = 344
              Top = 24
              Width = 137
              Height = 17
              Hint = 'Crop artwork to game screen only'
              Caption = 'Crop'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object ArtworkResolution: TGaugeBar
              Left = 344
              Top = 64
              Width = 89
              Height = 20
              Hint = 'Artwork resolution'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 5
              Max = 30
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = ArtworkResolutionChange
            end
          end
          object MiscellaneousImage: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 2
            Transparent = True
          end
        end
      end
    end
  end
  object MAMEConfigImageList: TImageList
    Left = 376
    Top = 392
  end
end
