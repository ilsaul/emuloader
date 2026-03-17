object FormVideoPreviewSettings4K: TFormVideoPreviewSettings4K
  Left = 496
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 
    'Video Preview Settings: Watch Game Videos With a Media Player (4' +
    'K)'
  ClientHeight = 1268
  ClientWidth = 2356
  Color = 15856113
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
  object PanelBottom: TPanelEx
    Left = 0
    Top = 1197
    Width = 2356
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
    ShowHint = True
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Tag = 1
      Left = 1005
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 1183
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonVideoPreviewHelp: TBitBtnEx
      Left = 8
      Top = 16
      Width = 89
      Height = 45
      Hint = 'A little help please...'
      Caption = 'Help'
      TabOrder = 2
    end
  end
  object PanelSettings: TPanelEx
    Left = 0
    Top = 891
    Width = 2356
    Height = 306
    BevelOuter = bvNone
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object LabelVideoPreviewFolder: TShadowLabel
      Left = 18
      Top = 4
      Width = 522
      Height = 31
      Caption = 'Folder (emulator relative path support, no network path)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelVideoPreviewMediaPlayerExecutable: TShadowLabel
      Left = 18
      Top = 130
      Width = 317
      Height = 31
      Caption = 'Media Player File (.exe; .bat; .cmd)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelVideoPreviewMediaPlayerParameters: TShadowLabel
      Left = 18
      Top = 225
      Width = 569
      Height = 31
      Caption = 'Media Player Parameters          (%1 tag required for filename)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelVideoPreviewAutoPlay: TShadowLabel
      Left = 1710
      Top = 111
      Width = 254
      Height = 31
      Caption = '(use with extreme caution!)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelVideoPreviewDummyVideoParameters: TShadowLabel
      Left = 1211
      Top = 225
      Width = 534
      Height = 31
      Caption = 'Dummy Video Media Player Parameters (%1 tag optional)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSnapDirAutoSearch: TShadowLabel
      Left = 14
      Top = 81
      Width = 710
      Height = 26
      Caption = 
        'Snap Dir Auto-Search: emudir\videosnaps\; snap_dir\videosnaps\; ' +
        'snap_dir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = 16119285
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object VideoPreviewFolder: TEditEx
      Left = 10
      Top = 39
      Width = 1059
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object ButtonSelectVideoPreviewFolder: TBitBtnEx
      Left = 1074
      Top = 39
      Width = 89
      Height = 36
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      TabOrder = 1
    end
    object VideoPreviewMediaPlayerExecutable: TEditEx
      Left = 10
      Top = 165
      Width = 1059
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object ButtonSelectVideoPreviewMediaPlayer: TBitBtnEx
      Left = 1074
      Top = 164
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 3
    end
    object VideoPreviewMediaPlayerParameters: TEditEx
      Left = 10
      Top = 260
      Width = 1059
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object VideoPreviewAutoPlay: TAdvOfficeCheckBoxEx
      Left = 1592
      Top = 110
      Width = 115
      Height = 36
      Hint = 'Play video preview automatically when selecting games'
      TabOrder = 5
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'AutoPlay'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object VideoPreviewParentGameVideo: TAdvOfficeCheckBoxEx
      Left = 1592
      Top = 56
      Width = 210
      Height = 36
      Hint = 'Play video of parent game if video of clone game is not found'
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Parent Game Video'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtnEx
      Left = 263
      Top = 227
      Width = 29
      Height = 29
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object VideoPreviewPlayDummyVideo: TAdvOfficeCheckBoxEx
      Left = 1592
      Top = 164
      Width = 445
      Height = 36
      TabOrder = 8
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Play Dummy Video to Stop Current Playback'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpVideoPreviewPlayDummyVideo: TBitBtnEx
      Left = 1554
      Top = 168
      Width = 29
      Height = 29
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object VideoPreviewDummyVideoParameters: TEditEx
      Left = 1193
      Top = 260
      Width = 1059
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
    end
    object ButtonSnaplDirAutoSearchHelp: TBitBtnEx
      Left = 1034
      Top = 81
      Width = 29
      Height = 29
      Hint = 'What is Auto-Search ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object VideoPreviewEnabled: TAdvOfficeCheckBoxEx
      Left = 1592
      Top = 2
      Width = 110
      Height = 36
      Hint = 
        'Enable playback of video preview feature (uncheck to disable it ' +
        'completely)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enabled'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonResetVideoPreviewMediaPlayerParameters: TBitBtnEx
      Left = 1074
      Top = 260
      Width = 89
      Height = 36
      Hint = 'Reset parameter to current'
      Caption = 'Reset'
      TabOrder = 13
    end
    object ButtonResetVideoPreviewDummyVideoParameters: TBitBtnEx
      Left = 2257
      Top = 260
      Width = 89
      Height = 36
      Hint = 'Reset dummy parameter to current'
      Caption = 'Reset'
      TabOrder = 14
    end
    object ButtonResetVideoPreviewMediaPlayer: TBitBtnEx
      Left = 1164
      Top = 164
      Width = 89
      Height = 36
      Hint = 'Reset filename to current'
      Caption = 'Reset'
      TabOrder = 15
    end
    object ButtonResetVideoPreviewFolder: TBitBtnEx
      Left = 1164
      Top = 39
      Width = 89
      Height = 36
      Hint = 'Reset folder to current'
      Caption = 'Reset'
      TabOrder = 16
    end
    object ButtonVideoPreviewAutoPlayHelp: TBitBtnEx
      Left = 1554
      Top = 114
      Width = 29
      Height = 29
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
  end
  object SystemsVideoPreview: TEasyListview
    Tag = -1
    Left = 8
    Top = 8
    Width = 2360
    Height = 844
    BorderStyle = bsNone
    CellSizes.Icon.Height = 82
    CellSizes.Icon.Width = 62
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -9
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clWindowText
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000138090000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesLarge = IL_Systems
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
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
    Selection.RectSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 2
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object PanelSystemsTitle: TPanelEx
    Left = 0
    Top = 852
    Width = 2356
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
      Left = 813
      Top = 0
      Width = 730
      Height = 28
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
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
    end
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 0
      Width = 81
      Height = 28
      Caption = 'ARCADE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
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
    end
    object LabelSystemNotAvailable: TShadowLabel
      Left = 2015
      Top = 0
      Width = 309
      Height = 28
      Caption = 'THIS SYSTEM IS NOT AVAILABLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Visible = False
    end
  end
  object PanelSystemsTitleBottom: TPanelEx
    Left = 0
    Top = 879
    Width = 2356
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
  object IL_Systems: TImageList
    Height = 128
    Width = 128
    Left = 472
    Top = 248
  end
end
