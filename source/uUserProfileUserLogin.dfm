object FormUserProfileUserLogin: TFormUserProfileUserLogin
  Left = 327
  Top = 267
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'User Profile Login'
  ClientHeight = 184
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
    Top = 56
    Width = 75
    Height = 13
    Caption = 'Enter Password'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelSelectUserProfile: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Select User Profile'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelConfirmPassword: TLabel
    Left = 8
    Top = 104
    Width = 86
    Height = 13
    Caption = 'Confirm Password'
    ShowAccelChar = False
    Transparent = True
  end
  object Password: TMaskEdit
    Left = 8
    Top = 72
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = PasswordKeyPress
  end
  object UserProfile: TComboBox
    Left = 8
    Top = 24
    Width = 257
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnChange = UserProfileChange
    OnKeyPress = UserProfileKeyPress
  end
  object ButtonOk: TButton
    Left = 56
    Top = 152
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 144
    Top = 152
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object ConfirmPassword: TMaskEdit
    Left = 8
    Top = 120
    Width = 257
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
    OnKeyPress = ConfirmPasswordKeyPress
  end
end
