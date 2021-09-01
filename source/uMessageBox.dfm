object FormMessageBox: TFormMessageBox
  Left = 657
  Top = 341
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 561
  ClientWidth = 884
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
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 884
    Height = 80
    Align = alTop
    Color1 = 16445669
    Color2 = clWhite
    Color3 = 16112579
    Color4 = 16707808
    ColorFrame = 15658734
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    Steps = 80
    object MessageIcon: TImage
      Tag = -1
      Left = 4
      Top = 4
      Width = 68
      Height = 68
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 79
      Top = 4
      Width = 799
      Height = 33
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = clMaroon
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object LabelGameName: TShadowLabel
      Left = 106
      Top = 46
      Width = 770
      Height = 27
      AutoSize = False
      Caption = 'name: gamename [clone of gamename] [bios: biosname]'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      ShadowColor = 12632284
      ShadowEnabled = False
      EllipsType = etNone
      ColorFrame = clBlack
      ColorInnerFrame = clBlack
      Frames = []
      Transparent = True
      Layout = tlCenter
      Visible = False
    end
    object IconMediaType: TImage
      Left = 78
      Top = 48
      Width = 24
      Height = 24
      IncrementalDisplay = True
      Transparent = True
      Visible = False
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 520
    Width = 884
    Height = 41
    Align = alBottom
    Color1 = clWhite
    Color2 = 15856113
    Color3 = clWhite
    Color4 = clTeal
    ColorFrame = 14671839
    ColorInnerFrame = clGreen
    Frames = []
    ParentBackground = False
    Style = vgSimple
    object ButtonYes: TBitBtnEx
      Left = 341
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Yes'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object ButtonNo: TBitBtnEx
      Left = 436
      Top = 8
      Width = 89
      Height = 25
      Caption = 'No'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
    object ButtonYestoAll: TBitBtnEx
      Left = 251
      Top = 8
      Width = 89
      Height = 25
      Hint = 
        'Click here to create the list for all systems'#13#10'(this message wil' +
        'l no longer appear)'
      Caption = 'Yes to All'
      ModalResult = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
    end
    object ButtonAbort: TBitBtnEx
      Left = 543
      Top = 8
      Width = 89
      Height = 25
      Hint = 'Click here to abort it completely'
      Caption = 'Abort'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object NightMode: TAdvOfficeCheckBoxEx
      Left = 12
      Top = 11
      Width = 87
      Height = 20
      Hint = 'Check to use a dark theme'
      Checked = True
      ShowHint = True
      TabOrder = 4
      OnClick = NightModeClick
      Alignment = taLeftJustify
      Caption = 'Night Mode'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object HideCommandLineRunConfirm: TAdvOfficeCheckBoxEx
      Left = 735
      Top = 11
      Width = 140
      Height = 20
      Hint = 
        'To view the full command line again'#13#10'enable "Run Game Confirmati' +
        'on Dialog" in main menu'
      ShowHint = True
      TabOrder = 5
      Visible = False
      Alignment = taLeftJustify
      Caption = 'Don'#39't Show This Again'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = False
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object LabelMessageW: TTntRichEdit
    Left = 8
    Top = 80
    Width = 867
    Height = 439
    OnURLClick = LabelMessageWURLClick
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    WantReturns = False
    OnResizeRequest = LabelMessageWResizeRequest
  end
end
