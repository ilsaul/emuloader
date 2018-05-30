object FormImageLayoutSettings: TFormImageLayoutSettings
  Left = 1125
  Top = 812
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Layout Settings'
  ClientHeight = 642
  ClientWidth = 934
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ImageScrLayoutFrame: TBevel
    Left = 646
    Top = 401
    Width = 278
    Height = 178
    Shape = bsFrame
  end
  object PanelBottomButtons: TPanelEx
    Left = 0
    Top = 600
    Width = 934
    Height = 42
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
    object ButtonHelp: TBitBtn
      Left = 8
      Top = 11
      Width = 89
      Height = 25
      Hint = 'How to use this feature'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonHelpClick
    end
    object ButtonClose: TBitBtn
      Left = 743
      Top = 11
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonAbort: TBitBtn
      Left = 841
      Top = 11
      Width = 89
      Height = 25
      Hint = 'Close and abort changes'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object PanelLayoutsSelector: TPanelEx
    Left = 0
    Top = 0
    Width = 934
    Height = 264
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object LabelLayoutTitle: TShadowLabel
      Left = 0
      Top = 244
      Width = 934
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'LAYOUT TITLE'
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
    object LabelShowHideLayouts: TShadowLabel
      Left = 0
      Top = 245
      Width = 250
      Height = 16
      Hint = 'Toggle visible / not visible for all layouts'
      Alignment = taCenter
      AutoSize = False
      Caption = 'CLICK HERE TO HIDE ALL LAYOUTS'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = False
      Layout = tlCenter
      OnClick = LabelShowHideLayoutsClick
      OnMouseEnter = LabelShowHideLayoutsMouseEnter
      OnMouseLeave = LabelShowHideLayoutsMouseLeave
    end
    object LayoutListView: TEasyListview
      Left = 8
      Top = 8
      Width = 952
      Height = 228
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Tile.Height = 76
      CellSizes.Tile.Width = 102
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001B8030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesExLarge = IL_Layouts
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.HideCaption = True
      PaintInfoItem.ShowBorder = False
      ShowThemedBorder = False
      Selection.BlendColorSelRect = 10902593
      Selection.BlendIcon = False
      Selection.BorderColor = 10902593
      Selection.BorderColorSelRect = 10902593
      Selection.Color = 10902593
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
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
      OnItemCheckChange = LayoutListViewItemCheckChange
      OnItemPaintText = LayoutListViewItemPaintText
      OnItemSelectionChanged = LayoutListViewItemSelectionChanged
    end
  end
  object ImageScrLayout: TImage32
    Left = 647
    Top = 402
    Width = 275
    Height = 175
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baCenter
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 2
  end
  object GroupBoxCategoryAllSystems: TAdvGroupBox
    Left = 8
    Top = 269
    Width = 445
    Height = 161
    RoundEdges = True
    Caption = ' Category (All Systems) '
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    object FrameIconLayScr2: TShape
      Left = 120
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object FrameIconLayScr3: TShape
      Left = 229
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object FrameIconLayScr1: TShape
      Left = 12
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object LabelPanel1: TLabel
      Left = 39
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLayScr3: TShadowLabel
      Left = 231
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Flyer'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr3Click
    end
    object LabelLayScr2: TShadowLabel
      Left = 121
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr2Click
    end
    object IconLayScr1: TImage
      Left = 26
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr1Click
    end
    object IconLayScr2: TImage
      Left = 134
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr2Click
    end
    object IconLayScr3: TImage
      Left = 243
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr3Click
    end
    object LabelLayScr1: TShadowLabel
      Left = 13
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Game Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr1Click
    end
    object FrameIconLayScr4: TShape
      Left = 337
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object LabelLayScr4: TShadowLabel
      Left = 339
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cabinet'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr4Click
    end
    object IconLayScr4: TImage
      Left = 351
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr4Click
    end
    object LabelPanel4: TLabel
      Left = 364
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelPanel2: TLabel
      Left = 143
      Top = 8
      Width = 42
      Height = 18
      Caption = 'Panel 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Visible = False
    end
    object LabelPanel3: TLabel
      Left = 252
      Top = 8
      Width = 42
      Height = 18
      Caption = 'Panel 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Visible = False
    end
    object PanelEnabledScr2: TAdvOfficeCheckBox
      Left = 139
      Top = 20
      Width = 63
      Height = 20
      Hint = 'Show/hide this panel for selected layout'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 0
      OnClick = PanelEnabledScr2Click
      Alignment = taLeftJustify
      Caption = 'Panel 2'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object PanelEnabledScr3: TAdvOfficeCheckBox
      Left = 247
      Top = 20
      Width = 62
      Height = 20
      Hint = 'Show/hide this panel for selected layout'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      OnClick = PanelEnabledScr3Click
      Alignment = taLeftJustify
      Caption = 'Panel 3'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
    end
    object ButtonLayoutResetPanelsIndex: TBitBtn
      Left = 388
      Top = 3
      Width = 47
      Height = 19
      Hint = 'Reset settings of selected layout to default'
      Caption = 'Default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonLayoutResetPanelsIndexClick
    end
  end
  object GroupBoxCategoryConsoleComputer: TAdvGroupBox
    Left = 8
    Top = 440
    Width = 445
    Height = 161
    CheckBox.Action = caNone
    CheckBox.Visible = True
    RoundEdges = True
    Caption = '      Use Custom Category for Console/Computer '
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 7891291
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnCheckBoxClick = GroupBoxCategoryConsoleComputerCheckBoxClick
    object FrameIconLayScr2_ConsComp: TShape
      Left = 120
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object FrameIconLayScr3_ConsComp: TShape
      Left = 229
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object FrameIconLayScr1_ConsComp: TShape
      Left = 12
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object LabelPanel1_ConsComp: TLabel
      Left = 39
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelLayScr3_ConsComp: TShadowLabel
      Left = 231
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Flyer'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr3_ConsCompClick
    end
    object LabelLayScr2_ConsComp: TShadowLabel
      Left = 121
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr2_ConsCompClick
    end
    object IconLayScr1_ConsComp: TImage
      Left = 26
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr1_ConsCompClick
    end
    object IconLayScr2_ConsComp: TImage
      Left = 134
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr2_ConsCompClick
    end
    object IconLayScr3_ConsComp: TImage
      Left = 243
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr3_ConsCompClick
    end
    object LabelLayScr1_ConsComp: TShadowLabel
      Left = 13
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Game Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr1_ConsCompClick
    end
    object FrameIconLayScr4_ConsComp: TShape
      Left = 337
      Top = 42
      Width = 96
      Height = 96
      Pen.Color = 7891291
    end
    object LabelLayScr4_ConsComp: TShadowLabel
      Left = 339
      Top = 141
      Width = 94
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cabinet'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = IconLayScr4_ConsCompClick
    end
    object IconLayScr4_ConsComp: TImage
      Left = 351
      Top = 56
      Width = 68
      Height = 68
      IncrementalDisplay = True
      Transparent = True
      OnClick = IconLayScr4_ConsCompClick
    end
    object LabelPanel4_ConsComp: TLabel
      Left = 364
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelPanel3_ConsComp: TLabel
      Left = 252
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Visible = False
    end
    object LabelPanel2_ConsComp: TLabel
      Left = 143
      Top = 22
      Width = 42
      Height = 18
      Caption = 'Panel 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      Visible = False
    end
    object ButtonHelp_CustomCategoryConsComp: TBitBtn
      Left = 26
      Top = 0
      Width = 19
      Height = 19
      Hint = 'What is this for ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonHelp_CustomCategoryConsCompClick
    end
    object ButtonLayoutCopyCatAllSystems_ConsComp: TBitBtn
      Left = 347
      Top = 3
      Width = 41
      Height = 19
      Hint = 'Copy category selections from "all systems"'
      Caption = 'Copy'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonLayoutCopyCatAllSystems_ConsCompClick
    end
    object ButtonLayoutResetPanelsIndex_ConsComp: TBitBtn
      Left = 388
      Top = 3
      Width = 47
      Height = 19
      Hint = 'Reset settings of selected layout to default'
      Caption = 'Default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonLayoutResetPanelsIndex_ConsCompClick
    end
  end
  object IL_Layouts: TImageList
    Height = 68
    Width = 68
    Left = 240
    Top = 73
  end
  object IL_ImageCategory: TImageList
    Height = 48
    Width = 48
    Left = 240
    Top = 104
  end
  object IL_ImageCategory_ExtraLarge: TImageList
    Height = 68
    Width = 68
    Left = 272
    Top = 104
  end
end
