object FormStatus: TFormStatus
  Left = 568
  Top = 328
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Messages Form'
  ClientHeight = 450
  ClientWidth = 768
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object ImageBk: TImage32
    Left = 0
    Top = 0
    Width = 768
    Height = 450
    Align = alClient
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object LabelMessage: TShadowLabel
      Left = 34
      Top = 402
      Width = 591
      Height = 29
      AutoSize = False
      Caption = 
        'Loading initial settings and other stuff that I need to write he' +
        're so the text fills up both lines of text with non-sense texts ' +
        'to make sure this thing can be read without eye strain.... the e' +
        'nd.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clNavy
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      WordWrap = True
    end
    object LabelTimer: TShadowLabel
      Left = 567
      Top = 433
      Width = 56
      Height = 16
      Alignment = taCenter
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlue
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
    end
    object LabelStatusType: TShadowLabel
      Left = 50
      Top = 378
      Width = 655
      Height = 24
      AutoSize = False
      Caption = 
        'Force Incomplete Games Available [.zip; .7z]: HBMAME: HomeBrew M' +
        'ultiple Arcade Machine Emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clNavy
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
    end
    object LabelVersion: TShadowLabel
      Left = 189
      Top = 46
      Width = 44
      Height = 14
      Alignment = taRightJustify
      Caption = 'v12.0.0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clNavy
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object ProgressBar: TProgressBar
      Left = 3
      Top = 435
      Width = 560
      Height = 12
      TabOrder = 0
    end
  end
end
