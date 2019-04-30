object FormArcadeScanGamesMode: TFormArcadeScanGamesMode
  Left = 1507
  Top = 560
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Scan Games Mode (MAME and Arcade only)'
  ClientHeight = 432
  ClientWidth = 380
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
  object LabelImportantTips: TShadowLabel
    Left = 17
    Top = 352
    Width = 324
    Height = 31
    Caption = 
      'Important: bios/device sets included; parent sets are ignored; m' +
      'erged sets are not supported.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    WordWrap = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 391
    Width = 380
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Left = 146
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      TabStop = False
    end
  end
  object ScanModeBox: TAdvGroupBox
    Left = 8
    Top = 8
    Width = 364
    Height = 159
    RoundEdges = True
    Caption = '           Choose Scan Mode '
    TabOrder = 1
    object ScanModeIcon: TImage
      Left = 21
      Top = 0
      Width = 16
      Height = 16
    end
    object LabelFullScan: TShadowLabel
      Left = 84
      Top = 32
      Width = 274
      Height = 16
      Caption = '(validate all ROMs/CHDs, CRC32/SHA-1 checksum)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
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
    object LabelQuickScan: TShadowLabel
      Left = 94
      Top = 58
      Width = 264
      Height = 16
      Caption = '(search .zip; .7z; .chd game/bios/device files only)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
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
    object LabelForceAllAvailable: TShadowLabel
      Left = 167
      Top = 84
      Width = 191
      Height = 16
      Caption = '(no validation or file search is done)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
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
    object FullScan: TAdvOfficeRadioButton
      Left = 9
      Top = 30
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
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Full Scan'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object QuickScan: TAdvOfficeRadioButton
      Tag = 1
      Left = 9
      Top = 56
      Width = 81
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Quick Scan'
      ReturnIsTab = False
      Themed = True
    end
    object ForceAllAvailable: TAdvOfficeRadioButton
      Tag = 2
      Left = 9
      Top = 82
      Width = 143
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Force Games Available'
      ReturnIsTab = False
      Themed = True
    end
    object ScanMAMESetsBox: TAdvGroupBox
      Left = 7
      Top = 114
      Width = 349
      Height = 41
      BorderStyle = bsAdvNone
      Transparent = False
      Caption = '         Scan MAME Sets (v0.162 or newer)'
      Ctl3D = True
      TabOrder = 3
      object ImageScanMAME: TImage
        Left = 14
        Top = 0
        Width = 16
        Height = 16
      end
      object ScanMAMEAllSets: TAdvOfficeRadioButton
        Left = 2
        Top = 20
        Width = 62
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
        Left = 81
        Top = 20
        Width = 118
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
        Left = 217
        Top = 20
        Width = 131
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
  object MAMESoftwareListBox: TAdvGroupBox
    Tag = 1
    Left = 8
    Top = 184
    Width = 364
    Height = 131
    RoundEdges = True
    Caption = '           MAME Software List Games '
    Ctl3D = True
    TabOrder = 2
    object LabelMAMESoftwareList_Disabled: TShadowLabel
      Left = 172
      Top = 32
      Width = 186
      Height = 16
      Caption = '(do not create lists and delete files)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
    object LabelMAMESoftwareList_EnabledUpdate: TShadowLabel
      Left = 161
      Top = 58
      Width = 197
      Height = 16
      Caption = '(create new lists and update old lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
    object LabelMAMESoftwareList_EnabledOverwrite: TShadowLabel
      Left = 170
      Top = 84
      Width = 188
      Height = 16
      Caption = '(delete all files and create new lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
    object ImageMAMESoftwareList: TImage
      Left = 21
      Top = 0
      Width = 16
      Height = 16
    end
    object LabelMAMESoftwareListBox_BlankLine: TShape
      Left = 212
      Top = 8
      Width = 137
      Height = 1
      Pen.Color = clWhite
    end
    object LabelCustomizeMAMESoftwareList: TShadowLabel
      Left = 45
      Top = 107
      Width = 275
      Height = 14
      Cursor = crHandPoint
      Caption = 'customize, disable software lists you don'#39't want'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      OnClick = LabelCustomizeMAMESoftwareListClick
      OnMouseEnter = LabelCustomizeMAMESoftwareListMouseEnter
      OnMouseLeave = LabelCustomizeMAMESoftwareListMouseLeave
    end
    object LabelMAMESoftwareListBox_BlankLine2: TShape
      Left = 212
      Top = 9
      Width = 137
      Height = 1
      Pen.Color = clWhite
    end
    object LabelMAMESoftwareListBox: TShadowLabel
      Left = 217
      Top = 1
      Width = 109
      Height = 16
      Caption = '(console/computer)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
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
    object MAMESoftwareList_Disabled: TAdvOfficeRadioButton
      Left = 9
      Top = 30
      Width = 69
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Disable'
      ReturnIsTab = False
      Themed = True
    end
    object MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButton
      Tag = 1
      Left = 9
      Top = 56
      Width = 144
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Enable: Update Mode'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButton
      Tag = 2
      Left = 9
      Top = 82
      Width = 155
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Enable: Overwrite Mode'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonHelpCreateMAMESoftwareListGames: TBitBtnEx
      Left = 328
      Top = 0
      Width = 19
      Height = 19
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
      TabOrder = 3
      TabStop = False
      OnClick = ButtonHelpCreateMAMESoftwareListGamesClick
    end
  end
  object AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox
    Left = 140
    Top = 324
    Width = 228
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = 7891291
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 3
    OnClick = AddMAMEDeviceSetWithNoROMsClick
    Alignment = taLeftJustify
    Caption = 'Add MAME Device Sets With No ROMs'
    ReturnIsTab = False
    Themed = True
  end
end
