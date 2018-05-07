object FormImageDeleteRename: TFormImageDeleteRename
  Left = 1204
  Top = 820
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Image File'
  ClientHeight = 316
  ClientWidth = 699
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
  object Shape1: TShape
    Left = 258
    Top = 144
    Width = 76
    Height = 76
    Pen.Color = 15856113
    Shape = stSquare
  end
  object LabelFilename: TShadowLabel
    Left = 261
    Top = 108
    Width = 428
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
    Transparent = True
    WordWrap = True
  end
  object LabelSystemTitle: TShadowLabel
    Left = 261
    Top = 72
    Width = 285
    Height = 19
    Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 16448250
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
  object ShadowNewName: TShadowLabel
    Left = 261
    Top = 232
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
    Transparent = True
  end
  object ImageCategoryIcon: TImage
    Left = 262
    Top = 148
    Width = 68
    Height = 68
    Transparent = True
  end
  object LabelSoftwareListTitle: TShadowLabel
    Left = 261
    Top = 89
    Width = 428
    Height = 14
    AutoSize = False
    Caption = 'Software List Title'
    Font.Charset = ANSI_CHARSET
    Font.Color = 21414
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 16112579
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    Layout = tlCenter
    Visible = False
  end
  object LabelFileSize: TShadowLabel
    Left = 342
    Top = 161
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
    Transparent = True
  end
  object LabelDateTime: TShadowLabel
    Left = 342
    Top = 177
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
    Transparent = True
  end
  object LabelFileType: TShadowLabel
    Left = 342
    Top = 193
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
    Transparent = True
  end
  object LabelFileTypeMismatch: TShadowLabel
    Left = 385
    Top = 208
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
    Transparent = True
    Visible = False
  end
  object LabelDimensions: TShadowLabel
    Left = 342
    Top = 145
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
    Transparent = True
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 275
    Width = 699
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 504
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
    object ButtonCancel: TBitBtn
      Left = 602
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
    Width = 699
    Height = 60
    Align = alTop
    Color1 = 15792869
    Color2 = clWhite
    Color3 = clYellow
    Color4 = 13690320
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 56
      Top = 4
      Width = 636
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 618
      Top = 33
      Width = 71
      Height = 14
      Alignment = taRightJustify
      Caption = 'Game Status: '
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object GameIcon: TImage
      Left = 2
      Top = 2
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelGameDetails: TShadowLabel
      Left = 76
      Top = 33
      Width = 37
      Height = 13
      Caption = 'name: '
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object MediaTypeIcon: TImage
      Left = 56
      Top = 32
      Width = 16
      Height = 16
      Transparent = True
    end
  end
  object RenameImageEditBox: TEdit
    Left = 261
    Top = 248
    Width = 315
    Height = 21
    AutoSize = False
    TabOrder = 0
    Visible = False
    OnKeyPress = RenameImageEditBoxKeyPress
  end
  object ImagePreviewFrame: TPanelEx
    Left = 8
    Top = 69
    Width = 239
    Height = 239
    Color1 = clSilver
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSolid
    object ImagePreview: TImage32
      Left = 2
      Top = 2
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
