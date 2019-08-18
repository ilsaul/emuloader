object FormCleanInstallGuide: TFormCleanInstallGuide
  Left = 1069
  Top = 625
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Setup Guide'
  ClientHeight = 392
  ClientWidth = 636
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ImageAnimatedGIF: TImage
    Left = 0
    Top = 0
    Width = 636
    Height = 392
  end
  object LabelQuickSetupGuide: TShadowLabel
    Left = 211
    Top = 309
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
  object LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel
    Left = 351
    Top = 152
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
  object ShadowLabel5: TShadowLabel
    Left = 287
    Top = 181
    Width = 174
    Height = 15
    Caption = '(select emulators required)'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5263610
    Font.Height = -12
    Font.Name = 'Verdana'
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
  object LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel
    Left = 346
    Top = 238
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
  object ShadowLabel6: TShadowLabel
    Left = 332
    Top = 269
    Width = 200
    Height = 15
    Caption = '(select games folders required)'
    Font.Charset = ANSI_CHARSET
    Font.Color = 5263610
    Font.Height = -12
    Font.Name = 'Verdana'
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
  object NightMode: TAdvOfficeCheckBoxEx
    Left = 8
    Top = 345
    Width = 169
    Height = 20
    Hint = 'Check to use a dark theme'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 0
    OnClick = NightModeClick
    Alignment = taLeftJustify
    ReturnIsTab = False
    ShadowEnabled = True
    ShadowColor = 4213580
    Themed = True
  end
  object UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx
    Left = 8
    Top = 365
    Width = 257
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 1
    Alignment = taLeftJustify
    ReturnIsTab = False
    ShadowEnabled = True
    ShadowColor = 4213580
    Themed = True
  end
  object ButtonOk: TBitBtnEx
    Left = 439
    Top = 359
    Width = 89
    Height = 25
    Caption = 'Continue'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ButtonCancel: TBitBtnEx
    Left = 539
    Top = 359
    Width = 89
    Height = 25
    Hint = 'Terminate the application'
    Caption = 'Quit'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 149
    Width = 335
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
    ReturnIsTab = False
    ShadowEnabled = True
    State = cbChecked
    Themed = True
  end
  object Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 178
    Width = 271
    Height = 19
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Alignment = taLeftJustify
    ButtonVertAlign = tlBottom
    ReturnIsTab = False
    ShadowEnabled = True
    State = cbChecked
    Themed = True
  end
  object Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 207
    Width = 599
    Height = 19
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Alignment = taLeftJustify
    ButtonVertAlign = tlBottom
    ReturnIsTab = False
    ShadowEnabled = True
    State = cbChecked
    Themed = True
  end
  object Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 236
    Width = 327
    Height = 19
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Alignment = taLeftJustify
    ButtonVertAlign = tlBottom
    ReturnIsTab = False
    ShadowEnabled = True
    State = cbChecked
    Themed = True
  end
  object Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 265
    Width = 311
    Height = 19
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Alignment = taLeftJustify
    ButtonVertAlign = tlBottom
    ReturnIsTab = False
    ShadowEnabled = True
    State = cbChecked
    Themed = True
  end
  object PauseAnimation: TAdvOfficeCheckBoxEx
    Left = 520
    Top = 307
    Width = 109
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 9
    OnClick = PauseAnimationClick
    Alignment = taLeftJustify
    Caption = 'Pause Animation'
    ReturnIsTab = False
    ShadowEnabled = True
    ShadowColor = 4213580
    Themed = True
  end
end
