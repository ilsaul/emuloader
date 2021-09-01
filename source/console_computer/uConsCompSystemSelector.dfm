object FormConsCompSystemSelector: TFormConsCompSystemSelector
  Left = 612
  Top = 355
  Hint = 'cancel'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select One or More Systems'
  ClientHeight = 533
  ClientWidth = 744
  Color = clBlue
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
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 782
    Height = 493
    BorderStyle = bsNone
    CellSizes.Icon.Height = 82
    CellSizes.Icon.Width = 62
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -9
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000181010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.OnlyFocused = True
    HotTrack.Underline = False
    ImagesLarge = IL_Systems
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    ParentFont = False
    ShowThemedBorder = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnItemDblClick = SystemsItemDblClick
    OnItemImageDraw = SystemsItemImageDraw
    OnItemImageGetSize = SystemsItemImageGetSize
    OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
    OnItemPaintText = SystemsItemPaintText
    OnKeyAction = SystemsKeyAction
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 493
    Width = 744
    Height = 40
    Align = alBottom
    Color1 = clWhite
    Color2 = 14540253
    Color3 = 14540253
    Color4 = 14671839
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelCreateNewList: TShadowLabel
      Left = 200
      Top = 22
      Width = 192
      Height = 14
      Caption = 'uncheck to add games to an existing list'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
    object CreateNewList: TAdvOfficeCheckBoxEx
      Left = 182
      Top = 2
      Width = 149
      Height = 19
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CreateNewListClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Create a New List'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonHelp: TBitBtnEx
      Left = 486
      Top = 8
      Width = 43
      Height = 25
      Hint = 'How to select filters'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonHelpClick
    end
    object ButtonApply: TBitBtnEx
      Left = 544
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object ButtonCancel: TBitBtnEx
      Left = 648
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
  end
  object IL_Systems: TImageList
    Height = 48
    Width = 48
    Left = 232
    Top = 440
  end
end
