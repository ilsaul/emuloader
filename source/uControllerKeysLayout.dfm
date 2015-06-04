object FormControllerKeysLayout: TFormControllerKeysLayout
  Left = 350
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Keys Layout'
  ClientHeight = 405
  ClientWidth = 697
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ControllerImage: TImage
    Left = 0
    Top = 0
    Width = 697
    Height = 385
    Align = alClient
    OnMouseDown = ControllerImageMouseDown
  end
  object FrameBottom: TBevel
    Left = 0
    Top = 385
    Width = 697
    Height = 20
    Align = alBottom
    Shape = bsTopLine
  end
  object LabelWarning: TShadowLabel
    Left = 48
    Top = 386
    Width = 602
    Height = 19
    Alignment = taCenter
    Caption = 
      'Press LEFT key / mouse button to view previous layout or RIGHT k' +
      'ey / mouse button to view next layout'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
end
