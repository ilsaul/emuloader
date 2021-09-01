object FormMessageBox4K: TFormMessageBox4K
  Left = 1138
  Top = 531
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 799
  ClientWidth = 1280
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 30
  object PanelTop: TPanelEx
    Left = 0
    Top = 0
    Width = 1280
    Height = 150
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
      Left = 10
      Top = 10
      Width = 128
      Height = 128
      Transparent = True
    end
    object LabelGameTitle: TShadowLabel
      Left = 150
      Top = 10
      Width = 1119
      Height = 59
      AutoSize = False
      Caption = 
        'The Gladiator - Road of the Sword / Shen Jian (M68k label V100) ' +
        '(ARM label V100, ROM 02/25/03 SHEN JIAN) (JAMMA PCB)'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -24
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
      Left = 205
      Top = 90
      Width = 1069
      Height = 47
      AutoSize = False
      Caption = 
        'name: gamename [clone of gamename] [bios: biosname]'#13#10'emulator ve' +
        'rsion'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3289650
      Font.Height = -19
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
      Left = 149
      Top = 90
      Width = 48
      Height = 48
      IncrementalDisplay = True
      Transparent = True
      Visible = False
    end
  end
  object PanelBottom: TPanelEx
    Left = 0
    Top = 728
    Width = 1280
    Height = 71
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
      Left = 448
      Top = 14
      Width = 168
      Height = 45
      Caption = 'Yes'
      ModalResult = 6
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      CaptionVertIndent = -1
    end
    object ButtonNo: TBitBtnEx
      Left = 640
      Top = 14
      Width = 168
      Height = 45
      Caption = 'No'
      ModalResult = 7
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      CaptionVertIndent = -1
    end
    object ButtonYestoAll: TBitBtnEx
      Left = 281
      Top = 14
      Width = 168
      Height = 45
      Hint = 
        'Click here to create the list for all systems'#13#10'(this message wil' +
        'l no longer appear)'
      Caption = 'Yes to All'
      ModalResult = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      CaptionVertIndent = -1
    end
    object ButtonAbort: TBitBtnEx
      Left = 831
      Top = 14
      Width = 168
      Height = 45
      Hint = 'Click here to abort it completely'
      Caption = 'Abort'
      ModalResult = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      CaptionVertIndent = -1
    end
    object NightMode: TAdvOfficeCheckBoxEx
      Left = 24
      Top = 22
      Width = 157
      Height = 36
      Hint = 'Check to use a dark theme'
      ShowHint = True
      TabOrder = 4
      OnClick = NightModeClick
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Night Mode'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
    object HideCommandLineRunConfirm: TAdvOfficeCheckBoxEx
      Left = 1023
      Top = 22
      Width = 245
      Height = 36
      Hint = 
        'To view the full command line again'#13#10'enable "Run Game Confirmati' +
        'on Dialog" in main menu'
      ShowHint = True
      TabOrder = 5
      Visible = False
      Alignment = taLeftJustify
      ButtonVertAlign = tlCenter
      Caption = 'Don'#39't Show This Again'
      ReturnIsTab = False
      Themed = True
      CustomIconsEnabled = False
      CustomEnableIconHD = True
      CustomIconsImages = FormMain.IL_CheckBoxRadioButtonIcons
      CustomIconsImagesHD = FormMain.IL_CheckBoxRadioButtonIconsHD
    end
  end
  object LabelMessageW: TTntRichEdit
    Left = 10
    Top = 150
    Width = 1260
    Height = 577
    OnURLClick = LabelMessageWURLClick
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
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
