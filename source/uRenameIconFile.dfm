object FormRenameIconFile: TFormRenameIconFile
  Left = 421
  Top = 315
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Rename File'
  ClientHeight = 47
  ClientWidth = 296
  Color = 15856113
  DefaultMonitor = dmPrimary
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 15
  object PanelEx3: TPanelEx
    Left = 0
    Top = 0
    Width = 296
    Height = 47
    Align = alClient
    Color1 = clBtnFace
    Color2 = 1117964
    Color3 = clWhite
    Color4 = clMaroon
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object Icon: TImage
      Left = 7
      Top = 8
      Width = 32
      Height = 32
      Transparent = True
    end
    object NewFilename: TEdit
      Left = 54
      Top = 11
      Width = 158
      Height = 26
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = NewFilenameKeyPress
    end
    object ButtonOk: TBitBtn
      Left = 214
      Top = 12
      Width = 32
      Height = 23
      Caption = 'Ok'
      TabOrder = 1
      OnClick = ButtonOkClick
    end
    object ButtonAbort: TBitBtn
      Left = 246
      Top = 12
      Width = 41
      Height = 23
      Caption = 'Abort'
      TabOrder = 2
      OnClick = ButtonAbortClick
    end
  end
end
