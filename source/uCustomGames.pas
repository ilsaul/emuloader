unit uCustomGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, IniFiles, GR32_Image, uGR32Extra,
  ImgList;

type
  TFormCustomGames = class(TForm)
    LabelStatusMode: TLabel;
    PageControlCustomGames: TPageControl;
    TabSheetCustomGamesList: TTabSheet;
    ListCustomGames: TListView;
    TabSheetTutorial: TTabSheet;
    TutorialHolder: TRichEdit;
    ButtonClose: TButton;
    TabSheetGameInformation: TTabSheet;
    PageControlGameInformationFields: TPageControl;
    ButtonDeleteGame: TButton;
    ButtonEditGame: TButton;
    ButtonNewGame: TButton;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    TabSheetPage1: TTabSheet;
    TabSheetPage2: TTabSheet;
    LabelCommandLineMessage: TGroupBox;
    Page1Image: TImage32Ex;
    CommandLine: TEdit;
    CommandLineButtonSelect: TButton;
    LabelCommandLineParameters: TGroupBox;
    TabSheetPage3: TTabSheet;
    CommandLineParameters: TEdit;
    ButtonClearCommandLine: TButton;
    LabelDescription: TGroupBox;
    Description: TEdit;
    BottomLine: TBevel;
    Page2Image: TImage32Ex;
    Page3Image: TImage32Ex;
    LabelManufacturer: TGroupBox;
    Manufacturer: TComboBox;
    ManufacturerCustom: TEdit;
    LabelResolution: TGroupBox;
    Resolution: TComboBox;
    ResolutionCustom: TEdit;
    LabelYear: TGroupBox;
    LabelFrequency: TGroupBox;
    LabelVideo: TGroupBox;
    Year: TComboBox;
    Frequency: TComboBox;
    LabelControlType: TGroupBox;
    Video: TComboBox;
    ControlType: TComboBox;
    LabelDriverStatus: TGroupBox;
    LabelSoundStatus: TGroupBox;
    LabelColorStatus: TGroupBox;
    LabelSound: TGroupBox;
    DriverStatus: TComboBox;
    SoundStatus: TComboBox;
    ColorStatus: TComboBox;
    LabelOrientation: TGroupBox;
    Orientation: TComboBox;
    LabelCategory: TGroupBox;
    Sound: TComboBox;
    CategoriesList: TComboBox;
    TopImage: TImage;
    TabSheetPage4: TTabSheet;
    LabelVersionAdded: TGroupBox;
    LabelName: TGroupBox;
    LabelCloneOf: TGroupBox;
    LabelCaption: TLabel;
    Page4Image: TImage32Ex;
    VersionAdded: TEdit;
    Name: TEdit;
    LabelDriver: TGroupBox;
    CloneOf: TEdit;
    DriverFile: TEdit;
    Samples: TCheckBox;
    Merged: TCheckBox;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonClearCommandLineClick(Sender: TObject);
    procedure ManufacturerChange(Sender: TObject);
    procedure ResolutionChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonNewGameClick(Sender: TObject);
    procedure ButtonEditGameClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ButtonDeleteGameClick(Sender: TObject);
    procedure ListCustomGamesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListCustomGamesColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure CommandLineButtonSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CustomGameFile, UnCustomGameFile, CustomGameCmd: THashedStringList;
    ListChanged, BrowseMode, EditingGame: Boolean;
    function  LoadCustomGames: Boolean;
    procedure StatusMode(Editing: Boolean);
    procedure ResetFields;
    procedure UpdateFields(GameIndex: Integer);
    { Private declarations }
  public
    CopyGameIndex: Integer;
    { Public declarations }
  end;

var
  FormCustomGames: TFormCustomGames;

implementation

uses uMain, uStatus, uPreferences, uCommon, uFilesUtil,
  uCustomGamesSelector;

{$R *.DFM}

// procedures
function TFormCustomGames.LoadCustomGames: Boolean;
var
  ClassFile, TempFile: THashedStringList;
  ROMLine: String;
  Loop: Integer;
begin
  ClassFile:= THashedStringList.Create;
  ClassFile.LoadFromFile(FormMain.FrontendPath+'resources\CustomGames.dat');
  TempFile:= THashedStringList.Create;
  TempFile.LoadFromFile(FormMain.FrontendPath+'resources\UnCustomGames.dat');
  ClassFile.AddStrings(TempFile);
  FreeAndNil(TempFile);

  Result:= not (ClassFile.Count = 0);

  if Result then
     begin
       for Loop:=0 to ClassFile.Count -1 do
       begin
         ROMLine:= ClassFile[Loop];
         FormMain.GetROMFields(ROMLine);
         with ListCustomGames.Items.Add do
         begin
           ImageIndex:= FormMain.mROMIdentification;
           Caption:= FormMain.mDescription;
           SubItems.Add(FormMain.mYear);
           SubItems.Add(FormMain.mManufacturer);
           SubItems.Add(FormMain.mSound);
           SubItems.Add(FormMain.mFrequency);
           SubItems.Add(FormMain.mSamples);
           SubItems.Add(FormMain.mControlType);
           SubItems.Add(FormMain.mVideo);
           SubItems.Add(FormMain.mOrientation);
           SubItems.Add(FormMain.mResolution);
           SubItems.Add(FormMain.mDriverStatus);
           SubItems.Add(FormMain.mSoundStatus);
           SubItems.Add(FormMain.mColorStatus);
           SubItems.Add(FormMain.mMerged);
           SubItems.Add(FormMain.mName);
           SubItems.Add(FormMain.mClone);
           SubItems.Add(FormMain.mCategory);
           SubItems.Add(FormMain.mVersionAdded);
           SubItems.Add(FormMain.mDriver);
         end; // end do List.Add
       end;
     end;
  FreeAndNil(ClassFile);
