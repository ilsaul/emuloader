object FormDOSMAMECustomConfiguration: TFormDOSMAMECustomConfiguration
  Left = 226
  Top = 207
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'DOS MAME Custom Configuration'
  ClientHeight = 420
  ClientWidth = 618
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
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
    Left = -2
    Top = -1
    Width = 620
    Height = 43
  end
  object GameIcon: TImage
    Left = 8
    Top = 4
    Width = 32
    Height = 32
    AutoSize = True
    Transparent = True
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
  object PageControlOptions: TPageControl
    Left = 8
    Top = 48
    Width = 601
    Height = 337
    ActivePage = TabSheetDOSMAMEOptions
    HotTrack = True
    Images = MAMEConfigImageList
    TabIndex = 0
    TabOrder = 0
    TabStop = False
    object TabSheetDOSMAMEOptions: TTabSheet
      Caption = 'Custom Options'
      ImageIndex = 1
      object PageControlOptions2: TPageControl
        Left = 0
        Top = 0
        Width = 593
        Height = 308
        ActivePage = TabSheetDOSMAMEDisplay
        Align = alClient
        HotTrack = True
        Images = MAMEConfigImageList
        TabIndex = 0
        TabOrder = 0
        TabStop = False
        object TabSheetDOSMAMEDisplay: TTabSheet
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
            Transparent = True
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
          object LabelCenterYValue: TLabel
            Left = 394
            Top = 83
            Width = 6
            Height = 13
            Caption = '0'
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
          object LabelVGAFrequency: TLabel
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
          object LabelVESAValue: TLabel
            Left = 274
            Top = 83
            Width = 31
            Height = 13
            Caption = 'VESA3'
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
          object LabelDirtyValue: TLabel
            Left = 394
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
          object LabelDebuggerResolutionValue: TLabel
            Left = 498
            Top = 227
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
          object LabelPauseBrightnessValue: TLabel
            Left = 394
            Top = 227
            Width = 22
            Height = 13
            Caption = '0.65'
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
          object DisplayImage: TImage32Ex
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
          object CustomResolution: TEdit
            Left = 208
            Top = 32
            Width = 89
            Height = 21
            Hint = 'Specifies a custom resolution to run in'
            TabStop = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
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
              TabOrder = 3
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
          object LabelControllers: TGroupBox
            Left = 64
            Top = 160
            Width = 505
            Height = 97
            Caption = 'Controllers'
            TabOrder = 0
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
              Left = 192
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
              Left = 192
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
          end
          object LabelSound: TGroupBox
            Left = 64
            Top = 16
            Width = 505
            Height = 121
            Caption = 'Sound'
            TabOrder = 1
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
            Left = 64
            Top = 16
            Width = 297
            Height = 145
            Caption = 'Tweaks'
            TabOrder = 0
            object Tweak: TCheckBox
              Left = 8
              Top = 48
              Width = 121
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
              Width = 121
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
            object SkipDisclaimer: TCheckBox
              Left = 8
              Top = 96
              Width = 121
              Height = 17
              Hint = 'Skip displaying the disclaimer screen'
              Caption = 'Skip Disclaimer'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
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
              TabOrder = 4
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
            TabOrder = 1
            Transparent = True
          end
          object LabelArtwork: TGroupBox
            Left = 64
            Top = 168
            Width = 497
            Height = 97
            Caption = 'Artwork'
            TabOrder = 2
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
    Left = 448
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
    Left = 536
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
    Left = 416
    Top = 384
  end
end
