object FormArcadeSoftwareListCustomize: TFormArcadeSoftwareListCustomize
  Left = 579
  Top = 325
  BorderStyle = bsDialog
  Caption = 'Customize Software List'
  ClientHeight = 642
  ClientWidth = 1134
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelTotalSoftwareList: TShadowLabel
    Left = 965
    Top = 91
    Width = 157
    Height = 15
    Alignment = taRightJustify
    Caption = 'Checked 00000 of 00000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clMaroon
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Layout = tlCenter
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 601
    Width = 1134
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtnEx
      Left = 933
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Update "\arcade\mame_softlist_exclude.txt" file'
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonYesClick
    end
    object ButtonNo: TBitBtnEx
      Left = 1036
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonResetToCurrent: TBitBtnEx
      Left = 8
      Top = 8
      Width = 43
      Height = 25
      Hint = 'Reload selections from last save'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonResetToCurrentClick
    end
    object FilterShowUncheckedOnly: TAdvOfficeCheckBoxEx
      Left = 60
      Top = 11
      Width = 141
      Height = 20
      Hint = 'Show only disabled software lists for easier viewing'
      ShowHint = True
      TabOrder = 3
      OnClick = FilterShowUncheckedOnlyClick
      Alignment = taLeftJustify
      Caption = 'Show Unchecked Only'
      ReturnIsTab = False
      Themed = True
    end
    object UseBiggerFontIconSize: TAdvOfficeCheckBoxEx
      Left = 252
      Top = 11
      Width = 183
      Height = 20
      ShowHint = True
      TabOrder = 4
      OnClick = UseBiggerFontIconSizeClick
      Alignment = taLeftJustify
      Caption = 'Use Bigger Icon and Font Sizes'
      ReturnIsTab = False
      Themed = True
    end
  end
  object CheckAll: TAdvOfficeCheckBoxEx
    Left = 12
    Top = 88
    Width = 100
    Height = 20
    Checked = True
    ShowHint = True
    TabOrder = 1
    OnClick = CheckAllClick
    Alignment = taLeftJustify
    Caption = 'Uncheck All'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1134
    Height = 83
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Tag = -50
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelSystemTitle: TShadowLabel
      Left = 79
      Top = 4
      Width = 757
      Height = 33
      AutoSize = False
      Caption = 
        'Uncheck all software lists you want to disable. They will be ign' +
        'ored when creating a MAME games list. You can also use "Create S' +
        'oftware List Games" (main menu) to apply changes.'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSkyBlue
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object EmulatorIcon: TImage
      Tag = -50
      Left = 79
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 46
      Width = 863
      Height = 27
      AutoSize = False
      Caption = 'Emulator version'#13#10'Emulator filename'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
  end
  object FrameSoftwareList: TPanelEx
    Left = 8
    Top = 112
    Width = 1117
    Height = 473
    Color1 = clWhite
    Color2 = 1
    Color3 = 7891291
    Color4 = 16750899
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbDouble
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object SoftwareLists: TEasyListview
      Left = 0
      Top = 0
      Width = 1113
      Height = 469
      Align = alClient
      AllowHiddenCheckedItems = True
      CellSizes.Report.Height = 22
      Color = clWhite
      DisabledBlendAlpha = 0
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        060000008108060000000000000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000010001DA020000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        000101000000000001E6000000FFFFFF1F0001000000010000000D0000005300
        6F0066007400770061007200650020004E0061006D0065000000000000000000
        00000000110000005445617379436F6C756D6E53746F726564FFFECE00060000
        00800800010100010200000000000196000000FFFFFF1F000100000001000000
        050000004D006500640069006100000000000000000000000000}
      Header.Draggable = False
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesSmall = IL_MediaType
      PaintInfoColumn.CaptionIndent = 0
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandEnabled = False
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 0
      PaintInfoGroup.MarginBottom.Visible = True
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.ShowBorder = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendAlphaImage = 0
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
      View = elsReport
      OnColumnClick = SoftwareListsColumnClick
      OnItemCheckChange = SoftwareListsItemCheckChange
      OnItemCheckChanging = SoftwareListsItemCheckChanging
      OnItemPaintText = SoftwareListsItemPaintText
    end
  end
  object IL_MediaType: TImageList
    Left = 264
    Top = 80
  end
end
