object FormCustomGameCategory: TFormCustomGameCategory
  Left = 218
  Top = 214
  ActiveControl = ButtonCancel
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Custom Game Category'
  ClientHeight = 328
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
    Height = 273
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
      object ButtonClearNewCategory: TButton
        Left = 384
        Top = 216
        Width = 75
        Height = 23
        Hint = 'Clear the new category'
        Caption = 'Cl&ear'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonClearNewCategoryClick
      end
      object LabelDefaultCategories: TGroupBox
        Left = 48
        Top = 48
        Width = 409
        Height = 57
        Caption = 'Default Categories'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object DefaultCategoriesList: TComboBox
          Left = 8
          Top = 24
          Width = 393
          Height = 21
          Hint = 'Select a category'
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = '(none)'
          OnChange = DefaultCategoriesListChange
          Items.Strings = (
            '(none)')
        end
      end
      object ButtonOriginalCategory: TButton
        Left = 48
        Top = 216
        Width = 169
        Height = 25
        Hint = 'Set the original category from "catver.ini"'
        Caption = 'Original &Category'
        TabOrder = 2
        OnClick = ButtonOriginalCategoryClick
      end
      object LabelCustomCategories: TGroupBox
        Left = 48
        Top = 112
        Width = 409
        Height = 89
        Caption = 'Custom Categories'
        TabOrder = 3
        object NewCategory: TEdit
          Left = 8
          Top = 56
          Width = 393
          Height = 21
          Hint = 'Type the new category, if not exist on the above categories list'
          Enabled = False
          TabOrder = 0
          OnChange = NewCategoryChange
        end
        object CustomCategoriesList: TComboBox
          Left = 8
          Top = 24
          Width = 393
          Height = 21
          Hint = 'Select a custom category'
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = '(none)'
          OnChange = CustomCategoriesListChange
          Items.Strings = (
            '(none)'
            'Custom Category')
        end
      end
    end
  end
  object ButtonOk: TButton
    Left = 320
    Top = 296
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
    Top = 296
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
