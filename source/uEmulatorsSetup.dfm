object FormEmulatorsSetup: TFormEmulatorsSetup
  Left = 233
  Top = 163
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 321
  ClientWidth = 425
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 425
    Height = 60
  end
  object BottomLine: TBevel
    Left = 5
    Top = 272
    Width = 415
    Height = 10
    Shape = bsTopLine
  end
  object LabelTopDescription: TLabel
    Left = 72
    Top = 24
    Width = 345
    Height = 13
    AutoSize = False
    Caption = 'Emulators Setup'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelDefaultGamesListBuilderValue: TLabel
    Left = 106
    Top = 235
    Width = 51
    Height = 13
    Caption = 'Emulator 1'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelDefaultGamesListBuilder: TLabel
    Left = 16
    Top = 216
    Width = 124
    Height = 13
    Caption = 'Default Games List Builder'
    Transparent = True
  end
  object ButtonOk: TButton
    Left = 256
    Top = 288
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 344
    Top = 288
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object PageControlEmulatorsFileName: TPageControl
    Left = 8
    Top = 72
    Width = 409
    Height = 129
    ActivePage = TabSheetEmulator1
    HotTrack = True
    Images = FormMain.ToolbarButtonsImageList
    TabIndex = 0
    TabOrder = 2
    object TabSheetEmulator1: TTabSheet
      ImageIndex = 15
      object ExecutableFile: TEdit
        Left = 72
        Top = 24
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFileChange
      end
      object ButtonClearCommandLine1: TButton
        Left = 314
        Top = 56
        Width = 75
        Height = 23
        Hint = 'Clear the 1st emulator executable edit box'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCommandLine1Click
      end
      object ButtonSet1stEmulatorOptions: TButton
        Left = 72
        Top = 56
        Width = 217
        Height = 23
        Hint = 
          'Configure default data on "mame.ini" or "mame.cfg" for executabl' +
          'e 1'
        Caption = 'Set &1st Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet1stEmulatorOptionsClick
      end
      object ExecutableFileButtonSelect: TButton
        Left = 368
        Top = 24
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFileButtonSelectClick
      end
      object EmulatorExecutable1Image: TImage32Ex
        Left = 8
        Top = 8
        Width = 52
        Height = 52
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 4
        Transparent = True
      end
    end
    object TabSheetEmulator2: TTabSheet
      ImageIndex = 16
      object ExecutableFile2: TEdit
        Left = 72
        Top = 24
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile2Change
      end
      object ButtonClearCommandLine2: TButton
        Left = 314
        Top = 56
        Width = 75
        Height = 23
        Hint = 'Clear the 2nd emulator executable edit box'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCommandLine2Click
      end
      object ButtonSet2ndEmulatorOptions: TButton
        Left = 72
        Top = 56
        Width = 217
        Height = 23
        Hint = 
          'Configure default data on "mame.ini" or "mame.cfg" for executabl' +
          'e 2'
        Caption = 'Set &2nd Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet2ndEmulatorOptionsClick
      end
      object ExecutableFile2ButtonSelect: TButton
        Left = 368
        Top = 24
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile2ButtonSelectClick
      end
      object EmulatorExecutable2Image: TImage32Ex
        Left = 8
        Top = 8
        Width = 52
        Height = 52
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 4
        Transparent = True
      end
    end
    object TabSheetEmulator3: TTabSheet
      ImageIndex = 47
      object ExecutableFile3: TEdit
        Left = 72
        Top = 24
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile3Change
      end
      object ButtonClearCommandLine3: TButton
        Left = 314
        Top = 56
        Width = 75
        Height = 23
        Hint = 'Clear the 3rd emulator executable edit box'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCommandLine3Click
      end
      object ButtonSet3rdEmulatorOptions: TButton
        Left = 72
        Top = 56
        Width = 217
        Height = 23
        Hint = 
          'Configure default data on "mame.ini" or "mame.cfg" for executabl' +
          'e 3'
        Caption = 'Set &3rd Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet3rdEmulatorOptionsClick
      end
      object ExecutableFile3ButtonSelect: TButton
        Left = 368
        Top = 24
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile3ButtonSelectClick
      end
      object EmulatorExecutable3Image: TImage32Ex
        Left = 8
        Top = 8
        Width = 52
        Height = 52
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 4
        Transparent = True
      end
    end
    object TabSheetEmulator4: TTabSheet
      ImageIndex = 61
      object ExecutableFile4: TEdit
        Left = 72
        Top = 24
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile4Change
      end
      object ButtonClearCommandLine4: TButton
        Left = 314
        Top = 56
        Width = 75
        Height = 23
        Hint = 'Clear the 4th emulator executable edit box'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCommandLine4Click
      end
      object ButtonSet4thEmulatorOptions: TButton
        Left = 72
        Top = 56
        Width = 217
        Height = 23
        Hint = 
          'Configure default data on "mame.ini" or "mame.cfg" for executabl' +
          'e 4'
        Caption = 'Set &4th Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet4thEmulatorOptionsClick
      end
      object ExecutableFile4ButtonSelect: TButton
        Left = 368
        Top = 24
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile4ButtonSelectClick
      end
      object EmulatorExecutable4Image: TImage32Ex
        Left = 8
        Top = 8
        Width = 52
        Height = 52
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 4
        Transparent = True
      end
    end
    object TabSheetEmulator5: TTabSheet
      ImageIndex = 62
      object ExecutableFile5: TEdit
        Left = 72
        Top = 24
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile5Change
      end
      object ButtonClearCommandLine5: TButton
        Left = 314
        Top = 56
        Width = 75
        Height = 23
        Hint = 'Clear the 5th emulator executable edit box'
        Caption = 'Clear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCommandLine5Click
      end
      object ButtonSet5thEmulatorOptions: TButton
        Left = 72
        Top = 56
        Width = 217
        Height = 23
        Hint = 
          'Configure default data on "mame.ini" or "mame.cfg" for executabl' +
          'e 5'
        Caption = 'Set &5th Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet5thEmulatorOptionsClick
      end
      object ExecutableFile5ButtonSelect: TButton
        Left = 368
        Top = 24
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile5ButtonSelectClick
      end
      object EmulatorExecutable5Image: TImage32Ex
        Left = 8
        Top = 8
        Width = 52
        Height = 52
        Bitmap.DrawMode = dmBlend
        BitmapAlign = baTopLeft
        Scale = 1
        ScaleMode = smNormal
        TabOrder = 4
        Transparent = True
      end
    end
  end
  object DefaultGamesListBuilder: TGaugeBar
    Left = 16
    Top = 232
    Width = 89
    Height = 20
    Hint = 'Emulator %u'
    Color = clWindow
    Backgnd = bgPattern
    ButtonSize = 12
    Max = 5
    Min = 1
    ShowHandleGrip = True
    Position = 1
    OnChange = DefaultGamesListBuilderChange
  end
end
