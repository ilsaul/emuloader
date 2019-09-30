object FormDaphneSettings: TFormDaphneSettings
  Left = 751
  Top = 198
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 424
  ClientWidth = 581
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
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 581
    Height = 80
    Align = alTop
    Color1 = 12639452
    Color2 = 15856113
    Color3 = clWhite
    Color4 = 1117964
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 78
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 470
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
    object LabelEmulatorFile: TShadowLabel
      Left = 106
      Top = 46
      Width = 75
      Height = 14
      Caption = 'Emulator file'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
    object LabelReadFileIni: TShadowLabel
      Left = 106
      Top = 59
      Width = 150
      Height = 14
      Caption = 'Emulator Config Filename'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
  end
  object GeneralBox: TAdvGroupBoxEx
    Left = 8
    Top = 87
    Width = 313
    Height = 195
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'General'
    Ctl3D = True
    TabOrder = 1
    object LaserDiscTypeLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 84
      Height = 16
      Caption = 'Laser Disc Type'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LaserDiscType: TComboBox2Ex
      Left = 8
      Top = 36
      Width = 295
      Height = 21
      Hint = 'Select a laserdisc type'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
    object Daphne_NoJoysticks: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 111
      Width = 87
      Height = 20
      Hint = 
        'Disables any joysticks that may be plugged in'#13#10'Joysticks will no' +
        'rmally be used if available'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'No Joysticks'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object SRAMContinuousUpdate: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 131
      Width = 161
      Height = 20
      Hint = 
        'Saves the static RAM constantly to preserve high scores if the e' +
        'mulator crashes'
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'SRAM Continuous Update'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object FastBoot: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 151
      Width = 81
      Height = 20
      Hint = 
        'Makes games start faster. Only available on a few games like Dra' +
        'gon'#39's Lair'
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Fast Boot'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object StopLaserdiscPlayer: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 171
      Width = 137
      Height = 20
      Hint = 
        'Stop the laserdisc player when Daphne exits'#13#10'Useful when using a' +
        ' real laserdisc player'
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Stop Laserdisc Player'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Daphne_NoLog: TAdvOfficeCheckBoxEx
      Left = 168
      Top = 111
      Width = 137
      Height = 20
      Hint = 'Avoid creating a log when running the emulator'
      Checked = True
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Don'#39't Create Log File'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object Daphne_NoWarnings: TAdvOfficeCheckBoxEx
      Left = 168
      Top = 131
      Width = 90
      Height = 20
      Hint = 'Don'#39't display warnings about game driver problems'
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'No Warnings'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object SendUsageStatistics: TAdvOfficeCheckBoxEx
      Left = 168
      Top = 151
      Width = 137
      Height = 20
      Hint = 
        'Share any usage statistics on Daphne'#39's server (internet connecti' +
        'on required)'
      Checked = True
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Send Usage Statistics'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object EnableCheat: TAdvOfficeCheckBoxEx
      Left = 168
      Top = 171
      Width = 97
      Height = 20
      Hint = 
        'Each game only has one cheat. Most give you unlimited lives'#13#10'Not' +
        ' available for all games'
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Enable Cheat'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object IdleExit: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 64
      Width = 137
      Height = 20
      Hint = 
        'Disables any joysticks that may be plugged in'#13#10'Joysticks will no' +
        'rmally be used if available'
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Idle Exit [00:30 sec]'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object IdleExitValue: TGaugeBar
      Tag = 14
      Left = 8
      Top = 84
      Width = 295
      Height = 20
      Hint = 'Idle Exit [%s '
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      Max = 600
      Min = 30
      ShowHandleGrip = True
      Position = 30
      OnChange = IdleExitValueChange
    end
  end
  object VideoBox: TAdvGroupBoxEx
    Left = 388
    Top = 87
    Width = 185
    Height = 195
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 2
    object ScreenResolutionLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 97
      Height = 16
      Caption = 'Screen Resolution'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ScreenResolution: TComboBox2Ex
      Left = 8
      Top = 36
      Width = 169
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
      Text = 'Auto (Default)'
      Items.Strings = (
        'Auto (Default)')
    end
    object Daphne_FullScreen: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 65
      Width = 81
      Height = 20
      Hint = 'Runs Daphne in fullscreen mode instead of windowed mode'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object FullScale: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 85
      Width = 97
      Height = 20
      Hint = 'Scale the game overlay graphics to the virtual screen dimension'
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Full Scale'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object IgnoreAspectRatio: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 105
      Width = 137
      Height = 20
      Hint = 
        'Do not force the correct aspect ratio (usually 4:3) regardless o' +
        'f the window size'
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Ignore Aspect Ratio'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Daphne_OpenGL: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 125
      Width = 65
      Height = 20
      Hint = 
        'Uses OpenGL hardware acceleration instead of hardware YUV overla' +
        'ys'#13#10'OpenGL is probably faster but is more experimental and only ' +
        'works on newer hardware'
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'OpenGL'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object BlankSearches: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 145
      Width = 105
      Height = 20
      Hint = 'Forces the screen to go blank during searches. VLDP only'
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Blank Searches'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object BlankSkips: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 165
      Width = 97
      Height = 20
      Hint = 'Forces the screen to go blank during skips. VLDP only'
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Blank Skips'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
  end
  object AudioBox: TAdvGroupBoxEx
    Left = 8
    Top = 293
    Width = 233
    Height = 85
    CheckBox.CustomIconsEnabled = False
    RoundEdges = True
    ShadowColor = clSilver
    Caption = 'Audio'
    Ctl3D = True
    TabOrder = 3
    object AudioVolumeVLDPLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 208
      Height = 16
      Hint = 'Virtual Laser Disc Player Volume [%s]'
      Caption = 'Virtual Laser Disc Player Volume [Auto]'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
    end
    object NoSound: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 62
      Width = 81
      Height = 20
      Hint = 'Disable all sounds in the game'
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'No Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object Daphne_PreferSamples: TAdvOfficeCheckBoxEx
      Left = 128
      Top = 62
      Width = 101
      Height = 20
      Hint = 'Force the use of external sound samples, if available'
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Prefer Samples'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
    end
    object AudioVolumeVLDP: TGaugeBar
      Tag = 14
      Left = 8
      Top = 36
      Width = 217
      Height = 20
      Hint = 'Sets the volume of the laserdisc audio. VLDP only'
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      Max = 64
      Min = -1
      ShowHint = True
      ShowHandleGrip = True
      Position = -1
      OnChange = AudioVolumeVLDPChange
    end
  end
  object ButtonReadFile: TBitBtnEx
    Left = 8
    Top = 392
    Width = 89
    Height = 25
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtnEx
    Left = 386
    Top = 392
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object ButtonCancel: TBitBtnEx
    Left = 484
    Top = 392
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
end
