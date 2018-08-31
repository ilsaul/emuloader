object FormConsCompSystemRules: TFormConsCompSystemRules
  Left = 381
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'System Rules'
  ClientHeight = 617
  ClientWidth = 984
  Color = clBtnFace
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
  PixelsPerInch = 96
  TextHeight = 15
  object PanelEx1: TPanelEx
    Left = 0
    Top = 0
    Width = 984
    Height = 53
    Align = alTop
    Color1 = 15856113
    Color2 = clWhite
    Color3 = clWhite
    Color4 = clBtnFace
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTitle: TShadowLabel
      Left = 56
      Top = 16
      Width = 60
      Height = 16
      Caption = 'Label Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMoneyGreen
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
    end
    object SystemIcon: TImage
      Left = 1
      Top = 1
      Width = 48
      Height = 48
      Constraints.MaxHeight = 48
      Constraints.MaxWidth = 48
      Transparent = True
    end
  end
  object RulesFile: TRichEditURL
    Left = 0
    Top = 53
    Width = 984
    Height = 564
    Align = alClient
    BorderStyle = bsNone
    Color = clWhite
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    OnURLClick = RulesFileURLClick
  end
end
