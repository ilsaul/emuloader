object FormCustomCommandLine: TFormCustomCommandLine
  Left = 218
  Top = 214
  ActiveControl = ButtonCancel
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 383
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 490
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 108
    Height = 13
    Caption = 'Custom Command Line'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 336
    Width = 480
    Height = 10
    Shape = bsTopLine
  end
  object PageControlCustomCommandLine: TPageControl
    Left = 8
    Top = 72
    Width = 473
    Height = 241
    ActivePage = TabSheetCustomCommandLine
    ParentShowHint = False
    ShowHint = True
    TabIndex = 0
    TabOrder = 0
    object TabSheetCustomCommandLine: TTabSheet
      Caption = 'Game Name'
      object GameIcon: TImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        AutoSize = True
        Transparent = True
      end
      object LabelGameDescription: TLabel
        Left = 48
        Top = 17
        Width = 409
        Height = 13
        AutoSize = False
        Caption = 'Game Description'
        ShowAccelChar = False
      end
      object LabelCustomCommandLineExecutable: TGroupBox
        Left = 48
        Top = 48
        Width = 409
        Height = 57
        Caption = 'Command Line Executable'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object CustomCommandLineExecutable: TEdit
          Left = 8
          Top = 24
          Width = 361
          Height = 21
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = CustomCommandLineExecutableChange
        end
        object CommandLineButtonSelect: TButton
          Left = 376
          Top = 24
          Width = 21
          Height = 21
          Hint = 'Click here to select a file'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = CommandLineButtonSelectClick
        end
      end
      object ButtonClearCustomCommandLine: TButton
        Left = 384
        Top = 184
        Width = 75
        Height = 23
        Hint = 'Clear the command line and command line parameters'
        Caption = 'Cl&ear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonClearCustomCommandLineClick
      end
      object LabelCustomCommandLineParamaters: TGroupBox
        Left = 48
        Top = 112
        Width = 409
        Height = 57
        Caption = 'Command Line Parameters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object CustomCommandLineParamaters: TEdit
          Left = 8
          Top = 24
          Width = 393
          Height = 21
          Hint = 'Type the parameters, surrounded by quotes if it has long name'
          TabOrder = 0
          OnChange = CustomCommandLineParamatersChange
        end
      end
    end
  end
  object ButtonOk: TButton
    Left = 320
    Top = 352
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 408
    Top = 352
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
end
