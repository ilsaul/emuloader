object FormMessageBox: TFormMessageBox
  Left = 657
  Top = 341
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 437
  ClientWidth = 684
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 684
    Height = 80
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object MessageIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 79
      Top = 4
      Width = 599
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameName: TShadowLabel
      Left = 106
      Top = 41
      Width = 570
      Height = 27
      AutoSize = False
      Caption = 'name: gamename [clone of gamename] [bios: biosname]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      Visible = False
    end
    object IconMediaType: TImage
      Left = 78
      Top = 44
      Width = 24
      Height = 24
      IncrementalDisplay = True
      Transparent = True
      Visible = False
    end
  end
  object LabelMessage: TRichEditURL
    Left = 8
    Top = 90
    Width = 667
    Height = 305
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
    OnResizeRequest = LabelMessageResizeRequest
    OnURLClick = LabelMessageURLClick
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 396
    Width = 684
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtn
      Left = 233
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Yes'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtn
      Left = 336
      Top = 8
      Width = 89
      Height = 25
      Caption = 'No'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonYestoAll: TBitBtn
      Left = 151
      Top = 8
      Width = 89
      Height = 25
      Hint = 
        'Click here to create the list for all systems'#13#10'(this message wil' +
        'l no longer appear)'
      Caption = 'Yes to All'
      ModalResult = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
    end
    object ButtonAbort: TBitBtn
      Left = 443
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Click here to abort it completely'
      Caption = 'Abort'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object NightMode: TAdvOfficeCheckBox
      Left = 4
      Top = 11
      Width = 87
      Height = 20
      Hint = 'Check to use a dark theme'
      ShowHint = True
      TabOrder = 4
      OnClick = NightModeClick
      Alignment = taLeftJustify
      Caption = 'Night Mode'
      ReturnIsTab = False
      Themed = True
    end
  end
end
