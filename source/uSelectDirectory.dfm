object FormSelectDirectory: TFormSelectDirectory
  Left = 736
  Top = 278
  ActiveControl = ShellTree
  BorderStyle = bsDialog
  Caption = 'Browse for Folder'
  ClientHeight = 402
  ClientWidth = 434
  Color = clBtnFace
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ShellTree: TShellTreeView
    Left = 0
    Top = 37
    Width = 434
    Height = 301
    AutoContextMenus = False
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    Align = alClient
    AutoRefresh = False
    BorderStyle = bsNone
    Color = clWhite
    HideSelection = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
    OnChange = ShellTreeChange
  end
  object TopBar: TPanelEx
    Left = 0
    Top = 0
    Width = 434
    Height = 37
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
      Left = 36
      Top = 2
      Width = 391
      Height = 26
      AutoSize = False
      Caption = 'Folder Selection Title'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
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
      Left = 4
      Top = 4
      Width = 24
      Height = 24
      Transparent = True
    end
  end
  object BottomBar: TPanelEx
    Left = 0
    Top = 338
    Width = 434
    Height = 64
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
      Left = 2
      Top = 3
      Width = 430
      Height = 19
      AutoSize = False
      Caption = 'Full path of the selected item is shown here...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
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
      Left = 8
      Top = 34
      Width = 129
      Height = 20
      Checked = True
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Include Sub-Folders'
      ReturnIsTab = False
      ShadowColor = clSilver
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
    end
    object ButtonOk: TBitBtnEx
      Left = 239
      Top = 31
      Width = 89
      Height = 25
      Hint = 'Confirm folder selection'
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 1
    end
    object ButtonCancel: TBitBtnEx
      Left = 337
      Top = 31
      Width = 89
      Height = 25
      Hint = 'Abort folder selection'
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
end
