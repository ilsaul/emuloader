object FormVideoPreviewSettings: TFormVideoPreviewSettings
  Left = 1168
  Top = 567
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Video Preview Settings: Watch Game Videos With a Media Player'
  ClientHeight = 637
  ClientWidth = 930
  Color = clWhite
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelBottom: TPanelEx
    Left = 0
    Top = 596
    Width = 930
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
    ShowHint = True
    Style = vgSimple
    object ButtonOk: TBitBtnEx
      Tag = 1
      Left = 371
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 469
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonVideoPreviewHelp: TBitBtnEx
      Left = 8
      Top = 8
      Width = 43
      Height = 25
      Hint = 'A little help please...'
      Caption = 'Help'
      TabOrder = 2
      OnClick = ButtonVideoPreviewHelpClick
    end
  end
  object PanelSettings: TPanelEx
    Left = 0
    Top = 438
    Width = 930
    Height = 158
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
      Left = 13
      Top = 2
      Width = 298
      Height = 16
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
      Left = 13
      Top = 63
      Width = 181
      Height = 16
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
      Left = 13
      Top = 111
      Width = 316
      Height = 16
      Caption = 'Media Player Parameters         (%1 tag required for filename)'
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
      Left = 728
      Top = 56
      Width = 145
      Height = 16
      Caption = '(use with extreme caution!)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
      Left = 478
      Top = 111
      Width = 304
      Height = 16
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
      Left = 10
      Top = 42
      Width = 363
      Height = 14
      Caption = 
        'Snap Dir Auto-Search: emudir\videosnaps\; snap_dir\videosnaps\; ' +
        'snap_dir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
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
      Left = 8
      Top = 19
      Width = 403
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = VideoPreviewFolderChange
    end
    object ButtonSelectVideoPreviewFolder: TBitBtnEx
      Left = 414
      Top = 19
      Width = 43
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      TabOrder = 1
      OnClick = ButtonSelectVideoPreviewFolderClick
    end
    object VideoPreviewMediaPlayerExecutable: TEditEx
      Left = 8
      Top = 80
      Width = 403
      Height = 21
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
      Left = 414
      Top = 80
      Width = 43
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 3
      OnClick = ButtonSelectVideoPreviewMediaPlayerClick
    end
    object VideoPreviewMediaPlayerParameters: TEditEx
      Left = 8
      Top = 128
      Width = 403
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object VideoPreviewAutoPlay: TAdvOfficeCheckBoxEx
      Left = 658
      Top = 54
      Width = 69
      Height = 20
      Hint = 'Play video preview automatically when selecting games'
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'AutoPlay'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object VideoPreviewParentGameVideo: TAdvOfficeCheckBoxEx
      Left = 658
      Top = 28
      Width = 121
      Height = 20
      Hint = 'Play video of parent game if video of clone game is not found'
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Parent Game Video'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtnEx
      Left = 147
      Top = 108
      Width = 19
      Height = 19
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = ButtonHelpVideoPreviewMediaPlayerParametersClick
    end
    object VideoPreviewPlayDummyVideo: TAdvOfficeCheckBoxEx
      Left = 658
      Top = 80
      Width = 260
      Height = 18
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Play Dummy Video to Stop Current Playback'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelpVideoPreviewPlayDummyVideo: TBitBtnEx
      Left = 636
      Top = 80
      Width = 19
      Height = 19
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = ButtonHelpVideoPreviewPlayDummyVideoClick
    end
    object VideoPreviewDummyVideoParameters: TEditEx
      Left = 473
      Top = 128
      Width = 403
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
    end
    object ButtonSnaplDirAutoSearchHelp: TBitBtnEx
      Left = 392
      Top = 41
      Width = 19
      Height = 19
      Hint = 'What is Auto-Search ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = ButtonSnaplDirAutoSearchHelpClick
    end
    object VideoPreviewEnabled: TAdvOfficeCheckBoxEx
      Left = 658
      Top = 2
      Width = 70
      Height = 20
      Hint = 
        'Enable playback of video preview feature (uncheck to disable it ' +
        'completely)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Enabled'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonResetVideoPreviewMediaPlayerParameters: TBitBtnEx
      Left = 414
      Top = 128
      Width = 43
      Height = 21
      Hint = 'Reset parameter to current'
      Caption = 'Reset'
      TabOrder = 13
      OnClick = ButtonResetVideoPreviewMediaPlayerParametersClick
    end
    object ButtonResetVideoPreviewDummyVideoParameters: TBitBtnEx
      Left = 879
      Top = 128
      Width = 43
      Height = 21
      Hint = 'Reset dummy parameter to current'
      Caption = 'Reset'
      TabOrder = 14
      OnClick = ButtonResetVideoPreviewDummyVideoParametersClick
    end
    object ButtonResetVideoPreviewMediaPlayer: TBitBtnEx
      Left = 459
      Top = 80
      Width = 43
      Height = 21
      Hint = 'Reset filename to current'
      Caption = 'Reset'
      TabOrder = 15
    end
    object ButtonResetVideoPreviewFolder: TBitBtnEx
      Left = 459
      Top = 19
      Width = 43
      Height = 21
      Hint = 'Reset folder to current'
      Caption = 'Reset'
      TabOrder = 16
      OnClick = ButtonResetVideoPreviewFolderClick
    end
    object ButtonVideoPreviewAutoPlayHelp: TBitBtnEx
      Left = 636
      Top = 54
      Width = 19
      Height = 19
      Hint = 'Why ???'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      OnClick = ButtonVideoPreviewAutoPlayHelpClick
    end
  end
  object SystemsVideoPreview: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 955
    Height = 410
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
      00060000008008000101000100000000000001BB030000FFFFFF1F0001000000
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
    OnItemImageDraw = SystemsVideoPreviewItemImageDraw
    OnItemImageGetSize = SystemsVideoPreviewItemImageGetSize
    OnItemImageDrawIsCustom = SystemsVideoPreviewItemImageDrawIsCustom
    OnItemPaintText = SystemsVideoPreviewItemPaintText
    OnItemSelectionChanged = SystemsVideoPreviewItemSelectionChanged
  end
  object PanelSystemsTitle: TPanelEx
    Left = 0
    Top = 410
    Width = 930
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
      Left = 240
      Top = 0
      Width = 450
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
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
    end
    object LabelSystemType: TShadowLabel
      Left = 32
      Top = 0
      Width = 46
      Height = 19
      Caption = 'ARCADE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
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
    end
    object LabelSystemNotAvailable: TShadowLabel
      Left = 719
      Top = 0
      Width = 177
      Height = 19
      Caption = 'THIS SYSTEM IS NOT AVAILABLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Visible = False
    end
  end
  object PanelSystemsTitleBottom: TPanelEx
    Left = 0
    Top = 426
    Width = 930
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
    Height = 48
    Width = 48
    Left = 472
    Top = 248
  end
end
