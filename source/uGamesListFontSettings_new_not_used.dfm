object FormGamesListFontSettings: TFormGamesListFontSettings
  Left = 1442
  Top = 935
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 
    'Games List Font Settings [Mouse Double-click / ENTER Key to Cust' +
    'omize]'
  ClientHeight = 392
  ClientWidth = 619
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
  object GamesFont: TEasyListview
    Left = 4
    Top = 4
    Width = 611
    Height = 302
    BackGround.Enabled = True
    CellSizes.Report.Height = 40
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    UseDockManager = False
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
      000600000080080001010001000000000000015D020000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Height = 23
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesGroup = FormMain.IL_ArcadeSystem_Large
    ImagesSmall = IL_FontSettings
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.Border = 20
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 2
    PaintInfoItem.ShowBorder = False
    ParentShowHint = False
    ShowGroupMargins = True
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
    Selection.RoundRectRadius = 2
    Selection.TextColor = clBlack
    Selection.UseFocusRect = False
    TabOrder = 0
    View = elsReport
    OnDblClick = GamesFontDblClick
    OnItemPaintText = GamesFontItemPaintText
    OnItemSelectionChanged = GamesFontItemSelectionChanged
    OnKeyAction = GamesFontKeyAction
  end
  object PanelBottomButtons: TPanelEx
    Left = 0
    Top = 351
    Width = 619
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 216
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ButtonCancel: TBitBtn
      Left = 314
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object PanelBottomListButtons: TPanelEx
    Left = 0
    Top = 310
    Width = 619
    Height = 41
    Align = alBottom
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frTop]
    ParentBackground = False
    Style = vgSolid
    object ButtonClearSelection: TBitBtn
      Left = 394
      Top = 8
      Width = 89
      Height = 25
      Hint = 'De-select items in the list for a better view'
      Caption = 'Clear Selection'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonClearSelectionClick
    end
    object ButtonCopyParentFont: TBitBtn
      Left = 265
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Copy parent font on all other categories'
      Caption = 'Copy Parent'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonCopyParentFontClick
    end
    object ButtonDefaultFont: TBitBtn
      Left = 137
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Set all fonts to default settings'
      Caption = 'Default'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonDefaultFontClick
    end
    object ButtonResetFont: TBitBtn
      Left = 9
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Reset all fonts to current settings'
      Caption = 'Reset'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ButtonResetFontClick
    end
  end
  object IL_FontSettings: TImageList
    Height = 32
    Width = 32
    Left = 360
    Top = 48
  end
end
