object FormParentalLockPasswordLogout: TFormParentalLockPasswordLogout
  Left = 188
  Top = 204
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 223
  ClientWidth = 275
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 275
    Height = 60
  end
  object LabelParentalLockLogout: TLabel
    Left = 72
    Top = 24
    Width = 193
    Height = 13
    AutoSize = False
    Caption = 'Parental Lock Logout'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelEnterPassword: TLabel
    Left = 8
    Top = 72
    Width = 75
    Height = 13
    Caption = 'Enter Password'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 176
    Width = 265
    Height = 10
    Shape = bsTopLine
  end
  object LabelConfirmPassword: TLabel
    Left = 8
    Top = 120
    Width = 86
    Height = 13
    Caption = 'Confirm Password'
    ShowAccelChar = False
    Transparent = True
  end
  object Password: TMaskEdit
    Left = 8
    Top = 88
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = PasswordKeyPress
  end
  object ButtonOk: TButton
    Left = 104
    Top = 192
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
  object ButtonCancel: TButton
    Left = 192
    Top = 192
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object ConfirmPassword: TMaskEdit
    Left = 8
    Top = 136
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = ConfirmPasswordKeyPress
  end
end
