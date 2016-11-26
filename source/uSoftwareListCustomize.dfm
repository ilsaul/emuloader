object FormSoftwareListCustomize: TFormSoftwareListCustomize
  Left = 579
  Top = 325
  BorderStyle = bsDialog
  Caption = 'Customize Software List'
  ClientHeight = 382
  ClientWidth = 619
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
    Left = 450
    Top = 43
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
    Transparent = True
    Layout = tlCenter
  end
  object ShadowLabel1: TShadowLabel
    Left = 38
    Top = 4
    Width = 542
    Height = 31
    AutoSize = False
    Caption = 
      'Uncheck all software lists you want to disable. They will be ign' +
      'ored when creating a MAME games list. You can also use "Create S' +
      'oftware List Games" (main menu) to apply changes.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    WordWrap = True
  end
  object SoftwareLists: TEasyListview
    Left = 8
    Top = 59
    Width = 602
    Height = 278
    CellSizes.Report.Height = 20
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000010001B2010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      000101000000000001A5000000FFFFFF1F0001000000010000000D0000005300
      6F0066007400770061007200650020004E0061006D0065000000000000000000
      00000000}
    Header.Draggable = False
    Header.Height = 23
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
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
  object PanelMessages: TPanelEx
    Left = 0
    Top = 341
    Width = 619
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtn
      Left = 418
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Update "ini_files\softlist-exclude.txt" file'
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonYesClick
    end
    object ButtonNo: TBitBtn
      Left = 521
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonResetToCurrent: TBitBtn
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
    object FilterShowUncheckedOnly: TAdvOfficeCheckBox
      Left = 164
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
  end
  object CheckAll: TAdvOfficeCheckBox
    Left = 12
    Top = 40
    Width = 105
    Height = 18
    Checked = True
    ShowHint = True
    TabOrder = 2
    OnClick = CheckAllClick
    Alignment = taLeftJustify
    Caption = 'Uncheck All'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
end
