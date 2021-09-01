object FormSEGAModel2EmulatorSettings4K: TFormSEGAModel2EmulatorSettings4K
  Left = 887
  Top = 451
  ActiveControl = ButtonCancel
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emulator Settings (4K)'
  ClientHeight = 1096
  ClientWidth = 1377
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
  PixelsPerInch = 96
  TextHeight = 15
  object LabelReadFileIni: TShadowLabel
    Left = 200
    Top = 1042
    Width = 795
    Height = 31
    AutoSize = False
    Caption = 'LabelReadFileIni'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
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
    Width = 1377
    Height = 150
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
      Left = 150
      Top = 10
      Width = 1210
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
      Left = 213
      Top = 90
      Width = 930
      Height = 47
      AutoSize = False
      Caption = 
        'game: gamename [clone of parentname] [bios: biosname]'#13#10'Emulator ' +
        'version'
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
      Left = 1155
      Top = 87
      Width = 206
      Height = 51
      Hint = 'Game Status'
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Game Status'#13#10'Missing ROMs/CHDs'
      Font.Charset = ANSI_CHARSET
      Font.Color = 10900224
      Font.Height = -21
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
  object FolderROMsGroupBox: TPanelEx
    Left = 16
    Top = 160
    Width = 1345
    Height = 388
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
      Width = 1343
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 
        'ROMs Folders [10 max]... Optional. If no folders are defined, "e' +
        'mu_dir\ROMs" is used by default'
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
    object FolderROMs: TEasyListview
      Tag = 1
      Left = 10
      Top = 45
      Width = 1243
      Height = 331
      BackGround.Enabled = True
      CellSizes.Report.Height = 32
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
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        060000008108060000000A0000000F00000054456173794974656D53746F7265
        64FFFECE0006000000800801000000230000006600640020006B0066006C0064
        0073006B006A0066006B006C0020006A007300610064006C0066006A00200061
        0073006C0064006A0066006C006100730064006A0066006C0000000000000000
        000000000000000000000000000F00000054456173794974656D53746F726564
        FFFECE0006000000800800000000000000000000000000000000000000000000
        00000F00000054456173794974656D53746F726564FFFECE0006000000800800
        00000000000000000000000000000000000000000000000F0000005445617379
        4974656D53746F726564FFFECE00060000008008000000000000000000000000
        0000000000000000000000000F00000054456173794974656D53746F726564FF
        FECE000600000080080000000000000000000000000000000000000000000000
        000F00000054456173794974656D53746F726564FFFECE000600000080080000
        000000000000000000000000000000000000000000000F000000544561737949
        74656D53746F726564FFFECE0006000000800800000000000000000000000000
        00000000000000000000000F00000054456173794974656D53746F726564FFFE
        CE00060000008008000000000000000000000000000000000000000000000000
        0F00000054456173794974656D53746F726564FFFECE00060000008008000000
        0000000000000000000000000000000000000000000F00000054456173794974
        656D53746F726564FFFECE000600000080080100000019000000660064006B00
        660064006C0066006B00610073006400660020006A00730064006C006B006600
        6A0061006C007300640066000000000000000000000000000000000000000000
        00000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
        000600000080080001010001000000000000015D040000FFFFFF1F0001000000
        010000000600000046006F006C00640065007200000000000000000000000000
        110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
        010100010100000000000178000000FFFFFF1F00010000000100000006000000
        530074006100740075007300000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -21
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 38
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CheckSize = 22
      PaintInfoItem.CheckType = ectBox
      PaintInfoItem.ShowBorder = False
      ParentFont = False
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
    end
    object FolderROMsButtonUp: TBitBtnEx
      Tag = 1
      Left = 1263
      Top = 45
      Width = 70
      Height = 36
      Hint = 'Move selected folder up'
      Caption = 'Up'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
    end
    object FolderROMsButtonDown: TBitBtnEx
      Left = 1263
      Top = 86
      Width = 70
      Height = 36
      Hint = 'Move selected folder down'
      Caption = 'Down'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
    end
    object FolderROMsButtonSelect: TBitBtnEx
      Left = 1263
      Top = 217
      Width = 70
      Height = 36
      Hint = 'Click here to add folders'
      Caption = 'Add'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object FolderROMsButtonEdit: TBitBtnEx
      Left = 1263
      Top = 258
      Width = 70
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      Caption = 'Edit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object FolderROMsButtonDelete: TBitBtnEx
      Left = 1263
      Top = 299
      Width = 70
      Height = 36
      Hint = 'Click here to delete selected folders [DEL]'
      Caption = 'Delete'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object FolderROMsButtonClear: TBitBtnEx
      Left = 1263
      Top = 340
      Width = 70
      Height = 36
      Hint = 'Click here to clear folders list'
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
  end
  object VideoGroupBox: TPanelEx
    Left = 16
    Top = 573
    Width = 1345
    Height = 263
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
      Width = 1343
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Video'
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
    object FullScreenResolutionLabel: TShadowLabel
      Left = 8
      Top = 45
      Width = 204
      Height = 31
      Caption = 'Full Screen Resolution'
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
    end
    object WidescreenWindowLabel: TShadowLabel
      Left = 360
      Top = 45
      Width = 118
      Height = 31
      Caption = 'Aspect Ratio'
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
    end
    object FrameskipLabel: TShadowLabel
      Left = 708
      Top = 45
      Width = 94
      Height = 31
      Caption = 'Frameskip'
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
    object ForceManagedTexturesLabel: TShadowLabel
      Left = 1046
      Top = 45
      Width = 148
      Height = 31
      Caption = 'Textures Format'
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
    end
    object FullScreenResolution: TComboBox2Ex
      Left = 8
      Top = 81
      Width = 287
      Height = 36
      Style = csOwnerDrawFixed
      DropDownCount = 30
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ParentFont = False
      TabOrder = 0
    end
    object AutoSwitchFullScreen: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 127
      Width = 280
      Height = 36
      Hint = 'Go to full screen automatically after loading games'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Auto Switch To Full Screen'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ForceSync: TAdvOfficeCheckBoxEx
      Left = 354
      Top = 127
      Width = 155
      Height = 36
      Hint = 'Match vertical sync to the monitor sync'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Force V-Sync'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object WidescreenWindow: TComboBox2Ex
      Left = 354
      Top = 81
      Width = 287
      Height = 36
      Hint = 'Set widescreen in window mode'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentFont = False
      TabOrder = 3
      Text = '4:3'
      Items.Strings = (
        '4:3'
        '16:9'
        '16:10')
    end
    object Frameskip: TComboBox2Ex
      Left = 700
      Top = 81
      Width = 287
      Height = 36
      Hint = 'Set frameskip to fixed value'
      Style = csOwnerDrawFixed
      DropDownCount = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 0
      ParentFont = False
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
      Left = 1046
      Top = 81
      Width = 287
      Height = 36
      Hint = 
        'Leave it on dynamic. Set to managed textures if the emulator cra' +
        'shes after loading or doesn'#39't show anything'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 30
      ItemIndex = 1
      ParentFont = False
      TabOrder = 5
      Text = 'Force Managed textures'
      Items.Strings = (
        'Dynamic (Default)'
        'Force Managed textures')
    end
    object SoftwareVertexProcessing: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 221
      Width = 285
      Height = 36
      Hint = 
        'Leave it checked if you have an ATI card, unchecking it causes b' +
        'roken geometry in ATI cards (still with 0 there are some glitche' +
        's with these cards, HOTD pre-game intro)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Software Vertex Processing'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Wireframe: TAdvOfficeCheckBoxEx
      Left = 1046
      Top = 221
      Width = 260
      Height = 36
      Hint = 'Disables polygon filling (for debug purposes, don'#39't change)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Wireframe (Debug Only)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FakeGouraud: TAdvOfficeCheckBoxEx
      Left = 354
      Top = 174
      Width = 165
      Height = 36
      Hint = 
        'Tries to guess Per-vertex colour (gouraud) from the Model2 per-p' +
        'oly information (flat)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Fake Gouraud'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object BilinearFiltering: TAdvOfficeCheckBoxEx
      Left = 1046
      Top = 127
      Width = 184
      Height = 36
      Hint = 'Enables bilinear filtering of textures'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Bilinear Filtering'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FilterTilemaps: TAdvOfficeCheckBoxEx
      Left = 354
      Top = 221
      Width = 170
      Height = 36
      Hint = 
        'Enables bilinear filtering on tilemaps (looks good, but can caus' +
        'e some stretch artifacts)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Filter Tilemaps'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object TrilinearFiltering: TAdvOfficeCheckBoxEx
      Left = 1046
      Top = 174
      Width = 185
      Height = 36
      Hint = 
        'Enables mipmap usage and trilinear filtering (doesn'#39't work with ' +
        'some games, DoA for example)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Trilinear Filtering'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object AutoMipMap: TAdvOfficeCheckBoxEx
      Left = 700
      Top = 127
      Width = 215
      Height = 36
      Hint = 'Enables Direct3D Automipmap generation'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Auto Mip-Mapping'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object MeshTransparency: TAdvOfficeCheckBoxEx
      Left = 700
      Top = 174
      Width = 215
      Height = 36
      Hint = 
        'Enabled meshed polygons for translucency. Requires PS3.0 capable' +
        ' video cards'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Mesh Transparency'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object Crosshair: TAdvOfficeCheckBoxEx
      Left = 700
      Top = 221
      Width = 235
      Height = 36
      Hint = 'Show crosshair in gun games'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Show Crosshair (Gun)'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object FSAA: TAdvOfficeCheckBoxEx
      Left = 8
      Top = 174
      Width = 260
      Height = 36
      Hint = 'Enable full screen antialiasing in Direct3D'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Full Screen Anti-Aliasing'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object InputGroupBox: TPanelEx
    Left = 16
    Top = 860
    Width = 1146
    Height = 150
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
      Width = 1144
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Input'
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
    object ReturnToNeutral: TAdvOfficeCheckBoxEx
      Left = 569
      Top = 44
      Width = 265
      Height = 36
      Hint = 
        'Enabling it cause the emu to return to neutral when no gear butt' +
        'on is pressed'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Return to Neutral (Gears)'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object UseRawInput: TAdvGroupBoxEx
      Left = 10
      Top = 46
      Width = 474
      Height = 92
      CheckBox.Hint = 
        'Read mouse through raw input, allowing 2 mice to be used (useful' +
        ' for shooting games)'
      CheckBox.Visible = True
      CheckBox.CustomIconsEnabled = False
      CheckBox.CustomEnableIconHD = True
      CheckBox.CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CheckBox.CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
      RoundEdges = True
      Caption = 'Use Raw Input (2 Mouses Support)'
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object RawDevicePlayer1Label: TShadowLabel
        Left = 10
        Top = 47
        Width = 74
        Height = 31
        Caption = 'Player 1'
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
      end
      object RawDevicePlayer2Label: TShadowLabel
        Left = 264
        Top = 47
        Width = 74
        Height = 31
        Caption = 'Player 2'
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
      end
      object RawDevicePlayer1: TComboBox2Ex
        Left = 89
        Top = 45
        Width = 120
        Height = 36
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Mouse 1'
        Items.Strings = (
          'Mouse 1'
          'Mouse 2'
          'Mouse 3'
          'Mouse 4')
      end
      object RawDevicePlayer2: TComboBox2Ex
        Left = 343
        Top = 45
        Width = 120
        Height = 36
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 30
        ItemIndex = 1
        ParentFont = False
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
      Left = 896
      Top = 44
      Width = 243
      Height = 36
      Hint = 'Enable force feedback effects'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Force Feedback'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object XInput: TAdvOfficeCheckBoxEx
      Left = 569
      Top = 91
      Width = 370
      Height = 36
      Hint = 
        'XInput support. XInput allows direct access to XBox360 compatibl' +
        'e controllers for vibration'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Xbox360 Compatible Devices'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object ButtonReadFile: TBitBtnEx
    Left = 16
    Top = 1035
    Width = 168
    Height = 45
    Hint = 'Read "emulator.ini"'
    Caption = 'Reload Settings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    CaptionVertIndent = -1
  end
  object ButtonOk: TBitBtnEx
    Left = 1008
    Top = 1035
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
    TabOrder = 2
    CaptionVertIndent = -1
  end
  object ButtonCancel: TBitBtnEx
    Left = 1194
    Top = 1035
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
    TabOrder = 3
    CaptionVertIndent = -1
  end
  object SampleBox: TPanelEx
    Left = 1187
    Top = 860
    Width = 174
    Height = 86
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
    object SampleBoxLabel: TShadowLabel
      Left = 0
      Top = 0
      Width = 172
      Height = 35
      Align = alTop
      AutoSize = False
      Caption = 'Audio'
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
    object EnableSound: TAdvOfficeCheckBoxEx
      Left = 10
      Top = 44
      Width = 160
      Height = 36
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Enable Sound'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
end
