object FormCustomCommandLine: TFormCustomCommandLine
  Left = 961
  Top = 512
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Custom Command Line'
  ClientHeight = 717
  ClientWidth = 904
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelIniFile: TShadowLabel
    Left = 8
    Top = 84
    Width = 71
    Height = 19
    Caption = ' > File: %s.ini'
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
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 904
    Height = 80
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
      Width = 790
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
      Height = 27
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Supermode' +
        'l: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 2012)'
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
      Layout = tlCenter
    end
    object LabelScanMode: TShadowLabel
      Left = 779
      Top = 45
      Width = 118
      Height = 29
      Hint = 'Scan Mode'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Scan Mode'#13#10'Force Game Available'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -12
      Font.Name = 'Tahoma'
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
      WordWrap = True
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 676
    Width = 904
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
    object ButtonReload: TBitBtnEx
      Left = 8
      Top = 8
      Width = 68
      Height = 23
      Hint = 'Load settings from file'
      Caption = 'Reload'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonReloadClick
    end
    object ButtonClearCustomCommandLine: TBitBtnEx
      Left = 79
      Top = 8
      Width = 49
      Height = 23
      Hint = 'Empty filename and all parameters'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonClearCustomCommandLineClick
    end
    object ButtonOk: TBitBtnEx
      Left = 755
      Top = 8
      Width = 68
      Height = 23
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 826
      Top = 8
      Width = 68
      Height = 23
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object EmulatorBatchFileGroupBox: TPanelEx
    Left = 8
    Top = 112
    Width = 888
    Height = 57
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
    Visible = False
    object EmulatorBatchFileGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 886
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Emulator File / Batch File (full path, no quotes)'
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
    object EmulatorBatchFile: TEditEx
      Left = 8
      Top = 24
      Width = 820
      Height = 23
      Color = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object EmulatorBatchFileButtonSelect: TBitBtnEx
      Left = 831
      Top = 24
      Width = 49
      Height = 23
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = EmulatorBatchFileButtonSelectClick
    end
  end
  object ParametersGroupBox: TPanelEx
    Left = 8
    Top = 192
    Width = 888
    Height = 225
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
    Visible = False
    object ParametersGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 886
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 
        'Parameters (add spaces, at the end of prefix and/or before the s' +
        'uffix, if needed)'
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
    object LabelSuffixToAdd: TShadowLabel
      Left = 493
      Top = 151
      Width = 70
      Height = 16
      Caption = 'Suffix to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object LabelFieldToAdd: TShadowLabel
      Left = 290
      Top = 151
      Width = 65
      Height = 16
      Caption = 'Field to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object LabelPrefixToAdd: TShadowLabel
      Left = 8
      Top = 151
      Width = 70
      Height = 16
      Caption = 'Prefix to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object ParametersListView: TEasyListview
      Tag = 1
      Left = 8
      Top = 24
      Width = 710
      Height = 121
      BackGround.Enabled = True
      CellSizes.List.Height = 18
      CellSizes.Report.Height = 18
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000000FA000000FFFFFF1F0001000000
        0100000006000000500072006500660069007800000000000000000000000000
        110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
        010100010100000000000081000000FFFFFF1F00010000000100000005000000
        4600690065006C00640000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
        00FA000000FFFFFF1F0001000000010000000600000053007500660066006900
        7800000000000000000000000000110000005445617379436F6C756D6E53746F
        726564FFFECE0006000000800800010100010300000000000037000000FFFFFF
        1F00010000000100000006000000510075006F00740065007300000000000000
        000000000000}
      Header.Draggable = False
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.Border = 1
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CaptionIndent = 2
      PaintInfoItem.ShowBorder = False
      ParentShowHint = False
      ShowHint = True
      Selection.AlphaBlend = True
      Selection.BlendColorSelRect = 10902593
      Selection.BlendIcon = False
      Selection.BorderColor = 10902593
      Selection.BorderColorSelRect = 10902593
      Selection.Color = 10902593
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.Gradient = True
      Selection.GradientColorBottom = 16506264
      Selection.GradientColorTop = 15582647
      Selection.InactiveBorderColor = 10902593
      Selection.InactiveColor = 15582647
      Selection.InactiveTextColor = clBtnShadow
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.RoundRect = True
      Selection.RoundRectRadius = 2
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnItemPaintText = ParametersListViewItemPaintText
      OnItemSelectionChanged = ParametersListViewItemSelectionChanged
      OnKeyAction = ParametersListViewKeyAction
    end
    object ButtonMoveParameterUp: TBitBtnEx
      Tag = 1
      Left = 725
      Top = 23
      Width = 49
      Height = 23
      Hint = 'Move selected item up'
      Caption = 'Up'
      TabOrder = 1
      OnClick = ButtonMoveParameterUpClick
    end
    object ButtonMoveParameterDown: TBitBtnEx
      Left = 725
      Top = 55
      Width = 49
      Height = 23
      Hint = 'Move selected item down'
      Caption = 'Down'
      TabOrder = 2
      OnClick = ButtonMoveParameterUpClick
    end
    object ButtonParameterDelete: TBitBtnEx
      Left = 725
      Top = 87
      Width = 49
      Height = 23
      Hint = 'Delete selected item'
      Caption = 'Delete'
      TabOrder = 3
      OnClick = ButtonParameterDeleteClick
    end
    object ButtonAddParameter: TBitBtnEx
      Left = 725
      Top = 119
      Width = 49
      Height = 23
      Hint = 'Add a new parameter to the list'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonAddParameterClick
    end
    object ButtonUpdate: TBitBtnEx
      Left = 725
      Top = 167
      Width = 49
      Height = 23
      Hint = 
        'Edit the prefix, field, suffix and quotes of the selected parame' +
        'ter'
      Caption = 'Update'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonUpdateClick
    end
    object SuffixToAdd: TEditEx
      Left = 493
      Top = 167
      Width = 220
      Height = 23
      Hint = 'Prefix for the parameter (not required)'
      Color = clWhite
      TabOrder = 6
    end
    object FieldToAdd: TComboBoxEx
      Left = 290
      Top = 167
      Width = 153
      Height = 24
      Hint = 'Fields list'
      ItemsEx = <
        item
          Caption = 'Game Title'
          ImageIndex = 0
          SelectedImageIndex = 0
        end
        item
          Caption = 'Name'
          ImageIndex = 9
          SelectedImageIndex = 9
        end
        item
          Caption = 'Clone of'
          ImageIndex = 10
          SelectedImageIndex = 10
        end
        item
          Caption = 'Driver Name'
          ImageIndex = 11
          SelectedImageIndex = 11
        end>
      Style = csExDropDownList
      Color = clWhite
      ItemHeight = 16
      TabOrder = 7
      DropDownCount = 8
    end
    object PrefixToAdd: TEditEx
      Left = 8
      Top = 167
      Width = 220
      Height = 23
      Hint = 'Prefix for the parameter (not required)'
      Color = clWhite
      TabOrder = 8
    end
    object PrefixSendLeadingSpace: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 199
      Width = 397
      Height = 17
      Hint = 
        'Add a blank space before the prefix, even if prefix is empty (re' +
        'commended)'
      Checked = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 
        'Add a Blank Space Before Prefix, Even If Prefix is Empty (recomm' +
        'ended)'
      ReturnIsTab = False
      State = cbChecked
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ParameterSurroundWithQuotes: TAdvOfficeCheckBoxEx
      Left = 437
      Top = 199
      Width = 285
      Height = 17
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'Surround Parameter With Quotes (Prefix Excluded)'
      ReturnIsTab = False
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object AdditionalParametersGroupBox: TPanelEx
    Left = 8
    Top = 440
    Width = 888
    Height = 57
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
    Visible = False
    object AdditionalParametersGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 886
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Additional Parameters (added at the end of the command line)'
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
    object AdditionalParametersButtonClear: TBitBtnEx
      Left = 744
      Top = 24
      Width = 49
      Height = 23
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = AdditionalParametersButtonClearClick
    end
    object AdditionalParameters: TEditEx
      Left = 8
      Top = 24
      Width = 729
      Height = 23
      Hint = 'Type the parameters, surrounded by quotes if it has long name'
      Color = clWhite
      TabOrder = 1
    end
  end
  object CommandLinePreviewGroupBox: TPanelEx
    Left = 8
    Top = 517
    Width = 888
    Height = 148
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
    Visible = False
    object CommandLinePreviewGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 886
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Full Command Line Preview'
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
    object CommandLinePreview: TMemo
      Left = 8
      Top = 24
      Width = 785
      Height = 113
      Color = 15856113
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object PanelEx1: TPanelEx
    Left = 512
    Top = 85
    Width = 287
    Height = 96
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
    Visible = False
    object ShadowLabel1: TShadowLabel
      Left = 0
      Top = 0
      Width = 285
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Sample Box'
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
  end
end
