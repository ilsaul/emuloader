object FormTextViewer: TFormTextViewer
  Left = 146
  Top = 139
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 423
  ClientWidth = 619
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
    Width = 618
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 81
    Height = 13
    Caption = 'Text Files Viewer'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 384
    Width = 608
    Height = 10
    Shape = bsTopLine
  end
  object TextHolder: TRichEdit
    Left = 8
    Top = 72
    Width = 601
    Height = 297
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
  end
  object TextOptions: TComboBoxEx
    Left = 8
    Top = 395
    Width = 257
    Height = 22
    ItemsEx.CaseSensitive = False
    ItemsEx.SortType = stNone
    ItemsEx = <
      item
        Caption = '(No Text)'
        ImageIndex = 0
        SelectedImageIndex = 0
      end
      item
        Caption = 'View Read Me'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View What'#39's New'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Bugs List'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View To-do List'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View DATs Format'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Default Game Icons Naming'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Old News (History)'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Custom Games Tutorial'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Troubleshooting Guide / F.A.Q.'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Parental Lock Tutorial'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View User Profile Tutorial'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Custom Command Line Tutorial'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Tips and Tricks'
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = 'View Read Me'
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = 'View Windows Instructions'
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = 'View MS-DOS Instructions'
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = 'View What'#39's New'
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = 'View Game List'
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = 'View Controller Input Mappings'
        ImageIndex = 2
        SelectedImageIndex = 2
      end>
    Style = csExDropDownList
    StyleEx = []
    ItemHeight = 16
    TabOrder = 1
    OnSelect = TextOptionsSelect
    Images = FilesImageList
    DropDownCount = 8
  end
  object ButtonClose: TButton
    Left = 536
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonCloseClick
  end
  object ButtonTextFilesFont: TButton
    Left = 432
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Select font for the text'
    Caption = 'Font'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonTextFilesFontClick
  end
  object ButtonTextFilesDefaultFont: TButton
    Left = 344
    Top = 395
    Width = 75
    Height = 23
    Hint = 'Select default font for the text'
    Caption = 'Default'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonTextFilesDefaultFontClick
  end
  object FilesImageList: TImageList
    Left = 296
    Top = 392
  end
end
