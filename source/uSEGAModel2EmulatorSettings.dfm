object FormSEGAModel2EmulatorSettings: TFormSEGAModel2EmulatorSettings
  Left = 581
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings'
  ClientHeight = 535
  ClientWidth = 644
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
  object Label1: TLabel
    Left = 16
    Top = 67
    Width = 501
    Height = 15
    Caption = 
      'ROMs Folders [10 max]... Optional. If no folders are defined, "e' +
      'mu_dir\ROMs" is used by default'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelReadFileIni: TShadowLabel
    Left = 112
    Top = 501
    Width = 319
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
    Transparent = True
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 644
    Height = 60
    Color1 = clMoneyGreen
    Color2 = 15856113
    Color3 = 1117964
    Color4 = 16448250
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelGameTitle: TShadowLabel
      Left = 86
      Top = 1
      Width = 550
      Height = 26
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16112579
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelEmulatorVersion: TShadowLabel
      Left = 86
      Top = 28
      Width = 410
      Height = 24
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object SystemIcon: TImage
      Left = 4
      Top = 4
      Width = 48
      Height = 48
      Transparent = True
    end
    object GameIcon: TImage
      Left = 58
      Top = 30
      Width = 24
      Height = 24
      Transparent = True
    end
    object LabelGameStatus: TShadowLabel
      Left = 529
      Top = 26
      Width = 110
      Height = 27
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      WordWrap = True
    end
  end
  object FolderROMs: TEasyListview
    Tag = 1
    Left = 16
    Top = 84
    Width = 612
    Height = 98
    BackGround.Enabled = True
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
      0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000160020000FFFFFF1F0001000000
      010000000600000046006F006C00640065007200000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800000
      010100010100000000000105020000FFFFFF1F00010000000100000006000000
      530074006100740075007300000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Height = 23
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
    ShowHint = False
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
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    View = elsReport
    OnItemEdited = FolderROMsItemEdited
    OnItemEditEnd = FolderROMsItemEditEnd
    OnItemPaintText = FolderROMsItemPaintText
    OnItemSelectionChanged = FolderROMsItemSelectionChanged
    OnKeyAction = FolderROMsKeyAction
  end
  object ButtonUp: TBitBtn
    Tag = 1
    Left = 16
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Move selected folder up'
    Caption = 'Up'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = ButtonUpClick
  end
  object ButtonDown: TBitBtn
    Left = 59
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Move selected folder down'
    Caption = 'Down'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = ButtonUpClick
  end
  object FolderROMButtonSelect: TBitBtn
    Left = 409
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Click here to add folders'
    Caption = 'Add'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = FolderROMButtonSelectClick
  end
  object FolderROMsButtonEdit: TBitBtn
    Left = 452
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Click here to edit the selected folder [F2]'
    Caption = 'Edit'
    TabOrder = 6
    OnClick = FolderROMsButtonEditClick
  end
  object FolderROMsButtonDelete: TBitBtn
    Left = 542
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Click here to delete selected folders [DEL]'
    Caption = 'Delete'
    TabOrder = 7
    OnClick = FolderROMsButtonDeleteClick
  end
  object FolderROMsButtonClear: TBitBtn
    Left = 585
    Top = 182
    Width = 43
    Height = 21
    Hint = 'Click here to clear folders list'
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = FolderROMsButtonClearClick
  end
  object FolderROMsButtonSetActiveInactive: TBitBtn
    Left = 495
    Top = 182
    Width = 47
    Height = 21
    Hint = 'Click here to toggle selected folder [active/inactive]'
    Caption = 'Enable'
    TabOrder = 5
    OnClick = FolderROMsButtonSetActiveInactiveClick
  end
  object GroupBox2: TAdvGroupBox
    Left = 16
    Top = 214
    Width = 361
    Height = 265
    RoundEdges = True
    Caption = 'Video'
    Ctl3D = True
    TabOrder = 9
    object LabelFullScreenResolution: TLabel
      Left = 8
      Top = 20
      Width = 116
      Height = 15
      Caption = 'Full Screen Resolution'
    end
    object LabelWidescreenWindow: TLabel
      Left = 8
      Top = 116
      Width = 147
      Height = 15
      Caption = 'Window Mode Aspect Ratio'
    end
    object LabelFrameskip: TLabel
      Left = 8
      Top = 164
      Width = 54
      Height = 15
      Caption = 'Frameskip'
      ShowAccelChar = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 212
      Width = 85
      Height = 15
      Caption = 'Textures Format'
    end
    object FullScreenResolution: TComboBox
      Left = 8
      Top = 36
      Width = 169
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      TabOrder = 0
    end
    object AutoSwitchFullScreen: TAdvOfficeCheckBox
      Left = 8
      Top = 68
      Width = 163
      Height = 17
      Hint = 'Go to full screen automatically after loading games'
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Auto Switch To Full Screen'
      ReturnIsTab = False
      Themed = True
    end
    object ForceSync: TAdvOfficeCheckBox
      Left = 8
      Top = 92
      Width = 163
      Height = 17
      Hint = 'Match vertical sync to the monitor sync'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Force V-Sync'
      ReturnIsTab = False
      Themed = True
    end
    object WidescreenWindow: TComboBox
      Left = 8
      Top = 132
      Width = 169
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
    object Frameskip: TComboBox
      Left = 8
      Top = 180
      Width = 169
      Height = 23
      Hint = 'Set frameskip to fixed value'
      Style = csDropDownList
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
    object ForceManagedTextures: TComboBox
      Left = 8
      Top = 228
      Width = 169
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
    object SoftwareVertexProcessing: TAdvOfficeCheckBox
      Left = 184
      Top = 19
      Width = 169
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
    end
    object Wireframe: TAdvOfficeCheckBox
      Left = 184
      Top = 43
      Width = 169
      Height = 20
      Hint = 'Disables polygon filling (for debug purposes, don'#39't change)'
      TabOrder = 7
      Alignment = taLeftJustify
      Caption = 'Wireframe (Debug Only)'
      ReturnIsTab = False
      Themed = True
    end
    object FakeGouraud: TAdvOfficeCheckBox
      Left = 184
      Top = 67
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
    end
    object BilinearFiltering: TAdvOfficeCheckBox
      Left = 184
      Top = 91
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
    end
    object FilterTilemaps: TAdvOfficeCheckBox
      Left = 184
      Top = 139
      Width = 105
      Height = 20
      Hint = 
        'Enables bilinear filtering on tilemaps (looks good, but can caus' +
        'e some stretch artifacts)'
      TabOrder = 10
      Alignment = taLeftJustify
      Caption = 'Filter Tilemaps'
      ReturnIsTab = False
      Themed = True
    end
    object TrilinearFiltering: TAdvOfficeCheckBox
      Left = 184
      Top = 115
      Width = 113
      Height = 20
      Hint = 
        'Enables mipmap usage and trilinear filtering (doesn'#39't work with ' +
        'some games, DoA for example)'
      TabOrder = 11
      Alignment = taLeftJustify
      Caption = 'Trilinear Filtering'
      ReturnIsTab = False
      Themed = True
    end
    object AutoMipMap: TAdvOfficeCheckBox
      Left = 184
      Top = 163
      Width = 129
      Height = 20
      Hint = 'Enables Direct3D Automipmap generation'
      TabOrder = 12
      Alignment = taLeftJustify
      Caption = 'Auto Mip-Mapping'
      ReturnIsTab = False
      Themed = True
    end
    object MeshTransparency: TAdvOfficeCheckBox
      Left = 184
      Top = 187
      Width = 127
      Height = 20
      Hint = 
        'Enabled meshed polygons for translucency. Requires PS3.0 capable' +
        ' video cards'
      TabOrder = 13
      Alignment = taLeftJustify
      Caption = 'Mesh Transparency'
      ReturnIsTab = False
      Themed = True
    end
    object Crosshair: TAdvOfficeCheckBox
      Left = 184
      Top = 211
      Width = 174
      Height = 20
      Hint = 'Show crosshair in gun games'
      Checked = True
      TabOrder = 14
      Alignment = taLeftJustify
      Caption = 'Show Crosshair (Gun Games)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object FSAA: TAdvOfficeCheckBox
      Left = 184
      Top = 235
      Width = 152
      Height = 20
      Hint = 'Enable full screen antialiasing in Direct3D'
      TabOrder = 15
      Alignment = taLeftJustify
      Caption = 'Full Screen Anti-Aliasing'
      ReturnIsTab = False
      Themed = True
    end
  end
  object EnableSound: TAdvOfficeCheckBox
    Left = 392
    Top = 456
    Width = 105
    Height = 25
    Checked = True
    TabOrder = 10
    Alignment = taLeftJustify
    Caption = 'Enable Sound'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object AdvGroupBox1: TAdvGroupBox
    Left = 392
    Top = 214
    Width = 237
    Height = 193
    RoundEdges = True
    Caption = 'Input'
    Ctl3D = True
    TabOrder = 11
    object ReturnToNeutral: TAdvOfficeCheckBox
      Left = 9
      Top = 20
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
    end
    object UseRawInput: TAdvGroupBox
      Left = 9
      Top = 48
      Width = 220
      Height = 85
      CheckBox.Hint = 
        'Read mouse through raw input, allowing 2 mice to be used (useful' +
        ' for shooting games)'
      CheckBox.Visible = True
      RoundEdges = True
      Caption = 'Use Raw Input (2 Mouses Support)'
      Ctl3D = True
      TabOrder = 1
      object LabelRawDevicePlayer1: TLabel
        Left = 8
        Top = 24
        Width = 41
        Height = 15
        Caption = 'Player 1'
      end
      object LabelRawDevicePlayer2: TLabel
        Left = 8
        Top = 56
        Width = 41
        Height = 15
        Caption = 'Player 2'
      end
      object RawDevicePlayer1: TComboBox
        Left = 56
        Top = 20
        Width = 158
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
      object RawDevicePlayer2: TComboBox
        Left = 56
        Top = 52
        Width = 158
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
    object ForceFeedbackEnable: TAdvOfficeCheckBox
      Left = 8
      Top = 168
      Width = 145
      Height = 20
      Hint = 'Enable force feedback effects'
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Enable Force Feedback'
      ReturnIsTab = False
      Themed = True
    end
    object XInput: TAdvOfficeCheckBox
      Left = 8
      Top = 144
      Width = 214
      Height = 20
      Hint = 
        'XInput support. XInput allows direct access to XBox360 compatibl' +
        'e controllers for vibration'
      TabOrder = 3
      Alignment = taLeftJustify
      Caption = 'Enable Xbox360 Compatible Devices'
      ReturnIsTab = False
      Themed = True
    end
  end
  object ButtonReadFile: TBitBtn
    Left = 16
    Top = 496
    Width = 89
    Height = 25
    Hint = 'Read "emulator.ini"'
    Caption = 'Reload Settings'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = ButtonReadFileClick
  end
  object ButtonOk: TBitBtn
    Left = 437
    Top = 496
    Width = 89
    Height = 25
    Hint = 'Close and update settings'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 13
  end
  object ButtonCancel: TBitBtn
    Left = 541
    Top = 496
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 14
  end
end
