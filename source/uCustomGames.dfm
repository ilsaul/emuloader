object FormCustomGames: TFormCustomGames
  Left = 180
  Top = 147
  ActiveControl = ButtonClose
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 422
  ClientWidth = 625
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelStatusMode: TLabel
    Left = 8
    Top = 392
    Width = 35
    Height = 13
    Caption = 'Status:'
    ShowAccelChar = False
    Transparent = True
  end
  object BottomLine: TBevel
    Left = 5
    Top = 376
    Width = 615
    Height = 10
    Shape = bsTopLine
  end
  object TopImage: TImage
    Left = 0
    Top = 0
    Width = 625
    Height = 60
  end
  object LabelCaption: TLabel
    Left = 72
    Top = 24
    Width = 116
    Height = 13
    Caption = 'Custom Games Manager'
    ShowAccelChar = False
    Transparent = True
  end
  object PageControlCustomGames: TPageControl
    Left = 8
    Top = 72
    Width = 609
    Height = 289
    ActivePage = TabSheetGameInformation
    HotTrack = True
    Images = FormMain.ToolbarButtonsImageList
    TabIndex = 0
    TabOrder = 0
    object TabSheetGameInformation: TTabSheet
      Caption = 'Game Information'
      ImageIndex = 50
      object PageControlGameInformationFields: TPageControl
        Left = 8
        Top = 8
        Width = 585
        Height = 209
        ActivePage = TabSheetPage1
        Images = FormMain.ToolbarButtonsImageList
        TabIndex = 0
        TabOrder = 0
        object TabSheetPage1: TTabSheet
          Caption = '1'
          ImageIndex = 45
          object LabelCommandLineMessage: TGroupBox
            Left = 64
            Top = 16
            Width = 217
            Height = 57
            Caption = 'Custom Emulator Executable'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object CommandLine: TEdit
              Left = 8
              Top = 24
              Width = 169
              Height = 21
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object CommandLineButtonSelect: TButton
              Left = 184
              Top = 24
              Width = 21
              Height = 21
              Hint = 'Click here to select a file'
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = CommandLineButtonSelectClick
            end
          end
          object Page1Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 1
            Transparent = True
          end
          object LabelCommandLineParameters: TGroupBox
            Left = 288
            Top = 16
            Width = 281
            Height = 57
            Caption = 'Command Line Parameters'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object CommandLineParameters: TEdit
              Left = 8
              Top = 24
              Width = 185
              Height = 21
              Hint = 'Type the parameters, surrounded by quotes if it has long name'
              CharCase = ecLowerCase
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ButtonClearCommandLine: TButton
              Left = 200
              Top = 24
              Width = 75
              Height = 23
              Hint = 'Clear the command line and command line parameters'
              Caption = 'Cl&ear'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = ButtonClearCommandLineClick
            end
          end
          object LabelDescription: TGroupBox
            Left = 64
            Top = 80
            Width = 505
            Height = 57
            Caption = 'Description'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object Description: TEdit
              Left = 8
              Top = 24
              Width = 489
              Height = 21
              Hint = 'Type anything you want'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
        end
        object TabSheetPage2: TTabSheet
          Caption = '2'
          ImageIndex = 45
          object Page2Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 0
            Transparent = True
          end
          object LabelManufacturer: TGroupBox
            Left = 64
            Top = 16
            Width = 377
            Height = 89
            Caption = 'Manufacturer'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object Manufacturer: TComboBox
              Left = 8
              Top = 24
              Width = 361
              Height = 21
              Hint = 'Select a manufacturer'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              OnChange = ManufacturerChange
              Items.Strings = (
                '(Unknown)'
                'Custom'
                '[Dooyong] (NTC license)'
                '[Jaleco] (Williams license)'
                '[Konami] (Kawakusu license)'
                '[Konami] (Sega license)'
                '[Konami] (Stern license)'
                '[Kural] (Williams license)'
                '[Namco] (Atari license)'
                '[Namco] (Bally Midway license)'
                '[Namco] (Gremlin license)'
                '[Namco] (Midway license)'
                '[Namco] (Rock-ola license)'
                '[NMK] (Jaleco license)'
                '[Orca] Thunderbolt'
                '[Seibu Kaihatsu] (Taito license)'
                '[Seta] (Taito license)'
                '[SNK] (Rock-ola license)'
                '[SNK] (Taito America license)'
                '[Stern] (Tago license)'
                '[Sun Electronics] (Atari license)'
                '[Taito] World Games'
                '[Technos] (Taito America license)'
                '[Technos] Taito (Memetron license)'
                '[Technos] Universal USA'
                '[Toaplan] Data East Corporation'
                '[Toaplan] Hanafram'
                '[Toaplan] Ryouta Kikaku'
                '[Toaplan] Taito America Corporation'
                '[Toaplan] Taito America Corporation (Romstar license)'
                '[Toaplan] Taito Corporation'
                '[Toaplan] Taito Corporation Japan'
                '[UPL] (Taito license)'
                '[Zilec] Bally Midway'
                '[Zilec] Jaleco'
                '<unknown>'
                'Able Corp, Ltd.'
                'AC'
                'Academysoft-Elory'
                'ADK'
                'ADK / SNK'
                'Aicom'
                'Allumer'
                'Allumer + Tecmo'
                'Alpha Denshi Co.'
                'Alpha Denshi Co. (SNK of America license)'
                'Amenip'
                'Amenip (US Billiards Inc. license)'
                'Amenip/Centuri'
                'American Sammy Corp.'
                'Amstar'
                'Amstar (Centuri license)'
                'Apple'
                'Armenia'
                'Artic'
                'Associated Overseas MFR, Inc'
                'Atari'
                'Atari + Gencomp'
                'Atari Games'
                'Atari/Tengen (Nintendo of America license)'
                'Athena'
                'Athena / Seta'
                'Atlus'
                'Atlus (Nintendo of America license)'
                'Atlus/Cave'
                'ATW USA, Inc.'
                'Bally Midway'
                'Bally/Sente'
                'Banpresto'
                'Banpresto/Bandai'
                'Bear Corporation Korea'
                'bootleg'
                'bootleg?'
                'BROOKS'
                'Capcom'
                'Capcom (Data East USA license)'
                'Capcom (Memetron license)'
                'Capcom (Romstar license)'
                'Capcom (Taito America license)'
                'Capcom USA (Nintendo of America license)'
                'Cave (Jaleco license)'
                'Cave (Nihon System license)'
                'Central Denshi'
                'Centuri'
                'Century'
                'Century Electronics'
                'Century Electronics (Tuni Electro Service Inc)'
                'Chu Co. Ltd'
                'Cinematronics'
                'Cinematronics (Tradewest license)'
                'Cinematronics / GCE'
                'Cinematronics + Advanced Microcomputer Systems'
                'Comad'
                'Comad & New Japan System'
                'Comad (American Sammy license)'
                'Compile (Capcom license)'
                'Compile (Sega license)'
                'Comsoft'
                'Coreland / Sega'
                'D. R. Korea'
                'Data Amusement'
                'Data East'
                'Data East (Bally Midway license)'
                'Data East Corporation'
                'Data East Corporation (I-Vics license)'
                'Data East Corporation (licensed from First Star)'
                'Data East USA'
                'Data East USA (Bally Midway license)'
                'Deniam'
                'Denki Onkyo'
                'DIGITAL SOFT'
                'Digitrex Techstar (Rock-ola license)'
                'Dooyong'
                'E.G. Felaco'
                'East Technology'
                'Eastern Micro Electronics, Inc.'
                'Ed/Wood Place'
                'Eighting / Hudson'
                'Enerdyne Technologies, Inc.'
                'Epos Corporation'
                'Exidy'
                'Face'
                'Falcon'
                'Gaelco'
                'Game Plan, Inc. (Taito)'
                'Game-A-Tron'
                'GamePlan'
                'GamePlan (Centuri license)'
                'GameTek'
                'Gottlieb'
                'Gottlieb (Konami license)'
                'Gottlieb / Premier Technology'
                'Grand Products/Incredible Technologies'
                'Gremlin'
                'H.A.R. Management'
                'hack'
                'Hara Industries'
                'Hot-B.'
                'Hudson'
                'Incredible Technologies'
                'Irem'
                'Irem (Data East Corporation license)'
                'Irem (Data East license)'
                'Irem (Data East USA license)'
                'Irem (licensed from Broderbund)'
                'Irem (licensed from Hudson Soft)'
                'Irem (licensed from Tokuma Shoten)'
                'Irem (Nintendo license)'
                'Irem (Nintendo of America license)'
                'Irem (Williams license)'
                'Irem + GDI'
                'Irem America'
                'Jaleco'
                'Jaleco (Cinematronics license)'
                'Jaleco (Kitkorp license)'
                'Jaleco (Nichibutsu USA License)'
                'Jaleco (Taito America license)'
                'Jatre'
                'Jetsoft'
                'K.K. Tokki'
                'Kaneko'
                'Kaneko (Namco license)'
                'Karateco'
                'KH Video'
                'KID / Visco'
                'Kiwako'
                'Kiwako (ECI license)'
                'KKI'
                'KKK'
                'Konami'
                'Konami (Centuri licence)'
                'Konami (Centuri license)'
                'Konami (Gottlieb license)'
                'Konami (Nintendo of America license)'
                'Konami (Olympia license)'
                'Konami (Sega license)'
                'Konami (Stern license)'
                'Konami / Interlogic + Kosuka'
                'Konami + Kosuka'
                'Konami/Interlogic'
                'Kural Electric'
                'Kural Esco Electric'
                'Kural Samno Electric'
                'Kyugo'
                'LAX'
                'Leijac (Konami)'
                'Leijac Corporation'
                'Leland Corp.'
                'Leland Corp. / Tradewest'
                'Leprechaun'
                'Meadows'
                'Meadows Games, Inc.'
                'Metro'
                'Midway'
                'MIKI SHOJI'
                'Mitchell'
                'Mitchell + Capcom'
                'Monolith Corp.'
                'Mylstar'
                'Namco'
                'Namco (Atari license)'
                'Namco LTD.'
                'Nazca'
                'Nichibutsu'
                'Nichibutsu + Alice'
                'Nichibutsu USA'
                'Nichibutsu/Miki Syouji/AV Japan'
                'Nichibutsu/T.R.TEC'
                'Nintendo'
                'Nintendo / Fortrek'
                'Nintendo Co. LTD'
                'Nintendo of America'
                'Nintendo of America INC.'
                'Nippon Amuse Co-Ltd'
                'NMK'
                'NMK / Tecmo'
                'Nova Games Ltd.'
                'Ocean Software Limited'
                'Olympia'
                'Olympia (Centuri license)'
                'Orca'
                'Orca (Eastern Commerce Inc. license) (bootleg?)'
                'Orca (Esco Trading Co license)'
                'Orca (Esco Trading Co, Inc)'
                'Orca Corporation'
                'Outer Limits'
                'P & P Marketing'
                'Pacific Novelty'
                'Petaco S.A.'
                'Philko'
                'Playmark'
                'Proma'
                'Psikyo'
                'Rait Electronics Ltd'
                'Raizing (Able license)'
                'Raizing/8ing'
                'Ramtek'
                'Rare'
                'Rare (Nintendo of America license)'
                'Rare LTD.'
                'Rock-ola'
                'Sammy'
                'Sanritsu'
                'Saurus'
                'Seatongrove Ltd'
                'Sega'
                'Sega (Escape license)'
                'Sega / Compile'
                'Sega / Coreland'
                'Sega / Elorg'
                'Sega / Sunsoft'
                'Sega / Technosoft'
                'Sega / Vic Tokai'
                'Sega / Westone'
                'Seibu Denshi'
                'Seibu Denshi [Cinematronics license]'
                'Seibu Kaihatsu'
                'Seibu Kaihatsu (Fabtek license)'
                'Seibu Kaihatsu (IBL Corporation license)'
                'Seibu Kaihatsu Inc.'
                'Sesame Japan'
                'Seta'
                'Seta (Taito license)'
                'Shoei'
                'Sigma Ent. Inc.'
                'Sigma Ent. Inc. (Venture Line license)'
                'Signatron USA'
                'SNK'
                'SNK (Centuri license)'
                'SNK (Nintendo of America license)'
                'SNK / Pallas'
                'SNK / Romstar'
                'SNK / Saurus'
                'SNK of America'
                'Square'
                'Square (Nintendo of America license)'
                'Stern'
                'Strata/Incredible Technologies'
                'Subelectro'
                'Success (Seibu hardware)'
                'Sun a Electronics'
                'Sun Electronics'
                'Suna'
                'Sunsoft'
                'Sunsoft (Nintendo of America license)'
                'Sunsoft / Atlus'
                'Sunsoft / Sega'
                'Sunsoft + Atlus'
                'Tad'
                'Tad (Fabtek license)'
                'Taito'
                'Taito (Nintendo of America license)'
                'Taito (SNK license)'
                'Taito (Universal license?)'
                'Taito (Visco license)'
                'Taito America Corp'
                'Taito America Corporation'
                'Taito America Corporation (Romstar license)'
                'Taito Corp.'
                'Taito Corporation'
                'Taito Corporation (Fox Video Games license)'
                'Taito Corporation (Tecfri license)'
                'Taito Corporation Japan'
                'Taito Europe Corporation'
                'Takara'
                'Tamtex'
                'TDS'
                'Tecfri'
                'Technos'
                'Technos (Data East license)'
                'Technos (Nintendo license)'
                'Technos (Taito America license)'
                'Technos (Taito license)'
                'Technos + California Dreams'
                'Technos + Roller Tron'
                'Technos Japan'
                'Technos?'
                'Techstar'
                'Techstar (Sunn license)'
                'Techstar Inc. (Rock-ola license)'
                'Tecmo'
                'Tecmo (Nintendo of America license)'
                'Tehkan'
                'Tehkan (Centuri license)'
                'Tehkan (Video Ware license)'
                'Tehkan/Sun (Centuri license)'
                'Telko'
                'Toaplan'
                'Toaplan (Nova Apparate GMBH & Co license)'
                'Toaplan (Romstar license)'
                'Toaplan (Taito license)'
                'Tong Electronic'
                'Universal'
                'Universal (ADP Automaten license)'
                'Universal (Gottlieb license)'
                'Universal (Taito license)'
                'UPL'
                'UPL (Kawakus license)'
                'UPL (Universal license)'
                'UPL (World Games license)'
                'Valadon Automation'
                'Valadon Automation (Stern license)'
                'VEB Polytechnik Karl-Marx-Stadt'
                'Vectorbeam'
                'Venture Line'
                'Viccom'
                'Video System Co.'
                'Visco'
                'Vision / Artic'
                'V-System Co.'
                'V-System Co. (Bally/Midway/Sente license)'
                'Williams'
                'Woodplace Inc.'
                'World Games Inc'
                'Yachiyo Electronics, Ltd.'
                'Yang Cheng'
                'Yuga'
                'Yumekobo'
                'Yun Sung'
                'Zaccaria'
                'Zaccaria/Zelco'
                'Zenitone Microsec'
                'Zenitone Microsec (Dutchford license)'
                'Zenitone-Microsec Ltd'
                'Zilec Games'
                'Zilec-Zenitone')
            end
            object ManufacturerCustom: TEdit
              Left = 8
              Top = 56
              Width = 361
              Height = 21
              Hint = 
                'Type a manufacturer description. This only is valid when selecti' +
                'ng "Custom" on manufacturer'
              Enabled = False
              TabOrder = 1
            end
          end
          object LabelResolution: TGroupBox
            Left = 448
            Top = 16
            Width = 121
            Height = 89
            Caption = 'Resolution'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object Resolution: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a resolution'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              OnChange = ResolutionChange
              Items.Strings = (
                '(Unknown)'
                'Custom'
                '224x288'
                '240x256'
                '240x320'
                '256x240'
                '288x224'
                '320x200'
                '320x240'
                '320x256'
                '336x240'
                '352x240'
                '352x256'
                '368x224'
                '368x240'
                '368x256'
                '384x224'
                '384x240'
                '384x256'
                '400x300'
                '512x224'
                '512x256'
                '512x384'
                '512x448'
                '512x512'
                '640x350'
                '640x400'
                '640x480'
                '800x600'
                '1024x768'
                '1152x864'
                '1280x1024'
                '1600x1200')
            end
            object ResolutionCustom: TEdit
              Left = 8
              Top = 56
              Width = 105
              Height = 21
              Hint = 
                'Type a resolution (format 0000x0000). This only is valid when se' +
                'lecting "Custom" on resolution'
              Enabled = False
              TabOrder = 1
            end
          end
          object LabelYear: TGroupBox
            Left = 64
            Top = 112
            Width = 105
            Height = 57
            Caption = 'Year'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object Year: TComboBox
              Left = 8
              Top = 24
              Width = 89
              Height = 21
              Hint = 'Select an year'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              Items.Strings = (
                '(Unknown)'
                '1970'
                '1971'
                '1972'
                '1973'
                '1974'
                '1975'
                '1976'
                '1977'
                '1978'
                '1979'
                '1980'
                '1981'
                '1982'
                '1983'
                '1984'
                '1985'
                '1986'
                '1987'
                '1988'
                '1989'
                '1990'
                '1991'
                '1992'
                '1993'
                '1994'
                '1995'
                '1996'
                '1997'
                '1998'
                '1999'
                '2000'
                '2001'
                '2002'
                '2003'
                '2004'
                '2005')
            end
          end
          object LabelFrequency: TGroupBox
            Left = 176
            Top = 112
            Width = 105
            Height = 57
            Caption = 'Frequency'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object Frequency: TComboBox
              Left = 8
              Top = 24
              Width = 89
              Height = 21
              Hint = 'Select a frequency'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              Items.Strings = (
                '(Unknown)'
                '30 Hz'
                '38 Hz'
                '40 Hz'
                '43 Hz'
                '45 Hz'
                '50 Hz'
                '53 Hz'
                '54 Hz'
                '55 Hz'
                '56 Hz'
                '57 Hz'
                '58 Hz'
                '59 Hz'
                '60 Hz'
                '61 Hz'
                '62 Hz'
                '63 Hz'
                '64 Hz'
                '65 Hz'
                '66 Hz'
                '67 Hz'
                '68 Hz'
                '69 Hz'
                '70 Hz'
                '71 Hz'
                '72 Hz'
                '73 Hz'
                '74 Hz'
                '75 Hz'
                '76 Hz'
                '77 Hz'
                '78 Hz'
                '79 Hz'
                '80 Hz'
                '81 Hz'
                '82 Hz'
                '83 Hz'
                '84 Hz'
                '85 Hz'
                '86 Hz'
                '87 Hz'
                '88 Hz'
                '89 Hz'
                '90 Hz')
            end
          end
          object LabelVideo: TGroupBox
            Left = 288
            Top = 112
            Width = 121
            Height = 57
            Caption = 'Video'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object Video: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a video type'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Raster'
              Items.Strings = (
                'Raster'
                'Vector')
            end
          end
          object LabelControlType: TGroupBox
            Left = 416
            Top = 112
            Width = 153
            Height = 57
            Caption = 'Control Type'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            object ControlType: TComboBox
              Left = 8
              Top = 24
              Width = 137
              Height = 21
              Hint = 'Select the type of game controls'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              Items.Strings = (
                '(Unknown)'
                'Buttons'
                'Dial'
                'Double Joy 4 Way'
                'Double Joy 8 Way'
                'Joy 4 Way'
                'Joy 8 Way'
                'Light Gun'
                'Paddle'
                'Stick'
                'Trackball'
                '')
            end
          end
        end
        object TabSheetPage3: TTabSheet
          Caption = '3'
          ImageIndex = 45
          object Page3Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 0
            Transparent = True
          end
          object LabelDriverStatus: TGroupBox
            Left = 64
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Driver Status'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object DriverStatus: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a driver status'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Good'
              Items.Strings = (
                '(Unknown)'
                'Good'
                'Preliminary'
                'Imperfect')
            end
          end
          object LabelSoundStatus: TGroupBox
            Left = 192
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Sound Status'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object SoundStatus: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a sound status'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Good'
              Items.Strings = (
                '(Unknown)'
                'Good'
                'Preliminary'
                'Imperfect')
            end
          end
          object LabelColorStatus: TGroupBox
            Left = 320
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Color Status'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object ColorStatus: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a color status'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Good'
              Items.Strings = (
                '(Unknown)'
                'Good'
                'Preliminary'
                'Imperfect')
            end
          end
          object LabelSound: TGroupBox
            Left = 64
            Top = 80
            Width = 121
            Height = 57
            Caption = 'Sound'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object Sound: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select a sound type'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Stereo'
              Items.Strings = (
                'No Sound'
                'Mono'
                'Stereo')
            end
          end
          object LabelOrientation: TGroupBox
            Left = 448
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Orientation'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object Orientation: TComboBox
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Select an orientation'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'Horizontal'
              Items.Strings = (
                'Horizontal'
                'Vertical')
            end
          end
          object LabelCategory: TGroupBox
            Left = 192
            Top = 80
            Width = 377
            Height = 57
            Caption = 'Category'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            object CategoriesList: TComboBox
              Left = 8
              Top = 24
              Width = 361
              Height = 21
              Hint = 'Select a category'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '(Unknown)'
              Items.Strings = (
                '(Unknown)')
            end
          end
        end
        object TabSheetPage4: TTabSheet
          Caption = '4'
          ImageIndex = 45
          object LabelVersionAdded: TGroupBox
            Left = 64
            Top = 16
            Width = 137
            Height = 57
            Caption = 'Version Added'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object VersionAdded: TEdit
              Left = 8
              Top = 24
              Width = 121
              Height = 21
              Hint = 'Type the version that this game was added (20 characters max)'
              CharCase = ecLowerCase
              MaxLength = 20
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object LabelName: TGroupBox
            Left = 208
            Top = 16
            Width = 113
            Height = 57
            Caption = 'Name'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object Name: TEdit
              Left = 8
              Top = 24
              Width = 97
              Height = 21
              Hint = 'Type the name of the game (8 characters max)'
              CharCase = ecLowerCase
              MaxLength = 8
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object LabelCloneOf: TGroupBox
            Left = 328
            Top = 16
            Width = 113
            Height = 57
            Caption = 'Clone of'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object CloneOf: TEdit
              Left = 8
              Top = 24
              Width = 97
              Height = 21
              Hint = 'Type the name of the clone game (8 characters max)'
              CharCase = ecLowerCase
              MaxLength = 8
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object Page4Image: TImage32Ex
            Left = 8
            Top = 8
            Width = 52
            Height = 52
            Bitmap.DrawMode = dmBlend
            BitmapAlign = baTopLeft
            Scale = 1
            ScaleMode = smNormal
            TabOrder = 3
            Transparent = True
          end
          object LabelDriver: TGroupBox
            Left = 448
            Top = 16
            Width = 121
            Height = 57
            Caption = 'Driver'
            TabOrder = 4
            object DriverFile: TEdit
              Left = 8
              Top = 24
              Width = 105
              Height = 21
              Hint = 'Type the driver filename (MS-DOS 8.3 format only)'
              CharCase = ecLowerCase
              MaxLength = 14
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object Samples: TCheckBox
            Left = 64
            Top = 88
            Width = 113
            Height = 17
            Hint = 'The game has samples ?'
            Caption = 'Samples'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object Merged: TCheckBox
            Left = 208
            Top = 88
            Width = 105
            Height = 17
            Hint = 'The game is merged into the master game ?'
            Caption = 'Merged'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
          end
        end
      end
      object ButtonDeleteGame: TButton
        Left = 256
        Top = 232
        Width = 105
        Height = 23
        Hint = 'Delete current game from the list'
        Caption = '&Delete Game'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ButtonDeleteGameClick
      end
      object ButtonEditGame: TButton
        Left = 136
        Top = 232
        Width = 105
        Height = 23
        Hint = 'Edit current game'
        Caption = 'Edi&t Game'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ButtonEditGameClick
      end
      object ButtonNewGame: TButton
        Left = 16
        Top = 232
        Width = 105
        Height = 23
        Hint = 'Clear all fields to add a new game and enter in the add mode'
        Caption = '&New Game'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ButtonNewGameClick
      end
      object ButtonOk: TButton
        Left = 424
        Top = 232
        Width = 75
        Height = 23
        Hint = 'Save the new game into the custom list'
        Caption = '&Ok'
        Default = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = ButtonOkClick
      end
      object ButtonCancel: TButton
        Left = 512
        Top = 232
        Width = 75
        Height = 23
        Hint = 'Cancel any changes'
        Caption = 'C&ancel'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = ButtonCancelClick
      end
    end
    object TabSheetCustomGamesList: TTabSheet
      Caption = 'Custom Games List'
      ImageIndex = 10
      object ListCustomGames: TListView
        Left = 8
        Top = 8
        Width = 585
        Height = 241
        Color = clBlack
        Columns = <
          item
            Caption = 'Description'
            Width = 300
          end
          item
            Caption = 'Year'
            Tag = 1
            Width = 65
          end
          item
            Caption = 'Manufacturer'
            Tag = 2
            Width = 150
          end
          item
            Caption = 'Stereo'
            Tag = 3
            Width = 73
          end
          item
            Caption = 'Frequency'
            Tag = 4
            Width = 70
          end
          item
            Caption = 'Samples'
            Tag = 5
            Width = 83
          end
          item
            Caption = 'Control Type'
            Tag = 6
            Width = 110
          end
          item
            Caption = 'Video'
            Tag = 7
            Width = 70
          end
          item
            Caption = 'Orientation'
            Tag = 8
            Width = 100
          end
          item
            Caption = 'Resolution'
            Tag = 9
            Width = 95
          end
          item
            Caption = 'Driver Status'
            Tag = 10
            Width = 85
          end
          item
            Caption = 'Sound Status'
            Tag = 11
            Width = 85
          end
          item
            Caption = 'Color Status'
            Tag = 12
            Width = 85
          end
          item
            Caption = 'Merged'
            Tag = 13
            Width = 78
          end
          item
            Caption = 'Name'
            Tag = 14
            Width = 80
          end
          item
            Caption = 'Clone of'
            Tag = 15
            Width = 80
          end
          item
            Caption = 'Category'
            Tag = 16
            Width = 180
          end
          item
            Caption = 'Version Added'
            Tag = 17
            Width = 100
          end
          item
            Caption = 'Driver'
            Tag = 18
            Width = 80
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        IconOptions.AutoArrange = True
        LargeImages = FormMain.BuiltInBigListImageList
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        SmallImages = FormMain.BuiltInSmallListImageList
        TabOrder = 0
        TabStop = False
        ViewStyle = vsReport
        OnColumnClick = ListCustomGamesColumnClick
        OnSelectItem = ListCustomGamesSelectItem
      end
    end
    object TabSheetTutorial: TTabSheet
      Caption = 'Tutorial'
      ImageIndex = 36
      object TutorialHolder: TRichEdit
        Left = 8
        Top = 8
        Width = 585
        Height = 241
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
    end
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
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
end
