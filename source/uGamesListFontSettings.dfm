object FormGamesListFontSettings: TFormGamesListFontSettings
  Left = 605
  Top = 378
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 
    'Games List Font Settings [Mouse Double-click / ENTER Key to Cust' +
    'omize]'
  ClientHeight = 290
  ClientWidth = 492
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
  object Shape1: TShape
    Left = 0
    Top = 208
    Width = 492
    Height = 1
    Brush.Color = clBtnFace
    Pen.Color = 7891291
  end
  object GamesFont: TEasyListview
    Left = 0
    Top = 0
    Width = 492
    Height = 208
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
      00060000008008000101000100000000000001E8010000FFFFFF1F0001000000
      00000000000000000000000000000000}
    Header.Draggable = False
    Header.FixedSingleColumn = True
    Header.Height = 23
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesSmall = IL_FontSettings
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.Border = 20
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.CaptionIndent = 2
    PaintInfoItem.ShowBorder = False
    ParentShowHint = False
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
  object ButtonResetFont: TBitBtn
    Left = 9
    Top = 217
    Width = 89
    Height = 25
    Hint = 'Reset all fonts to current settings'
    Caption = 'Reset'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonResetFontClick
  end
  object ButtonDefaultFont: TBitBtn
    Left = 137
    Top = 217
    Width = 89
    Height = 25
    Hint = 'Set all fonts to default settings'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonDefaultFontClick
  end
  object ButtonCopyParentFont: TBitBtn
    Left = 265
    Top = 217
    Width = 89
    Height = 25
    Hint = 'Copy parent font on all other categories'
    Caption = 'Copy Parent'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonCopyParentFontClick
  end
  object ButtonClearSelection: TBitBtn
    Left = 394
    Top = 217
    Width = 89
    Height = 25
    Hint = 'De-select items in the list for a better view'
    Caption = 'Clear Selection'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonClearSelectionClick
  end
  object PanelEx1: TPanelEx
    Left = 0
    Top = 249
    Width = 492
    Height = 41
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 152
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
      Left = 250
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
  object IL_FontSettings: TImageList
    Height = 32
    Width = 32
    Left = 360
    Top = 48
  end
end
