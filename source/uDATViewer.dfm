object FormDATViewer: TFormDATViewer
  Left = 159
  Top = 180
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'FormDATViewer'
  ClientHeight = 423
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 618
    Height = 60
    AutoSize = True
  end
  object LabelGameDescription: TLabel
    Left = 72
    Top = 24
    Width = 537
    Height = 13
    AutoSize = False
    Caption = 'Description of the selected game'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 384
    Width = 608
    Height = 10
    Shape = bsTopLine
  end
  object WordWrap: TCheckBox
    Left = 8
    Top = 395
    Width = 129
    Height = 17
    Hint = 'Breaks the text to fit on screen'
    Caption = 'Word Wrap'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = WordWrapClick
  end
  object DATTextHolder: TRichEdit
    Left = 8
    Top = 72
    Width = 601
    Height = 297
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 1
    WantReturns = False
    WordWrap = False
  end
  object ButtonClose: TButton
    Left = 536
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonCloseClick
  end
  object ButtonDATFilesFont: TButton
    Left = 316
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Select font for the text'
    Caption = 'Font'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonDATFilesFontClick
  end
  object ButtonTextFilesDefaultFont: TButton
    Left = 228
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Select default font for the text'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonTextFilesDefaultFontClick
  end
end
