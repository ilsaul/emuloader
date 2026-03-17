object FormConsCompGamesFolders4K: TFormConsCompGamesFolders4K
  Left = 746
  Top = 489
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Console/Computer Games Folders Settings 4K'
  ClientHeight = 1451
  ClientWidth = 2791
  Color = clBlue
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 30
  object Systems: TEasyListview
    Tag = -1
    Left = 8
    Top = 8
    Width = 1596
    Height = 1435
    BorderStyle = bsNone
    CellSizes.Icon.Height = 102
    CellSizes.Icon.Width = 78
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -9
    EditManager.Font.Name = 'Tahoma'
    EditManager.Font.Style = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clBlack
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000181010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    HotTrack.Color = clBlack
    HotTrack.Enabled = True
    HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
    HotTrack.Underline = False
    ImagesLarge = IL_Systems
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    ParentFont = False
    ShowThemedBorder = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object PanelFolders: TPanelEx
    Left = 1576
    Top = 0
    Width = 1000
    Height = 1451
    Color1 = 15856113
    Color2 = 15132390
    Color3 = 1117964
    Color4 = 1331230
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelFolderROM: TShadowLabel
      Left = 58
      Top = 18
      Width = 170
      Height = 31
      Caption = 'Cartridge Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelFolderDiscImage: TShadowLabel
      Left = 58
      Top = 254
      Width = 184
      Height = 31
      Caption = 'Disc Image Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelFolderFloppyDisk: TShadowLabel
      Left = 58
      Top = 490
      Width = 191
      Height = 31
      Caption = 'Floppy Disk Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelFolderCassetteTape: TShadowLabel
      Left = 58
      Top = 726
      Width = 202
      Height = 31
      Caption = 'Cassete Tape Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object LabelRecursiveFolderInfo: TShadowLabel
      Left = 206
      Top = 1198
      Width = 588
      Height = 55
      AutoSize = False
      Caption = 
        '    Add main folders only, full path. Sub-folders are scanned au' +
        'tomatically (recursive scan). ANSI paths only, no Unicode.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
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
    object IconCartridge: TImage
      Left = 18
      Top = 18
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconDiscImage: TImage
      Left = 18
      Top = 254
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconFloppyDisk: TImage
      Left = 18
      Top = 490
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconCassetteTape: TImage
      Left = 18
      Top = 726
      Width = 32
      Height = 32
      Transparent = True
    end
    object LabelFolderHardDiskDrive: TShadowLabel
      Left = 58
      Top = 962
      Width = 228
      Height = 31
      Caption = 'Hard Disk Drive Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
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
    object IconHardDiskDrive: TImage
      Left = 18
      Top = 962
      Width = 32
      Height = 32
      Transparent = True
    end
    object FolderROM: TEasyListview
      Tag = 1
      Left = 10
      Top = 60
      Width = 797
      Height = 159
      Hint = 'Select a folder for cartridges'
      BackGround.Enabled = True
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
      GroupFont.Height = -13
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        06000000810806000000040000000F00000054456173794974656D53746F7265
        64FFFECE00060000008008010000001400000044003A005C0045006D0075006C
        00610074006F00720073005C0041006D006900670061005C0066000000000000
        0000000000000000000000000000000F00000054456173794974656D53746F72
        6564FFFECE000600000080080100000008000000640073006600730064006600
        7300640000000000000000000000000000000000000000000F00000054456173
        794974656D53746F726564FFFECE000600000080080100000005000000640066
        0073006400660000000000000000000000000000000000000000000F00000054
        456173794974656D53746F726564FFFECE000600000080080100000013000000
        660064006100730064006600730064006600C1005C005C005C005C005F006900
        66004D0057000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000119030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 25
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
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
    end
    object ButtonMoveFolderUp_ROM: TBitBtnEx
      Tag = 1
      Left = 811
      Top = 60
      Width = 89
      Height = 36
      Hint = 'Move selected folder up'
      HelpContext = 1
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonMoveFolderDown_ROM: TBitBtnEx
      Left = 901
      Top = 60
      Width = 89
      Height = 36
      Hint = 'Move selected folder down'
      HelpContext = 1
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object ButtonAddFolder_ROM: TBitBtnEx
      Left = 811
      Top = 146
      Width = 89
      Height = 36
      Hint = 'Add a folder'
      HelpContext = 1
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object ButtonDeleteFolder_ROM: TBitBtnEx
      Left = 811
      Top = 183
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 1
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object ButtonEditFolder_ROM: TBitBtnEx
      Left = 901
      Top = 146
      Width = 89
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 1
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object ButtonClearFolder_ROM: TBitBtnEx
      Left = 901
      Top = 183
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 1
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object FolderDiscImage: TEasyListview
      Tag = 2
      Left = 10
      Top = 296
      Width = 797
      Height = 159
      Hint = 'Select a folder for disc images'
      BackGround.Enabled = True
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
      GroupFont.Height = -13
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000119030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 25
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.Border = 1
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CaptionIndent = 2
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
      TabOrder = 7
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
    object ButtonMoveFolderUp_ISO: TBitBtnEx
      Tag = 1
      Left = 811
      Top = 296
      Width = 89
      Height = 36
      Hint = 'Move selected folder up'
      HelpContext = 2
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object ButtonMoveFolderDown_ISO: TBitBtnEx
      Left = 901
      Top = 296
      Width = 89
      Height = 36
      Hint = 'Move selected folder down'
      HelpContext = 2
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object ButtonAddFolder_ISO: TBitBtnEx
      Left = 811
      Top = 382
      Width = 89
      Height = 36
      Hint = 'Add a folder'
      HelpContext = 2
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object ButtonDeleteFolder_ISO: TBitBtnEx
      Left = 811
      Top = 419
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 2
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object ButtonEditFolder_ISO: TBitBtnEx
      Left = 901
      Top = 382
      Width = 89
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 2
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object ButtonClearFolder_ISO: TBitBtnEx
      Left = 901
      Top = 419
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 2
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object FolderFloppyDisk: TEasyListview
      Tag = 3
      Left = 10
      Top = 532
      Width = 797
      Height = 159
      Hint = 'Select a folder for floppy disks'
      BackGround.Enabled = True
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
      GroupFont.Height = -13
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000119030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 25
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.Border = 1
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CaptionIndent = 2
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
      TabOrder = 14
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
    object ButtonMoveFolderDown_FLOPPY: TBitBtnEx
      Left = 901
      Top = 532
      Width = 89
      Height = 36
      Hint = 'Move selected folder down'
      HelpContext = 3
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object ButtonAddFolder_FLOPPY: TBitBtnEx
      Left = 811
      Top = 618
      Width = 89
      Height = 36
      Hint = 'Add a folder'
      HelpContext = 3
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object ButtonDeleteFolder_FLOPPY: TBitBtnEx
      Left = 811
      Top = 655
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 3
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
    end
    object ButtonEditFolder_FLOPPY: TBitBtnEx
      Left = 901
      Top = 618
      Width = 89
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 3
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object ButtonClearFolder_FLOPPY: TBitBtnEx
      Left = 901
      Top = 655
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 3
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
    end
    object FolderCassetteTape: TEasyListview
      Tag = 4
      Left = 10
      Top = 768
      Width = 797
      Height = 159
      Hint = 'Select a folder for cassete tapes'
      BackGround.Enabled = True
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
      GroupFont.Height = -13
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000119030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 25
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.Border = 1
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CaptionIndent = 2
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
      TabOrder = 20
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
    object ButtonMoveFolderUp_TAPE: TBitBtnEx
      Tag = 1
      Left = 811
      Top = 768
      Width = 89
      Height = 36
      Hint = 'Move selected folder up'
      HelpContext = 4
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
    object ButtonMoveFolderDown_TAPE: TBitBtnEx
      Left = 901
      Top = 768
      Width = 89
      Height = 36
      Hint = 'Move selected folder down'
      HelpContext = 4
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
    end
    object ButtonAddFolder_TAPE: TBitBtnEx
      Left = 811
      Top = 854
      Width = 89
      Height = 36
      Hint = 'Add a folder'
      HelpContext = 4
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
    end
    object ButtonDeleteFolder_TAPE: TBitBtnEx
      Left = 811
      Top = 891
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 4
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
    end
    object ButtonEditFolder_TAPE: TBitBtnEx
      Left = 901
      Top = 854
      Width = 89
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 4
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
    end
    object ButtonClearFolder_TAPE: TBitBtnEx
      Left = 901
      Top = 891
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 4
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
    end
    object ButtonMoveFolderUp_FLOPPY: TBitBtnEx
      Tag = 1
      Left = 811
      Top = 532
      Width = 89
      Height = 36
      Hint = 'Move selected folder up'
      HelpContext = 3
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
    end
    object PanelBottom: TPanelEx
      Left = 0
      Top = 1380
      Width = 1000
      Height = 71
      Align = alBottom
      Color1 = 15856113
      Color2 = 14540253
      Color3 = 14540253
      Color4 = 14671839
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgSimple
      object ButtonOk: TBitBtnEx
        Left = 328
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Close and update folders settings'
        Caption = 'Apply'
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ButtonCancel: TBitBtnEx
        Left = 504
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Abort operation and do not update any changes'
        Caption = 'Abort'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object FolderHardDiskDrive: TEasyListview
      Tag = 5
      Left = 10
      Top = 1004
      Width = 797
      Height = 159
      Hint = 'Select a folder for cassete tapes'
      BackGround.Enabled = True
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
      GroupFont.Height = -13
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000119030000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 25
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1000
      IncrementalSearch.StartType = eissFocusedNode
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.Border = 1
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.CaptionIndent = 2
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
      TabOrder = 29
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
    end
    object ButtonMoveFolderUp_HARDDISK: TBitBtnEx
      Tag = 1
      Left = 811
      Top = 1004
      Width = 89
      Height = 36
      Hint = 'Move selected folder up'
      HelpContext = 5
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 30
    end
    object ButtonMoveFolderDown_HARDDISK: TBitBtnEx
      Left = 901
      Top = 1004
      Width = 89
      Height = 36
      Hint = 'Move selected folder down'
      HelpContext = 5
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 31
    end
    object ButtonAddFolder_HARDDISK: TBitBtnEx
      Left = 811
      Top = 1090
      Width = 89
      Height = 36
      Hint = 'Add a folder'
      HelpContext = 5
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
    end
    object ButtonDeleteFolder_HARDDISK: TBitBtnEx
      Left = 811
      Top = 1127
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 5
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 33
    end
    object ButtonEditFolder_HARDDISK: TBitBtnEx
      Left = 901
      Top = 1090
      Width = 89
      Height = 36
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 5
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 34
    end
    object ButtonClearFolder_HARDDISK: TBitBtnEx
      Left = 901
      Top = 1127
      Width = 89
      Height = 36
      Hint = 'Delete selected folders'
      HelpContext = 5
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 35
    end
  end
  object PanelSystemTitle: TPanelEx
    Left = 946
    Top = 1232
    Width = 620
    Height = 201
    Color1 = 16448250
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object IconSystemType: TImage
      Left = 226
      Top = 48
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelSystemType: TShadowLabel
      Left = 284
      Top = 58
      Width = 110
      Height = 28
      AutoSize = False
      Caption = 'HANDHELD'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelSystemTitle: TShadowLabel
      Left = 40
      Top = 142
      Width = 540
      Height = 28
      Alignment = taCenter
      AutoSize = False
      Caption = 'ATARI 5200 SUPERSYSTEM'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
  end
  object IL_Systems: TImageList
    Height = 68
    Width = 68
    Left = 112
    Top = 104
  end
end
