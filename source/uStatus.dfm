object FormStatus: TFormStatus
  Left = 207
  Top = 125
  ActiveControl = ImageLogo
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Messages Form'
  ClientHeight = 350
  ClientWidth = 500
  Color = clWhite
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImageLogo: TImage32
    Left = 0
    Top = 0
    Width = 500
    Height = 350
    Align = alClient
    AutoSize = True
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseDown = ImageLogoMouseDown
    OnMouseMove = ImageLogoMouseMove
    OnMouseUp = ImageLogoMouseUp
    object LabelFrontendVersion: TLabel
      Left = 344
      Top = 319
      Width = 115
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'v00.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelStatusType: TLabel
      Left = 42
      Top = 268
      Width = 417
      Height = 14
      AutoSize = False
      Caption = 'Loading Games'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelMessage: TLabel
      Left = 42
      Top = 284
      Width = 416
      Height = 14
      AutoSize = False
      Caption = 'Loading UnavailableCMR Games. Please, wait a moment...'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelProgress: TLabel
      Left = 42
      Top = 319
      Width = 143
      Height = 13
      Hint = '%.6d of %.6d'
      AutoSize = False
      Caption = '0 of 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
  end
end
