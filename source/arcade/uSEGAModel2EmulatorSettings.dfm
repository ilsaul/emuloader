object FormSEGAModel2EmulatorSettings: TFormSEGAModel2EmulatorSettings
  Left = 887
  Top = 451
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 634
  ClientWidth = 636
  Color = clBtnFace
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
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 104
    Top = 606
    Width = 328
    Height = 16
    AutoSize = False
    Caption = 'LabelReadFileIni'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = 12632284
    ShadowEnabled = False
    EllipsType = etPathEllips
    ColorFrame = clBlack
    ColorInnerFrame = clBlack
    Frames = []
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 636
    Height = 80
    Align = alTop
    Color1 = clMoneyGreen
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 106
      Top = 1
      Width = 514
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
    object LabelEmulatorVersion: TShadowLabel
      Left = 106
      Top = 44
      Width = 400
      Height = 27
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
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
      WordWrap = True
    end
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object GameIcon: TImage
      Left = 78
      Top = 48
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 509
      Top = 45
      Width = 110
      Height = 29
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
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
  object ButtonReadFile: TBitBtnEx
    Left = 8
    Top = 601
    Width = 89
    Height = 25
    Hint = 'Read "emulator.ini"'
    Caption = 'Reload Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtnEx
    Left = 440
    Top = 601
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TBitBtnEx
    Left = 538
    Top = 601
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object FolderROMsGroupBox: TPanelEx
    Left = 8
    Top = 92
    Width = 620
    Height = 247
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
    object FolderROMsGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 618
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 
        'ROMs Folders [10 max]... Optional. If no folders are defined, "e' +
        'mu_dir\ROMs" is used by default'
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
    object FolderROMs: TEasyListview
      Tag = 1
      Left = 8
      Top = 26
      Width = 556
      Height = 211
      BackGround.Enabled = True
      CellSizes.Report.Height = 20
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      UseDockManager = False
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001EA010000FFFFFF1F0001000000
        010000000600000046006F006C00640065007200000000000000000000000000
        110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
        01010001010000000000013C000000FFFFFF1F00010000000100000006000000
        530074006100740075007300000000000000000000000000}
      Header.Draggable = False
      Header.Height = 23
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.ShowBorder = False
      ParentShowHint = False
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
      Selection.InactiveTextColor = clBtnShadow
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      OnItemCheckChange = FolderROMsItemCheckChange
      OnItemEdited = FolderROMsItemEdited
      OnItemEditEnd = FolderROMsItemEditEnd
      OnItemPaintText = FolderROMsItemPaintText
      OnKeyAction = FolderROMsKeyAction
    end
    object FolderROMsButtonUp: TBitBtnEx
      Tag = 1
      Left = 567
      Top = 26
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = FolderROMsButtonUpClick
    end
    object FolderROMsButtonDown: TBitBtnEx
      Left = 567
      Top = 49
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      OnClick = FolderROMsButtonUpClick
    end
    object FolderROMsButtonSelect: TBitBtnEx
      Left = 567
      Top = 147
      Width = 43
      Height = 21
      Hint = 'Click here to add folders'
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = FolderROMsButtonSelectClick
    end
    object FolderROMsButtonEdit: TBitBtnEx
      Left = 567
      Top = 170
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      Caption = 'Edit'
      TabOrder = 4
      OnClick = FolderROMsButtonEditClick
    end
    object FolderROMsButtonDelete: TBitBtnEx
      Left = 567
      Top = 193
      Width = 43
      Height = 21
      Hint = 'Click here to delete selected folders [DEL]'
      Caption = 'Delete'
      TabOrder = 5
      OnClick = FolderROMsButtonDeleteClick
    end
    object FolderROMsButtonClear: TBitBtnEx
      Left = 567
      Top = 216
      Width = 43
      Height = 21
      Hint = 'Click here to clear folders list'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = FolderROMsButtonClearClick
    end
  end
  object VideoGroupBox: TPanelEx
    Left = 8
    Top = 355
    Width = 620
    Height = 130
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
    object VideoGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 618
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Video'
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
    object FullScreenResolutionLabel: TShadowLabel
      Left = 8
      Top = 20
      Width = 117
      Height = 16
      Caption = 'Full Screen Resolution'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object WidescreenWindowLabel: TShadowLabel
      Left = 192
      Top = 20
      Width = 67
      Height = 16
      Caption = 'Aspect Ratio'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object FrameskipLabel: TShadowLabel
      Left = 316
      Top = 20
      Width = 55
      Height = 16
      Caption = 'Frameskip'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object ForceManagedTexturesLabel: TShadowLabel
      Left = 445
      Top = 20
      Width = 85
      Height = 16
      Caption = 'Textures Format'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
    end
    object FullScreenResolution: TComboBox2Ex
      Left = 8
      Top = 36
      Width = 160
      Height = 23
      Style = csDropDownList
      DropDownCount = 30
      ItemHeight = 15
      TabOrder = 0
    end
    object AutoSwitchFullScreen: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 66
      Width = 162
      Height = 20
      Hint = 'Go to full screen automatically after loading games'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Auto Switch To Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ForceSync: TAdvOfficeCheckBoxEx
      Left = 190
      Top = 66
      Width = 93
      Height = 20
      Hint = 'Match vertical sync to the monitor sync'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Force V-Sync'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object WidescreenWindow: TComboBox2Ex
      Left = 192
      Top = 36
      Width = 100
      Height = 23
      Hint = 'Set widescreen in window mode'
      Style = csDropDownList
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 3
      Text = '4:3'
      Items.Strings = (
        '4:3'
        '16:9'
        '16:10')
    end
    object Frameskip: TComboBox2Ex
      Left = 316
      Top = 36
      Width = 106
      Height = 23
      Hint = 'Set frameskip to fixed value'
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 4
      Text = 'Auto (Default)'
      Items.Strings = (
        'Auto (Default)'
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object ForceManagedTextures: TComboBox2Ex
      Left = 445
      Top = 36
      Width = 165
      Height = 23
      Hint = 
        'Leave it on dynamic. Set to managed textures if the emulator cra' +
        'shes after loading or doesn'#39't show anything'
      Style = csDropDownList
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 5
      Text = 'Dynamic (Default)'
      Items.Strings = (
        'Dynamic (Default)'
        'Force Managed textures')
    end
    object SoftwareVertexProcessing: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 106
      Width = 161
      Height = 20
      Hint = 
        'Leave it checked if you have an ATI card, unchecking it causes b' +
        'roken geometry in ATI cards (still with 0 there are some glitche' +
        's with these cards, HOTD pre-game intro)'
      TabOrder = 6
      Alignment = taLeftJustify
      Caption = 'Software Vertex Processing'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Wireframe: TAdvOfficeCheckBoxEx
      Left = 466
      Top = 106
      Width = 149
      Height = 20
      Hint = 'Disables polygon filling (for debug purposes, don'#39't change)'
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Wireframe (Debug Only)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FakeGouraud: TAdvOfficeCheckBoxEx
      Left = 190
      Top = 86
      Width = 97
      Height = 20
      Hint = 
        'Tries to guess Per-vertex colour (gouraud) from the Model2 per-p' +
        'oly information (flat)'
      TabOrder = 8
      Alignment = taLeftJustify
      Caption = 'Fake Gouraud'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object BilinearFiltering: TAdvOfficeCheckBoxEx
      Left = 466
      Top = 66
      Width = 113
      Height = 20
      Hint = 'Enables bilinear filtering of textures'
      Checked = True
      TabOrder = 9
      Alignment = taLeftJustify
      Caption = 'Bilinear Filtering'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FilterTilemaps: TAdvOfficeCheckBoxEx
      Left = 190
      Top = 106
      Width = 100
      Height = 20
      Hint = 
        'Enables bilinear filtering on tilemaps (looks good, but can caus' +
        'e some stretch artifacts)'
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'Filter Tilemaps'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TrilinearFiltering: TAdvOfficeCheckBoxEx
      Left = 466
      Top = 86
      Width = 110
      Height = 20
      Hint = 
        'Enables mipmap usage and trilinear filtering (doesn'#39't work with ' +
        'some games, DoA for example)'
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Trilinear Filtering'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AutoMipMap: TAdvOfficeCheckBoxEx
      Left = 308
      Top = 66
      Width = 125
      Height = 20
      Hint = 'Enables Direct3D Automipmap generation'
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Auto Mip-Mapping'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MeshTransparency: TAdvOfficeCheckBoxEx
      Left = 308
      Top = 86
      Width = 125
      Height = 20
      Hint = 
        'Enabled meshed polygons for translucency. Requires PS3.0 capable' +
        ' video cards'
      TabOrder = 13
      Alignment = taLeftJustify
      Caption = 'Mesh Transparency'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Crosshair: TAdvOfficeCheckBoxEx
      Left = 308
      Top = 106
      Width = 135
      Height = 20
      Hint = 'Show crosshair in gun games'
      Checked = True
      TabOrder = 14
      Alignment = taLeftJustify
      Caption = 'Show Crosshair (Gun)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FSAA: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 86
      Width = 152
      Height = 20
      Hint = 'Enable full screen antialiasing in Direct3D'
      TabOrder = 15
      Alignment = taLeftJustify
      Caption = 'Full Screen Anti-Aliasing'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object InputGroupBox: TPanelEx
    Left = 8
    Top = 501
    Width = 498
    Height = 80
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
    object InputGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 496
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Input'
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
    object ReturnToNeutral: TAdvOfficeCheckBoxEx
      Left = 283
      Top = 15
      Width = 152
      Height = 20
      Hint = 
        'Enabling it cause the emu to return to neutral when no gear butt' +
        'on is pressed'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Return to Neutral (Gears)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UseRawInput: TAdvGroupBoxEx
      Left = 8
      Top = 20
      Width = 267
      Height = 49
      CheckBox.Hint = 
        'Read mouse through raw input, allowing 2 mice to be used (useful' +
        ' for shooting games)'
      CheckBox.Visible = True
      CheckBox.CustomIconsEnabled = False
      CheckBox.CustomEnableIconHD = False
      CheckBox.CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CheckBox.CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      RoundEdges = True
      Caption = 'Use Raw Input (2 Mouses Support)'
      Ctl3D = True
      TabOrder = 1
      object RawDevicePlayer1Label: TShadowLabel
        Left = 8
        Top = 24
        Width = 42
        Height = 16
        Caption = 'Player 1'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object RawDevicePlayer2Label: TShadowLabel
        Left = 140
        Top = 24
        Width = 42
        Height = 16
        Caption = 'Player 2'
        ShowAccelChar = False
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
      end
      object RawDevicePlayer1: TComboBox2Ex
        Left = 52
        Top = 20
        Width = 77
        Height = 23
        Style = csDropDownList
        ItemHeight = 15
        ItemIndex = 0
        TabOrder = 0
        Text = 'Mouse 1'
        Items.Strings = (
          'Mouse 1'
          'Mouse 2'
          'Mouse 3'
          'Mouse 4')
      end
      object RawDevicePlayer2: TComboBox2Ex
        Left = 184
        Top = 20
        Width = 77
        Height = 23
        Style = csDropDownList
        ItemHeight = 15
        ItemIndex = 1
        TabOrder = 1
        Text = 'Mouse 2'
        Items.Strings = (
          'Mouse 1'
          'Mouse 2'
          'Mouse 3'
          'Mouse 4')
      end
    end
    object ForceFeedbackEnable: TAdvOfficeCheckBoxEx
      Left = 283
      Top = 55
      Width = 140
      Height = 20
      Hint = 'Enable force feedback effects'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable Force Feedback'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object XInput: TAdvOfficeCheckBoxEx
      Left = 283
      Top = 35
      Width = 211
      Height = 20
      Hint = 
        'XInput support. XInput allows direct access to XBox360 compatibl' +
        'e controllers for vibration'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Enable Xbox360 Compatible Devices'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object AudioGroupBox: TPanelEx
    Left = 522
    Top = 501
    Width = 106
    Height = 46
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
    object AudioGroupBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 104
      Height = 18
      Align = alTop
      AutoSize = False
      Caption = 'Audio'
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
    object EnableSound: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 20
      Width = 94
      Height = 20
      Checked = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Enable Sound'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
end
