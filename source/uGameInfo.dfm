object FormGameInfo: TFormGameInfo
  Left = 220
  Top = 206
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 289
  ClientWidth = 497
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
  object PageControlGameInfo: TPageControl
    Left = 8
    Top = 8
    Width = 481
    Height = 233
    ActivePage = TabSheetGameInfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheetGameInfo: TTabSheet
      Caption = 'Game Description'
      ImageIndex = -1
      object LabelManufacturer: TLabel
        Left = 8
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Manufacturer'
        ShowAccelChar = False
      end
      object Manufacturer: TLabel
        Left = 8
        Top = 24
        Width = 409
        Height = 13
        AutoSize = False
        Caption = 'Manufacturer'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelYear: TLabel
        Left = 8
        Top = 48
        Width = 22
        Height = 13
        Caption = 'Year'
        ShowAccelChar = False
      end
      object Year: TLabel
        Left = 8
        Top = 64
        Width = 22
        Height = 13
        Caption = 'Year'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelSound: TLabel
        Left = 80
        Top = 48
        Width = 30
        Height = 13
        Caption = 'Sound'
        ShowAccelChar = False
      end
      object Sound: TLabel
        Left = 80
        Top = 64
        Width = 30
        Height = 13
        Caption = 'Sound'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelFrequency: TLabel
        Left = 168
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Frequency'
        ShowAccelChar = False
      end
      object Frequency: TLabel
        Left = 168
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Frequency'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelSamples: TLabel
        Left = 264
        Top = 48
        Width = 39
        Height = 13
        Caption = 'Samples'
        ShowAccelChar = False
      end
      object Samples: TLabel
        Left = 264
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Samples'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelControlType: TLabel
        Left = 360
        Top = 48
        Width = 62
        Height = 13
        Caption = 'Control Type'
        ShowAccelChar = False
      end
      object ControlType: TLabel
        Left = 360
        Top = 64
        Width = 62
        Height = 13
        Caption = 'Control Type'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelVideo: TLabel
        Left = 8
        Top = 88
        Width = 26
        Height = 13
        Caption = 'Video'
        ShowAccelChar = False
      end
      object Video: TLabel
        Left = 8
        Top = 104
        Width = 26
        Height = 13
        Caption = 'Video'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelOrientation: TLabel
        Left = 80
        Top = 88
        Width = 54
        Height = 13
        Caption = 'Orientation'
        ShowAccelChar = False
      end
      object Orientation: TLabel
        Left = 80
        Top = 104
        Width = 54
        Height = 13
        Caption = 'Orientation'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelResolution: TLabel
        Left = 168
        Top = 88
        Width = 50
        Height = 13
        Caption = 'Resolution'
        ShowAccelChar = False
      end
      object Resolution: TLabel
        Left = 168
        Top = 104
        Width = 50
        Height = 13
        Caption = 'Resolution'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelDriverStatus: TLabel
        Left = 8
        Top = 128
        Width = 63
        Height = 13
        Caption = 'Driver Status'
        ShowAccelChar = False
      end
      object LabelSoundStatus: TLabel
        Left = 120
        Top = 128
        Width = 64
        Height = 13
        Caption = 'Sound Status'
        ShowAccelChar = False
      end
      object LabelColorStatus: TLabel
        Left = 232
        Top = 128
        Width = 59
        Height = 13
        Caption = 'Color Status'
        ShowAccelChar = False
      end
      object DriverStatus: TLabel
        Left = 8
        Top = 144
        Width = 63
        Height = 13
        Caption = 'Driver Status'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object SoundStatus: TLabel
        Left = 120
        Top = 144
        Width = 64
        Height = 13
        Caption = 'Sound Status'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object ColorStatus: TLabel
        Left = 232
        Top = 144
        Width = 59
        Height = 13
        Caption = 'Color Status'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelCategory: TLabel
        Left = 8
        Top = 168
        Width = 45
        Height = 13
        Caption = 'Category'
        ShowAccelChar = False
      end
      object Category: TLabel
        Left = 8
        Top = 184
        Width = 45
        Height = 13
        Caption = 'Category'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelMerged: TLabel
        Left = 360
        Top = 128
        Width = 36
        Height = 13
        Caption = 'Merged'
        ShowAccelChar = False
      end
      object Merged: TLabel
        Left = 360
        Top = 144
        Width = 36
        Height = 13
        Caption = 'Merged'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelName: TLabel
        Left = 264
        Top = 88
        Width = 27
        Height = 13
        Caption = 'Name'
        ShowAccelChar = False
      end
      object Name: TLabel
        Left = 264
        Top = 104
        Width = 27
        Height = 13
        Caption = 'Name'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelCloneOf: TLabel
        Left = 336
        Top = 88
        Width = 40
        Height = 13
        Caption = 'Clone of'
        ShowAccelChar = False
      end
      object CloneOf: TLabel
        Left = 336
        Top = 104
        Width = 40
        Height = 13
        Caption = 'Clone of'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelVersionAdded: TLabel
        Left = 360
        Top = 168
        Width = 69
        Height = 13
        Caption = 'Version Added'
        ShowAccelChar = False
      end
      object VersionAdded: TLabel
        Left = 360
        Top = 184
        Width = 69
        Height = 13
        Caption = 'Version Added'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object LabelDriver: TLabel
        Left = 408
        Top = 88
        Width = 29
        Height = 13
        Caption = 'Driver'
        ShowAccelChar = False
      end
      object Driver: TLabel
        Left = 408
        Top = 104
        Width = 29
        Height = 13
        Caption = 'Driver'
        ParentShowHint = False
        ShowAccelChar = False
        ShowHint = True
        Transparent = True
      end
      object ImageGameIcon: TImage
        Left = 432
        Top = 8
        Width = 32
        Height = 32
        Center = True
        Transparent = True
      end
    end
  end
  object ButtonClose: TButton
    Left = 416
    Top = 256
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonCloseClick
  end
end
