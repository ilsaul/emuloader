object FormApplyFilterMsgBox: TFormApplyFilterMsgBox
  Left = 849
  Top = 422
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 66
  ClientWidth = 473
  Color = 15856113
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
  object PanelBackground: TPanelEx
    Left = 0
    Top = 0
    Width = 473
    Height = 66
    Align = alClient
    Color1 = 5832704
    Color2 = 1
    Color3 = 7891291
    Color4 = 16112579
    ColorFrame = 16750899
    ColorInnerFrame = clBlue
    EnableInnerFrame = True
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object LabelBoxMessageTitle: TShadowLabel
      Left = 38
      Top = 11
      Width = 427
      Height = 17
      AutoSize = False
      Caption = 'Games Filters'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object LabelBoxMessage: TShadowLabel
      Left = 8
      Top = 36
      Width = 456
      Height = 17
      AutoSize = False
      Caption = 'Applying filters, please wait...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object MsgIcon: TImage
      Left = 8
      Top = 8
      Width = 24
      Height = 24
      Transparent = True
    end
  end
end
