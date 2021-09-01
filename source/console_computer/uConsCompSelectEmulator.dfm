object FormConsCompSelectEmulator: TFormConsCompSelectEmulator
  Left = 1554
  Top = 567
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 
    'Select Emulator To Be Used For Each System (Console/Computer/Han' +
    'dheld)'
  ClientHeight = 612
  ClientWidth = 684
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
  object EmulatorsList: TEasyListview
    Tag = -1
    Left = 6
    Top = 7
    Width = 678
    Height = 552
    BackGround.Enabled = True
    BackGround.OffsetX = -17
    BackGround.OffsetY = -17
    BackGround.Tile = False
    BorderStyle = bsNone
    CellSizes.Tile.Height = 46
    CellSizes.Tile.Width = 655
    CellSizes.Report.Height = 26
    CellSizes.Report.Width = 466
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -13
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsBold]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001D2010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    ImagesLarge = IL_EmulatorIcon
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ImageIndent = 6
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 42
    PaintInfoItem.CheckType = ectRadio
    PaintInfoItem.TileDetailCount = 2
    ParentColor = True
    ParentFont = False
    Scrollbars.HorzEnabled = False
    ShowGroupMargins = True
    ShowThemedBorder = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    OnGroupImageDraw = EmulatorsListGroupImageDraw
    OnGroupImageGetSize = EmulatorsListGroupImageGetSize
    OnGroupImageDrawIsCustom = EmulatorsListGroupImageDrawIsCustom
    OnItemCheckChange = EmulatorsListItemCheckChange
    OnItemPaintText = EmulatorsListItemPaintText
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 563
    Width = 684
    Height = 49
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object LabelTips: TShadowLabel
      Left = 9
      Top = 7
      Width = 337
      Height = 36
      AutoSize = False
      Caption = 
        'Enable/disable "mount images on a virtual drive" or select an em' +
        'ulator to play in games popup menu (mouse right-click).'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
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
      WordWrap = True
    end
    object ButtonOk: TBitBtnEx
      Left = 479
      Top = 14
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 585
      Top = 14
      Width = 89
      Height = 25
      Hint = 'Abort changes'
      Caption = 'Abort'
      ModalResult = 2
      TabOrder = 1
    end
    object UseSmallIcons: TAdvOfficeCheckBoxEx
      Left = 384
      Top = 17
      Width = 81
      Height = 20
      Hint = 'Use small system icons'
      ShowHint = True
      TabOrder = 2
      OnClick = UseSmallIconsClick
      Alignment = taLeftJustify
      Caption = 'Small Icons'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object IL_EmulatorIcon: TImageList
    Height = 32
    Width = 32
    Left = 56
    Top = 160
  end
end
