object FormImageLayoutSettings: TFormImageLayoutSettings
  Left = 1125
  Top = 812
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Image Layout Settings'
  ClientHeight = 420
  ClientWidth = 628
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
  object FrameIconLayScr2: TShape
    Left = 116
    Top = 228
    Width = 96
    Height = 96
    Pen.Color = 7891291
  end
  object FrameIconLayScr3: TShape
    Left = 225
    Top = 228
    Width = 96
    Height = 96
    Pen.Color = 7891291
  end
  object FrameIconLayScr1: TShape
    Left = 8
    Top = 228
    Width = 96
    Height = 96
    Pen.Color = 7891291
  end
  object LabelPanel1: TShadowLabel
    Left = 43
    Top = 206
    Width = 45
    Height = 19
    Caption = 'Panel 1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clSilver
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
  end
  object LabelLayScr3: TShadowLabel
    Left = 228
    Top = 329
    Width = 91
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'Control Panel Layout'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
    WordWrap = True
    OnClick = IconLayScr3Click
  end
  object LabelLayScr2: TShadowLabel
    Left = 118
    Top = 329
    Width = 91
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'Title Snapshots'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
    WordWrap = True
    OnClick = IconLayScr2Click
  end
  object IconLayScr1: TImage
    Left = 22
    Top = 242
    Width = 68
    Height = 68
    IncrementalDisplay = True
    Transparent = True
    OnClick = IconLayScr1Click
  end
  object IconLayScr2: TImage
    Left = 130
    Top = 242
    Width = 68
    Height = 68
    IncrementalDisplay = True
    Transparent = True
    OnClick = IconLayScr2Click
  end
  object IconLayScr3: TImage
    Left = 239
    Top = 242
    Width = 68
    Height = 68
    IncrementalDisplay = True
    Transparent = True
    OnClick = IconLayScr3Click
  end
  object LabelLayoutSetCategories: TShadowLabel
    Left = 25
    Top = 176
    Width = 230
    Height = 19
    Caption = 'SET CATEGORIES FOR EACH LAYOUT'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10900224
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
  end
  object LabelLayScr1: TShadowLabel
    Left = 10
    Top = 329
    Width = 91
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'Game Snapshots'
    Color = 16448250
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 14540253
    ShadowEnabled = True
    EllipsType = etNone
    Transparent = True
    WordWrap = True
    OnClick = IconLayScr1Click
  end
  object ImageScrLayoutFrame: TBevel
    Left = 342
    Top = 177
    Width = 278
    Height = 178
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 64
    Top = 363
    Width = 75
    Height = 15
    Caption = 'Machine Type'
    Visible = False
  end
  object PanelBottomButtons: TPanelEx
    Left = 0
    Top = 378
    Width = 628
    Height = 42
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonHelp: TBitBtn
      Left = 337
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
      Left = 433
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
      Left = 531
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
  object PanelEnabledScr2: TAdvOfficeCheckBox
    Left = 135
    Top = 204
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
    TabOrder = 1
    OnClick = PanelEnabledScr2Click
    Alignment = taLeftJustify
    Caption = 'Panel 2'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object PanelEnabledScr3: TAdvOfficeCheckBox
    Left = 243
    Top = 204
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
    TabOrder = 2
    OnClick = PanelEnabledScr3Click
    Alignment = taLeftJustify
    Caption = 'Panel 3'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object ButtonLayoutResetPanelsIndex: TBitBtn
    Left = 276
    Top = 176
    Width = 47
    Height = 19
    Hint = 'Reset settings of selected layout to default'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonLayoutResetPanelsIndexClick
  end
  object PanelLayoutsSelector: TPanelEx
    Left = 0
    Top = 0
    Width = 640
    Height = 169
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object LayoutListView: TEasyListview
      Left = 8
      Top = 8
      Width = 630
      Height = 152
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
        0006000000800800010100010000000000000176020000FFFFFF1F0001000000
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
    object PanelLayoutTitle: TPanelEx
      Left = 314
      Top = 151
      Width = 313
      Height = 16
      Color1 = clWhite
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = 7891291
      Frames = []
      ParentBackground = False
      Style = vgSolid
      object LabelLayoutTitle: TShadowLabel
        Left = 0
        Top = 0
        Width = 313
        Height = 16
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
    end
  end
  object PanelEnabledScr1_AlwaysEnabled: TAdvOfficeCheckBox
    Left = 27
    Top = 204
    Width = 16
    Height = 20
    Checked = True
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ShowHint = True
    TabOrder = 5
    Alignment = taLeftJustify
    Caption = 'TAdvOfficeCheckBox'
    ReturnIsTab = False
    ShadowColor = clSilver
    State = cbChecked
    Themed = True
  end
  object ButtonLayoutToggleVisibility: TBitBtn
    Left = 439
    Top = 96
    Width = 64
    Height = 42
    Hint = 'Toggle visible / not visible for all layouts'
    Caption = 'Hide All'#13#10'Layouts'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = ButtonLayoutToggleVisibilityClick
  end
  object ImageScrLayout: TImage32
    Left = 343
    Top = 178
    Width = 275
    Height = 175
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baCenter
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 7
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 360
    Width = 87
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    ItemIndex = 0
    TabOrder = 8
    Text = 'All Systems'
    Visible = False
    Items.Strings = (
      'All Systems'
      'Custom')
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 360
    Width = 43
    Height = 23
    Caption = 'Help'
    TabOrder = 9
    Visible = False
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
