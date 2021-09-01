object FormConsCompEmulatorsSetup4K: TFormConsCompEmulatorsSetup4K
  Left = 671
  Top = 318
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Console/Computer Emulators Setup 4K'
  ClientHeight = 1451
  ClientWidth = 2673
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
  ShowHint = True
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
    CellSizes.Tile.Width = 186
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
    ParentShowHint = False
    ShowThemedBorder = False
    ShowHint = False
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 1
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object PanelEmulators: TPanelEx
    Tag = 1
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
    ParentBackground = True
    Style = vgSolid
    object EmuIconFrame: TBevelEx
      Left = 10
      Top = 287
      Width = 50
      Height = 50
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object LabelEmulatorFile: TShadowLabel
      Left = 97
      Top = 266
      Width = 377
      Height = 31
      Hint = 'Emulator %d Executable (.exe; .bat; .cmd)'
      Caption = 'Emulator 1 Executable (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuTitle: TShadowLabel
      Left = 10
      Top = 349
      Width = 44
      Height = 31
      Caption = 'Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuCartridgeParameter: TShadowLabel
      Left = 50
      Top = 417
      Width = 509
      Height = 31
      Caption = 'Cartridge Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuDiscImageParameter: TShadowLabel
      Left = 50
      Top = 568
      Width = 523
      Height = 31
      Caption = 'Disc Image Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuBootDiscParameter: TShadowLabel
      Left = 50
      Top = 720
      Width = 478
      Height = 31
      Caption = 'Boot Disc Parameter (load disc from virtual drive)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelDaemonToolsFile: TShadowLabel
      Left = 97
      Top = 11
      Width = 231
      Height = 31
      Caption = 'Virtual Drive Executable'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelDaemonToolsMount: TShadowLabel
      Left = 18
      Top = 93
      Width = 323
      Height = 31
      Caption = 'Mount Parameter ("%s" required)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelDaemonToolsUnmount: TShadowLabel
      Left = 513
      Top = 93
      Width = 198
      Height = 31
      Caption = 'Unmount Parameter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuFloppyDiskParameter: TShadowLabel
      Left = 50
      Top = 873
      Width = 530
      Height = 31
      Caption = 'Floppy Disk Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuCassetteTapeParameter: TShadowLabel
      Left = 50
      Top = 1026
      Width = 549
      Height = 31
      Caption = 'Cassette Tape Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuCartridgeParameter1: TShadowLabel
      Left = 10
      Top = 455
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuCartridgeParameter2: TShadowLabel
      Left = 10
      Top = 500
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuDiscImageParameter1: TShadowLabel
      Left = 10
      Top = 607
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuDiscImageParameter2: TShadowLabel
      Left = 10
      Top = 652
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuBootDiscParameter1: TShadowLabel
      Left = 10
      Top = 759
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuBootDiscParameter2: TShadowLabel
      Left = 10
      Top = 805
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuFloppyDiskParameter1: TShadowLabel
      Left = 10
      Top = 912
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuFloppyDiskParameter2: TShadowLabel
      Left = 10
      Top = 958
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuCassetteTapeParameter1: TShadowLabel
      Left = 10
      Top = 1065
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuCassetteTapeParameter2: TShadowLabel
      Left = 10
      Top = 1111
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object IconCartridge: TImage
      Left = 10
      Top = 417
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconDiscImage: TImage
      Left = 10
      Top = 568
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconBootDisc: TImage
      Left = 10
      Top = 720
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconFloppyDisk: TImage
      Left = 10
      Top = 873
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconCassetteTape: TImage
      Left = 10
      Top = 1026
      Width = 32
      Height = 32
      Transparent = True
    end
    object EmuIcon: TImage
      Left = 11
      Top = 288
      Width = 48
      Height = 48
      IncrementalDisplay = True
      Transparent = True
    end
    object VirtualDriveIconFrame: TBevelEx
      Left = 10
      Top = 32
      Width = 50
      Height = 50
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object VirtualDriveIcon: TImage
      Left = 11
      Top = 33
      Width = 48
      Height = 48
      IncrementalDisplay = True
      Transparent = True
    end
    object IconCartridgeReset: TImage
      Tag = 1
      Left = 901
      Top = 416
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object IconDiscImageReset: TImage
      Tag = 21
      Left = 901
      Top = 567
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object IconBootDiscReset: TImage
      Tag = 22
      Left = 901
      Top = 719
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object IconFloppyDiskReset: TImage
      Tag = 3
      Left = 901
      Top = 872
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object IconCassetteTapeReset: TImage
      Tag = 4
      Left = 901
      Top = 1025
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object Emulator1PageButton: TSpeedButtonEx
      Tag = 1
      Left = 10
      Top = 196
      Width = 168
      Height = 44
      GroupIndex = 1
      Down = True
      Caption = 'Emulator 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Emulator2PageButton: TSpeedButtonEx
      Tag = 2
      Left = 177
      Top = 202
      Width = 168
      Height = 37
      GroupIndex = 1
      Caption = 'Emulator 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Emulator3PageButton: TSpeedButtonEx
      Tag = 3
      Left = 344
      Top = 202
      Width = 168
      Height = 37
      GroupIndex = 1
      Caption = 'Emulator 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Emulator4PageButton: TSpeedButtonEx
      Tag = 4
      Left = 511
      Top = 202
      Width = 168
      Height = 37
      GroupIndex = 1
      Caption = 'Emulator 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object PageButtonsBottomLine: TBevelEx
      Left = 2
      Top = 236
      Width = 996
      Height = 2
      Shape = bsTopLine
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object LabelEmuHardDiskDriveParameter: TShadowLabel
      Left = 50
      Top = 1179
      Width = 567
      Height = 31
      Caption = 'Hard Disk Drive Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object LabelEmuHardDiskDriveParameter1: TShadowLabel
      Left = 10
      Top = 1218
      Width = 72
      Height = 31
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object LabelEmuHardDiskDriveParameter2: TShadowLabel
      Left = 10
      Top = 1268
      Width = 72
      Height = 31
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
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
    end
    object IconHardDiskDrive: TImage
      Left = 10
      Top = 1179
      Width = 32
      Height = 32
      Transparent = True
    end
    object IconHardDiskDriveReset: TImage
      Tag = 5
      Left = 901
      Top = 1178
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
    end
    object VirtualDriveFileNotFoundIcon: TImage
      Left = 825
      Top = 10
      Width = 32
      Height = 32
      Hint = 'Warning: file not found!'
      Transparent = True
    end
    object EmuFileNotFoundIcon: TImage
      Left = 865
      Top = 265
      Width = 32
      Height = 32
      Hint = 'Warning: file not found!'
      Transparent = True
    end
    object EmulatorFile: TEditEx
      Left = 89
      Top = 301
      Width = 808
      Height = 36
      Hint = '1'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 6
    end
    object ButtonClearEmulator: TBitBtnEx
      Left = 901
      Top = 219
      Width = 89
      Height = 36
      Hint = 'Clear emulator 1 settings (emulator and parameters)'
      Caption = 'Clear'
      TabOrder = 0
    end
    object ButtonDaemonToolsHelp: TBitBtnEx
      Left = 954
      Top = 46
      Width = 36
      Height = 36
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DaemonToolsFile: TEditEx
      Tag = 1
      Left = 89
      Top = 46
      Width = 768
      Height = 36
      Hint = '1'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
    object ButtonSelectDaemonTools: TBitBtnEx
      Left = 864
      Top = 46
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 3
    end
    object DaemonToolsMount: TEditEx
      Tag = 1
      Left = 10
      Top = 128
      Width = 485
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object DaemonToolsUnmount: TEditEx
      Tag = 1
      Left = 505
      Top = 128
      Width = 485
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object ButtonSelectEmulator: TBitBtnEx
      Left = 901
      Top = 301
      Width = 89
      Height = 36
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 7
    end
    object EmuDescription: TEditEx
      Tag = 1
      Left = 89
      Top = 346
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
    end
    object EmuCartridgeParameter: TEditEx
      Left = 89
      Top = 452
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
    end
    object EmuDiscImageParameter: TEditEx
      Left = 89
      Top = 604
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
    end
    object EmuBootDiscParameter: TEditEx
      Left = 89
      Top = 756
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
    end
    object EmuFloppyDiskParameter: TEditEx
      Left = 89
      Top = 909
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 12
    end
    object EmuCassetteTapeParameter: TEditEx
      Left = 89
      Top = 1062
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
    end
    object EmuCartridgeParameter2: TEditEx
      Left = 89
      Top = 497
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 14
    end
    object EmuDiscImageParameter2: TEditEx
      Left = 89
      Top = 649
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
    end
    object EmuBootDiscParameter2: TEditEx
      Left = 89
      Top = 802
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
    end
    object EmuFloppyDiskParameter2: TEditEx
      Left = 89
      Top = 955
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 17
    end
    object EmuCassetteTapeParameter2: TEditEx
      Left = 89
      Top = 1108
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 18
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
      object ButtonInstructions: TBitBtnEx
        Left = 297
        Top = 16
        Width = 89
        Height = 45
        Caption = 'Help'
        TabOrder = 0
      end
      object ButtonOk: TBitBtnEx
        Left = 406
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Close and update settings'
        Caption = 'Apply'
        ModalResult = 1
        TabOrder = 1
      end
      object ButtonCancel: TBitBtnEx
        Left = 592
        Top = 16
        Width = 168
        Height = 45
        Hint = 'Close without updating'
        Caption = 'Abort'
        ModalResult = 2
        TabOrder = 2
      end
      object ButtonSelectFolders: TBitBtnEx
        Left = 12
        Top = 16
        Width = 268
        Height = 45
        Hint = 'Click here to select games folders for all systems'
        Caption = 'Select Games Folders'
        TabOrder = 3
      end
    end
    object EmuHardDiskDriveParameter: TEditEx
      Left = 89
      Top = 1215
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 20
    end
    object EmuHardDiskDriveParameter2: TEditEx
      Left = 89
      Top = 1261
      Width = 901
      Height = 36
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 21
    end
  end
  object BitBtn1: TBitBtnEx
    Left = 40
    Top = 296
    Width = 168
    Height = 45
    Caption = 'view mode'
    TabOrder = 2
    Visible = False
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
    object IconSystemType: TImage
      Left = 226
      Top = 48
      Width = 48
      Height = 48
      Transparent = True
    end
  end
  object IL_EmulatorIcon: TImageList
    Height = 32
    Width = 32
    Left = 536
    Top = 128
  end
  object IL_Systems: TImageList
    Height = 128
    Width = 128
    Left = 144
    Top = 136
  end
end
