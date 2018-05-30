object FormArcadeScanAudioSamples: TFormArcadeScanAudioSamples
  Left = 569
  Top = 272
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Scan Missing Audio Samples'
  ClientHeight = 515
  ClientWidth = 884
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object FilesListView: TEasyListview
    Left = 0
    Top = 0
    Width = 884
    Height = 490
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Tile.Width = 382
    CellSizes.Report.Height = 20
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = IL_Systems
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -15
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000005000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000010001C1010000FFFFFF1F0001000000
      01000000050000005400690074006C0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000169000000FFFFFF1F000100000001000000040000004E00
      61006D006500000000000000000000000000110000005445617379436F6C756D
      6E53746F726564FFFECE00060000008008000101000102000000000001690000
      00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
      6600000000000000000000000000110000005445617379436F6C756D6E53746F
      726564FFFECE0006000000800800010100010300000000000146000000FFFFFF
      1F00010000000100000006000000440072006900760065007200000000000000
      000000000000110000005445617379436F6C756D6E53746F726564FFFECE0006
      00000080080001010001040000000000019B000000FFFFFF1F00010000000100
      00000B000000530061006D0070006C0065002000460069006C00650000000000
      0000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -12
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = []
    Header.Height = 23
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = FormMain.IL_StandardIconsSmall
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandIndent = 20
    PaintInfoGroup.BandLength = 650
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 5
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.ExpandImageIndent = 25
    PaintInfoGroup.ImageIndent = 30
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupAudioSamples
    ShowThemedBorder = False
    ShowHint = True
    Selection.BlendIcon = False
    Selection.FullCellPaint = True
    Selection.FullItemPaint = True
    Selection.FullRowSelect = True
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    OnColumnClick = FilesListViewColumnClick
    OnDblClick = FilesListViewDblClick
    OnItemCompare = FilesListViewItemCompare
    OnItemPaintText = FilesListViewItemPaintText
    OnItemSelectionChanged = FilesListViewItemSelectionChanged
    OnKeyAction = FilesListViewKeyAction
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 490
    Width = 884
    Height = 25
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelDownloadLink: TShadowLabel
      Left = 308
      Top = 6
      Width = 269
      Height = 16
      Cursor = crHandPoint
      Hint = 'http://www.progettosnaps.net/samples_en.html'
      Caption = 'Click here to download samples (Progetto-SNAPS)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = True
      ShadowColor = 15856113
      ShadowEnabled = True
      EllipsType = etNone
      Transparent = True
      OnClick = LabelDownloadLinkClick
      OnMouseEnter = LabelDownloadLinkMouseEnter
      OnMouseLeave = LabelDownloadLinkMouseLeave
    end
    object LabelTotalItems: TShadowLabel
      Left = 4
      Top = 5
      Width = 130
      Height = 16
      Caption = '000000 Missing Samples'
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
  end
  object PopupAudioSamples: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupAudioSamplesMeasureMenuItem
    Left = 184
    Top = 168
    object PopupPlayGame: TMenuItem
      Caption = 'Play'
      ImageIndex = 18
      ShortCut = 13
      OnClick = PopupPlayGameClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupRemoveSelected: TMenuItem
      Caption = 'Remove Selected'
      ShortCut = 46
      OnClick = PopupRemoveSelectedClick
    end
    object PopupClearList: TMenuItem
      Caption = 'Clear List'
      OnClick = PopupClearListClick
    end
    object PopupRebuildList: TMenuItem
      Caption = 'Rebuild List'
      OnClick = PopupRebuildListClick
    end
    object PopupGamesViewMode: TMenuItem
      Caption = '-'
      Hint = 'Games view mode'
    end
    object PopupShowAllGames: TMenuItem
      AutoCheck = True
      Caption = 'Show All Games'
      Checked = True
      RadioItem = True
      OnClick = PopupShowAllGamesClick
    end
    object PopupShowHave: TMenuItem
      AutoCheck = True
      Caption = 'Show Available Games Only'
      RadioItem = True
      OnClick = PopupShowAllGamesClick
    end
    object PopupShowMiss: TMenuItem
      AutoCheck = True
      Caption = 'Show Missing ROMs/CHDs Only'
      RadioItem = True
      OnClick = PopupShowAllGamesClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuSaveListToFile: TMenuItem
      Caption = 'Save List To File'
      Enabled = False
      Visible = False
      OnClick = MenuSaveListToFileClick
    end
  end
  object IL_Systems: TImageList
    Left = 144
    Top = 168
  end
end
