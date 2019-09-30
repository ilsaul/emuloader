object FormToolBarEditor: TFormToolBarEditor
  Left = 885
  Top = 417
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customize Tool Bar'
  ClientHeight = 387
  ClientWidth = 920
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ToolBarListView: TEasyListview
    Left = 0
    Top = 0
    Width = 940
    Height = 338
    AllowHiddenCheckedItems = True
    BorderStyle = bsNone
    CellSizes.Tile.Height = 80
    CellSizes.Tile.Width = 230
    Color = clWhite
    DisabledBlendColor = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000001DD000000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Height = 23
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesLarge = IL_ToolBarButtonsEditor
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.Border = 1
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 0
    PaintInfoItem.CheckType = ectBox
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileDetailCount = 2
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
    View = elsTile
    CustomCheckRadioEnabled = False
    OnItemCheckChange = ToolBarListViewItemCheckChange
    OnItemPaintText = ToolBarListViewItemPaintText
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 338
    Width = 920
    Height = 49
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelToolBarIconSize: TShadowLabel
      Tag = 1
      Left = 192
      Top = 5
      Width = 68
      Height = 16
      Caption = 'Set Icon Size'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelIconSizeValue: TShadowLabel
      Left = 268
      Top = 22
      Width = 72
      Height = 16
      Caption = 'Large (48x48)'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object IconSizeExtraLarge: TSpeedButton
      Left = 192
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Extra large icons (68x68)'
      GroupIndex = 1
      Caption = 'XL'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object IconSizeLarge: TSpeedButton
      Tag = 1
      Left = 217
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Large icons (48x48)'
      GroupIndex = 1
      Down = True
      Caption = 'L'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object IconSizeSmall: TSpeedButton
      Tag = 2
      Left = 242
      Top = 20
      Width = 24
      Height = 20
      Hint = 'Small Icons (30x24)'
      GroupIndex = 1
      Caption = 'S'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = IconSizeLargeClick
    end
    object BoundToGamesPanel: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 3
      Width = 145
      Height = 20
      Hint = 'Limit toolbar to the games list panel'
      ShowHint = True
      TabOrder = 0
      OnClick = BoundToGamesPanelClick
      Alignment = taLeftJustify
      Caption = 'Bound To Games Panel'
      ReturnIsTab = False
      ShadowColor = clSkyBlue
      Themed = True
      CustomIconsEnabled = False
    end
    object ShowHideToolBar: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 24
      Width = 105
      Height = 20
      Checked = True
      ShowHint = True
      TabOrder = 1
      OnClick = ShowHideToolBarClick
      Alignment = taLeftJustify
      Caption = 'Show Tool Bar'
      ReturnIsTab = False
      ShadowColor = clSkyBlue
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object ButtonDefault: TBitBtnEx
      Left = 684
      Top = 16
      Width = 89
      Height = 25
      Hint = 'Set all buttons visible'
      Caption = 'All Visible'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonDefaultClick
    end
    object ButtonClose: TBitBtnEx
      Left = 824
      Top = 16
      Width = 89
      Height = 25
      Caption = 'Close'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object IL_ToolBarButtonsEditor: TImageList
    Height = 68
    Width = 68
    Left = 280
    Top = 208
  end
end
