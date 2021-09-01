object FormSelectDirectory4K: TFormSelectDirectory4K
  Left = 736
  Top = 278
  ActiveControl = ShellTree
  BorderStyle = bsDialog
  Caption = 'Browse for Folder (4K)'
  ClientHeight = 900
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
  object ShellTree: TShellTreeView
    Left = 10
    Top = 90
    Width = 1180
    Height = 700
    AutoContextMenus = False
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    AutoRefresh = False
    BorderStyle = bsNone
    Color = clWhite
    HideSelection = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 1200
    Height = 90
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16707808
    Color4 = 16112579
    ColorFrame = clGreen
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object LabelTitle: TShadowLabel
      Left = 86
      Top = 15
      Width = 1100
      Height = 59
      AutoSize = False
      Caption = 'Folder Selection Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 15790320
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object MessageIcon: TImage
      Left = 10
      Top = 10
      Width = 68
      Height = 68
      Transparent = True
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 800
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
    object LabelSelectedPath: TShadowLabel
      Left = 10
      Top = 5
      Width = 1175
      Height = 25
      AutoSize = False
      Caption = 'Full path of the selected item is shown here...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 16448250
      ShadowEnabled = True
      EllipsType = etPathEllips
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
    end
    object AddSubFolders: TAdvOfficeCheckBoxEx
      Tag = 1
      Left = 10
      Top = 52
      Width = 220
      Height = 36
      Checked = True
      TabOrder = 0
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Include Sub-Folders'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object ButtonOk: TBitBtnEx
      Left = 843
      Top = 45
      Width = 168
      Height = 45
      Hint = 'Confirm folder selection'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
    end
    object ButtonCancel: TBitBtnEx
      Left = 1021
      Top = 45
      Width = 168
      Height = 45
      Hint = 'Abort folder selection'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
end
