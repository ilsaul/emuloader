object FormCustomParameters: TFormCustomParameters
  Left = 961
  Top = 512
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Custom Parameters'
  ClientHeight = 631
  ClientWidth = 1517
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
  object LabelTips1: TShadowLabel
    Left = 15
    Top = 199
    Width = 725
    Height = 31
    Caption = 
      'The             parameter is optional, used with software lists.' +
      ' It'#39's added by the frontend at the end in slot1/drive1 (when emu' +
      'lator is running).'#13#10'Useful to load the game in another slot, but' +
      ' it must be the last argument.'
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelTips1ParamMedia1: TShadowLabel
    Left = 37
    Top = 199
    Width = 34
    Height = 16
    Caption = 'media'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelTips1ParamMedia2: TShadowLabel
    Left = 405
    Top = 214
    Width = 187
    Height = 16
    Caption = '(-cart1  -cart2  -cass  -flop2  others)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelTips2: TShadowLabel
    Left = 14
    Top = 235
    Width = 716
    Height = 16
    Caption = 
      'You may use a                 tag, it will be replaced by the ga' +
      'me name. Media parameter is required, but don'#39't have to be the l' +
      'ast arguments.'
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object LabelTips1ParamGameTag: TShadowLabel
    Left = 92
    Top = 235
    Width = 47
    Height = 16
    Caption = '<game>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object SoftwareUsageTitle: TShadowLabel
    Left = 8
    Top = 92
    Width = 101
    Height = 16
    Caption = 'Usage instructions:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object SoftwareUsageText: TShadowLabel
    Left = 113
    Top = 93
    Width = 655
    Height = 14
    AutoSize = False
    Caption = 'instructions on how to load this game'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object SoftwareRequirementText: TShadowLabel
    Left = 214
    Top = 108
    Width = 554
    Height = 14
    AutoSize = False
    Caption = 'software or device requirement for this game'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object SoftwareRequirementTitle: TShadowLabel
    Left = 8
    Top = 107
    Width = 201
    Height = 16
    Caption = 'Requirement (added by the frontend):'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1517
    Height = 92
    Align = alTop
    Color1 = 15792869
    Color2 = 15856113
    Color3 = clMoneyGreen
    Color4 = 1117964
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 665
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object GameIcon: TImage
      Left = 76
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 46
      Width = 655
      Height = 40
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'software ' +
        'list: softwarelist title'#13#10'run with machine [machinename]: machin' +
        'e title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
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
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 590
    Width = 1517
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
    object LabelCustomParamFile: TShadowLabel
      Left = 81
      Top = 11
      Width = 496
      Height = 19
      AutoSize = False
      Caption = 'filename_full_path.ini'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ButtonReload: TBitBtnEx
      Left = 8
      Top = 8
      Width = 65
      Height = 25
      Hint = 'Load settings from file'
      Caption = 'Reload'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonReloadClick
    end
    object ButtonOk: TBitBtnEx
      Left = 585
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and save settings'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 682
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without saving'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object CustomParametersGroupBox: TPanelEx
    Left = 8
    Top = 131
    Width = 763
    Height = 55
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = clGreen
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object CustomParametersGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 761
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 
        'Custom Parameters                    (for software lists, you ca' +
        'n enter a machine name before the parameters to overwrite curren' +
        't selected machine)'
      CaptionIndent = 3
      Color = clCream
      ParentColor = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object CustomParameters_Edit: TEditEx
      Left = 8
      Top = 24
      Width = 745
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object CustomParametersSamplesGroupBox: TPanelEx
    Left = 8
    Top = 263
    Width = 763
    Height = 307
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = clGreen
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object CustomParametersSamplesGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 761
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Custom Parameters Samples'
      CaptionIndent = 3
      Color = clCream
      ParentColor = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object CustomParametersSamplesFrame: TShape
      Left = 8
      Top = 24
      Width = 745
      Height = 273
      Pen.Color = clSilver
    end
    object CustomParametersSamples: TTntRichEdit
      Left = 9
      Top = 25
      Width = 743
      Height = 271
      BorderStyle = bsNone
      Color = 15856113
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object PanelMachineSlotsGroupBox: TPanelEx
    Left = 779
    Top = 8
    Width = 730
    Height = 615
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clSilver
    ColorInnerFrame = clGreen
    EnableCustomBorder = ecbSingle
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object PanelMachineSlotsGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 728
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Machine Slots / Media Info'
      Color = clCream
      ParentColor = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
      Layout = tlCenter
    end
    object MachineSlotsRunCommandLabel: TShadowLabel
      Left = 122
      Top = 191
      Width = 81
      Height = 16
      Caption = 'Edit Command'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object MachineSlotsInfoFrame: TShape
      Left = 8
      Top = 217
      Width = 712
      Height = 388
      Brush.Color = 15856113
      Pen.Color = clSilver
    end
    object MachineSlotsInfoTitleLabel: TShadowLabel
      Left = 11
      Top = 218
      Width = 708
      Height = 16
      AutoSize = False
      Caption = 'SYSTEM'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object MachinesListView: TEasyListview
      Left = 8
      Top = 26
      Width = 712
      Height = 154
      CellSizes.Report.Height = 20
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
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000100014E010000FFFFFF1F0001000000
        01000000070000004D0061006300680069006E00650000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        080001010001010000000000016E000000FFFFFF1F0001000000010000000400
        00004E0061006D00650000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
        0139000000FFFFFF1F0001000000010000000200000048007A00000000000000
        000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
        00000080080001010001030000000000016E000000FFFFFF1F00010000000100
        00000800000043006C006F006E00650020006F00660000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        0800010100010400000000000152000000FFFFFF1F0001000000010000000A00
        0000530061007600650020005300740061007400650000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        0800010100010500000000000011000000FFFFFF1F0001000000000000000000
        00000000000000000000}
      Header.Draggable = False
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesSmall = FormMain.IL_StandardIconsSmall
      PaintInfoColumn.CaptionIndent = 0
      PaintInfoGroup.BandBlended = False
      PaintInfoGroup.BandEnabled = False
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.Size = 0
      PaintInfoGroup.MarginBottom.Visible = True
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Size = 20
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ImageIndent = 0
      PaintInfoItem.ShowBorder = False
      ParentShowHint = False
      ShowThemedBorderColor = 14671839
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
      TabStop = False
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnColumnClick = MachinesListViewColumnClick
      OnItemCompare = MachinesListViewItemCompare
      OnItemPaintText = MachinesListViewItemPaintText
      OnItemSelectionChanged = MachinesListViewItemSelectionChanged
    end
    object MachineSlotsRunCommand: TEditEx
      Left = 205
      Top = 188
      Width = 417
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = MachineSlotsRunCommandKeyPress
    end
    object MachineSlotsRunCommandButtonRun: TBitBtnEx
      Left = 625
      Top = 188
      Width = 95
      Height = 21
      Caption = 'Run Command'
      TabOrder = 2
      OnClick = MachineSlotsRunCommandButtonRunClick
    end
    object MachineSlotsInfo: TTntRichEdit
      Left = 10
      Top = 234
      Width = 708
      Height = 369
      OnURLClick = MachineSlotsInfoURLClick
      BorderStyle = bsNone
      Color = 15856113
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
      WordWrap = False
    end
    object MachinesSlotsRadioButton: TAdvOfficeRadioButtonEx
      Left = 8
      Top = 189
      Width = 46
      Height = 20
      Hint = 'Show slots options for the selected machine'
      ShowHint = True
      TabOrder = 4
      TabStop = True
      OnClick = MachinesSlotsRadioButtonClick
      Alignment = taLeftJustify
      Caption = 'Slots'
      Checked = True
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MachinesMediaRadioButton: TAdvOfficeRadioButtonEx
      Left = 57
      Top = 189
      Width = 52
      Height = 20
      Hint = 'Show media options for the selected machine'
      ShowHint = True
      TabOrder = 5
      OnClick = MachinesSlotsRadioButtonClick
      Alignment = taLeftJustify
      Caption = 'Media'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object ButtonMachinesPanelShowHide: TBitBtnEx
    Tag = 1
    Left = 753
    Top = 209
    Width = 18
    Height = 31
    Hint = 'Show/hide machine slots/media info panel'
    Caption = '3'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Marlett'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ButtonMachinesPanelShowHideClick
    CaptionVertIndent = 1
  end
end