end;

procedure TFormCustomGames.StatusMode(Editing: Boolean);
begin
  CommandLine.Enabled:= Editing;
  CommandLineButtonSelect.Enabled:= Editing;
  CommandLineParameters.Enabled:= Editing;
  ButtonClearCommandLine.Enabled:= Editing;
  Description.Enabled:= Editing;
  Manufacturer.Enabled:= Editing;
  ManufacturerCustom.Enabled:= Editing;
  Resolution.Enabled:= Editing;
  ResolutionCustom.Enabled:= Editing;
  Year.Enabled:= Editing;
  Frequency.Enabled:= Editing;
  Video.Enabled:= Editing;
  DriverStatus.Enabled:= Editing;
  SoundStatus.Enabled:= Editing;
  ColorStatus.Enabled:= Editing;
  ControlType.Enabled:= Editing;
  Orientation.Enabled:= Editing;
  Sound.Enabled:= Editing;
  Name.Enabled:= Editing;
  CloneOf.Enabled:= Editing;
  CategoriesList.Enabled:= Editing;
  VersionAdded.Enabled:= Editing;
  DriverFile.Enabled:= Editing;
  Samples.Enabled:= Editing;
  Merged.Enabled:= Editing;
end;

procedure TFormCustomGames.ResetFields;
begin
  CommandLine.Clear;
  CommandLineParameters.Clear;
  Description.Clear;
  Manufacturer.ItemIndex:= 0;
  ManufacturerCustom.Clear;
  Resolution.ItemIndex:= 0;
  ResolutionCustom.Clear;
  Year.ItemIndex:= 0;
  Frequency.ItemIndex:= 0;
  Video.ItemIndex:= 0;
  DriverStatus.ItemIndex:= 1;
  SoundStatus.ItemIndex:= 1;
  ColorStatus.ItemIndex:= 1;
  ControlType.ItemIndex:= 0;
  Orientation.ItemIndex:= 0;
  Sound.ItemIndex:= 2;
  Name.Clear;
  CloneOf.Clear;
  CategoriesList.ItemIndex:= 0;
  VersionAdded.Clear;
  DriverFile.Clear;
  Samples.Checked:= False;
  Merged.Checked:= False;
end;

procedure TFormCustomGames.UpdateFields(GameIndex: Integer);
var
  FieldIndex: Integer;
