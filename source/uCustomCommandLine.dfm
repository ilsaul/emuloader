object FormCustomCommandLine: TFormCustomCommandLine
  Left = 1141
  Top = 618
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Custom Command Line'
  ClientHeight = 436
  ClientWidth = 550
  Color = clBtnFace
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
    Left = 0
    Top = 52
    Width = 77
    Height = 19
    Caption = ' > File: %s.ini'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsItalic, fsUnderline]
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TImage32
    Left = 0
    Top = 0
    Width = 550
    Height = 52
    Align = alTop
    Bitmap.DrawMode = dmBlend
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Color = clBlack
    ParentColor = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object LabelGameDescription: TShadowLabel
      Left = 56
      Top = 6
      Width = 414
      Height = 41
      AutoSize = False
      Caption = 'Game Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16448250
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      WordWrap = True
    end
  end
  object ParametersBox: TAdvGroupBoxEx
    Left = 8
    Top = 128
    Width = 534
    Height = 217
    RoundEdges = True
    Caption = 
      'Parameters (add spaces, at the end of prefix and/or before the s' +
      'uffix, if needed)'
    Ctl3D = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object LabelPrefixToAdd: TShadowLabel
      Left = 8
      Top = 144
      Width = 71
      Height = 16
      Caption = 'Prefix to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object LabelFieldToAdd: TShadowLabel
      Left = 162
      Top = 144
      Width = 67
      Height = 16
      Caption = 'Field to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object LabelSuffixToAdd: TShadowLabel
      Left = 325
      Top = 144
      Width = 71
      Height = 16
      Caption = 'Suffix to Add'
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object ButtonMoveParameterDown: TBitBtnEx
      Left = 477
      Top = 48
      Width = 49
      Height = 23
      Hint = 'Move selected item down'
      Caption = 'Down'
      TabOrder = 0
      OnClick = ButtonMoveParameterUpClick
    end
    object ButtonParameterDelete: TBitBtnEx
      Left = 477
      Top = 80
      Width = 49
      Height = 23
      Hint = 'Delete selected item'
      Caption = 'Delete'
      TabOrder = 1
      OnClick = ButtonParameterDeleteClick
    end
    object ButtonMoveParameterUp: TBitBtnEx
      Tag = 1
      Left = 477
      Top = 16
      Width = 49
      Height = 23
      Hint = 'Move selected item up'
      Caption = 'Up'
      TabOrder = 2
      OnClick = ButtonMoveParameterUpClick
    end
    object ButtonUpdate: TBitBtnEx
      Left = 477
      Top = 160
      Width = 49
      Height = 23
      Hint = 
        'Edit the prefix, field, suffix and quotes of the selected parame' +
        'ter'
      Caption = 'Update'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonUpdateClick
    end
    object PrefixToAdd: TEditEx
      Left = 8
      Top = 160
      Width = 145
      Height = 23
      Hint = 'Prefix for the parameter (not required)'
      Color = 16448250
      TabOrder = 4
      OnEnter = EmulatorBatchFileEnter
      OnExit = EmulatorBatchFileExit
    end
    object FieldToAdd: TComboBoxEx
      Left = 162
      Top = 160
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
      Color = 16448250
      ItemHeight = 16
      TabOrder = 5
      DropDownCount = 8
    end
    object SuffixToAdd: TEditEx
      Left = 325
      Top = 160
      Width = 145
      Height = 23
      Hint = 'Prefix for the parameter (not required)'
      Color = 16448250
      TabOrder = 6
      OnEnter = EmulatorBatchFileEnter
      OnExit = EmulatorBatchFileExit
    end
    object ButtonAddParameter: TBitBtnEx
      Left = 477
      Top = 112
      Width = 49
      Height = 23
      Hint = 'Add a new parameter to the list'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = ButtonAddParameterClick
    end
    object ParameterSurroundWithQuotes: TAdvOfficeCheckBoxEx
      Left = 162
      Top = 192
      Width = 121
      Height = 17
      Hint = 'Surround the parameter with quotes (excluding the prefix)'
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Field With Quotes'
      ReturnIsTab = False
    end
    object PrefixSendLeadingSpace: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 192
      Width = 129
      Height = 17
      Hint = 
        'Add a blank space before the prefix, even if prefix is empty (re' +
        'commended)'
      Checked = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Send Leading Space'
      ReturnIsTab = False
      State = cbChecked
    end
    object ParametersListView: TEasyListview
      Tag = 1
      Left = 8
      Top = 17
      Width = 462
      Height = 121
      BackGround.Enabled = True
      CellSizes.List.Height = 18
      CellSizes.Report.Height = 18
      Color = 16448250
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000081000000FFFFFF1F0001000000
        0100000006000000500072006500660069007800000000000000000000000000
        110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
        010100010100000000000081000000FFFFFF1F00010000000100000005000000
        4600690065006C00640000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
        0081000000FFFFFF1F0001000000010000000600000053007500660066006900
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
      TabOrder = 10
      View = elsReport
      OnItemPaintText = ParametersListViewItemPaintText
      OnItemSelectionChanged = ParametersListViewItemSelectionChanged
      OnKeyAction = ParametersListViewKeyAction
    end
  end
  object AdditionalParametersBox: TAdvGroupBoxEx
    Left = 8
    Top = 352
    Width = 534
    Height = 49
    RoundEdges = True
    Caption = 
      'Additional Parameters (will be added at the end of the command l' +
      'ine)'
    Ctl3D = True
    TabOrder = 2
    object AdditionalParameters: TEditEx
      Left = 8
      Top = 17
      Width = 518
      Height = 23
      Hint = 'Type the parameters, surrounded by quotes if it has long name'
      Color = 16448250
      TabOrder = 0
      OnEnter = EmulatorBatchFileEnter
      OnExit = EmulatorBatchFileExit
    end
  end
  object BottomBar: TImage32
    Left = 0
    Top = 409
    Width = 550
    Height = 27
    Align = alBottom
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 3
    object ButtonReload: TBitBtnEx
      Left = 2
      Top = 2
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
      Left = 73
      Top = 2
      Width = 49
      Height = 23
      Hint = 'Empty filename and all parameters'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonClearCustomCommandLineClick
    end
    object ButtonPreview: TBitBtnEx
      Left = 125
      Top = 2
      Width = 68
      Height = 23
      Hint = 'Shows a preview of the final command line'
      Caption = 'Preview'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonPreviewClick
    end
    object ButtonOk: TBitBtnEx
      Left = 409
      Top = 2
      Width = 68
      Height = 23
      Hint = 'Close and update settings'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TBitBtnEx
      Left = 480
      Top = 2
      Width = 68
      Height = 23
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object LabelCustomEmulatorFile: TAdvGroupBoxEx
    Left = 8
    Top = 72
    Width = 534
    Height = 49
    RoundEdges = True
    Caption = 'Emulator File / Batch File (full path, no quotes)'
    Ctl3D = True
    TabOrder = 4
    object EmulatorBatchFile: TEditEx
      Left = 8
      Top = 17
      Width = 462
      Height = 23
      Color = 16448250
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EmulatorBatchFileEnter
      OnExit = EmulatorBatchFileExit
    end
    object ButtonEmulatorBatchFileBrowse: TBitBtnEx
      Left = 477
      Top = 17
      Width = 49
      Height = 23
      Hint = 'Click here to select a file'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonEmulatorBatchFileBrowseClick
    end
  end
end
