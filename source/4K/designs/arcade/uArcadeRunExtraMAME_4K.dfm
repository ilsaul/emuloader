object FormArcadeRunGameExtraMAME4K: TFormArcadeRunGameExtraMAME4K
  Left = 756
  Top = 449
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Run with Extra Parameters (4K)'
  ClientHeight = 1075
  ClientWidth = 1800
  Color = clWhite
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
  object PageButtonInput: TSpeedButtonEx
    Tag = 1
    Left = 9
    Top = 164
    Width = 300
    Height = 45
    GroupIndex = 1
    Down = True
    Caption = 'Playback/Record an Input File'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object PageButtonSaveState: TSpeedButtonEx
    Tag = 2
    Left = 308
    Top = 173
    Width = 182
    Height = 36
    GroupIndex = 1
    Caption = 'Load a Save State'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object PageButtonMemoryCard: TSpeedButtonEx
    Tag = 3
    Left = 489
    Top = 173
    Width = 200
    Height = 36
    GroupIndex = 1
    Caption = 'Insert Memory Card'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object PageButtonRecordMovie: TSpeedButtonEx
    Tag = 4
    Left = 688
    Top = 173
    Width = 335
    Height = 36
    GroupIndex = 1
    Caption = 'Record Current Section to a Movie'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3289650
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object PagesButtonBottomLine: TBevelEx
    Left = 2
    Top = 206
    Width = 1028
    Height = 2
    Shape = bsTopLine
    CustomColor1 = clBlack
    CustomColor2 = clBlack
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1800
    Height = 150
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    ColorInnerFrame = clGreen
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSimple
    object GameIcon: TImage
      Left = 4
      Top = 4
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 144
      Top = 0
      Width = 1640
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 199
      Top = 84
      Width = 822
      Height = 47
      Caption = 
        'gamename [clone of parentname] [bios: biosname] [merged set] [so' +
        'ftlist: filename]'#13#10'Emulator version'
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
    object SystemIcon: TImage
      Left = 143
      Top = 84
      Width = 48
      Height = 48
      Transparent = True
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 1004
    Width = 1800
    Height = 71
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object LabelInfo: TShadowLabel
      Left = 24
      Top = 24
      Width = 515
      Height = 28
      Caption = 'Check features you want to use. Uncheck to disable.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
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
      Left = 1446
      Top = 16
      Width = 168
      Height = 45
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonAbort: TBitBtnEx
      Left = 1623
      Top = 16
      Width = 168
      Height = 45
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
    Top = 219
    Width = 1800
    Height = 785
    Color = clWhite
    PageIndex = 3
    ParentColor = False
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Input'
      object LabelInputFileName: TShadowLabel
        Left = 10
        Top = 730
        Width = 353
        Height = 31
        Caption = 'Selected File (file extension optional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3289650
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
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
      object Enabled_PlaybackRecordInput: TAdvOfficeCheckBoxEx
        Left = 36
        Top = 1
        Width = 110
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enabled'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InputPlayback: TAdvOfficeRadioButtonEx
        Left = 10
        Top = 40
        Width = 120
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Playback'
        Checked = True
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InputFileName: TEditEx
        Left = 369
        Top = 730
        Width = 1180
        Height = 36
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 2
      end
      object InputRecord: TAdvOfficeRadioButtonEx
        Tag = 1
        Left = 152
        Top = 40
        Width = 100
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Record'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InputExitEmulatorAfterInputPlayback: TAdvOfficeCheckBoxEx
        Left = 309
        Top = 40
        Width = 350
        Height = 36
        Hint = 'To be used with playback input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Exit Emulator After Input Playback'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InputRecordTimecodeFile: TAdvOfficeCheckBoxEx
        Left = 676
        Top = 40
        Width = 315
        Height = 36
        Hint = 'To be used with record input'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Record an Input Timecode File'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ButtonInputResetFileName: TBitBtnEx
        Left = 1552
        Top = 730
        Width = 89
        Height = 36
        Hint = 'Click here to reset filename to game name'
        Caption = 'Reset'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object ButtonInputResetFileNameTitle: TBitBtnEx
        Tag = 1
        Left = 1642
        Top = 730
        Width = 149
        Height = 36
        Hint = 'Click here to reset filename to game title (no unicode support)'
        Caption = 'Reset to Title'
        Enabled = False
        TabOrder = 8
      end
      object PanelInputListView: TPanelEx
        Left = 10
        Top = 80
        Width = 1780
        Height = 640
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
          Top = 601
          Width = 1778
          Height = 37
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Width = 1778
          Height = 601
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 37
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          GroupFont.Charset = ANSI_CHARSET
          GroupFont.Color = clBlack
          GroupFont.Height = -21
          GroupFont.Name = 'Segoe UI'
          GroupFont.Style = []
          Groups.Items = {
            060000000100000010000000544561737947726F757053746F726564FFFECE00
            060000008108060000000F0000000F00000054456173794974656D53746F7265
            64FFFECE00060000008008010000000B00000073006600730061006400660073
            00640066007300640000000000000000000000000000000000000000000F0000
            0054456173794974656D53746F726564FFFECE00060000008008010000000600
            0000640066006100730064006600000000000000000000000000000000000000
            00000F00000054456173794974656D53746F726564FFFECE0006000000800801
            0000000900000066006400730066006400660073006400660000000000000000
            000000000000000000000000000F00000054456173794974656D53746F726564
            FFFECE0006000000800801000000080000006400660064007300730064006600
            660000000000000000000000000000000000000000000F000000544561737949
            74656D53746F726564FFFECE0006000000800801000000090000007300640061
            0066006400730064007300660000000000000000000000000000000000000000
            000F00000054456173794974656D53746F726564FFFECE000600000080080100
            0000080000006100730064006600730064006600640000000000000000000000
            000000000000000000000F00000054456173794974656D53746F726564FFFECE
            00060000008008010000000B0000007300640066006400660061006400730064
            007300660000000000000000000000000000000000000000000F000000544561
            73794974656D53746F726564FFFECE00060000008008010000000C0000007300
            6400660064006600640073006600640066006400730000000000000000000000
            000000000000000000000F00000054456173794974656D53746F726564FFFECE
            00060000008008010000000B0000007300640066006600640073006600610073
            006400660000000000000000000000000000000000000000000F000000544561
            73794974656D53746F726564FFFECE00060000008008010000000C0000006400
            7300660066006400660064007300660073006400660000000000000000000000
            000000000000000000000F00000054456173794974656D53746F726564FFFECE
            0006000000800801000000250000006600640066006400730066006100730066
            0064007300660061007300660061007300640066006100730064006600730064
            0066007300640066006600730061006600730061006400660000000000000000
            000000000000000000000000000F00000054456173794974656D53746F726564
            FFFECE0006000000800801000000180000006600640066006100730064006600
            6400640073006100660073006400660073006400610066007300640066007300
            640000000000000000000000000000000000000000000F000000544561737949
            74656D53746F726564FFFECE00060000008008010000001D0000007400720074
            0072007400640066002000640066002000670064007300660020006700640073
            0066006700200073006400660067006600640067000000000000000000000000
            0000000000000000000F00000054456173794974656D53746F726564FFFECE00
            0600000080080100000018000000670020006400730066006700200064007300
            6600670020006400730066006700200073006400660067006400660067000000
            0000000000000000000000000000000000000F00000054456173794974656D53
            746F726564FFFECE0006000000800C0100000021000000670066007300640067
            0066007300640020006600670064006600730020006700640073006600670020
            0073006400670073006400200066006700730064006600670000000000000000
            0000000000000000000000000000000000000000000000000000000000}
          HintType = ehtToolTip
          Header.Columns.Items = {
            0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
            00060000008008000101000100000000010001B6030000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            01000000000001B4000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE00060000008008000101000102000000000001DC000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01AC010000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -21
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 38
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
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
          CustomCheckRadioEnabled = False
          CustomEnableIconHD = False
        end
      end
      object PanelDisabledInput: TPanel
        Left = 254
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
        Left = 852
        Top = 8
        Width = 915
        Height = 25
        Caption = 'Save states are not officially supported by this machine!'
        Font.Charset = OEM_CHARSET
        Font.Color = clMaroon
        Font.Height = -24
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
      object Enabled_LoadSaveState: TAdvOfficeCheckBoxEx
        Left = 36
        Top = 1
        Width = 110
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enabled'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object AutoSaveState: TAdvOfficeCheckBoxEx
        Left = 169
        Top = 1
        Width = 185
        Height = 36
        Hint = 
          'Enable automatic restore at startup, and automatic save at exit ' +
          'time'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowHint = True
        TabOrder = 2
        Visible = False
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Auto Save State'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object PanelSaveStateListView: TPanelEx
        Left = 10
        Top = 40
        Width = 1780
        Height = 725
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
          Top = 686
          Width = 1778
          Height = 37
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Width = 1778
          Height = 686
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 37
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
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
            0006000000800800010100010000000001000162050000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            01000000000001B4000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE00060000008008000101000102000000000001DC000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            69006600690065006400000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -21
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 38
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
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
          CustomCheckRadioEnabled = False
          CustomEnableIconHD = False
        end
      end
      object PanelDisabledSaveState: TPanel
        Left = 368
        Top = 0
        Width = 89
        Height = 11
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 1
      end
      object PanelDisabledSaveStateNotSupportedMsg: TPanel
        Left = 712
        Top = 1
        Width = 105
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
        Left = 10
        Top = 177
        Width = 55
        Height = 31
        Caption = 'Slot 4'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 10
        Top = 132
        Width = 55
        Height = 31
        Caption = 'Slot 3'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 10
        Top = 42
        Width = 55
        Height = 31
        Caption = 'Slot 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 10
        Top = 87
        Width = 55
        Height = 31
        Caption = 'Slot 2'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
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
        Left = 1700
        Top = 175
        Width = 89
        Height = 36
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
      end
      object ButtonInsertMemoryCard_Slot4_LastUsed: TBitBtnEx
        Left = 1590
        Top = 175
        Width = 109
        Height = 36
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
      end
      object ButtonInsertMemoryCard_Slot4_SelectFile: TBitBtnEx
        Left = 1500
        Top = 175
        Width = 89
        Height = 36
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
      end
      object ButtonInsertMemoryCard_Slot3_LastUsed: TBitBtnEx
        Left = 1590
        Top = 130
        Width = 109
        Height = 36
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
      end
      object ButtonInsertMemoryCard_Slot3_Clear: TBitBtnEx
        Left = 1700
        Top = 130
        Width = 89
        Height = 36
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
      end
      object ButtonInsertMemoryCard_Slot3_SelectFile: TBitBtnEx
        Left = 1500
        Top = 130
        Width = 89
        Height = 36
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
      end
      object InsertMemoryCard_Slot4: TEditEx
        Left = 66
        Top = 175
        Width = 1431
        Height = 36
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 4
      end
      object InsertMemoryCard_Slot3: TEditEx
        Left = 66
        Top = 130
        Width = 1431
        Height = 36
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
      end
      object Enabled_InsertMemoryCard: TAdvOfficeCheckBoxEx
        Left = 36
        Top = 1
        Width = 110
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'Enabled'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object InsertMemoryCard_Slot1: TEditEx
        Left = 66
        Top = 40
        Width = 1431
        Height = 36
        AutoSize = False
        Color = clWhite
        TabOrder = 1
      end
      object InsertMemoryCard_Slot2: TEditEx
        Left = 66
        Top = 85
        Width = 1431
        Height = 36
        AutoSize = False
        Color = clWhite
        Enabled = False
        TabOrder = 2
      end
      object ButtonInsertMemoryCard_Slot1_SelectFile: TBitBtnEx
        Left = 1500
        Top = 40
        Width = 89
        Height = 36
        Hint = 'Click here to select a file'
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object ButtonInsertMemoryCard_Slot1_Clear: TBitBtnEx
        Left = 1700
        Top = 40
        Width = 89
        Height = 36
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object ButtonInsertMemoryCard_Slot1_LastUsed: TBitBtnEx
        Left = 1590
        Top = 40
        Width = 109
        Height = 36
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object ButtonInsertMemoryCard_Slot2_SelectFile: TBitBtnEx
        Left = 1500
        Top = 85
        Width = 89
        Height = 36
        Hint = 'Click here to select a file'
        Caption = 'Select'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object ButtonInsertMemoryCard_Slot2_LastUsed: TBitBtnEx
        Left = 1590
        Top = 85
        Width = 109
        Height = 36
        Hint = 'Select last used memory card file (might not be the newest)'
        Caption = 'Last Used'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
      object ButtonInsertMemoryCard_Slot2_Clear: TBitBtnEx
        Left = 1701
        Top = 85
        Width = 89
        Height = 36
        Hint = 'Click here to empty this memcard slot'
        Caption = 'Clear'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
      end
      object MemoryCardFileFolderPanel: TPanelEx
        Left = 10
        Top = 220
        Width = 1780
        Height = 545
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
          Top = 506
          Width = 1778
          Height = 37
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Width = 1778
          Height = 506
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 37
          Color = clWhite
          EditManager.Font.Charset = ANSI_CHARSET
          EditManager.Font.Color = clBlack
          EditManager.Font.Height = -21
          EditManager.Font.Name = 'Segoe UI'
          EditManager.Font.Style = []
          UseDockManager = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
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
            00060000008008000101000100000000010001B6030000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            01000000000001B4000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE00060000008008000101000102000000000001DC000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01AC010000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -21
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 38
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
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
          CustomCheckRadioEnabled = False
          CustomEnableIconHD = False
        end
      end
      object PanelDisabledMemoryCard: TPanel
        Left = 192
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
        Left = 10
        Top = 730
        Width = 344
        Height = 31
        Caption = 'File to Save (file extension optional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
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
        Left = 457
        Top = 45
        Width = 121
        Height = 28
        Hint = 'Root folder:'
        AutoSize = False
        Caption = 'Root folder:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -21
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
      object Enabled_RecordMovie: TAdvOfficeCheckBoxEx
        Left = 36
        Top = 1
        Width = 110
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Enabled'
        DisabledFontShadowColor = clBlack
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object ButtonRecordMovieResetFileNameTitle: TBitBtnEx
        Tag = 1
        Left = 1643
        Top = 730
        Width = 149
        Height = 36
        Hint = 'Click here to reset filename to game title (no unicode support)'
        Caption = 'Reset to Title'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object ButtonRecordMovieResetFileName: TBitBtnEx
        Left = 1553
        Top = 730
        Width = 89
        Height = 36
        Hint = 'Click here to reset filename to game name'
        Caption = 'Reset'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object RecordMovieFileName: TEditEx
        Left = 360
        Top = 730
        Width = 1190
        Height = 36
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object RecordMovieWAV: TAdvOfficeRadioButtonEx
        Tag = 2
        Left = 282
        Top = 40
        Width = 125
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'WAV File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RecordMovieMNG: TAdvOfficeRadioButtonEx
        Tag = 1
        Left = 138
        Top = 40
        Width = 125
        Height = 36
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'MNG File'
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object RecordMovieAVI: TAdvOfficeRadioButtonEx
        Left = 10
        Top = 40
        Width = 105
        Height = 36
        Hint = 'Uncompressed video/audio, huge space disk required!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = 'AVI File'
        Checked = True
        ReturnIsTab = False
        Themed = True
        CustomIconsEnabled = False
        CustomEnableIconHD = True
        CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
        CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      end
      object PanelRecordMovieListView: TPanelEx
        Left = 10
        Top = 80
        Width = 1780
        Height = 640
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
          Top = 601
          Width = 1778
          Height = 37
          Align = alBottom
          AutoSize = False
          Caption = ' Folder of selected file...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -21
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
          Width = 1778
          Height = 601
          Align = alClient
          BorderStyle = bsNone
          CellSizes.Report.Height = 37
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
            00060000008008000101000100000000010001B6030000FFFFFF1F0001000000
            01000000040000004E0061006D00650000000000000000000000000011000000
            5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
            01000000000001B4000000FFFFFF1F0001000000010000000400000053006900
            7A006500000000000000000000000000110000005445617379436F6C756D6E53
            746F726564FFFECE00060000008008000101000102000000000001DC000000FF
            FFFF1F0001000000010000000D000000440061007400650020004D006F006400
            6900660069006500640000000000000000000000000011000000544561737943
            6F6C756D6E53746F726564FFFECE000600000080080001010001030000000000
            01DE010000FFFFFF1F0001000000010000000600000046006F006C0064006500
            7200000000000000000000000000}
          Header.Draggable = False
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clBlack
          Header.Font.Height = -21
          Header.Font.Name = 'Segoe UI'
          Header.Font.Style = []
          Header.Height = 38
          Header.Sizeable = False
          Header.Visible = True
          IncrementalSearch.Enabled = True
          IncrementalSearch.ResetTime = 1000
          IncrementalSearch.StartType = eissFocusedNode
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
          CustomCheckRadioEnabled = False
          CustomEnableIconHD = False
        end
      end
      object PanelDisabledRecordMovie: TPanel
        Left = 196
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
    Left = 1064
    Top = 168
    object PopupMemoryCardAssignToSlot1: TMenuItem
      Tag = 1
      Caption = 'Assign to Slot 1'
    end
    object PopupMemoryCardAssignToSlot2: TMenuItem
      Tag = 2
      Caption = 'Assign to Slot 2'
    end
    object PopupMemoryCardAssignToSlot3: TMenuItem
      Tag = 3
      Caption = 'Assign to Slot 3'
    end
    object PopupMemoryCardAssignToSlot4: TMenuItem
      Tag = 4
      Caption = 'Assign to Slot 4'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupInputRenameFile: TMenuItem
      Caption = 'Rename File'
      ImageIndex = 15
    end
    object PopupInputDeleteFile: TMenuItem
      Caption = 'Delete File'
      ImageIndex = 14
    end
  end
end