begin
  if FileExists(FormMain.FrontendPath+'resources\CustomGamesCmd.ini') then
     begin
       CustomGameCmd:= THashedStringList.Create;
       CustomGameCmd.LoadFromFile(FormMain.FrontendPath+'resources\CustomGamesCmd.ini');
       CommandLine.Text:= CustomGameCmd.Values[ListCustomGames.Items[GameIndex].SubItems[13]];
       CommandLineParameters.Text:= CustomGameCmd.Values[ListCustomGames.Items[GameIndex].SubItems[13]+'Params'];
       FreeAndNil(CustomGameCmd);
      end;
  if CommandLine.Text = '' then
     CommandLine.Text:= FormMain.GetLanguageText('Messages', 'CommandLineErrorMsg', 'Error! Could not find the command line...');

  Description.Text:= ListCustomGames.Items[GameIndex].Caption;

  if ListCustomGames.Items[GameIndex].SubItems[0] = '' then
     Year.ItemIndex:= 0
  else
     begin
       FieldIndex:= Year.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[0]);
       if FieldIndex > -1 then
          Year.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnYear', 'Year')])), 2);
     end;

  if ListCustomGames.Items[GameIndex].SubItems[1] = 'Unknown' then
     Manufacturer.ItemIndex:= 0
  else
     begin
       FieldIndex:= Manufacturer.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[1]);
       if FieldIndex > -1 then
          begin
            Manufacturer.ItemIndex:= FieldIndex;
            ManufacturerCustom.Text:= '';
            ManufacturerCustom.Enabled:= False;
          end
       else
          begin
            Manufacturer.ItemIndex:= 1;
            ManufacturerCustom.Text:= ListCustomGames.Items[GameIndex].SubItems[1];
            ManufacturerCustom.Enabled:= True;
          end;
     end;

  if ListCustomGames.Items[GameIndex].SubItems[2] = '' then
     Sound.ItemIndex:= 0
  else
  if ListCustomGames.Items[GameIndex].SubItems[2] = 'Mono' then
     Sound.ItemIndex:= 1
  else
  if ListCustomGames.Items[GameIndex].SubItems[2] = 'Stereo' then
     Sound.ItemIndex:= 2
  else
     GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                     LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                      [FormMain.GetLanguageText('Custom Games', 'LabelSound', 'Sound')])), 2);

  if ListCustomGames.Items[GameIndex].SubItems[3] = 'Unknown' then
     Frequency.ItemIndex:= 0
  else
     begin
       FieldIndex:= Frequency.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[3]);
       if FieldIndex > -1 then
          Frequency.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnFrequency', 'Frequency')])), 2);
     end;

  Samples.Checked:= ListCustomGames.Items[GameIndex].SubItems[4] <> '';

  if ListCustomGames.Items[GameIndex].SubItems[5] = 'Unknown' then
     ControlType.ItemIndex:= 0
  else
     begin
       FieldIndex:= ControlType.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[5]);
       if FieldIndex > -1 then
          ControlType.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnControlType', 'Control Type')])), 2);
     end;

  if ListCustomGames.Items[GameIndex].SubItems[6] = 'Raster' then
     Video.ItemIndex:= 0
  else
  if ListCustomGames.Items[GameIndex].SubItems[6] = 'Vector' then
     Video.ItemIndex:= 1
  else
     GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnVideo', 'Video')])), 2);

  if ListCustomGames.Items[GameIndex].SubItems[7] = 'Horizontal' then
     Orientation.ItemIndex:= 0
  else
  if ListCustomGames.Items[GameIndex].SubItems[7] = 'Vertical' then
     Orientation.ItemIndex:= 1
  else
     GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnOrientation', 'Orientation')])), 2);

  if ListCustomGames.Items[GameIndex].SubItems[8] = 'Unknown' then
     Resolution.ItemIndex:= 0
  else
     begin
       FieldIndex:= Resolution.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[8]);
       if FieldIndex > -1 then
          begin
            Resolution.ItemIndex:= FieldIndex;
            ResolutionCustom.Text:= '';
            ResolutionCustom.Enabled:= False;
          end
       else
          begin
            Resolution.ItemIndex:= 1;
            ResolutionCustom.Text:= ListCustomGames.Items[GameIndex].SubItems[8];
            ResolutionCustom.Enabled:= True;
          end;
     end;

  if ListCustomGames.Items[GameIndex].SubItems[9] = 'Unknown' then
     DriverStatus.ItemIndex:= 0
  else
     begin
       FieldIndex:= DriverStatus.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[9]);
       if FieldIndex > -1 then
          DriverStatus.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnDriverStatus', 'Driver Status')])), 2);
     end;

  if ListCustomGames.Items[GameIndex].SubItems[10] = 'Unknown' then
     SoundStatus.ItemIndex:= 0
  else
     begin
       FieldIndex:= SoundStatus.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[10]);
       if FieldIndex > -1 then
          SoundStatus.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnSoundStatus', 'Sound Status')])), 2);
     end;

  if ListCustomGames.Items[GameIndex].SubItems[11] = 'Unknown' then
     ColorStatus.ItemIndex:= 0
  else
     begin
       FieldIndex:= ColorStatus.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[11]);
       if FieldIndex > -1 then
          ColorStatus.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnColorStatus', 'Color Status')])), 2);
     end;

  Merged.Checked:= ListCustomGames.Items[GameIndex].SubItems[12] <> '';
  Name.Text:= ListCustomGames.Items[GameIndex].SubItems[13];
  CloneOf.Text:= ListCustomGames.Items[GameIndex].SubItems[14];

  if ListCustomGames.Items[GameIndex].SubItems[15] = 'Unknown' then
     CategoriesList.ItemIndex:= 0
  else
     begin
       FieldIndex:= CategoriesList.Items.IndexOf(ListCustomGames.Items[GameIndex].SubItems[15]);
       if FieldIndex > -1 then
          CategoriesList.ItemIndex:= FieldIndex
       else
          GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                          LowerCase(Format(FormMain.GetLanguageText('Messages', 'CorrectValueErrorMsg', 'The correct %s was not found!'),
                                           [FormMain.GetLanguageText('Main', 'ListColumnCategory', 'Category')])), 2);
     end;

  VersionAdded.Text:= ListCustomGames.Items[GameIndex].SubItems[16];
  DriverFile.Text:= ListCustomGames.Items[GameIndex].SubItems[17];
end;
// end of procedures

procedure TFormCustomGames.ButtonCancelClick(Sender: TObject);
var
  StatusModeString: String;
begin
  case EditingGame of
    True : StatusModeString:= LowerCase(FormMain.GetLanguageText('Custom Games', 'StatusModeAdd', 'Adding New Game'));
    False: StatusModeString:= LowerCase(FormMain.GetLanguageText('Custom Games', 'StatusModeEdit', 'Editing Game'));
  end;

  if GenerateMessage(FormMain.GetLanguageText('Messages', 'CancelTitle', 'Cancel'),
                     Format(FormMain.GetLanguageText('Messages', 'CustomGamesCancelOperationMsg', 'Cancel %s. Are you sure ?'), [StatusModeString]), 1) = mrYes then
     begin
       ResetFields;
       LabelStatusMode.Caption:= Format(FormMain.GetLanguageText('Custom Games', 'LabelStatusMode', 'Status: %s'),
                                        [FormMain.GetLanguageText('Custom Games', 'StatusModeBrowse', 'Browse Mode')]);
       LabelStatusMode.Refresh;
       ButtonNewGame.Enabled:= True;
       if ListCustomGames.Items.Count > 0 then
          begin
            ButtonEditGame.Enabled:= True;
            ButtonDeleteGame.Enabled:= True;
            UpdateFields(ListCustomGames.Selected.Index);
          end;
       ButtonCancel.Enabled:= False;
       ButtonOk.Enabled:= False;
       ButtonClose.Enabled:= True;
       BrowseMode:= True;
       EditingGame:= False;
       StatusMode(False);
     end;
end;

procedure TFormCustomGames.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCustomGames.ButtonClearCommandLineClick(Sender: TObject);
begin
  CommandLine.Clear;
  CommandLineParameters.Clear;
end;

procedure TFormCustomGames.ManufacturerChange(Sender: TObject);
begin
  ManufacturerCustom.Enabled:= Manufacturer.ItemIndex = 1;
end;

procedure TFormCustomGames.ResolutionChange(Sender: TObject);
begin
  ResolutionCustom.Enabled:= Resolution.ItemIndex = 1;
end;

