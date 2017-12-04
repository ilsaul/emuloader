object FormArcadeEmulatorsSetup: TFormArcadeEmulatorsSetup
  Left = 652
  Top = 344
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Arcade Emulators Setup'
  ClientHeight = 418
  ClientWidth = 640
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelArcade_versioninfo: TShadowLabel
    Left = 12
    Top = 183
    Width = 78
    Height = 15
    Caption = 'Version Info'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelAlterMAME: TShadowLabel
    Left = 12
    Top = 229
    Width = 180
    Height = 15
    Caption = 'AlterMAME (.exe; .bat; .cmd)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelAlterMAME_versioninfo: TShadowLabel
    Left = 12
    Top = 272
    Width = 150
    Height = 15
    Caption = 'AlterMAME Version Info'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelArcade_exec: TShadowLabel
    Left = 12
    Top = 140
    Width = 190
    Height = 15
    Caption = 'Emulator File (.exe; .bat; .cmd)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 3289650
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelAlterMAME_Autorun: TLabel
    Left = 197
    Top = 316
    Width = 288
    Height = 13
    Caption = '(Run game again with AlterMAME if fails with primary MAME)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object ShadowLabel3: TShadowLabel
    Left = 201
    Top = 229
    Width = 303
    Height = 15
    Caption = 
      '--                                                              ' +
      '        --'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object ShadowLabel4: TShadowLabel
    Left = 218
    Top = 228
    Width = 267
    Height = 16
    Caption = 'Play MAME games with a secondary MAME binary'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = True
    ShadowColor = clWhite
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
  object ButtonSetOptions: TBitBtn
    Left = 143
    Top = 347
    Width = 110
    Height = 25
    Hint = 'Set emulator'#39's default settings'
    Caption = 'Default Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonSetOptionsClick
  end
  object ButtonUpdateSystem: TBitBtn
    Left = 265
    Top = 347
    Width = 110
    Height = 25
    Hint = 'Update emulator checksum and version info'
    Caption = 'Update System'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonUpdateSystemClick
  end
  object ButtonClearSystem: TBitBtn
    Left = 387
    Top = 347
    Width = 110
    Height = 25
    Hint = 'Clear select emulator'#39's info'
    Caption = 'Clear System'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonClearSystemClick
  end
  object ButtonBrowseArcade_exec: TBitBtn
    Left = 586
    Top = 156
    Width = 47
    Height = 21
    Hint = 'Click here to select a file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonBrowseArcade_execClick
  end
  object Arcade_versioninfo: TEdit
    Left = 8
    Top = 199
    Width = 624
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnChange = Arcade_versioninfoChange
  end
  object AlterMAME_exec: TEdit
    Left = 8
    Top = 245
    Width = 512
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnChange = AlterMAME_execChange
  end
  object ButtonBrowseAlterMAME: TBitBtn
    Left = 521
    Top = 245
    Width = 47
    Height = 21
    Hint = 'Click here to select a file'
    Caption = 'Select'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = ButtonBrowseAlterMAMEClick
  end
  object ButtonClearAlterMAME: TBitBtn
    Left = 569
    Top = 245
    Width = 42
    Height = 21
    Hint = 'Click here to clear AlterMAME'
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = ButtonClearAlterMAMEClick
  end
  object ButtonHelpAlterMAME: TBitBtn
    Left = 612
    Top = 245
    Width = 21
    Height = 21
    Hint = 'What is this for ?'
    Caption = '?'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = ButtonHelpAlterMAMEClick
  end
  object PanelSystemsSelect: TPanelEx
    Left = 0
    Top = 0
    Width = 640
    Height = 125
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object LabelSystemTitle: TShadowLabel
      Left = 0
      Top = 108
      Width = 640
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'SYSTEM TITLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = False
      Layout = tlCenter
    end
    object SystemSelector: TEasyListview
      Left = 8
      Top = 8
      Width = 642
      Height = 92
      BorderStyle = bsNone
      CellSizes.Icon.Height = 92
      CellSizes.Icon.Width = 78
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -9
      EditManager.Font.Name = 'Verdana'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clBlack
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001DD000000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesLarge = FormMain.IL_Systems
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ImageIndent = 0
      PaintInfoItem.ShowBorder = False
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendColorSelRect = 10902593
      Selection.BlendIcon = False
      Selection.BorderColor = 10902593
      Selection.BorderColorSelRect = 10902593
      Selection.Color = 10902593
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.GradientColorBottom = 16506264
      Selection.GradientColorTop = 15582647
      Selection.InactiveBorderColor = 10902593
      Selection.InactiveColor = 15582647
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      OnItemSelectionChanged = SystemSelectorItemSelectionChanged
    end
  end
  object AlterMAME_Autorun: TAdvOfficeCheckBox
    Left = 8
    Top = 314
    Width = 190
    Height = 20
    Hint = 'Run selected game with AlterMAME executable if fails with MAME'
    ShowHint = True
    TabOrder = 10
    OnClick = AlterMAME_AutorunClick
    Alignment = taLeftJustify
    Caption = 'Autorun Game With AlterMAME'
    ReturnIsTab = False
    Themed = True
  end
  object PanelButtons: TPanelEx
    Left = 0
    Top = 377
    Width = 640
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Tag = 1
      Left = 226
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtn
      Left = 324
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
  object AlterMAME_versioninfo: TEdit
    Left = 8
    Top = 288
    Width = 524
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnChange = AlterMAME_versioninfoChange
  end
  object PanelMAMEEmulatorsText: TPanelEx
    Left = 205
    Top = 140
    Width = 428
    Height = 15
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object ShadowLabel2: TShadowLabel
      Left = 1
      Top = 0
      Width = 316
      Height = 15
      Caption = 
        '--            /                             /                  /' +
        '         --'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ShadowLabel1: TShadowLabel
      Left = 18
      Top = 0
      Width = 41
      Height = 15
      Cursor = crHandPoint
      Hint = 'http://mamedev.org'
      Caption = 'MAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = ShadowLabel1Click
      OnMouseEnter = ShadowLabel1MouseEnter
      OnMouseLeave = ShadowLabel1MouseLeave
    end
    object ShadowLabel5: TShadowLabel
      Left = 192
      Top = 0
      Width = 69
      Height = 15
      Cursor = crHandPoint
      Hint = 'http://wolfmame.marpirc.net'
      Caption = 'WolfMAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = ShadowLabel1Click
      OnMouseEnter = ShadowLabel1MouseEnter
      OnMouseLeave = ShadowLabel1MouseLeave
    end
    object ShadowLabel6: TShadowLabel
      Left = 271
      Top = 0
      Width = 27
      Height = 15
      Cursor = crHandPoint
      Hint = 
        'http://forums.bannister.org/ubbthreads.php?ubb=postlist&Board=8&' +
        'page=1'
      Caption = 'SDL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = ShadowLabel1Click
      OnMouseEnter = ShadowLabel1MouseEnter
      OnMouseLeave = ShadowLabel1MouseLeave
    end
    object ShadowLabel7: TShadowLabel
      Left = 69
      Top = 0
      Width = 112
      Height = 15
      Cursor = crHandPoint
      Hint = 'http://ashura.altervista.org'
      Caption = 'MAME (Ash build)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = ShadowLabel1Click
      OnMouseEnter = ShadowLabel1MouseEnter
      OnMouseLeave = ShadowLabel1MouseLeave
    end
  end
  object Arcade_exec: TEdit
    Left = 8
    Top = 156
    Width = 577
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnChange = Arcade_execChange
  end
  object ButtonSetOptionsAlterMAME: TBitBtn
    Left = 533
    Top = 288
    Width = 100
    Height = 21
    Hint = 'Set AlterMAME default settings'
    Caption = 'Default Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = ButtonSetOptionsAlterMAMEClick
  end
end
