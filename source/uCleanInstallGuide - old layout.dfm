object FormCleanInstallGuide: TFormCleanInstallGuide
  Left = 1069
  Top = 625
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Setup Guide'
  ClientHeight = 397
  ClientWidth = 619
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PanelGreetingsProgram: TPanelEx
    Left = 0
    Top = 0
    Width = 619
    Height = 105
    Align = alTop
    Color1 = 1
    Color2 = 75
    Color3 = clMaroon
    Color4 = 15856113
    ColorFrame = 16750899
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGreetingsProgram: TShadowLabel
      Left = 231
      Top = 8
      Width = 157
      Height = 23
      Caption = 'Greetings, program!'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16741235
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clNavy
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelGreetingsInfo: TShadowLabel
      Left = 8
      Top = 32
      Width = 603
      Height = 69
      AutoSize = False
      Caption = 
        '    Emu Loader is a frontend for MAME, arcade, console and compu' +
        'ter emulators. You have to create a'#13#10'games list for at least one' +
        ' system to access the main features. Several features are exclus' +
        'ive to MAME.'#13#10'MAME and arcade systems require an emulator select' +
        'ed.'#13#10'Console and computer systems require games folders selected' +
        '. Emulators are optional.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clNavy
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
  end
  object PanelGreetingsProgramBottom: TPanelEx
    Left = 0
    Top = 105
    Width = 619
    Height = 15
    Align = alTop
    Color1 = 75
    Color2 = 1
    Color3 = 1
    Color4 = 15856113
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 100
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 339
    Width = 619
    Height = 58
    Align = alBottom
    Color1 = 1
    Color2 = 3289650
    Color3 = 15856113
    Color4 = 14540253
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Left = 215
      Top = 25
      Width = 89
      Height = 25
      Caption = 'Continue'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 315
      Top = 25
      Width = 89
      Height = 25
      Hint = 'Terminate the application'
      Caption = 'Quit'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
    object NightMode: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 11
      Width = 126
      Height = 20
      Hint = 'Check to use a dark theme'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      OnClick = NightModeClick
      Alignment = taLeftJustify
      Caption = 'Enable Night Mode'
      ReturnIsTab = False
      ShadowEnabled = True
      ShadowColor = 4213580
      Themed = True
    end
    object UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 31
      Width = 177
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = 12574688
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Use Alternate Frontend Icons'
      ReturnIsTab = False
      ShadowEnabled = True
      ShadowColor = 4213580
      Themed = True
    end
  end
  object PanelOptions: TPanelEx
    Left = 0
    Top = 139
    Width = 619
    Height = 200
    Color1 = 5832704
    Color2 = 1
    Color3 = 7891291
    Color4 = 3289650
    ColorFrame = 16750899
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ShadowLabel5: TShadowLabel
      Left = 271
      Top = 45
      Width = 174
      Height = 15
      Caption = '(select emulators required)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ShadowLabel6: TShadowLabel
      Left = 300
      Top = 141
      Width = 200
      Height = 15
      Caption = '(select games folders required)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel
      Left = 327
      Top = 13
      Width = 236
      Height = 15
      Hint = '(selected emulators config file'
      Caption = '(selected emulators config file found)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGreen
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel
      Left = 314
      Top = 109
      Width = 262
      Height = 15
      Hint = '(selected games folders config file'
      Caption = '(selected games folders config file found)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGreen
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelQuickSetupGuide: TShadowLabel
      Left = 203
      Top = 181
      Width = 213
      Height = 16
      Caption = 'Click here to view the quick setup guide'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12779458
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15616
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      OnClick = LabelQuickSetupGuideClick
      OnMouseEnter = LabelQuickSetupGuideMouseEnter
      OnMouseLeave = LabelQuickSetupGuideMouseLeave
    end
    object Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 10
      Width = 312
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = 'Select and Setup MAME / Arcade Emulators'
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
    end
    object Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 42
      Width = 254
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = 'Create MAME / Arcade Games Lists'
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
    end
    object Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 74
      Width = 585
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = 
        'Select and Setup Console / Computer Emulators and Their Command ' +
        'Line Parameters'
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
    end
    object Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 106
      Width = 298
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = 'Select Console / Computer Games Folders'
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
    end
    object Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 138
      Width = 282
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlBottom
      Caption = 'Create Console / Computer Games Lists'
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
    end
  end
  object PanelSelectOptions: TPanelEx
    Left = 0
    Top = 120
    Width = 619
    Height = 19
    Align = alTop
    Color1 = 1
    Color2 = 5832704
    Color3 = 1
    Color4 = 5832704
    ColorFrame = 16750899
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSelectOptions: TShadowLabel
      Left = 31
      Top = 0
      Width = 125
      Height = 19
      Caption = 'Select Your Options'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSelectOptionsTop: TShadowLabel
      Left = 273
      Top = 0
      Width = 331
      Height = 18
      Caption = '(unckeck all options if you just want to access the frontend)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlack
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
  end
end