procedure TFormCustomGames.ButtonOkClick(Sender: TObject);
var
  AcceptChanges: Boolean;
  ROMDataLine: String;
  GameIndex, Loop: Integer;

  procedure UpdateCustomCmd;
  begin
    Loop:= CustomGameCmd.IndexOfName(Name.Text);
    if Loop = -1 then
       begin
         CustomGameCmd.Add(Name.Text+'='+CommandLine.Text);
         CustomGameCmd.Add(Name.Text+'Params='+CommandLineParameters.Text);
       end
    else
    if Loop <> -1 then
       begin
         CustomGameCmd[Loop]:= Name.Text+'='+CommandLine.Text;
         CustomGameCmd[Loop+1]:= Name.Text+'Params='+CommandLineParameters.Text;
       end;
  end;

begin
  AcceptChanges:= True;
  if CommandLine.Text = '' then
     begin
       GenerateMessage(FormMain.GetLanguageText('Messages', 'FatalErrorTitle', 'Fatal Error'),
                       FormMain.GetLanguageText('Messages', 'CommandLineEmptyErrorMsg', 'The command line cannot be empty!'), 2);
       AcceptChanges:= False;
     end;

  if Name.Text = '' then
     begin
       GenerateMessage(FormMain.GetLanguageText('Messages', 'FatalErrorTitle', 'Fatal Error'),
                       FormMain.GetLanguageText('Messages', 'NameEmptyErrorMsg', 'The name field cannot be empty!'), 2);
       AcceptChanges:= False;
     end;

  if ListCustomGames.Items.Count > 0 then
     begin
       for Loop:=0 to ListCustomGames.Items.Count -1 do
       begin
         if Name.Text = ListCustomGames.Items[Loop].SubItems[13] then
            begin
              case EditingGame of
                True:
                  begin
                    if Loop <> ListCustomGames.Selected.Index then
                       begin
                         GenerateMessage(FormMain.GetLanguageText('Messages', 'FatalErrorTitle', 'Fatal Error'),
                                         FormMain.GetLanguageText('Messages', 'NameAlreadyExistsMsg', 'The name is already being used. It cannot be used for two games!'), 2);
                         AcceptChanges:= False;
                         Break;
                       end;
                  end;
                False:
                  begin
                    GenerateMessage(FormMain.GetLanguageText('Messages', 'FatalErrorTitle', 'Fatal Error'),
                                    FormMain.GetLanguageText('Messages', 'NameAlreadyExistsMsg', 'The name is already being used. It cannot be used for two games!'), 2);
                    AcceptChanges:= False;
                    Break;
                  end;
              end;
            end;
       end;
     end;

  if AcceptChanges then
     begin
       SetCurrentDir(FormMain.FrontendPath); // force to point on the frontend's folder
       // will add the new game to the custom games list
       ListCustomGames.Items.BeginUpdate;
       if not Assigned(CustomGameFile) then
          begin
            CustomGameFile:= THashedStringList.Create;
            if FileExists(FormMain.FrontendPath+'resources\CustomGames.dat') then
               CustomGameFile.LoadFromFile(FormMain.FrontendPath+'resources\CustomGames.dat');
          end;
       CustomGameFile.BeginUpdate;

       if not Assigned(UnCustomGameFile) then
          begin
            UnCustomGameFile:= THashedStringList.Create;
            if FileExists(FormMain.FrontendPath+'resources\UnCustomGames.dat') then
               UnCustomGameFile.LoadFromFile(FormMain.FrontendPath+'resources\UnCustomGames.dat');
          end;
       UnCustomGameFile.BeginUpdate;

       if EditingGame then
          begin
            FormMain.mROMIdentification:= ListCustomGames.ItemFocused.ImageIndex;
            FormMain.mDescription:= ListCustomGames.ItemFocused.Caption;
            FormMain.mYear:= ListCustomGames.ItemFocused.SubItems[0];
            FormMain.mManufacturer:= ListCustomGames.ItemFocused.SubItems[1];
            FormMain.mSound:= ListCustomGames.ItemFocused.SubItems[2];
            FormMain.mFrequency:= ListCustomGames.ItemFocused.SubItems[3];
            FormMain.mSamples:= ListCustomGames.ItemFocused.SubItems[4];
            FormMain.mControlType:= ListCustomGames.ItemFocused.SubItems[5];
            FormMain.mVideo:= ListCustomGames.ItemFocused.SubItems[6];
            FormMain.mOrientation:= ListCustomGames.ItemFocused.SubItems[7];
            FormMain.mResolution:= ListCustomGames.ItemFocused.SubItems[8];
            FormMain.mDriverStatus:= ListCustomGames.ItemFocused.SubItems[9];
            FormMain.mSoundStatus:= ListCustomGames.ItemFocused.SubItems[10];
            FormMain.mColorStatus:= ListCustomGames.ItemFocused.SubItems[11];
            FormMain.mMerged:= ListCustomGames.ItemFocused.SubItems[12];
            FormMain.mName:= ListCustomGames.ItemFocused.SubItems[13];
            FormMain.mClone:= ListCustomGames.ItemFocused.SubItems[14];
            FormMain.mCategory:= ListCustomGames.ItemFocused.SubItems[15];
            FormMain.mVersionAdded:= ListCustomGames.ItemFocused.SubItems[16];
            FormMain.mDriver:= ListCustomGames.ItemFocused.SubItems[17];

            ROMDataLine:= FormMain.PopulateROMDataLine;
          end;

       FormMain.mDescription:= Description.Text;

       if Year.ItemIndex = 0 then
          FormMain.mYear:= ''
       else
          FormMain.mYear:= Year.Text;

       if Manufacturer.ItemIndex = 0 then
          FormMain.mManufacturer:= 'Unknown'
       else
       if Manufacturer.ItemIndex = 1 then
          FormMain.mManufacturer:= ManufacturerCustom.Text
       else
          FormMain.mManufacturer:= Manufacturer.Text;

       if Sound.ItemIndex = 0 then
          FormMain.mSound:= ''
       else
          FormMain.mSound:= Sound.Text;

       if Frequency.ItemIndex = 0 then
          FormMain.mFrequency:= 'Unknown'
       else
          FormMain.mFrequency:= Frequency.Text;

       case Samples.Checked of
         True : FormMain.mSamples:= 'Yes';
         False: FormMain.mSamples:= '';
       end;

       if ControlType.ItemIndex = 0 then
          FormMain.mControlType:= 'Unknown'
       else
          FormMain.mControlType:= ControlType.Text;

       FormMain.mVideo:= Video.Text;
       FormMain.mOrientation:= Orientation.Text;

       if Resolution.ItemIndex = 0 then
          FormMain.mResolution:= 'Unknown'
       else
       if Resolution.ItemIndex = 1 then
          FormMain.mResolution:= ResolutionCustom.Text
       else
          FormMain.mResolution:= Resolution.Text;

       if DriverStatus.ItemIndex = 0 then
          FormMain.mDriverStatus:= 'Unknown'
       else
          FormMain.mDriverStatus:= DriverStatus.Text;

       if SoundStatus.ItemIndex = 0 then
          FormMain.mSoundStatus:= 'Unknown'
       else
          FormMain.mSoundStatus:= SoundStatus.Text;

       if ColorStatus.ItemIndex = 0 then
          FormMain.mColorStatus:= 'Unknown'
       else
          FormMain.mColorStatus:= ColorStatus.Text;

       case Merged.Checked of
         True : FormMain.mMerged:= 'Yes';
         False: FormMain.mMerged:= '';
       end;

       FormMain.mName:= Name.Text;
       FormMain.mClone:= CloneOf.Text;

       if CategoriesList.ItemIndex = 0 then
          FormMain.mCategory:= 'Unknown'
       else
          FormMain.mCategory:= CategoriesList.Text;

       FormMain.mVersionAdded:= VersionAdded.Text;
       FormMain.mDriver:= DriverFile.Text;

       Application.ProcessMessages;
       FormMain.mROMIdentification:= 16;
       // Now I need to search for the game file
       if not FormMain.SearchZIP(FormMain.mName) then
          begin
            if FormMain.mClone <> '' then
               begin
                 if FormMain.mMerged = 'Yes' then
                    begin
                      if not FormMain.SearchZIP(FormMain.mClone) then
                         FormMain.mROMIdentification:= 17;
                    end;
               end
            else
               FormMain.mROMIdentification:= 17;
          end;

       CustomGameCmd:= THashedStringList.Create;
       if FileExists(FormMain.FrontendPath+'resources\CustomGamesCmd.ini') then
          CustomGameCmd.LoadFromFile(FormMain.FrontendPath+'resources\CustomGamesCmd.ini');

       case EditingGame of
         False:
           begin
             with ListCustomGames.Items.Add do
             begin
               ImageIndex:= FormMain.mROMIdentification;
               Caption:= FormMain.mDescription;
               SubItems.Add(FormMain.mYear);
               SubItems.Add(FormMain.mManufacturer);
               SubItems.Add(FormMain.mSound);
               SubItems.Add(FormMain.mFrequency);
               SubItems.Add(FormMain.mSamples);
               SubItems.Add(FormMain.mControlType);
               SubItems.Add(FormMain.mVideo);
               SubItems.Add(FormMain.mOrientation);
               SubItems.Add(FormMain.mResolution);
               SubItems.Add(FormMain.mDriverStatus);
               SubItems.Add(FormMain.mSoundStatus);
               SubItems.Add(FormMain.mColorStatus);
               SubItems.Add(FormMain.mMerged);
               SubItems.Add(FormMain.mName);
               SubItems.Add(FormMain.mClone);
               SubItems.Add(FormMain.mCategory);
               SubItems.Add(FormMain.mVersionAdded);
               SubItems.Add(FormMain.mDriver);

               Application.ProcessMessages;
             end; // end of List.Add
           end;
         True:
           begin
             with ListCustomGames.ItemFocused do
             begin
               if FormMain.mName <> SubItems[13] then
                  begin
                    Loop:= CustomGameCmd.IndexOfName(SubItems[13]);
                    if Loop <> -1 then
                       CustomGameCmd.Delete(Loop);
                    Loop:= CustomGameCmd.IndexOfName(SubItems[13]+'Params');
                    if Loop <> -1 then
                       CustomGameCmd.Delete(Loop);
                  end;
               ImageIndex:= FormMain.mROMIdentification;
               Caption:= FormMain.mDescription;
               SubItems[0]:= FormMain.mYear;
               SubItems[1]:= FormMain.mManufacturer;
               SubItems[2]:= FormMain.mSound;
               SubItems[3]:= FormMain.mFrequency;
               SubItems[4]:= FormMain.mSamples;
               SubItems[5]:= FormMain.mControlType;
               SubItems[6]:= FormMain.mVideo;
               SubItems[7]:= FormMain.mOrientation;
               SubItems[8]:= FormMain.mResolution;
               SubItems[9]:= FormMain.mDriverStatus;
               SubItems[10]:= FormMain.mSoundStatus;
               SubItems[11]:= FormMain.mColorStatus;
               SubItems[12]:= FormMain.mMerged;
               SubItems[13]:= FormMain.mName;
               SubItems[14]:= FormMain.mClone;
               SubItems[15]:= FormMain.mCategory;
               SubItems[16]:= FormMain.mVersionAdded;
               SubItems[17]:= FormMain.mDriver;

               Application.ProcessMessages;
             end; // end do List Modify
           end;
       end;
       ListCustomGames.Items.EndUpdate;

       case EditingGame of
         False:
           begin
             ROMDataLine:= FormMain.PopulateROMDataLine;
             case FormMain.mROMIdentification of
               16: CustomGameFile.Add(ROMDataLine);
               17: UnCustomGameFile.Add(ROMDataLine);
             end;
             UpdateCustomCmd;
           end;
         True:
           begin
             case FormMain.mROMIdentification of
               16:
                begin
                  GameIndex:= CustomGameFile.IndexOf(ROMDataLine);
                  if GameIndex > -1 then
                     begin
                       ROMDataLine:= FormMain.PopulateROMDataLine;
                       CustomGameFile.Strings[GameIndex]:= ROMDataLine;
                       UpdateCustomCmd;
                     end
                  else
                     begin
                       if GenerateMessage(FormMain.GetLanguageText('Messages', 'GameNotFoundTitle', 'Game Not Found'),
                                          Format(FormMain.GetLanguageText('Messages', 'GameNotFoundMsg', 'This game was not found on file "%s". Do you want to add it to the list ?'), ['CustomGames.dat']), 1)= mrYes then
                          begin
                            ROMDataLine:= FormMain.PopulateROMDataLine;
                            CustomGameFile.Add(ROMDataLine);
                            UpdateCustomCmd;
                          end;
                      end;
                end;
               17:
                begin
                  GameIndex:= UnCustomGameFile.IndexOf(ROMDataLine);
                  if GameIndex > -1 then
                     begin
                       ROMDataLine:= FormMain.PopulateROMDataLine;
                       UnCustomGameFile.Strings[GameIndex]:= ROMDataLine;
                       UpdateCustomCmd;
                     end
                  else
                     begin
                       if GenerateMessage(FormMain.GetLanguageText('Messages', 'GameNotFoundTitle', 'Game Not Found'),
                                          Format(FormMain.GetLanguageText('Messages', 'GameNotFoundMsg', 'This game was not found on file "%s". Do you want to add it to the list ?'), ['UnCustomGames.dat']), 1)= mrYes then
                          begin
                            ROMDataLine:= FormMain.PopulateROMDataLine;
                            UnCustomGameFile.Add(ROMDataLine);
                            UpdateCustomCmd;
                          end;
                      end;
                end;
             end;
           end;
       end;
       CustomGameFile.EndUpdate;
       UnCustomGameFile.EndUpdate;

       CustomGameCmd.SaveToFile(FormMain.FrontendPath+'resources\CustomGamesCmd.ini');
       FreeAndNil(CustomGameCmd);

       ButtonNewGame.Enabled:= True;
       if ListCustomGames.Items.Count > 0 then
          begin
            ButtonEditGame.Enabled:= True;
            ButtonDeleteGame.Enabled:= True;
          end;
       ButtonCancel.Enabled:= False;
       ButtonOk.Enabled:= False;
       ButtonClearCommandLine.Enabled:= False;
       ButtonClose.Enabled:= True;

       ListChanged:= True;
       LabelStatusMode.Caption:=Format(FormMain.GetLanguageText('Custom Games', 'LabelStatusMode', 'Status: %s'),
                                       [FormMain.GetLanguageText('Custom Games', 'StatusModeBrowse', 'Browse Mode')]);
       LabelStatusMode.Refresh;

       BrowseMode:= True;
       EditingGame:= False;
       StatusMode(False);
     end;
