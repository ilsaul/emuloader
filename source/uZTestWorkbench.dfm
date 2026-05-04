object FormZTestWorkbench: TFormZTestWorkbench
  Left = 1230
  Top = 885
  Width = 520
  Height = 624
  Caption = 'Test Workbench'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 15
  object PanelEx1: TPanelEx
    Left = 24
    Top = 16
    Width = 457
    Height = 433
    Color1 = clLime
    Color2 = clSilver
    Color3 = clBlue
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    Visible = False
    object Image1: TImage
      Left = 16
      Top = 8
      Width = 128
      Height = 128
    end
    object Image2: TImage
      Left = 160
      Top = 8
      Width = 128
      Height = 128
    end
    object Image3: TImage
      Left = 160
      Top = 144
      Width = 128
      Height = 128
    end
    object Image4: TImage
      Left = 304
      Top = 144
      Width = 128
      Height = 128
    end
    object Image5: TImage
      Left = 304
      Top = 280
      Width = 128
      Height = 128
    end
    object ShadowLabel2: TShadowLabel
      Left = 184
      Top = 365
      Width = 68
      Height = 61
      Caption = 'black text, not edited (for comparison)'
      ShadowColor = clGray
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
      WordWrap = True
    end
    object ShadowLabel3: TShadowLabel
      Left = 48
      Top = 184
      Width = 38
      Height = 121
      Caption = 'Final result, edited from white text to black text'
      ShadowColor = clGray
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 312
      Top = 120
      Width = 102
      Height = 15
      Caption = 'Original, not edited'
    end
    object BitBtnEx1: TBitBtnEx
      Left = 16
      Top = 360
      Width = 75
      Height = 25
      Caption = 'BitBtnEx1'
      TabOrder = 0
      TabStop = False
      OnClick = BitBtnEx1Click
    end
    object BitBtnEx3: TBitBtnEx
      Left = 16
      Top = 392
      Width = 75
      Height = 25
      Caption = 'BitBtnEx3'
      TabOrder = 1
      TabStop = False
      OnClick = BitBtnEx3Click
    end
    object BitBtnEx2: TBitBtnEx
      Left = 16
      Top = 328
      Width = 75
      Height = 25
      Caption = 'BitBtnEx2'
      TabOrder = 2
      TabStop = False
      OnClick = BitBtnEx2Click
      FrameColor_Disabled = 4934475
    end
    object BitBtnEx4: TBitBtnEx
      Left = 104
      Top = 392
      Width = 75
      Height = 25
      Caption = 'try this!'
      TabOrder = 3
      TabStop = False
      FrameColor = 11908533
    end
    object BitBtnEx5: TBitBtnEx
      Left = 104
      Top = 360
      Width = 75
      Height = 25
      Caption = 'IT WORKS!'
      TabOrder = 4
      TabStop = False
      OnClick = BitBtnEx5Click
    end
  end
end
