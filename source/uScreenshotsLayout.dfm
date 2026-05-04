object FormScreenshotsLayout: TFormScreenshotsLayout
  Left = 347
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Categories and Layouts Settings'
  ClientHeight = 537
  ClientWidth = 601
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object BottomBar: TImage32
    Left = 0
    Top = 510
    Width = 601
    Height = 27
    Align = alBottom
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    object ButtonOk: TButton
      Left = 460
      Top = 2
      Width = 68
      Height = 23
      Hint = 'Close and update settings'
      Caption = 'Ok'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TButton
      Left = 531
      Top = 2
      Width = 68
      Height = 23
      Hint = 'Close without updating'
      Caption = 'Cancel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
  object PageControlImages: TPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 510
    ActivePage = TabSheetLayouts
    Align = alClient
    TabOrder = 1
    object TabSheetCategories: TTabSheet
      Caption = 'Categories'
    end
    object TabSheetLayouts: TTabSheet
      Caption = 'Layouts'
      ImageIndex = 1
      object ImageScrLayout: TImage
        Left = 216
        Top = 304
        Width = 150
        Height = 150
        Transparent = True
      end
      object LabelLayoutTreeView: TLabel
        Left = 4
        Top = 4
        Width = 79
        Height = 15
        Hint = 'Select a Layout for Frame %u'
        Caption = 'Select a Layout'
        Transparent = True
      end
      object LayoutListView: TEasyListview
        Left = 4
        Top = 20
        Width = 208
        Height = 277
        BackGround.Enabled = True
        CellSizes.Report.Height = 28
        Color = 16448250
        EditManager.Font.Charset = ANSI_CHARSET
        EditManager.Font.Color = clWindowText
        EditManager.Font.Height = -12
        EditManager.Font.Name = 'Segoe UI'
        EditManager.Font.Style = []
        UseDockManager = False
        HintType = ehtToolTip
        Header.Columns.Items = {
          0600000001000000110000005445617379436F6C756D6E53746F726564FFFECE
          00060000008008000101000100000000000001CC000000FFFFFF1F0001000000
          00000000000000000000000000000000}
        Header.Draggable = False
        Header.FixedSingleColumn = True
        Header.Height = 23
        IncrementalSearch.Enabled = True
        IncrementalSearch.ResetTime = 1000
        IncrementalSearch.StartType = eissFocusedNode
        ImagesSmall = FormMain.IL_ScreenshotLayouts_Small
        PaintInfoGroup.Expandable = False
        PaintInfoGroup.MarginBottom.CaptionIndent = 4
        PaintInfoItem.Border = 1
        PaintInfoItem.BorderColor = 16370824
        PaintInfoItem.CheckType = ectBox
        PaintInfoItem.ShowBorder = False
        Selection.AlphaBlend = True
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
        Selection.InactiveTextColor = clBtnShadow
        Selection.MouseButton = [cmbLeft, cmbRight]
        Selection.RoundRect = True
        Selection.RoundRectRadius = 2
        Selection.UseFocusRect = False
        TabOrder = 0
        View = elsReport
        OnItemCheckChange = LayoutListViewItemCheckChange
        OnItemEdited = LayoutListViewItemEdited
        OnItemEditEnd = LayoutListViewItemEditEnd
        OnItemPaintText = LayoutListViewItemPaintText
        OnItemSelectionChanged = LayoutListViewItemSelectionChanged
        OnKeyAction = LayoutListViewKeyAction
      end
      object ScreenshotLayoutsButtonEditTitle: TButton
        Left = 4
        Top = 304
        Width = 89
        Height = 23
        Hint = 'Edit title of selected layout'
        Caption = 'Edit [F2]'
        TabOrder = 1
        OnClick = ScreenshotLayoutsButtonEditTitleClick
      end
      object ScreenshotLayoutsDefault: TButton
        Left = 122
        Top = 304
        Width = 89
        Height = 23
        Hint = 'Restore default values for all layouts'
        Caption = 'Default'
        TabOrder = 2
        OnClick = ScreenshotLayoutsDefaultClick
      end
      object ScreenshotLayoutsButtonRestoreTitle: TButton
        Left = 4
        Top = 336
        Width = 89
        Height = 23
        Hint = 'Restore selected layout default title'
        Caption = 'Restore Title'
        TabOrder = 3
        OnClick = ScreenshotLayoutsButtonRestoreTitleClick
      end
      object IconLayScr2: TImage32
        Left = 216
        Top = 112
        Width = 289
        Height = 52
        Bitmap.DrawMode = dmBlend
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = clBlack
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 4
        OnClick = IconLayScr2Click
        object LabelScreenshot2: TLabel
          Left = 131
          Top = 0
          Width = 74
          Height = 18
          Caption = 'Screenshot 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = True
        end
        object LabelLayScr2: TLabel
          Left = 53
          Top = 19
          Width = 232
          Height = 28
          AutoSize = False
          Caption = 'Game Snapshots'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
          OnClick = IconLayScr2Click
        end
      end
      object PanelEnabledScr2: TCheckBox
        Left = 216
        Top = 94
        Width = 105
        Height = 17
        Caption = 'Panel 2 Enabled'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = PanelEnabledScr2Click
      end
      object IconLayScr1: TImage32
        Left = 216
        Top = 20
        Width = 289
        Height = 52
        Bitmap.DrawMode = dmBlend
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = clBlack
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 6
        OnClick = IconLayScr1Click
        object LabelScreenshot1: TLabel
          Left = 131
          Top = 0
          Width = 74
          Height = 18
          Caption = 'Screenshot 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = True
        end
        object LabelLayScr1: TLabel
          Left = 55
          Top = 19
          Width = 230
          Height = 28
          AutoSize = False
          Caption = 'Game Snapshots'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
          OnClick = IconLayScr1Click
        end
      end
      object PanelEnabledScr3: TCheckBox
        Left = 216
        Top = 182
        Width = 105
        Height = 17
        Caption = 'Panel 3 Enabled'
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = PanelEnabledScr3Click
      end
      object IconLayScr3: TImage32
        Left = 216
        Top = 200
        Width = 289
        Height = 52
        Bitmap.DrawMode = dmBlend
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Color = clBlack
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 8
        OnClick = IconLayScr3Click
        object LabelScreenshot3: TLabel
          Left = 131
          Top = 0
          Width = 74
          Height = 18
          Caption = 'Screenshot 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = True
        end
        object LabelLayScr3: TLabel
          Left = 53
          Top = 19
          Width = 232
          Height = 28
          AutoSize = False
          Caption = 'Game Snapshots'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16448250
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          WordWrap = True
          OnClick = IconLayScr3Click
        end
      end
    end
  end
end
