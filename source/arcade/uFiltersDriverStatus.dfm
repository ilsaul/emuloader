object FormArcadeFiltersDriverStatus: TFormArcadeFiltersDriverStatus
  Left = 733
  Top = 330
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Driver Status Filter'
  ClientHeight = 290
  ClientWidth = 250
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object LabelSelectCategory: TLabel
    Left = 24
    Top = 8
    Width = 91
    Height = 15
    Caption = 'Select a Category'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelFilterStatus: TLabel
    Left = 24
    Top = 64
    Width = 75
    Height = 15
    Caption = 'Select a Status'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object IconListAll: TImage
    Left = 24
    Top = 84
    Width = 28
    Height = 22
    Transparent = True
  end
  object IconGoodImperfect: TImage
    Left = 24
    Top = 116
    Width = 28
    Height = 22
    Transparent = True
  end
  object IconImperfect: TImage
    Left = 24
    Top = 180
    Width = 28
    Height = 22
    Transparent = True
  end
  object IconPreliminary: TImage
    Left = 24
    Top = 212
    Width = 28
    Height = 22
    Transparent = True
  end
  object IconGood: TImage
    Left = 24
    Top = 148
    Width = 28
    Height = 22
    Transparent = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 249
    Width = 250
    Height = 41
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 32
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update filters'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 130
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without changing filters'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object ListAll: TAdvOfficeRadioButton
    Left = 8
    Top = 85
    Width = 97
    Height = 20
    TabOrder = 1
    TabStop = True
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = '           List All'
    Checked = True
    ReturnIsTab = False
    Themed = True
  end
  object DriverStatusCategory: TComboBox
    Left = 24
    Top = 25
    Width = 201
    Height = 21
    Style = csDropDownList
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 0
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = 'Driver Status (All Systems)'
    Items.Strings = (
      'Driver Status (All Systems)'
      'Emulation Status (MAME Only)'
      'Color Status (MAME Only)'
      'Sound Status (MAME Only)'
      'Graphic Status (MAME Only)')
  end
  object GoodImperfect: TAdvOfficeRadioButton
    Tag = 1
    Left = 8
    Top = 117
    Width = 201
    Height = 20
    TabOrder = 2
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = '           Working (Good+Imperfect)'
    ReturnIsTab = False
    Themed = True
  end
  object Imperfect: TAdvOfficeRadioButton
    Tag = 3
    Left = 8
    Top = 181
    Width = 161
    Height = 20
    TabOrder = 4
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = '           Working (Imperfect)'
    ReturnIsTab = False
    Themed = True
  end
  object Preliminary: TAdvOfficeRadioButton
    Tag = 4
    Left = 8
    Top = 213
    Width = 209
    Height = 20
    TabOrder = 5
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = '           Non-Working (Preliminary)'
    ReturnIsTab = False
    Themed = True
  end
  object Good: TAdvOfficeRadioButton
    Tag = 2
    Left = 8
    Top = 149
    Width = 145
    Height = 20
    TabOrder = 3
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = '           Working (Good)'
    ReturnIsTab = False
    Themed = True
  end
end
