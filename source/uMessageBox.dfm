object FormMessageBox: TFormMessageBox
  Left = 657
  Top = 341
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 437
  ClientWidth = 619
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
    Width = 619
    Height = 60
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object MessageIcon: TImage
      Left = 1
      Top = 1
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelTitle: TShadowLabel
      Left = 56
      Top = 10
      Width = 555
      Height = 27
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
      ShadowColor = clMaroon
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameNameCloneOf: TShadowLabel
      Left = 76
      Top = 34
      Width = 285
      Height = 13
      Caption = 'name: gamename [clone of gamename] [bios: biosname]'
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
      Visible = False
    end
    object IconMediaType: TImage
      Left = 56
      Top = 33
      Width = 16
      Height = 16
      IncrementalDisplay = True
      Transparent = True
      Visible = False
    end
  end
  object LabelMessage: TRichEditURL
    Left = 8
    Top = 70
    Width = 602
    Height = 325
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
  object PanelMessages: TPanelEx
    Left = 0
    Top = 396
    Width = 619
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtn
      Left = 214
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
      Left = 317
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
      Left = 124
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
      Left = 424
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
  end
end