end;

procedure TFormCustomGames.ButtonNewGameClick(Sender: TObject);
begin

  LabelStatusMode.Caption:= Format(FormMain.GetLanguageText('Custom Games', 'LabelStatusMode', 'Status: %s'),
                                   [FormMain.GetLanguageText('Custom Games', 'StatusModeAdd', 'Adding New Game')]);
  LabelStatusMode.Refresh;
  BrowseMode:= False;
  EditingGame:= False;
  ButtonClose.Enabled:= False;
  ButtonNewGame.Enabled:= False;
  ButtonEditGame.Enabled:= False;
  ButtonDeleteGame.Enabled:= False;
  ButtonClearCommandLine.Enabled:= True;
  ButtonCancel.Enabled:= True;
  ButtonOk.Enabled:= True;
  ResetFields;
  StatusMode(True);
  if ListCustomGames.Items.Count > 0 then
     begin
       if GenerateMessage(FormMain.GetLanguageText('Messages', 'CopyGameInfoTitle', 'Copy Game Information'),
                          FormMain.GetLanguageText('Messages', 'CopyGameInfoMsg', 'Would you like to copy the fields from other custom game ?'), 1) = mrYes then
          begin
            if not Assigned(FormCustomGameSelector) then
               FormCustomGameSelector:= TFormCustomGameSelector.Create(Self);
            FormCustomGameSelector.ShowModal;
            FreeAndNil(FormCustomGameSelector);
            if CopyGameIndex <> -1 then
               UpdateFields(CopyGameIndex);
          end;
     end;
