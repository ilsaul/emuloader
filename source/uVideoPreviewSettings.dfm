object FormVideoPreviewSettings: TFormVideoPreviewSettings
  Left = 1168
  Top = 567
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Video Preview Settings: Watch Game Videos With a Media Player'
  ClientHeight = 637
  ClientWidth = 930
  Color = 15856113
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelVideoPreviewSystem: TShadowLabel
    Left = 0
    Top = 410
    Width = 930
    Height = 16
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'SUPERMODEL 3: A SEGA MODEL 3 ARCADE EMULATOR'
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
  object LabelSystemType: TShadowLabel
    Left = 32
    Top = 410
    Width = 51
    Height = 16
    Caption = 'ARCADE'
    Color = 16448250
    Constraints.MaxHeight = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
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
  object LabelSystemNotAvailable: TShadowLabel
    Left = 697
    Top = 410
    Width = 203
    Height = 16
    Caption = 'THIS SYSTEM IS NOT AVAILABLE'
    Color = 16448250
    Constraints.MaxHeight = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
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
    Visible = False
  end
  object PanelButtons: TPanelEx
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
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSimple
    object ButtonOk: TBitBtn
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
    object ButtonCancel: TBitBtn
      Left = 469
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonVideoPreviewHelp: TBitBtn
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
    Top = 426
    Width = 930
    Height = 170
    Align = alBottom
    BevelOuter = bvNone
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frTop]
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object Label2: TLabel
      Left = 13
      Top = 8
      Width = 310
      Height = 15
      Caption = 'Folder (emulator relative path supported, no network path)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVideoPreviewMediaPlayerExecutable: TLabel
      Left = 13
      Top = 69
      Width = 179
      Height = 15
      Caption = 'Media Player File (.exe; .bat; .cmd)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVideoPreviewMediaPlayerParameters: TLabel
      Left = 13
      Top = 117
      Width = 312
      Height = 15
      Caption = 'Media Player Parameters        (%1 tag required for filename)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelVideoPreviewAutoPlay: TShadowLabel
      Left = 728
      Top = 62
      Width = 146
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
      Transparent = True
    end
    object LabelVideoPreviewDummyVideoParameters: TLabel
      Left = 477
      Top = 117
      Width = 303
      Height = 15
      Caption = 'Dummy Video Media Player Parameters (%1 tag optional)'
      ShowAccelChar = False
      Transparent = True
    end
    object LabelSnapDirAutoSearch: TShadowLabel
      Left = 10
      Top = 50
      Width = 379
      Height = 12
      Caption = 
        'Snap Dir Auto-Search: emudir\videosnaps\; snap_dir\videosnaps\; ' +
        'snap_dir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = 16119285
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
    end
    object VideoPreviewFolder: TEdit
      Left = 8
      Top = 25
      Width = 403
      Height = 21
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = VideoPreviewFolderChange
    end
    object ButtonSelectVideoPreviewFolder: TBitBtn
      Left = 416
      Top = 24
      Width = 43
      Height = 23
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      TabOrder = 1
      OnClick = ButtonSelectVideoPreviewFolderClick
    end
    object VideoPreviewMediaPlayerExecutable: TEdit
      Left = 8
      Top = 86
      Width = 403
      Height = 21
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object ButtonSelectVideoPreviewMediaPlayer: TBitBtn
      Left = 416
      Top = 85
      Width = 43
      Height = 23
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 3
      OnClick = ButtonSelectVideoPreviewMediaPlayerClick
    end
    object VideoPreviewMediaPlayerParameters: TEdit
      Left = 8
      Top = 134
      Width = 403
      Height = 21
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object VideoPreviewAutoPlay: TAdvOfficeCheckBox
      Left = 658
      Top = 60
      Width = 69
      Height = 20
      Hint = 'Play video preview automatically when selecting games'
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'AutoPlay'
      ReturnIsTab = False
      Themed = True
    end
    object VideoPreviewParentGameVideo: TAdvOfficeCheckBox
      Left = 658
      Top = 34
      Width = 121
      Height = 20
      Hint = 'Play video of parent game if video of clone game is not found'
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Parent Game Video'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonHelpVideoPreviewMediaPlayerParameters: TBitBtn
      Left = 147
      Top = 117
      Width = 15
      Height = 15
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
    object VideoPreviewPlayDummyVideo: TAdvOfficeCheckBox
      Left = 658
      Top = 86
      Width = 260
      Height = 18
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Play Dummy Video to Stop Current Playback'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonHelpVideoPreviewPlayDummyVideo: TBitBtn
      Left = 640
      Top = 88
      Width = 15
      Height = 15
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
    object VideoPreviewDummyVideoParameters: TEdit
      Left = 472
      Top = 134
      Width = 403
      Height = 21
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
    end
    object ButtonSnaplDirAutoSearchHelp: TBitBtn
      Left = 391
      Top = 48
      Width = 15
      Height = 15
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
    object VideoPreviewEnabled: TAdvOfficeCheckBox
      Left = 658
      Top = 8
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
    end
    object ButtonResetVideoPreviewMediaPlayerParameters: TBitBtn
      Left = 416
      Top = 133
      Width = 43
      Height = 23
      Hint = 'Reset parameter to current'
      Caption = 'Reset'
      TabOrder = 13
      OnClick = ButtonResetVideoPreviewMediaPlayerParametersClick
    end
    object ButtonResetVideoPreviewDummyVideoParameters: TBitBtn
      Left = 880
      Top = 133
      Width = 43
      Height = 23
      Hint = 'Reset dummy parameter to current'
      Caption = 'Reset'
      TabOrder = 14
      OnClick = ButtonResetVideoPreviewDummyVideoParametersClick
    end
    object ButtonResetVideoPreviewMediaPlayer: TBitBtn
      Left = 459
      Top = 85
      Width = 43
      Height = 23
      Hint = 'Reset filename to current'
      Caption = 'Reset'
      TabOrder = 15
    end
    object ButtonResetVideoPreviewFolder: TBitBtn
      Left = 459
      Top = 24
      Width = 43
      Height = 23
      Hint = 'Reset folder to current'
      Caption = 'Reset'
      TabOrder = 16
      OnClick = ButtonResetVideoPreviewFolderClick
    end
    object ButtonVideoPreviewAutoPlayHelp: TBitBtn
      Left = 640
      Top = 62
      Width = 15
      Height = 15
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
    OnItemPaintText = SystemsVideoPreviewItemPaintText
    OnItemSelectionChanged = SystemsVideoPreviewItemSelectionChanged
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 472
    Top = 248
  end
end
