object FormParentalLockPasswordLogout: TFormParentalLockPasswordLogout
  Left = 188
  Top = 204
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Parental Lock Logout'
  ClientHeight = 136
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelEnterPassword: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Enter Password'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelConfirmPassword: TLabel
    Left = 8
    Top = 56
    Width = 86
    Height = 13
    Caption = 'Confirm Password'
    ShowAccelChar = False
    Transparent = True
  end
  object Password: TMaskEdit
    Left = 8
    Top = 24
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = PasswordKeyPress
  end
  object ButtonOk: TButton
    Left = 56
    Top = 104
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
    Left = 144
    Top = 104
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
    Top = 72
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = ConfirmPasswordKeyPress
  end
end
