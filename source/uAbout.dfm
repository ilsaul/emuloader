object FormAbout: TFormAbout
  Left = 167
  Top = 148
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 273
  ClientWidth = 315
  Color = clBlack
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImageLogo: TImage
    Left = 8
    Top = 8
    Width = 300
    Height = 150
    AutoSize = True
  end
  object LabelFrontendVersion: TLabel
    Left = 264
    Top = 160
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'v00.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 52
    Top = 192
    Width = 212
    Height = 13
    Caption = 'Developed by Ciro Alfredo Consentino'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 36
    Top = 208
    Width = 243
    Height = 13
    Caption = 'DOS MAME and MAME32 are not supported!'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object ButtonClose: TButton
    Left = 229
    Top = 238
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonCloseClick
  end
end