end;

procedure TFormCustomGames.ButtonEditGameClick(Sender: TObject);
begin
  LabelStatusMode.Caption:= Format(FormMain.GetLanguageText('Custom Games', 'LabelStatusMode', 'Status: %s'),
                                   [FormMain.GetLanguageText('Custom Games', 'StatusModeEdit', 'Editing Game')]);
  LabelStatusMode.Refresh;
  BrowseMode:= False;
  EditingGame:= True;
  ButtonClose.Enabled:= False;
  ButtonNewGame.Enabled:= False;
  ButtonEditGame.Enabled:= False;
  ButtonDeleteGame.Enabled:= False;
  ButtonClearCommandLine.Enabled:= True;
  ButtonCancel.Enabled:= True;
  ButtonOk.Enabled:= True;
  StatusMode(True);
end;

procedure TFormCustomGames.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  SetCurrentDir(FormMain.FrontendPath); // force to point on frontend's folder
  if ListChanged then
     begin
       Screen.Cursor:= crHourGlass;
       if FormMain.MenuRealIcons.Checked then
          begin
            if not Assigned(FormMain.RealIconsDAT) then
               FormMain.RealIconsDAT:= TMemIniFile.Create(FormMain.FrontendPath+'resources\IconsList.ini');
          end;
       CustomGameFile.SaveToFile(FormMain.FrontendPath+'resources\CustomGames.dat');
       UnCustomGameFile.SaveToFile(FormMain.FrontendPath+'resources\UnCustomGames.dat');

       FormMain.SetGameType(FormMain.ButtonGameType.Tag);
       FreeAndNil(FormMain.RealIconsDAT);
       FormMain.SortColumn(FormMain.ColumnSorted, True);

       if (FormMain.SelectedGame <= (Length(FormMain.GamesList)-1)) then
          FormMain.SelectItem(FormMain.SelectedGame)
       else
       if (FormMain.SelectedGame-1 <= (Length(FormMain.GamesList)-1)) then
          FormMain.SelectItem(FormMain.SelectedGame-1)
       else
          FormMain.SelectItem(0);
     end;
  FreeAndNil(CustomGameFile);
