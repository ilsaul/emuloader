object FormCustomGameSelector: TFormCustomGameSelector
  Left = 192
  Top = 107
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 224
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CustomList: TListView
    Left = 0
    Top = 0
    Width = 254
    Height = 224
    Align = alClient
    Color = clBlack
    Columns = <
      item
        Caption = 'Description'
        Width = 150
      end
      item
        Caption = 'Name'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = CustomListDblClick
    OnKeyUp = CustomListKeyUp
  end
end
