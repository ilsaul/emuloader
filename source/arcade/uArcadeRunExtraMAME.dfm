object FormArcadeRunGameExtraMAME: TFormArcadeRunGameExtraMAME
  Left = 756
  Top = 449
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Run with Extra Parameters'
  ClientHeight = 497
  ClientWidth = 819
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PageButtonInput: TSpeedButtonEx
    Tag = 1
    Left = 4
    Top = 86
    Width = 179
    Height = 25
    GroupIndex = 1
    Down = True
    Caption = 'Playback/Record an Input File'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = PageButtonInputClick
    GradientColorTop_Down = 10905138
    GradientColorBottom_Down = 9196326
    FrameColor_Down = clBlack
  end
  object PageButtonSaveState: TSpeedButtonEx
    Tag = 2
    Left = 182
    Top = 89
    Width = 109
    Height = 22
    GroupIndex = 1
    Caption = 'Load a Save State'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = PageButtonInputClick
    GradientColorTop_Down = 10905138
    GradientColorBottom_Down = 9196326
    FrameColor_Down = clBlack
  end
  object PageButtonMemoryCard: TSpeedButtonEx
    Tag = 3
    Left = 290
    Top = 89
    Width = 121
    Height = 22
    GroupIndex = 1
    Caption = 'Insert Memory Card'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = PageButtonInputClick
    GradientColorTop_Down = 10905138
    GradientColorBottom_Down = 9196326
    FrameColor_Down = clBlack
  end
  object PageButtonRecordMovie: TSpeedButtonEx
    Tag = 4
    Left = 410
    Top = 89
    Width = 206
    Height = 22
    GroupIndex = 1
    Caption = 'Record Current Section to a Movie'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    OnClick = PageButtonInputClick
    GradientColorTop_Down = 10905138
    GradientColorBottom_Down = 9196326
    FrameColor_Down = clBlack
  end
  object PagesButtonBottomLine: TBevelEx
    Left = 2
    Top = 108
    Width = 616
    Height = 2
    Shape = bsTopLine
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 819
    Height = 80
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object GameIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 0
      Width = 708
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
      ShadowColor = clMaroon
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameName: TShadowLabel
      Left = 106
      Top = 45
      Width = 488
      Height = 27
      Caption = 
        'gamename [clone of parentname] [bios: biosname] [merged set] [so' +
        'ftlist: filename]'#13#10'Emulator version'
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
    object SystemIcon: TImage
      Left = 76
      Top = 46
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelSoftwareListTitle: TShadowLabel
      Left = 531
      Top = 35
      Width = 79
      Height = 14
      Caption = '[softlist title] '
      Font.Charset = ANSI_CHARSET
      Font.Color = 21414
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
      Visible = False
    end
    object LabelMachineInUse: TShadowLabel
      Left = 210
      Top = 36
      Width = 281
      Height = 14
      Caption = 'Run with machine [machinename]: Machine Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 21414
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
      Visible = False
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 456
    Width = 819
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
    object LabelInfo: TShadowLabel
      Left = 56
      Top = 12
      Width = 309
      Height = 19
      Caption = 'Check features you want to use. Uncheck to disable.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
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
    object ButtonOk: TBitBtnEx
      Left = 620
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonAbort: TBitBtnEx
      Left = 723
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object NotebookPages: TNotebook
    Tag = 1
    Left = 0
    Top = 111
    Width = 819
    Height = 345
    Color = clWhite
    PageIndex = 1
    ParentColor = False
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Input'
      object LabelInputFileName: TShadowLabel
        Left = 8
        Top = 319
        Width = 209
        Height = 16
        Caption = 'Selected File (file extension optional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3289650
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object Enabled_PlaybackRecordInput: TAdvOfficeCheckBox
        Left = 24
        Top = 2
        Width = 64
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        OnClick = Enabled_PlaybackRecordInputClick
        Alignment = taLeftJustify
        Caption = 'Enabled'
        ReturnIsTab = False
        Themed = True
      end
      object InputPlayback: TAdvOfficeRadioButton
        Left = 8
        Top = 22
        Width = 70
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = InputPlaybackClick
        Alignment = taLeftJustify
        Caption = 'Playback'
        Checked = True
        ReturnIsTab = False
        Themed = True
      end
      object InputFileName: TEditEx
        Left = 222
        Top = 316
        Width = 464
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = InputFileNameKeyPress
      end
      object InputRecord: TAdvOfficeRadioButton
        Tag = 1
        Left = 84
        Top = 22
        Width = 61
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = InputPlaybackClick
        Alignment = taLeftJustify
        Caption = 'Record'
        ReturnIsTab = False
        Themed = True
      end
      object InputExitEmulatorAfterInputPlayback: TAdvOfficeCheckBox
        Left = 170
        Top = 22
        Width = 199
        Height = 18
        Hint = 'To be used with playback input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        Caption = 'Exit Emulator After Input Playback'
        ReturnIsTab = False
        Themed = True
      end
      object InputRecordTimecodeFile: TAdvOfficeCheckBox
        Left = 366
        Top = 22
        Width = 183
        Height = 18
        Hint = 'To be used with record input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        Alignment = taLeftJustify
        Caption = 'Record an Input Timecode File'
        ReturnIsTab = False
        Themed = True
      end
      object ButtonInputResetFileName: TBitBtnEx
        Left = 688
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to reset filename to game name'
        Caption = 'Reset'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = ButtonInputResetFileNameClick
      end
      object ButtonInputResetFileNameTitle: TBitBtnEx
        Tag = 1
        Left = 732
        Top = 316
        Width = 80
        Height = 21
        Hint = 'Click here to reset filename to game title (no unicode support)'
        Caption = 'Reset to Title'
        Enabled = False
        TabOrder = 8
      end
      object PanelInputListView: TPanelEx
        Left = 8
        Top = 42
        Width = 803
        Height = 272
        Color1 = clWhite
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = 7891291
        EnableCustomBorder = ecbSingle
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelInputSelectedFileFolder: TShadowLabel
          Left = 0
          Top = 246
          Width = 801
          Height = 24
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSilver
          ShadowEnabled = False
          EllipsType = etPathEllips
          ColorFrame = clSilver
          ColorInnerFrame = clBlack
          Frames = [lfrTop]
          Transparent = False
          Layout = tlCenter
        end
        object InputListView: TEasyListview
          Left = 0
          Top = 0
          Width = 801
          Height = 246
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 20
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000001000162010000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            0100000000000178000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE000600000080080001010001020000000000017D000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01C6000000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupELV
          ShowThemedBorder = False
          ShowHint = False
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
          OnColumnClick = InputListViewColumnClick
          OnItemCompare = InputListViewItemCompare
          OnItemEdited = InputListViewItemEdited
          OnItemEditEnd = InputListViewItemEditEnd
          OnItemSelectionChanged = InputListViewItemSelectionChanged
          OnKeyAction = InputListViewKeyAction
        end
      end
      object PanelDisabledInput: TPanel
        Left = 100
        Top = 1
        Width = 89
        Height = 11
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 7
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'SaveState'
      object LabelLoadSaveStateNotSupportedMsg: TShadowLabel
        Left = 352
        Top = 6
        Width = 459
        Height = 13
        Caption = 'Save states are not officially supported by this machine!'
        Font.Charset = OEM_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Terminal'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object Enabled_LoadSaveState: TAdvOfficeCheckBox
        Left = 24
        Top = 2
        Width = 64
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        OnClick = Enabled_LoadSaveStateClick
        Alignment = taLeftJustify
        Caption = 'Enabled'
        ReturnIsTab = False
        Themed = True
      end
      object AutoSaveState: TAdvOfficeCheckBox
        Left = 100
        Top = 2
        Width = 104
        Height = 18
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = True
        TabOrder = 2
        Visible = False
        Alignment = taLeftJustify
        Caption = 'Auto Save State'
        ReturnIsTab = False
        Themed = True
      end
      object PanelSaveStateListView: TPanelEx
        Left = 8
        Top = 22
        Width = 803
        Height = 315
        Color1 = clWhite
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = 7891291
        EnableCustomBorder = ecbSingle
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelSaveStateSelectedFileFolder: TShadowLabel
          Left = 0
          Top = 289
          Width = 801
          Height = 24
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSilver
          ShadowEnabled = False
          EllipsType = etPathEllips
          ColorFrame = clSilver
          ColorInnerFrame = clBlack
          Frames = [lfrTop]
          Transparent = False
          Layout = tlCenter
        end
        object SaveStateListView: TEasyListview
          Left = 0
          Top = 0
          Width = 801
          Height = 289
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 20
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
            000600000080080001010001000000000100012A020000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            0100000000000178000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE000600000080080001010001020000000000017D000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            69006600690065006400000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupELV
          ShowThemedBorder = False
          ShowHint = False
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
          OnColumnClick = SaveStateListViewColumnClick
          OnItemCompare = SaveStateListViewItemCompare
          OnItemEdited = SaveStateListViewItemEdited
          OnItemEditEnd = SaveStateListViewItemEditEnd
          OnItemSelectionChanged = SaveStateListViewItemSelectionChanged
          OnKeyAction = SaveStateListViewKeyAction
        end
      end
      object PanelDisabledSaveState: TPanel
        Left = 104
        Top = 0
        Width = 89
        Height = 11
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 1
      end
      object PanelDisabledSaveStateNotSupportedMsg: TPanel
        Left = 232
        Top = 1
        Width = 89
        Height = 20
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'MemoryCard'
      object LabelInsertMemoryCard_Slot4: TShadowLabel
        Left = 8
        Top = 109
        Width = 32
        Height = 16
        Caption = 'Slot 4'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object LabelInsertMemoryCard_Slot3: TShadowLabel
        Left = 8
        Top = 82
        Width = 32
        Height = 16
        Caption = 'Slot 3'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object LabelInsertMemoryCard_Slot1: TShadowLabel
        Left = 8
        Top = 28
        Width = 32
        Height = 16
        Caption = 'Slot 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object LabelInsertMemoryCard_Slot2: TShadowLabel
        Left = 8
        Top = 55
        Width = 32
        Height = 16
        Caption = 'Slot 2'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
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
      object ButtonInsertMemoryCard_Slot4_Clear: TBitBtnEx
        Left = 768
        Top = 107
        Width = 43
        Height = 21
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnClick = ButtonInsertMemoryCard_Slot4_ClearClick
      end
      object ButtonInsertMemoryCard_Slot4_LastUsed: TBitBtnEx
        Left = 704
        Top = 107
        Width = 64
        Height = 21
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = ButtonInsertMemoryCard_Slot4_LastUsedClick
      end
      object ButtonInsertMemoryCard_Slot4_SelectFile: TBitBtnEx
        Left = 656
        Top = 107
        Width = 47
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnClick = ButtonInsertMemoryCard_Slot4_SelectFileClick
      end
      object ButtonInsertMemoryCard_Slot3_LastUsed: TBitBtnEx
        Left = 704
        Top = 80
        Width = 64
        Height = 21
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = ButtonInsertMemoryCard_Slot3_LastUsedClick
      end
      object ButtonInsertMemoryCard_Slot3_Clear: TBitBtnEx
        Left = 768
        Top = 80
        Width = 43
        Height = 21
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnClick = ButtonInsertMemoryCard_Slot3_ClearClick
      end
      object ButtonInsertMemoryCard_Slot3_SelectFile: TBitBtnEx
        Left = 656
        Top = 80
        Width = 47
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = ButtonInsertMemoryCard_Slot3_SelectFileClick
      end
      object InsertMemoryCard_Slot4: TEditEx
        Left = 40
        Top = 107
        Width = 614
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 4
        OnKeyPress = InsertMemoryCard_Slot4KeyPress
      end
      object InsertMemoryCard_Slot3: TEditEx
        Left = 40
        Top = 80
        Width = 614
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = InsertMemoryCard_Slot3KeyPress
      end
      object Enabled_InsertMemoryCard: TAdvOfficeCheckBox
        Left = 24
        Top = 2
        Width = 64
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        OnClick = Enabled_InsertMemoryCardClick
        Alignment = taLeftJustify
        Caption = 'Enabled'
        ReturnIsTab = False
        Themed = True
      end
      object InsertMemoryCard_Slot1: TEditEx
        Left = 40
        Top = 26
        Width = 614
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 1
        OnKeyPress = InsertMemoryCard_Slot1KeyPress
      end
      object InsertMemoryCard_Slot2: TEditEx
        Left = 40
        Top = 53
        Width = 614
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 2
        OnKeyPress = InsertMemoryCard_Slot2KeyPress
      end
      object ButtonInsertMemoryCard_Slot1_SelectFile: TBitBtnEx
        Left = 656
        Top = 26
        Width = 47
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = ButtonInsertMemoryCard_Slot1_SelectFileClick
      end
      object ButtonInsertMemoryCard_Slot1_Clear: TBitBtnEx
        Left = 769
        Top = 26
        Width = 43
        Height = 21
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = ButtonInsertMemoryCard_Slot1_ClearClick
      end
      object ButtonInsertMemoryCard_Slot1_LastUsed: TBitBtnEx
        Left = 704
        Top = 26
        Width = 64
        Height = 21
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = ButtonInsertMemoryCard_Slot1_LastUsedClick
      end
      object ButtonInsertMemoryCard_Slot2_SelectFile: TBitBtnEx
        Left = 656
        Top = 53
        Width = 47
        Height = 21
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = ButtonInsertMemoryCard_Slot2_SelectFileClick
      end
      object ButtonInsertMemoryCard_Slot2_LastUsed: TBitBtnEx
        Left = 704
        Top = 53
        Width = 64
        Height = 21
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = ButtonInsertMemoryCard_Slot2_LastUsedClick
      end
      object ButtonInsertMemoryCard_Slot2_Clear: TBitBtnEx
        Left = 769
        Top = 53
        Width = 43
        Height = 21
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = ButtonInsertMemoryCard_Slot2_ClearClick
      end
      object MemoryCardFileFolderPanel: TPanelEx
        Left = 8
        Top = 135
        Width = 803
        Height = 202
        Color1 = clWhite
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = 7891291
        EnableCustomBorder = ecbSingle
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelMemoryCardSelectedFileFolder: TShadowLabel
          Left = 0
          Top = 176
          Width = 801
          Height = 24
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSilver
          ShadowEnabled = False
          EllipsType = etPathEllips
          ColorFrame = clSilver
          ColorInnerFrame = clBlack
          Frames = [lfrTop]
          Transparent = False
          Layout = tlCenter
        end
        object MemoryCardListView: TEasyListview
          Left = 0
          Top = 0
          Width = 801
          Height = 176
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 20
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000001000162010000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            0100000000000178000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE000600000080080001010001020000000000017D000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01CA000000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupELV
          ShowThemedBorder = False
          ShowHint = False
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
          OnColumnClick = MemoryCardListViewColumnClick
          OnDblClick = MemoryCardListViewDblClick
          OnItemCompare = MemoryCardListViewItemCompare
          OnItemEdited = MemoryCardListViewItemEdited
          OnItemEditEnd = MemoryCardListViewItemEditEnd
          OnItemSelectionChanged = MemoryCardListViewItemSelectionChanged
          OnKeyAction = MemoryCardListViewKeyAction
        end
      end
      object PanelDisabledMemoryCard: TPanel
        Left = 104
        Top = 0
        Width = 89
        Height = 11
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 11
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 3
      Caption = 'RecordMovie'
      object LabelRecordMovieFileName: TShadowLabel
        Left = 8
        Top = 319
        Width = 202
        Height = 16
        Caption = 'File to Save (file extension optional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object LabelRecordMovieRootFolder: TShadowLabel
        Left = 234
        Top = 23
        Width = 575
        Height = 19
        Hint = 'Root folder:'
        AutoSize = False
        Caption = 'Root folder:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = clSilver
        ShadowEnabled = False
        EllipsType = etPathEllips
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
      end
      object Enabled_RecordMovie: TAdvOfficeCheckBox
        Left = 24
        Top = 2
        Width = 64
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        OnClick = Enabled_RecordMovieClick
        Alignment = taLeftJustify
        Caption = 'Enabled'
        ReturnIsTab = False
        Themed = True
      end
      object ButtonRecordMovieResetFileNameTitle: TBitBtnEx
        Tag = 1
        Left = 732
        Top = 316
        Width = 80
        Height = 21
        Hint = 'Click here to reset filename to game title (no unicode support)'
        Caption = 'Reset to Title'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonRecordMovieResetFileNameClick
      end
      object ButtonRecordMovieResetFileName: TBitBtnEx
        Left = 688
        Top = 316
        Width = 43
        Height = 21
        Hint = 'Click here to reset filename to game name'
        Caption = 'Reset'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonRecordMovieResetFileNameClick
      end
      object RecordMovieFileName: TEditEx
        Left = 211
        Top = 316
        Width = 474
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = RecordMovieFileNameChange
        OnKeyPress = RecordMovieFileNameKeyPress
      end
      object RecordMovieWAV: TAdvOfficeRadioButton
        Tag = 2
        Left = 155
        Top = 22
        Width = 72
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = RecordMovieAVIClick
        Alignment = taLeftJustify
        Caption = 'WAV File'
        ReturnIsTab = False
        Themed = True
      end
      object RecordMovieMNG: TAdvOfficeRadioButton
        Tag = 1
        Left = 76
        Top = 22
        Width = 73
        Height = 18
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = RecordMovieAVIClick
        Alignment = taLeftJustify
        Caption = 'MNG File'
        ReturnIsTab = False
        Themed = True
      end
      object RecordMovieAVI: TAdvOfficeRadioButton
        Left = 8
        Top = 22
        Width = 64
        Height = 18
        Hint = 'Uncompressed video/audio, huge space disk required!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 6
        TabStop = True
        OnClick = RecordMovieAVIClick
        Alignment = taLeftJustify
        Caption = 'AVI File'
        Checked = True
        ReturnIsTab = False
        Themed = True
      end
      object PanelRecordMovieListView: TPanelEx
        Left = 8
        Top = 42
        Width = 803
        Height = 272
        Color1 = clWhite
        Color2 = clSilver
        Color3 = clYellow
        Color4 = clTeal
        ColorFrame = clSilver
        ColorInnerFrame = 7891291
        EnableCustomBorder = ecbSingle
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelRecordMovieSelectedFileFolder: TShadowLabel
          Left = 0
          Top = 246
          Width = 801
          Height = 24
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = clSilver
          ShadowEnabled = False
          EllipsType = etPathEllips
          ColorFrame = clSilver
          ColorInnerFrame = clBlack
          Frames = [lfrTop]
          Transparent = False
          Layout = tlCenter
        end
        object RecordMovieListView: TEasyListview
          Left = 0
          Top = 0
          Width = 801
          Height = 246
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 20
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -12
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -12
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            0006000000800800010100010000000001000162010000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            0100000000000178000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE000600000080080001010001020000000000017D000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01CA000000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -12
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 23
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
          PaintInfoColumn.Border = 2
          PaintInfoColumn.CaptionIndent = 0
          PaintInfoGroup.Expandable = False
          PaintInfoGroup.MarginBottom.CaptionIndent = 4
          PaintInfoItem.BorderColor = 16370824
          PaintInfoItem.ShowBorder = False
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupELV
          ShowThemedBorder = False
          ShowHint = False
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
          OnColumnClick = RecordMovieListViewColumnClick
          OnItemCompare = RecordMovieListViewItemCompare
          OnItemEdited = RecordMovieListViewItemEdited
          OnItemEditEnd = RecordMovieListViewItemEditEnd
          OnItemSelectionChanged = RecordMovieListViewItemSelectionChanged
          OnKeyAction = RecordMovieListViewKeyAction
        end
      end
      object PanelDisabledRecordMovie: TPanel
        Left = 100
        Top = 1
        Width = 89
        Height = 11
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 7
      end
    end
  end
  object PopupELV: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    OnPopup = PopupELVPopup
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
    Left = 664
    Top = 72
    object PopupMemoryCardAssignToSlot1: TMenuItem
      Tag = 1
      Caption = 'Assign to Slot 1'
      OnClick = PopupMemoryCardAssignToSlot1Click
    end
    object PopupMemoryCardAssignToSlot2: TMenuItem
      Tag = 2
      Caption = 'Assign to Slot 2'
      OnClick = PopupMemoryCardAssignToSlot1Click
    end
    object PopupMemoryCardAssignToSlot3: TMenuItem
      Tag = 3
      Caption = 'Assign to Slot 3'
      OnClick = PopupMemoryCardAssignToSlot1Click
    end
    object PopupMemoryCardAssignToSlot4: TMenuItem
      Tag = 4
      Caption = 'Assign to Slot 4'
      OnClick = PopupMemoryCardAssignToSlot1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupInputRenameFile: TMenuItem
      Caption = 'Rename File'
      ImageIndex = 15
      OnClick = PopupInputRenameFileClick
    end
    object PopupInputDeleteFile: TMenuItem
      Caption = 'Delete File'
      ImageIndex = 14
      OnClick = PopupInputDeleteFileClick
    end
  end
end
