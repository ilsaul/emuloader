object FormMAMEKeysInfo: TFormMAMEKeysInfo
  Left = 193
  Top = 130
  ActiveControl = ButtonClose
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 416
  ClientWidth = 530
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
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 530
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 94
    Height = 13
    Caption = 'M.A.M.E. Keys Info'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 368
    Width = 520
    Height = 10
    Shape = bsTopLine
  end
  object Keys: TMemo
    Left = 8
    Top = 72
    Width = 513
    Height = 281
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Tab        Toggles the configuration menu'
      'Tilde      Toggles the On Screen Display'
      
        '           Use the up and down arrow keys to select the paramete' +
        'r'
      
        '           (global volume, mixing level, gamma correction etc.),' +
        ' left'
      '           and right to arrow keys to modify it.'
      'P          Pauses the game'
      'Shift+P    While paused, advances to next frame'
      'F1         Toggle raster effects in some games'
      '           Toggle crosshair in gun games'
      'F2         Service Mode'
      'F3         Resets the game'
      'F4         Shows the game palette, decoded GFX, and any tilemaps'
      
        '           Cursor left/right changes between palette, GFX and ti' +
        'lemaps'
      '           Curser up/down cycle through valid palettes'
      '           Page up/down scroll through the palette and GFX'
      '           Page up/down, D, G scroll the tilemap display'
      '           Ctrl & Shift are modifiers to change movement speed.'
      '           F4 or Esc returns to the emulation.'
      
        '           Note: Not all games have decoded graphics and/or tile' +
        'maps.'
      'F5         Toggle debugeer (only in debug build)'
      'F6         Toggle cheat mode (if started with "-cheat")'
      'F7         Load a '#39'Save State'#39
      
        '           You will be requested to press a key to determine whi' +
        'ch'
      '           Save State you wish to load.'
      '           Note that the '#39'Save State'#39' feature is for developing'
      
        '           drivers and not intended for users. It is incomplete ' +
        'and'
      '           works only on a number of drivers. Use at own risk.'
      'Shift+F7   Create a '#39'Save State'#39
      
        '           Requires an additional keypress to identify the state' +
        '. You'
      '           must have a STA directory or MAME may crash.'
      'F8         Decrease frame skip on the fly'
      'F9         Increase frame skip on the fly'
      'F10        Toggles speed throttling'
      'F11        Toggles speed display'
      'Shift+F11  Toggles profiler display (debug builds only)'
      
        'F12        Saves a screen snapshot. The default target directory' +
        ' is'
      
        '           SNAP. You must create this directory yourself; the pr' +
        'ogram'
      '           will not create it if it doesn'#39't exist.'
      'ESC        Exits emulator')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object ButtonClose: TButton
    Left = 448
    Top = 384
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
end
