object FormFilterGameColumns: TFormFilterGameColumns
  Left = 259
  Top = 181
  ActiveControl = ColumnsList
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Game Columns'
  ClientHeight = 327
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOk: TButton
    Left = 240
    Top = 296
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
    Top = 296
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
    Top = 8
    Width = 393
    Height = 273
    ActivePage = TabSheetVisibleColumns
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object TabSheetVisibleColumns: TTabSheet
      object ColumnsList: TListView
        Left = 8
        Top = 8
        Width = 273
        Height = 225
        Checkboxes = True
        Columns = <
          item
            Width = 250
          end
          item
            Width = 0
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
      object ButtonDefault: TButton
        Left = 296
        Top = 208
        Width = 75
        Height = 23
        Hint = 'Set default value(s)'
        Caption = 'Default'
        TabOrder = 1
        OnClick = ButtonDefaultClick
      end
      object ButtonShowHide: TButton
        Tag = 1
        Left = 296
        Top = 8
        Width = 75
        Height = 23
        Hint = 'Show / hide column'
        Caption = '&Hide'
        TabOrder = 2
        OnClick = ButtonShowHideClick
      end
      object ButtonUp: TButton
        Left = 296
        Top = 40
        Width = 75
        Height = 23
        Hint = 'Move selected column up'
        Caption = '&Up'
        TabOrder = 3
        OnClick = ButtonUpClick
      end
      object ButtonDown: TButton
        Left = 296
        Top = 72
        Width = 75
        Height = 23
        Hint = 'Move selected column down'
        Caption = '&Down'
        TabOrder = 4
        OnClick = ButtonDownClick
      end
      object ButtonSave: TButton
        Left = 296
        Top = 176
        Width = 75
        Height = 23
        Hint = 'Save contents to a file'
        Caption = '&Save'
        TabOrder = 5
        OnClick = ButtonSaveClick
      end
      object ButtonLoad: TButton
        Left = 296
        Top = 144
        Width = 75
        Height = 23
        Hint = 'Load settings'
        Caption = '&Load'
        TabOrder = 6
        OnClick = ButtonLoadClick
      end
      object ColumnSizeUpDown: TUpDown
        Left = 354
        Top = 104
        Width = 17
        Height = 21
        Associate = ColumnSize
        Max = 800
        TabOrder = 7
        Thousands = False
        OnClick = ColumnSizeUpDownClick
      end
      object ColumnSize: TEdit
        Left = 297
        Top = 104
        Width = 57
        Height = 21
        AutoSize = False
        TabOrder = 8
        Text = '0'
      end
    end
  end
end
