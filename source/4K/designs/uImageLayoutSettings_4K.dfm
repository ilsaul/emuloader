object FormImageLayoutSettings4K: TFormImageLayoutSettings4K
  Left = 701
  Top = 334
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Layout Settings (4K)'
  ClientHeight = 1092
  ClientWidth = 1664
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
  object ImageScrLayoutFrame: TBevelEx
    Left = 920
    Top = 628
    Width = 554
    Height = 354
    Shape = bsDualFrame
    Style = bsCustomColors
    CustomColor1 = clGray
    CustomColor2 = 5263440
  end
  object LayoutsRightFrame: TBevelEx
    Left = 412
    Top = 0
    Width = 4
    Height = 558
    Shape = bsLeftLine
    Style = bsCustomColors
    CustomColor2 = clNone
  end
  object PanelLayoutsSelector: TPanelEx
    Left = 0
    Top = 0
    Width = 900
    Height = 823
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LayoutListView: TEasyListview
      Left = 8
      Top = 35
      Width = 920
      Height = 780
      AllowHiddenCheckedItems = True
      BorderStyle = bsNone
      CellSizes.Tile.Height = 76
      CellSizes.Tile.Width = 102
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -21
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000198030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Height = 38
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
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object PanelSystemTitle: TPanelEx
      Left = 0
      Top = 0
      Width = 900
      Height = 27
      Align = alTop
      Color1 = 15856113
      Color2 = 15132390
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object LabelLayoutTitle: TShadowLabel
        Left = 0
        Top = 0
        Width = 900
        Height = 27
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'LAYOUT TITLE'
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
    object PanelSystemTitleBottom: TPanelEx
      Left = 0
      Top = 27
      Width = 900
      Height = 8
      Align = alTop
      Color1 = 15132390
      Color2 = clWhite
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
    end
    object ShowHideLayoutsPanel: TPanelEx
      Left = 765
      Top = 717
      Width = 107
      Height = 67
      Color1 = 16448250
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clSilver
      ColorInnerFrame = clGreen
      Frames = [frLeft, frTop, frRight, frBottom]
      ParentBackground = False
      Style = vgSolid
      object ShowHideLayoutsLabel: TShadowLabel
        Left = 11
        Top = 8
        Width = 88
        Height = 55
        Cursor = crHandPoint
        Hint = 'Toggle visible / not visible for all layouts'
        Alignment = taCenter
        Caption = 'HIDE ALL'#13#10'LAYOUTS'
        Color = 16448250
        Font.Charset = ANSI_CHARSET
        Font.Color = 10900224
        Font.Height = -21
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = 14540253
        ShadowEnabled = True
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
    end
  end
  object ImageScrLayout: TImage32
    Left = 922
    Top = 630
    Width = 550
    Height = 350
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baCenter
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 1
  end
  object GroupBoxCategoryConsoleComputer: TAdvGroupBoxEx
    Left = 920
    Top = 326
    Width = 725
    Height = 282
    CheckBox.Action = caNone
    CheckBox.Visible = True
    CheckBox.CustomIconsEnabled = False
    CheckBox.CustomEnableIconHD = True
    CheckBox.CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CheckBox.CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    RoundEdges = True
    Caption = '       Use Custom Category for Console/Computer '
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 7891291
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object FrameIconLayScr2_ConsComp: TShape
      Left = 196
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object FrameIconLayScr3_ConsComp: TShape
      Left = 372
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object FrameIconLayScr1_ConsComp: TShape
      Left = 20
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object LabelPanel1_ConsComp: TShadowLabel
      Left = 65
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    end
    object LabelLayScr3_ConsComp: TShadowLabel
      Left = 372
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Flyer'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object LabelLayScr2_ConsComp: TShadowLabel
      Left = 196
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object IconLayScr1_ConsComp: TImage
      Left = 34
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object IconLayScr2_ConsComp: TImage
      Left = 210
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object IconLayScr3_ConsComp: TImage
      Left = 386
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object LabelLayScr1_ConsComp: TShadowLabel
      Left = 20
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Game Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object FrameIconLayScr4_ConsComp: TShape
      Left = 548
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object LabelLayScr4_ConsComp: TShadowLabel
      Left = 548
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cabinet'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object IconLayScr4_ConsComp: TImage
      Left = 562
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object LabelPanel4_ConsComp: TShadowLabel
      Left = 592
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    end
    object LabelPanel3_ConsComp: TShadowLabel
      Left = 416
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Visible = False
    end
    object LabelPanel2_ConsComp: TShadowLabel
      Left = 240
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Visible = False
    end
    object ButtonLayoutCopyCatAllSystems_ConsComp: TSpeedButtonEx
      Left = 550
      Top = 0
      Width = 61
      Height = 30
      Hint = 'Copy category selections from "all systems"'
      Caption = 'Copy'
      CaptionVertIndent = -3
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object ButtonLayoutResetPanelsIndex_ConsComp: TSpeedButtonEx
      Left = 614
      Top = 0
      Width = 82
      Height = 30
      Hint = 'Reset settings of selected layout to default'
      Caption = 'Default'
      CaptionVertIndent = -3
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object ButtonHelp_CustomCategoryConsComp: TSpeedButtonEx
      Left = 36
      Top = 3
      Width = 22
      Height = 22
      Hint = 'What is this for ?'
      Caption = '?'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
  end
  object GroupBoxCategoryAllSystems: TAdvGroupBoxEx
    Left = 920
    Top = 19
    Width = 725
    Height = 282
    CheckBox.CustomIconsEnabled = False
    CheckBox.CustomEnableIconHD = False
    RoundEdges = True
    Caption = ' Category (All Systems) '
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object FrameIconLayScr2: TShape
      Left = 196
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object FrameIconLayScr3: TShape
      Left = 372
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object FrameIconLayScr1: TShape
      Left = 20
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object LabelPanel1: TShadowLabel
      Left = 65
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    end
    object LabelLayScr3: TShadowLabel
      Left = 372
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Flyer'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object LabelLayScr2: TShadowLabel
      Left = 196
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object IconLayScr1: TImage
      Left = 34
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object IconLayScr2: TImage
      Left = 210
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object IconLayScr3: TImage
      Left = 386
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object LabelLayScr1: TShadowLabel
      Left = 20
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Game Snapshot'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object FrameIconLayScr4: TShape
      Left = 548
      Top = 74
      Width = 156
      Height = 156
      Pen.Color = 7891291
    end
    object LabelLayScr4: TShadowLabel
      Left = 548
      Top = 242
      Width = 156
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cabinet'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
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
    object IconLayScr4: TImage
      Left = 562
      Top = 88
      Width = 128
      Height = 128
      IncrementalDisplay = True
      Transparent = True
    end
    object LabelPanel4: TShadowLabel
      Left = 592
      Top = 39
      Width = 68
      Height = 28
      Caption = 'Panel 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
    end
    object LabelPanel2: TShadowLabel
      Left = 240
      Top = 15
      Width = 68
      Height = 28
      Caption = 'Panel 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Visible = False
    end
    object LabelPanel3: TShadowLabel
      Left = 416
      Top = 16
      Width = 68
      Height = 28
      Caption = 'Panel 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
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
      Visible = False
    end
    object ButtonLayoutResetPanelsIndex: TSpeedButtonEx
      Left = 614
      Top = 0
      Width = 84
      Height = 31
      Hint = 'Reset settings of selected layout to default'
      Caption = 'Default'
      CaptionVertIndent = -2
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object PanelEnabledScr2: TAdvOfficeCheckBoxEx
      Left = 227
      Top = 37
      Width = 100
      Height = 30
      Hint = 'Show/hide this panel for selected layout'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Panel 2'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object PanelEnabledScr3: TAdvOfficeCheckBoxEx
      Left = 404
      Top = 37
      Width = 100
      Height = 30
      Hint = 'Show/hide this panel for selected layout'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Panel 3'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object PanelBottom: TPanelEx
    Left = 936
    Top = 1020
    Width = 729
    Height = 71
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGray
    ColorInnerFrame = clGreen
    Frames = [frLeft, frTop, frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object ButtonHelp: TBitBtnEx
      Left = 137
      Top = 9
      Width = 168
      Height = 45
      Hint = 'How to use this feature'
      Caption = 'Help'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonClose: TBitBtnEx
      Left = 321
      Top = 13
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Apply'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonAbort: TBitBtnEx
      Left = 497
      Top = 9
      Width = 168
      Height = 45
      Hint = 'Close and abort changes'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object IL_Layouts: TImageList
    Height = 128
    Width = 128
    Left = 240
    Top = 73
  end
  object IL_ImageCategory: TImageList
    Height = 128
    Width = 128
    Left = 240
    Top = 104
  end
  object IL_ImageCategory_ExtraLarge: TImageList
    Height = 128
    Width = 128
    Left = 272
    Top = 104
  end
end
