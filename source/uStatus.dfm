object FormStatus: TFormStatus
  Left = 568
  Top = 328
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Messages Form'
  ClientHeight = 600
  ClientWidth = 980
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
    Width = 980
    Height = 600
    Align = alClient
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object LabelTimer: TShadowLabel
      Left = 4
      Top = 566
      Width = 64
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = OEM_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clBlue
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelStatusType: TShadowLabel
      Left = 76
      Top = 563
      Width = 685
      Height = 17
      AutoSize = False
      Caption = 
        'Force Incomplete Games Available [.zip; .7z]: Supermodel: A Sega' +
        ' Model 3 Arcade Emulator'
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
    object LabelVersion: TShadowLabel
      Left = 14
      Top = 228
      Width = 50
      Height = 15
      Alignment = taRightJustify
      Caption = 'v12.0.0'
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSoftwareScanCount: TShadowLabel
      Left = 4
      Top = 584
      Width = 96
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = '[000 of 000]'
      Font.Charset = OEM_CHARSET
      Font.Color = clAqua
      Font.Height = -12
      Font.Name = 'Terminal'
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
      Visible = False
    end
    object LabelMessage: TShadowLabel
      Left = 106
      Top = 582
      Width = 655
      Height = 15
      AutoSize = False
      Caption = 
        'Parsing "hbmame_listxml.xml" (3rd pass). Adding parent sections ' +
        'and listing parents with BIOS.'
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
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ProgressBar: TProgressBar
      Left = 4
      Top = 550
      Width = 64
      Height = 12
      TabOrder = 0
      Visible = False
    end
  end
end
