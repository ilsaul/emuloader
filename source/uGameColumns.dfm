object FormFilterGameColumns: TFormFilterGameColumns
  Left = 259
  Top = 181
  ActiveControl = ColumnsList
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 406
  ClientWidth = 409
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 409
    Height = 60
  end
  object BottomLine: TBevel
    Left = 5
    Top = 360
    Width = 399
    Height = 10
    Shape = bsTopLine
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 70
    Height = 13
    Caption = 'Game Columns'
    ShowAccelChar = False
    Transparent = True
  end
  object ButtonOk: TButton
    Left = 240
    Top = 376
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
    Left = 328
    Top = 376
    Width = 75
    Height = 23
    Hint = 'Close without updating'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object PageControlVisibleColumns: TPageControl
    Left = 8
    Top = 72
    Width = 393
    Height = 265
    ActivePage = TabSheetVisibleColumns
    ParentShowHint = False
    ShowHint = True
    TabIndex = 0
    TabOrder = 2
    object TabSheetVisibleColumns: TTabSheet
      object ColumnsList: TListView
        Left = 8
        Top = 8
        Width = 273
        Height = 217
        Checkboxes = True
        Columns = <
          item
            Width = 250
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = ColumnsListClick
        OnKeyUp = ColumnsListKeyUp
        OnSelectItem = ColumnsListSelectItem
      end
      object ButtonsBox: TGroupBox
        Left = 288
        Top = 3
        Width = 91
        Height = 113
        TabOrder = 1
        object ButtonShowHide: TButton
          Tag = 1
          Left = 8
          Top = 16
          Width = 75
          Height = 23
          Hint = 'Show / hide column'
          Caption = '&Hide'
          TabOrder = 0
          OnClick = ButtonShowHideClick
        end
        object ButtonUp: TButton
          Left = 8
          Top = 48
          Width = 75
          Height = 23
          Hint = 'Move selected column up'
          Caption = '&Up'
          TabOrder = 1
          OnClick = ButtonUpClick
        end
        object ButtonDown: TButton
          Left = 8
          Top = 80
          Width = 75
          Height = 23
          Hint = 'Move selected column down'
          Caption = '&Down'
          TabOrder = 2
          OnClick = ButtonDownClick
        end
      end
    end
  end
end
