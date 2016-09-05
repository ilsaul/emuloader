object FormFiltersExtra: TFormFiltersExtra
  Left = 668
  Top = 237
  ActiveControl = ButtonOk
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Miscellaneous Filters'
  ClientHeight = 394
  ClientWidth = 401
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object LabelControlType: TLabel
    Left = 208
    Top = 8
    Width = 69
    Height = 15
    Caption = 'Control Type'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelInterfaceType: TLabel
    Left = 208
    Top = 105
    Width = 131
    Height = 15
    Caption = 'Interface Type (Controls)'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelAudioType: TLabel
    Left = 208
    Top = 56
    Width = 61
    Height = 15
    Caption = 'Audio Type'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelGamesROMs: TLabel
    Left = 8
    Top = 56
    Width = 66
    Height = 15
    Caption = 'Game ROMs'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelDeviceROMs: TLabel
    Left = 8
    Top = 104
    Width = 40
    Height = 15
    Caption = 'Devices'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelBios: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 15
    Caption = 'Bios'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelSTVMultiSlot: TLabel
    Left = 24
    Top = 240
    Width = 100
    Height = 16
    Caption = 'Multi-slot machines'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelNeoGeoMVS: TLabel
    Left = 24
    Top = 208
    Width = 100
    Height = 16
    Caption = 'Multi-slot machines'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelScreenOrientation: TLabel
    Left = 8
    Top = 152
    Width = 98
    Height = 15
    Caption = 'Screen Orientation'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelSaveState: TLabel
    Left = 208
    Top = 152
    Width = 53
    Height = 15
    Caption = 'Save State'
    ShowAccelChar = False
    Transparent = True
  end
  object FilterGamesMainCPU: TAdvOfficeCheckBox
    Left = 8
    Top = 324
    Width = 122
    Height = 20
    Hint = 'Enable/disable the main cpu filter bar'
    ShowHint = True
    TabOrder = 0
    OnClick = FilterGamesMainCPUClick
    Alignment = taLeftJustify
    Caption = 'Filter by Main CPU'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 353
    Width = 401
    Height = 41
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 203
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update filters'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtn
      Left = 301
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without changing filters'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonOkClick
    end
    object ButtonDefaultOptions: TBitBtn
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Reset all misc filters to default settings'
      Caption = 'Default'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonDefaultOptionsClick
    end
  end
  object InterfaceType: TComboBox
    Left = 208
    Top = 121
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 2
    Text = 'List Both'
    Items.Strings = (
      'List Both'
      'Classic (Stick/Buttons)'
      'Mechanical (Pinball, etc)')
  end
  object AudioType: TComboBox
    Left = 208
    Top = 73
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 3
    Text = 'List All'
    Items.Strings = (
      'List All'
      'Standard Audio'
      'Discrete Audio'
      'Flac/Wave Sample Audio')
  end
  object GamesROMs: TComboBox
    Left = 8
    Top = 73
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 4
    Text = 'List All'
    Items.Strings = (
      'List All'
      'Games With ROMs (any set)'
      'Games With No ROMs'
      'Games With No Main Set')
  end
  object HideDeviceSets: TAdvOfficeCheckBox
    Left = 73
    Top = 102
    Width = 120
    Height = 20
    TabOrder = 5
    Alignment = taRightJustify
    Caption = 'Hide All Device Sets'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object DeviceROMs: TComboBox
    Left = 8
    Top = 121
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 6
    Text = 'List Both'
    Items.Strings = (
      'List Both'
      'Games With Device Sets'
      'Games With No Device Sets')
  end
  object Bios: TComboBox
    Left = 8
    Top = 25
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 7
    Text = 'List Both'
    Items.Strings = (
      'List Both'
      'Games With Bios Sets'
      'Games With No Bios Sets')
  end
  object HideBiosSets: TAdvOfficeCheckBox
    Left = 86
    Top = 6
    Width = 107
    Height = 19
    TabOrder = 8
    Alignment = taRightJustify
    Caption = 'Hide All Bios Sets'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object HideGamesWithCHDFiles: TAdvOfficeCheckBox
    Left = 8
    Top = 264
    Width = 171
    Height = 20
    Hint = 
      'Check to hide all games that have CHD files'#13#10'(use main games fil' +
      'ter to only show CHD games)'
    ShowHint = True
    TabOrder = 9
    Alignment = taLeftJustify
    Caption = 'Hide Games With CHD Files'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object NeoGeoMVS: TAdvOfficeCheckBox
    Left = 8
    Top = 192
    Width = 161
    Height = 20
    Hint = 
      'Check it to show only Neo-Geo games compatible with multi-slot m' +
      'achines'#13#10'MAME v0.154 minimum required'
    ShowHint = True
    TabOrder = 10
    Alignment = taLeftJustify
    Caption = 'Show Only Neo-Geo MVS'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object STVMultiSlot: TAdvOfficeCheckBox
    Left = 8
    Top = 224
    Width = 163
    Height = 20
    Hint = 
      'Check it to show only ST-V games compatible with multi-slot mach' +
      'ines'#13#10'MAME v0.154 minimum required'
    ShowHint = True
    TabOrder = 11
    Alignment = taLeftJustify
    Caption = 'Show Only ST-V Multi-Slot'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object ControlType_New: TComboBox
    Left = 208
    Top = 25
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 12
    Text = 'List All'
    Items.Strings = (
      'List All')
  end
  object ScreenOrientation: TComboBox
    Left = 8
    Top = 169
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 13
    Text = 'List All'
    Items.Strings = (
      'List All'
      'Horizontal Games'
      'Vertical Games'
      'Unknown')
  end
  object ShowMergedSetsOnly: TAdvOfficeCheckBox
    Left = 8
    Top = 304
    Width = 145
    Height = 20
    Hint = 
      'Check to show only clone sets merged into parent sets (MAME/HBMA' +
      'ME)'#13#10'Merged sets are not fully supported!'
    ShowHint = True
    TabOrder = 14
    Alignment = taLeftJustify
    Caption = 'Show Merged Sets Only'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object HideNoDumpROMsGames: TAdvOfficeCheckBox
    Left = 8
    Top = 284
    Width = 151
    Height = 20
    Hint = 
      'Check to hide games that have all ROMs/CHDs tagged as "nodump" o' +
      'r without CRC32/SHA1 checksum'
    ShowHint = True
    TabOrder = 15
    Alignment = taLeftJustify
    Caption = 'Hide "No Dump" Games'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
  object SaveState: TComboBox
    Left = 208
    Top = 169
    Width = 185
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    ItemHeight = 15
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 16
    Text = 'List All'
    Items.Strings = (
      'List All'
      'Supported'
      'Unsupported'
      'Unknown')
  end
  object CategoryFiltersGroupBox: TAdvGroupBox
    Left = 208
    Top = 200
    Width = 185
    Height = 147
    RoundEdges = True
    Caption = 'Category (uncheck to hide) '
    Ctl3D = True
    TabOrder = 17
    object Label1: TLabel
      Left = 6
      Top = 19
      Width = 171
      Height = 16
      Caption = 'category.ini or catver.ini required'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object ButtonCategoriesToHideInfo: TBitBtn
      Left = 154
      Top = 1
      Width = 16
      Height = 16
      Hint = 'Categories to hide info'
      Caption = '?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonCategoriesToHideInfoClick
    end
    object CategoryCasino: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 44
      Width = 57
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Casino'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryFruitMachines: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 64
      Width = 102
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Fruit Machines'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryRhythm: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 84
      Width = 63
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Rhythm'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryMature: TAdvOfficeCheckBox
      Tag = 1
      Left = 110
      Top = 44
      Width = 60
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      Caption = 'Mature'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryMahjong: TAdvOfficeCheckBox
      Tag = 1
      Left = 110
      Top = 64
      Width = 71
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Mahjong'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryTabletop: TAdvOfficeCheckBox
      Tag = 1
      Left = 110
      Top = 84
      Width = 69
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Tabletop'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryPinMAME: TAdvOfficeCheckBox
      Tag = 1
      Left = 8
      Top = 104
      Width = 84
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Mechanical'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryQuiz: TAdvOfficeCheckBox
      Tag = 1
      Left = 110
      Top = 104
      Width = 49
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Quiz'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object CategoryUtilities: TAdvOfficeCheckBox
      Tag = 1
      Left = 110
      Top = 124
      Width = 62
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Utilities'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
  end
end
