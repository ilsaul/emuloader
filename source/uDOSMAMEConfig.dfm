object FormDOSMAMEConfiguration: TFormDOSMAMEConfiguration
  Left = 230
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DOS MAME Configuration'
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
  object PageControlMAMEOptions: TPageControl
    Left = 8
    Top = 8
    Width = 609
    Height = 377
    ActivePage = TabSheetDOSMAMEOptions
    HotTrack = True
    Images = MAMEConfigImageList
    MultiLine = True
    TabIndex = 1
    TabOrder = 0
    TabStop = False
    object TabSheetDOSMAMEFolders: TTabSheet
      Caption = 'Folders'
      object PageControlFolders: TPageControl
        Left = 8
        Top = 8
        Width = 585
        Height = 329
        ActivePage = TabSheetFolders1
        Images = MAMEConfigImageList
        ParentShowHint = False
        ShowHint = True
        TabIndex = 0
        TabOrder = 0
        object TabSheetFolders1: TTabSheet
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
              OnClick = FolderROMsButtonSelectClick
            end
          end
          object LabelFolderSamples: TGroupBox
            Left = 64
            Top = 80
            Width = 249
            Height = 57
            Caption = 'Samples'
            TabOrder = 2
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
              OnClick = FolderSamplesButtonSelectClick
            end
          end
          object LabelFolderGamesConfiguration: TGroupBox
            Left = 64
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Games Configuration'
            TabOrder = 3
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
              OnClick = FolderGamesConfigurationButtonSelectClick
            end
          end
          object LabelFolderSaveStates: TGroupBox
            Left = 64
            Top = 208
            Width = 249
            Height = 57
            Caption = 'Save States'
            TabOrder = 4
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
              OnClick = FolderSaveStatesButtonSelectClick
            end
          end
          object LabelFolderHighScores: TGroupBox
            Left = 320
            Top = 16
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
              OnClick = FolderHighScoresButtonSelectClick
            end
          end
          object LabelFolderNVRAM: TGroupBox
            Left = 320
            Top = 80
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
              OnClick = FolderNVRAMButtonSelectClick
            end
          end
          object LabelFolderMemoryCards: TGroupBox
            Left = 320
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Memory Cards'
            TabOrder = 7
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
              OnClick = FolderMemoryCardsButtonSelectClick
            end
          end
          object LabelFolderGamesRecording: TGroupBox
            Left = 320
            Top = 208
            Width = 249
            Height = 57
            Caption = 'Inputs Recording'
            TabOrder = 8
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
              OnClick = FolderInputsRecordingButtonSelectClick
            end
          end
        end
        object TabSheetFolders2: TTabSheet
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
          object LabelFolderArtworks: TGroupBox
            Left = 64
            Top = 16
            Width = 249
            Height = 57
            Caption = 'Artworks'
            TabOrder = 1
            object FolderArtworks: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for Artwork (Overlays etc.)'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderArtworksButtonSelect: TButton
              Left = 216
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
          object LabelFolderInGameSnapshots: TGroupBox
            Left = 64
            Top = 80
            Width = 249
            Height = 57
            Caption = 'Snapshots'
            TabOrder = 2
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
              OnClick = FolderSnapshotsButtonSelectClick
            end
          end
          object LabelFolderCheats: TGroupBox
            Left = 64
            Top = 144
            Width = 249
            Height = 57
            Caption = 'Cheats'
            TabOrder = 3
            object FolderCheats: TEdit
              Left = 8
              Top = 24
              Width = 201
              Height = 21
              Hint = 'Directory for cheatfiles'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderCheatsButtonSelect: TButton
              Left = 216
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select folders (can have more than one)'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderCheatsButtonSelectClick
            end
          end
          object LabelFolderDiff: TGroupBox
            Left = 64
            Top = 208
            Width = 249
            Height = 57
            Caption = 'Diff'
            TabOrder = 4
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
              OnClick = FolderDiffButtonSelectClick
            end
          end
          object LabelFolderKeysMapping: TGroupBox
            Left = 320
            Top = 16
            Width = 249
            Height = 57
            Caption = 'Keys Mapping'
            TabOrder = 5
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
              OnClick = FolderKeysMappingButtonSelectClick
            end
          end
        end
      end
    end
    object TabSheetDOSMAMEOptions: TTabSheet
      Caption = 'Options'
      ImageIndex = 1
      object PageControlOptions: TPageControl
        Left = 8
        Top = 8
        Width = 585
        Height = 329
        ActivePage = TabSheetDOSMAMEMiscellaneous
        HotTrack = True
        Images = MAMEConfigImageList
        TabIndex = 3
        TabOrder = 0
        TabStop = False
        object TabSheetDOSMAMEDisplay: TTabSheet
          Caption = 'Display'
          ImageIndex = 2
          object LabelSkipColumnsValue: TLabel
            Left = 546
            Top = 35
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSkipLinesValue: TLabel
            Left = 546
            Top = 83
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelResolution: TLabel
            Left = 64
            Top = 16
            Width = 50
            Height = 13
            Caption = 'Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDepth: TLabel
            Left = 64
            Top = 64
            Width = 29
            Height = 13
            Caption = 'Depth'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelVESA: TLabel
            Left = 208
            Top = 64
            Width = 25
            Height = 13
            Caption = 'VESA'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCenterX: TLabel
            Left = 328
            Top = 16
            Width = 42
            Height = 13
            Caption = 'Center X'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSkipColumns: TLabel
            Left = 432
            Top = 16
            Width = 62
            Height = 13
            Caption = 'Skip Columns'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelMonitor: TLabel
            Left = 64
            Top = 112
            Width = 36
            Height = 13
            Caption = 'Monitor'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCenterY: TLabel
            Left = 328
            Top = 64
            Width = 42
            Height = 13
            Caption = 'Center Y'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSkipLines: TLabel
            Left = 432
            Top = 64
            Width = 46
            Height = 13
            Caption = 'Skip Lines'
            ShowAccelChar = False
          end
          object LabelGamma: TLabel
            Left = 328
            Top = 112
            Width = 35
            Height = 13
            Caption = 'Gamma'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCenterXValue: TLabel
            Left = 394
            Top = 35
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelCenterYValue: TLabel
            Left = 394
            Top = 83
            Width = 6
            Height = 13
            Caption = '0'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDOSMAMEVGAFrequency: TLabel
            Left = 432
            Top = 112
            Width = 74
            Height = 13
            Caption = 'VGA Frequency'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelVGAFrequencyValue: TLabel
            Left = 498
            Top = 131
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDepthValue: TLabel
            Left = 130
            Top = 83
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelGammaValue: TLabel
            Left = 394
            Top = 131
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelVESAValue: TLabel
            Left = 274
            Top = 83
            Width = 31
            Height = 13
            Caption = 'VESA3'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelMonitorValue: TLabel
            Left = 130
            Top = 131
            Width = 154
            Height = 13
            Caption = 'Standard (Standard PC Monitor)'
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
          object LabelCustomResolution: TLabel
            Left = 208
            Top = 16
            Width = 57
            Height = 13
            Caption = 'Custom Res'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScanlines: TLabel
            Left = 64
            Top = 160
            Width = 44
            Height = 13
            Caption = 'Scanlines'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelScanlinesValue: TLabel
            Left = 130
            Top = 179
            Width = 17
            Height = 13
            Caption = 'Yes'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelMMX: TLabel
            Left = 208
            Top = 160
            Width = 22
            Height = 13
            Caption = 'MMX'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelMMXValue: TLabel
            Left = 274
            Top = 179
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDirty: TLabel
            Left = 328
            Top = 160
            Width = 23
            Height = 13
            Caption = 'Dirty'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDirtyValue: TLabel
            Left = 394
            Top = 179
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDebuggerResolution: TLabel
            Left = 432
            Top = 208
            Width = 100
            Height = 13
            Caption = 'Debugger Resolution'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelDebuggerResolutionValue: TLabel
            Left = 498
            Top = 227
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelBrightness: TLabel
            Left = 208
            Top = 208
            Width = 50
            Height = 13
            Caption = 'Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelBrightnessValue: TLabel
            Left = 274
            Top = 227
            Width = 22
            Height = 13
            Caption = '1.00'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkip: TLabel
            Left = 64
            Top = 208
            Width = 52
            Height = 13
            Caption = 'Frame Skip'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelFrameSkipValue: TLabel
            Left = 130
            Top = 227
            Width = 23
            Height = 13
            Caption = 'Auto'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelPauseBrightness: TLabel
            Left = 328
            Top = 208
            Width = 82
            Height = 13
            Caption = 'Pause Brightness'
            ParentShowHint = False
            ShowAccelChar = False
            ShowHint = True
            Transparent = True
          end
          object LabelPauseBrightnessValue: TLabel
            Left = 394
            Top = 227
            Width = 22
            Height = 13
            Caption = '0.65'
            ShowAccelChar = False
            Transparent = True
          end
          object CenterX: TGaugeBar
            Left = 328
            Top = 32
            Width = 65
            Height = 20
            Hint = 'Center screen horizontally'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 8
            Min = -8
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = CenterXChange
          end
          object SkipColumns: TGaugeBar
            Left = 432
            Top = 32
            Width = 113
            Height = 20
            Hint = 'Adjust horizontal screen position'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 10
            Max = 800
            Min = -800
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = SkipColumnsChange
          end
          object SkipLines: TGaugeBar
            Left = 432
            Top = 80
            Width = 113
            Height = 20
            Hint = 'Adjust vertical screen position'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 10
            Max = 600
            Min = -600
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = SkipLinesChange
          end
          object CenterY: TGaugeBar
            Left = 328
            Top = 80
            Width = 65
            Height = 20
            Hint = 'Center screen vertically'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 16
            Min = -16
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = CenterYChange
          end
          object VGAFrequency: TGaugeBar
            Left = 432
            Top = 128
            Width = 65
            Height = 20
            Hint = 
              'Specifies different frequencies for the custom video modes. WARN' +
              'ING: IT IS POSSIBLE TO SET FREQUENCIES WAY OUTSIDE OF YOUR MONIT' +
              'OR'#39'S RANGE, WHICH COULD DAMAGE YOUR MONITOR. USE THIS OPTION AT ' +
              'YOUR OWN RISK!'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 3
            Min = -1
            ShowHint = True
            ShowHandleGrip = True
            Position = -1
            OnChange = VGAFrequencyChange
          end
          object Depth: TGaugeBar
            Left = 64
            Top = 80
            Width = 65
            Height = 20
            Hint = 
              'Specify the colordepth the core should render in bits per pixel ' +
              '(bpp)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 5
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = DepthChange
          end
          object Gamma: TGaugeBar2
            Left = 328
            Top = 128
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
          object VESA: TGaugeBar
            Left = 208
            Top = 80
            Width = 65
            Height = 20
            Hint = 'Forces the VESA mode. The best available one is used by default'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 5
            ShowHint = True
            ShowHandleGrip = True
            Position = 5
            OnChange = VESAChange
          end
          object Monitor: TGaugeBar
            Left = 64
            Top = 128
            Width = 65
            Height = 20
            Hint = 'Selects the monitor type'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 3
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = MonitorChange
          end
          object Resolution: TGaugeBar
            Left = 64
            Top = 32
            Width = 65
            Height = 20
            Hint = 'Set resolution'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 35
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = ResolutionChange
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
            TabOrder = 10
            Transparent = True
          end
          object CustomResolution: TEdit
            Left = 208
            Top = 32
            Width = 89
            Height = 21
            Hint = 'Specifies a custom resolution to run in'
            TabStop = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
          object Scanlines: TGaugeBar
            Left = 64
            Top = 176
            Width = 65
            Height = 20
            Hint = 'Emulate scanlines (hardware stretch needs to be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 3
            ShowHint = True
            ShowHandleGrip = True
            Position = 0
            OnChange = ScanlinesChange
          end
          object MMX: TGaugeBar
            Left = 208
            Top = 176
            Width = 65
            Height = 20
            Hint = 'Emulate scanlines (hardware stretch needs to be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 1
            Min = -1
            ShowHint = True
            ShowHandleGrip = True
            Position = -1
            OnChange = MMXChange
          end
          object Dirty: TGaugeBar
            Left = 328
            Top = 176
            Width = 65
            Height = 20
            Hint = 'Emulate scanlines (hardware stretch needs to be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 1
            Min = -1
            ShowHint = True
            ShowHandleGrip = True
            Position = -1
            OnChange = DirtyChange
          end
          object DebuggerResolution: TGaugeBar
            Left = 432
            Top = 224
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
          object Brightness: TGaugeBar2
            Left = 208
            Top = 224
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
          object FrameSkip: TGaugeBar
            Left = 64
            Top = 224
            Width = 65
            Height = 20
            Hint = 'Set frameskip explicitly (autoframeskip needs to be off)'
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            Max = 12
            Min = -1
            ShowHint = True
            ShowHandleGrip = True
            Position = -1
            OnChange = FrameSkipChange
          end
          object PauseBrightness: TGaugeBar2
            Left = 328
            Top = 224
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
        object TabSheetDOSMAMEDisplay2: TTabSheet
          Caption = 'Display 2'
          ImageIndex = 2
          object LabelVector: TGroupBox
            Left = 64
            Top = 16
            Width = 417
            Height = 145
            Caption = 'Vector'
            TabOrder = 0
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
              Left = 144
              Top = 48
              Width = 26
              Height = 13
              Caption = 'Beam'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelBeamValue: TLabel
              Left = 210
              Top = 67
              Width = 22
              Height = 13
              Caption = '1.00'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVectorResolution: TLabel
              Left = 8
              Top = 96
              Width = 84
              Height = 13
              Caption = 'Vector Resolution'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVectorResolutionValue: TLabel
              Left = 74
              Top = 115
              Width = 23
              Height = 13
              Caption = 'Auto'
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
              Left = 378
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
              LargeChange = 5
              Max = 100
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 5
              OnChange = FlickerChange
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
              LargeChange = 0.1
              Max = 16
              Min = 1
              ShowHint = True
              ShowHandleGrip = True
              SmallChange = 0.01
              Position = 1
              OnChange = BeamChange
            end
            object VectorResolution: TGaugeBar
              Left = 8
              Top = 112
              Width = 65
              Height = 20
              Hint = 'Set vector resolution'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 35
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = VectorResolutionChange
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
              TabOrder = 4
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
          object Display2Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 1
            Transparent = True
          end
          object WaitInterlace: TCheckBox
            Left = 64
            Top = 176
            Width = 153
            Height = 17
            Hint = 
              'Forces update of both odd and even fields of an interlaced low s' +
              'canrate display (monitor=ntsc,pal,arcade) for each game loop'
            Caption = 'Wait Interlace'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object Stretch: TCheckBox
            Left = 64
            Top = 200
            Width = 153
            Height = 17
            Hint = 'Stretch video'
            Caption = 'Stretch'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 3
          end
          object TripleBuffer: TCheckBox
            Left = 64
            Top = 224
            Width = 153
            Height = 17
            Hint = 'Enable/disable triple buffering (only if fullscreen)'
            Caption = 'Triple Buffer'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object WaitVSync: TCheckBox
            Left = 64
            Top = 248
            Width = 153
            Height = 17
            Hint = 
              'Wait for vertical syncronization to reduce tearing (direct draw ' +
              'must be on)'
            Caption = 'Wait Vertical Sync'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object NoRotate: TCheckBox
            Left = 240
            Top = 176
            Width = 153
            Height = 17
            Hint = 'Do not apply rotation in screen'
            Caption = 'No Rotate'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
          end
          object RotateLeft: TCheckBox
            Left = 240
            Top = 200
            Width = 153
            Height = 17
            Hint = 'Rotate screen anti-clockwise'
            Caption = 'Rotate Left'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
          end
          object RotateRight: TCheckBox
            Left = 240
            Top = 224
            Width = 153
            Height = 17
            Hint = 'Rotate screen clockwise'
            Caption = 'Rotate Right'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
          object VSync: TCheckBox
            Left = 240
            Top = 248
            Width = 153
            Height = 17
            Hint = 
              'Synchronize video display with the video beam instead of using t' +
              'he timer'
            Caption = 'Vertical Sync'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
          end
          object AlwaysSynced: TCheckBox
            Left = 416
            Top = 176
            Width = 153
            Height = 17
            Hint = 'Always syncronize video display'
            Caption = 'Always Synced'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
          end
          object FlipX: TCheckBox
            Left = 416
            Top = 200
            Width = 153
            Height = 17
            Hint = 'Flip screen upside-down'
            Caption = 'Flip X'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
          object FlipY: TCheckBox
            Left = 416
            Top = 224
            Width = 153
            Height = 17
            Hint = 'Flip screen left-right'
            Caption = 'Flip Y'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
          end
        end
        object TabSheetDOSMAMESoundControllers: TTabSheet
          Caption = 'Sound / Controllers'
          ImageIndex = 3
          object LabelSound: TGroupBox
            Left = 64
            Top = 16
            Width = 505
            Height = 121
            Caption = 'Sound'
            TabOrder = 0
            object LabelSoundCard: TLabel
              Left = 8
              Top = 24
              Width = 56
              Height = 13
              Caption = 'Sound Card'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelSoundCardValue: TLabel
              Left = 74
              Top = 43
              Width = 58
              Height = 13
              Caption = 'Auto Detect'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelSampleRate: TLabel
              Left = 232
              Top = 24
              Width = 60
              Height = 13
              Caption = 'Sample Rate'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelSampleRateValue: TLabel
              Left = 298
              Top = 43
              Width = 45
              Height = 13
              Caption = '44100 Hz'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVolume: TLabel
              Left = 368
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Volume'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelVolumeValue: TLabel
              Left = 434
              Top = 43
              Width = 21
              Height = 13
              Caption = '0 dB'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelCustomSampleRate: TLabel
              Left = 368
              Top = 72
              Width = 52
              Height = 13
              Caption = 'Custom SR'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelCustomSampleRateValue: TLabel
              Left = 434
              Top = 91
              Width = 40
              Height = 13
              Caption = 'Disabled'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object SoundCard: TGaugeBar
              Left = 8
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Selects sound card (If this is not specified, MAME will ask you)'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 7
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = SoundCardChange
            end
            object SampleRate: TGaugeBar
              Left = 232
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
            object Volume: TGaugeBar
              Left = 368
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Volume attenuation (in dB)'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 0
              Min = -32
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = VolumeChange
            end
            object CustomSampleRate: TGaugeBar
              Left = 368
              Top = 88
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
            object Stereo: TCheckBox
              Left = 8
              Top = 72
              Width = 81
              Height = 17
              Hint = 'Selects stereo or mono output for games supporting stereo sound'
              Caption = 'Stereo'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 4
            end
            object DetectSampleRate: TCheckBox
              Left = 8
              Top = 96
              Width = 177
              Height = 17
              Hint = 'Use correct games'#39's sample rate'
              Caption = 'Detect Sample Rate'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 5
            end
            object Samples: TCheckBox
              Left = 96
              Top = 72
              Width = 89
              Height = 17
              Hint = 'Use of samples files'
              Caption = 'Samples'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 6
            end
            object ResampleFilter: TCheckBox
              Left = 192
              Top = 72
              Width = 161
              Height = 17
              Hint = 'Resample if samplerate does not match'
              Caption = 'Resample Filter'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
            object Sound: TCheckBox
              Left = 192
              Top = 96
              Width = 137
              Height = 17
              Hint = 'Enable/disable sound and sound CPUs'
              Caption = 'Sound'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 8
            end
          end
          object LabelControllers: TGroupBox
            Left = 64
            Top = 160
            Width = 505
            Height = 105
            Caption = 'Controllers'
            TabOrder = 1
            object LabelJoystick: TLabel
              Left = 8
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Joystick'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelJoystickValue: TLabel
              Left = 74
              Top = 43
              Width = 54
              Height = 13
              Caption = 'No Joystick'
              Color = clBtnFace
              ParentColor = False
              ShowAccelChar = False
              Transparent = True
            end
            object LabelControllerKeysMapping: TLabel
              Left = 328
              Top = 24
              Width = 66
              Height = 13
              Caption = 'Keys Mapping'
              ShowAccelChar = False
              Transparent = True
            end
            object Joystick: TGaugeBar
              Left = 8
              Top = 40
              Width = 65
              Height = 20
              Hint = 'Enable joystick input'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 30
              ShowHint = True
              ShowHandleGrip = True
              Position = 0
              OnChange = JoystickChange
            end
            object SteadyKey: TCheckBox
              Left = 8
              Top = 72
              Width = 105
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
              Width = 97
              Height = 17
              Hint = 'Enable mouse input (Windows mouse will be unavailable)'
              Caption = 'Mouse'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
            end
            object KeyboardLEDs: TCheckBox
              Left = 160
              Top = 72
              Width = 137
              Height = 17
              Hint = 'Enable keyboard LED emulation'
              Caption = 'Keyboard LEDs'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
            end
            object ControllerKeysMapping: TComboBox
              Left = 328
              Top = 40
              Width = 169
              Height = 21
              Hint = 'Pre-configure for specified controller'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Text = 'Standard'
              Items.Strings = (
                'Standard')
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
        object TabSheetDOSMAMEMiscellaneous: TTabSheet
          Caption = 'Miscellaneous'
          ImageIndex = 4
          object LabelTweaks: TGroupBox
            Left = 264
            Top = 16
            Width = 305
            Height = 153
            Caption = 'Tweaks'
            TabOrder = 0
            object Tweak: TCheckBox
              Left = 8
              Top = 48
              Width = 145
              Height = 17
              Hint = 
                'Use tweaked VGA modes whose resolutions matching those of the em' +
                'ulated games'
              Caption = 'Tweak'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object Cheat: TCheckBox
              Left = 8
              Top = 72
              Width = 145
              Height = 17
              Hint = 'Enable/disable cheat subsystem'
              Caption = 'Cheat'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
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
              TabOrder = 2
            end
            object SkipGameInfo: TCheckBox
              Left = 8
              Top = 120
              Width = 121
              Height = 17
              Hint = 'Skip displaying the game info screen'
              Caption = 'Skip Game Info'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object SkipDisclaimer: TCheckBox
              Left = 8
              Top = 96
              Width = 121
              Height = 17
              Hint = 'Skip displaying the disclaimer screen'
              Caption = 'Skip Disclaimer'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
          end
          object LabelExternalFiles: TGroupBox
            Left = 64
            Top = 16
            Width = 193
            Height = 153
            Caption = 'External Files'
            TabOrder = 1
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
              Top = 104
              Width = 39
              Height = 13
              Caption = 'Info File'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelHistoryFile: TLabel
              Left = 8
              Top = 64
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
            end
            object FilenameMAMEInfo: TEdit
              Left = 8
              Top = 120
              Width = 145
              Height = 21
              Hint = 'Select a mameinfo filename'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object FilenameHistory: TEdit
              Left = 8
              Top = 80
              Width = 145
              Height = 21
              Hint = 'Select a history filename'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
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
            object FilenameHistoryButtonSelect: TButton
              Left = 160
              Top = 80
              Width = 21
              Height = 21
              Hint = 'Click here to select a history file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = FilenameHistoryButtonSelectClick
            end
            object FilenameMAMEInfoButtonSelect: TButton
              Left = 160
              Top = 120
              Width = 21
              Height = 21
              Hint = 'Click here to select a mameinfo file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = FilenameMAMEInfoButtonSelectClick
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
          object LabelArtwork: TGroupBox
            Left = 64
            Top = 192
            Width = 505
            Height = 97
            Caption = 'Artwork'
            TabOrder = 3
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
              TabOrder = 2
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
        end
      end
    end
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
    TabOrder = 1
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
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object ReadMAMEcfg: TButton
    Left = 8
    Top = 392
    Width = 153
    Height = 23
    Hint = 'Read all data from file "mame.cfg"'
    Caption = '&Read "mame.cfg"'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ReadMAMEcfgClick
  end
  object MAMEConfigImageList: TImageList
    Left = 424
    Top = 384
  end
end
