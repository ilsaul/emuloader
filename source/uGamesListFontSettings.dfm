object FormGamesListFontSettings: TFormGamesListFontSettings
  Left = 1442
  Top = 935
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    'Games List Font Settings [Mouse Double-click / ENTER Key to Cust' +
    'omize]'
  ClientHeight = 489
  ClientWidth = 984
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GamesFont: TEasyListview
    Left = 8
    Top = 0
    Width = 984
    Height = 435
    CellSizes.Tile.Height = 62
    CellSizes.Tile.Width = 358
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
      0600000002000000110000005445617379436F6C756D6E53746F726564FFFECE
      00060000008008000101000100000000000000FC010000FFFFFF1F0001000000
      0100000006000000530079007300740065006D00000000000000000000000000
      110000005445617379436F6C756D6E53746F726564FFFECE0006000000800800
      01010001010000000000006C000000FFFFFF1F0001000000010000000B000000
      46006F006E007400200048006500690067006800740000000000000000000000
      0000}
    Header.Draggable = False
    Header.Height = 23
    Header.Sizeable = False
    Header.Visible = True
    IncrementalSearch.Enabled = True
    IncrementalSearch.ResetTime = 1000
    IncrementalSearch.StartType = eissFocusedNode
    ImagesExLarge = IL_FontSettings
    PaintInfoColumn.HotTrack = False
    PaintInfoGroup.Expandable = False
    PaintInfoGroup.MarginBottom.CaptionIndent = 4
    PaintInfoItem.BorderColor = 16370824
    PaintInfoItem.ShowBorder = False
    PaintInfoItem.TileCaptionLines = 1
    PaintInfoItem.TileDetailCount = 2
    ParentShowHint = False
    PopupMenu = PopupFontSettings
    ShowThemedBorder = False
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
    View = elsTile
    CustomCheckRadioEnabled = False
    CustomEnableIconHD = False
    OnDblClick = GamesFontDblClick
    OnItemImageDraw = GamesFontItemImageDraw
    OnItemImageGetSize = GamesFontItemImageGetSize
    OnItemImageDrawIsCustom = GamesFontItemImageDrawIsCustom
    OnItemPaintText = GamesFontItemPaintText
    OnItemSelectionChanged = GamesFontItemSelectionChanged
    OnKeyAction = GamesFontKeyAction
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 435
    Width = 984
    Height = 54
    Align = alBottom
    Color1 = 15856113
    Color2 = 14540253
    Color3 = clYellow
    Color4 = clTeal
    ColorFrame = 7891291
    ColorInnerFrame = clGreen
    Frames = [frTop]
    ParentBackground = False
    Style = vgSimple
    object LabelBackgroundColor: TShadowLabel
      Left = 8
      Top = 6
      Width = 97
      Height = 16
      Caption = 'Background Color'
      ShowAccelChar = False
      ShadowColor = clGray
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object Label1: TLabel
      Left = 625
      Top = 2
      Width = 76
      Height = 15
      Caption = 'OnFormResize'
      Transparent = True
      Visible = False
    end
    object GamesBackgroundColor: TColorBoxEx
      Left = 8
      Top = 23
      Width = 205
      Height = 22
      Hint = 'Games List Background Color'
      DefaultColorColor = clWhite
      NoneColorColor = clWhite
      Selected = clWhite
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      Color = clWhite
      ItemHeight = 16
      TabOrder = 0
      OnSelect = GamesBackgroundColorSelect
    end
    object ButtonDefaultBkSortedColor: TBitBtnEx
      Left = 216
      Top = 23
      Width = 47
      Height = 21
      Hint = 'Set default values'
      Caption = 'Default'
      TabOrder = 1
      OnClick = ButtonDefaultBkSortedColorClick
    end
    object GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx
      Left = 284
      Top = 4
      Width = 202
      Height = 18
      TabOrder = 2
      OnClick = GamesBackgroundImageEnableClick
      Alignment = taLeftJustify
      Caption = 'Show Image as Background [.png]'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object GamesBackgroundImage: TEditEx
      Left = 284
      Top = 23
      Width = 315
      Height = 21
      AutoSize = False
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
    end
    object GamesTileBackground: TAdvOfficeCheckBoxEx
      Left = 564
      Top = 4
      Width = 40
      Height = 18
      Hint = 'Tile the background image on the entire games list canvas'
      Checked = True
      TabOrder = 4
      OnClick = GamesTileBackgroundClick
      Alignment = taLeftJustify
      Caption = 'Tile'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object GamesBackgroundImageButtonUpdate: TBitBtnEx
      Left = 653
      Top = 23
      Width = 49
      Height = 21
      Hint = 'Click here to load the image if you'#39've made a manual change'
      Caption = 'Update'
      TabOrder = 5
      OnClick = GamesBackgroundImageButtonUpdateClick
    end
    object GamesBackgroundImageButtonSelect: TBitBtnEx
      Left = 602
      Top = 23
      Width = 49
      Height = 21
      Hint = 'Click here to select a file'
      Caption = 'Select'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = GamesBackgroundImageButtonSelectClick
    end
    object ButtonOk: TBitBtnEx
      Left = 787
      Top = 17
      Width = 89
      Height = 25
      Hint = 'Close and update settings'
      Caption = 'Confirm'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object ButtonCancel: TBitBtnEx
      Left = 885
      Top = 17
      Width = 89
      Height = 25
      Hint = 'Close without updating'
      Caption = 'Abort'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
  end
  object IL_FontSettings: TImageList
    Height = 48
    Width = 48
    Left = 360
    Top = 48
  end
  object PopupFontSettings: TBcBarPopupMenu
    AutoHotkeys = maManual
    Images = FormMain.IL_MenuPopup
    OwnerDraw = True
    TrackButton = tbLeftButton
    Bar.GradientStart = clTeal
    Bar.GradientStyle = gsDiagonalLeftRight
    Bar.Width = 10
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = ANSI_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'Tahoma'
    Separators.Font.Style = []
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clBlack
    MenuFont.Height = -12
    MenuFont.Name = 'Trebuchet MS'
    MenuFont.Style = []
    MenuStyle = msWindowsXP
    UseSystemFont = False
    DrawModule = FormMain.BcDrawModule
    OnMeasureMenuItem = PopupFontSettingsMeasureMenuItem
    Left = 72
    Top = 128
    object PopupResetSelectedToCurrentFonts: TMenuItem
      Tag = 1
      Caption = 'Reset Selected to Current Fonts'
      OnClick = PopupSetSelectedToDefaultFontsClick
    end
    object PopupResetAllToCurrentFonts: TMenuItem
      Tag = 1
      Caption = 'Reset All to Current Fonts'
      OnClick = PopupSetAllToDefaultFontsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupSetSelectedToDefaultFonts: TMenuItem
      Caption = 'Set Selected to Default Font'
      OnClick = PopupSetSelectedToDefaultFontsClick
    end
    object PopupSetAllToDefaultFonts: TMenuItem
      Caption = 'Set All to Default Fonts'
      OnClick = PopupSetAllToDefaultFontsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PopupSetFontsToMatchAllSystemsFont: TMenuItem
      Caption = 'Set Selected To "All Systems" Font'
      OnClick = PopupSetFontsToMatchAllSystemsFontClick
    end
    object PopupCopyFontFromArcadeParentFont: TMenuItem
      Tag = 1
      Caption = 'Set Selected To "Arcade Parent Game" Font'
      OnClick = PopupSetFontsToMatchAllSystemsFontClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PopupSetAllConsoleComputerSystemsFontsToAllSystems: TMenuItem
      Caption = 'Set All Console/Computer To "All Systems" Font'
      OnClick = PopupSetAllConsoleComputerSystemsFontsToAllSystemsClick
    end
    object PopupSetAllToArcadeParentGameFont: TMenuItem
      Tag = 1
      Caption = 'Set All Console/Computer To "Arcade Parent Game" Font'
      OnClick = PopupSetAllConsoleComputerSystemsFontsToAllSystemsClick
    end
    object N5: TMenuItem
      Caption = '-'
      Visible = False
    end
    object PopupCopyAllFontsFromLightMode: TMenuItem
      Caption = 'Copy All Fonts From'
      Visible = False
    end
    object PopupCopySelectedFontsFromLightMode: TMenuItem
      Caption = 'Copy Selected Fonts From'
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupShowFontName: TMenuItem
      AutoCheck = True
      Caption = 'Show Font Name'
      OnClick = PopupShowFontNameClick
    end
    object PopupShowAvailableSystemsOnly: TMenuItem
      AutoCheck = True
      Caption = 'Show Available Systems Only'
      OnClick = PopupShowAvailableSystemsOnlyClick
    end
    object PopupHelp: TMenuItem
      Caption = 'Help'
      OnClick = PopupHelpClick
    end
  end
end
