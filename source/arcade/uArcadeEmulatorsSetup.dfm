object FormArcadeEmulatorsSetup: TFormArcadeEmulatorsSetup
  Left = 551
  Top = 317
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Arcade Emulators Setup'
  ClientHeight = 466
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelSystemsSelect: TPanelEx
    Left = 0
    Top = 0
    Width = 640
    Height = 108
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
      OnItemSelectionChanged = SystemSelectorItemSelectionChanged
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 425
    Width = 640
    Height = 41
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
      Left = 445
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 543
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
    object ButtonSetOptions: TBitBtnEx
      Left = 8
      Top = 8
      Width = 110
      Height = 25
      Hint = 'Set emulator'#39's default settings'
      Caption = 'Default Settings'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonSetOptionsClick
    end
    object ButtonUpdateSystem: TBitBtnEx
      Left = 127
      Top = 8
      Width = 110
      Height = 25
      Hint = 'Detect emulator file checksum and version info'
      Caption = 'Reset System'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonUpdateSystemClick
    end
    object ButtonClearSystem: TBitBtnEx
      Left = 246
      Top = 8
      Width = 110
      Height = 25
      Hint = 'Clear select emulator'#39's info'
      Caption = 'Clear System'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonClearSystemClick
    end
    object UseLargeIcons: TAdvOfficeCheckBoxEx
      Left = 361
      Top = 11
      Width = 79
      Height = 20
      Hint = 'Use 128x128 system icons'
      TabOrder = 5
      OnClick = UseLargeIconsClick
      Alignment = taLeftJustify
      Caption = 'Large Icons'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object PanelEmulatorDetails: TPanelEx
    Left = 0
    Top = 136
    Width = 640
    Height = 281
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
      Left = 12
      Top = 46
      Width = 68
      Height = 16
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 26
      Top = 76
      Width = 170
      Height = 16
      Caption = 'AlterMAME 1 (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 12
      Top = 119
      Width = 68
      Height = 16
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 26
      Top = 3
      Width = 168
      Height = 16
      Caption = 'Emulator File (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 227
      Top = 228
      Width = 297
      Height = 16
      Caption = 'Run game with AlterMAME 1 if fails with primary MAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Left = 310
      Top = 76
      Width = 227
      Height = 16
      Caption = 'Play MAME games with a second emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Left = 26
      Top = 149
      Width = 170
      Height = 16
      Caption = 'AlterMAME 2 (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 12
      Top = 192
      Width = 68
      Height = 16
      Caption = 'Version Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 323
      Top = 149
      Width = 214
      Height = 16
      Caption = 'Play MAME games with a third emulator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Left = 8
      Top = 2
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconEmulatorAlterMAME1: TImage
      Left = 8
      Top = 75
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconEmulatorAlterMAME2: TImage
      Left = 8
      Top = 148
      Width = 16
      Height = 16
      Transparent = True
    end
    object LabelAlterMAME2_Autorun: TShadowLabel
      Left = 227
      Top = 248
      Width = 287
      Height = 16
      Caption = 'Run game with AlterMAME 2 if fails with AlterMAME 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Left = 536
      Top = 20
      Width = 47
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonBrowseArcade_execClick
    end
    object Arcade_versioninfo: TEditEx
      Left = 96
      Top = 43
      Width = 536
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
      TabOrder = 1
      OnChange = Arcade_versioninfoChange
    end
    object AlterMAME1_exec: TEditEx
      Left = 8
      Top = 93
      Width = 526
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
      TabOrder = 2
      OnChange = AlterMAME1_execChange
    end
    object ButtonBrowseAlterMAME1: TBitBtnEx
      Left = 536
      Top = 93
      Width = 47
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonBrowseAlterMAME1Click
    end
    object ButtonClearAlterMAME1: TBitBtnEx
      Left = 585
      Top = 93
      Width = 47
      Height = 21
      Hint = 'Click here to clear AlterMAME 1'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonClearAlterMAME1Click
    end
    object ButtonHelpAlterMAME: TBitBtnEx
      Left = 547
      Top = 232
      Width = 85
      Height = 25
      Hint = 'What is this for ?'
      Caption = 'AlterMAME ?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      WordWrap = True
      OnClick = ButtonHelpAlterMAMEClick
    end
    object AlterMAME1_Autorun: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 226
      Width = 215
      Height = 18
      Hint = 'Run selected game with AlterMAME executable if fails with MAME'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 6
      OnClick = AlterMAME1_AutorunClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Autorun Game With AlterMAME 1'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AlterMAME1_versioninfo: TEditEx
      Left = 96
      Top = 116
      Width = 536
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
      TabOrder = 7
      OnChange = AlterMAME1_versioninfoChange
    end
    object PanelMAMEEmulatorsText: TPanelEx
      Left = 275
      Top = 3
      Width = 268
      Height = 15
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
        Left = 42
        Top = 0
        Width = 196
        Height = 16
        Caption = #8226'                                    '#8226'                        '#8226
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
        Width = 37
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://mamedev.org'
        Caption = 'MAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
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
        OnClick = LabelMAMELink1Click
        OnMouseEnter = LabelMAMELink1MouseEnter
        OnMouseLeave = LabelMAMELink1MouseLeave
      end
      object LabelMAMELink3: TShadowLabel
        Left = 165
        Top = 0
        Width = 62
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://wolfmame.marpirc.net'
        Caption = 'WolfMAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
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
        OnClick = LabelMAMELink1Click
        OnMouseEnter = LabelMAMELink1MouseEnter
        OnMouseLeave = LabelMAMELink1MouseLeave
      end
      object LabelMAMELink4: TShadowLabel
        Left = 242
        Top = 0
        Width = 21
        Height = 16
        Cursor = crHandPoint
        Hint = 
          'http://forums.bannister.org/ubbthreads.php?ubb=postlist&Board=8&' +
          'page=1'
        Caption = 'SDL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
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
        OnClick = LabelMAMELink1Click
        OnMouseEnter = LabelMAMELink1MouseEnter
        OnMouseLeave = LabelMAMELink1MouseLeave
      end
      object LabelMAMELink2: TShadowLabel
        Left = 52
        Top = 0
        Width = 99
        Height = 16
        Cursor = crHandPoint
        Hint = 'http://hbmame.1emulation.com'
        Caption = 'HomeBrew MAME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
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
        OnClick = LabelMAMELink1Click
        OnMouseEnter = LabelMAMELink1MouseEnter
        OnMouseLeave = LabelMAMELink1MouseLeave
      end
    end
    object Arcade_exec: TEditEx
      Left = 8
      Top = 20
      Width = 526
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
      TabOrder = 9
      OnChange = Arcade_execChange
    end
    object AlterMAME2_exec: TEditEx
      Left = 8
      Top = 166
      Width = 526
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
      TabOrder = 10
      OnChange = AlterMAME2_execChange
    end
    object ButtonBrowseAlterMAME2: TBitBtnEx
      Left = 536
      Top = 166
      Width = 47
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = ButtonBrowseAlterMAME2Click
    end
    object ButtonClearAlterMAME2: TBitBtnEx
      Left = 585
      Top = 166
      Width = 47
      Height = 21
      Hint = 'Click here to clear AlterMAME 2'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = ButtonClearAlterMAME2Click
    end
    object AlterMAME2_versioninfo: TEditEx
      Left = 96
      Top = 189
      Width = 536
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
      OnChange = AlterMAME2_versioninfoChange
    end
    object AlterMAME2_Autorun: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 246
      Width = 214
      Height = 17
      Hint = 
        'Run selected game with AlterMAME 2 executable if fails with Alte' +
        'rMAME 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 14
      OnClick = AlterMAME2_AutorunClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Autorun Game With AlterMAME 2'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonClearArcade_exec: TBitBtnEx
      Left = 585
      Top = 20
      Width = 47
      Height = 21
      Hint = 'Click here to clear Emulator File and Version Info'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = ButtonClearArcade_execClick
    end
  end
  object PanelSystemTitleBottom: TPanelEx
    Left = 0
    Top = 124
    Width = 640
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
    Top = 108
    Width = 640
    Height = 16
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
      Left = 8
      Top = 0
      Width = 624
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'SYSTEM TITLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
    Left = 592
    Top = 120
  end
end
