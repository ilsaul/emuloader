object FormGamesListLegend: TFormGamesListLegend
  Left = 217
  Top = 156
  ActiveControl = PageControlIconsDescription
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  ClientHeight = 290
  ClientWidth = 424
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  object PageControlIconsDescription: TPageControl
    Left = 8
    Top = 8
    Width = 409
    Height = 273
    ActivePage = TabSheetAvailableGames
    TabIndex = 0
    TabOrder = 0
    object TabSheetAvailableGames: TTabSheet
      object ClassicMR: TImage
        Left = 8
        Top = 8
        Width = 16
        Height = 16
        Transparent = True
      end
      object ClassicMV: TImage
        Left = 8
        Top = 32
        Width = 16
        Height = 16
        Transparent = True
      end
      object ClassicCR: TImage
        Left = 8
        Top = 56
        Width = 16
        Height = 16
        Transparent = True
      end
      object ClassicCV: TImage
        Left = 8
        Top = 80
        Width = 16
        Height = 16
        Transparent = True
      end
      object NeoGeoM: TImage
        Left = 8
        Top = 104
        Width = 16
        Height = 16
        Transparent = True
      end
      object NeoGeoC: TImage
        Left = 8
        Top = 128
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelClassicMR: TLabel
        Left = 32
        Top = 8
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Classic Master Raster Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelClassicMV: TLabel
        Left = 32
        Top = 32
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Classic Master Vector Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelClassicCR: TLabel
        Left = 32
        Top = 56
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Classic Clone Raster Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelClassicCV: TLabel
        Left = 32
        Top = 80
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Classic Clone Vector Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelNeoGeoM: TLabel
        Left = 32
        Top = 104
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Neo Geo Master Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelNeoGeoC: TLabel
        Left = 32
        Top = 128
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Neo Geo Clone Games'
        ShowAccelChar = False
        Transparent = True
      end
      object ClassicBios: TImage
        Left = 8
        Top = 152
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelClassicBios: TLabel
        Left = 32
        Top = 152
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Classic Bios'
        ShowAccelChar = False
        Transparent = True
      end
      object NeoGeoBios: TImage
        Left = 8
        Top = 176
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelNeoGeoBios: TLabel
        Left = 32
        Top = 176
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Neo Geo Bios'
        ShowAccelChar = False
        Transparent = True
      end
      object CustomGames: TImage
        Left = 8
        Top = 200
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelCustomGames: TLabel
        Left = 32
        Top = 200
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Custom Games'
        ShowAccelChar = False
        Transparent = True
      end
      object RealIcon: TImage
        Left = 8
        Top = 224
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelRealIcon: TLabel
        Left = 32
        Top = 224
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Real Icon'
        ShowAccelChar = False
        Transparent = True
      end
    end
    object TabSheetUnavailableGames: TTabSheet
      ImageIndex = 1
      object UnClassicMR: TImage
        Left = 8
        Top = 8
        Width = 16
        Height = 16
        Transparent = True
      end
      object UnClassicMV: TImage
        Left = 8
        Top = 32
        Width = 16
        Height = 16
        Transparent = True
      end
      object UnClassicCR: TImage
        Left = 8
        Top = 56
        Width = 16
        Height = 16
        Transparent = True
      end
      object UnClassicCV: TImage
        Left = 8
        Top = 80
        Width = 16
        Height = 16
        Transparent = True
      end
      object UnNeoGeoM: TImage
        Left = 8
        Top = 104
        Width = 16
        Height = 16
        Transparent = True
      end
      object UnNeoGeoC: TImage
        Left = 8
        Top = 128
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelUnClassicMR: TLabel
        Left = 32
        Top = 8
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Classic Master Raster Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUnClassicMV: TLabel
        Left = 32
        Top = 32
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Classic Master Vector Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUnClassicCR: TLabel
        Left = 32
        Top = 56
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Classic Clone Raster Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUnClassicCV: TLabel
        Left = 32
        Top = 80
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Classic Clone Vector Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUnNeoGeoM: TLabel
        Left = 32
        Top = 104
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Neo Geo Master Games'
        ShowAccelChar = False
        Transparent = True
      end
      object LabelUnNeoGeoC: TLabel
        Left = 32
        Top = 128
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Neo Geo Clone Games'
        ShowAccelChar = False
        Transparent = True
      end
      object UnClassicBios: TImage
        Left = 8
        Top = 152
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelUnClassicBios: TLabel
        Left = 32
        Top = 152
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Classic Bios'
        ShowAccelChar = False
        Transparent = True
      end
      object UnNeoGeoBios: TImage
        Left = 8
        Top = 176
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelUnNeoGeoBios: TLabel
        Left = 32
        Top = 176
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Neo Geo Bios'
        ShowAccelChar = False
        Transparent = True
      end
      object UnCustomGames: TImage
        Left = 8
        Top = 200
        Width = 16
        Height = 16
        Transparent = True
      end
      object LabelUnCustomGames: TLabel
        Left = 32
        Top = 200
        Width = 361
        Height = 13
        AutoSize = False
        Caption = 'Unavailable Custom Games'
        ShowAccelChar = False
        Transparent = True
      end
    end
  end
end
