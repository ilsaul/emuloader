object FormDATViewer: TFormDATViewer
  Left = 159
  Top = 180
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'FormDATViewer'
  ClientHeight = 416
  ClientWidth = 618
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelGameDescription: TLabel
    Left = 32
    Top = 22
    Width = 497
    Height = 13
    AutoSize = False
    Caption = 'Description of the selected game'
    ShowAccelChar = False
    Transparent = True
  end
  object GameIcon: TImage
    Left = 8
    Top = 20
    Width = 16
    Height = 16
    Transparent = True
  end
  object ButtonClose: TButton
    Left = 536
    Top = 8
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
  object DATTextHolder: TRichEdit
    Left = 8
    Top = 40
    Width = 601
    Height = 369
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 1
    WantReturns = False
  end
end
