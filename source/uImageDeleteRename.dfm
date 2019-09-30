object FormImageDeleteRename: TFormImageDeleteRename
  Left = 1204
  Top = 820
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Image File'
  ClientHeight = 336
  ClientWidth = 784
  Color = clWhite
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelFilename: TShadowLabel
    Left = 261
    Top = 127
    Width = 513
    Height = 31
    AutoSize = False
    Caption = 'd:\EmuLoader\snap\elevator.png'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etPathEllips
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    WordWrap = True
  end
  object LabelSystemTitle: TShadowLabel
    Left = 261
    Top = 91
    Width = 513
    Height = 19
    AutoSize = False
    Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
    Font.Charset = ANSI_CHARSET
    Font.Color = 21414
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 16448250
    ShadowEnabled = True
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelRenameImage: TShadowLabel
    Left = 261
    Top = 251
    Width = 210
    Height = 16
    Caption = 'New Name (file extension not required)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelSoftwareListTitle: TShadowLabel
    Left = 261
    Top = 108
    Width = 513
    Height = 14
    AutoSize = False
    Caption = 'Software List Title'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 16112579
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object LabelFileSize: TShadowLabel
    Left = 348
    Top = 180
    Width = 348
    Height = 15
    AutoSize = False
    Caption = 'Size: 331 Bytes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelDateTime: TShadowLabel
    Left = 348
    Top = 196
    Width = 348
    Height = 15
    AutoSize = False
    Caption = 'Date/Time: mmm/dd/yyyy hh:nn:ss'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelFileType: TShadowLabel
    Left = 348
    Top = 212
    Width = 348
    Height = 15
    AutoSize = False
    Caption = 'Type: Joint Photographic Experts Group (JPEG)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelFileTypeMismatch: TShadowLabel
    Left = 391
    Top = 227
    Width = 199
    Height = 16
    Caption = 'file type does not match file extension'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Visible = False
  end
  object LabelDimensions: TShadowLabel
    Left = 348
    Top = 164
    Width = 150
    Height = 15
    Caption = 'Dimensions: 1000x1000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object FrameImageCategoryIcon: TPanelEx
    Left = 258
    Top = 163
    Width = 82
    Height = 82
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 15856113
    EnableInnerFrame = True
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ImageCategoryIcon: TImage
      Left = 5
      Top = 5
      Width = 68
      Height = 68
      Transparent = True
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 295
    Width = 784
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Left = 589
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Click here to confirm operation'
      Caption = 'Delete File'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 687
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Click here to abort'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonOkClick
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 784
    Height = 80
    Align = alTop
    Color1 = 15792869
    Color2 = clWhite
    Color3 = clYellow
    Color4 = 13690320
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 78
      Top = 4
      Width = 700
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 667
      Top = 45
      Width = 107
      Height = 29
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object GameIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameName: TShadowLabel
      Left = 106
      Top = 46
      Width = 543
      Height = 27
      AutoSize = False
      Caption = 'name: '#13#10'usage:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
    object MediaTypeIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
  end
  object RenameImageEditBox: TEditEx
    Left = 261
    Top = 267
    Width = 510
    Height = 21
    AutoSize = False
    Color = clWhite
    TabOrder = 0
    Visible = False
    OnKeyPress = RenameImageEditBoxKeyPress
  end
  object ImagePreviewFrame: TPanelEx
    Left = 8
    Top = 88
    Width = 239
    Height = 239
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ImagePreview: TImage32
      Left = 0
      Top = 0
      Width = 235
      Height = 235
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TKernelResampler'
      Bitmap.Resampler.KernelClassName = 'TCosineKernel'
      Bitmap.Resampler.KernelMode = kmDynamic
      Bitmap.Resampler.TableSize = 32
      BitmapAlign = baCenter
      Color = clBlack
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smResize
      TabOrder = 0
    end
  end
end
