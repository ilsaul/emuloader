object FormNightModeRGBQuickEdit: TFormNightModeRGBQuickEdit
  Left = 1233
  Top = 622
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'RGB Quick Edit'
  ClientHeight = 266
  ClientWidth = 292
  Color = 2565927
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 15
  object NightModeRGBQuickEdit_RedLabel: TShadowLabel
    Left = 16
    Top = 81
    Width = 23
    Height = 16
    Caption = 'Red'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_GreenLabel: TShadowLabel
    Left = 16
    Top = 105
    Width = 34
    Height = 16
    Caption = 'Green'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_BlueLabel: TShadowLabel
    Left = 16
    Top = 129
    Width = 26
    Height = 16
    Caption = 'Blue'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_ColorSample: TShape
    Left = 90
    Top = 78
    Width = 186
    Height = 69
    Brush.Color = clBlack
    Pen.Color = clGray
  end
  object NightModeKeysHintLabel: TShadowLabel
    Left = 16
    Top = 179
    Width = 261
    Height = 16
    Caption = 'TAB : Change Focus   ENTER : Apply   ESC : Abort'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = clSilver
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeColorBoxExHint: TShadowLabel
    Left = 14
    Top = 12
    Width = 264
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = 'ColorBoxEx Hint Text'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = clCream
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_HexLabel: TShadowLabel
    Left = 16
    Top = 153
    Width = 68
    Height = 16
    Caption = 'Hex   000000'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_ColorSampleLabel: TShadowLabel
    Left = 125
    Top = 57
    Width = 127
    Height = 16
    Caption = 'New                    Current'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_ColorSample_Current: TShape
    Left = 183
    Top = 79
    Width = 93
    Height = 68
    Hint = 'Click to restore color'
    Brush.Color = clBlack
    ParentShowHint = False
    Pen.Color = clGray
    Pen.Style = psClear
    ShowHint = True
    OnMouseUp = NightModeRGBQuickEdit_ColorSample_CurrentMouseUp
  end
  object NightModeKeysHint2Label: TShadowLabel
    Left = 16
    Top = 197
    Width = 233
    Height = 16
    Caption = 'Mouse Left-Click on Current Color To Reset'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = clSilver
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_ColorSample_CurrentLabel: TShadowLabel
    Left = 188
    Top = 153
    Width = 87
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = '255, 255 255'
    Color = 5787720
    Font.Charset = ANSI_CHARSET
    Font.Color = 12574688
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 5588805
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = 4210752
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object NightModeRGBQuickEdit_Red: TEditEx
    Left = 51
    Top = 78
    Width = 30
    Height = 21
    AutoSize = False
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    Text = '000'
    OnChange = NightModeRGBQuickEdit_RedChange
    OnKeyPress = NightModeRGBQuickEdit_RedKeyPress
    UseCustomBorder = True
  end
  object NightModeRGBQuickEdit_Green: TEditEx
    Left = 51
    Top = 102
    Width = 30
    Height = 21
    AutoSize = False
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    Text = '000'
    OnChange = NightModeRGBQuickEdit_RedChange
    OnKeyPress = NightModeRGBQuickEdit_RedKeyPress
    UseCustomBorder = True
  end
  object NightModeRGBQuickEdit_Blue: TEditEx
    Left = 51
    Top = 126
    Width = 30
    Height = 21
    AutoSize = False
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    Text = '000'
    OnChange = NightModeRGBQuickEdit_RedChange
    OnKeyPress = NightModeRGBQuickEdit_RedKeyPress
    UseCustomBorder = True
  end
  object NightModeRGBQuickEdit_ButtonApply: TBitBtnEx
    Left = 90
    Top = 226
    Width = 86
    Height = 25
    Hint = 'Set current color to colorbox'
    Caption = 'Apply'
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object NightModeRGBQuickEdit_ButtonAbort: TBitBtnEx
    Left = 191
    Top = 226
    Width = 86
    Height = 25
    Caption = 'Abort'
    ModalResult = 2
    TabOrder = 4
  end
end
