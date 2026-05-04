object FormSelectImageLayout: TFormSelectImageLayout
  Left = 1662
  Top = 1025
  ActiveControl = LayoutsListView
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select Image Layout'
  ClientHeight = 334
  ClientWidth = 520
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PanelImageLayouts: TPanelEx
    Tag = 1
    Left = 0
    Top = 0
    Width = 523
    Height = 285
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSolid
    object LabelLayoutTitle: TShadowLabel
      Left = 0
      Top = 268
      Width = 520
      Height = 16
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'IMAGE LAYOUT'
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
    object LayoutsListView: TEasyListview
      Tag = -1
      Left = 8
      Top = 8
      Width = 523
      Height = 252
      BorderStyle = bsNone
      CellSizes.Icon.Height = 85
      CellSizes.Icon.Width = 85
      CellSizes.Thumbnail.Height = 84
      CellSizes.Thumbnail.Width = 84
      CellSizes.Tile.Height = 84
      CellSizes.Tile.Width = 84
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -11
      EditManager.Font.Name = 'Consolas'
      EditManager.Font.Style = []
      UseDockManager = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      GroupFont.Charset = ANSI_CHARSET
      GroupFont.Color = clWindowText
      GroupFont.Height = -12
      GroupFont.Name = 'Segoe UI'
      GroupFont.Style = []
      Header.Columns.Items = {
        0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
        00060000008008000101000100000000000001DD000000FFFFFF1F0001000000
        00000000000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      HotTrack.Color = clBlack
      HotTrack.Enabled = True
      HotTrack.GroupTrack = [htgIcon, htgText, htgAnyWhere]
      HotTrack.ItemTrack = [htiIcon, htiText, htiAnyWhere]
      HotTrack.Underline = False
      ImagesExLarge = IL_Layouts
      PaintInfoGroup.Expandable = False
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoItem.BorderColor = 16370824
      PaintInfoItem.HideCaption = True
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
      View = elsTile
      OnDblClick = LayoutsListViewDblClick
      OnItemPaintText = LayoutsListViewItemPaintText
      OnItemSelectionChanged = LayoutsListViewItemSelectionChanged
      OnKeyAction = LayoutsListViewKeyAction
    end
  end
  object PanelBottomButtons: TPanelEx
    Left = 0
    Top = 285
    Width = 520
    Height = 49
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonOk: TBitBtn
      Left = 166
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
      Left = 264
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
  object IL_Layouts: TImageList
    Height = 68
    Width = 68
    Left = 40
    Top = 208
  end
end
