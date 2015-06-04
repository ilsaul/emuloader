object FormThumbnailView: TFormThumbnailView
  Left = 568
  Top = 277
  ActiveControl = GridSize
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Thumbnail Settings'
  ClientHeight = 239
  ClientWidth = 393
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
    Caption = 'Grid Size [125 pixels]'
  end
  object ButtonGridDefault: TBitBtn
    Left = 327
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
    Width = 377
    Height = 45
    LineSize = 5
    Max = 400
    Min = 100
    PageSize = 15
    Frequency = 5
    Position = 125
    TabOrder = 0
    OnChange = GridSizeChange
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    Width = 185
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
    Left = 200
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
    Left = 99
    Top = 205
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
    Left = 293
    Top = 205
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
    Left = 195
    Top = 205
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
end
