object FormImageDeleteRename: TFormImageDeleteRename
  Left = 557
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Image File'
  ClientHeight = 269
  ClientWidth = 579
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
    Left = 201
    Top = 116
    Width = 50
    Height = 47
    Pen.Color = 15856113
    Shape = stRoundRect
  end
  object LabelFilename: TShadowLabel
    Left = 260
    Top = 121
    Width = 301
    Height = 23
    AutoSize = False
    Caption = 'd:\EmuLoader\snap\elevator.png'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
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
  object LabelFileSize: TShadowLabel
    Left = 260
    Top = 149
    Width = 308
    Height = 12
    AutoSize = False
    Caption = '0000.00 KBytes         Jan/01/2016 00:00:00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    Layout = tlCenter
  end
  object LabelFileType: TShadowLabel
    Left = 216
    Top = 76
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
    Left = 209
    Top = 192
    Width = 159
    Height = 16
    Caption = 'New Name (no file extension)'
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
    Left = 214
    Top = 119
    Width = 24
    Height = 24
    Transparent = True
  end
  object LabelImageCategory: TShadowLabel
    Left = 204
    Top = 148
    Width = 44
    Height = 12
    Alignment = taCenter
    AutoSize = False
    Caption = 'CP Layout'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelSoftwareListTitle: TShadowLabel
    Left = 216
    Top = 93
    Width = 345
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
  object PanelEx1: TPanelEx
    Left = 0
    Top = 228
    Width = 579
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
      Left = 384
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
      Left = 482
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
    Width = 579
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
      Width = 516
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
      Left = 498
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
      Left = 56
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
  end
  object RenameImageEditBox: TEdit
    Left = 369
    Top = 190
    Width = 200
    Height = 21
    AutoSize = False
    TabOrder = 0
    Visible = False
    OnKeyPress = RenameImageEditBoxKeyPress
  end
  object ImagePreviewFrame: TPanelEx
    Left = 8
    Top = 77
    Width = 184
    Height = 184
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
      Width = 180
      Height = 180
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TKernelResampler'
      Bitmap.Resampler.KernelClassName = 'THermiteKernel'
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
