object FormPreferences: TFormPreferences
  Left = 208
  Top = 198
  ActiveControl = ButtonClose
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Preferences'
  ClientHeight = 423
  ClientWidth = 626
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    000001000800000000004001000000000000000000000001000000000000FFFF
    FF00EFF8FF00E0FFFF00DFFFFF00D0FFFF00D0CFD000FFFF9F00C0A89F00A0D0
    DF00A0C7CF009FFFFF009FCFDF009FCFD0009FB8BF0080B0B00080A7A0008F88
    8F00FFCF3000FF983000D0A72F00FF683000C0502F00FF000000BF6F2F00BF48
    2F009F3700007FA0A0006F989F006F676F00605F60004F6060005F4F5000504F
    500060372F004F302F0030686F003F484F00303F40003F2720002F272F00201F
    20001F171F000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000FFFFFF002A2A
    2A2A2A2A2A2A2A2A2A2A2A2A2A2A1005050505050505050505050505052A100A
    000A000A000A000A000A000A052A1000001919001919191919191900052A1000
    0000000A000A000A000A000A052A10000A1616001616161616161600052A1000
    0000000A000A000A000A000A052A100000161600161616161F161600052A1000
    0A001C1E000A00250B24000A052A100000141B032214260C2309211D20281000
    0A00000E030F08230C231B2714181000001414000701290C230C0C1B12171000
    0A00000A000E022A04040C0C111310000014140014140F000004040406061000
    000000000000000D1B1B1B1B14151010101010101010101010101010052A0000
    FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
    FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlPreferences: TPageControl
    Left = 8
    Top = 11
    Width = 609
    Height = 406
    ActivePage = TabSheetGeneral
    HotTrack = True
    Images = PreferencesImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    object TabSheetGeneral: TTabSheet
      Caption = 'General'
      object PageControlGeneralOptions: TPageControl
        Left = 0
        Top = 0
        Width = 601
        Height = 377
        ActivePage = TabSheetMAMEFolders
        Align = alClient
        HotTrack = True
        Images = PreferencesImageList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object TabSheetMAMEFolders: TTabSheet
          Caption = 'Folders'
          ImageIndex = 9
          object LabelFolderTitleSnapshots: TGroupBox
            Left = 8
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Title Snapshots'
            TabOrder = 0
            object FolderTitleSnapshots: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderTitleSnapshotsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderTitleSnapshotsButtonSelectClick
            end
          end
          object LabelFolderMarquees: TGroupBox
            Left = 8
            Top = 72
            Width = 281
            Height = 57
            Caption = 'Marquees'
            TabOrder = 1
            object FolderMarquees: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderMarqueesButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderMarqueesButtonSelectClick
            end
          end
          object LabelFolderFlyers: TGroupBox
            Left = 8
            Top = 136
            Width = 281
            Height = 57
            Caption = 'Flyers'
            TabOrder = 2
            object FolderFlyers: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderFlyersButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderFlyersButtonSelectClick
            end
          end
          object LabelFolderCabinets: TGroupBox
            Left = 8
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Cabinets'
            TabOrder = 3
            object FolderCabinets: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderCabinetsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderCabinetsButtonSelectClick
            end
          end
          object LabelFolderGamesFAQ: TGroupBox
            Left = 304
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Games F.A.Q.'
            TabOrder = 4
            object FolderGamesFAQ: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderGamesFAQButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderGamesFAQButtonSelectClick
            end
          end
          object LabelFolderControlPanels: TGroupBox
            Left = 304
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Control Panels'
            TabOrder = 5
            object FolderControlPanels: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderControlPanelsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderControlPanelsButtonSelectClick
            end
          end
          object LabelFolderControlPanelLayouts: TGroupBox
            Left = 304
            Top = 72
            Width = 281
            Height = 57
            Caption = 'Control Panel Layouts'
            TabOrder = 6
            object FolderControlPanelLayouts: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderControlPanelLayoutsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderControlPanelLayoutsButtonSelectClick
            end
          end
          object LabelFolderIcons: TGroupBox
            Left = 304
            Top = 136
            Width = 281
            Height = 57
            Caption = 'Games Icons'
            TabOrder = 7
            object FolderIcons: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object FolderIconsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = FolderIconsButtonSelectClick
            end
          end
        end
        object TabSheetMiscellaneous: TTabSheet
          Caption = 'Miscellaneous'
          ImageIndex = 5
          object MinimizeFrontend: TCheckBox
            Left = 8
            Top = 8
            Width = 249
            Height = 17
            Hint = 
              'It minimizes the frontend before game starts and restores after ' +
              'quitting game'
            Caption = 'Minimize Frontend'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
          object LabelGameSize: TGroupBox
            Left = 8
            Top = 56
            Width = 281
            Height = 97
            Caption = 'Game Size'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object ShowGameSizeBits: TCheckBox
              Left = 8
              Top = 24
              Width = 233
              Height = 17
              Hint = 'Shows the game size in bits (see status bar)'
              Caption = 'Game Size in Bits (Default)'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
              OnClick = ShowGameSizeBitsClick
            end
            object ShowGameSizeBytes: TCheckBox
              Left = 8
              Top = 48
              Width = 233
              Height = 17
              Hint = 'Shows the game size in bytes (see status bar)'
              Caption = 'Game Size in Bytes'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = ShowGameSizeBytesClick
            end
            object ShowGameSizeCompressedZip: TCheckBox
              Left = 8
              Top = 72
              Width = 233
              Height = 17
              Hint = 'Shows the game'#39's ZIP file size in bytes (see status bar)'
              Caption = 'Zipped Game Size in Bytes'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = ShowGameSizeCompressedZipClick
            end
          end
          object LabelSplashLogo: TGroupBox
            Left = 304
            Top = 56
            Width = 281
            Height = 57
            Caption = 'Splash Logo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object SplashLogoButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a logo file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = SplashLogoButtonSelectClick
            end
            object SplashLogo: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Select a logo to use on splash screen'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnChange = SplashLogoChange
            end
          end
          object ShowGameSize: TCheckBox
            Left = 8
            Top = 32
            Width = 249
            Height = 17
            Hint = 
              'Enable / disable the game size in status bar (speed up the scrol' +
              'ling)'
            Caption = 'Show Game Size'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 3
            OnClick = ShowGameSizeClick
          end
          object LabelAutomaticGameInformation: TGroupBox
            Left = 8
            Top = 160
            Width = 281
            Height = 129
            Caption = 'Automatic Game Information'
            TabOrder = 4
            object LabelAutomaticGameInformation1: TLabel
              Left = 8
              Top = 27
              Width = 6
              Height = 13
              Caption = '1'
            end
            object LabelAutomaticGameInformation2: TLabel
              Left = 8
              Top = 51
              Width = 6
              Height = 13
              Caption = '2'
            end
            object LabelAutomaticGameInformation3: TLabel
              Left = 8
              Top = 75
              Width = 6
              Height = 13
              Caption = '3'
            end
            object LabelAutomaticGameInformation4: TLabel
              Left = 8
              Top = 99
              Width = 6
              Height = 13
              Caption = '4'
            end
            object AutomaticGameInformation1: TComboBox
              Left = 24
              Top = 24
              Width = 249
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              TabOrder = 0
              Text = 'Games Information'
              Items.Strings = (
                '(None)'
                'Games Information'
                'Games History'
                'Games Driver Information'
                'Games F.A.Q.')
            end
            object AutomaticGameInformation2: TComboBox
              Left = 24
              Top = 48
              Width = 249
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 2
              TabOrder = 1
              Text = 'Games History'
              Items.Strings = (
                '(None)'
                'Games Information'
                'Games History'
                'Games Driver Information'
                'Games F.A.Q.')
            end
            object AutomaticGameInformation3: TComboBox
              Left = 24
              Top = 72
              Width = 249
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 3
              TabOrder = 2
              Text = 'Games Driver Information'
              Items.Strings = (
                '(None)'
                'Games Information'
                'Games History'
                'Games Driver Information'
                'Games F.A.Q.')
            end
            object AutomaticGameInformation4: TComboBox
              Left = 24
              Top = 96
              Width = 249
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 4
              TabOrder = 3
              Text = 'Games F.A.Q.'
              Items.Strings = (
                '(None)'
                'Games Information'
                'Games History'
                'Games Driver Information'
                'Games F.A.Q.')
            end
          end
        end
        object TabSheetGames: TTabSheet
          Caption = 'Games'
          ImageIndex = 6
          object NewDescriptionFormat: TCheckBox
            Left = 8
            Top = 8
            Width = 281
            Height = 17
            Hint = 'Show a different description for some games'
            Caption = 'New Description Format'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = NewDescriptionFormatClick
          end
          object FillAllCloneColumns: TCheckBox
            Left = 8
            Top = 32
            Width = 249
            Height = 17
            Hint = 
              'Add the parent name in all "clone of" columns (for the master ga' +
              'mes)'
            Caption = 'Fill All Clone Columns'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = FillAllCloneColumnsClick
          end
          object ShowPreliminaryGamesDisabled: TCheckBox
            Left = 8
            Top = 56
            Width = 249
            Height = 17
            Hint = 
              'Makes all games with a preliminary driver, in gray color and str' +
              'iked out'
            Caption = 'Show Preliminary Games Disabled'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 2
            OnClick = ShowPreliminaryGamesDisabledClick
          end
          object LabelDefaultGameIconsFolder: TGroupBox
            Left = 8
            Top = 152
            Width = 281
            Height = 57
            Caption = 'Default Game Icons Folder'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object DefaultGameIconsFolder: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Select a folder where the default icons are'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = DefaultGameIconsFolderChange
            end
            object DefaultGameIconsFolderButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = DefaultGameIconsFolderButtonSelectClick
            end
          end
          object UseCustomOptionsDefault: TCheckBox
            Left = 8
            Top = 80
            Width = 249
            Height = 17
            Hint = 
              'Run game with custom command line, custom options or default opt' +
              'ions with a single click'
            Caption = 'Use Custom Options by Default'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object UseCustomGameDescription: TCheckBox
            Left = 8
            Top = 104
            Width = 249
            Height = 17
            Hint = 'Use custom game descriptions when creating a new games list'
            Caption = 'Use Custom Game Description'
            TabOrder = 5
          end
          object UseCustomGameCategory: TCheckBox
            Left = 8
            Top = 128
            Width = 249
            Height = 17
            Hint = 'Use custom game categories when creating a new games list'
            Caption = 'Use Custom Game Category'
            TabOrder = 6
          end
          object GamesFilterBox: TGroupBox
            Left = 304
            Top = 0
            Width = 281
            Height = 105
            Caption = 'Filter'
            TabOrder = 7
            object HidePreliminaryGames: TCheckBox
              Left = 8
              Top = 24
              Width = 233
              Height = 17
              Hint = 'Do not load games with preliminary drivers on the games list'
              Caption = 'Hide Preliminary Games'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object HideBios: TCheckBox
              Left = 8
              Top = 48
              Width = 233
              Height = 17
              Hint = 'Do not load bios on the games list'
              Caption = 'Hide Bios'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object ButtonUpdateGamesList: TButton
              Left = 194
              Top = 72
              Width = 75
              Height = 23
              Hint = 'Update the games list'
              Caption = 'Update'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = ButtonUpdateGamesListClick
            end
          end
          object InternetPage: TLabeledEdit
            Left = 8
            Top = 232
            Width = 281
            Height = 21
            Hint = 
              'Link for the page of the selected game (the mask "%s" is not req' +
              'uired)'
            EditLabel.Width = 67
            EditLabel.Height = 13
            EditLabel.Caption = 'Internet Page'
            TabOrder = 8
            Text = 'http://www.mame.dk/gameinfo/%s/'
          end
        end
        object TabSheetPictures: TTabSheet
          Caption = 'Pictures'
          ImageIndex = 7
          object NewPictureNameFormat: TCheckBox
            Left = 8
            Top = 32
            Width = 249
            Height = 17
            Hint = 
              'Use pictures names with format gamename0000.ext instead of game0' +
              '000.ext'
            Caption = 'New Picture Name Format'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object ShowParentPictures: TCheckBox
            Left = 8
            Top = 8
            Width = 249
            Height = 17
            Hint = 'Show the master picture when the clone picture doesn'#39't exist'
            Caption = 'Show Parent Pictures'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
            OnClick = ShowParentPicturesClick
          end
          object CyclePictureTypes: TCheckBox
            Left = 8
            Top = 56
            Width = 249
            Height = 17
            Hint = 'Cycle thru all picture types automatically when viewing pictures'
            Caption = 'Cycle Picture Types'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = CyclePictureTypesClick
          end
          object LabelPicturesVisualEffects: TGroupBox
            Left = 8
            Top = 80
            Width = 281
            Height = 193
            Caption = 'Visual Effects'
            TabOrder = 3
            object LabelSmoothPictures: TLabel
              Left = 8
              Top = 72
              Width = 233
              Height = 13
              AutoSize = False
              Caption = 'Smooth Pictures'
              ShowAccelChar = False
              Transparent = True
            end
            object LabelSmoothPicturesValue: TLabel
              Left = 116
              Top = 91
              Width = 38
              Height = 13
              Caption = 'Lanczos'
              ShowAccelChar = False
              Transparent = True
            end
            object AspectRatio: TCheckBox
              Left = 8
              Top = 120
              Width = 233
              Height = 17
              Hint = 'Show the pictures in it'#39's correct aspect when resizing'
              Caption = 'Aspect Ratio'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
              OnClick = AspectRatioClick
            end
            object PicturesTransparency: TCheckBox
              Left = 8
              Top = 144
              Width = 233
              Height = 17
              Hint = 
                'Show snaps, marquees, flyers, cabinets and control panels with t' +
                'ransparent background'
              Caption = 'Use Pictures Transparency'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object PicturesVirtualList: TCheckBox
              Left = 8
              Top = 168
              Width = 233
              Height = 17
              Hint = 'Enable/disable the virtual list of the game'#39's total pictures'
              Caption = 'Use Virtual List'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = PicturesVirtualListClick
            end
            object StretchPicture: TCheckBox
              Tag = 1
              Left = 8
              Top = 24
              Width = 233
              Height = 17
              Hint = 'Stretch pictures to pit in the preview area'
              Caption = 'Stretch'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
              OnClick = StretchPictureClick
            end
            object StretchLargerPictures: TCheckBox
              Left = 8
              Top = 48
              Width = 233
              Height = 17
              Hint = 
                'It will stretch down all images that can'#39't fit on preview area (' +
                'Stretch must be ON)'
              Caption = 'Stretch Larger Pictures Only'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = StretchLargerPicturesClick
            end
            object SmoothPictures: TGaugeBar
              Tag = 14
              Left = 8
              Top = 88
              Width = 105
              Height = 20
              Hint = 'This gives a nice touch for preview pictures'
              Color = clWindow
              Backgnd = bgPattern
              ButtonSize = 12
              Max = 2
              ShowHandleGrip = True
              Position = 2
              OnChange = SmoothPicturesChange
            end
          end
          object HideNavigationPanel: TCheckBox
            Left = 304
            Top = 8
            Width = 249
            Height = 17
            Hint = 'Hide the bottom pictures navigation panel'
            Caption = 'Hide Navigation Panel'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = HideNavigationPanelClick
          end
          object HidePictureHint: TCheckBox
            Left = 304
            Top = 32
            Width = 249
            Height = 17
            Hint = 'Hide the hint of the picture'
            Caption = 'Hide Picture Hint'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = HidePictureHintClick
          end
        end
        object TabSheetSoundClips: TTabSheet
          Caption = 'Sound Clips'
          ImageIndex = 10
          object LabelSoundClipVolumeValue: TLabel
            Left = 484
            Top = 107
            Width = 18
            Height = 13
            Caption = '255'
            ShowAccelChar = False
            Transparent = True
          end
          object LabelSoundClipVolume: TLabel
            Left = 304
            Top = 88
            Width = 169
            Height = 13
            AutoSize = False
            Caption = 'Volume'
            ShowAccelChar = False
            Transparent = True
          end
          object PlaySoundClip: TCheckBox
            Left = 8
            Top = 8
            Width = 249
            Height = 17
            Hint = 'Play a sound clip when selecting a game'
            Caption = 'Play Sound Clip'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = PlaySoundClipClick
          end
          object LabelSoundClipSettings: TGroupBox
            Left = 8
            Top = 96
            Width = 281
            Height = 217
            Caption = 'Settings'
            TabOrder = 1
            DesignSize = (
              281
              217)
            object LabelOutputType: TLabel
              Left = 8
              Top = 24
              Width = 61
              Height = 13
              Caption = 'Output Type'
              ShowAccelChar = False
            end
            object LabelOutputDevice: TLabel
              Left = 8
              Top = 72
              Width = 69
              Height = 13
              Caption = 'Output Device'
              ShowAccelChar = False
            end
            object LabelMixerType: TLabel
              Left = 8
              Top = 120
              Width = 53
              Height = 13
              Caption = 'Mixer Type'
              ShowAccelChar = False
            end
            object LabelOutputRate: TLabel
              Left = 8
              Top = 168
              Width = 60
              Height = 13
              Caption = 'Output Rate'
              ShowAccelChar = False
            end
            object OutputType: TComboBox
              Left = 8
              Top = 40
              Width = 265
              Height = 21
              Hint = 'Select the output type to be use'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'DirectSound'
              OnSelect = OutputTypeSelect
              Items.Strings = (
                'Window Multimedia WaveOut'
                'DirectSound'
                'A3D')
            end
            object OutputDevice: TComboBox
              Left = 8
              Top = 88
              Width = 265
              Height = 21
              Hint = 'Select the audio device to be used'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnSelect = OutputDeviceSelect
            end
            object MixerType: TComboBox
              Left = 8
              Top = 136
              Width = 265
              Height = 21
              Hint = 'Select the mixer to be used'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              ItemIndex = 4
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Text = 'Auto-Detect Interpolating Mixer (High Quality)'
              OnSelect = MixerTypeSelect
              Items.Strings = (
                'Auto-Detect (Low Quality)'
                'Non-MMX Blendmode Mixer'
                'MMX, Pentium Optimized Blendmode Mixer'
                'MMX, PPro/P2/P3 Optimized Mixer'
                'Auto-Detect Interpolating Mixer (High Quality)'
                'Interpolating FPU Mixer'
                'Interpolating Pentium Mixer'
                'Interpolating PPro/P2/P3 Mixer')
            end
            object OutputRate: TComboBox
              Left = 8
              Top = 184
              Width = 265
              Height = 21
              Hint = 'Select the samplerate to be used'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              ItemIndex = 3
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Text = '44100 Hz'
              OnSelect = OutputRateSelect
              Items.Strings = (
                '8000 Hz'
                '11025 Hz'
                '22050 Hz'
                '44100 Hz'
                '48000 Hz')
            end
          end
          object LoopSoundClip: TCheckBox
            Left = 304
            Top = 64
            Width = 225
            Height = 17
            Hint = 'Play a sound clip over and over again, in an endless loop'
            Caption = 'Loop'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object LabelSoundClipFolder: TGroupBox
            Left = 8
            Top = 32
            Width = 281
            Height = 57
            Caption = 'Folder'
            TabOrder = 3
            object SoundClipFolder: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              Hint = 'Select a folder where sound clip files are'
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object SoundClipFolderSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a folder'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = SoundClipFolderSelectClick
            end
          end
          object ParentSoundClip: TCheckBox
            Left = 304
            Top = 40
            Width = 225
            Height = 17
            Hint = 
              'Play the sound clip of the master game, if clip of the clone gam' +
              'e is not found'
            Caption = 'Use Parent Sound Clip'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 4
          end
          object SoundClipVolume: TGaugeBar
            Tag = 14
            Left = 304
            Top = 104
            Width = 177
            Height = 20
            Color = clWindow
            Backgnd = bgPattern
            ButtonSize = 12
            LargeChange = 10
            Max = 255
            ShowHandleGrip = True
            Position = 255
            OnChange = SoundClipVolumeChange
          end
        end
        object TabSheetZipFiles: TTabSheet
          Caption = 'Zip Files'
          ImageIndex = 11
          object LabelZipTitleSnapshots: TGroupBox
            Left = 8
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Title Snapshots'
            TabOrder = 0
            object ZipTitleSnapshots: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipTitleSnapshotsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = ZipTitleSnapshotsButtonSelectClick
            end
          end
          object LabelZipControlPanels: TGroupBox
            Left = 304
            Top = 72
            Width = 281
            Height = 57
            Caption = 'Control Panels'
            TabOrder = 1
            object ZipControlPanels: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipControlPanelsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipMarquees: TGroupBox
            Left = 8
            Top = 136
            Width = 281
            Height = 57
            Caption = 'Marquees'
            TabOrder = 2
            object ZipMarquees: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipMarqueesButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipControlPanelLayouts: TGroupBox
            Left = 304
            Top = 136
            Width = 281
            Height = 57
            Caption = 'Control Panel Layouts'
            TabOrder = 3
            object ZipControlPanelLayouts: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipControlPanelLayoutsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipFlyers: TGroupBox
            Left = 8
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Flyers'
            TabOrder = 4
            object ZipFlyers: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipFlyersButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipIcons: TGroupBox
            Left = 304
            Top = 200
            Width = 281
            Height = 57
            Caption = 'Games Icons'
            TabOrder = 5
            object ZipIcons: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipIconsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipCabinets: TGroupBox
            Left = 304
            Top = 8
            Width = 281
            Height = 57
            Caption = 'Cabinets'
            TabOrder = 6
            object ZipCabinets: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipCabinetsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object LabelZipInGameSnapshots: TGroupBox
            Left = 8
            Top = 72
            Width = 281
            Height = 57
            Caption = 'In Game Snapshots'
            TabOrder = 7
            object ZipInGameSnapshotsButtonSelect: TButton
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ZipInGameSnapshots: TEdit
              Left = 8
              Top = 24
              Width = 233
              Height = 21
              TabStop = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
      end
    end
    object TabSheetAppearance: TTabSheet
      Caption = 'Appearance'
      ImageIndex = 1
      object LabelCustomColorsGamesList: TGroupBox
        Left = 8
        Top = 120
        Width = 185
        Height = 105
        Caption = 'Games'
        TabOrder = 0
        object LabelListBackground: TLabel
          Left = 8
          Top = 24
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Background Color'
          ShowAccelChar = False
          Transparent = True
        end
        object ListBackgroundColor: TColorBox
          Left = 8
          Top = 40
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
          OnSelect = ListBackgroundColorSelect
        end
        object ButtonGamesListFont: TButton
          Left = 8
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Select font for the games list'
          Caption = 'Font'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ButtonGamesListFontClick
        end
        object ButtonGamesListDefaultFont: TButton
          Left = 104
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Set default value(s)'
          Caption = 'Default'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ButtonGamesListDefaultFontClick
        end
      end
      object LabelPicturesColors: TGroupBox
        Left = 208
        Top = 8
        Width = 185
        Height = 329
        Caption = 'Pictures'
        TabOrder = 1
        object LabelTitleSnapshotPicturesBackgroundColor: TLabel
          Left = 8
          Top = 24
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Title Snapshots'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelInGameSnapshotPicturesBackgroundColor: TLabel
          Left = 8
          Top = 67
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'In Game Snaphots'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelMarqueePicturesBackgroundColor: TLabel
          Left = 8
          Top = 110
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Marquees'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelFlyerPicturesBackgroundColor: TLabel
          Left = 8
          Top = 153
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Flyers'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelCabinetPicturesBackgroundColor: TLabel
          Left = 8
          Top = 196
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Cabinets'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelControlPanelPicturesBackgroundColor: TLabel
          Left = 8
          Top = 239
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Control Panels'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelControlPanelLayoutPicturesBackgroundColor: TLabel
          Left = 8
          Top = 282
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Control Panel Layouts'
          ShowAccelChar = False
          Transparent = True
        end
        object TitleSnapshotPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 40
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
          OnSelect = TitleSnapshotPicturesBackgroundColorSelect
        end
        object InGameSnapshotPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 83
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 1
          OnSelect = InGameSnapshotPicturesBackgroundColorSelect
        end
        object MarqueePicturesBackgroundColor: TColorBox
          Left = 8
          Top = 126
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 2
          OnSelect = MarqueePicturesBackgroundColorSelect
        end
        object FlyerPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 169
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 3
          OnSelect = FlyerPicturesBackgroundColorSelect
        end
        object CabinetPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 212
          Width = 169
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 4
          OnSelect = CabinetPicturesBackgroundColorSelect
        end
        object ControlPanelPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 255
          Width = 169
          Height = 22
          DefaultColorColor = clWhite
          Selected = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 5
          OnSelect = ControlPanelPicturesBackgroundColorSelect
        end
        object ControlPanelLayoutPicturesBackgroundColor: TColorBox
          Left = 8
          Top = 298
          Width = 169
          Height = 22
          DefaultColorColor = clWhite
          Selected = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 6
          OnSelect = ControlPanelLayoutPicturesBackgroundColorSelect
        end
      end
      object LabelCustomColorsGeneral: TGroupBox
        Left = 8
        Top = 8
        Width = 185
        Height = 105
        Caption = 'General'
        TabOrder = 2
        object LabelGeneralBackgroundColor: TLabel
          Left = 8
          Top = 24
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Background Color'
          ShowAccelChar = False
          Transparent = True
        end
        object ButtonGeneralFont: TButton
          Left = 8
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Select general font for the frontend'
          Caption = 'Font'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = ButtonGeneralFontClick
        end
        object ButtonGeneralDefaultFont: TButton
          Left = 104
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Set default value(s)'
          Caption = 'Default'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ButtonGeneralDefaultFontClick
        end
        object GeneralBackgroundColor: TColorBox
          Left = 8
          Top = 40
          Width = 169
          Height = 22
          DefaultColorColor = clBtnFace
          NoneColorColor = clBtnFace
          Selected = clBtnFace
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 2
          OnSelect = GeneralBackgroundColorSelect
        end
      end
      object LabelAutomaticGameInfo: TGroupBox
        Left = 8
        Top = 232
        Width = 185
        Height = 105
        Caption = 'Automatic Game Information'
        TabOrder = 3
        object LabelAutomaticGameInformationFont: TLabel
          Left = 8
          Top = 24
          Width = 153
          Height = 13
          AutoSize = False
          Caption = 'Background Color'
          ShowAccelChar = False
          Transparent = True
        end
        object AutomaticGameInformationBackgroundColor: TColorBox
          Left = 8
          Top = 40
          Width = 169
          Height = 22
          DefaultColorColor = clWindow
          NoneColorColor = clWindow
          Selected = clWindow
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
          OnSelect = AutomaticGameInformationBackgroundColorSelect
        end
        object ButtonAutomaticGameInfoFont: TButton
          Left = 8
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Select font for the automatic game information window'
          Caption = 'Font'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ButtonAutomaticGameInfoFontClick
        end
        object ButtonAutomaticGameInfoDefaultColorFont: TButton
          Left = 104
          Top = 72
          Width = 75
          Height = 23
          Hint = 'Set default value(s)'
          Caption = 'Default'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ButtonAutomaticGameInfoDefaultColorFontClick
        end
      end
    end
    object TabSheetMAME: TTabSheet
      Caption = 'M.A.M.E.'
      ImageIndex = 8
      object LabelCustomAspectRatioMAME: TGroupBox
        Left = 8
        Top = 8
        Width = 281
        Height = 145
        Caption = 'Custom Aspect Ratio'
        TabOrder = 0
        object LabelHorizontalAspectRatio: TLabel
          Left = 8
          Top = 48
          Width = 233
          Height = 13
          AutoSize = False
          Caption = 'Horizontal Aspect Ratio'
          ShowAccelChar = False
        end
        object LabelHorizontalAspectRatioValue: TLabel
          Left = 116
          Top = 67
          Width = 16
          Height = 13
          Caption = '4:3'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelVerticalAspectRatio: TLabel
          Left = 8
          Top = 96
          Width = 233
          Height = 13
          AutoSize = False
          Caption = 'Vertical Aspect Ratio'
          ShowAccelChar = False
        end
        object LabelVerticalAspectRatioValue: TLabel
          Left = 116
          Top = 115
          Width = 16
          Height = 13
          Caption = '4:3'
          ShowAccelChar = False
          Transparent = True
        end
        object HorizontalAspectRatio: TGaugeBar
          Tag = 14
          Left = 8
          Top = 64
          Width = 105
          Height = 20
          Hint = 'Specify a custom aspect ratio for horizontal games'
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 12
          Max = 32
          ShowHandleGrip = True
          Position = 14
          OnChange = HorizontalAspectRatioChange
          OnMouseUp = HorizontalAspectRatioMouseUp
        end
        object VerticalAspectRatio: TGaugeBar
          Tag = 14
          Left = 8
          Top = 112
          Width = 105
          Height = 20
          Hint = 'Specify a custom aspect ratio for vertical games'
          Color = clWindow
          Backgnd = bgPattern
          ButtonSize = 12
          Max = 32
          ShowHandleGrip = True
          Position = 14
          OnChange = VerticalAspectRatioChange
          OnMouseUp = VerticalAspectRatioMouseUp
        end
        object UseCustomAspectRatio: TCheckBox
          Left = 8
          Top = 24
          Width = 233
          Height = 17
          Hint = 
            'Activate / deactivate custom aspect ratio for horizontal and ver' +
            'tical games'
          Caption = 'Use Custom Aspect Ratio'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
      object LabelExtraParametersMAME: TGroupBox
        Left = 304
        Top = 8
        Width = 281
        Height = 145
        Caption = 'Extra Command Line Parameters'
        TabOrder = 1
        object LabelMAMEExecutables: TLabel
          Left = 8
          Top = 48
          Width = 233
          Height = 13
          AutoSize = False
          Caption = 'MAME Executables'
          ShowAccelChar = False
          Transparent = True
        end
        object LabelDOSMAMEExecutables: TLabel
          Left = 8
          Top = 96
          Width = 233
          Height = 13
          AutoSize = False
          Caption = 'DOS MAME Executables'
          ShowAccelChar = False
          Transparent = True
        end
        object UseExtraParametersMAME: TCheckBox
          Left = 8
          Top = 24
          Width = 233
          Height = 17
          Hint = 
            'Activate / deactivate extra command line parameters to use with ' +
            'MAME'
          Caption = 'Use Extra Parameters'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object ExtraParametersMAME: TEdit
          Left = 8
          Top = 64
          Width = 265
          Height = 21
          Hint = 'Specify an extra command line parameter for MAME executables'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object ExtraParametersDOSMAME: TEdit
          Left = 8
          Top = 112
          Width = 265
          Height = 21
          Hint = 'Specify an extra command line parameter for DOS MAME executables'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
    end
    object TabSheetHotRod: TTabSheet
      Caption = 'Hot Rod'
      ImageIndex = 2
      object VisitHotRodImage: TImage
        Left = 224
        Top = 5
        Width = 113
        Height = 21
        Cursor = crHandPoint
        Hint = 'Click here to visit Hot Rod homepage'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0B54504E4747726170686963BA0D0000424DBA0D000000000000360400002800
          0000710000001500000001000800000000008409000000000000000000000001
          00000000000000000000FFFFFF001E061D004E104B007719720062155E005412
          51007E267A00832D7F00893785008938850090418C00964C9200A2609F00A262
          9F00A86AA500A669A300AC71A900AA70A700AF74AC00AE76AB00C193BF00BE91
          BC00C79DC500C69EC400C69FC400D5B6D400270825006716620050114C00380C
          35002A092800450F42007D2277007D23780080277B0081297C00822B7D008834
          82008D3E8800944B900098509400995395009C5698009E599900B57FB2009347
          8D00995092009E599800A667A100A96CA300A4639D00AF75A800BB8AB600C398
          BE00B57EAE00BA88B300C89EC200CBA6C600C091B800D0ADCA00D0ACC800DCC1
          D600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001D1B020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202000000241C06060606
          0606060606060606060606060606060606060606060606060606060606060606
          0606060606060606060606060606060606060606060606060606060606060606
          0606060606060606060606060606060606060606060606060606060606060606
          060606060606060606201F001110290A0404253D3D3D3D3D0C040404042B3D3D
          3D3D3D04040404040422173D3D3D3D3D3D3D1722040404040404173D3D3D3D3D
          3D25040B3D3D3D3D3D0F04040404223D3D3D3D3D170404040425173D3D3D3D3D
          3D3D1725040404040404373D3D3D3D3D27173D3D3D3D34040404040404051E00
          0000290A0404043D3D3D3D3D3804040404253D3D3D3D3D0B040404042E3D3D3D
          3D3D3D3D3D3D3D3D2E04040404373D3D3D3D3D3D3D3304213D3D3D3D3D150404
          0404303D3D3D3D3D33040404273D3D3D3D3D3D3D3D3D3D3D2E04040404303D3D
          3D3D3D3D3D3B3D3D3D3D17040404040404051E000000290A0404043D3D3D3D3D
          1726040404043D3D3D3D3D37040404213D3D3D3D3D3D3D3D3D3D3D3D3D250404
          043D3D3D3D3D3D3D3D1504043D3D3D3D3D3D04040404153D3D3D3D3D21040421
          3D3D3D3D3D3D3D3D3D3D3D3D3D2504042B3D3D3D3D3D3D3D3D3D3D3D3D3D3D04
          0404040404051E002316290A040404153D3D3D3D3D0D040404043D3D3D3D3D17
          040404383D3D3D3D3D04040B3D3D3D3D3D3D0404043D3D3D3D3D3D2604040404
          3D3D3D3D3D3D040404043D3D3D3D3D3D0404042D3D3D3D3D17090404173D3D3D
          3D3D0404173D3D3D3D3D0B04043D3D3D3D3D3D040404040404051E000000290A
          040404323D3D3D3D3D3B040404043B3D3D3D3D3D0404043D3D3D3D3D34040404
          253D3D3D3D3D270404383D3D3D3D3D2104040404383D3D3D3D3D250404043D3D
          3D3D3D3B0404043D3D3D3D3D34040404223D3D3D3D3D0B043D3D3D3D3D3D2104
          04333D3D3D3D3D260404040404051E000000290A0404040C3D3D3D3D3D170404
          0404373D3D3D3D3D0404043D3D3D3D3D32040404043D3D3D3D3D3204040F3D3D
          3D3D3D25040404040F3D3D3D3D3D270404083D3D3D3D3D320404043D3D3D3D3D
          34040404043D3D3D3D3D34043D3D3D3D3D3D210404273D3D3D3D3D2804040404
          04051E000000290A040404043D3D3D3D3D3D040404042E3D3D3D3D3D2204043D
          3D3D3D3D3704040404173D3D3D3D170404263D3D3D3D3D2B04040404263D3D3D
          3D3D340404343D3D3D3D3D250404043D3D3D3D3D3704040404173D3D3D3D3D04
          173D3D3D3D3D220404043D3D3D3D3D2D0404040404051E000000290A04040404
          3D3D3D3D3D3D38383838383D3D3D3D3D2F04043D3D3D3D3D3D040404043B3D3D
          3D3D3D0404043D3D3D3D3D3B04040404043D3D3D3D3D3D3D3D3D3D3D3D3D3D04
          0404043D3D3D3D3D1725040404383D3D3D3D3D04343D3D3D3D3D280404043D3D
          3D3D3D3D0404040404051E000000290A040404043D3D3D3D3D3D3D3D3D3D3D3D
          3D3D3D3D380404323D3D3D3D3D040404043B3D3D3D3D170404043D3D3D3D3D3D
          04040404043D3D3D3D3D3D3D3D3D3D3D3D3D3D3D380404333D3D3D3D3D2D0404
          04383D3D3D3D3D0408173D3D3D3D170404043D3D3D3D3D3D0404040404051E00
          0400290A04040404383D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D0804043D3D3D3D
          3D370404043D3D3D3D3D34040404153D3D3D3D3D0404040404173D3D3D3D3D3D
          3D3D3D3D3D3D3D3D3D1704043D3D3D3D3D3D2104043D3D3D3D3D130404283D3D
          3D3D3D0804043D3D3D3D3D3D0404040404051E000000290A040404042B3D3D3D
          3D3D3D3D3D3D3D3D3D3D3D3D3D330404283D3D3D3D3D173B3D3D3D3D3D3D0404
          303D3D3D3D3D3D3D3D3D3D0404343D3D3D3D3D2B09092E383D3D3D3D3D3D3204
          2E3D3D3D3D3D3D38173D3D3D3D3D210404043D3D3D3D3D3D38173D3D3D3D3D3D
          2704040404051E000000290A04040404253D3D3D3D3D3D30303030343D3D3D3D
          3D15040404303D3D3D3D3D3D3D3D3D3D3D2E0404083D3D3D3D3D3D3D3D3D3D04
          04093D3D3D3D3D3204040404283D3D3D3D3D3D04042B3D3D3D3D3D3D3D3D3D3D
          3D0C04040404223D3D3D3D3D3D3D3D3D3D3D3D3D3404040404051E000000290A
          04040404043D3D3D3D3D3D04040404253D3D3D3D3D3D04040404273D3D3D3D3D
          3D3D3D3D26040404043D3D3D3D3D3D3D3D3D3D2504043D3D3D3D3D3B04040404
          043D3D3D3D3D3D040404273D3D3D3D3D3D3D3D3D09040404040404253D3D3D3D
          3D3D253D3D3D3D3D1704040404051E000000290A04040404043D3D3D3D3D3D08
          040404043D3D3D3D3D3D0404040404040832383B383208040404040404040426
          3D3D3D3D1704040404043D3D3D3D3D3D040404042E3D3D3D3D3D3D0404040404
          080C373B383208040404040404040404042E2D3B3204043D3D3D3D3D3D040404
          04051E000000290A04040404043D3D3D3D3D3D2E040404043D3D3D3D3D3D2104
          04040404040421212104040404040404040404223D3D3D3D3D04040404043D3D
          3D3D3D3D04040404153D3D3D3D3D3D0404040404040404212104040404040404
          04040404040404210404043D3D3D3D3D3D04040404051E00D200290A04040404
          04373D3D3D3D3D37040404043D3D3D3D3D3D2704040404040404040404040404
          04040404040404043D3D3D3D3D04040404043B3D3D3D3D3D3D3D3D3D3D3D3D3D
          3D3D370404040404040404040404040404040404040404040404040404040434
          3D3D3D3D3D22040404051EDE0000290A04040404040B3D3D3D3D3D3D04040404
          373D3D3D3D3D34040404040404040404040404040404040404040404153D3D3D
          3D04040404040D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D04040404040404040404
          04040404040404040404040404040404040404273D3D3D3D3D0C040404051E00
          210012102A2A2A2A2A2C3E3E3E3E3E3E2A2A2A2A113E3E3E3E3E1A2A2A2A2A2A
          2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A3135393C1A112A2A2A2A0E1A3E3E3E3E
          3E3E3E3E3E3E3E3E362A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
          2A2A2A2A2A2A2A2C3C3E3E3E3E3A2A2A2A230300000019181616161616161616
          1616161616161616161616161616161616161616161616161616161616161616
          1616161616161616161616161616161616161616161616161616161616161616
          1616161616161616161616161616161616161616161616161616161616161616
          16161616161407000000}
        ShowHint = True
        OnClick = VisitHotRodImageClick
      end
      object HotRod: TCheckBox
        Left = 8
        Top = 8
        Width = 97
        Height = 17
        Hint = 'Enable Hot Rod joysticks to control frontend'#39's functions'
        Caption = 'Use Hot Rod'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = HotRodClick
      end
      object HotRodImage: TImage32
        Left = 8
        Top = 32
        Width = 580
        Height = 340
        BitmapAlign = baTopLeft
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 1
      end
      object HotRodSEImageFile: TEdit
        Left = 344
        Top = 5
        Width = 217
        Height = 21
        Hint = 'Hot Rod image filename'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object HotRodSEImageFileButtonSelect: TButton
        Left = 568
        Top = 5
        Width = 21
        Height = 21
        Hint = 'Click here to select a file'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = HotRodSEImageFileButtonSelectClick
      end
    end
    object TabSheetSlikStik: TTabSheet
      Caption = 'SlikStik'
      ImageIndex = 3
      object VisitSlikStikImage: TImage
        Left = 224
        Top = 5
        Width = 113
        Height = 21
        Cursor = crHandPoint
        Hint = 'Click here to visit SlikStik homepage'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0B54504E4747726170686963BA0D0000424DBA0D000000000000360400002800
          0000710000001500000001000800000000008409000000000000000000000001
          00000000000000000000FFFFFF009D650000753A0800A05519005F330F00713F
          1600C06B2600A65E220090521E00B3662700AC622600C3702D00C9753000BC6E
          2E00B76B2D00C6753200B0692F00CD7C3800AC682F00D17F3A008F572800BB72
          3500835025007C4C2300B46E3400B16D3300AE6A3200C3783900BE7537009B5F
          2D00C57A3A00AA693200A0632F00C87B3C00A46531007F4F2600D7864100CC7F
          3E00C0773A00B6713700AC6B3400A6673200925B2C008A562A00492D1600C97E
          3E00C77C3D00C47A3C00B06E3600AF6D3600995F2F00BB753A00B8733900AA6A
          3500BE773C00B3713900AC6C37009A613100C67E4200BF7A4000B0723D006342
          260095643B007B533100DE975C00C6885400D6955E0081593900D8A376005A2F
          0900844C1900693D1500784519009C5C2300C7793600CA7C3900764A22004229
          130086532700965D2C009D622F0072472200CF8240008E5A2C0051331900C17A
          3D009C6331004C3018009E643200291A0D00A1673500C8814400794F2A003A26
          140034221200996436009C693C00744E2D00E9A05E00BC804C00E19E6200E7A4
          6600694C3100E8B07D00E2AA7A00C6986F008853210092613200CB935B00EBB4
          800095735300ECE5DE00532C0300955A1900955E21009760260057391900A777
          4500B7906700A4825D00705B4400A89D91005C3300008F4F01008E5815003723
          0C008F5D2300996B3600B28C5D007C685000CDB08D00483F34008F827200D4C6
          B500683C030089500600372207007A562600BB9F7A00C1A78400D1BCA1009D90
          7F00B5AA9B00BDB5AB00A16000009A5C00006038000057330100462A0100935A
          09008B5609006A430900794F120062411300A5753300F0EEEB00925901007448
          01003C26040096600B006C4A1600B6905400857A6900D6CFC400E2DBD0009F64
          00009E6600009C6200007F50000040290000A16C10009A671200A6741D00AC7C
          2900B4893C00AE86410067512900BA934D00C9A96E00CDAF7C008D6417008265
          25007D601D002A27200071623200453F21007371670067643F0034372D004A50
          40005C6254003F424000212A2A0057707400495B5E00385157003E6474003B75
          8F0000A8FF002A83AE0022394400537F950000A4FF0000A2FF00207AAB002585
          BA00164A67002E79A1003689B9001A4055004783A5002E556A00009DFF00009E
          FF0000A0FF00009DFE00009AFC00029EFF00029DFF00039CFE00039CFA000775
          BB000A9BF700096BA90009659E0009629A000F98EF000D72B2000C689E000D5E
          90001591E0001688CD00115580001B6C9F001D6693002F90CB000097FF00009B
          FF000098FB000094F7000193F200018AE300029AFE000399FA000391ED000498
          F900059BFC000696F4000685D700077ECB00066CAF000865A1000C66A1000D68
          A3000E6298000293AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9FAA9F9F9F9F9F
          9F9F9F9F9F8989898989897E897E7E7E7E5F7E7E5E5E5E5E5E5E4E4E2D2D2D2D
          2D2D5858582D5555555555585555555858585858582D2D2D2D2D2D4E2D2D582D
          2D2D582D2D2D4E4E4E4E4E4E5E5F5E5E5E4E5555754E5F9090A36DABA9A9A9A9
          A9A9A9A99E9E9E9E9E9E9E9E9E9E9E87AA879E9E989898989898989898059848
          489A9A48A1069A759A484D4D5252522418242C4F184F4F4F154F502B2B2B5415
          33515151503350335015542B2B152B2C2B152B2B2C4F5454542B4F244F174F24
          5252525252175B232A4D5F019C7AB4AF02020202020202A8B59AA1A19AA1A1A1
          A198A18F8593AC9A9A9AA19A9A99997575B155A175627575A12C672D6775493A
          625D4067443E2B766762446240402C44403F3F3F2A2E2F1C34271D27341A2835
          3519381B38193528322A3232293823212A2A2A592C2C542C2C21262626505F83
          838BB4AF020202020202A8AEA4A48FA590908F8F908E8FA490878D9090A38690
          85A190867AA58E908EA59085718DA48FA47A05818EA39090708E4F86A48FA590
          909090A58F8B834534221F2737371D27351A282835193829381A3531292A3929
          20365133212323212C2C542C2C212E2F2E2B5FA97B7BB4AF02020202020292B3
          868C8BA58670A58D8DA48DA48D97A5019C7A86868E99709C8FA5A48686708686
          188D9C8FA48D47777A85708D708321A5867AA58670708670830F3B3030562737
          5637353435193528281A3832381B3831323639202A362150333333332C4F2C2C
          2C2326302F545FC6E5E1B4AF020202020202A8AD8D8CACADABADADAFB0ADABAD
          ABAC8383838B8B8C817D838B787F74747F807F807F8B86786C571E8D8D8C6A2A
          643D1A868D3D643C42423B425C1C2F1F2F301C30302716343519313132133213
          32133220201B312920392A232A2A2A232B542B542B1E393629245AC6C7D7B4AF
          0202020202020202A9879393937B7B93937B7B939E96A0A97B7B949494947171
          94717194717171714646464646482B5151510447030606060606064906064949
          474947091926260F094949490606060606484848484806064848242931311B08
          470606060548541E332B331E51525AA1BCBFB4AF020202020202A6B5C6E1E1E1
          E1E1E1E1E1E1E6CFB89497C6E5E1E2E2E1E1E1E1E1FCE1E1E1E1FCFCE2E6E6E6
          E6C149214A47C3EBE6FFFFE1FDFDFDFDFDFDFDFDFEFFE9C958365CC2EBFDFDFD
          FDFDFDFDFDFDFDFDFDFFE6FFE6E6BD15281A6BC3EBE6FFE6E6C948513A505751
          21525A9E927CB4AF020202020202A69DCECBCCCCCCCCCBCBCBCCCBCCF2C187C6
          C7D7CCCCCCD6D7D8DDD8D6CCCCD6CCCCCCCCCBCBC7E271093EEBF6CBCCCCCCCC
          CCD7D6D8D8D7D7DADACBCCD8E903A3D7CCD7DADAD6D7D7CCD7CCD6D7D6D8D6CC
          CCC7E9464A62EAEECCCCD7CCC7FA4D1E5150595121525A7BA09DB4AF02020202
          020202A8B7BCBCBCBCBCBCBCBCBCC8D8CBFCAAA1BCBFF5D5EFCFBEBFBFBCD0D5
          D6FAC9BFBFBFC3F5D6F2C1D4F9D6D8E3CABBBBBBBBBBA3A3A3A3A3A3A3CAD5D6
          F1BD79DFD5F3E9BFA3BB82D1D5D7DEC0BBBBBBC2F6D6F9B8D4F9D7CCE3CABBBB
          BFBB601E5150575121525A88A0A0B4AF02020202020202A7A6919191929D7C7C
          7C7CB1F8D6F5C19E927CD0D6D6E97196977CB1F8D6F5B803720988D0D6F3F9EE
          D7F1EA790B0E0F0E0E0E100C0A0A0E070708E8D5CCE903D1D6D7E603100C0782
          F4D6F25E4A0F0E08C8D6EEF9EED7F5EB790A0F114A4A511E5750592121525A9E
          97A0B4AF020202020202020202A7A69EBABDBDBDBDBDBDFAD8CCE67BA09DBCEF
          D5F2B89E7D7D88D0D6CCE6957F737279F0D5D5DBCCF2CF5E46172334371D1B67
          C0C0C0C0C084EBD6D6F23E6FE3D6F5BD091B1D13CED5D7E9061B380ABBD9EED8
          DCCCF9D2B805172A5B51591E591E595157525AD29597B4AF0202020202020202
          02A6B6E8F1F0EEEDEDEDEDEED6C7CD88A0A088D0D5CCCF717D7D47C4EFD6F2B8
          47747F47CED6D6E4DED7D6F2E6C17117281DCAF5F0EDEDEDEDEDEDF7DAF6613D
          CEDACCE6B8552029C5D9D7F95E21351A51E8DAD8E4FADAD6F2E9B846151B371D
          56203A333A525A000000B4AF02020202020202020291C2D7D5EEDECECECECECE
          C8C59A9E97A09DBCF6D6FA899996C2EFD8EED6CF46747409BFEED7FAB8E7CCD7
          CBF0FCC01861DFD6D5FACEECECECECECD3BB04D3D7DBEED9F1D404CAEFD9EED8
          D24934280AC2D6D7E4BDF8D6D7CBF5FFC018281F2E203A5151525A000057B4AF
          02020202020202020291B9F8D5D9C9879D9D9D9DB7C3CFD295979688CED6D9D2
          7B7D8AD0E7EED7FA5F6B4A736BE8D6D6D2C4D1D1D1D1ECD3A31AD1D5D7E6051D
          534C261CA3C5D4C0D0E7D5EEF9C50F6FD1E7D5D7DE4E2A352861E7D5D9C9C5D1
          D1D1D1ECD3BB371F261B3A2151525A617269B4AF020202020202020202A79DC8
          D6CCE08994949494BAF1CBF0C19EA0A9C4D9CCFB8999727CC5CBD6CCD47D7474
          09C5EECCDE4E4A1A131A11353B0DBBD5D8F1C94824181849D0CCD7CF03BBD6CC
          F93E281D0AD3D6D5D5C31335350BC6EECCE0050F1D161616373C3B1F261B5751
          21525A2C0010B4AF020202020202020202A791BCD6D6D5FADEDEDEDEDEF5D6CB
          E67BB6CEDEEED5D9C98772728AC6CECE824A7373C6E8EDD5EEC96B2716271D27
          2F4C35ECD8D8F5DEDEDEDEDEF9D8D7F95861D1ECECA310301C61CAECD1761D16
          38D3E8EED5F0BD0B534C26222F1F2E1F261A572121525A210006B4AF02020202
          020202020202A79DBFCEF8DCD8D8D8D8D9F6F6F4F9A197D0D6F0F0F4CD997273
          727D6B724A747472C2D9F6F6DDD04A37163716562E4C126FD1E3F7EEDADBDBD5
          DCF6F6DCC2101C3C562F2F3030161629161637340FCAD6F4EFF7C60A262E2E2F
          2F1C2E1C2E1B575151525A2C0008B4AF020202020202020202020202929DB7B9
          B9B9B9B9B9B9B9B9B9B5A099B9B9B9BC797D7272727372737474747454828282
          826F313735371D302E4C53144B3D78787878787878787878422525252514262E
          2F273B1C2F1656341D3D6F6F6F6F78535353535353265326251D313132245A97
          2200836DAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE9B9B9B9B
          9B9B9B9B9B9B76767676767676767676766464646464426D426D426D43434141
          65416363636363636363636363656565654141434343436D436D436D6D414141
          414141656565656566656665664165416530556765728DB3B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2A2A2A2A2A2A2A2A2A2A28181818181818181778177
          77777777776A6A6A6A6A6A454545454569456969696968686E686E68686E686E
          6E6868686869696969456945694569454569686969696968686868686E686E68
          6E69686969415B000600}
        ShowHint = True
        OnClick = VisitSlikStikImageClick
      end
      object SlikStik: TCheckBox
        Left = 8
        Top = 8
        Width = 97
        Height = 17
        Hint = 'Enable Slik Stik joysticks to control frontend'#39's functions'
        Caption = 'Use SlikStik'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = SlikStikClick
      end
      object SlikStikImage: TImage32
        Left = 8
        Top = 32
        Width = 580
        Height = 340
        BitmapAlign = baTopLeft
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 1
      end
      object SlikStikImageFile: TEdit
        Left = 344
        Top = 5
        Width = 217
        Height = 21
        Hint = 'Slik Stik image filename'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object SlikStikSwap2ndPlayerStick: TCheckBox
        Left = 112
        Top = 8
        Width = 97
        Height = 17
        Hint = 'Swap 2nd player stick Up / Down (for new controllers)'
        Caption = 'Swap Stick'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = SlikStikClick
      end
      object SlikStikImageFileButtonSelect: TButton
        Left = 568
        Top = 5
        Width = 21
        Height = 21
        Hint = 'Click here to select a file'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = SlikStikImageFileButtonSelectClick
      end
    end
    object TabSheetXArcade: TTabSheet
      Caption = 'X-Arcade'
      ImageIndex = 4
      object VisitXArcadeImage: TImage
        Left = 224
        Top = 5
        Width = 113
        Height = 21
        Cursor = crHandPoint
        Hint = 'Click here to visit X-Arcade homepage'
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          0B54504E4747726170686963BA0D0000424DBA0D000000000000360400002800
          0000710000001500000001000800000000008409000000000000000000000001
          00000000000000000000FFFFFF008585850040404000C6C5C300121008002B29
          21003D3C38001C1A10001F1D140027251B002B291F0032302600302E25003231
          2C003E3D3800B9B8B3009B998D0073726A0098978D0030302D00252523003636
          35008A8A8900010205000102070004071600080E2A00101B520005081700101A
          4900505B92006975B2006B75A400828AB1000D1852002B4BFF002B4CFC002949
          F1001F36B1002D4EFE00111D60002E4FFF002B4AEF002036AF002944D200080D
          29003352FF003150F5001D2E8F002D48DD00273FBF001A2A7F00131E5D000B11
          350016226700070B200006091B003B58FC00354FE000233493003955EC003B57
          F3003F5DFF00263796001D2A6E00384DC3004863F3004962ED004E65E4005065
          D8005F74E8006772B100566094008492DF005F6898005E6795006B73A100666C
          900044485D005B607A005E637D0044465100717484009496A1009A9CA7000407
          1A00080D2E000B123D0002030A006A73AC003F42560003040D0003040E001A1A
          1D00C4C4C600B5B5B600FEFEFE00FDFDFD00FBFBFB00F9F9F900F6F6F600F5F5
          F500F3F3F300F0F0F000EFEFEF00EDEDED00EBEBEB00E8E8E800E6E6E600E5E5
          E500E3E3E300E1E1E100DFDFDF00DCDCDC00DBDBDB00D8D8D800D6D6D600D4D4
          D400D3D3D300D1D1D100CFCFCF00CDCDCD00CBCBCB00C9C9C900C6C6C600C4C4
          C400C2C2C200C1C1C100BEBEBE00BCBCBC00BABABA00B8B8B800B7B7B700B5B5
          B500B3B3B300B1B1B100AEAEAE00ADADAD00AAAAAA00A9A9A900A7A7A700A5A5
          A500A3A3A300A1A1A1009E9E9E009C9C9C009B9B9B0098989800969696009494
          940092929200919191008E8E8E008B8B8B008A8A8A0089898900868686008484
          840083838300808080007F7F7F007D7D7D007A7A7A0079797900777777007474
          740073737300707070006F6F6F006D6D6D006B6B6B0069696900676767006464
          640063636300606060005F5F5F005D5D5D005B5B5B0059595900575757005454
          540053535300515151004F4F4F004D4D4D004B4B4B0048484800464646004444
          4400424242003F3F3F003D3D3D003B3B3B003838380036363600353535003434
          34003333330032323200313131002F2F2F002D2D2D002B2B2B00292929002727
          27002424240022222200202020001F1F1F001C1C1C001A1A1A00191919001717
          1700151515001212120011111100101010000F0F0F000D0D0D000B0B0B000808
          0800060606000404040002020200010101000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000E25E15CFCFCFCFDA0000000000000000000000000000DA
          CFCFCFCFCFD6000000000000000000000000E1DADADADBE2E2DBDADADBE0DDDC
          DBDADF0000000000000000DFDCD9DADCDE00000000E2DDDADADADADADADADE00
          00DFDCDADADCDE0000000000DEDCDADADBDE0000000000000000D8005D584051
          12A9A8A7A6CBE200000000000000000000E2CBA6A8A9AAAB9791BDDE00000000
          000000000000D78686868ADFDF8A868688CF8D868686BD000000000000E0BD9B
          8786868697BADF00DDAF8D86868686868686AAE0C59D8886868697BADF00E103
          9A8986868696B6DE000000000000C1D035302A3D221117989794BCE200000000
          0000000000BD91939498957B010161C500000000000000000000D36401016CDE
          DE6C010169CA73010101B2000000000000AD0101017379630101A9DE90010101
          6462010101629DB262010101010101019CE0B401010101610101019A00000000
          0000C1D05C1C33283E210CD9D5D3B9BEE0000000000000E1C0B8CCCDD0B67901
          0183BDDE00000000000000000000D36501016EDEDE6E01016ACB75010101B200
          00000000E07C01016103DB7701017BBA0101017EBD93010101A2D179010161AA
          B163010163D176010162A8B065010163000000000000C1D000001A342B3A4B09
          000000BBBBE000000000E2BEBB000000CE81016EAEDA00000000000000000000
          0000D36501016F00006F010169CC77010101B10000000000DF5F010162C50071
          0101779F0101019400AD010101BD0078010162D7DE65010169CC7A010164D400
          6E66666B000000000000C1D0000000E1362C3F5A0A000000BEBCE200000003BB
          E20000CB790192CF000000E0D1BEB3B7C9D800000000D36501016BC0C06B0101
          69CD78010101AF0000000000DF7F010161C200A79C9CA9A20101019300A90101
          01B7007A010162D4DC6501016ACD7A010164CFE2C9C5C5C9000000000000C1D0
          00000000005C293B480B000000BFBBE0E2BEBC000000CB7B77B5DF000000CE91
          6D6462636779ABDB0000D365010101646401010169CE79010101AF0000000000
          DF7F010161C000E0E0E0E0B201010191DFA7010101B8007A010162D4DC650101
          6ACD7A010162929A9E9F9FA1000000000000C1D000000000000000573C200E00
          000003BCBFBB000000C4819CD300000000C76C01010101010101018ED900D364
          010101010101010168CE7A010101AE0000000000E07F010161C10000000000D4
          6C01016E8D77010101B8007A010162D4DC6501016ACD7A010101010101010162
          000000000000C1D00000000000000000191E49C7000000C2BE000000C59AC1E1
          00000000CF66010101010101010101019A00D464010164888864010168CF7C01
          0101AF00BB9D02A4DC81010161C200CBC4C4C900C67562010101010101B8007A
          010162D4DC6501016ACD7B010162797C6401016C000000000000C1D000000000
          0000000000001D5B07000000000000C3BDDC0000000000009D0101616E707070
          7069010101D5D66501016DDBDB6D010168CF7B010101B5009761616AD8820101
          62C30078666674DE00D6B3980280010101B8007A010162D5DC65010169CD7B01
          0165D0DE7501016C000000000000C1D000000000000000000000000016C0E200
          0000C3C100000000000000E181010165AFBBBABABB93010101BDD56701016EE0
          E06E010167D17F01010197B785010170D97E010162C3007601016FDE00DEDEDE
          E0B2010101B80074010163D4DC66010168D07D010166DD007B01016A00000000
          0000C1D00000000000000000000000E216BD00000000C3BDE0000000000000E2
          940101627B8080808072010101D0D56501016EDEDE6E010165D6BA0101010162
          01010167DB96010162828D68010187E2D4888C8E8976010101B600960101618F
          9463010166D38B0101639CA96C010171000000000000C1D00000000000000000
          0000384F0FE20000000000C5AED2000000000000C90101010101010101010101
          89E1D56401016EDEDE6E010164D5E2AE776E6D6C6E6E6E72DFD37E6201010101
          017CCE00DB6B01010101010101B100D9977161010101010165D7CD7201010101
          01016CBE000000000000C1D0000000000000000056414C14000000BDBAE10000
          C892AFDB00000000E2B861010101010101010178D600D36501016EDEDE6E0101
          65D30000D2C3C5C4C4C4C4C8E000D7B90295959CBAD6000000CC9F9798989898
          98C90000E1CAB9ACA367010166D200CBAA8F81828DA6C200000000000000C1D0
          0000000000005923424D060000DFB6C8CEB9DF0000C88186C3E200000000BA80
          65626162626C98D20000D36401016EE2E26E010164D300000000000000000000
          0000000000DEDE000000000000000000000000000000000000000000DD6C0101
          67D1000000DDD6D6DC000000000000000000C1D000000000183627434E080000
          DEB2CC0000CFB6DE0000CD81659FD300000000DCC3AA9CA1B5CFE1000000D361
          01016CD9D96C010162D500000000000000000000000000000000000000000000
          00000000000000000000000000000000DB6A010167D100000000000000000000
          000000000000C1D00000002E31264450050000D9ACCE00000000D3B4DC0000CE
          83017DBADF00000000000000000000000000DF840101648C8C64010188E00000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000DB6A010167D100000000000000000000000000000000C1D0E139372D
          2445530DD1CFC9ACCE000000000000D3B6D5DDE1C887010191C7DF0000000000
          00000000000000D68662010101016381D3000000000000000000000000000000
          000000000000000000000000000000000000000000000000DA63010162D00000
          0000000000000000000000000000C1D01B322F2546541398959399CF00000000
          00000000D5A59CA0A59C80630161C000000000000000000000000000DCAC8F81
          8090B1DA00000000000000000000000000000000000000000000000000000000
          000000000000000000000000DB75747475D30000000000000000000000000000
          0000B0B4521F474A60106084838BB703030303030303030303BA8F828360887A
          6585B603030303030303030303030303030303BBBC0303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          BFB2B1B1B2BE0303030303030303030303DA0000000095960202555F047E7E7E
          81990202020202020202020202029A835F7E7E7E829D02020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202ADDB000000}
        ShowHint = True
        OnClick = VisitXArcadeImageClick
      end
      object XArcade: TCheckBox
        Left = 8
        Top = 8
        Width = 97
        Height = 17
        Hint = 'Enable X-Arcade joysticks to control frontend'#39's functions'
        Caption = 'Use X-Arcade'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = XArcadeClick
      end
      object XArcadeImage: TImage32
        Left = 8
        Top = 32
        Width = 580
        Height = 340
        BitmapAlign = baTopLeft
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 1
      end
      object XArcadeImageFile: TEdit
        Left = 344
        Top = 5
        Width = 217
        Height = 21
        Hint = 'X-Arcade image filename'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object XArcadeImageFileButtonSelect: TButton
        Left = 568
        Top = 5
        Width = 21
        Height = 21
        Hint = 'Click here to select a file'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = XArcadeImageFileButtonSelectClick
      end
    end
  end
  object ButtonClose: TButton
    Left = 536
    Top = 3
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
  object PreferencesImageList: TImageList
    Left = 504
    Top = 8
  end
end
