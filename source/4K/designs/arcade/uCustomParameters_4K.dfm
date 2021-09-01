object FormCustomParameters4K: TFormCustomParameters4K
  Left = 530
  Top = 407
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Custom Parameters (4K)'
  ClientHeight = 1191
  ClientWidth = 2874
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 30
  object LabelTips1: TShadowLabel
    Left = 24
    Top = 352
    Width = 1332
    Height = 55
    Caption = 
      'The             parameter is optional, used with software lists.' +
      ' It'#39's added by the frontend at the end in slot1/drive1 (when run' +
      'ning the emulator).'#13#10'Useful to load the game in another slot, bu' +
      't it must be the last argument.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
  object LabelTips1Param1: TShadowLabel
    Left = 69
    Top = 352
    Width = 57
    Height = 28
    Caption = 'media'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -21
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
  object LabelTips2: TShadowLabel
    Left = 24
    Top = 414
    Width = 1335
    Height = 28
    Caption = 
      'You may use a                 tag, it will be replaced by the ga' +
      'me name. Media parameter is also required, and don'#39't have to be ' +
      'the last arguments.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
  object LabelTips1Tag: TShadowLabel
    Left = 169
    Top = 414
    Width = 72
    Height = 28
    Caption = '<game>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
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
  object LabelTips1Param2: TShadowLabel
    Left = 712
    Top = 379
    Width = 341
    Height = 28
    Caption = '(-cart1  -cart2  -cass  -flop2  others)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -21
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
  object SoftwareUsageTitle: TShadowLabel
    Left = 16
    Top = 168
    Width = 182
    Height = 31
    Caption = 'Usage instructions:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Visible = False
  end
  object SoftwareUsageText: TShadowLabel
    Left = 202
    Top = 173
    Width = 1213
    Height = 24
    AutoSize = False
    Caption = 'instructions on how to load this game'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
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
    Visible = False
  end
  object ShadowLabel2: TShadowLabel
    Left = 16
    Top = 198
    Width = 366
    Height = 31
    Caption = 'Requirement (added by the frontend):'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clGray
    ShadowEnabled = False
    EllipsType = etNone
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
    Visible = False
  end
  object ShadowLabel3: TShadowLabel
    Left = 386
    Top = 203
    Width = 1029
    Height = 24
    AutoSize = False
    Caption = 'instructions on how to load this game'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
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
    Visible = False
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 2874
    Height = 168
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
      Left = 10
      Top = 10
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 150
      Top = 10
      Width = 1265
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
      Left = 149
      Top = 90
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 205
      Top = 90
      Width = 1190
      Height = 70
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'software ' +
        'list: softwarelist title'#13#10'run with machine [machinename]: machin' +
        'e title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
    Top = 1120
    Width = 2874
    Height = 71
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object LabelCustomParamFile: TShadowLabel
      Left = 120
      Top = 25
      Width = 940
      Height = 28
      AutoSize = False
      Caption = 'filename_full_path.ini'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
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
      Left = 10
      Top = 16
      Width = 100
      Height = 45
      Hint = 'Load settings from file'
      Caption = 'Reload'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonReloadClick
      CaptionVertIndent = -1
    end
    object ButtonOk: TBitBtnEx
      Left = 1074
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close and update settings'
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonOkClick
      CaptionVertIndent = -1
    end
    object ButtonCancel: TBitBtnEx
      Left = 1252
      Top = 16
      Width = 168
      Height = 45
      Hint = 'Close without updating'
      Caption = 'Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      CaptionVertIndent = -1
    end
  end
  object CustomParametersGroupBox: TPanelEx
    Left = 16
    Top = 243
    Width = 1398
    Height = 93
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
      Width = 1396
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 
        'Custom Parameters                    (for software lists, you ca' +
        'n enter a machine name before the parameters to overwrite curren' +
        't selected machine)'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
      Left = 10
      Top = 45
      Width = 1376
      Height = 36
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'fdasfd sadf sdfsdfsdfsdf'#180'[[[[g'#193'<\ -cart:'
    end
  end
  object PanelEx1: TPanelEx
    Left = 560
    Top = 1067
    Width = 287
    Height = 74
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
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Sample Box'
      CaptionIndent = 7
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
  object CustomParametersSamplesGroupBox: TPanelEx
    Left = 16
    Top = 457
    Width = 1398
    Height = 647
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
      Width = 1396
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Custom Parameters Samples'
      CaptionIndent = 7
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = 15132390
      ColorInnerFrame = clBlack
      Frames = [lfrLeft, lfrRight, lfrBottom]
      Transparent = False
    end
    object CustomParametersSamples: TTntRichEdit
      Left = 10
      Top = 45
      Width = 1376
      Height = 508
      Color = 15856113
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        
          '    MSX cartridge game (msx1_cart.xml software list) with a spec' +
          'ific machine to overwrite selected MAME '
        'machine and '
        'insert a game cartridge in slot #2.'
        
          '-autoboot_delay "2" -autoboot_command "LOAD\"ARTHUR\",8\n\n\n\n\' +
          'n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nRUN\n"')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object PanelMachineSlots: TPanelEx
    Left = 1439
    Top = 16
    Width = 1419
    Height = 1159
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
    object CommandLinePreviewGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 1417
      Height = 35
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Machine Slots Info'
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
      Left = 214
      Top = 328
      Width = 138
      Height = 31
      Caption = 'Edit Command'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object MachineSlotsInfoFrame: TShape
      Left = 10
      Top = 372
      Width = 1397
      Height = 704
      Brush.Color = 15856113
      Pen.Color = clSilver
    end
    object ShadowLabel4: TShadowLabel
      Left = 16
      Top = 374
      Width = 79
      Height = 29
      Caption = 'SYSTEM'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object MachinesListView: TEasyListview
      Left = 10
      Top = 45
      Width = 1397
      Height = 271
      CellSizes.Report.Height = 37
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
        06000000810806000000060000000F00000054456173794974656D53746F7265
        64FFFECE0006000000800C010000000A00000066006400660061006400660061
        0073006400660000000000000000000000000000000000000000000F00000054
        456173794974656D53746F726564FFFECE000600000080080100000012000000
        6600610064006600200073006400660073006100200064006600610073006400
        2000660000000000000000000000000000000000000000000F00000054456173
        794974656D53746F726564FFFECE00060000008008010000001E000000640073
        0041002000390041005300440020003800410064002000300061007300640041
        0053004400440046004700530044004600670066006400670000000000000000
        000000000000000000000000000F00000054456173794974656D53746F726564
        FFFECE0006000000800801000000130000006700730064002000660067003900
        660064006700690020006F0064007300660020006F0067000000000000000000
        0000000000000000000000000F00000054456173794974656D53746F726564FF
        FECE000600000080080100000025000000670066007300640020006F00670069
        0066007300640070006F0020006700690070006F007300640066002000670069
        0070007300640066006700690070007300640066006F00690067000000000000
        0000000000000000000000000000000F00000054456173794974656D53746F72
        6564FFFECE00060000008008010000001C0000003500690066006F0020006900
        760070006600690070006F0073006900700070006900770070006F0069007000
        6F002000690070006F0069000000000000000000000000000000000000000000
        00000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000006000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000187020000FFFFFF1F0001000000
        01000000070000004D0061006300680069006E00650000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        08000101000101000000000001CD000000FFFFFF1F0001000000010000000400
        00004E0061006D00650000000000000000000000000011000000544561737943
        6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
        01A0000000FFFFFF1F0001000000010000000200000048007A00000000000000
        000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
        0000008008000101000103000000000001CD000000FFFFFF1F00010000000100
        00000800000043006C006F006E00650020006F00660000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        080001010001040000000000018C000000FFFFFF1F0001000000010000000A00
        0000530061007600650020005300740061007400650000000000000000000000
        0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
        0800010100010500000000000022000000FFFFFF1F0001000000000000000000
        00000000000000000000}
      Header.Draggable = False
      Header.Height = 38
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      ImagesSmall = FormMain.IL_StandardIconsSmall
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
      ShowHint = False
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
    end
    object MachineSlotsRunCommand: TEditEx
      Left = 360
      Top = 326
      Width = 874
      Height = 36
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'cell.height+4pixels bottom space+header.height+7'
    end
    object MachineSlotsRunCommandButtonRun: TBitBtnEx
      Left = 1239
      Top = 326
      Width = 168
      Height = 36
      Caption = 'Run Command'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object MachineSlotsInfo: TTntRichEdit
      Left = 12
      Top = 403
      Width = 1393
      Height = 671
      BorderStyle = bsNone
      Color = 15856113
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'Test'
        
          'rer fadio piaspodfipasip dofipasf dipasdfi poisapdfiasdf oifdiua' +
          'fd poia8r90s 8f7a 9sa7df 979sfd7 97asf7d 987sdf 9as7df897 sdf as' +
          'df isdf78 9as0df'
        'DD'
        'AA'
        'V'
        'M'
        '444fd sfsdf')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
      WordWrap = False
    end
    object RecordMovieAVI: TAdvOfficeRadioButtonEx
      Left = 16
      Top = 326
      Width = 75
      Height = 36
      Hint = 'Uncompressed video/audio, huge space disk required!'
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
      Caption = 'Slots'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AdvOfficeRadioButtonEx1: TAdvOfficeRadioButtonEx
      Left = 105
      Top = 326
      Width = 90
      Height = 36
      Hint = 'Uncompressed video/audio, huge space disk required!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Media'
      Checked = True
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object BitBtnEx1: TBitBtnEx
    Left = 1382
    Top = 374
    Width = 32
    Height = 45
    Hint = 'Load settings from file'
    Caption = '3'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'Marlett'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = ButtonReloadClick
    CaptionVertIndent = 1
  end
end
