object FormMAMEConfiguration: TFormMAMEConfiguration
  Left = 189
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MAME Configuration'
  ClientHeight = 422
  ClientWidth = 626
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    000001000800000000004001000000000000000000000001000000000000EBD8
    D8007F3F3F0000000000DDC9BF0095575700511A1A0085464600DAC7BD00DCBE
    BE00C69A9A00FFFFFF00D8C5BB00DABDBC00D3C1B700D7BAB900D7B9B900D0BE
    B400D0BEB500D0BDB400CFBDB500D3B6B700CBB9B100D0B3B300CFB3B300D0B2
    B300C7B5AD00CCAFAF00C2B2AA00C7ABAB00C8ABAB00C7ABAC00BEAEA600C4A8
    A700DDDBD30053535300BAABA400C0A5A500C0A5A400C0A4A4005CD2FE00CEE2
    E5004F373400439DAF0042CCF900B8A8A100BDA2A20083C3EC0053CEFB00DBF1
    F80077564F00268FB0002ABFF000DABABA00A267670092D3EE005FCFF7006ADC
    FF00BBE3EF00775D58001D69A50022B4EB0000A5E2007284BC00377EC50080F1
    FF0063D9FC005BCAEF004DD7FD003CCDF3001A48A3007EC2DD002A86D2003F96
    D60063E8FF00236BBD00089CE6007B95D0007C89A1001375CB004C539D000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000202
    020202020202024C024D4E024F02020202020202020202464748494A4B020505
    0505050505053E3F4041424344453435353535353535363738393A3B3C3D0006
    090A2C0909092D2E2F3031323302000606062324252626042728292A2B02001F
    1F1F1F09090920040521220202020006090A1B1C1D1E1D040502020202020006
    090A190909091A04050202020202000606061516171718040502020202020010
    11121309090914040502020202020006090A0D0E0E0F0E040502020202020006
    090A0B0909090C04050202020202000606060708080808040502020202020003
    030303030303030405020202020200000000000000000000010202020202FFA5
    FFFFFF81FFFF0000FFFF0000FFFF0001FFFF0001FFFF0007FFFF001FFFFF001F
    FFFF001FFFFF001FFFFF001FFFFF001FFFFF001FFFFF001FFFFF001FFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
  object ReadMAMEini: TButton
    Left = 8
    Top = 392
    Width = 153
    Height = 23
    Hint = 'Read all data from file "mame.ini"'
    Caption = '&Read "mame.ini"'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ReadMAMEiniClick
  end
  object PageControlMAMEOptions: TPageControl
    Left = 8
    Top = 8
    Width = 609
    Height = 377
    ActivePage = TabSheetMAMEOptions
    HotTrack = True
    Images = MAMEConfigImageList
    TabOrder = 3
    TabStop = False
    object TabSheetMAMEFolders: TTabSheet
      Caption = 'Folders'
      object PageControlFolders: TPageControl
        Left = 0
        Top = 0
        Width = 601
        Height = 348
        ActivePage = TabSheetFolders1
        Align = alClient
        Images = MAMEConfigImageList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object TabSheetFolders1: TTabSheet
          object LabelFolderROMs: TGroupBox
            Left = 8
            Top = 8
            Width = 281
            Height = 57
            Caption = 'ROMs'
            TabOrder = 0
            object FolderROMs: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Path to romsets'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderROMsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select folders (can have more than one)'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderROMsButtonSelectClick
            end
          end
          object LabelFolderSamples: TGroupBox
            Left = 8
            Top = 72
            Width = 281
            Height = 57
            Caption = 'Samples'
            TabOrder = 1
            object FolderSamplesButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = FolderSamplesButtonSelectClick
            end
            object FolderSamples: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Path to samplesets'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderINIFiles: TGroupBox
            Left = 8
            Top = 136
            Width = 281
            Height = 57
            Caption = 'INI Files'
            TabOrder = 2
            object FolderINIFilesButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = FolderINIFilesButtonSelectClick
            end
            object FolderINIFiles: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Path to ini files'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderGamesConfiguration: TGroupBox
            Left = 8
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Games Configuration'
            TabOrder = 3
            object FolderGamesConfigurationButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = FolderGamesConfigurationButtonSelectClick
            end
            object FolderGamesConfiguration: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory to save configurations'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelFolderSaveStates: TGroupBox
            Left = 304
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Save States'
            TabOrder = 4
            object FolderSaveStates: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory to save states'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderSaveStatesButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderSaveStatesButtonSelectClick
            end
          end
          object LabelFolderHighScores: TGroupBox
            Left = 304
            Top = 72
            Width = 281
            Height = 57
            Caption = 'High Scores'
            TabOrder = 5
            object FolderHighScores: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory to save hiscores'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderHighScoresButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderHighScoresButtonSelectClick
            end
          end
          object LabelFolderNVRAM: TGroupBox
            Left = 304
            Top = 136
            Width = 281
            Height = 57
            Caption = 'NVRAM'
            TabOrder = 6
            object FolderNVRAM: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory to save nvram contents'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderNVRAMButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderNVRAMButtonSelectClick
            end
          end
          object LabelFolderMemoryCards: TGroupBox
            Left = 304
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Memory Cards'
            TabOrder = 7
            object FolderMemoryCards: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory to save memory card contents'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderMemoryCardsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderMemoryCardsButtonSelectClick
            end
          end
        end
        object TabSheetFolders2: TTabSheet
          object LabelFolderGamesRecording: TGroupBox
            Left = 8
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Inputs Recording'
            TabOrder = 0
            object FolderInputsRecording: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory for recordings'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderInputsRecordingButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderInputsRecordingButtonSelectClick
            end
          end
          object LabelFolderArtworks: TGroupBox
            Left = 8
            Top = 72
            Width = 281
            Height = 57
            Caption = 'Artworks'
            TabOrder = 1
            object FolderArtworks: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory for Artwork (Overlays etc.)'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderArtworksButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderArtworksButtonSelectClick
            end
          end
          object LabelFolderDiff: TGroupBox
            Left = 8
            Top = 136
            Width = 281
            Height = 57
            Caption = 'Diff'
            TabOrder = 2
            object FolderDiff: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory for hard drive image difference files'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderDiffButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderDiffButtonSelectClick
            end
          end
          object LabelFolderInGameSnapshots: TGroupBox
            Left = 8
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Snapshots'
            TabOrder = 3
            object FolderSnapshots: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory for screenshots (.png format)'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderSnapshotsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderSnapshotsButtonSelectClick
            end
          end
          object LabelFolderKeysMapping: TGroupBox
            Left = 304
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Keys Mapping'
            TabOrder = 4
            object FolderKeysMapping: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Directory for preconfigured controller keys'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderKeysMappingButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderKeysMappingButtonSelectClick
            end
          end
        end
      end
    end
    object TabSheetMAMEOptions: TTabSheet
      Caption = 'Options'
      ImageIndex = 1
      object PageControlOptions: TPageControl
        Left = 0
        Top = 0
        Width = 601
        Height = 348
        ActivePage = TabSheetMAMEDisplay
        Align = alClient
        HotTrack = True
        Images = MAMEConfigImageList
        TabOrder = 0
        TabStop = False
        object TabSheetMAMEDisplay: TTabSheet
          Caption = 'Display'
          ImageIndex = 2
          object LabelResolution: TLabel
            Left = 8
            Top = 8
            Width = 50
            Height = 13
            Caption = 'Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCustomResolution: TLabel
            Left = 176
            Top = 8
            Width = 57
            Height = 13
            Caption = 'Custom Res'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGammaValue: TLabel
            Left = 412
            Top = 27
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGamma: TLabel
            Left = 344
            Top = 8
            Width = 35
            Height = 13
            Caption = 'Gamma'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelResolutionValue: TLabel
            Left = 76
            Top = 27
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object AutoFrameSkip: TCheckBox
            Left = 8
            Top = 64
            Width = 153
            Height = 17
            Hint = 
              'Automatically determines the frameskip level while you'#39're playin' +
              'g the game to keep the game running at full speed. It overrides ' +
              'the frameskip value'
            Caption = 'Auto Frame Skip'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
          object Window: TCheckBox
            Left = 8
            Top = 112
            Width = 153
            Height = 17
            Hint = 
              'Run in a window. Current Windows resolution and depth will be us' +
              'ed'
            Caption = 'Run In Window'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object HardwareStretch: TCheckBox
            Left = 8
            Top = 160
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
            Left = 176
            Top = 184
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
            Left = 176
            Top = 88
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
            Left = 8
            Top = 88
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
          object Maximize: TCheckBox
            Left = 8
            Top = 136
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
            TabOrder = 6
          end
          object KeepAspectRatio: TCheckBox
            Left = 176
            Top = 64
            Width = 153
            Height = 17
            Hint = 'Enforce aspect ratio'
            Caption = 'Keep Aspect Ratio'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 7
          end
          object MatchRefreshRate: TCheckBox
            Left = 176
            Top = 112
            Width = 153
            Height = 17
            Hint = 
              'Attempt to match the game'#39's refresh rate (direct draw must be on' +
              ' and run in window must be off)'
            Caption = 'Match Refresh Rate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
          object SyncronizeRefreshRate: TCheckBox
            Left = 176
            Top = 160
            Width = 153
            Height = 17
            Hint = 'Syncronize only to the monitor refresh (direct draw must be on)'
            Caption = 'Sync Refresh Rate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
          end
          object Scanlines: TCheckBox
            Left = 344
            Top = 184
            Width = 153
            Height = 17
            Hint = 'Emulate scanlines (hardware stretch needs to be off)'
            Caption = 'Scanlines'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
          end
          object RotateRight: TCheckBox
            Left = 344
            Top = 112
            Width = 153
            Height = 17
            Hint = 'Rotate screen clockwise'
            Caption = 'Rotate Right'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
          object FlipY: TCheckBox
            Left = 344
            Top = 160
            Width = 153
            Height = 17
            Hint = 'Flip screen left-right'
            Caption = 'Flip Y'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
          end
          object WaitVSync: TCheckBox
            Left = 176
            Top = 136
            Width = 153
            Height = 17
            Hint = 
              'Wait for vertical syncronization to reduce tearing (direct draw ' +
              'must be on)'
            Caption = 'Wait Vertical Sync'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
          end
          object NoRotate: TCheckBox
            Left = 344
            Top = 64
            Width = 153
            Height = 17
            Hint = 'Do not apply rotation in screen'
            Caption = 'No Rotate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
          end
          object RotateLeft: TCheckBox
            Left = 344
            Top = 88
            Width = 153
            Height = 17
            Hint = 'Rotate screen anti-clockwise'
            Caption = 'Rotate Left'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
          end
          object TripleBuffer: TCheckBox
            Left = 8
            Top = 184
            Width = 153
            Height = 17
            Hint = 'Enable/disable triple buffering (only if fullscreen)'
            Caption = 'Triple Buffer'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
          end
          object FlipX: TCheckBox
            Left = 344
            Top = 136
            Width = 153
            Height = 17
            Hint = 'Flip screen upside-down'
            Caption = 'Flip X'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
          end
          object CustomResolution: TEdit
            Left = 176
            Top = 24
            Width = 89
            Height = 21
            Hint = 'Specifies a custom resolution to run in'
            TabStop = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
          end
          object Gamma: TGaugeBar2
            Left = 344
            Top = 24
            Width = 65
            Height = 20
            Hint = 'Set the global gamma correction in the game'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.500000000000000000
            Max = 2.000000000000000000
            Min = 0.500000000000000000
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.010000000000000000
            Position = 0.500000000000000000
            OnChange = GammaChange
          end
          object Sleep: TCheckBox
            Left = 8
            Top = 208
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
          object Resolution: TGaugeBar
            Left = 8
            Top = 24
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
            Left = 176
            Top = 208
            Width = 153
            Height = 17
            Hint = 'Prefer RDTSC over QueryPerformanceCounter for timing'
            Caption = 'RDTSC'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 22
          end
          object HighPriority: TCheckBox
            Left = 344
            Top = 208
            Width = 153
            Height = 17
            Hint = 'Increase thread priority'
            Caption = 'High Priority'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 23
          end
          object AutoRotateLeft: TCheckBox
            Left = 8
            Top = 232
            Width = 153
            Height = 17
            Hint = 'Automatically rotate screen anti-clockwise for vertical games'
            Caption = 'Auto Rotate Left'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 24
          end
          object AutoRotateRight: TCheckBox
            Left = 176
            Top = 232
            Width = 153
            Height = 17
            Hint = 'Automatically rotate screen clockwise for vertical games'
            Caption = 'Auto Rotate Right'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 25
          end
        end
        object TabSheetMAMEDisplay2: TTabSheet
          Caption = 'Display 2'
          ImageIndex = 2
          object LabelDebuggerResolution: TLabel
            Left = 176
            Top = 168
            Width = 100
            Height = 13
            Caption = 'Debugger Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelRefreshRate: TLabel
            Left = 8
            Top = 120
            Width = 64
            Height = 13
            Caption = 'Refresh Rate'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFramesToRun: TLabel
            Left = 176
            Top = 120
            Width = 72
            Height = 13
            Caption = 'Frames To Run'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFramesToRunValue: TLabel
            Left = 274
            Top = 139
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFullScreenBrightness: TLabel
            Left = 8
            Top = 168
            Width = 105
            Height = 13
            Caption = 'Full Screen Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelRefreshRateValue: TLabel
            Left = 100
            Top = 139
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFullScreenBrightnessValue: TLabel
            Left = 76
            Top = 187
            Width = 22
            Height = 13
            Caption = '0.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelEffect: TLabel
            Left = 328
            Top = 120
            Width = 29
            Height = 13
            Caption = 'Effect'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelEffectValue: TLabel
            Left = 396
            Top = 139
            Width = 25
            Height = 13
            Caption = 'None'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScreenAspect: TLabel
            Left = 328
            Top = 168
            Width = 97
            Height = 13
            Caption = 'Screen Aspect Ratio'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScreenAspectValue: TLabel
            Left = 396
            Top = 187
            Width = 16
            Height = 13
            Caption = '4:3'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkip: TLabel
            Left = 8
            Top = 216
            Width = 52
            Height = 13
            Caption = 'Frame Skip'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkipValue: TLabel
            Left = 76
            Top = 235
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelBrightness: TLabel
            Left = 176
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
            Left = 244
            Top = 235
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDebuggerResolutionValue: TLabel
            Left = 244
            Top = 187
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelPauseBrightness: TLabel
            Left = 328
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
            Left = 396
            Top = 235
            Width = 22
            Height = 13
            Caption = '0.65'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCleanStretch: TLabel
            Left = 8
            Top = 264
            Width = 65
            Height = 13
            Caption = 'Clean Stretch'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCleanStretchValue: TLabel
            Left = 76
            Top = 283
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object FramesToRun: TGaugeBar
            Left = 176
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
            Left = 8
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
            Left = 8
            Top = 184
            Width = 65
            Height = 20
            Hint = 
              'Sets the brightness in full screen mode if available (direct dra' +
              'w must be on and run in window must be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 1.000000000000000000
            Max = 4.000000000000000000
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.010000000000000000
            OnChange = FullScreenBrightnessChange
          end
          object Effect: TGaugeBar
            Left = 328
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
            Left = 328
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
            Left = 8
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
            Left = 8
            Top = 8
            Width = 417
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
              Left = 76
              Top = 67
              Width = 22
              Height = 13
              Caption = '0.00'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelBeam: TLabel
              Left = 144
              Top = 48
              Width = 26
              Height = 13
              Caption = 'Beam'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelBeamValue: TLabel
              Left = 212
              Top = 67
              Width = 22
              Height = 13
              Caption = '1.00'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelIntensity: TLabel
              Left = 280
              Top = 48
              Width = 43
              Height = 13
              Caption = 'Intensity'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelIntensityValue: TLabel
              Left = 380
              Top = 67
              Width = 22
              Height = 13
              Caption = '1.50'
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
              LargeChange = 5.000000000000000000
              Max = 100.000000000000000000
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 5.000000000000000000
              OnChange = FlickerChange
            end
            object Translucency: TCheckBox
              Left = 144
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
              Left = 144
              Top = 64
              Width = 65
              Height = 20
              Hint = 'Set beam width in vector games'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.100000000000000000
              Max = 16.000000000000000000
              Min = 1.000000000000000000
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.010000000000000000
              Position = 1.000000000000000000
              OnChange = BeamChange
            end
            object Intensity: TGaugeBar2
              Left = 280
              Top = 64
              Width = 97
              Height = 20
              Hint = 'Set intensity in vector games'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 0.100000000000000000
              Max = 3.000000000000000000
              Min = 0.500000000000000000
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.010000000000000000
              Position = 1.500000000000000000
              OnChange = IntensityChange
            end
          end
          object Brightness: TGaugeBar2
            Left = 176
            Top = 232
            Width = 65
            Height = 20
            Hint = 'Brightness correction'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.100000000000000000
            Max = 2.000000000000000000
            Min = 0.500000000000000000
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.010000000000000000
            Position = 1.000000000000000000
            OnChange = BrightnessChange
          end
          object DebuggerResolution: TGaugeBar
            Left = 176
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
            Left = 328
            Top = 232
            Width = 65
            Height = 20
            Hint = 'Additional pause brightness'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.100000000000000000
            Max = 2.000000000000000000
            Min = 0.500000000000000000
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.010000000000000000
            Position = 0.650000000000000000
            OnChange = PauseBrightnessChange
          end
          object CleanStretch: TGaugeBar
            Left = 8
            Top = 280
            Width = 65
            Height = 20
            Hint = 'Stretch to integer ratios, ignore game aspect ratio'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 4
            ShowHint = True
            ShowHandleGrip = True
            Position = 2
            OnChange = CleanStretchChange
          end
        end
        object TabSheetMAMEDisplay3: TTabSheet
          Caption = 'Display 3'
          ImageIndex = 2
          object LabelDirect3D: TGroupBox
            Left = 8
            Top = 8
            Width = 577
            Height = 233
            Caption = 'Direct3D'
            TabOrder = 0
            object LabelD3DFilter: TLabel
              Left = 208
              Top = 96
              Width = 24
              Height = 13
              Caption = 'Filter'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DFilterValue: TLabel
              Left = 276
              Top = 116
              Width = 41
              Height = 13
              Caption = 'Bi-Linear'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DFeedback: TLabel
              Left = 408
              Top = 48
              Width = 46
              Height = 13
              Caption = 'Feedback'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DFeedbackValue: TLabel
              Left = 500
              Top = 68
              Width = 40
              Height = 13
              Caption = 'Disabled'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DScanline: TLabel
              Left = 8
              Top = 48
              Width = 39
              Height = 13
              Caption = 'Scanline'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DScanlineValue: TLabel
              Left = 100
              Top = 68
              Width = 40
              Height = 13
              Caption = 'Disabled'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DEffect: TLabel
              Left = 8
              Top = 96
              Width = 29
              Height = 13
              Caption = 'Effect'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DEffectValue: TLabel
              Left = 76
              Top = 116
              Width = 25
              Height = 13
              Caption = 'None'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DPrescale: TLabel
              Left = 208
              Top = 48
              Width = 40
              Height = 13
              Caption = 'Prescale'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelD3DPrescaleValue: TLabel
              Left = 276
              Top = 68
              Width = 23
              Height = 13
              Caption = 'Auto'
              ShowAccelChar = False
              Transparent = True
            end
            object Direct3D: TCheckBox
              Left = 8
              Top = 24
              Width = 153
              Height = 17
              Hint = 'Use Direct3D for rendering'
              Caption = 'Direct3D'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object D3DTextureManagement: TCheckBox
              Left = 208
              Top = 24
              Width = 153
              Height = 17
              Hint = 'Use DirectX texture management'
              Caption = 'Texture Management'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 1
            end
            object D3DFilter: TGaugeBar
              Left = 208
              Top = 112
              Width = 65
              Height = 20
              Hint = 'Interpolation method'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 4
              ShowHint = True
              ShowHandleGrip = True
              Position = 1
              OnChange = D3DFilterChange
            end
            object D3DFeedback: TGaugeBar
              Left = 408
              Top = 64
              Width = 89
              Height = 20
              Hint = 'Feedback strength'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = D3DFeedbackChange
            end
            object D3DScanline: TGaugeBar
              Left = 8
              Top = 64
              Width = 89
              Height = 20
              Hint = 'Scanline intensity'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              ShowHint = True
              ShowHandleGrip = True
              Position = 100
              OnChange = D3DScanlineChange
            end
            object D3DEffectsRotation: TCheckBox
              Left = 408
              Top = 24
              Width = 153
              Height = 17
              Hint = 'Enable rotation of effects for rotated games'
              Caption = 'Effects Rotation'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 5
            end
            object D3DEffect: TGaugeBar
              Left = 8
              Top = 112
              Width = 65
              Height = 20
              Hint = 'Specify the blitting effect'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 18
              Min = -1
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = D3DEffectChange
            end
            object LabelD3DCustomEffects: TGroupBox
              Left = 8
              Top = 144
              Width = 273
              Height = 81
              Caption = 'Custom Effects'
              TabOrder = 7
              object D3DCustomEffects: TEdit
                Left = 8
                Top = 48
                Width = 257
                Height = 21
                Hint = 'Customised blitting effects preset'
                TabStop = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object D3DCustomEffectsEnable: TCheckBox
                Left = 8
                Top = 24
                Width = 153
                Height = 17
                Hint = 'Enable custom effects'
                Caption = 'Enabled'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
            end
            object LabelD3DExpertEffects: TGroupBox
              Left = 296
              Top = 144
              Width = 273
              Height = 81
              Caption = 'Expert Custom Effects'
              TabOrder = 8
              object D3DExpertEffects: TEdit
                Left = 8
                Top = 48
                Width = 257
                Height = 21
                Hint = 'Additional customised settings (undocumented)'
                TabStop = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object D3DExpertEffectsEnable: TCheckBox
                Left = 8
                Top = 24
                Width = 153
                Height = 17
                Hint = 'Enable expert custom effects'
                Caption = 'Enabled'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
            end
            object D3DPrescale: TGaugeBar
              Left = 208
              Top = 64
              Width = 65
              Height = 20
              Hint = 'Enable prescale'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 4
              Min = -1
              ShowHint = True
              ShowHandleGrip = True
              Position = 1
              OnChange = D3DPrescaleChange
            end
          end
        end
        object TabSheetMAMEDisplay4: TTabSheet
          Caption = 'Display 4'
          ImageIndex = 2
          object LabelZoomValue: TLabel
            Left = 76
            Top = 179
            Width = 12
            Height = 13
            Caption = '2x'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelZoom: TLabel
            Left = 8
            Top = 160
            Width = 26
            Height = 13
            Caption = 'Zoom'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSystemBiosValue: TLabel
            Left = 48
            Top = 133
            Width = 35
            Height = 13
            Hint = 'default'
            Caption = 'Default'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSystemBios: TLabel
            Left = 8
            Top = 112
            Width = 19
            Height = 13
            Caption = 'Bios'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelArtwork: TGroupBox
            Left = 8
            Top = 8
            Width = 497
            Height = 97
            Caption = 'Artwork'
            TabOrder = 0
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
              Left = 436
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
              Width = 145
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
              Width = 145
              Height = 17
              Hint = 'Use backdrop artwork'
              Caption = 'Backdrop'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 1
            end
            object Bezel: TCheckBox
              Left = 176
              Top = 48
              Width = 145
              Height = 17
              Hint = 'Use bezel artwork'
              Caption = 'Bezel'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
            end
            object Overlay: TCheckBox
              Left = 176
              Top = 24
              Width = 145
              Height = 17
              Hint = 'Use overlay artwork'
              Caption = 'Overlay'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
            end
            object Crop: TCheckBox
              Left = 344
              Top = 24
              Width = 145
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
          object Zoom: TGaugeBar
            Left = 8
            Top = 176
            Width = 65
            Height = 20
            Hint = 'Force specific zoom level'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 8
            Min = 1
            ShowHint = True
            ShowHandleGrip = True
            Position = 2
            OnChange = ZoomChange
          end
          object SystemBios: TButton
            Left = 8
            Top = 128
            Width = 33
            Height = 23
            Hint = 'Change system bios'
            Caption = '...'
            ParentShowHint = False
            PopupMenu = PopupSystemBios
            ShowHint = True
            TabOrder = 2
          end
        end
        object TabSheetMAMESound: TTabSheet
          Caption = 'Sound'
          ImageIndex = 3
          object LabelSampleRate: TLabel
            Left = 8
            Top = 8
            Width = 60
            Height = 13
            Caption = 'Sample Rate'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSampleRateValue: TLabel
            Left = 76
            Top = 27
            Width = 45
            Height = 13
            Caption = '44100 Hz'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCustomSampleRate: TLabel
            Left = 160
            Top = 8
            Width = 52
            Height = 13
            Caption = 'Custom SR'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCustomSampleRateValue: TLabel
            Left = 228
            Top = 27
            Width = 40
            Height = 13
            Caption = 'Disabled'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelVolume: TLabel
            Left = 312
            Top = 8
            Width = 34
            Height = 13
            Caption = 'Volume'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelVolumeValue: TLabel
            Left = 380
            Top = 27
            Width = 21
            Height = 13
            Caption = '0 dB'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelAudioLatency: TLabel
            Left = 8
            Top = 56
            Width = 68
            Height = 13
            Caption = 'Audio Latency'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelAudioLatencyValue: TLabel
            Left = 76
            Top = 75
            Width = 6
            Height = 13
            Caption = '1'
            ShowAccelChar = False
            Transparent = True
          end
          object SampleRate: TGaugeBar
            Left = 8
            Top = 24
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
            Top = 24
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
            Top = 24
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
            Left = 160
            Top = 80
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
            Top = 56
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
            Top = 56
            Width = 169
            Height = 17
            Hint = 'Resample if samplerate does not match'
            Caption = 'Resample Filter'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
          end
          object AudioLatency: TGaugeBar
            Left = 8
            Top = 72
            Width = 65
            Height = 20
            Hint = 'Set audio latency (increase to reduce glitches)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 100
            Max = 4
            Min = 1
            ShowHint = True
            ShowHandleGrip = True
            Position = 1
            OnChange = AudioLatencyChange
          end
        end
        object TabSheetMAMEControllers: TTabSheet
          Caption = 'Controllers'
          ImageIndex = 4
          object LabelControllerKeysMapping: TLabel
            Left = 312
            Top = 56
            Width = 66
            Height = 13
            Caption = 'Keys Mapping'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelAnalogDigitalDeadzone: TLabel
            Left = 8
            Top = 56
            Width = 129
            Height = 13
            Caption = 'Analog to Digital Deadzone'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelAnalogDigitalDeadzoneValue: TLabel
            Left = 108
            Top = 75
            Width = 22
            Height = 13
            Caption = '0.30'
            ShowAccelChar = False
            Transparent = True
          end
          object Joystick: TCheckBox
            Left = 8
            Top = 8
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
            Top = 32
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
            Top = 8
            Width = 137
            Height = 17
            Hint = 'Enable mouse input (Windows mouse will be unavailable)'
            Caption = 'Mouse'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object ControllerKeysMapping: TComboBox
            Left = 312
            Top = 72
            Width = 169
            Height = 21
            Hint = 'Pre-configure for specified controller'
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Text = '(None)'
            Items.Strings = (
              '(None)')
          end
          object LightGun: TCheckBox
            Left = 8
            Top = 32
            Width = 137
            Height = 17
            Hint = 'Enable lightgun input'
            Caption = 'Light Gun'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object KeyboardLEDs: TCheckBox
            Left = 160
            Top = 32
            Width = 137
            Height = 17
            Hint = 'Enable keyboard LED emulation'
            Caption = 'Keyboard LEDs'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
          end
          object AnalogDigitalDeadzone: TGaugeBar2
            Left = 8
            Top = 72
            Width = 97
            Height = 20
            Hint = 'Minimal analog value for digital input'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 0.050000000000000000
            Max = 1.000000000000000000
            ShowHint = True
            ShowHandleGrip = True
            SmallChange = 0.010000000000000000
            Position = 0.300000000000000000
            OnChange = AnalogDigitalDeadzoneChange
          end
        end
        object TabSheetMAMEMiscellaneous: TTabSheet
          Caption = 'Miscellaneous'
          ImageIndex = 5
          object LabelExternalFiles: TGroupBox
            Left = 8
            Top = 8
            Width = 193
            Height = 153
            Caption = 'External Files'
            TabOrder = 0
            object LabelCheatFile: TLabel
              Left = 8
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Cheat File'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelMAMEInfoFile: TLabel
              Left = 8
              Top = 64
              Width = 39
              Height = 13
              Caption = 'Info File'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelHistoryFile: TLabel
              Left = 8
              Top = 104
              Width = 53
              Height = 13
              Caption = 'History File'
              ShowAccelChar = False
              Transparent = True
            end
            object FilenameCheat: TEdit
              Left = 8
              Top = 40
              Width = 145
              Height = 21
              Hint = 'Select a cheat filename'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'cheat.dat'
            end
            object FilenameMAMEInfo: TEdit
              Left = 8
              Top = 80
              Width = 145
              Height = 21
              Hint = 'Select a mameinfo filename'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Text = 'mameinfo.dat'
            end
            object FilenameHistory: TEdit
              Left = 8
              Top = 120
              Width = 145
              Height = 21
              Hint = 'Select a history filename'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Text = 'history.dat'
            end
            object FilenameCheatButtonSelect: TButton
              Left = 160
              Top = 40
              Width = 21
              Height = 21
              Hint = 'Click here to select a cheat file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = FilenameCheatButtonSelectClick
            end
            object FilenameMAMEInfoButtonSelect: TButton
              Left = 160
              Top = 80
              Width = 21
              Height = 21
              Hint = 'Click here to select a mameinfo file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = FilenameMAMEInfoButtonSelectClick
            end
            object FilenameHistoryButtonSelect: TButton
              Left = 160
              Top = 120
              Width = 21
              Height = 21
              Hint = 'Click here to select a history file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = FilenameHistoryButtonSelectClick
            end
          end
          object LabelTweaks: TGroupBox
            Left = 208
            Top = 8
            Width = 297
            Height = 201
            Caption = 'Tweaks'
            TabOrder = 1
            object LabelMaxLogSize: TLabel
              Left = 8
              Top = 152
              Width = 62
              Height = 13
              Caption = 'Max Log Size'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelMaxLogSizeValue: TLabel
              Left = 245
              Top = 171
              Width = 30
              Height = 13
              Caption = '10000'
              ShowAccelChar = False
              Transparent = True
            end
            object Throttle: TCheckBox
              Left = 8
              Top = 16
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
              Left = 168
              Top = 16
              Width = 121
              Height = 17
              Hint = 'Displays some diagnostic information at startup'
              Caption = 'Verbose'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object Cheat: TCheckBox
              Left = 8
              Top = 40
              Width = 145
              Height = 17
              Hint = 'Enable/disable cheat subsystem'
              Caption = 'Cheat'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object Clones: TCheckBox
              Left = 8
              Top = 64
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
              Top = 88
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
              Left = 168
              Top = 40
              Width = 121
              Height = 17
              Hint = 'Generate error.log file'
              Caption = 'Log'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object Debug: TCheckBox
              Left = 168
              Top = 88
              Width = 121
              Height = 17
              Hint = 'Enable/disable debugger (only if available)'
              Caption = 'Debug'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object OSDebug: TCheckBox
              Left = 168
              Top = 64
              Width = 121
              Height = 17
              Hint = 'Output error log to debugger'
              Caption = 'Log to Debug'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
            object SkipDisclaimer: TCheckBox
              Left = 8
              Top = 112
              Width = 121
              Height = 17
              Hint = 'Skip displaying the disclaimer screen'
              Caption = 'Skip Disclaimer'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
            end
            object SkipGameInfo: TCheckBox
              Left = 168
              Top = 112
              Width = 121
              Height = 17
              Hint = 'Skip displaying the game info screen'
              Caption = 'Skip Game Info'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
            end
            object MaxLogSize: TGaugeBar
              Left = 8
              Top = 168
              Width = 233
              Height = 20
              Hint = 'Maximum error.log size (in KB)'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              LargeChange = 5
              Max = 2000000
              Min = 1
              ShowHint = True
              ShowHandleGrip = True
              Position = 10000
              OnChange = MaxLogSizeChange
            end
            object CRCIntegrityChecks: TCheckBox
              Left = 168
              Top = 136
              Width = 121
              Height = 17
              Hint = 'Use only CRC for all integrity checks'
              Caption = 'Use CRC Only'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
            end
          end
        end
      end
    end
  end
  object MAMEConfigImageList: TImageList
    Left = 368
    Top = 392
  end
  object PopupSystemBios: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = DEFAULT_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'MS Sans Serif'
    Separators.Font.Style = []
    MenuFont.Charset = DEFAULT_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -11
    MenuFont.Name = 'MS Sans Serif'
    MenuFont.Style = []
    Left = 64
    Top = 160
  end
end
