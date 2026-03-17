object FormImageDeleteRename4K: TFormImageDeleteRename4K
  Left = 1204
  Top = 820
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Image File (4K)'
  ClientHeight = 645
  ClientWidth = 1360
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelSystemTitle: TShadowLabel
    Left = 496
    Top = 160
    Width = 854
    Height = 30
    AutoSize = False
    Caption = 'Supermodel: A Sega Model 3 Arcade Emulator'
    Font.Charset = ANSI_CHARSET
    Font.Color = 21414
    Font.Height = -24
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
    Left = 496
    Top = 497
    Width = 368
    Height = 31
    Caption = 'New Name (file extension not required)'
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
    Left = 496
    Top = 195
    Width = 854
    Height = 31
    AutoSize = False
    Caption = 'Software List Title'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
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
    Left = 650
    Top = 352
    Width = 183
    Height = 25
    Caption = 'Size: 331 Bytes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
    Left = 650
    Top = 380
    Width = 375
    Height = 25
    Caption = 'Date/Time: mmm/dd/yyyy hh:nn:ss'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
    Left = 650
    Top = 408
    Width = 543
    Height = 25
    Caption = 'Type: Joint Photographic Experts Group (JPEG)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
    Left = 723
    Top = 437
    Width = 368
    Height = 28
    Caption = 'file type does not match file extension'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
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
    Left = 650
    Top = 324
    Width = 255
    Height = 25
    Caption = 'Dimensions: 1000x1000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
  object LabelFilename: TShadowLabel
    Left = 496
    Top = 234
    Width = 854
    Height = 57
    AutoSize = False
    Caption = 
      'z:\emulators\my_subfolder1\this_is_a_subfolder\games\mame\EmuLoa' +
      'der\snap\gamename.png'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -24
    Font.Name = 'Consolas'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    WordWrapSpaceless = True
    Transparent = True
    WordWrap = True
  end
  object FrameImageCategoryIcon: TPanelEx
    Left = 496
    Top = 323
    Width = 144
    Height = 144
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
      Left = 6
      Top = 6
      Width = 128
      Height = 128
      Transparent = True
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 574
    Width = 1360
    Height = 71
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Left = 747
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Click here to confirm operation'
      Caption = 'Delete File'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 925
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Click here to abort'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1360
    Height = 150
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
      Left = 144
      Top = 4
      Width = 1205
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 1150
      Top = 81
      Width = 195
      Height = 51
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
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
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameName: TShadowLabel
      Left = 199
      Top = 84
      Width = 945
      Height = 47
      AutoSize = False
      Caption = 'name: '#13#10'usage:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
  end
  object ImagePreviewFrame: TPanelEx
    Left = 10
    Top = 160
    Width = 476
    Height = 476
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
      Width = 472
      Height = 472
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
  object RenameImageEditBoxButtonReset: TBitBtnEx
    Left = 1261
    Top = 528
    Width = 89
    Height = 36
    Hint = 'Click here to reset name to game filename'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  object RenameImageEditBox: TTntEditEx
    Left = 496
    Top = 528
    Width = 762
    Height = 36
    AutoSize = False
    Color = clWhite
    TabOrder = 5
    Visible = False
  end
end
