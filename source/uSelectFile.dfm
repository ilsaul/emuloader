object FormSelectFile: TFormSelectFile
  Left = 907
  Top = 526
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Load an Input File'
  ClientHeight = 402
  ClientWidth = 604
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object FilesFolder: TShadowLabel
    Left = 5
    Top = 269
    Width = 593
    Height = 19
    AutoSize = False
    Caption = 'Folder of selected file...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
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
  object LabelNewFilename: TShadowLabel
    Left = 132
    Top = 293
    Width = 225
    Height = 16
    Alignment = taRightJustify
    Caption = 'New Name (file extention not required)'
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
    Transparent = True
  end
  object FilesListView: TEasyListview
    Left = -1
    Top = 55
    Width = 606
    Height = 207
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
    GroupFont.Height = -12
    GroupFont.Name = 'Segoe UI'
    GroupFont.Style = []
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000001000166010000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      0100000000000178000000FFFFFF1F0001000000010000000400000053006900
      7A006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE000600000080080001010001020000000000017D000000FF
      FFFF1F0001000000010000000B000000440061007400650020002F0020005400
      69006D006500000000000000000000000000}
    Header.Draggable = False
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clBlack
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    PaintInfoColumn.Border = 2
    PaintInfoColumn.CaptionIndent = 0
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
    Selection.Gradient = True
    Selection.GradientColorBottom = 16506264
    Selection.GradientColorTop = 15582647
    Selection.InactiveBorderColor = 10902593
    Selection.InactiveColor = 15582647
    Selection.MouseButton = [cmbLeft, cmbRight]
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
    Top = 323
    Width = 604
    Height = 79
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelShortcuts: TShadowLabel
      Left = 142
      Top = 17
      Width = 319
      Height = 14
      Caption = 
        'Shortcuts [ENTER: Select | ESC: Cancel | DELETE: Delete Selected' +
        ' File]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object ButtonOk: TBitBtn
      Left = 208
      Top = 47
      Width = 89
      Height = 25
      Hint = 'Close and set selected file'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 306
      Top = 47
      Width = 89
      Height = 25
      Hint = 'Close and abort'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object PanelGameTitle: TPanelEx
    Left = 0
    Top = 0
    Width = 604
    Height = 52
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object SystemIcon: TImage
      Tag = -50
      Left = 4
      Top = 4
      Width = 32
      Height = 32
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 40
      Top = 4
      Width = 556
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
      ShadowColor = clSkyBlue
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameNameCloneOf: TShadowLabel
      Left = 40
      Top = 34
      Width = 545
      Height = 13
      AutoSize = False
      Caption = 
        'name: gamename [clone of gamename] [bios: biosname] [merged] [xm' +
        'l file: softwarename]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
  end
  object NewFilename: TEdit
    Left = 361
    Top = 291
    Width = 238
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnKeyPress = NewFilenameKeyPress
  end
end
