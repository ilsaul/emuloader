object FormArcadeScanGamesMode4K: TFormArcadeScanGamesMode4K
  Left = 1680
  Top = 588
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Scan Games Mode (MAME and Arcade only) 4K'
  ClientHeight = 811
  ClientWidth = 710
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelImportantTips: TShadowLabel
    Left = 62
    Top = 678
    Width = 588
    Height = 55
    Caption = 
      'Important: bios/device sets included; parent sets are ignored; m' +
      'erged sets are not supported.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
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
    WordWrap = True
  end
  object LabelMultiSelect: TShadowLabel
    Left = 14
    Top = 602
    Width = 353
    Height = 31
    Caption = 'Hold Ctrl or Shift for multiple selections'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 740
    Width = 710
    Height = 71
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
      Left = 181
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      TabStop = False
    end
    object ButtonCancel: TBitBtnEx
      Left = 362
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      TabStop = False
    end
  end
  object ScanModeBox: TAdvGroupBoxEx
    Left = 10
    Top = 10
    Width = 690
    Height = 294
    CheckBox.CustomIconsEnabled = False
    CheckBox.CustomEnableIconHD = False
    RoundEdges = True
    Caption = '         Choose Scan Mode '
    TabOrder = 1
    object ScanModeIcon: TImage
      Left = 21
      Top = 0
      Width = 32
      Height = 32
    end
    object LabelFullScan: TShadowLabel
      Left = 209
      Top = 48
      Width = 474
      Height = 31
      Caption = '(validate all ROMs/CHDs, CRC32/SHA-1 checksum)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
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
    object LabelQuickScan: TShadowLabel
      Left = 224
      Top = 98
      Width = 459
      Height = 31
      Caption = '(search .zip; .7z; .chd game/bios/device files only)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
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
    object LabelForceAllAvailable: TShadowLabel
      Left = 350
      Top = 148
      Width = 333
      Height = 31
      Caption = '(no validation or file search is done)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
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
    object FullScan: TAdvOfficeRadioButtonEx
      Left = 10
      Top = 46
      Width = 120
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Full Scan'
      Checked = True
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object QuickScan: TAdvOfficeRadioButtonEx
      Tag = 1
      Left = 10
      Top = 96
      Width = 140
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Quick Scan'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ForceAllAvailable: TAdvOfficeRadioButtonEx
      Tag = 2
      Left = 10
      Top = 146
      Width = 250
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Force Games Available'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ScanMAMESetsBox: TAdvGroupBoxEx
      Left = 7
      Top = 208
      Width = 679
      Height = 83
      BorderStyle = bsAdvNone
      CheckBox.CustomIconsEnabled = False
      CheckBox.CustomEnableIconHD = False
      Caption = '        Scan MAME Sets (v0.162 or newer)'
      Ctl3D = True
      TabOrder = 3
      object ImageScanMAME: TImage
        Left = 14
        Top = 0
        Width = 32
        Height = 32
      end
      object ScanMAMEAllSets: TAdvOfficeRadioButtonEx
        Left = 3
        Top = 46
        Width = 105
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'All Sets'
        Checked = True
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ScanMAMEArcadeMachines: TAdvOfficeRadioButtonEx
        Tag = 1
        Left = 180
        Top = 46
        Width = 200
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Arcade/Machines'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ScanMAMESoftwareListGames: TAdvOfficeRadioButtonEx
        Tag = 2
        Left = 452
        Top = 46
        Width = 225
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Software List Games'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
    end
  end
  object MAMESoftwareListBox: TAdvGroupBoxEx
    Tag = 1
    Left = 10
    Top = 352
    Width = 690
    Height = 249
    CheckBox.CustomIconsEnabled = False
    CheckBox.CustomEnableIconHD = False
    RoundEdges = True
    Caption = '         MAME Software List Games '
    Ctl3D = True
    TabOrder = 2
    object LabelMAMESoftwareList_Disabled: TShadowLabel
      Left = 356
      Top = 48
      Width = 327
      Height = 31
      Caption = '(do not create lists and delete files)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
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
    object LabelMAMESoftwareList_EnabledUpdate: TShadowLabel
      Left = 338
      Top = 98
      Width = 345
      Height = 31
      Caption = '(create new lists and update old lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
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
    object LabelMAMESoftwareList_EnabledOverwrite: TShadowLabel
      Left = 352
      Top = 148
      Width = 331
      Height = 31
      Caption = '(delete all files and create new lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
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
    object ImageMAMESoftwareList: TImage
      Left = 21
      Top = 0
      Width = 32
      Height = 32
    end
    object LabelMAMESoftwareListBox_BlankLine: TShape
      Left = 347
      Top = 16
      Width = 327
      Height = 1
      Pen.Color = clWhite
    end
    object LabelCustomizeMAMESoftwareList: TShadowLabel
      Left = 112
      Top = 202
      Width = 466
      Height = 24
      Cursor = crHandPoint
      Caption = 'customize, disable software lists you don'#39't want'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
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
    end
    object LabelMAMESoftwareListBox_BlankLine2: TShape
      Left = 347
      Top = 17
      Width = 327
      Height = 1
      Pen.Color = clWhite
    end
    object LabelMAMESoftwareListBox: TShadowLabel
      Left = 356
      Top = 1
      Width = 266
      Height = 31
      Caption = 'console/computer/handheld'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
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
    object MAMESoftwareList_Disabled: TAdvOfficeRadioButtonEx
      Left = 10
      Top = 46
      Width = 140
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Disable'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButtonEx
      Tag = 1
      Left = 10
      Top = 96
      Width = 240
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable: Update Mode'
      Checked = True
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButtonEx
      Tag = 2
      Left = 10
      Top = 146
      Width = 270
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable: Overwrite Mode'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpCreateMAMESoftwareListGames: TBitBtnEx
      Left = 628
      Top = 0
      Width = 36
      Height = 36
      Hint = 'What is this ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
    end
  end
  object AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBoxEx
    Left = 294
    Top = 624
    Width = 400
    Height = 36
    Font.Charset = ANSI_CHARSET
    Font.Color = 7891291
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 3
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Add MAME Device Sets With No ROMs'
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object ScanModeCurrentTaskOnly: TAdvOfficeCheckBoxEx
    Left = 64
    Top = 639
    Width = 195
    Height = 36
    Hint = 
      'The selected mode will be used only for the current task'#13#10'Unchec' +
      'k this option to change scan mode permanently'
    ShowHint = True
    TabOrder = 4
    Alignment = taRightJustify
    ButtonVertAlign = tlCenter
    Caption = 'For This Task Only'
    CaptionvertAlign = tlCenter
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
end
