object FormSoftwareListMachineToRunGame: TFormSoftwareListMachineToRunGame
  Left = 569
  Top = 357
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Select a Machine to Run The Game With'
  ClientHeight = 401
  ClientWidth = 619
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
  object LabelSoftwarelistTitle: TShadowLabel
    Left = 79
    Top = 63
    Width = 460
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Software list description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clMaroon
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    Layout = tlCenter
  end
  object LabelTotalMachines: TShadowLabel
    Left = 8
    Top = 65
    Width = 66
    Height = 12
    Caption = 'Total 000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    ShadowColor = clMaroon
    ShadowEnabled = False
    EllipsType = etNone
    Transparent = True
    Layout = tlCenter
  end
  object PanelMessages: TPanelEx
    Left = 0
    Top = 360
    Width = 619
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtn
      Left = 419
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Confirm'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonNo: TBitBtn
      Left = 522
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Abort'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ButtonResetToCurrent: TBitBtn
      Left = 8
      Top = 8
      Width = 43
      Height = 25
      Hint = 'Reset selection to current machine'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonResetToCurrentClick
    end
    object ShowAvailableMachinesOnly: TAdvOfficeCheckBox
      Left = 55
      Top = 11
      Width = 181
      Height = 20
      Hint = 'Check to hide all machines you don'#39't have ROMs for'
      ShowHint = True
      TabOrder = 3
      OnClick = ShowAvailableMachinesOnlyClick
      Alignment = taLeftJustify
      Caption = 'Show Available Machines Only'
      ReturnIsTab = False
      Themed = True
    end
    object HidePreliminaryMachines: TAdvOfficeCheckBox
      Left = 247
      Top = 11
      Width = 163
      Height = 20
      Hint = 'Hide machines with drivers tagged as preliminary'
      ShowHint = True
      TabOrder = 4
      OnClick = ShowAvailableMachinesOnlyClick
      Alignment = taLeftJustify
      Caption = 'Hide Preliminary Machines'
      ReturnIsTab = False
      Themed = True
    end
  end
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 619
    Height = 60
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object MessageIcon: TImage
      Left = 1
      Top = 1
      Width = 48
      Height = 48
      Transparent = True
    end
    object LabelTitle: TShadowLabel
      Left = 56
      Top = 1
      Width = 555
      Height = 27
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
      ShadowColor = clMaroon
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameNameCloneOf: TShadowLabel
      Left = 56
      Top = 28
      Width = 198
      Height = 13
      Caption = 'name: gamename [clone of gamename]'
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
    object LabelUsage: TShadowLabel
      Left = 56
      Top = 41
      Width = 537
      Height = 13
      AutoSize = False
      Caption = 'usage:'
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
      Visible = False
    end
  end
  object MachinesListView: TEasyListview
    Left = 8
    Top = 79
    Width = 603
    Height = 271
    CellSizes.Report.Height = 20
    Color = clWhite
    DisabledBlendAlpha = 0
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = FormMain.IL_GroupedMode
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
      0600000005000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000123010000FFFFFF1F0001000000
      01000000070000004D0061006300680069006E00650000000000000000000000
      0000110000005445617379436F6C756D6E53746F726564FFFECE000600000080
      080001010001010000000000015F000000FFFFFF1F0001000000010000000400
      00004E0061006D00650000000000000000000000000011000000544561737943
      6F6C756D6E53746F726564FFFECE000600000080080001010001020000000000
      01AA000000FFFFFF1F0001000000010000000C0000004D0061006E0075006600
      6100630074007500720065007200000000000000000000000000110000005445
      617379436F6C756D6E53746F726564FFFECE0006000000800800010100010300
      00000000012D000000FFFFFF1F0001000000010000000200000048007A000000
      00000000000000000000110000005445617379436F6C756D6E53746F726564FF
      FECE000600000080000001010001040000000000015F000000FFFFFF1F000100
      0000010000000800000043006C006F006E00650020006F006600000000000000
      000000000000}
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
    ImagesSmall = FormMain.IL_StandardIconsSmall
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandEnabled = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.Size = 0
    PaintInfoGroup.MarginBottom.Visible = True
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoGroup.MarginTop.Size = 20
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Selection.BlendAlphaImage = 0
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
    TabOrder = 2
    View = elsReport
    OnColumnClick = MachinesListViewColumnClick
    OnItemPaintText = MachinesListViewItemPaintText
    OnItemSelectionChanged = MachinesListViewItemSelectionChanged
  end
end
