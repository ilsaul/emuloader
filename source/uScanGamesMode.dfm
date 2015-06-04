object FormScanGamesMode: TFormScanGamesMode
  Left = 699
  Top = 315
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Scan Games Mode'
  ClientHeight = 275
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
      ', Simple Scan mode is faster since main game files are only sear' +
      'ched.'
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
    Width = 472
    Height = 15
    Caption = 
      'This mode validates all ROMs and CHDs files of each game thru CR' +
      'C32/SHA-1 checksum.'
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
    Top = 140
    Width = 471
    Height = 15
    Caption = 
      'This mode does not validate ROMs. It searches for game set and c' +
      'hd file. No merged sets.'
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
    Top = 204
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
    Width = 464
    Height = 15
    Caption = 
      'Important Rule: the game set or the bios set must exist, or the ' +
      'game will not be validated.'
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
    Top = 156
    Width = 478
    Height = 15
    Caption = 
      'Important Rule: Bios, device, parent sets are ignored. CHDs are ' +
      'validated from file'#39's header.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
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
    Top = 120
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
    Top = 184
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
    Top = 234
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
    object Label6: TLabel
      Left = 344
      Top = 6
      Width = 174
      Height = 30
      Alignment = taRightJustify
      Caption = 'Up/Down arrow keys to select Enter/Esc keys to confirm and exit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      WordWrap = True
    end
    object ButtonOk: TBitBtn
      Left = 201
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonHelp: TBitBtn
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Help'
      TabOrder = 1
      Visible = False
    end
  end
end
