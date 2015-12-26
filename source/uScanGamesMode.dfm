object FormScanGamesMode: TFormScanGamesMode
  Left = 700
  Top = 316
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Scan Games Mode'
  ClientHeight = 337
  ClientWidth = 524
  Color = clWhite
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelSelectMode: TLabel
    Left = 16
    Top = 8
    Width = 492
    Height = 41
    AutoSize = False
    Caption = 
      '     Choose the scan mode to validate game ROMs/CHDs. If you use' +
      '                    or                      to verify your games' +
      ', Simple Scan mode is faster since it doesn'#39't validate files.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
    WordWrap = True
  end
  object Label1: TLabel
    Left = 32
    Top = 76
    Width = 340
    Height = 15
    Caption = 'This mode validates all ROMs/CHDs files required for each game'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 32
    Top = 138
    Width = 404
    Height = 15
    Caption = 
      'This mode does not validate ROMs/CHDs. It only searches for the ' +
      'game files.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 32
    Top = 200
    Width = 441
    Height = 15
    Caption = 
      'This mode sets games available no matter what. No validation or ' +
      'file search is done.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelClrMAME: TLabel
    Left = 376
    Top = 8
    Width = 51
    Height = 15
    Hint = 'http://mamedev.emulab.it/clrmamepro'
    Caption = 'ClrMAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    Transparent = True
    OnClick = LabelClrMAMEClick
    OnMouseEnter = LabelClrMAMEMouseEnter
    OnMouseLeave = LabelClrMAMEMouseLeave
  end
  object LabelRomCenter: TLabel
    Left = 447
    Top = 8
    Width = 64
    Height = 15
    Hint = 'http://www.romcenter.com'
    Caption = 'RomCenter'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    Transparent = True
    OnClick = LabelClrMAMEClick
    OnMouseEnter = LabelClrMAMEMouseEnter
    OnMouseLeave = LabelClrMAMEMouseLeave
  end
  object Label4: TLabel
    Left = 32
    Top = 92
    Width = 400
    Height = 15
    Caption = 
      'Important: CRC32 checksum for ROMs and SHA-1 / MD5 checksum for ' +
      'CHDs'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 32
    Top = 154
    Width = 413
    Height = 15
    Caption = 
      'Important: bios, device, parent sets are ignored; merged sets ar' +
      'e not supported.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object ScanModeIcon: TImage
    Left = 29
    Top = 42
    Width = 16
    Height = 16
  end
  object Label6: TLabel
    Left = 96
    Top = 120
    Width = 416
    Height = 15
    Caption = 
      '(Warning: very slow scan due to unknown reasons, please use full' +
      ' scan instead)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object FullScan: TAdvOfficeRadioButton
    Left = 16
    Top = 56
    Width = 73
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    Alignment = taLeftJustify
    Caption = 'Full Scan'
    Checked = True
    ReturnIsTab = False
    Themed = True
  end
  object QuickScan: TAdvOfficeRadioButton
    Left = 16
    Top = 118
    Width = 81
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = 'Quick Scan'
    ReturnIsTab = False
    Themed = True
  end
  object ForceAllAvailable: TAdvOfficeRadioButton
    Left = 16
    Top = 180
    Width = 143
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = 'Force Games Available'
    ReturnIsTab = False
    Themed = True
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 296
    Width = 524
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelCustomizeSoftwareList: TShadowLabel
      Left = 6
      Top = 22
      Width = 34
      Height = 13
      Cursor = crHandPoint
      Hint = 'Customize software list'
      Caption = 'custom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = LabelCustomizeSoftwareListClick
      OnMouseEnter = LabelCustomizeSoftwareListMouseEnter
      OnMouseLeave = LabelCustomizeSoftwareListMouseLeave
    end
    object LabelCreateSoftwareListGames: TShadowLabel
      Left = 45
      Top = 22
      Width = 166
      Height = 13
      Caption = 'Add MAME consoles/computers games'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelAddMAMEDeviceSetWithNoROMs: TShadowLabel
      Left = 365
      Top = 22
      Width = 145
      Height = 13
      Caption = 'Add MAME devices with no ROMs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ButtonOk: TBitBtn
      Left = 217
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      TabStop = False
    end
    object ButtonHelpCreateSoftwareListGames: TBitBtn
      Left = 6
      Top = 5
      Width = 17
      Height = 17
      Hint = 'What is this ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = ButtonHelpCreateSoftwareListGamesClick
    end
    object CreateSoftwareListGames: TAdvOfficeCheckBox
      Left = 28
      Top = 4
      Width = 177
      Height = 20
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      OnClick = CreateSoftwareListGamesClick
      Alignment = taLeftJustify
      Caption = 'Create Software List Games'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox
      Left = 348
      Top = 4
      Width = 175
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = 7891291
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      OnClick = AddMAMEDeviceSetWithNoROMsClick
      Alignment = taLeftJustify
      Caption = 'Device Sets With No ROMs'
      ReturnIsTab = False
      Themed = True
    end
  end
  object ScanMAMESetsBox: TAdvGroupBox
    Left = 6
    Top = 236
    Width = 367
    Height = 41
    BorderStyle = bsNone
    Transparent = False
    Caption = '            Scan MAME Sets (v0.162 and newer)'
    Ctl3D = True
    TabOrder = 4
    object ImageScanMAME: TImage
      Left = 23
      Top = 0
      Width = 16
      Height = 16
    end
    object ScanMAMEAllSets: TAdvOfficeRadioButton
      Left = 10
      Top = 20
      Width = 63
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = ScanMAMEAllSetsClick
      Alignment = taLeftJustify
      Caption = 'All Sets'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object ScanMAMEArcadeMachines: TAdvOfficeRadioButton
      Tag = 1
      Left = 89
      Top = 20
      Width = 122
      Height = 20
      TabOrder = 1
      OnClick = ScanMAMEAllSetsClick
      Alignment = taLeftJustify
      Caption = 'Arcade/Machines'
      ReturnIsTab = False
      Themed = True
    end
    object ScanMAMESoftwareListGames: TAdvOfficeRadioButton
      Tag = 2
      Left = 224
      Top = 20
      Width = 138
      Height = 20
      TabOrder = 2
      OnClick = ScanMAMEAllSetsClick
      Alignment = taLeftJustify
      Caption = 'Software List Games'
      ReturnIsTab = False
      Themed = True
    end
  end
end
