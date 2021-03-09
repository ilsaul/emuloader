object FormRenameImageFile: TFormRenameImageFile
  Left = 673
  Top = 313
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Rename File'
  ClientHeight = 52
  ClientWidth = 303
  Color = 15856113
  DefaultMonitor = dmMainForm
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
    Width = 303
    Height = 52
    Align = alClient
    Color1 = clBtnFace
    Color2 = 1117964
    Color3 = 1117964
    Color4 = clMaroon
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object Icon: TImage
      Left = 3
      Top = 2
      Width = 48
      Height = 48
      Transparent = True
    end
    object NewFilename: TEdit
      Left = 60
      Top = 13
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
      Left = 220
      Top = 14
      Width = 32
      Height = 23
      Caption = 'Ok'
      TabOrder = 1
      OnClick = ButtonOkClick
    end
    object ButtonAbort: TBitBtn
      Left = 252
      Top = 14
      Width = 41
      Height = 23
      Caption = 'Abort'
      TabOrder = 2
      OnClick = ButtonAbortClick
    end
  end
end
