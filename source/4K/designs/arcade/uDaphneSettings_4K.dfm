object FormDaphneSettings4K: TFormDaphneSettings4K
  Left = 751
  Top = 198
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (4K)'
  ClientHeight = 841
  ClientWidth = 898
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
  PixelsPerInch = 96
  TextHeight = 15
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 898
    Height = 150
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
      Left = 150
      Top = 1
      Width = 739
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
      Left = 205
      Top = 46
      Width = 684
      Height = 27
      AutoSize = False
      Caption = 'Emulator file'#13#10'Emulator Config Filename'
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
  object ButtonReadFile: TBitBtnEx
    Left = 16
    Top = 780
    Width = 168
    Height = 45
    Hint = 'Reload configuration file'
    Caption = 'Reload Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ButtonOk: TBitBtnEx
    Left = 389
    Top = 780
    Width = 168
    Height = 45
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ButtonCancel: TBitBtnEx
    Left = 492
    Top = 780
    Width = 168
    Height = 45
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object AudioGroupBox: TPanelEx
    Left = 16
    Top = 590
    Width = 532
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
    object AudioGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 530
      Height = 35
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
    object AudioVolumeVLDPLabel: TShadowLabel
      Left = 10
      Top = 45
      Width = 361
      Height = 31
      Hint = 'Virtual Laser Disc Player Volume [%s]'
      Caption = 'Virtual Laser Disc Player Volume [Auto]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Transparent = False
    end
    object NoSound: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 127
      Width = 125
      Height = 36
      Hint = 'Disable all sounds in the game'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'No Sound'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Daphne_PreferSamples: TAdvOfficeCheckBoxEx
      Left = 355
      Top = 127
      Width = 170
      Height = 36
      Hint = 'Force the use of external sound samples, if available'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Prefer Samples'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AudioVolumeVLDP: TGaugeBar
      Tag = 14
      Left = 10
      Top = 81
      Width = 510
      Height = 36
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
    end
  end
  object VideoBoxGroupBox: TPanelEx
    Left = 573
    Top = 160
    Width = 309
    Height = 404
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
    object VideoBoxGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 307
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Video'
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
      Left = 10
      Top = 45
      Width = 166
      Height = 31
      Caption = 'Screen Resolution'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    object ScreenResolution: TComboBox2Ex
      Left = 10
      Top = 81
      Width = 287
      Height = 36
      Style = csOwnerDrawFixed
      DropDownCount = 30
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Auto (Default)'
      Items.Strings = (
        'Auto (Default)')
    end
    object Daphne_FullScreen: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 127
      Width = 220
      Height = 36
      Hint = 'Runs Daphne in fullscreen mode instead of windowed mode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FullScale: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 174
      Width = 220
      Height = 36
      Hint = 'Scale the game overlay graphics to the virtual screen dimension'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Full Scale'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object IgnoreAspectRatio: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 221
      Width = 220
      Height = 36
      Hint = 
        'Do not force the correct aspect ratio (usually 4:3) regardless o' +
        'f the window size'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Ignore Aspect Ratio'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Daphne_OpenGL: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 268
      Width = 220
      Height = 36
      Hint = 
        'Uses OpenGL hardware acceleration instead of hardware YUV overla' +
        'ys'#13#10'OpenGL is probably faster but is more experimental and only ' +
        'works on newer hardware'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'OpenGL'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object BlankSearches: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 315
      Width = 220
      Height = 36
      Hint = 'Forces the screen to go blank during searches. VLDP only'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Blank Searches'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object BlankSkips: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 362
      Width = 220
      Height = 36
      Hint = 'Forces the screen to go blank during skips. VLDP only'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Blank Skips'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object GeneralGroupBox: TPanelEx
    Left = 16
    Top = 160
    Width = 532
    Height = 404
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
    object GeneralGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 530
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'General'
      CaptionIndent = 7
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
    object LaserDiscTypeLabel: TShadowLabel
      Left = 10
      Top = 45
      Width = 143
      Height = 31
      Caption = 'Laser Disc Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    object LaserDiscType: TComboBox2Ex
      Left = 10
      Top = 81
      Width = 510
      Height = 36
      Hint = 'Select a laserdisc type'
      Style = csOwnerDrawFixed
      DropDownCount = 30
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ParentFont = False
      TabOrder = 0
    end
    object Daphne_NoJoysticks: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 221
      Width = 150
      Height = 36
      Hint = 
        'Disables any joysticks that may be plugged in'#13#10'Joysticks will no' +
        'rmally be used if available'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'No Joysticks'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SRAMContinuousUpdate: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 268
      Width = 275
      Height = 36
      Hint = 
        'Saves the static RAM constantly to preserve high scores if the e' +
        'mulator crashes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'SRAM Continuous Update'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FastBoot: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 315
      Width = 120
      Height = 36
      Hint = 
        'Makes games start faster. Only available on a few games like Dra' +
        'gon'#39's Lair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Fast Boot'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object StopLaserdiscPlayer: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 362
      Width = 230
      Height = 36
      Hint = 
        'Stop the laserdisc player when Daphne exits'#13#10'Useful when using a' +
        ' real laserdisc player'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Stop Laserdisc Player'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Daphne_NoLog: TAdvOfficeCheckBoxEx
      Left = 294
      Top = 221
      Width = 228
      Height = 36
      Hint = 'Avoid creating a log when running the emulator'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Don'#39't Create Log File'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Daphne_NoWarnings: TAdvOfficeCheckBoxEx
      Left = 294
      Top = 268
      Width = 155
      Height = 36
      Hint = 'Don'#39't display warnings about game driver problems'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'No Warnings'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object SendUsageStatistics: TAdvOfficeCheckBoxEx
      Left = 294
      Top = 315
      Width = 228
      Height = 36
      Hint = 
        'Share any usage statistics on Daphne'#39's server (internet connecti' +
        'on required)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Send Usage Statistics'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object EnableCheat: TAdvOfficeCheckBoxEx
      Left = 294
      Top = 362
      Width = 160
      Height = 36
      Hint = 
        'Each game only has one cheat. Most give you unlimited lives'#13#10'Not' +
        ' available for all games'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Cheat'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object IdleExit: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 127
      Width = 287
      Height = 36
      Hint = 
        'Disables any joysticks that may be plugged in'#13#10'Joysticks will no' +
        'rmally be used if available'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Idle Exit [00:30 sec]'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object IdleExitValue: TGaugeBar
      Tag = 14
      Left = 10
      Top = 174
      Width = 510
      Height = 36
      Hint = 'Idle Exit [%s '
      Color = clWindow
      Backgnd = bgPattern
      ButtonSize = 12
      LargeChange = 10
      Max = 600
      Min = 30
      ShowHandleGrip = True
      Position = 30
    end
  end
end