end;

procedure TFormCustomGames.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     begin
       case BrowseMode of
         True : ButtonClose.OnClick(Self);
         False: ButtonCancel.OnClick(Self);
       end;
     end;
end;

procedure TFormCustomGames.FormShow(Sender: TObject);
var
  TempList, Categories: THashedStringList;
  TempList2: TMemIniFile;
  Loop: Integer;
  CategoryDescription: String;
begin
  FormMain.UpdateGeneralAppearance(FormCustomGames);
  FormMain.SetCustomGamesLanguage;
  StatusMode(False);
  if FileExists(FormMain.FrontendPath+'docs\el-customgamestutorial.rtf') then
     TutorialHolder.Lines.LoadFromFile(FormMain.FrontendPath+'docs\el-customgamestutorial.rtf');
  if FileExists(FormMain.FrontendPath+'catver.ini') then
     begin
       TempList:= THashedStringList.Create;
       TempList2:= TMemIniFile.Create(FormMain.FrontendPath+'catver.ini');
       TempList2.ReadSectionValues('Category', TempList);
       FreeAndNil(TempList2);
       Categories:= THashedStringList.Create;
       Categories.BeginUpdate;
       for Loop:=0 to TempList.Count-1 do
       begin
         CategoryDescription:= TempList.Values[TempList.Names[Loop]];
         if ((Categories.IndexOf(CategoryDescription) = -1) and (CategoryDescription <> '')) then
            Categories.Add(CategoryDescription);
       end;
       Categories.Sort;
       Categories.EndUpdate;
       FreeAndNil(TempList);
       CategoriesList.Items.AddStrings(Categories);
       FreeAndNil(Categories);
       CategoriesList.ItemIndex:= 0;
     end;

  ListChanged:= False;
  if FileExists(FormMain.FrontendPath+'resources\CustomGames.dat') then
     begin
       CustomGameFile:= THashedStringList.Create;
       CustomGameFile.LoadFromFile(FormMain.FrontendPath+'resources\CustomGames.dat');
       if LoadCustomGames then
          begin
            ButtonEditGame.Enabled:= True;
            ButtonDeleteGame.Enabled:= True;
            ListCustomGames.ItemFocused:= ListCustomGames.Items[0];
            ListCustomGames.ItemIndex:= 0;
          end;
     end;
  ListCustomGames.OnColumnClick(Self, ListCustomGames.Column[0]);
  BrowseMode:= True;

  LabelStatusMode.Caption:= Format(FormMain.GetLanguageText('Custom Games', 'LabelStatusMode', 'Status: %s'),
                                   [FormMain.GetLanguageText('Custom Games', 'StatusModeBrowse', 'Browse Mode')]);
  LabelStatusMode.Refresh;
end;

procedure TFormCustomGames.ButtonDeleteGameClick(Sender: TObject);
var
  ROMDataLine: String;
  GameIndex: Integer;
