object FormArcadeMAMEMachinesCustomize4K: TFormArcadeMAMEMachinesCustomize4K
  Left = 747
  Top = 407
  BorderStyle = bsDialog
  Caption = 'Customize MAME Machines List 4K'
  ClientHeight = 1211
  ClientWidth = 2184
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object LabelTotalMachinesList: TShadowLabel
    Left = 1909
    Top = 160
    Width = 267
    Height = 25
    Alignment = taRightJustify
    Caption = 'Checked 00000 of 00000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
    Top = 1140
    Width = 2184
    Height = 71
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
      Left = 1828
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Update "\arcade\mame_machines_exclude.txt" file'
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtnEx
      Left = 2006
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonResetToCurrent: TBitBtnEx
      Left = 10
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Reload selections from last save'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object FilterShowUncheckedOnly: TAdvOfficeCheckBoxEx
      Left = 188
      Top = 20
      Width = 250
      Height = 36
      Hint = 'Show only disabled machines for easier viewing'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show Unchecked Only'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FilterShowParentSetsOnly: TAdvOfficeCheckBoxEx
      Left = 444
      Top = 20
      Width = 250
      Height = 36
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show Parent Sets Only'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object CheckAll: TAdvOfficeCheckBoxEx
    Left = 10
    Top = 153
    Width = 140
    Height = 36
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 1
    Alignment = taLeftJustify
    ButtonVertAlign = tlCenter
    Caption = 'Uncheck All'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
    CustomIconsEnabled = False
    CustomEnableIconHD = True
    CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
    CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 2184
    Height = 150
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
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelSystemTitle: TShadowLabel
      Left = 144
      Top = 4
      Width = 1650
      Height = 59
      AutoSize = False
      Caption = 
        'Uncheck all machines you want to hide. Hiding parent set automat' +
        'ically hides all its clone sets, no need to uncheck them. '#13'Use p' +
        'opup menu to check/uncheck multiple selections.'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 199
      Top = 84
      Width = 178
      Height = 47
      Caption = 'Emulator version'#13#10'Emulator filename'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
  object MachinesListEditor: TEasyListview
    Left = 10
    Top = 193
    Width = 2164
    Height = 937
    AllowHiddenCheckedItems = True
    CellSizes.Report.Height = 22
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
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
      00060000008008000101000100000000010001BC020000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000146000000FFFFFF1F000100000001000000040000005900
      650061007200000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001D00100
      00FFFFFF1F0001000000010000000C0000004D0061006E007500660061006300
      7400750072006500720000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
      01FA000000FFFFFF1F000100000001000000040000004E0061006D0065000000
      00000000000000000000110000005445617379436F6C756D6E53746F726564FF
      FECE00060000008008000101000104000000000001FA000000FFFFFF1F000100
      0000010000000800000043006C006F006E00650020004F006600000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      000000800800010100010500000000000118010000FFFFFF1F00010000000100
      0000060000004400720069007600650072000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010600000000000182000000FFFFFF1F0001000000010000000A0000005300
      610076006500200053007400610074006500000000000000000000000000}
    Header.Draggable = False
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsSmall
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
    ShowThemedBorderColor = clSilver
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
    TabOrder = 3
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object IL_MediaType: TImageList
    Left = 274
    Top = 161
  end
  object PopupMachines: TBcBarPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    TrackButton = tbLeftButton
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
    Left = 314
    Top = 161
    object PopupCheckMultipleSelected: TMenuItem
      Tag = 1
      Caption = 'Check Multiple Selected'
    end
    object PopupUncheckMultipleSelected: TMenuItem
      Caption = 'Uncheck Multiple Selected'
    end
  end
end
