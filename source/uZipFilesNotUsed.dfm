object FormZipFilesNotUsed: TFormZipFilesNotUsed
  Left = 601
  Top = 242
  ActiveControl = ZipFilesListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Not Used Game Files'
  ClientHeight = 612
  ClientWidth = 704
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ZipFilesListView: TEasyListview
    Left = 0
    Top = 0
    Width = 704
    Height = 511
    Align = alClient
    BorderStyle = bsNone
    CellSizes.Report.Height = 22
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
    GroupFont.Color = clMaroon
    GroupFont.Height = -15
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000010001B5010000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000178000000FFFFFF1F0001000000010000000400000053006900
      7A006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE0006000000800800010100010200000000000181000000FF
      FFFF1F0001000000010000000B000000440061007400650020002F0020005400
      69006D006500000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Consolas'
    Header.Font.Style = []
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_ArcadeSystem_Small
    ImagesSmall = FormMain.IL_LeftPanel
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clBlack
    PaintInfoGroup.BandIndent = 22
    PaintInfoGroup.BandLength = 700
    PaintInfoGroup.BandMargin = 0
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 5
    PaintInfoGroup.ImageIndent = 12
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 10902593
    PaintInfoItem.CheckIndent = 32
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    ShowGroupMargins = True
    ShowThemedBorder = False
    ShowHint = True
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
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.MultiSelect = True
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    OnColumnClick = ZipFilesListViewColumnClick
    OnGroupCompare = ZipFilesListViewGroupCompare
    OnItemCompare = ZipFilesListViewItemCompare
    OnItemPaintText = ZipFilesListViewItemPaintText
    OnKeyAction = ZipFilesListViewKeyAction
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 538
    Width = 704
    Height = 74
    Align = alBottom
    Color1 = 15856113
    Color2 = 15856113
    Color3 = 16641245
    Color4 = 16637122
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    ShowHint = True
    Style = vgSolid
    object LabelDestinationFolder: TShadowLabel
      Left = 8
      Top = 1
      Width = 38
      Height = 19
      Caption = 'Folder'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ButtonDeleteFiles: TBitBtn
      Left = 8
      Top = 40
      Width = 89
      Height = 25
      Hint = 'Delete all files (no recycle bin support!)'
      Caption = 'Delete All'
      TabOrder = 0
      OnClick = ButtonDeleteFilesClick
    end
    object ButtonRemoveSelected: TBitBtn
      Left = 422
      Top = 40
      Width = 110
      Height = 25
      Hint = 
        'Remove selected files from the list without deleting them [DELET' +
        'E hotkey]'
      Caption = 'Remove From List'
      TabOrder = 2
      OnClick = ButtonRemoveSelectedClick
    end
    object ButtonSaveToFile: TBitBtn
      Left = 553
      Top = 40
      Width = 68
      Height = 25
      Hint = 'Save contents of the files list to a .txt file'
      Caption = 'Save to File'
      TabOrder = 3
      OnClick = ButtonSaveToFileClick
    end
    object ButtonHelp: TBitBtn
      Left = 627
      Top = 8
      Width = 68
      Height = 25
      Hint = 'How do I use this thing ? :)'
      Caption = 'Help'
      TabOrder = 4
      OnClick = ButtonHelpClick
    end
    object ButtonClose: TBitBtn
      Left = 627
      Top = 40
      Width = 68
      Height = 25
      Hint = 'Close this window'
      Caption = 'Exit'
      ModalResult = 1
      TabOrder = 5
    end
    object ButtonMoveFiles: TBitBtn
      Tag = 2
      Left = 216
      Top = 40
      Width = 89
      Height = 25
      Hint = 'Move all files to another folder'
      Caption = 'Move All'
      TabOrder = 6
      OnClick = ButtonDeleteFilesClick
    end
    object DestinationFolder: TEdit
      Left = 46
      Top = 0
      Width = 419
      Height = 21
      AutoSize = False
      TabOrder = 7
    end
    object ButtonSelectROMsFolder: TBitBtn
      Left = 465
      Top = 0
      Width = 43
      Height = 21
      Hint = 'Click here to select a folder'
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = ButtonSelectROMsFolderClick
    end
    object ButtonDeleteSelectedFiles: TBitBtn
      Tag = 3
      Left = 104
      Top = 40
      Width = 89
      Height = 25
      Hint = 'Delete selected files (no recycle bin support!)'
      Caption = 'Delete Selected'
      TabOrder = 9
      OnClick = ButtonDeleteFilesClick
    end
    object ButtonMoveSelectedFiles: TBitBtn
      Tag = 1
      Left = 312
      Top = 40
      Width = 89
      Height = 25
      Hint = 'Move selected files to another folder'
      Caption = 'Move Selected'
      TabOrder = 1
      OnClick = ButtonDeleteFilesClick
    end
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 511
    Width = 704
    Height = 27
    Align = alBottom
    Color1 = 16445669
    Color2 = 15856113
    Color3 = 16707808
    Color4 = 16112579
    ColorFrame = 7891291
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object LabelTotalItems: TShadowLabel
      Left = 553
      Top = 2
      Width = 149
      Height = 18
      Hint = '%u Files (%s) '
      Alignment = taRightJustify
      Caption = '00000 Files (0000.00 KB) '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object LabelCopyMoveDestination: TShadowLabel
      Left = 46
      Top = 8
      Width = 261
      Height = 19
      Caption = 'Select a folder to move files. Full Paths only!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object CopyMoveOverwriteFiles: TAdvOfficeCheckBox
      Left = 370
      Top = 5
      Width = 141
      Height = 20
      Hint = 
        'Check this option to ovewrite existing files in the destination ' +
        'folder'
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Overwrite Existing Files'
      ReturnIsTab = False
      Themed = True
    end
  end
end
