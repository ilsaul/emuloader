object FormFiltersMAMEMachines: TFormFiltersMAMEMachines
  Left = 726
  Top = 379
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Machine Filters'
  ClientHeight = 407
  ClientWidth = 394
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object LabelSelectMode: TLabel
    Left = 16
    Top = 8
    Width = 345
    Height = 30
    AutoSize = False
    Caption = 
      '     Choose what machine types you want to see in the games list' +
      '. MAME v0.162 (and higher) or UME is required to use these filte' +
      'rs.'
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
  object LabelArcadeGames: TLabel
    Left = 33
    Top = 72
    Width = 164
    Height = 15
    Caption = 'Show arcade games/machines.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelCategoryIniForMESS: TLabel
    Left = 33
    Top = 331
    Width = 329
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://www.progettosnaps.net/renameset/'
    Caption = 'click here to download category.ini for MESS (renameSET page)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    Transparent = True
    OnClick = LabelCategoryIniForMESSClick
    OnMouseEnter = LabelCategoryIniForMESSMouseEnter
    OnMouseLeave = LabelCategoryIniForMESSMouseLeave
  end
  object LabelMAMEMachinesNoSoftwareLists: TLabel
    Left = 33
    Top = 118
    Width = 150
    Height = 15
    Caption = 'Show non-arcade machines.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelMAMEMachinesIniMESSRequired: TLabel
    Left = 196
    Top = 118
    Width = 182
    Height = 15
    Caption = '(file "category_home.ini" required)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 33
    Top = 210
    Width = 210
    Height = 15
    Caption = 'Show MAME console/computer games.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 291
    Width = 371
    Height = 26
    AutoSize = False
    Caption = 
      '     Thanks to AntoPISA for creating "category_home.ini". Machin' +
      'es filters would never be possible without it!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
    WordWrap = True
  end
  object LabelProgettoSNAPS: TLabel
    Left = 281
    Top = 304
    Width = 86
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://www.progettosnaps.net'
    Caption = 'Progetto-SNAPS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    Transparent = True
    OnClick = LabelCategoryIniForMESSClick
    OnMouseEnter = LabelCategoryIniForMESSMouseEnter
    OnMouseLeave = LabelCategoryIniForMESSMouseLeave
  end
  object Label3: TLabel
    Left = 54
    Top = 345
    Width = 288
    Height = 16
    Caption = '(place "category_home.ini" file in "eldir\ini_files\" folder)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelMAMEMachinesWithSoftwareLists: TLabel
    Left = 33
    Top = 164
    Width = 306
    Height = 15
    Caption = 'Show non-arcade machines that have software list games.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 33
    Top = 256
    Width = 198
    Height = 15
    Caption = 'Filter software list games by machine.'
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
    Left = 247
    Top = 210
    Width = 131
    Height = 15
    Caption = '(other filters are ignored)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 366
    Width = 394
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 198
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
      Left = 296
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
  end
  object ArcadeGames: TAdvOfficeCheckBox
    Tag = 1
    Left = 16
    Top = 52
    Width = 185
    Height = 20
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ShowHint = True
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = 'Arcade Games (All Emulators)'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object MAMEMachinesNoSoftwareLists: TAdvOfficeCheckBox
    Tag = 1
    Left = 16
    Top = 98
    Width = 249
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
    Alignment = taLeftJustify
    Caption = 'MAME Machines Without Software Lists'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object SoftwareListGames: TAdvOfficeCheckBox
    Tag = 1
    Left = 16
    Top = 190
    Width = 137
    Height = 20
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ShowHint = True
    TabOrder = 3
    Alignment = taLeftJustify
    Caption = 'Software List Games'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object MAMEMachinesWithSoftwareLists: TAdvOfficeCheckBox
    Tag = 1
    Left = 16
    Top = 144
    Width = 225
    Height = 20
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ShowHint = True
    TabOrder = 4
    Alignment = taLeftJustify
    Caption = 'MAME Machines With Software Lists'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object EnableMAMEMachinesSidePanel: TAdvOfficeCheckBox
    Left = 16
    Top = 236
    Width = 211
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ShowHint = True
    TabOrder = 5
    Alignment = taLeftJustify
    Caption = 'Enable MAME Machines Side Panel'
    ReturnIsTab = False
    ShadowColor = clSilver
    Themed = True
  end
end
