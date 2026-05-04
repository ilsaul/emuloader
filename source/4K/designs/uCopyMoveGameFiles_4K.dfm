object FormCopyMoveGameFiles4K: TFormCopyMoveGameFiles4K
  Left = 1305
  Top = 927
  BorderStyle = bsDialog
  Caption = 'Copy Games Files'
  ClientHeight = 815
  ClientWidth = 1360
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object PanelProgress: TPanelEx
    Left = 0
    Top = 259
    Width = 1360
    Height = 180
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelCopyToTitle: TShadowLabel
      Left = 64
      Top = 3
      Width = 224
      Height = 26
      Caption = 'Copying 000.000 files to'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelCopyTo: TShadowLabel
      Left = 294
      Top = 3
      Width = 1045
      Height = 26
      AutoSize = False
      Caption = 'c:\emulators\games'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelCanceledByUser: TShadowLabel
      Left = 697
      Top = 132
      Width = 472
      Height = 28
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Operation canceled by user! '
      Font.Charset = ANSI_CHARSET
      Font.Color = 191
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16448250
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Visible = False
    end
    object LabelRemainingFiles: TShadowLabel
      Left = 64
      Top = 36
      Width = 505
      Height = 26
      AutoSize = False
      Caption = 'Remaining 000.000 files (0000.00 GB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ProgressBar: TXiProgressBar
      Left = 8
      Top = 80
      Width = 1344
      Height = 32
      ColorBorder = 7039851
      BackColorFace = 14737632
      BackColorGrad = clWhite
      ForeColorFace = 15790320
      ForeColorGrad = 11382189
      SmoothCorners = False
      ColorScheme = csSilver
      Max = 100
      Min = 0
      Position = 0
      Step = 10
      Orientation = pbHorizontal
    end
    object ButtonPause: TBitBtnEx
      Left = 8
      Top = 123
      Width = 168
      Height = 45
      Hint = 'Pause the operation'
      Caption = 'Pause'
      TabOrder = 0
      Visible = False
    end
    object ButtonCancel: TBitBtnEx
      Left = 1184
      Top = 123
      Width = 168
      Height = 45
      Hint = 'Abort the operation'
      Caption = 'Cancel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 1360
    Height = 159
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 89
    object SystemIcon: TImage
      Tag = -50
      Left = 4
      Top = 4
      Width = 128
      Height = 128
      HelpContext = -2
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 144
      Top = 4
      Width = 1205
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSkyBlue
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameNameCloneOf: TShadowLabel
      Left = 144
      Top = 75
      Width = 1205
      Height = 47
      AutoSize = False
      Caption = 
        'name: gamename [clone of gamename] [bios: biosname] [merged]'#13#10'so' +
        'ftware list: softwarename [software title]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
  end
  object Log: TRichEditURL
    Left = 8
    Top = 447
    Width = 1344
    Height = 361
    Color = 15856113
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Lucida Console'
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
    Top = 159
    Width = 1360
    Height = 100
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object IconFileType: TImage
      Tag = -50
      Left = 64
      Top = 5
      Width = 68
      Height = 68
      HelpContext = -2
      Transparent = True
    end
    object LabelGameFile: TShadowLabel
      Left = 143
      Top = 30
      Width = 1195
      Height = 25
      AutoSize = False
      Caption = 'd:\mame_roms\elevator.zip'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
    object LabelFileSizeDate: TShadowLabel
      Left = 143
      Top = 55
      Width = 1195
      Height = 25
      AutoSize = False
      Caption = 'Size: 0000.00 KBytes  Date/Time: Jan/01/2016 00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
    object LabelFileType: TShadowLabel
      Left = 158
      Top = 0
      Width = 1180
      Height = 30
      AutoSize = False
      Caption = 'Electrically Erasable Programmable Read-Only Memory'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -24
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
  end
  object IL_MediaType: TImageList
    Height = 68
    Width = 68
    Left = 1152
    Top = 152
  end
end
