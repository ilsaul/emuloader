object FormFavoriteUsersManager: TFormFavoriteUsersManager
  Left = 250
  Top = 226
  ActiveControl = LabelSelectUser
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 375
  ClientWidth = 370
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
    Width = 370
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 289
    Height = 13
    AutoSize = False
    Caption = 'Favorite Users Manager'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 328
    Width = 360
    Height = 10
    Shape = bsTopLine
  end
  object PageControlUsersList: TPageControl
    Left = 8
    Top = 72
    Width = 353
    Height = 241
    ActivePage = TabSheetUsersList
    TabIndex = 0
    TabOrder = 0
    object TabSheetUsersList: TTabSheet
      Caption = 'Users List'
      object LabelNewUser: TGroupBox
        Left = 8
        Top = 104
        Width = 329
        Height = 97
        Caption = 'New User'
        TabOrder = 0
        Visible = False
        object LabelNewUserMessage: TLabel
          Left = 16
          Top = 16
          Width = 297
          Height = 13
          AutoSize = False
          Caption = 'Type a name and press Enter (ESC to cancel)'
          ShowAccelChar = False
          Transparent = True
          Layout = tlBottom
        end
        object NewUser: TEdit
          Left = 16
          Top = 32
          Width = 297
          Height = 21
          TabStop = False
          TabOrder = 0
          OnKeyUp = NewUserKeyUp
        end
        object ButtonCancelNewUser: TButton
          Left = 240
          Top = 64
          Width = 75
          Height = 23
          Hint = 'Do not add the new user'
          Caption = 'C&ancel'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ButtonCancelNewUserClick
        end
        object ButtonConfirmNewUser: TButton
          Left = 152
          Top = 64
          Width = 75
          Height = 23
          Hint = 'Add the new user'
          Caption = '&Ok'
          Default = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ButtonConfirmNewUserClick
        end
      end
      object LabelSelectUser: TGroupBox
        Left = 8
        Top = 40
        Width = 329
        Height = 57
        Caption = 'Select an User'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object UsersList: TComboBox
          Left = 16
          Top = 24
          Width = 297
          Height = 21
          Hint = 'Select an user to activate'
          Style = csDropDownList
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = UsersListChange
          Items.Strings = (
            '(Default)')
        end
      end
      object ToolBarButtons: TToolBar
        Left = 8
        Top = 8
        Width = 100
        Height = 22
        Align = alNone
        AutoSize = True
        Caption = 'ToolBarButtons'
        EdgeBorders = []
        Flat = True
        Images = FormMain.ToolbarButtonsImageList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Transparent = True
        Wrapable = False
        object ButtonNewUser: TToolButton
          Left = 0
          Top = 0
          Hint = 'Create a new user'
          AllowAllUp = True
          ImageIndex = 40
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonNewUserClick
        end
        object ButtonEditUser: TToolButton
          Left = 23
          Top = 0
          Hint = 'Edit current user'
          AllowAllUp = True
          ImageIndex = 41
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonEditUserClick
        end
        object ButtonDeleteUser: TToolButton
          Left = 46
          Top = 0
          Hint = 'Delete current user'
          AllowAllUp = True
          ImageIndex = 42
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonDeleteUserClick
        end
        object ToolButton2: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 44
          Style = tbsSeparator
        end
        object ButtonUpdateFavoriteGamesList: TToolButton
          Left = 77
          Top = 0
          Hint = 'Update favorite games list'
          ImageIndex = 43
          OnClick = ButtonUpdateFavoriteGamesListClick
        end
      end
    end
  end
  object ButtonClose: TButton
    Left = 288
    Top = 344
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
