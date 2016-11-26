object FormSelectSystem: TFormSelectSystem
  Left = 619
  Top = 509
  ActiveControl = SystemsListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select One or More Systems'
  ClientHeight = 358
  ClientWidth = 718
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
  object LabelSelectMode: TLabel
    Left = 219
    Top = 147
    Width = 102
    Height = 15
    Caption = 'Choose Scan Mode'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelForceAllAvailable: TLabel
    Left = 344
    Top = 230
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
    Left = 276
    Top = 204
    Width = 256
    Height = 15
    Caption = '(search for .zip;.7z game files only, no validation)'
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
    Left = 261
    Top = 178
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
    Left = 199
    Top = 146
    Width = 16
    Height = 16
  end
  object LabelMultiSelect: TShadowLabel
    Left = 4
    Top = 129
    Width = 110
    Height = 31
    AutoSize = False
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
    WordWrap = True
  end
  object ScanModeCurrentTaskOnly: TAdvOfficeCheckBox
    Left = 415
    Top = 145
    Width = 115
    Height = 20
    Hint = 
      'The selected mode will be used only for the current task'#13#10'Unchec' +
      'k this option to change scan mode permanently'
    Checked = True
    ShowHint = True
    TabOrder = 5
    Alignment = taRightJustify
    Caption = 'For This Task Only'
    ReturnIsTab = False
    State = cbChecked
    Themed = True
  end
  object ForceAllAvailable: TAdvOfficeRadioButton
    Left = 186
    Top = 228
    Width = 144
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = 'Force Games Available'
    ReturnIsTab = False
    Themed = True
  end
  object QuickScan: TAdvOfficeRadioButton
    Left = 186
    Top = 202
    Width = 82
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = 'Quick Scan'
    ReturnIsTab = False
    Themed = True
  end
  object FullScan: TAdvOfficeRadioButton
    Left = 186
    Top = 176
    Width = 69
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    Alignment = taLeftJustify
    Caption = 'Full Scan'
    Checked = True
    ReturnIsTab = False
    Themed = True
  end
  object PanelList: TPanelEx
    Left = 0
    Top = 0
    Width = 718
    Height = 125
    Align = alTop
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object LabelEmuTitle: TShadowLabel
      Left = 0
      Top = 108
      Width = 718
      Height = 16
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
      Layout = tlCenter
    end
    object SystemsListView: TEasyListview
      Tag = -1
      Left = 8
      Top = 8
      Width = 720
      Height = 92
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
        00060000008008000101000100000000000001D0020000FFFFFF1F0001000000
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
      ImagesLarge = FormMain.IL_Systems
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
    Top = 310
    Width = 718
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
    object LabelCreateSoftwareListGames: TShadowLabel
      Left = 46
      Top = 25
      Width = 166
      Height = 13
      Caption = 'Add MAME consoles/computers games'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelAddMAMEDeviceSetWithNoROMs: TShadowLabel
      Left = 555
      Top = 25
      Width = 145
      Height = 13
      Caption = 'Add MAME devices with no ROMs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelCustomizeSoftwareList: TShadowLabel
      Left = 6
      Top = 24
      Width = 40
      Height = 13
      Cursor = crHandPoint
      Hint = 'Customize software list'
      Caption = 'custom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
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
      OnClick = LabelCustomizeSoftwareListClick
      OnMouseEnter = LabelCustomizeSoftwareListMouseEnter
      OnMouseLeave = LabelCustomizeSoftwareListMouseLeave
    end
    object ButtonOk: TBitBtn
      Left = 265
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
      Left = 363
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
    object CreateSoftwareListGames: TAdvOfficeCheckBox
      Left = 29
      Top = 7
      Width = 177
      Height = 20
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 2
      OnClick = CreateSoftwareListGamesClick
      Alignment = taLeftJustify
      Caption = 'Create Software List Games'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
    end
    object ButtonHelpCreateSoftwareListGames: TBitBtn
      Left = 6
      Top = 8
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
      OnClick = ButtonHelpCreateSoftwareListGamesClick
    end
    object AddMAMEDeviceSetWithNoROMs: TAdvOfficeCheckBox
      Left = 538
      Top = 7
      Width = 172
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = 7891291
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ShowHint = True
      TabOrder = 4
      OnClick = AddMAMEDeviceSetWithNoROMsClick
      Alignment = taLeftJustify
      Caption = 'Device Sets With No ROMs'
      ReturnIsTab = False
      Themed = True
    end
  end
  object ScanMAMESetsBox: TAdvGroupBox
    Left = 176
    Top = 260
    Width = 367
    Height = 41
    BorderStyle = bsNone
    Transparent = False
    Caption = '            Scan MAME Sets (v0.162 and newer)'
    Ctl3D = True
    TabOrder = 6
    object ImageScanMAME: TImage
      Left = 23
      Top = 0
      Width = 16
      Height = 16
    end
    object ScanMAMEAllSets: TAdvOfficeRadioButton
      Left = 10
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
      Left = 89
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
      Left = 224
      Top = 20
      Width = 139
      Height = 20
      TabOrder = 2
      OnClick = ScanMAMEAllSetsClick
      Alignment = taLeftJustify
      Caption = 'Software List Games'
      ReturnIsTab = False
      Themed = True
    end
  end
end
