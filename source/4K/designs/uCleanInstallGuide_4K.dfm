object FormCleanInstallGuide4K: TFormCleanInstallGuide4K
  Left = 1226
  Top = 642
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Setup Guide (4K)'
  ClientHeight = 1000
  ClientWidth = 1265
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object ImageCleanInstall: TImage32
    Left = 0
    Top = 0
    Width = 1265
    Height = 1000
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = 3289650
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object LabelQuickSetupGuide: TShadowLabel
      Left = 315
      Top = 755
      Width = 639
      Height = 25
      Alignment = taCenter
      Caption = 'Click here to view the quick setup guide'
      Font.Charset = OEM_CHARSET
      Font.Color = 12779458
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15616
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Visible = False
    end
    object LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel
      Left = 690
      Top = 386
      Width = 273
      Height = 25
      Hint = 'config file'
      Caption = 'config file found'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -24
      Font.Name = 'Terminal'
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
      Left = 690
      Top = 559
      Width = 401
      Height = 25
      Hint = 'folders config file'
      Caption = 'folders config file found'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -24
      Font.Name = 'Terminal'
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
    object ShadowLabel1: TShadowLabel
      Left = 18
      Top = 79
      Width = 1232
      Height = 121
      Hint = '[config file'
      AutoSize = False
      Caption = 
        '   Emu Loader is a frontend for MAME, arcade, console, handheld ' +
        'and computer emulators. You must create a games list for at leas' +
        't one system to access the frontend. Several features are exclus' +
        'ive to MAME and MAME software lists.'#13#10'MAME and arcade systems re' +
        'quire an emulator selected.'#13#10'Console, handheld and computer syst' +
        'ems require games folders selected.'
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
    object ShadowLabel2: TShadowLabel
      Left = 488
      Top = 28
      Width = 289
      Height = 25
      Hint = '[config file'
      Caption = 'GREETNGS, PROGRAM!'
      Font.Charset = OEM_CHARSET
      Font.Color = clBlue
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
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
    object ShadowLabel3: TShadowLabel
      Left = 74
      Top = 304
      Width = 305
      Height = 25
      Hint = '[config file'
      Caption = 'Select Your Options'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -24
      Font.Name = 'Terminal'
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
    object Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 379
      Width = 655
      Height = 36
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Select and Setup MAME/Arcade Emulators'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 437
      Width = 530
      Height = 36
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Create MAME/Arcade Games Lists'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 495
      Width = 1190
      Height = 36
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 
        ' Select and Setup Console/Computer/Handheld Emulators and Comman' +
        'd Line'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 552
      Width = 640
      Height = 36
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Select Console/Computer Games Folders'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 610
      Width = 610
      Height = 36
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Create Console/Computer Games Lists'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object NightMode: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 859
      Width = 215
      Height = 36
      Hint = 'Check to use a dark theme'
      Checked = True
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Night Mode'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      ShadowColor = 4213580
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 907
      Width = 440
      Height = 36
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Alternate Frontend Icons'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      ShadowColor = 4213580
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonSkip: TBitBtnEx
      Left = 730
      Top = 944
      Width = 168
      Height = 45
      Caption = 'Skip'
      ModalResult = 5
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object ButtonOk: TBitBtnEx
      Left = 908
      Top = 944
      Width = 168
      Height = 45
      Caption = 'Continue'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object ButtonCancel: TBitBtnEx
      Left = 1086
      Top = 944
      Width = 168
      Height = 45
      Hint = 'Terminate the application'
      Caption = 'Quit'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object AdvOfficeCheckBoxEx1: TAdvOfficeCheckBoxEx
      Left = 18
      Top = 955
      Width = 295
      Height = 36
      Hint = 'Check so frontend elements and dialogs scale to a 4K display'
      Font.Charset = OEM_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 10
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = ' Disable 4K Mode'
      CaptionVertAlign = tlCenter
      ReturnIsTab = False
      ShadowEnabled = True
      ShadowColor = 4213580
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
end
