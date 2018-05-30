object FormArcadeGamesScanResults: TFormArcadeGamesScanResults
  Left = 1205
  Top = 429
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Games with Missing ROMs/CHDs'
  ClientHeight = 615
  ClientWidth = 809
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
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ROMsListView: TEasyListview
    Tag = 1
    Left = 0
    Top = 33
    Width = 809
    Height = 541
    Align = alClient
    BackGround.Enabled = True
    BorderStyle = bsNone
    CellSizes.Report.Height = 22
    Color = clWhite
    EditManager.Font.Charset = ANSI_CHARSET
    EditManager.Font.Color = clBlack
    EditManager.Font.Height = -12
    EditManager.Font.Name = 'Segoe UI'
    EditManager.Font.Style = []
    ImagesState = IL_ScanResults
    UseDockManager = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GroupFont.Charset = ANSI_CHARSET
    GroupFont.Color = clMaroon
    GroupFont.Height = -13
    GroupFont.Name = 'Trebuchet MS'
    GroupFont.Style = [fsBold, fsItalic]
    HintType = ehtToolTip
    Header.Columns.Items = {
      0600000004000000110000005445617379436F6C756D6E53746F726564FFFECE
      0006000000800800010100010000000000000051010000FFFFFF1F0001000000
      0100000015000000200020002000200020002000200020002000200020002000
      200020002000200020004E0061006D0065000000000000000000000000001100
      00005445617379436F6C756D6E53746F726564FFFECE00060000008008000101
      00010100000000000040000000FFFFFF1F000100000001000000050000004300
      5200430033003200000000000000000000000000110000005445617379436F6C
      756D6E53746F726564FFFECE0006000000800800010100010200000000000020
      010000FFFFFF1F000100000001000000050000005300480041002D0031000000
      00000000000000000000110000005445617379436F6C756D6E53746F726564FF
      FECE0006000000800800010100010300000000000078000000FFFFFF1F000100
      0000010000000600000053007400610074007500730000000000000000000000
      0000}
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
    ImagesGroup = FormMain.IL_StandardIconsSmall
    ImagesSmall = FormMain.IL_LeftPanel
    PaintInfoColumn.CaptionIndent = 0
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.BandBlended = False
    PaintInfoGroup.BandColor = clGray
    PaintInfoGroup.BandColorFade = 16448250
    PaintInfoGroup.BandIndent = 24
    PaintInfoGroup.BandLength = 550
    PaintInfoGroup.BandThickness = 1
    PaintInfoGroup.CaptionIndent = 7
    PaintInfoGroup.ExpandImageIndent = 6
    PaintInfoGroup.ImageIndent = 9
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ImageIndent = 3
    PaintInfoItem.ShowBorder = False
    ParentFont = False
    ShowGroupMargins = True
    ShowThemedBorder = False
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
    OnGroupCompare = ROMsListViewGroupCompare
    OnItemCompare = ROMsListViewItemCompare
    OnItemPaintText = ROMsListViewItemPaintText
    OnItemSelectionChanged = ROMsListViewItemSelectionChanged
  end
  object CoolBarTop: TCoolBar
    Left = 0
    Top = 0
    Width = 809
    Height = 33
    BandBorderStyle = bsNone
    BandMaximize = bmNone
    Bands = <
      item
        Break = False
        Control = PanelTop
        FixedSize = True
        ImageIndex = -1
        MinHeight = 52
        Width = 809
      end>
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    FixedOrder = True
    ShowText = False
    object PanelTop: TPanel
      Left = 0
      Top = 0
      Width = 809
      Height = 52
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object LabelEmulatorVersion: TShadowLabel
        Left = 53
        Top = 2
        Width = 366
        Height = 14
        Caption = 
          'Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
          '2)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 14540253
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
      end
      object LabelGamesListVersion: TShadowLabel
        Left = 76
        Top = 16
        Width = 343
        Height = 14
        Caption = 
          'Supermodel: A Sega Model 3 Arcade Emulator v0.3a-WIP (Jul 24 201' +
          '2)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 14540253
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
      end
      object LabelGamesListList: TShadowLabel
        Left = 54
        Top = 16
        Width = 23
        Height = 14
        Caption = 'List:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        ShadowColor = 14540253
        ShadowEnabled = False
        EllipsType = etNone
        Transparent = True
      end
      object SystemSelectorToolBar: TToolBar
        Left = 589
        Top = 0
        Width = 220
        Height = 52
        Align = alRight
        ButtonHeight = 30
        ButtonWidth = 31
        Color = clBtnFace
        Constraints.MaxHeight = 30
        Constraints.MaxWidth = 220
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = FormMain.IL_ArcadeSystem_Small
        ParentColor = False
        TabOrder = 0
        Transparent = True
        object sysMAME: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Enabled = False
          Grouped = True
          ImageIndex = 1
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysSupermodelSEGAModel3: TToolButton
          Left = 31
          Top = 0
          AutoSize = True
          Enabled = False
          Grouped = True
          ImageIndex = 2
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysDemul: TToolButton
          Left = 62
          Top = 0
          AutoSize = True
          Enabled = False
          Grouped = True
          ImageIndex = 4
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysHBMAME: TToolButton
          Left = 93
          Top = 0
          Enabled = False
          Grouped = True
          ImageIndex = 5
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysDICE: TToolButton
          Left = 124
          Top = 0
          Enabled = False
          Grouped = True
          ImageIndex = 6
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysSEGAModel2: TToolButton
          Left = 155
          Top = 0
          AutoSize = True
          Enabled = False
          Grouped = True
          ImageIndex = 7
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
        object sysZiNc: TToolButton
          Left = 186
          Top = 0
          AutoSize = True
          Enabled = False
          Grouped = True
          ImageIndex = 8
          Style = tbsCheck
          OnClick = sysMAMEClick
        end
      end
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 574
    Width = 809
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = 16641245
    Color4 = 16637122
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTotalGames: TShadowLabel
      Left = 105
      Top = 14
      Width = 78
      Height = 16
      Caption = '000000 Games'
      ParentShowHint = False
      ShowAccelChar = False
      ShowHint = False
      ShadowColor = clSilver
      ShadowEnabled = False
      EllipsType = etNone
      Transparent = True
    end
    object MAMEMachinesFilterIcon: TImage
      Left = 256
      Top = 13
      Width = 16
      Height = 16
    end
    object ButtonToggleTree: TBitBtn
      Left = 8
      Top = 9
      Width = 89
      Height = 25
      Hint = 'Toggle tree nodes open/close'
      Caption = 'Open/Close'
      TabOrder = 0
      OnClick = ButtonToggleTreeClick
    end
    object ButtonClose: TBitBtn
      Left = 713
      Top = 9
      Width = 89
      Height = 25
      Hint = 'Close this window'
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 1
    end
    object MAMEMachinesFilter: TComboBox
      Left = 275
      Top = 10
      Width = 185
      Height = 21
      Hint = 'MAME games filter'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'List All'
      OnSelect = MAMEMachinesFilterSelect
      Items.Strings = (
        'List All'
        'MAME Games Only'
        'MAME Software List Games Only')
    end
  end
  object IconPanel: TPanelEx
    Left = 0
    Top = 0
    Width = 51
    Height = 51
    Color1 = 15856113
    Color2 = clWhite
    Color3 = 16448250
    Color4 = clWhite
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frRight, frBottom]
    ParentBackground = False
    Style = vgSimple
    object SysIcon: TImage
      Left = 1
      Top = 1
      Width = 48
      Height = 48
      Transparent = True
    end
  end
  object IL_ScanResults: TImageList
    Left = 488
    Top = 464
  end
end
