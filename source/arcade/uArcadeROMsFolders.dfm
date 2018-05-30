object FormArcadeROMsFolders: TFormArcadeROMsFolders
  Left = 544
  Top = 285
  ActiveControl = SystemSelector
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MAME and Arcade ROMs Folders'
  ClientHeight = 388
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
  object FoldersList: TMemo
    Left = 8
    Top = 135
    Width = 624
    Height = 203
    Color = 15856113
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
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
    ColorInnerFrame = clGreen
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
      Tag = -1
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
      GroupFont.Color = clWindowText
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
      Header.Font.Color = clWindowText
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
  object PanelBottom: TPanelEx
    Left = 0
    Top = 347
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
    object ButtonCancel: TBitBtn
      Left = 544
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 0
    end
    object UseLargeIcons: TAdvOfficeCheckBox
      Left = 9
      Top = 11
      Width = 79
      Height = 20
      Hint = 'Use 128x128 system icons'
      TabOrder = 1
      OnClick = UseLargeIconsClick
      Alignment = taLeftJustify
      Caption = 'Large Icons'
      ReturnIsTab = False
    end
  end
  object IL_Systems: TImageList
    Height = 68
    Width = 68
    Left = 536
    Top = 136
  end
end
