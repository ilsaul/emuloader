object FormImagesDeleteClones: TFormImagesDeleteClones
  Left = 915
  Top = 592
  Width = 1006
  Height = 610
  BorderIcons = [biSystemMenu]
  Caption = 'Delete MAME and Arcade Clone Images'
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter: TSplitterEx
    Left = 632
    Top = 0
    Width = 6
    Height = 572
    Align = alRight
    ResizeStyle = rsUpdate
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 16445929
    Appearance.ColorTo = 15587527
    Appearance.ColorHot = 13891839
    Appearance.ColorHotTo = 7782911
    Appearance.SingleColor = clBtnFace
    Appearance.SingleColorHot = clGray
    GripStyle = sgDots
    Style = tsOffice2007Luna
  end
  object PanelImages: TPanelEx
    Tag = 1
    Left = 638
    Top = 0
    Width = 352
    Height = 572
    Align = alRight
    BevelOuter = bvNone
    Color1 = 15856113
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSolid
    OnResize = PanelImagesResize
    object PanelGameScr1: TPanelEx
      Left = 0
      Top = 0
      Width = 352
      Height = 286
      Align = alTop
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgVista
      object ImageScr1: TImage32
        Left = 0
        Top = 20
        Width = 352
        Height = 266
        Align = alClient
        Bitmap.DrawMode = dmBlend
        Bitmap.ResamplerClassName = 'TKernelResampler'
        Bitmap.Resampler.KernelClassName = 'TCosineKernel'
        Bitmap.Resampler.KernelMode = kmDynamic
        Bitmap.Resampler.TableSize = 32
        BitmapAlign = baCenter
        Color = clBlack
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smResize
        TabOrder = 0
      end
      object BarTextInfoScr1: TPanelEx
        Left = 0
        Top = 0
        Width = 352
        Height = 20
        Align = alTop
        Color1 = 15856113
        Color2 = 15856113
        Color3 = 1117964
        Color4 = clMaroon
        ColorFrame = clWhite
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelTextInfoScr1: TShadowLabel
          Left = 0
          Top = 0
          Width = 352
          Height = 20
          Hint = 'GAME'
          Align = alClient
          Alignment = taCenter
          Caption = 'GAME'
          Color = clBtnFace
          Constraints.MinHeight = 20
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = 14540253
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
          Layout = tlCenter
        end
      end
    end
    object PanelParentGameScr1: TPanelEx
      Left = 0
      Top = 286
      Width = 352
      Height = 286
      Align = alClient
      BevelOuter = bvNone
      Color1 = 15856113
      Color2 = clSilver
      Color3 = clYellow
      Color4 = clTeal
      ColorFrame = clGreen
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgVista
      object ImageParentScr1: TImage32
        Left = 0
        Top = 20
        Width = 352
        Height = 266
        Align = alClient
        Bitmap.DrawMode = dmBlend
        Bitmap.ResamplerClassName = 'TKernelResampler'
        Bitmap.Resampler.KernelClassName = 'TCosineKernel'
        Bitmap.Resampler.KernelMode = kmDynamic
        Bitmap.Resampler.TableSize = 32
        BitmapAlign = baCenter
        Color = clBlack
        ParentColor = False
        Scale = 1.000000000000000000
        ScaleMode = smResize
        TabOrder = 0
      end
      object BarTextInfoParentScr1: TPanelEx
        Left = 0
        Top = 0
        Width = 352
        Height = 20
        Align = alTop
        Color1 = 15856113
        Color2 = 15856113
        Color3 = 1117964
        Color4 = clMaroon
        ColorFrame = clWhite
        ColorInnerFrame = clGreen
        Frames = []
        ParentBackground = False
        Style = vgSolid
        object LabelTextInfoParentScr1: TShadowLabel
          Left = 0
          Top = 0
          Width = 352
          Height = 20
          Hint = 'PARENT GAME'
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'PARENT GAME'
          Color = clBtnFace
          Constraints.MinHeight = 20
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ShowAccelChar = False
          ShadowColor = 14540253
          ShadowEnabled = False
          EllipsType = etNone
          ColorFrame = clBlack
          ColorInnerFrame = clBlack
          Frames = []
          Transparent = True
          Layout = tlCenter
        end
      end
    end
  end
  object PanelGames: TPanelEx
    Left = 0
    Top = 0
    Width = 632
    Height = 572
    Align = alClient
    BevelOuter = bvNone
    Color1 = clWhite
    Color2 = clSilver
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgVista
    OnResize = PanelGamesResize
    object DeleteClonesList: TEasyListview
      Left = 0
      Top = 57
      Width = 632
      Height = 515
      Align = alClient
      CellSizes.Report.Height = 28
      Color = clWhite
      EditManager.Font.Charset = ANSI_CHARSET
      EditManager.Font.Color = clBlack
      EditManager.Font.Height = -12
      EditManager.Font.Name = 'Segoe UI'
      EditManager.Font.Style = []
      ImagesState = FormMain.IL_ArcadeSystem_Small
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
        0006000000800800010100010000000001000186010000FFFFFF1F0001000000
        01000000050000005400690074006C0065000000000000000000000000001100
        00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
        00010100000000000178000000FFFFFF1F000100000001000000040000004E00
        61006D006500000000000000000000000000110000005445617379436F6C756D
        6E53746F726564FFFECE00060000008008000101000102000000000001780000
        00FFFFFF1F0001000000010000000800000043006C006F006E00650020006F00
        6600000000000000000000000000}
      Header.Draggable = False
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -12
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = []
      Header.Height = 23
      Header.Sizeable = False
      Header.Visible = True
      IncrementalSearch.Enabled = True
      IncrementalSearch.ResetTime = 1300
      IncrementalSearch.StartType = eissFocusedNode
      ImagesSmall = FormMain.IL_StandardIconsStandard
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      ParentFont = False
      ParentShowHint = False
      ShowThemedBorder = False
      ShowHint = True
      Selection.BlendIcon = False
      Selection.FullCellPaint = True
      Selection.FullItemPaint = True
      Selection.FullRowSelect = True
      Selection.MultiSelect = True
      Selection.RoundRectRadius = 2
      Selection.TextColor = clBlack
      Selection.UseFocusRect = False
      TabOrder = 0
      View = elsReport
      CustomCheckRadioEnabled = False
      OnColumnClick = DeleteClonesListColumnClick
      OnItemCompare = DeleteClonesListItemCompare
      OnItemPaintText = DeleteClonesListItemPaintText
      OnItemSelectionChanged = DeleteClonesListItemSelectionChanged
      OnKeyAction = DeleteClonesListKeyAction
    end
    object PanelTop: TPanelEx
      Left = 0
      Top = 0
      Width = 632
      Height = 57
      Align = alTop
      Color1 = 15856113
      Color2 = clWhite
      Color3 = 16115676
      Color4 = clMoneyGreen
      ColorFrame = 7891291
      ColorInnerFrame = clGreen
      Frames = []
      ParentBackground = False
      Style = vgWindowsTheme
      object SystemIcon: TImage
        Tag = 1
        Left = 1
        Top = 3
        Width = 24
        Height = 24
        Hint = 'Click here to select a system'
        ParentShowHint = False
        ShowHint = True
        OnClick = SystemIconClick
      end
      object ImageCategoryIcon: TImage
        Tag = 1
        Left = 109
        Top = 3
        Width = 24
        Height = 24
        Hint = 'Click here to select a image category'
        ParentShowHint = False
        ShowHint = True
        OnClick = ImageCategoryIconClick
      end
      object LabelSystem: TShadowLabel
        Left = 28
        Top = 8
        Width = 77
        Height = 16
        Hint = 'Click here to select a system'
        Caption = 'SEGA Model 2'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = SystemIconClick
      end
      object LabelImageCategory: TShadowLabel
        Left = 136
        Top = 8
        Width = 114
        Height = 16
        Hint = 'Click here to select a image category'
        Caption = 'Control Panel Layout'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        ShadowColor = clGray
        ShadowEnabled = False
        EllipsType = etNone
        ColorFrame = clBlack
        ColorInnerFrame = clBlack
        Frames = []
        Transparent = True
        OnClick = ImageCategoryIconClick
      end
      object ButtonScan: TBitBtnEx
        Left = 3
        Top = 30
        Width = 65
        Height = 24
        Hint = 'Click here to search the games list for clone images'
        Caption = 'Start Scan'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonScanClick
      end
      object ButtonDeleteImages: TBitBtnEx
        Left = 337
        Top = 30
        Width = 64
        Height = 24
        Hint = 'Delete images of all clone games on the list'
        Caption = 'Delete All'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonDeleteImagesClick
      end
      object ButtonDeleteSelected: TBitBtnEx
        Left = 407
        Top = 30
        Width = 92
        Height = 24
        Hint = 'Delete images of all selected games on the list'
        Caption = 'Delete Selected'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonDeleteSelectedClick
      end
      object ButtonHelp: TBitBtnEx
        Left = 264
        Top = 3
        Width = 38
        Height = 24
        Hint = 'How do I use this thing ? :)'
        Caption = 'Help'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ButtonHelpClick
      end
      object ButtonRemoveSelected: TBitBtnEx
        Left = 94
        Top = 30
        Width = 102
        Height = 24
        Hint = 'Remove selected games from the list'
        Caption = 'Remove Selected'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = ButtonRemoveSelectedClick
      end
      object ButtonRenameToParent: TBitBtnEx
        Left = 202
        Top = 30
        Width = 106
        Height = 24
        Hint = 'Rename image to parent game name (all selected games)'
        Caption = 'Rename to Parent'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = ButtonRenameToParentClick
      end
    end
  end
  object IL_ToolBar: TImageList
    Height = 24
    Width = 24
    Left = 216
    Top = 160
  end
end
