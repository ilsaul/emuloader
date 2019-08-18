object FormArcadeMAMEMachinesCustomize: TFormArcadeMAMEMachinesCustomize
  Left = 579
  Top = 325
  BorderStyle = bsDialog
  Caption = 'Customize MAME Machines List'
  ClientHeight = 642
  ClientWidth = 1061
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
  object LabelTotalMachinesList: TShadowLabel
    Left = 893
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
    Width = 1061
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
      Left = 861
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Update "\arcade\mame_machines_exclude.txt" file'
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonYesClick
    end
    object ButtonNo: TBitBtnEx
      Left = 964
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
      Hint = 'Show only disabled machines for easier viewing'
      ShowHint = True
      TabOrder = 3
      OnClick = FilterShowUncheckedOnlyClick
      Alignment = taLeftJustify
      Caption = 'Show Unchecked Only'
      ReturnIsTab = False
      Themed = True
    end
    object FilterShowParentSetsOnly: TAdvOfficeCheckBoxEx
      Left = 220
      Top = 11
      Width = 141
      Height = 20
      ShowHint = True
      TabOrder = 4
      OnClick = FilterShowParentSetsOnlyClick
      Alignment = taLeftJustify
      Caption = 'Show Parent Sets Only'
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
    Width = 1061
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
      Width = 970
      Height = 33
      AutoSize = False
      Caption = 
        'Uncheck all machines you want to hide. Hiding parent set automat' +
        'ically hides all its clone sets, no need to uncheck them. '#13'Use p' +
        'opup menu to check/uncheck multiple selections.'
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
      Width = 943
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
    Width = 1045
    Height = 473
    Color1 = clWhite
    Color2 = 1
    Color3 = 7891291
    Color4 = 16750899
    ColorFrame = clSilver
    ColorInnerFrame = 7891291
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object MachinesListEditor: TEasyListview
      Left = 0
      Top = 0
      Width = 1043
      Height = 471
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
      ImagesState = FormMain.IL_GroupedMode
      UseDockManager = False
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        060000008108060000000000000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000007000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000001000190010000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        00010100000000000137000000FFFFFF1F000100000001000000040000005900
        650061007200000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000001B40000
        00FFFFFF1F0001000000010000000C0000004D0061006E007500660061006300
        7400750072006500720000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
        0164000000FFFFFF1F000100000001000000040000004E0061006D0065000000
        00000000000000000000110000005445617379436F6C756D6E53746F726564FF
        FECE0006000000800800010100010400000000000164000000FFFFFF1F000100
        0000010000000800000043006C006F006E00650020004F006600000000000000
        000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
        000000800800010100010500000000000175000000FFFFFF1F00010000000100
        0000060000004400720069007600650072000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        0001060000000000015A000000FFFFFF1F0001000000010000000A0000005300
        610076006500200053007400610074006500000000000000000000000000}
      Header.Draggable = False
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesSmall = FormMain.IL_StandardIconsSmall
      PaintInfoColumn.CaptionIndent = 0
      PaintInfoColumn.HotTrack = False
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
      PopupMenu = PopupMachines
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
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      OnColumnClick = MachinesListEditorColumnClick
      OnIncrementalSearch = MachinesListEditorIncrementalSearch
      OnItemCheckChange = MachinesListEditorItemCheckChange
      OnItemCheckChanging = MachinesListEditorItemCheckChanging
      OnItemCompare = MachinesListEditorItemCompare
      OnItemPaintText = MachinesListEditorItemPaintText
      OnItemSelectionChanged = MachinesListEditorItemSelectionChanged
      OnKeyAction = MachinesListEditorKeyAction
    end
  end
  object IL_MediaType: TImageList
    Left = 264
    Top = 120
  end
  object PopupMachines: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupMachinesPopup
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = ANSI_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -16
    Bar.BarCaption.Font.Name = 'Trebuchet MS'
    Bar.BarCaption.Font.Style = [fsBold]
    Bar.BarCaption.ShadowColor = clBlack
    Bar.BarCaption.Caption = 'Screenshots Layouts'
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clBlack
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupMachinesMeasureMenuItem
    Left = 304
    Top = 120
    object PopupCheckMultipleSelected: TMenuItem
      Tag = 1
      Caption = 'Check Multiple Selected'
      OnClick = PopupCheckMultipleSelectedClick
    end
    object PopupUncheckMultipleSelected: TMenuItem
      Caption = 'Uncheck Multiple Selected'
      OnClick = PopupCheckMultipleSelectedClick
    end
  end
end
