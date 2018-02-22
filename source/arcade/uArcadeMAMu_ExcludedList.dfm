object FormArcadeMAMu_ExcludedList: TFormArcadeMAMu_ExcludedList
  Left = 569
  Top = 358
  ActiveControl = ExcludedFiles
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Excluded List for Not Used MAMu_ Icons'
  ClientHeight = 399
  ClientWidth = 616
  Color = 15856113
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 15
  object LabelInfo: TLabel
    Left = 17
    Top = 362
    Width = 354
    Height = 26
    AutoSize = False
    Caption = 
      'Edit text above. Listed files will never be added into the icons' +
      ' list. Icon filenames only... do NOT add folders!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object ButtonOk: TBitBtn
    Left = 420
    Top = 366
    Width = 89
    Height = 25
    Hint = 'Close and update the excluded list'
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object ExcludedFiles: TMemo
    Left = 8
    Top = 8
    Width = 600
    Height = 345
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Cancel: TBitBtn
    Left = 518
    Top = 366
    Width = 89
    Height = 25
    Hint = 'Close without updating'
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
end
