object FormCopyMoveGameFiles: TFormCopyMoveGameFiles
  Left = 655
  Top = 323
  BorderStyle = bsDialog
  Caption = 'Copy Games Files'
  ClientHeight = 377
  ClientWidth = 614
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelProgress: TPanelEx
    Left = 0
    Top = 138
    Width = 614
    Height = 95
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelCopyToTitle: TShadowLabel
      Left = 32
      Top = 3
      Width = 140
      Height = 17
      Caption = 'Copying 000,000 files to'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelCopyTo: TShadowLabel
      Left = 174
      Top = 3
      Width = 119
      Height = 17
      Caption = 'c:\emulators\games'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object LabelCanceledByUser: TShadowLabel
      Left = 224
      Top = 69
      Width = 300
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Operation canceled by user! '
      Font.Charset = ANSI_CHARSET
      Font.Color = 191
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16448250
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Visible = False
    end
    object LabelRemainingFiles: TShadowLabel
      Left = 32
      Top = 20
      Width = 273
      Height = 17
      AutoSize = False
      Caption = 'Remaining 000,000 files (0000.00 GB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 42
      Width = 596
      Height = 16
      TabOrder = 0
    end
    object ButtonPause: TBitBtn
      Left = 8
      Top = 67
      Width = 68
      Height = 23
      Hint = 'Pause the operation'
      Caption = 'Pause'
      TabOrder = 1
      Visible = False
      OnClick = ButtonPauseClick
    end
    object ButtonCancel: TBitBtn
      Left = 536
      Top = 67
      Width = 68
      Height = 23
      Hint = 'Abort the operation'
      Caption = 'Cancel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonCancelClick
    end
  end
  object PanelGameTitle: TPanelEx
    Left = 0
    Top = 0
    Width = 614
    Height = 73
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Tag = -50
      Left = 4
      Top = 4
      Width = 32
      Height = 32
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 40
      Top = 4
      Width = 565
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSkyBlue
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameNameCloneOf: TShadowLabel
      Left = 40
      Top = 34
      Width = 333
      Height = 13
      Caption = 'name: gamename [clone of gamename] [bios: biosname] [merged]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
  end
  object Log: TRichEditURL
    Left = 8
    Top = 239
    Width = 597
    Height = 129
    Color = 15856113
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
    WantReturns = False
    WordWrap = False
  end
  object PanelFileInfo: TPanelEx
    Left = 0
    Top = 73
    Width = 614
    Height = 65
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object IconFileType: TImage
      Tag = -50
      Left = 24
      Top = 4
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameFile: TShadowLabel
      Left = 83
      Top = 23
      Width = 518
      Height = 16
      AutoSize = False
      Caption = 'd:\mame_roms\elevator.zip'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelFileSizeDate: TShadowLabel
      Left = 83
      Top = 39
      Width = 518
      Height = 14
      AutoSize = False
      Caption = 'Size: 331 Bytes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelFileType: TShadowLabel
      Left = 95
      Top = 2
      Width = 402
      Height = 21
      AutoSize = False
      Caption = 'Electrically Erasable Programmable Read-Only Memory'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
  end
  object IL_MediaType: TImageList
    Height = 48
    Width = 48
    Left = 568
    Top = 48
  end
end
