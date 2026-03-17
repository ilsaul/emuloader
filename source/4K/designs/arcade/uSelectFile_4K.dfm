object FormSelectFile4K: TFormSelectFile4K
  Left = 907
  Top = 526
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Load an Input File'
  ClientHeight = 700
  ClientWidth = 1200
  Color = clWhite
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
  object FilesFolder: TShadowLabel
    Left = 10
    Top = 500
    Width = 1180
    Height = 28
    AutoSize = False
    Caption = 'Folder of selected file...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
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
  object LabelNewFilename: TShadowLabel
    Left = 10
    Top = 548
    Width = 573
    Height = 31
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'New Name (file extention not required)'
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
  object FilesListView: TEasyListview
    Left = 10
    Top = 160
    Width = 1180
    Height = 330
    CellSizes.Report.Height = 20
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -21
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000003000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000001000108030000FFFFFF1F0001000000
      01000000040000004E0061006D00650000000000000000000000000011000000
      5445617379436F6C756D6E53746F726564FFFECE000600000080080001010001
      01000000000001B4000000FFFFFF1F0001000000010000000400000053006900
      7A006500000000000000000000000000110000005445617379436F6C756D6E53
      746F726564FFFECE00060000008008000101000102000000000001DC000000FF
      FFFF1F0001000000010000000B000000440061007400650020002F0020005400
      69006D006500000000000000000000000000}
    Header.Draggable = False
    Header.Height = 38
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    ParentShowHint = False
    ShowThemedBorderColor = clSilver
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
    Selection.MouseButton = [cmbLeft, cmbRight]
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 600
    Width = 1200
    Height = 100
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
    object LabelShortcuts: TShadowLabel
      Left = 281
      Top = 5
      Width = 637
      Height = 31
      Caption = 
        'Shortcuts [ENTER: Select | ESC: Cancel | DELETE: Delete Selected' +
        ' File]'
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
    object ButtonOk: TBitBtnEx
      Left = 427
      Top = 47
      Width = 168
      Height = 45
      Hint = 'Close and set selected file'
      Caption = 'Ok'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtnEx
      Left = 605
      Top = 47
      Width = 168
      Height = 45
      Hint = 'Close and abort'
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1200
    Height = 150
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 70
    object SystemIcon: TImage
      Tag = -50
      Left = 10
      Top = 10
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 150
      Top = 10
      Width = 1040
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clSkyBlue
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
      Left = 150
      Top = 100
      Width = 1040
      Height = 24
      AutoSize = False
      Caption = 
        'gamename [clone of gamename] [bios: biosname] [merged] [softlist' +
        ': softwarename]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
      Font.Name = 'Verdana'
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
  end
  object NewFilename: TEditEx
    Left = 591
    Top = 546
    Width = 600
    Height = 36
    TabStop = False
    AutoSize = False
    Color = clWhite
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
end
