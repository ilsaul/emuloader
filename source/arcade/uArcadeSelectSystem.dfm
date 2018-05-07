object FormArcadeSelectSystem: TFormArcadeSelectSystem
  Left = 619
  Top = 509
  ActiveControl = SystemsListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select One or More Systems'
  ClientHeight = 390
  ClientWidth = 624
  Color = clWhite
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelList: TPanelEx
    Left = 0
    Top = 0
    Width = 250
    Height = 331
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSolid
    object LabelEmuTitle: TShadowLabel
      Left = 10
      Top = 292
      Width = 230
      Height = 38
      Alignment = taCenter
      AutoSize = False
      Caption = 'SYSTEM TITLE'
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = False
      WordWrap = True
    end
    object SystemsListView: TEasyListview
      Tag = -1
      Left = 8
      Top = 8
      Width = 260
      Height = 276
      BorderStyle = bsNone
      CellSizes.Icon.Height = 92
      CellSizes.Icon.Width = 78
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -9
      EditManager.Font.Name = 'Verdana'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clWindowText
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        0006000000800800010100010000000000000104010000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.FixedSingleColumn = True
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      ImagesLarge = IL_Systems
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.ShowBorder = False
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendColorSelRect = 10902593
      Selection.BlendIcon = False
      Selection.BorderColor = 10902593
      Selection.BorderColorSelRect = 10902593
      Selection.Color = 10902593
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.GradientColorBottom = 16506264
      Selection.GradientColorTop = 15582647
      Selection.InactiveBorderColor = 10902593
      Selection.InactiveColor = 15582647
      Selection.MouseButton = [cmbLeft, cmbRight]
      Selection.RectSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      OnDblClick = SystemsListViewDblClick
      OnItemPaintText = SystemsListViewItemPaintText
      OnItemSelectionChanged = SystemsListViewItemSelectionChanged
      OnKeyAction = SystemsListViewKeyAction
    end
  end
  object PanelButtons: TPanelEx
    Left = 0
    Top = 342
    Width = 624
    Height = 48
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelMultiSelect: TShadowLabel
      Left = 22
      Top = 0
      Width = 206
      Height = 16
      Caption = 'Hold Ctrl or Shift for multiple selections'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 14540253
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ButtonOk: TBitBtn
      Left = 427
      Top = 13
      Width = 89
      Height = 25
      Hint = 'Close and continue'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 525
      Top = 13
      Width = 89
      Height = 25
      Hint = 'Close and cancel operation'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox
    Left = 380
    Top = 323
    Width = 228
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = 7891291
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 2
    OnClick = AddMAMEDeviceSetWithNoROMsClick
    Alignment = taLeftJustify
    Caption = 'Add MAME Device Sets With No ROMs'
    ReturnIsTab = False
    Themed = True
  end
  object MAMESoftwareListBox: TAdvGroupBox
    Tag = 1
    Left = 250
    Top = 184
    Width = 364
    Height = 131
    RoundEdges = True
    Caption = '           MAME Software List Games '
    Ctl3D = True
    TabOrder = 3
    object ShadowLabel1: TShadowLabel
      Left = 172
      Top = 32
      Width = 186
      Height = 16
      Caption = '(do not create lists and delete files)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ShadowLabel2: TShadowLabel
      Left = 161
      Top = 58
      Width = 197
      Height = 16
      Caption = '(create new lists and update old lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ShadowLabel3: TShadowLabel
      Left = 170
      Top = 84
      Width = 188
      Height = 16
      Caption = '(delete all files and create new lists)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelCustomizeMAMESoftwareList: TShadowLabel
      Left = 45
      Top = 107
      Width = 275
      Height = 14
      Cursor = crHandPoint
      Caption = 'customize, disable software lists you don'#39't want'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      OnClick = LabelCustomizeMAMESoftwareListClick
      OnMouseEnter = LabelCustomizeMAMESoftwareListMouseEnter
      OnMouseLeave = LabelCustomizeMAMESoftwareListMouseLeave
    end
    object ImageMAMESoftwareList: TImage
      Left = 21
      Top = 0
      Width = 16
      Height = 16
    end
    object Shape2: TShape
      Left = 212
      Top = 8
      Width = 137
      Height = 1
      Pen.Color = clWhite
    end
    object LabelCreateSoftwareListGames: TShadowLabel
      Left = 217
      Top = 1
      Width = 109
      Height = 16
      Caption = '(console/computer)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object MAMESoftwareList_Disabled: TAdvOfficeRadioButton
      Left = 9
      Top = 30
      Width = 69
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Disable'
      ReturnIsTab = False
      Themed = True
    end
    object MAMESoftwareList_EnabledUpdate: TAdvOfficeRadioButton
      Tag = 1
      Left = 9
      Top = 56
      Width = 144
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Enable: Update Mode'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object MAMESoftwareList_EnabledOverwrite: TAdvOfficeRadioButton
      Tag = 2
      Left = 9
      Top = 82
      Width = 155
      Height = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = MAMESoftwareList_EnabledUpdateClick
      Alignment = taLeftJustify
      Caption = 'Enable: Overwrite Mode'
      ReturnIsTab = False
      Themed = True
    end
    object ButtonHelpCreateMAMESoftwareListGames: TBitBtn
      Left = 328
      Top = 0
      Width = 17
      Height = 17
      Hint = 'What is this ?'
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = ButtonHelpCreateMAMESoftwareListGamesClick
    end
  end
  object ScanModeBox: TAdvGroupBox
    Left = 250
    Top = 8
    Width = 364
    Height = 159
    RoundEdges = True
    Caption = '           Choose Scan Mode '
    Ctl3D = True
    TabOrder = 4
    object LabelForceAllAvailable: TLabel
      Left = 167
      Top = 84
      Width = 188
      Height = 15
      Caption = '(no validation or file search is done)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelQuickScan: TLabel
      Left = 94
      Top = 58
      Width = 261
      Height = 15
      Caption = '(search .zip; .7z; .chd game/bios/device files only)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object LabelFullScan: TLabel
      Left = 84
      Top = 32
      Width = 271
      Height = 15
      Caption = '(validate all ROMs/CHDs, CRC32/SHA-1 checksum)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
    end
    object ScanModeIcon: TImage
      Left = 21
      Top = 0
      Width = 16
      Height = 16
    end
    object Shape1: TShape
      Left = 224
      Top = 8
      Width = 125
      Height = 1
      Pen.Color = clWhite
    end
    object ScanModeCurrentTaskOnly: TAdvOfficeCheckBox
      Left = 229
      Top = -1
      Width = 115
      Height = 20
      Hint = 
        'The selected mode will be used only for the current task'#13#10'Unchec' +
        'k this option to change scan mode permanently'
      ShowHint = True
      TabOrder = 0
      Alignment = taRightJustify
      Caption = 'For This Task Only'
      ReturnIsTab = False
      Themed = True
    end
    object QuickScan: TAdvOfficeRadioButton
      Tag = 1
      Left = 9
      Top = 56
      Width = 82
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Quick Scan'
      ReturnIsTab = False
      Themed = True
    end
    object FullScan: TAdvOfficeRadioButton
      Left = 9
      Top = 30
      Width = 69
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Full Scan'
      Checked = True
      ReturnIsTab = False
      Themed = True
    end
    object ScanMAMESetsBox: TAdvGroupBox
      Left = 7
      Top = 114
      Width = 349
      Height = 41
      BorderStyle = bsNone
      Transparent = False
      Caption = '         Scan MAME Sets (v0.162 or newer)'
      Ctl3D = True
      TabOrder = 3
      object ImageScanMAME: TImage
        Left = 14
        Top = 0
        Width = 16
        Height = 16
      end
      object ScanMAMEAllSets: TAdvOfficeRadioButton
        Left = 2
        Top = 20
        Width = 62
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = ScanMAMEAllSetsClick
        Alignment = taLeftJustify
        Caption = 'All Sets'
        Checked = True
        ReturnIsTab = False
        Themed = True
      end
      object ScanMAMEArcadeMachines: TAdvOfficeRadioButton
        Tag = 1
        Left = 81
        Top = 20
        Width = 118
        Height = 20
        TabOrder = 1
        OnClick = ScanMAMEAllSetsClick
        Alignment = taLeftJustify
        Caption = 'Arcade/Machines'
        ReturnIsTab = False
        Themed = True
      end
      object ScanMAMESoftwareListGames: TAdvOfficeRadioButton
        Tag = 2
        Left = 217
        Top = 20
        Width = 131
        Height = 20
        TabOrder = 2
        OnClick = ScanMAMEAllSetsClick
        Alignment = taLeftJustify
        Caption = 'Software List Games'
        ReturnIsTab = False
        Themed = True
      end
    end
    object ForceAllAvailable: TAdvOfficeRadioButton
      Tag = 2
      Left = 9
      Top = 82
      Width = 144
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = FullScanClick
      Alignment = taLeftJustify
      Caption = 'Force Games Available'
      ReturnIsTab = False
      Themed = True
    end
  end
  object IL_Systems: TImageList
    Height = 68
    Width = 68
    Left = 272
    Top = 328
  end
end
