object FormConsCompGamesFolders: TFormConsCompGamesFolders
  Left = 746
  Top = 489
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Console/Computer/Handheld Games Folders Settings'
  ClientHeight = 714
  ClientWidth = 1206
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
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 811
    Height = 714
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
    OnItemImageDraw = SystemsItemImageDraw
    OnItemImageGetSize = SystemsItemImageGetSize
    OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object PanelFolders: TPanelEx
    Left = 780
    Top = 0
    Width = 426
    Height = 714
    Color1 = 15856113
    Color2 = 15132390
    Color3 = 1117964
    Color4 = 1331230
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft]
    ParentBackground = False
    Style = vgSolid
    object LabelFolderROM: TShadowLabel
      Left = 39
      Top = 8
      Width = 96
      Height = 16
      Caption = 'Cartridge Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 39
      Top = 115
      Width = 105
      Height = 16
      Caption = 'Disc Image Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 39
      Top = 222
      Width = 107
      Height = 16
      Caption = 'Floppy Disk Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 39
      Top = 329
      Width = 115
      Height = 16
      Caption = 'Cassete Tape Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 23
      Top = 542
      Width = 379
      Height = 37
      AutoSize = False
      Caption = 
        '    Add main folders only, full path. Sub-folders are scanned au' +
        'tomatically (recursive scan). ANSI paths only, no Unicode.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
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
      Left = 19
      Top = 8
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconDiscImage: TImage
      Left = 19
      Top = 115
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconFloppyDisk: TImage
      Left = 19
      Top = 222
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconCassetteTape: TImage
      Left = 19
      Top = 329
      Width = 16
      Height = 16
      Transparent = True
    end
    object LabelFolderHardDiskDrive: TShadowLabel
      Left = 39
      Top = 433
      Width = 132
      Height = 16
      Caption = 'Hard Disk Drive Folders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 19
      Top = 433
      Width = 16
      Height = 16
      Transparent = True
    end
    object FolderROM: TEasyListview
      Tag = 1
      Left = 12
      Top = 25
      Width = 312
      Height = 77
      Hint = 'Select a folder for cartridges'
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
      Groups.Items = {
        060000000100000010000000544561737947726F757053746F726564FFFECE00
        060000008108060000000000000000000000000000000000000000000000}
      HintType = ehtToolTip
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000134010000FFFFFF1F0001000000
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
      TabOrder = 0
      View = elsReport
      CustomCheckRadioEnabled = False
      CustomEnableIconHD = False
      OnItemEdited = FolderROMItemEdited
      OnItemEditEnd = FolderROMItemEditEnd
      OnKeyAction = FolderROMKeyAction
    end
    object ButtonMoveFolderUp_ROM: TBitBtnEx
      Tag = 1
      Left = 327
      Top = 25
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      HelpContext = 1
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonMoveFolderDown_ROM: TBitBtnEx
      Left = 372
      Top = 25
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      HelpContext = 1
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonAddFolder_ROM: TBitBtnEx
      Left = 327
      Top = 58
      Width = 43
      Height = 21
      Hint = 'Add a folder'
      HelpContext = 1
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonAddFolder_ROMClick
    end
    object ButtonDeleteFolder_ROM: TBitBtnEx
      Left = 327
      Top = 81
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 1
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonDeleteFolder_ROMClick
    end
    object ButtonEditFolder_ROM: TBitBtnEx
      Left = 372
      Top = 58
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 1
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ButtonEditFolder_ROMClick
    end
    object ButtonClearFolder_ROM: TBitBtnEx
      Left = 372
      Top = 81
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 1
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ButtonClearFolder_ROMClick
    end
    object FolderDiscImage: TEasyListview
      Tag = 2
      Left = 12
      Top = 132
      Width = 312
      Height = 77
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
        0006000000800800010100010000000000000134010000FFFFFF1F0001000000
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
      OnItemEdited = FolderDiscImageItemEdited
      OnItemEditEnd = FolderDiscImageItemEditEnd
      OnKeyAction = FolderDiscImageKeyAction
    end
    object ButtonMoveFolderUp_ISO: TBitBtnEx
      Tag = 1
      Left = 327
      Top = 132
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      HelpContext = 2
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonMoveFolderDown_ISO: TBitBtnEx
      Left = 372
      Top = 132
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      HelpContext = 2
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonAddFolder_ISO: TBitBtnEx
      Left = 327
      Top = 165
      Width = 43
      Height = 21
      Hint = 'Add a folder'
      HelpContext = 2
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = ButtonAddFolder_ROMClick
    end
    object ButtonDeleteFolder_ISO: TBitBtnEx
      Left = 327
      Top = 188
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 2
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = ButtonDeleteFolder_ROMClick
    end
    object ButtonEditFolder_ISO: TBitBtnEx
      Left = 372
      Top = 165
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 2
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = ButtonEditFolder_ROMClick
    end
    object ButtonClearFolder_ISO: TBitBtnEx
      Left = 372
      Top = 188
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 2
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = ButtonClearFolder_ROMClick
    end
    object FolderFloppyDisk: TEasyListview
      Tag = 3
      Left = 12
      Top = 239
      Width = 312
      Height = 77
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
        0006000000800800010100010000000000000134010000FFFFFF1F0001000000
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
      OnItemEdited = FolderFloppyDiskItemEdited
      OnItemEditEnd = FolderFloppyDiskItemEditEnd
      OnKeyAction = FolderFloppyDiskKeyAction
    end
    object ButtonMoveFolderDown_FLOPPY: TBitBtnEx
      Left = 372
      Top = 239
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      HelpContext = 3
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonAddFolder_FLOPPY: TBitBtnEx
      Left = 327
      Top = 272
      Width = 43
      Height = 21
      Hint = 'Add a folder'
      HelpContext = 3
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = ButtonAddFolder_ROMClick
    end
    object ButtonDeleteFolder_FLOPPY: TBitBtnEx
      Left = 327
      Top = 295
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 3
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = ButtonDeleteFolder_ROMClick
    end
    object ButtonEditFolder_FLOPPY: TBitBtnEx
      Left = 372
      Top = 272
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 3
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = ButtonEditFolder_ROMClick
    end
    object ButtonClearFolder_FLOPPY: TBitBtnEx
      Left = 372
      Top = 295
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 3
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = ButtonClearFolder_ROMClick
    end
    object FolderCassetteTape: TEasyListview
      Tag = 4
      Left = 12
      Top = 346
      Width = 312
      Height = 77
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
        0006000000800800010100010000000000000134010000FFFFFF1F0001000000
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
      OnItemEdited = FolderCassetteTapeItemEdited
      OnItemEditEnd = FolderCassetteTapeItemEditEnd
      OnKeyAction = FolderCassetteTapeKeyAction
    end
    object ButtonMoveFolderUp_TAPE: TBitBtnEx
      Tag = 1
      Left = 327
      Top = 346
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      HelpContext = 4
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonMoveFolderDown_TAPE: TBitBtnEx
      Left = 372
      Top = 346
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      HelpContext = 4
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonAddFolder_TAPE: TBitBtnEx
      Left = 327
      Top = 379
      Width = 43
      Height = 21
      Hint = 'Add a folder'
      HelpContext = 4
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      OnClick = ButtonAddFolder_ROMClick
    end
    object ButtonDeleteFolder_TAPE: TBitBtnEx
      Left = 327
      Top = 402
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 4
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      OnClick = ButtonDeleteFolder_ROMClick
    end
    object ButtonEditFolder_TAPE: TBitBtnEx
      Left = 372
      Top = 379
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 4
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      OnClick = ButtonEditFolder_ROMClick
    end
    object ButtonClearFolder_TAPE: TBitBtnEx
      Left = 372
      Top = 402
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 4
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
      OnClick = ButtonClearFolder_ROMClick
    end
    object ButtonMoveFolderUp_FLOPPY: TBitBtnEx
      Tag = 1
      Left = 327
      Top = 239
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      HelpContext = 3
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object PanelBottom: TPanelEx
      Left = 0
      Top = 673
      Width = 426
      Height = 41
      Align = alBottom
      Color1 = 15856113
      Color2 = 14540253
      Color3 = 14540253
      Color4 = 14671839
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = [frLeft]
      ParentBackground = False
      Style = vgSimple
      object ButtonOk: TBitBtnEx
        Left = 115
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close and update folders settings'
        Caption = 'Apply'
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonOkClick
      end
      object ButtonCancel: TBitBtnEx
        Left = 221
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Abort operation and do not update any changes'
        Caption = 'Abort'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonCancelClick
      end
    end
    object FolderHardDiskDrive: TEasyListview
      Tag = 5
      Left = 12
      Top = 450
      Width = 312
      Height = 77
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
        0006000000800800010100010000000000000134010000FFFFFF1F0001000000
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
      OnItemEdited = FolderHardDiskDriveItemEdited
      OnItemEditEnd = FolderHardDiskDriveItemEditEnd
      OnKeyAction = FolderHardDiskDriveKeyAction
    end
    object ButtonMoveFolderUp_HARDDISK: TBitBtnEx
      Tag = 1
      Left = 327
      Top = 450
      Width = 43
      Height = 21
      Hint = 'Move selected folder up'
      HelpContext = 5
      Caption = 'Up'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 30
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonMoveFolderDown_HARDDISK: TBitBtnEx
      Left = 372
      Top = 450
      Width = 43
      Height = 21
      Hint = 'Move selected folder down'
      HelpContext = 5
      Caption = 'Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 31
      OnClick = ButtonMoveFolderUp_ROMClick
    end
    object ButtonAddFolder_HARDDISK: TBitBtnEx
      Left = 327
      Top = 483
      Width = 43
      Height = 21
      Hint = 'Add a folder'
      HelpContext = 5
      Caption = 'Add'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
      OnClick = ButtonAddFolder_ROMClick
    end
    object ButtonDeleteFolder_HARDDISK: TBitBtnEx
      Left = 327
      Top = 506
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 5
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 33
      OnClick = ButtonDeleteFolder_ROMClick
    end
    object ButtonEditFolder_HARDDISK: TBitBtnEx
      Left = 372
      Top = 483
      Width = 43
      Height = 21
      Hint = 'Click here to edit the selected folder [F2]'
      HelpContext = 5
      Caption = 'Edit'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 34
      OnClick = ButtonEditFolder_ROMClick
    end
    object ButtonClearFolder_HARDDISK: TBitBtnEx
      Left = 372
      Top = 506
      Width = 43
      Height = 21
      Hint = 'Delete selected folders'
      HelpContext = 5
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 35
      OnClick = ButtonClearFolder_ROMClick
    end
  end
  object PanelSystemTitle: TPanelEx
    Left = 470
    Top = 614
    Width = 310
    Height = 100
    Color1 = 16448250
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frLeft, frTop]
    ParentBackground = False
    Style = vgSolid
    object LabelSystemTitle: TShadowLabel
      Left = 10
      Top = 56
      Width = 292
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'ATARI 5200 SUPERSYSTEM'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
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
      Layout = tlCenter
    end
    object LabelSystemType: TShadowLabel
      Left = 134
      Top = 23
      Width = 62
      Height = 19
      AutoSize = False
      Caption = 'HANDHELD'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
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
      Layout = tlCenter
    end
    object IconSystemType: TImage
      Left = 112
      Top = 24
      Width = 16
      Height = 16
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
