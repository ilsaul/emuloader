object FormUserProfileEditor: TFormUserProfileEditor
  Left = 199
  Top = 158
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'User Profile Editor'
  ClientHeight = 423
  ClientWidth = 626
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMainOptions: TPageControl
    Left = 8
    Top = 8
    Width = 609
    Height = 369
    ActivePage = TabSheetProfileMainData
    Images = UserProfileImageList
    MultiLine = True
    TabOrder = 0
    object TabSheetProfileMainData: TTabSheet
      Caption = 'Profile Main Data'
      object ButtonCreateNewProfile: TButton
        Left = 8
        Top = 128
        Width = 169
        Height = 23
        Hint = 'Create new user profile'
        Caption = 'Create &New Profile'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ButtonCreateNewProfileClick
      end
      object ButtonCancelNewProfile: TButton
        Left = 208
        Top = 128
        Width = 169
        Height = 23
        Hint = 'Cancel new user profile (before saving to .dat file)'
        Caption = 'Canc&el New Profile'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonCancelNewProfileClick
      end
      object ButtonDeleteSelectedProfile: TButton
        Left = 208
        Top = 160
        Width = 169
        Height = 23
        Hint = 
          'Delete the selected profile (only when users profile is not acti' +
          'vated)'
        Caption = '&Delete Profile'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonDeleteSelectedProfileClick
      end
      object ButtonSaveProfile: TButton
        Left = 8
        Top = 160
        Width = 169
        Height = 23
        Hint = 'Update existing profile options or save new profile'
        Caption = 'S&ave Profile'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ButtonSaveProfileClick
      end
      object ButtonPassword: TButton
        Left = 8
        Top = 192
        Width = 169
        Height = 23
        Hint = 'Define/change a password'
        Caption = '&Password'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = ButtonPasswordClick
      end
      object LabelSelectUserProfile: TGroupBox
        Left = 8
        Top = 8
        Width = 369
        Height = 105
        Caption = 'Select User Profile'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        object LabelProfileDescription: TLabel
          Left = 8
          Top = 56
          Width = 86
          Height = 13
          Hint = 
            'Disable Windows Access Keys (Ctrl+Alt+Del), (Alt+Tab) and (Ctrl+' +
            'Esc)'
          Caption = 'Profile Description'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = True
          Transparent = True
        end
        object SelectUserProfile: TComboBox
          Left = 8
          Top = 24
          Width = 353
          Height = 21
          Hint = 'Select an user profile (only when user profile is deactivated)'
          Style = csDropDownList
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          Sorted = True
          TabOrder = 0
          OnChange = SelectUserProfileChange
        end
        object ProfileDescription: TEdit
          Left = 8
          Top = 72
          Width = 353
          Height = 21
          Hint = 'Enter a new description to change selected profile description'
          TabOrder = 1
          OnKeyPress = ProfileDescriptionKeyPress
        end
      end
    end
    object TabSheetMiscellaneous: TTabSheet
      Caption = 'Miscellaneous'
      ImageIndex = 1
      object CreateGamesListImage: TImage
        Left = 8
        Top = 8
        Width = 16
        Height = 16
        Transparent = True
      end
      object EmulatorsSetupImage: TImage
        Left = 8
        Top = 32
        Width = 16
        Height = 16
        Transparent = True
      end
      object EmulatorsDescriptionImage: TImage
        Left = 8
        Top = 56
        Width = 16
        Height = 16
        Transparent = True
      end
      object SelectExecutable1Image: TImage
        Left = 8
        Top = 80
        Width = 16
        Height = 16
        Transparent = True
      end
      object EmulatorsDefaultOptionsImage: TImage
        Left = 8
        Top = 200
        Width = 16
        Height = 16
        Transparent = True
      end
      object FrontendPreferencesImage: TImage
        Left = 8
        Top = 224
        Width = 16
        Height = 16
        Transparent = True
      end
      object FavoriteGamesImage: TImage
        Left = 280
        Top = 32
        Width = 16
        Height = 16
        Transparent = True
      end
      object SelectExecutable2Image: TImage
        Left = 8
        Top = 104
        Width = 16
        Height = 16
        Transparent = True
      end
      object SelectExecutable3Image: TImage
        Left = 8
        Top = 128
        Width = 16
        Height = 16
        Transparent = True
      end
      object SelectExecutable4Image: TImage
        Left = 8
        Top = 152
        Width = 16
        Height = 16
        Transparent = True
      end
      object SelectExecutable5Image: TImage
        Left = 8
        Top = 176
        Width = 16
        Height = 16
        Transparent = True
      end
      object FavoriteUsersManagerImage: TImage
        Left = 280
        Top = 8
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowHideGamesListColumnsImage: TImage
        Left = 280
        Top = 56
        Width = 16
        Height = 16
        Transparent = True
      end
      object ParentalLockImage: TImage
        Left = 280
        Top = 80
        Width = 16
        Height = 16
        Enabled = False
        Transparent = True
      end
      object UserProfileImage: TImage
        Left = 280
        Top = 104
        Width = 16
        Height = 16
        Enabled = False
        Transparent = True
      end
      object FullScreenImage: TImage
        Left = 280
        Top = 128
        Width = 16
        Height = 16
        Transparent = True
      end
      object FullScreenExitImage: TImage
        Left = 280
        Top = 152
        Width = 16
        Height = 16
        Transparent = True
      end
      object KeysMappingSelectorImage: TImage
        Left = 280
        Top = 176
        Width = 16
        Height = 16
        Transparent = True
      end
      object CreateGamesList: TCheckBox
        Left = 32
        Top = 8
        Width = 233
        Height = 17
        Hint = 'Create MAME games list (.dat)'
        Caption = 'Create GamesList'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 0
      end
      object EmulatorsSetup: TCheckBox
        Left = 32
        Top = 32
        Width = 233
        Height = 17
        Hint = 'Change MAME executables and default options'
        Caption = 'Emulators Setup'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 1
      end
      object EmulatorsDescriptions: TCheckBox
        Left = 32
        Top = 56
        Width = 233
        Height = 17
        Hint = 'Change emulators descriptions'
        Caption = 'Emulators Descriptions'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
      end
      object SelectExecutable1: TCheckBox
        Left = 32
        Top = 80
        Width = 233
        Height = 17
        Hint = 'Change between available MAME executables'
        Caption = 'Select Executable 1'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
      end
      object EmulatorsDefaultOptions: TCheckBox
        Left = 32
        Top = 200
        Width = 233
        Height = 17
        Hint = 'Change MAME default options'
        Caption = 'Emulators Default Options'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 4
      end
      object FrontendPreferences: TCheckBox
        Left = 32
        Top = 224
        Width = 233
        Height = 17
        Hint = 'Access to "Preferences" screen'
        Caption = 'Frontend Preferences'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 5
      end
      object FavoriteGames: TCheckBox
        Left = 304
        Top = 32
        Width = 233
        Height = 17
        Hint = 'Switch to favorites games list'
        Caption = 'Favorite Games'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 6
      end
      object FavoriteUsersManager: TCheckBox
        Left = 304
        Top = 8
        Width = 233
        Height = 17
        Hint = 'Access to favorite users manager'
        Caption = 'Favorite Users Manager'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 7
      end
      object GamesColumnsEditor: TCheckBox
        Left = 304
        Top = 56
        Width = 233
        Height = 17
        Hint = 'Access to games columns editor'
        Caption = 'Games Columns Editor'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 8
      end
      object ParentalLock: TCheckBox
        Left = 304
        Top = 80
        Width = 233
        Height = 17
        Hint = 'Access to parental lock'
        Caption = 'Parental Lock'
        Checked = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 9
      end
      object UserProfile: TCheckBox
        Left = 304
        Top = 104
        Width = 233
        Height = 17
        Hint = 'Access to users profiles'
        Caption = 'User Profile'
        Checked = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 10
      end
      object FullScreen: TCheckBox
        Left = 304
        Top = 128
        Width = 233
        Height = 17
        Hint = 'Toggle frontend'#39's main screen between window/full screen'
        Caption = 'Full Screen'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 11
      end
      object SelectExecutable2: TCheckBox
        Left = 32
        Top = 104
        Width = 233
        Height = 17
        Hint = 'Change between available MAME executables'
        Caption = 'Select Executable 2'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 12
      end
      object SelectExecutable3: TCheckBox
        Left = 32
        Top = 128
        Width = 233
        Height = 17
        Hint = 'Change between available MAME executables'
        Caption = 'Select Executable 3'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 13
      end
      object SelectExecutable4: TCheckBox
        Left = 32
        Top = 152
        Width = 233
        Height = 17
        Hint = 'Change between available MAME executables'
        Caption = 'Select Executable 4'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 14
      end
      object SelectExecutable5: TCheckBox
        Left = 32
        Top = 176
        Width = 233
        Height = 17
        Hint = 'Change between available MAME executables'
        Caption = 'Select Executable 5'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 15
      end
      object FullScreenExit: TCheckBox
        Left = 304
        Top = 152
        Width = 233
        Height = 17
        Hint = 'Enable / disable the exit option while in full screen mode'
        Caption = 'Exit in Full Screen'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 16
      end
      object KeysMappingSelector: TCheckBox
        Left = 304
        Top = 176
        Width = 233
        Height = 17
        Hint = 'Enable / disable the keys mapping button in the toolbar'
        Caption = 'Keys Mapping Selector'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 17
      end
    end
    object TabSheetGames: TTabSheet
      Caption = 'Games'
      ImageIndex = 2
      object PageControlGames: TPageControl
        Left = 0
        Top = 0
        Width = 601
        Height = 340
        ActivePage = TabSheetGames1
        Align = alClient
        Images = UserProfileImageList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object TabSheetGames1: TTabSheet
          Caption = '1'
          ImageIndex = 2
          object GamesFilterSelectionImage: TImage
            Left = 8
            Top = 8
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesListShowBigIconsImage: TImage
            Left = 8
            Top = 32
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesListShowSmallIconsImage: TImage
            Left = 8
            Top = 56
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesListShowListImage: TImage
            Left = 8
            Top = 80
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesListShowDetailsImage: TImage
            Left = 8
            Top = 104
            Width = 16
            Height = 16
            Transparent = True
          end
          object PlayRecordedGameImage: TImage
            Left = 8
            Top = 248
            Width = 16
            Height = 16
            Transparent = True
          end
          object RecordGameImage: TImage
            Left = 8
            Top = 272
            Width = 16
            Height = 16
            Transparent = True
          end
          object CustomGameOptionsImage: TImage
            Left = 8
            Top = 128
            Width = 16
            Height = 16
            Transparent = True
          end
          object CustomInitializationOptionsImage: TImage
            Left = 8
            Top = 152
            Width = 16
            Height = 16
            Transparent = True
          end
          object CustomGameDescriptionImage: TImage
            Left = 8
            Top = 200
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesInformationImage: TImage
            Left = 264
            Top = 8
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesHistoryImage: TImage
            Left = 264
            Top = 32
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesDriverInformationImage: TImage
            Left = 264
            Top = 56
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesFAQImage: TImage
            Left = 264
            Top = 80
            Width = 16
            Height = 17
            Transparent = True
          end
          object CustomCommandLineImage: TImage
            Left = 8
            Top = 176
            Width = 16
            Height = 16
            Transparent = True
          end
          object CustomGameCategoryImage: TImage
            Left = 8
            Top = 224
            Width = 16
            Height = 16
            Transparent = True
          end
          object AutomaticGameInformationImage: TImage
            Left = 264
            Top = 104
            Width = 16
            Height = 16
            Transparent = True
          end
          object DeleteGameZIPImage: TImage
            Left = 264
            Top = 128
            Width = 16
            Height = 16
            Transparent = True
          end
          object AddGamesToFavoritesImage: TImage
            Left = 264
            Top = 152
            Width = 16
            Height = 16
            Transparent = True
          end
          object DeleteGamesFromFavoritesImage: TImage
            Left = 264
            Top = 176
            Width = 16
            Height = 16
            Transparent = True
          end
          object RealIconsImage: TImage
            Left = 264
            Top = 224
            Width = 16
            Height = 16
            Transparent = True
          end
          object AddGameParentalLockImage: TImage
            Left = 264
            Top = 200
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesAuditImage: TImage
            Left = 264
            Top = 272
            Width = 16
            Height = 16
            Transparent = True
          end
          object RefreshGamesImage: TImage
            Left = 264
            Top = 248
            Width = 16
            Height = 16
            Transparent = True
          end
          object GamesFilterSelector: TCheckBox
            Left = 32
            Top = 8
            Width = 225
            Height = 17
            Hint = 
              'Change between games filter options (all games, neo geo, classic' +
              ', etc...)'
            Caption = 'Games Filter Selector'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
          object GamesListShowBigIcons: TCheckBox
            Left = 32
            Top = 32
            Width = 225
            Height = 17
            Hint = 'Access to big icons games mode'
            Caption = 'Show Big Icons'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
          end
          object GamesListShowSmallIcons: TCheckBox
            Left = 32
            Top = 56
            Width = 225
            Height = 17
            Hint = 'Access to small icons games mode'
            Caption = 'Show Small Icons'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
          end
          object GamesListShowList: TCheckBox
            Left = 32
            Top = 80
            Width = 225
            Height = 17
            Hint = 'Access to list games mode'
            Caption = 'Show List'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 3
          end
          object GamesListShowDetails: TCheckBox
            Left = 32
            Top = 104
            Width = 225
            Height = 17
            Hint = 'Access to details games mode'
            Caption = 'Show Details'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 4
          end
          object PlayRecordedGame: TCheckBox
            Left = 32
            Top = 248
            Width = 225
            Height = 17
            Hint = 'Play recorded MAME games (.inp)'
            Caption = 'Play Recorded Game'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
          end
          object RecordGame: TCheckBox
            Left = 32
            Top = 272
            Width = 225
            Height = 17
            Hint = 'Record games to .inp files'
            Caption = 'Record Game'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 6
          end
          object CustomGameOptions: TCheckBox
            Left = 32
            Top = 128
            Width = 225
            Height = 17
            Hint = 'Access to customize games options'
            Caption = 'Custom Game Options'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 7
          end
          object CustomInitializationOptions: TCheckBox
            Left = 32
            Top = 152
            Width = 225
            Height = 17
            Hint = 'Access to customize game drivers & game resources (bios) options'
            Caption = 'Custom Initialization Options'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 8
          end
          object CustomGameDescription: TCheckBox
            Left = 32
            Top = 200
            Width = 225
            Height = 17
            Hint = 'Access to customize games descriptions'
            Caption = 'Custom Game Description'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 9
          end
          object GamesInformation: TCheckBox
            Left = 288
            Top = 8
            Width = 225
            Height = 17
            Hint = 'Access to mameinfo.dat information'
            Caption = 'Games Information'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 10
          end
          object GamesHistory: TCheckBox
            Left = 288
            Top = 32
            Width = 225
            Height = 17
            Hint = 'Access to history.dat information'
            Caption = 'Games History'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 11
          end
          object GamesDriverInformation: TCheckBox
            Left = 288
            Top = 56
            Width = 225
            Height = 17
            Hint = 'Access to mameinfo.dat information'
            Caption = 'Games Driver Information'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 12
          end
          object GamesFAQ: TCheckBox
            Left = 288
            Top = 80
            Width = 225
            Height = 17
            Hint = 'Access to games f.a.q information'
            Caption = 'Games F.A.Q.'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 13
          end
          object CustomCommandLine: TCheckBox
            Left = 32
            Top = 176
            Width = 225
            Height = 17
            Hint = 'Access to create games custom command lines'
            Caption = 'Custom Command Line'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 14
          end
          object CustomGameCategory: TCheckBox
            Left = 32
            Top = 224
            Width = 225
            Height = 17
            Hint = 'Access to create custom categories for games'
            Caption = 'Custom Category'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 15
          end
          object AutomaticGameInformation: TCheckBox
            Left = 288
            Top = 104
            Width = 225
            Height = 17
            Hint = 'Access to the automatic game information'
            Caption = 'Automatic Game Information'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 16
          end
          object DeleteGameZIP: TCheckBox
            Left = 288
            Top = 128
            Width = 225
            Height = 17
            Hint = 'Physically delete MAME .zip files'
            Caption = 'Delete Game ZIP'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 17
          end
          object AddGamesToFavorites: TCheckBox
            Left = 288
            Top = 152
            Width = 225
            Height = 17
            Hint = 'Add games to favorites lists'
            Caption = 'Add Games To Favorites'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 18
          end
          object DeleteGamesFromFavorites: TCheckBox
            Left = 288
            Top = 176
            Width = 225
            Height = 17
            Hint = 'Delete games from favorites lists'
            Caption = 'Delete Games From Favorites'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 19
          end
          object GamesIcons: TCheckBox
            Left = 288
            Top = 224
            Width = 225
            Height = 17
            Hint = 'Access to MAMu_ icons'
            Caption = 'Games Icons'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 20
          end
          object AddGameParentalLock: TCheckBox
            Left = 288
            Top = 200
            Width = 225
            Height = 17
            Hint = 'Access to add games to blocked list option'
            Caption = 'Add Game to Parental Lock'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 21
          end
          object GamesAudit: TCheckBox
            Left = 288
            Top = 272
            Width = 225
            Height = 17
            Hint = 'Access to games auditing'
            Caption = 'Games Audit'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 22
          end
          object RefreshGames: TCheckBox
            Left = 288
            Top = 248
            Width = 225
            Height = 17
            Hint = 'Refresh games list (all refresh types)'
            Caption = 'Refresh Games'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 23
          end
        end
      end
    end
    object TabSheetPreviewPictures: TTabSheet
      Caption = 'Preview Pictures'
      ImageIndex = 3
      object ShowPicturesImage: TImage
        Left = 8
        Top = 8
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowTitleSnapshotsImage: TImage
        Left = 8
        Top = 32
        Width = 16
        Height = 16
        Transparent = True
      end
      object DeletePicturesImage: TImage
        Left = 8
        Top = 224
        Width = 16
        Height = 16
        Transparent = True
      end
      object RenamePicturesImage: TImage
        Left = 8
        Top = 200
        Width = 16
        Height = 16
        Transparent = True
      end
      object DeleteExtraPicturesImage: TImage
        Left = 8
        Top = 248
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowInGameSnapshotsImage: TImage
        Left = 8
        Top = 56
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowMarqueesImage: TImage
        Left = 8
        Top = 80
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowFlyersImage: TImage
        Left = 8
        Top = 104
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowCabinetsImage: TImage
        Left = 8
        Top = 128
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowControlPanelsImage: TImage
        Left = 8
        Top = 152
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowControlPanelLayoutsImage: TImage
        Left = 8
        Top = 176
        Width = 16
        Height = 16
        Transparent = True
      end
      object CreatePicturesListImage: TImage
        Left = 8
        Top = 272
        Width = 16
        Height = 16
        Transparent = True
      end
      object ShowTitleSnapshots: TCheckBox
        Left = 32
        Top = 32
        Width = 233
        Height = 17
        Hint = 'Access to title snapshots'
        Caption = 'Show Title Snapshots'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 0
      end
      object DeletePictures: TCheckBox
        Left = 32
        Top = 224
        Width = 233
        Height = 17
        Hint = 'Delete in game snapshots'
        Caption = 'Delete Pictures'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 1
      end
      object RenamePictures: TCheckBox
        Left = 32
        Top = 200
        Width = 233
        Height = 17
        Hint = 'Rename in game snapshots'
        Caption = 'Rename Pictures'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
      end
      object DeleteExtraPictures: TCheckBox
        Left = 32
        Top = 248
        Width = 233
        Height = 17
        Hint = 'Delete extra in game snapshots'
        Caption = 'Delete Extra Pictures'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
      end
      object ShowPictures: TCheckBox
        Left = 32
        Top = 8
        Width = 233
        Height = 17
        Hint = 'Access to preview pictures'
        Caption = 'Show Pictures'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 4
      end
      object ShowInGameSnapshots: TCheckBox
        Left = 32
        Top = 56
        Width = 233
        Height = 17
        Hint = 'Access to in game snapshots'
        Caption = 'Show In Game Snapshots'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 5
      end
      object ShowMarquees: TCheckBox
        Left = 32
        Top = 80
        Width = 233
        Height = 17
        Hint = 'Access to marquees'
        Caption = 'Show Marquees'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 6
      end
      object ShowFlyers: TCheckBox
        Left = 32
        Top = 104
        Width = 233
        Height = 17
        Hint = 'Access to flyers'
        Caption = 'Show Flyers'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 7
      end
      object ShowCabinets: TCheckBox
        Left = 32
        Top = 128
        Width = 233
        Height = 17
        Hint = 'Access to cabinets'
        Caption = 'Show Cabinets'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 8
      end
      object ShowControlPanels: TCheckBox
        Left = 32
        Top = 152
        Width = 233
        Height = 17
        Hint = 'Access to control panels'
        Caption = 'Show Control Panels'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 9
      end
      object ShowControlPanelLayouts: TCheckBox
        Left = 32
        Top = 176
        Width = 233
        Height = 17
        Hint = 'Access to control panel layouts'
        Caption = 'Show Control Panel Layouts'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 10
      end
      object CreatePicturesList: TCheckBox
        Left = 32
        Top = 272
        Width = 233
        Height = 17
        Hint = 'Access to create "pictures.dat" file for the virtual list'
        Caption = 'Create Pictures List'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 11
      end
    end
  end
  object ButtonSave: TButton
    Left = 280
    Top = 392
    Width = 75
    Height = 23
    Hint = 'Save changes on current profile'
    Caption = '&Save'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object ButtonClose: TButton
    Left = 544
    Top = 392
    Width = 75
    Height = 23
    Hint = 'Close this window'
    Caption = '&Close'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonCloseClick
  end
  object ButtonOk: TButton
    Left = 368
    Top = 392
    Width = 75
    Height = 23
    Hint = 'Close and update settings'
    Caption = '&Ok'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ButtonOkClick
  end
  object ButtonReadUserProfileDAT: TButton
    Left = 8
    Top = 392
    Width = 169
    Height = 23
    Hint = 'Read all data from file "profilename.dat"'
    Caption = '&Read "UserProfile.dat"'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ButtonReadUserProfileDATClick
  end
  object UserProfileImageList: TImageList
    Left = 472
    Top = 392
  end
end
