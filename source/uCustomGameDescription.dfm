object FormCustomGameDescription: TFormCustomGameDescription
  Left = 218
  Top = 214
  ActiveControl = ButtonCancel
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Custom Game Description'
  ClientHeight = 233
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlCustomCommandLine: TPageControl
    Left = 8
    Top = 8
    Width = 473
    Height = 177
    ActivePage = TabSheetCustomCommandLine
    ParentShowHint = False
    ShowHint = True
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
      object ButtonClearNewDescription: TButton
        Left = 384
        Top = 120
        Width = 75
        Height = 23
        Hint = 'Clear the new description'
        Caption = 'Cl&ear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonClearNewDescriptionClick
      end
      object LabelNewDescription: TGroupBox
        Left = 48
        Top = 48
        Width = 409
        Height = 57
        Caption = 'New Description'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object NewDescription: TEdit
          Left = 8
          Top = 24
          Width = 393
          Height = 21
          Hint = 
            'Type the new description (mouse double-click to reset descriptio' +
            'n)'
          TabOrder = 0
          OnChange = NewDescriptionChange
          OnDblClick = NewDescriptionDblClick
        end
      end
      object ButtonOriginalDescription: TButton
        Left = 48
        Top = 120
        Width = 169
        Height = 25
        Hint = 'Set the original MAME description'
        Caption = 'Original &Description'
        TabOrder = 2
        OnClick = ButtonOriginalDescriptionClick
      end
    end
  end
  object ButtonOk: TButton
    Left = 320
    Top = 200
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
    Top = 200
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
