object FormAudit: TFormAudit
  Left = 171
  Top = 153
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Audit Games'
  ClientHeight = 419
  ClientWidth = 618
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
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 618
    Height = 60
  end
  object LabelGameDescription: TLabel
    Left = 72
    Top = 24
    Width = 537
    Height = 15
    AutoSize = False
    Caption = 'This is the description of the game (or the selected game)'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelMergedMasterGame: TLabel
    Left = 8
    Top = 360
    Width = 385
    Height = 15
    AutoSize = False
    ShowAccelChar = False
    Transparent = True
  end
  object LabelAuditedGames: TLabel
    Left = 8
    Top = 398
    Width = 105
    Height = 15
    AutoSize = False
    Caption = '000000 of 000000'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelAudited: TLabel
    Left = 8
    Top = 384
    Width = 105
    Height = 13
    AutoSize = False
    Caption = 'Audited'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelGood: TLabel
    Left = 144
    Top = 384
    Width = 105
    Height = 13
    AutoSize = False
    Caption = 'Good'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelGoodAuditedGames: TLabel
    Left = 144
    Top = 398
    Width = 105
    Height = 13
    AutoSize = False
    Caption = '000000 of 000000'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelMissingSets: TLabel
    Left = 280
    Top = 384
    Width = 105
    Height = 13
    AutoSize = False
    Caption = 'Missing Sets'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelMissingGameFiles: TLabel
    Left = 280
    Top = 398
    Width = 105
    Height = 13
    AutoSize = False
    Caption = '000000 of 000000'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelErrors: TLabel
    Left = 416
    Top = 384
    Width = 105
    Height = 13
    AutoSize = False
    Caption = 'Errors'
    ShowAccelChar = False
    Transparent = True
  end
  object LabelBadAuditedGames: TLabel
    Left = 416
    Top = 398
    Width = 105
    Height = 13
    AutoSize = False
    Caption = '000000 of 000000'
    ShowAccelChar = False
    Transparent = True
  end
  object ButtonClose: TButton
    Left = 536
    Top = 387
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ButtonCloseClick
  end
  object ButtonCancel: TButton
    Left = 536
    Top = 359
    Width = 75
    Height = 23
    Hint = 'Cancel the auditing'
    Caption = 'C&ancel'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object AuditROMsTree: TZTreeView
    Left = 8
    Top = 72
    Width = 601
    Height = 281
    Hint = 'Right-click mouse for popup menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    HideSelection = False
    Images = ImageListResults
    Indent = 19
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupAuditGames
    ReadOnly = True
    ShowHint = True
    ShowLines = False
    TabOrder = 2
    ToolTips = False
    OnCollapsing = AuditROMsTreeCollapsing
    OnExpanding = AuditROMsTreeExpanding
    Recursive = False
  end
  object ProgressBarFileAudit: TProgressBar
    Left = 400
    Top = 360
    Width = 126
    Height = 15
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 3
    Visible = False
  end
  object ImageListResults: TImageList
    Left = 560
    Top = 24
  end
  object PopupAuditGames: TPopupMenu
    Images = ImageListResults
    Left = 528
    Top = 24
    object PopupAuditGameAgain: TMenuItem
      Caption = 'Audit &Game Again...'
      ImageIndex = 19
      OnClick = PopupAuditGameAgainClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PopupSaveResultstoHTMLFile: TMenuItem
      Caption = 'Save to HTML File'
      ImageIndex = 16
      OnClick = PopupSaveResultstoHTMLFileClick
    end
    object PopupSaveBadGamestoHTMLFile: TMenuItem
      Caption = 'Save Bad Games to HTML File'
      ImageIndex = 16
      OnClick = PopupSaveBadGamestoHTMLFileClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object PopupShowOnlyBadGames: TMenuItem
      Caption = 'Show Only Bad Games'
      ImageIndex = 15
      RadioItem = True
      OnClick = PopupShowOnlyBadGamesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupShowGamesDetails: TMenuItem
      Caption = 'Show Games Details'
      ImageIndex = 17
      OnClick = PopupShowGamesDetailsClick
    end
    object PopupHideGamesDetails: TMenuItem
      Caption = 'Hide Games Details'
      ImageIndex = 18
      OnClick = PopupHideGamesDetailsClick
    end
  end
  object SaveAuditDialog: TSaveDialog
    DefaultExt = 'htm'
    Filter = 'HTML File (*.html; *.htm)|*.html;*.htm'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableIncludeNotify]
    Title = 'Save Audit Results to a File'
    Left = 496
    Top = 24
  end
end
