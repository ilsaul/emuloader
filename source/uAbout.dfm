object FormAbout: TFormAbout
  Left = 167
  Top = 148
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 273
  ClientWidth = 315
  Color = clBlack
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
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
  object ImageLogo: TImage
    Left = 8
    Top = 8
    Width = 300
    Height = 150
    AutoSize = True
  end
  object LabelFrontendVersion: TLabel
    Left = 264
    Top = 160
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'v00.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object TextFader: TTextFader
    Left = 12
    Top = 188
    Width = 285
    Height = 37
    BackgroundMode = bmNone
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    LineDelay = 1000
    Lines.Strings = (
      
        'Emu Loader is a freeware software with full source available and' +
        ' cannot be sold'
      'The frontend is mainly designed to manage'
      
        'M.A.M.E. - Multiple Arcade Machine Emulator (M.A.M.E. and DOS M.' +
        'A.M.E.)'
      
        'Works with version 0.36 up to the latest release (old versions h' +
        'ave some limitations)'
      
        'It'#39's designed to support virtually any new M.A.M.E. version with' +
        'out'
      'making changes in the frontend (just create a new games list...)'
      
        'It can be freely distributed, but please, keep the files unchang' +
        'ed'
      'Compatible with all versions of Windows'
      'This frontend is a learning project'
      'It causes NO harm or any changes to your hardware and software'
      ''
      
        'Any comments or bugs reports please, e-mail me or post a message' +
        ' in the forum'
      ''
      'e-mail: emuloader@mameworld.net'
      'homepage: http://www.mameworld.net/emuloader/'
      ''
      'Many thanks to M.A.M.E. team for their excellent work!'
      'Special thanks to Mugnier Aymeric [MAMu_]'
      'for making the 3D model of Hot Rod controller,'
      'and the upcoming SlikStik and X-Arcade 3D models.'
      ''
      'Also thanks to'
      'Ra Chen (who made EL famous), :-)'
      'AzzaAzza69 for the awesome virtual mode,'
      'Marshall Brooks for beta testing and the "Tips and Tricks" file,'
      'Marco De Mori, for a bunch of fixes'
      'Roland Testa [TriggerFin],'
      'Humbert Stephane [StephH],'
      'L. D. Orchard [Eldio],'
      'Fuzz Norelid,'
      'Gh0st,'
      'Stig Remnes,'
      'Dave Swanwick,'
      'Michael Haralabos for Image32Ex component,'
      'Flash. S for the Chinese (Simplified) translation,'
      'Sword Liu for the Chinese (Traditional) translation,'
      'NONeSUCH for the Korean translation,'
      'Renato Mucciarelli for the German translation'
      'and everyone else with the bugs reports'
      'for helping in the development of Emu Loader'
      ''
      'Made in Brazil'
      ''
      ''
      '')
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object ButtonClose: TButton
    Left = 229
    Top = 238
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