begin
  if GenerateMessage(FormMain.GetLanguageText('Messages', 'DeleteGameTitle', 'Delete Game'),
                     Format(FormMain.GetLanguageText('Messages', 'DeleteGameMsg', 'Delete game "%s". Are you sure ?'), [ListCustomGames.ItemFocused.SubItems[13]]), 1) = mrYes then
     begin
       if FileExists(FormMain.FrontendPath+'resources\CustomGamesCmd.ini') then
          begin
            CustomGameCmd:= THashedStringList.Create;
            CustomGameCmd.LoadFromFile(FormMain.FrontendPath+'resources\CustomGamesCmd.ini');
            GameIndex:= CustomGameCmd.IndexOfName(ListCustomGames.ItemFocused.SubItems[13]+'Params');
            if GameIndex <> -1 then
               CustomGameCmd.Delete(GameIndex);
            GameIndex:= CustomGameCmd.IndexOfName(ListCustomGames.ItemFocused.SubItems[13]);
            if GameIndex <> -1 then
               CustomGameCmd.Delete(GameIndex);

            FreeAndNil(CustomGameCmd);
          end;

       if not Assigned(CustomGameFile) then
          begin
            CustomGameFile:= THashedStringList.Create;
            if FileExists(FormMain.FrontendPath+'resources\CustomGames.dat') then
               CustomGameFile.LoadFromFile(FormMain.FrontendPath+'resources\CustomGames.dat');
          end;

       if not Assigned(UnCustomGameFile) then
          begin
            UnCustomGameFile:= THashedStringList.Create;
            if FileExists(FormMain.FrontendPath+'resources\UnCustomGames.dat') then
               UnCustomGameFile.LoadFromFile(FormMain.FrontendPath+'resources\UnCustomGames.dat');
          end;

       FormMain.mROMIdentification:= ListCustomGames.ItemFocused.ImageIndex;
       FormMain.mDescription:= ListCustomGames.ItemFocused.Caption;
       FormMain.mYear:= ListCustomGames.ItemFocused.SubItems[0];
       FormMain.mManufacturer:= ListCustomGames.ItemFocused.SubItems[1];
       FormMain.mSound:= ListCustomGames.ItemFocused.SubItems[2];
       FormMain.mFrequency:= ListCustomGames.ItemFocused.SubItems[3];
       FormMain.mSamples:= ListCustomGames.ItemFocused.SubItems[4];
       FormMain.mControlType:= ListCustomGames.ItemFocused.SubItems[5];
       FormMain.mVideo:= ListCustomGames.ItemFocused.SubItems[6];
       FormMain.mOrientation:= ListCustomGames.ItemFocused.SubItems[7];
       FormMain.mResolution:= ListCustomGames.ItemFocused.SubItems[8];
       FormMain.mDriverStatus:= ListCustomGames.ItemFocused.SubItems[9];
       FormMain.mSoundStatus:= ListCustomGames.ItemFocused.SubItems[10];
       FormMain.mColorStatus:= ListCustomGames.ItemFocused.SubItems[11];
       FormMain.mMerged:= ListCustomGames.ItemFocused.SubItems[12];
       FormMain.mName:= ListCustomGames.ItemFocused.SubItems[13];
       FormMain.mClone:= ListCustomGames.ItemFocused.SubItems[14];
       FormMain.mCategory:= ListCustomGames.ItemFocused.SubItems[15];
       FormMain.mVersionAdded:= ListCustomGames.ItemFocused.SubItems[16];
       FormMain.mDriver:= ListCustomGames.ItemFocused.SubItems[17];

       ROMDataLine:= FormMain.PopulateROMDataLine;

       case FormMain.mROMIdentification of
         16:
          begin
            GameIndex:= CustomGameFile.IndexOf(ROMDataLine);
            if GameIndex > -1 then
               begin
                 ListCustomGames.Items.BeginUpdate;
                 ListCustomGames.Items.Delete(ListCustomGames.ItemFocused.Index);
                 ListCustomGames.Items.EndUpdate;

                 CustomGameFile.BeginUpdate;
                 CustomGameFile.Delete(GameIndex);
                 CustomGameFile.BeginUpdate;
                 ListChanged:= True;
                 ResetFields;
               end
            else
               GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                               FormMain.GetLanguageText('Messages', 'GameNotFound2Msg', 'This game was not found on file "CustomGames.dat"'), 2);
          end;
         17:
          begin
            GameIndex:= UnCustomGameFile.IndexOf(ROMDataLine);
            if GameIndex > -1 then
               begin
                 ListCustomGames.Items.BeginUpdate;
                 ListCustomGames.Items.Delete(ListCustomGames.ItemFocused.Index);
                 ListCustomGames.Items.EndUpdate;

                 UnCustomGameFile.BeginUpdate;
                 UnCustomGameFile.Delete(GameIndex);
                 UnCustomGameFile.BeginUpdate;
                 ListChanged:= True;
                 ResetFields;
               end
            else
               GenerateMessage(FormMain.GetLanguageText('Messages', 'ErrorTitle', 'Error'),
                               FormMain.GetLanguageText('Messages', 'GameNotFound2Msg', 'This game was not found on file "CustomGames.dat"'), 2);
          end;
       end;
     end;
  FormMain.SelectItem(0);
end;

procedure TFormCustomGames.ListCustomGamesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Item.Selected then
  if Item.Focused then
     UpdateFields(Item.Index);
end;

procedure TFormCustomGames.ListCustomGamesColumnClick(Sender: TObject;
  Column: TListColumn);

  function CustomGamesSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall;
  var
    Index: Integer;
  begin
    if ParamSort = 0 then
       Result:= CompareText(Item1.Caption, Item2.Caption)
    else
       begin
         Index:= ParamSort-1;
         Result:= CompareText(Item1.SubItems[Index], Item2.SubItems[Index]);
       end;
  end;

begin
  ListCustomGames.CustomSort(@CustomGamesSortProc, Column.Index);
end;

procedure TFormCustomGames.CommandLineButtonSelectClick(Sender: TObject);
begin
  FormMain.DialogOpenFile(2, FormMain.GetLanguageText('Custom Games', 'CommandLineDialogTitle', 'Select a file for the command line'), CommandLine);
  if CommandLine.Text <> '' then
     begin
       if Pos(' ', CommandLine.Text) <> 0 then
          CommandLine.Text:= Format('"%s"', [CommandLine.Text]);
     end;
end;

procedure TFormCustomGames.FormCreate(Sender: TObject);
begin
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\CustomGames.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\CustomGames.png');

  // Load Icons
  FormMain.LoadIcon(Page1Image, 'CustomGames.png');
  Page2Image.Bitmap.Assign(Page1Image.Bitmap);
  Page3Image.Bitmap.Assign(Page1Image.Bitmap);
  Page4Image.Bitmap.Assign(Page1Image.Bitmap);
end;

end.


