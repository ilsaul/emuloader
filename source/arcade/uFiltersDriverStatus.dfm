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
  object LabelSelectCategory: TShadowLabel
    Left = 24
    Top = 8
    Width = 92
    Height = 16
    Caption = 'Select a Category'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelFilterStatus: TShadowLabel
    Left = 24
    Top = 64
    Width = 76
    Height = 16
    Caption = 'Select a Status'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object IconListAll: TImage
    Left = 24
    Top = 83
    Width = 30
    Height = 24
    Transparent = True
  end
  object IconGoodImperfect: TImage
    Left = 24
    Top = 115
    Width = 30
    Height = 24
    Transparent = True
  end
  object IconImperfect: TImage
    Left = 24
    Top = 179
    Width = 30
    Height = 24
    Transparent = True
  end
  object IconPreliminary: TImage
    Left = 24
    Top = 211
    Width = 30
    Height = 24
    Transparent = True
  end
  object IconGood: TImage
    Left = 24
    Top = 147
    Width = 30
    Height = 24
    Transparent = True
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 249
    Width = 250
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
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
    object ButtonCancel: TBitBtnEx
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
  object ListAll: TAdvOfficeRadioButtonEx
    Left = 8
    Top = 85
    Width = 225
    Height = 20
    Hint = 'List All'
    TabOrder = 1
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = 'List All'
    CaptionIndent = 36
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object DriverStatusCategory: TComboBox2Ex
    Left = 24
    Top = 26
    Width = 201
    Height = 23
    Style = csDropDownList
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 15
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
  object GoodImperfect: TAdvOfficeRadioButtonEx
    Tag = 1
    Left = 8
    Top = 117
    Width = 225
    Height = 20
    Hint = 'Working (Good+Imperfect)'
    TabOrder = 2
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = 'Working (Good+Imperfect)'
    CaptionIndent = 36
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object Imperfect: TAdvOfficeRadioButtonEx
    Tag = 3
    Left = 8
    Top = 181
    Width = 225
    Height = 20
    Hint = 'Working (Imperfect)'
    TabOrder = 4
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = 'Working (Imperfect)'
    CaptionIndent = 36
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object Preliminary: TAdvOfficeRadioButtonEx
    Tag = 4
    Left = 8
    Top = 213
    Width = 225
    Height = 20
    Hint = 'Non-Working (Preliminary)'
    TabOrder = 5
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = 'Non-Working (Preliminary)'
    CaptionIndent = 36
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object Good: TAdvOfficeRadioButtonEx
    Tag = 2
    Left = 8
    Top = 149
    Width = 225
    Height = 20
    Hint = 'Working (Good)'
    TabOrder = 3
    OnClick = ListAllClick
    Alignment = taLeftJustify
    Caption = 'Working (Good)'
    CaptionIndent = 36
    ReturnIsTab = False
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
end
