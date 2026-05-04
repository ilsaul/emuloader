object FormArcadeEmulatorsSetup4K: TFormArcadeEmulatorsSetup4K
  Left = 1254
  Top = 680
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Arcade Emulators Setup 4K'
  ClientHeight = 890
  ClientWidth = 1268
  Color = 15856113
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
  object PanelSystemsSelect: TPanelEx
    Left = 0
    Top = 0
    Width = 1268
    Height = 199
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SystemSelector: TEasyListview
      Left = 10
      Top = 10
      Width = 1284
      Height = 179
      BorderStyle = bsNone
      CellSizes.Icon.Height = 179
      CellSizes.Icon.Width = 156
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
      ImagesLarge = IL_Systems
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 819
    Width = 1268
    Height = 71
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Tag = 1
      Left = 908
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Ok'
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 1086
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close without updating'
      Caption = 'Cancel'
      TabOrder = 1
    end
    object ButtonSetOptions: TBitBtnEx
      Left = 10
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Set emulator'#39's default settings'
      Caption = 'Default Settings'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonUpdateSystem: TBitBtnEx
      Left = 188
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Detect emulator file checksum and version info'
      Caption = 'Reset System'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object ButtonClearSystem: TBitBtnEx
      Left = 366
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Clear select emulator'#39's info'
      Caption = 'Clear System'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object UseLargeIcons: TAdvOfficeCheckBoxEx
      Left = 641
      Top = 20
      Width = 140
      Height = 36
      Hint = 'Use 128x128 system icons'
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Large Icons'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
    end
  end
  object PanelEmulatorDetails: TPanelEx
    Left = 0
    Top = 238
    Width = 1268
    Height = 570
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelArcade_versioninfo: TShadowLabel
      Left = 14
      Top = 99
      Width = 117
      Height = 31
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelAlterMAME1: TShadowLabel
      Left = 49
      Top = 164
      Width = 290
      Height = 31
      Caption = 'AlterMAME 1 (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelAlterMAME1_versioninfo: TShadowLabel
      Left = 14
      Top = 253
      Width = 117
      Height = 31
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelArcade_exec: TShadowLabel
      Left = 49
      Top = 10
      Width = 292
      Height = 31
      Caption = 'Emulator File (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 3289650
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelAlterMAME1_Autorun: TShadowLabel
      Left = 453
      Top = 479
      Width = 524
      Height = 31
      Caption = 'Run game with AlterMAME 1 if fails with primary MAME'
      ShowAccelChar = False
      ShadowColor = clWhite
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelAlterMAME1_Tip1: TShadowLabel
      Left = 674
      Top = 164
      Width = 400
      Height = 31
      Caption = 'Play MAME games with a second emulator'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clWhite
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelAlterMAME2: TShadowLabel
      Left = 49
      Top = 320
      Width = 294
      Height = 31
      Caption = 'AlterMAME 2 (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelAlterMAME2_versioninfo: TShadowLabel
      Left = 14
      Top = 409
      Width = 117
      Height = 31
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelAlterMAME2_Tip1: TShadowLabel
      Left = 697
      Top = 320
      Width = 377
      Height = 31
      Caption = 'Play MAME games with a third emulator'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clWhite
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object IconEmulator: TImage
      Left = 10
      Top = 10
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconEmulatorAlterMAME1: TImage
      Left = 10
      Top = 164
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconEmulatorAlterMAME2: TImage
      Left = 10
      Top = 318
      Width = 32
      Height = 32
      Transparent = True
    end
    object LabelAlterMAME2_Autorun: TShadowLabel
      Left = 453
      Top = 514
      Width = 509
      Height = 31
      Caption = 'Run game with AlterMAME 2 if fails with AlterMAME 1'
      ShowAccelChar = False
      ShadowColor = clWhite
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonBrowseArcade_exec: TBitBtnEx
      Left = 1079
      Top = 50
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Arcade_versioninfo: TEditEx
      Left = 146
      Top = 96
      Width = 1112
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object AlterMAME1_exec: TEditEx
      Left = 10
      Top = 204
      Width = 1065
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonBrowseAlterMAME1: TBitBtnEx
      Left = 1079
      Top = 204
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object ButtonClearAlterMAME1: TBitBtnEx
      Left = 1169
      Top = 204
      Width = 89
      Height = 36
      Hint = 'Click here to clear AlterMAME 1'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object ButtonHelpAlterMAME: TBitBtnEx
      Left = 1090
      Top = 494
      Width = 168
      Height = 36
      Hint = 'What is this for ?'
      Caption = 'AlterMAME ?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      WordWrap = True
    end
    object AlterMAME1_Autorun: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 477
      Width = 355
      Height = 36
      Hint = 'Run selected game with AlterMAME executable if fails with MAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Autorun Game With AlterMAME 1'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object AlterMAME1_versioninfo: TEditEx
      Left = 146
      Top = 250
      Width = 1112
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object PanelMAMEEmulatorsText: TPanelEx
      Left = 607
      Top = 10
      Width = 495
      Height = 31
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object LabelMAMELink_Tabs: TShadowLabel
        Left = 74
        Top = 0
        Width = 348
        Height = 31
        Caption = #8226'                                '#8226'                     '#8226
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 14540253
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object LabelMAMELink1: TShadowLabel
        Left = 1
        Top = 0
        Width = 66
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://mamedev.org'
        Caption = 'MAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        Transparent = True
      end
      object LabelMAMELink3: TShadowLabel
        Left = 295
        Top = 0
        Width = 109
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://wolfmame.marpirc.net'
        Caption = 'WolfMAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        Transparent = True
      end
      object LabelMAMELink4: TShadowLabel
        Left = 428
        Top = 0
        Width = 39
        Height = 31
        Cursor = crHandPoint
        Hint = 
          'http://forums.bannister.org/ubbthreads.php?ubb=postlist&Board=8&' +
          'page=1'
        Caption = 'SDL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        Transparent = True
      end
      object LabelMAMELink2: TShadowLabel
        Left = 92
        Top = 0
        Width = 173
        Height = 31
        Cursor = crHandPoint
        Hint = 'http://hbmame.1emulation.com'
        Caption = 'HomeBrew MAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        Transparent = True
      end
    end
    object Arcade_exec: TEditEx
      Left = 10
      Top = 50
      Width = 1065
      Height = 36
      TabStop = False
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object AlterMAME2_exec: TEditEx
      Left = 10
      Top = 360
      Width = 1065
      Height = 36
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
      TabOrder = 10
    end
    object ButtonBrowseAlterMAME2: TBitBtnEx
      Left = 1079
      Top = 360
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object ButtonClearAlterMAME2: TBitBtnEx
      Left = 1169
      Top = 360
      Width = 89
      Height = 36
      Hint = 'Click here to clear AlterMAME 2'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object AlterMAME2_versioninfo: TEditEx
      Left = 146
      Top = 406
      Width = 1112
      Height = 36
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
    end
    object AlterMAME2_Autorun: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 512
      Width = 355
      Height = 36
      Hint = 
        'Run selected game with AlterMAME 2 executable if fails with Alte' +
        'rMAME 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 14
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Autorun Game With AlterMAME 2'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
    end
    object ButtonClearArcade_exec: TBitBtnEx
      Left = 1169
      Top = 50
      Width = 89
      Height = 36
      Hint = 'Click here to clear Emulator File and Version Info'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
  end
  object PanelSystemTitleBottom: TPanelEx
    Left = 0
    Top = 226
    Width = 1268
    Height = 12
    Color1 = 15132390
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
  end
  object PanelSystemTitle: TPanelEx
    Left = 0
    Top = 199
    Width = 1268
    Height = 27
    Color1 = clWhite
    Color2 = 15132390
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelSystemTitle: TShadowLabel
      Left = 10
      Top = 0
      Width = 1248
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'SYSTEM TITLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
    end
  end
  object IL_Systems: TImageList
    Height = 68
    Width = 68
    Left = 488
    Top = 160
  end
end
