object FormEmulatorsSetup: TFormEmulatorsSetup
  Left = 233
  Top = 163
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Emulator Setup'
  ClientHeight = 185
  ClientWidth = 363
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDefaultGamesListBuilderValue: TLabel
    Left = 100
    Top = 155
    Width = 51
    Height = 13
    Caption = 'Emulator 1'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelDefaultEmulator: TLabel
    Left = 8
    Top = 136
    Width = 80
    Height = 13
    Caption = 'Default Emulator'
    Transparent = True
  end
  object ButtonOk: TButton
    Left = 200
    Top = 152
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
    Left = 280
    Top = 152
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
    Top = 8
    Width = 345
    Height = 113
    ActivePage = TabSheetEmulator1
    HotTrack = True
    Images = FormMain.ToolbarButtonsImageList
    TabOrder = 2
    object TabSheetEmulator1: TTabSheet
      ImageIndex = 15
      object ExecutableFile: TEdit
        Left = 8
        Top = 16
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFileChange
      end
      object ButtonClearCommandLine1: TButton
        Left = 250
        Top = 48
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
        Left = 8
        Top = 48
        Width = 217
        Height = 23
        Hint = 'Configure default data on "mame.ini" for executable 1'
        Caption = 'Set &1st Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet1stEmulatorOptionsClick
      end
      object ExecutableFileButtonSelect: TButton
        Left = 304
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFileButtonSelectClick
      end
    end
    object TabSheetEmulator2: TTabSheet
      ImageIndex = 16
      object ExecutableFile2: TEdit
        Left = 8
        Top = 16
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile2Change
      end
      object ButtonClearCommandLine2: TButton
        Left = 250
        Top = 48
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
        Left = 8
        Top = 48
        Width = 217
        Height = 23
        Hint = 'Configure default data on "mame.ini" for executable 2'
        Caption = 'Set &2nd Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet2ndEmulatorOptionsClick
      end
      object ExecutableFile2ButtonSelect: TButton
        Left = 304
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile2ButtonSelectClick
      end
    end
    object TabSheetEmulator3: TTabSheet
      ImageIndex = 47
      object ExecutableFile3: TEdit
        Left = 8
        Top = 16
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile3Change
      end
      object ButtonClearCommandLine3: TButton
        Left = 250
        Top = 48
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
        Left = 8
        Top = 48
        Width = 217
        Height = 23
        Hint = 'Configure default data on "mame.ini" for executable 3'
        Caption = 'Set &3rd Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet3rdEmulatorOptionsClick
      end
      object ExecutableFile3ButtonSelect: TButton
        Left = 304
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile3ButtonSelectClick
      end
    end
    object TabSheetEmulator4: TTabSheet
      ImageIndex = 61
      object ExecutableFile4: TEdit
        Left = 8
        Top = 16
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile4Change
      end
      object ButtonClearCommandLine4: TButton
        Left = 250
        Top = 48
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
        Left = 8
        Top = 48
        Width = 217
        Height = 23
        Hint = 'Configure default data on "mame.ini" for executable 4'
        Caption = 'Set &4th Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet4thEmulatorOptionsClick
      end
      object ExecutableFile4ButtonSelect: TButton
        Left = 304
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile4ButtonSelectClick
      end
    end
    object TabSheetEmulator5: TTabSheet
      ImageIndex = 62
      object ExecutableFile5: TEdit
        Left = 8
        Top = 16
        Width = 289
        Height = 21
        TabStop = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = ExecutableFile5Change
      end
      object ButtonClearCommandLine5: TButton
        Left = 250
        Top = 48
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
        Left = 8
        Top = 48
        Width = 217
        Height = 23
        Hint = 'Configure default data on "mame.ini" for executable 5'
        Caption = 'Set &5th Emulator Options'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonSet5thEmulatorOptionsClick
      end
      object ExecutableFile5ButtonSelect: TButton
        Left = 304
        Top = 16
        Width = 21
        Height = 21
        Hint = 'Click here to select a file (MAME and DOS MAME only)'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ExecutableFile5ButtonSelectClick
      end
    end
  end
  object DefaultGamesListBuilder: TGaugeBar
    Left = 8
    Top = 152
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
