object FormThumbnailView: TFormThumbnailView
  Left = 568
  Top = 277
  ActiveControl = GridSize
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Thumbnail Settings'
  ClientHeight = 262
  ClientWidth = 473
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelGridSize: TLabel
    Left = 16
    Top = 16
    Width = 106
    Height = 15
    Hint = 'Grid Size [%u pixels]'
    Caption = 'Grid Size [152 pixels]'
  end
  object LabelSystemIconSize: TLabel
    Left = 339
    Top = 141
    Width = 87
    Height = 15
    Caption = 'System Icon Size'
  end
  object ButtonGridDefault: TBitBtn
    Left = 407
    Top = 8
    Width = 49
    Height = 23
    Hint = 'Set grid to default size'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonGridDefaultClick
  end
  object GridSize: TExTrackBar
    Left = 8
    Top = 32
    Width = 457
    Height = 45
    LineSize = 5
    Max = 400
    Min = 152
    PageSize = 15
    Frequency = 5
    Position = 152
    TabOrder = 0
    OnChange = GridSizeChange
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    LabelsFactor = 1
    LabelsFactorOperation = foMul
    LabelsInterval = 25
    SelEnable = False
  end
  object BorderColor: TColorBox
    Left = 8
    Top = 112
    Width = 201
    Height = 22
    Hint = 'Select a border color'
    DefaultColorColor = 10902593
    Selected = 10902593
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnSelect = BorderColorSelect
  end
  object ShowBorder: TAdvOfficeCheckBox
    Left = 8
    Top = 90
    Width = 161
    Height = 20
    Hint = 'Show border arround the entire frame'
    ShowHint = True
    TabOrder = 3
    OnClick = ShowBorderClick
    Alignment = taLeftJustify
    Caption = 'Show Border'
    ReturnIsTab = False
    Themed = True
  end
  object BorderColorDefault: TBitBtn
    Left = 216
    Top = 112
    Width = 49
    Height = 22
    Hint = 'Set default border color'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BorderColorDefaultClick
  end
  object ShowGameTitles: TAdvOfficeCheckBox
    Left = 8
    Top = 141
    Width = 121
    Height = 20
    Hint = 'Show/hide captions of games'
    Checked = True
    ShowHint = True
    TabOrder = 5
    OnClick = ShowGameTitlesClick
    Alignment = taLeftJustify
    Caption = 'Show Game Title'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ButtonApply: TBitBtn
    Left = 179
    Top = 228
    Width = 89
    Height = 25
    Hint = 'Apply current settings to thumbnails'
    Caption = 'Update'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = ButtonApplyClick
  end
  object ButtonClose: TBitBtn
    Left = 373
    Top = 228
    Width = 89
    Height = 25
    Hint = 'Close without updating grid size and aspect ratio settings'
    Caption = 'Exit'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object ButtonConfirm: TBitBtn
    Tag = 1
    Left = 275
    Top = 228
    Width = 89
    Height = 25
    Hint = 'Apply current settings to thumbnails and exit'
    Caption = 'Confirm'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ButtonApplyClick
  end
  object KeepAspectRatio: TAdvOfficeCheckBox
    Left = 8
    Top = 164
    Width = 121
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 9
    Alignment = taLeftJustify
    Caption = 'Keep Aspect Ratio'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowSystemIcon: TAdvOfficeCheckBox
    Left = 210
    Top = 141
    Width = 121
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 10
    Alignment = taLeftJustify
    Caption = 'Show System Icon'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowFavoriteIcon: TAdvOfficeCheckBox
    Left = 210
    Top = 164
    Width = 121
    Height = 20
    ShowHint = True
    TabOrder = 11
    Alignment = taLeftJustify
    Caption = 'Show Favorite Icon'
    ReturnIsTab = False
    Themed = True
  end
  object AlphaBlendedIcons: TAdvOfficeCheckBox
    Left = 10
    Top = 219
    Width = 133
    Height = 20
    Hint = 'Don'#39't show the white background'
    Checked = True
    ShowHint = True
    TabOrder = 12
    Visible = False
    Alignment = taLeftJustify
    Caption = 'Alpha Blended Icons'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object SystemIconSize: TComboBox
    Left = 339
    Top = 157
    Width = 127
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    ItemIndex = 1
    TabOrder = 13
    Text = 'Large (32x32)'
    Items.Strings = (
      'Medium (24x24)'
      'Large (32x32)'
      'Extra Large (48x48)')
  end
  object ShowGameIcon: TAdvOfficeCheckBox
    Left = 210
    Top = 187
    Width = 114
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 14
    Alignment = taLeftJustify
    Caption = 'Show Game Icon'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ShowPreviewScreenshotsPanel: TAdvOfficeCheckBox
    Left = 10
    Top = 187
    Width = 167
    Height = 20
    Hint = 'Enable '
    Checked = True
    ShowHint = True
    TabOrder = 15
    Alignment = taLeftJustify
    Caption = 'Show Preview Images Panel'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
end
