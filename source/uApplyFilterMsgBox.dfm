object FormApplyFilterMsgBox: TFormApplyFilterMsgBox
  Left = 849
  Top = 422
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 60
  ClientWidth = 473
  Color = clMoneyGreen
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 15
  object LabelMsgGroupedView: TShadowLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 14
    Alignment = taCenter
    Caption = 'Grouped View Mode:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
  object LabelBoxMessageTitle: TShadowLabel
    Left = 128
    Top = 8
    Width = 334
    Height = 17
    AutoSize = False
    Caption = 'Games Filters'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
  object LabelBoxMessage: TShadowLabel
    Left = 8
    Top = 33
    Width = 456
    Height = 17
    AutoSize = False
    Caption = 'Applying filters, please wait...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 16112579
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
end
