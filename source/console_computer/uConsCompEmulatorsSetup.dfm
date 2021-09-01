object FormConsCompEmulatorsSetup: TFormConsCompEmulatorsSetup
  Left = 760
  Top = 428
  ActiveControl = Systems
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Console/Computer/Handheld Emulators Setup'
  ClientHeight = 714
  ClientWidth = 1206
  Color = clBlue
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
  object Systems: TEasyListview
    Tag = -1
    Left = 0
    Top = 0
    Width = 811
    Height = 714
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
    OnItemImageDraw = SystemsItemImageDraw
    OnItemImageGetSize = SystemsItemImageGetSize
    OnItemImageDrawIsCustom = SystemsItemImageDrawIsCustom
    OnItemPaintText = SystemsItemPaintText
    OnItemSelectionChanged = SystemsItemSelectionChanged
  end
  object PanelEmulators: TPanelEx
    Tag = 1
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
    ParentBackground = True
    Style = vgSolid
    object EmuIconFrame: TBevelEx
      Left = 12
      Top = 139
      Width = 34
      Height = 34
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object LabelEmulatorFile: TShadowLabel
      Left = 56
      Top = 135
      Width = 220
      Height = 16
      Hint = 'Emulator %d Executable (.exe; .bat; .cmd)'
      Caption = 'Emulator 1 Executable (.exe; .bat; .cmd)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 14
      Top = 178
      Width = 26
      Height = 16
      Caption = 'Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 32
      Top = 204
      Width = 297
      Height = 16
      Caption = 'Cartridge Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 32
      Top = 273
      Width = 306
      Height = 16
      Caption = 'Disc Image Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 32
      Top = 342
      Width = 276
      Height = 16
      Caption = 'Boot Disc Parameter (load disc from virtual drive)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 56
      Top = 6
      Width = 136
      Height = 16
      Caption = 'Virtual Drive Executable'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 16
      Top = 52
      Width = 189
      Height = 16
      Caption = 'Mount Parameter ("%s" required)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 222
      Top = 52
      Width = 116
      Height = 16
      Caption = 'Unmount Parameter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 32
      Top = 411
      Width = 308
      Height = 16
      Caption = 'Floppy Disk Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 32
      Top = 480
      Width = 321
      Height = 16
      Caption = 'Cassette Tape Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 12
      Top = 224
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 247
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 293
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 316
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 362
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 385
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 431
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 454
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 500
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 523
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 204
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconDiscImage: TImage
      Left = 12
      Top = 273
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconBootDisc: TImage
      Left = 12
      Top = 342
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconFloppyDisk: TImage
      Left = 12
      Top = 411
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconCassetteTape: TImage
      Left = 12
      Top = 480
      Width = 16
      Height = 16
      Transparent = True
    end
    object EmuIcon: TImage
      Left = 13
      Top = 140
      Width = 32
      Height = 32
      IncrementalDisplay = True
      Transparent = True
    end
    object VirtualDriveIconFrame: TBevelEx
      Left = 12
      Top = 10
      Width = 34
      Height = 34
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object VirtualDriveIcon: TImage
      Left = 13
      Top = 11
      Width = 32
      Height = 32
      IncrementalDisplay = True
      Transparent = True
    end
    object IconCartridgeReset: TImage
      Tag = 1
      Left = 380
      Top = 204
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object IconDiscImageReset: TImage
      Tag = 21
      Left = 380
      Top = 273
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object IconBootDiscReset: TImage
      Tag = 22
      Left = 380
      Top = 342
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object IconFloppyDiskReset: TImage
      Tag = 3
      Left = 380
      Top = 411
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object IconCassetteTapeReset: TImage
      Tag = 4
      Left = 380
      Top = 480
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object Emulator1PageButton: TSpeedButtonEx
      Tag = 1
      Left = 12
      Top = 101
      Width = 90
      Height = 25
      GroupIndex = 1
      Down = True
      Caption = 'Emulator 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = Emulator1PageButtonClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object Emulator2PageButton: TSpeedButtonEx
      Tag = 2
      Left = 101
      Top = 104
      Width = 90
      Height = 22
      GroupIndex = 1
      Caption = 'Emulator 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = Emulator1PageButtonClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object Emulator3PageButton: TSpeedButtonEx
      Tag = 3
      Left = 190
      Top = 104
      Width = 90
      Height = 22
      GroupIndex = 1
      Caption = 'Emulator 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = Emulator1PageButtonClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object Emulator4PageButton: TSpeedButtonEx
      Tag = 4
      Left = 279
      Top = 104
      Width = 90
      Height = 22
      GroupIndex = 1
      Caption = 'Emulator 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = Emulator1PageButtonClick
      FontColorDisabled = clBtnShadow
      FontShadowColorDisabled = clBtnHighlight
      GradientColorTop_Disabled = clSilver
      GradientColorBottom_Disabled = clMedGray
      FrameColor_Disabled = clGray
    end
    object PageButtonsBottomLine: TBevelEx
      Left = 2
      Top = 124
      Width = 422
      Height = 2
      Shape = bsTopLine
      CustomColor1 = clBlack
      CustomColor2 = clBlack
    end
    object LabelEmuHardDiskDriveParameter: TShadowLabel
      Left = 32
      Top = 549
      Width = 333
      Height = 16
      Caption = 'Hard Disk Drive Parameter ("%s" tag required for filename)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
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
      Left = 12
      Top = 569
      Width = 38
      Height = 14
      Caption = 'Param1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 592
      Width = 38
      Height = 14
      Caption = 'Param2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
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
      Left = 12
      Top = 549
      Width = 16
      Height = 16
      Transparent = True
    end
    object IconHardDiskDriveReset: TImage
      Tag = 5
      Left = 380
      Top = 549
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Reload default parameter from "emulator_parameters[default].ini"'
      Transparent = True
      OnClick = IconCartridgeResetClick
      OnMouseDown = IconCartridgeResetMouseDown
      OnMouseUp = IconCartridgeResetMouseUp
    end
    object VirtualDriveFileNotFoundIcon: TImage
      Left = 326
      Top = 6
      Width = 16
      Height = 16
      Hint = 'Warning: file not found!'
      Transparent = True
      Visible = False
    end
    object EmuFileNotFoundIcon: TImage
      Left = 348
      Top = 135
      Width = 16
      Height = 16
      Hint = 'Warning: file not found!'
      Transparent = True
      Visible = False
    end
    object EmulatorFile: TEditEx
      Left = 52
      Top = 152
      Width = 313
      Height = 21
      Hint = '1'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 6
      OnChange = EmulatorFileChange
    end
    object ButtonClearEmulator: TBitBtnEx
      Left = 374
      Top = 114
      Width = 41
      Height = 24
      Hint = 'Clear emulator 1 settings (emulator and parameters)'
      Caption = 'Clear'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonClearEmulatorClick
    end
    object ButtonDaemonToolsHelp: TBitBtnEx
      Left = 394
      Top = 23
      Width = 21
      Height = 21
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonDaemonToolsHelpClick
    end
    object DaemonToolsFile: TEditEx
      Tag = 1
      Left = 52
      Top = 23
      Width = 290
      Height = 21
      Hint = '1'
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      OnChange = DaemonToolsFileChange
    end
    object ButtonSelectDaemonTools: TBitBtnEx
      Left = 345
      Top = 23
      Width = 47
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 3
      OnClick = ButtonSelectDaemonToolsClick
    end
    object DaemonToolsMount: TEditEx
      Tag = 1
      Left = 12
      Top = 69
      Width = 197
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnChange = DaemonToolsMountChange
    end
    object DaemonToolsUnmount: TEditEx
      Tag = 1
      Left = 218
      Top = 69
      Width = 197
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnChange = DaemonToolsUnmountChange
    end
    object ButtonSelectEmulator: TBitBtnEx
      Left = 368
      Top = 152
      Width = 47
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      TabOrder = 7
      OnClick = ButtonSelectEmulatorClick
    end
    object EmuDescription: TEditEx
      Tag = 1
      Left = 52
      Top = 175
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnChange = EmuDescriptionChange
    end
    object EmuCartridgeParameter: TEditEx
      Left = 52
      Top = 221
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      OnChange = EmuCartridgeParameterChange
    end
    object EmuDiscImageParameter: TEditEx
      Left = 52
      Top = 290
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
      OnChange = EmuDiscImageParameterChange
    end
    object EmuBootDiscParameter: TEditEx
      Left = 52
      Top = 359
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
      OnChange = EmuBootDiscParameterChange
    end
    object EmuFloppyDiskParameter: TEditEx
      Left = 52
      Top = 428
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 12
      OnChange = EmuFloppyDiskParameterChange
    end
    object EmuCassetteTapeParameter: TEditEx
      Left = 52
      Top = 497
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
      OnChange = EmuCassetteTapeParameterChange
    end
    object EmuCartridgeParameter2: TEditEx
      Left = 52
      Top = 244
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 14
      OnChange = EmuCartridgeParameter2Change
    end
    object EmuDiscImageParameter2: TEditEx
      Left = 52
      Top = 313
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
      OnChange = EmuDiscImageParameter2Change
    end
    object EmuBootDiscParameter2: TEditEx
      Left = 52
      Top = 382
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
      OnChange = EmuBootDiscParameter2Change
    end
    object EmuFloppyDiskParameter2: TEditEx
      Left = 52
      Top = 451
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 17
      OnChange = EmuFloppyDiskParameter2Change
    end
    object EmuCassetteTapeParameter2: TEditEx
      Left = 52
      Top = 520
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 18
      OnChange = EmuCassetteTapeParameter2Change
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
      object ButtonInstructions: TBitBtnEx
        Left = 164
        Top = 8
        Width = 47
        Height = 25
        Caption = 'Help'
        TabOrder = 0
        OnClick = ButtonInstructionsClick
      end
      object ButtonOk: TBitBtnEx
        Left = 225
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close and update settings'
        Caption = 'Apply'
        ModalResult = 1
        TabOrder = 1
      end
      object ButtonCancel: TBitBtnEx
        Left = 329
        Top = 8
        Width = 89
        Height = 25
        Hint = 'Close without updating'
        Caption = 'Abort'
        ModalResult = 2
        TabOrder = 2
      end
      object ButtonSelectFolders: TBitBtnEx
        Left = 12
        Top = 8
        Width = 125
        Height = 25
        Hint = 'Click here to select games folders for all systems'
        Caption = 'Select Games Folders'
        TabOrder = 3
        OnClick = ButtonSelectFoldersClick
      end
    end
    object EmuHardDiskDriveParameter: TEditEx
      Left = 52
      Top = 566
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 20
      OnChange = EmuHardDiskDriveParameterChange
    end
    object EmuHardDiskDriveParameter2: TEditEx
      Left = 52
      Top = 589
      Width = 363
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 21
      OnChange = EmuHardDiskDriveParameter2Change
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
      Width = 290
      Height = 19
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
    end
    object LabelSystemType: TShadowLabel
      Left = 134
      Top = 23
      Width = 65
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
    end
    object IconSystemType: TImage
      Left = 112
      Top = 24
      Width = 16
      Height = 16
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
    Height = 68
    Width = 68
    Left = 144
    Top = 136
  end
end
