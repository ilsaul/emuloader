object FormLanguage: TFormLanguage
  Left = 251
  Top = 209
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 390
  ClientWidth = 400
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BottomLine: TBevel
    Left = 5
    Top = 344
    Width = 390
    Height = 10
    Shape = bsTopLine
  end
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 400
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 321
    Height = 13
    AutoSize = False
    Caption = 'Frontend Language'
    ShowAccelChar = False
    Transparent = True
  end
  object ButtonCancel: TButton
    Left = 320
    Top = 360
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object ButtonOk: TButton
    Left = 232
    Top = 360
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonOkClick
  end
  object PageControlLanguage: TPageControl
    Left = 8
    Top = 72
    Width = 385
    Height = 257
    ActivePage = TabSheetLanguage
    TabIndex = 0
    TabOrder = 2
    object TabSheetLanguage: TTabSheet
      Caption = 'Select Language'
      object SelectLanguage: TComboBox
        Left = 56
        Top = 16
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnChange = SelectLanguageChange
      end
      object LanguageInfoBox: TGroupBox
        Left = 8
        Top = 48
        Width = 361
        Height = 169
        Caption = 'Language Info'
        TabOrder = 1
        object LabelAuthor: TLabel
          Left = 16
          Top = 24
          Width = 33
          Height = 13
          Caption = 'Author'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelEMail: TLabel
          Left = 16
          Top = 72
          Width = 28
          Height = 13
          Caption = 'E-Mail'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelVersion: TLabel
          Left = 16
          Top = 120
          Width = 82
          Height = 13
          Caption = 'Frontend Version'
          ShowAccelChar = False
          Transparent = True
        end
        object Author: TEdit
          Left = 16
          Top = 40
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object EMail: TEdit
          Left = 16
          Top = 88
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object FrontendVersionString: TEdit
          Left = 16
          Top = 136
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
      object LanguageIcon: TImage32Ex
        Left = 8
        Top = 8
        Width = 36
        Height = 36
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 2
        Transparent = True
      end
    end
  end
end
