unit uArcadeRunExtraMAME;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, uCommon, StdCtrls, Buttons, AdvGroupBox,
  AdvOfficeButtons, ShadowLabel, ExtCtrls, PanelEx, MPCommonObjects,
  MPCommonUtilities, EasyListview, Menus, BarMenus, EditEx, ButtonsEx,
  BevelEx;

type
  TFileInfo = class(TEasyItemStored)
  private
    //fImageIndex: Integer;
    fFileName: String;
    fFileFolder: String;
    fFileFolderRelative: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
    fIsGameSubFolder: Boolean;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    //function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    //property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eFileName: String read fFileName write fFileName;
    property eFileFolder: String read fFileFolder write fFileFolder;
    property eFileFolderRelative: String read fFileFolderRelative write fFileFolderRelative;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
    property eIsGameSubFolder: Boolean read fIsGameSubFolder write fIsGameSubFolder;
  end;

type
  TFormArcadeRunGameExtraMAME = class(TForm)
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameName: TShadowLabel;
    BottomBar: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonAbort: TBitBtnEx;
    LabelInfo: TShadowLabel;
    SystemIcon: TImage;
    LabelSoftwareListTitle: TShadowLabel;
    NotebookPages: TNotebook;
    PageButtonInput: TSpeedButtonEx;
    PageButtonSaveState: TSpeedButtonEx;
    PageButtonMemoryCard: TSpeedButtonEx;
    PageButtonRecordMovie: TSpeedButtonEx;
    PagesButtonBottomLine: TBevelEx;
    Enabled_PlaybackRecordInput: TAdvOfficeCheckBoxEx;
    InputPlayback: TAdvOfficeRadioButtonEx;
    InputFileName: TEditEx;
    InputRecord: TAdvOfficeRadioButtonEx;
    InputExitEmulatorAfterInputPlayback: TAdvOfficeCheckBoxEx;
    InputRecordTimecodeFile: TAdvOfficeCheckBoxEx;
    ButtonInputResetFileName: TBitBtnEx;
    Enabled_LoadSaveState: TAdvOfficeCheckBoxEx;
    Enabled_InsertMemoryCard: TAdvOfficeCheckBoxEx;
    Enabled_RecordMovie: TAdvOfficeCheckBoxEx;
    LabelInsertMemoryCard_Slot1: TShadowLabel;
    LabelInsertMemoryCard_Slot2: TShadowLabel;
    InsertMemoryCard_Slot1: TEditEx;
    InsertMemoryCard_Slot2: TEditEx;
    ButtonInsertMemoryCard_Slot1_SelectFile: TBitBtnEx;
    ButtonInsertMemoryCard_Slot1_Clear: TBitBtnEx;
    ButtonInsertMemoryCard_Slot1_LastUsed: TBitBtnEx;
    ButtonInsertMemoryCard_Slot2_SelectFile: TBitBtnEx;
    ButtonInsertMemoryCard_Slot2_LastUsed: TBitBtnEx;
    ButtonInsertMemoryCard_Slot2_Clear: TBitBtnEx;
    ButtonRecordMovieResetFileNameTitle: TBitBtnEx;
    ButtonRecordMovieResetFileName: TBitBtnEx;
    RecordMovieFileName: TEditEx;
    RecordMovieWAV: TAdvOfficeRadioButtonEx;
    RecordMovieMNG: TAdvOfficeRadioButtonEx;
    RecordMovieAVI: TAdvOfficeRadioButtonEx;
    LabelInputFileName: TShadowLabel;
    LabelLoadSaveStateNotSupportedMsg: TShadowLabel;
    LabelMachineInUse: TShadowLabel;
    PopupELV: TBcBarPopupMenu;
    PopupInputRenameFile: TMenuItem;
    PopupInputDeleteFile: TMenuItem;
    PanelDisabledInput: TPanel;
    PanelDisabledSaveState: TPanel;
    PanelDisabledMemoryCard: TPanel;
    PanelDisabledRecordMovie: TPanel;
    PopupMemoryCardAssignToSlot1: TMenuItem;
    PopupMemoryCardAssignToSlot2: TMenuItem;
    N1: TMenuItem;
    AutoSaveState: TAdvOfficeCheckBoxEx;
    PanelDisabledSaveStateNotSupportedMsg: TPanel;
    ButtonInputResetFileNameTitle: TBitBtnEx;
    LabelRecordMovieFileName: TShadowLabel;
    LabelRecordMovieRootFolder: TShadowLabel;
    MemoryCardFileFolderPanel: TPanelEx;
    MemoryCardListView: TEasyListview;
    LabelMemoryCardSelectedFileFolder: TShadowLabel;
    LabelInsertMemoryCard_Slot3: TShadowLabel;
    LabelInsertMemoryCard_Slot4: TShadowLabel;
    InsertMemoryCard_Slot3: TEditEx;
    InsertMemoryCard_Slot4: TEditEx;
    ButtonInsertMemoryCard_Slot3_SelectFile: TBitBtnEx;
    ButtonInsertMemoryCard_Slot3_Clear: TBitBtnEx;
    ButtonInsertMemoryCard_Slot3_LastUsed: TBitBtnEx;
    ButtonInsertMemoryCard_Slot4_SelectFile: TBitBtnEx;
    ButtonInsertMemoryCard_Slot4_LastUsed: TBitBtnEx;
    ButtonInsertMemoryCard_Slot4_Clear: TBitBtnEx;
    PopupMemoryCardAssignToSlot3: TMenuItem;
    PopupMemoryCardAssignToSlot4: TMenuItem;
    PanelInputListView: TPanelEx;
    LabelInputSelectedFileFolder: TShadowLabel;
    InputListView: TEasyListview;
    PanelSaveStateListView: TPanelEx;
    SaveStateListView: TEasyListview;
    LabelSaveStateSelectedFileFolder: TShadowLabel;
    PanelRecordMovieListView: TPanelEx;
    LabelRecordMovieSelectedFileFolder: TShadowLabel;
    RecordMovieListView: TEasyListview;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure InputPlaybackClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot1_LastUsedClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot2_LastUsedClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot1_ClearClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot2_ClearClick(Sender: TObject);
    procedure PageButtonInputClick(Sender: TObject);
    procedure Enabled_PlaybackRecordInputClick(Sender: TObject);
    procedure InputFileNameKeyPress(Sender: TObject; var Key: Char);
    procedure InputListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function InputListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure InputListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure InputListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonInputResetFileNameClick(Sender: TObject);
    procedure SaveStateListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function SaveStateListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure SaveStateListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SaveStateListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure Enabled_LoadSaveStateClick(Sender: TObject);
    procedure InputListViewItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure InputListViewItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SaveStateListViewItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure SaveStateListViewItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure Enabled_InsertMemoryCardClick(Sender: TObject);
    procedure MemoryCardListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function MemoryCardListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure MemoryCardListViewItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure MemoryCardListViewItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure MemoryCardListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MemoryCardListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure PopupELVPopup(Sender: TObject);
    procedure Enabled_RecordMovieClick(Sender: TObject);
    procedure PopupInputRenameFileClick(Sender: TObject);
    procedure PopupInputDeleteFileClick(Sender: TObject);
    procedure MemoryCardListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure PopupMemoryCardAssignToSlot1Click(Sender: TObject);
    procedure InsertMemoryCard_Slot1KeyPress(Sender: TObject;
      var Key: Char);
    procedure InsertMemoryCard_Slot2KeyPress(Sender: TObject;
      var Key: Char);
    procedure ButtonInsertMemoryCard_Slot1_SelectFileClick(
      Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot2_SelectFileClick(
      Sender: TObject);
    procedure RecordMovieAVIClick(Sender: TObject);
    procedure RecordMovieListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function RecordMovieListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure RecordMovieListViewItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure RecordMovieListViewItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure RecordMovieListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure RecordMovieListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonRecordMovieResetFileNameClick(Sender: TObject);
    procedure RecordMovieFileNameChange(Sender: TObject);
    procedure RecordMovieFileNameKeyPress(Sender: TObject; var Key: Char);
    procedure InsertMemoryCard_Slot3KeyPress(Sender: TObject;
      var Key: Char);
    procedure InsertMemoryCard_Slot4KeyPress(Sender: TObject;
      var Key: Char);
    procedure ButtonInsertMemoryCard_Slot3_SelectFileClick(
      Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot4_SelectFileClick(
      Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot3_LastUsedClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot4_LastUsedClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot3_ClearClick(Sender: TObject);
    procedure ButtonInsertMemoryCard_Slot4_ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FolderInput, FolderState, FolderMemoryCard, FolderRecordMovie: String;
    InputPlayback_CurrentFile, InputRecord_CurrentFile: String;
    RecordMovieAVI_CurrentFile, RecordMovieWAV_CurrentFile, RecordMovieMNG_CurrentFile: String;
    InputExitEmuAfterPlay_LastChecked, InputRecTimeCodeFile_LastChecked, SaveStateAuto_LastChecked: Boolean;
    SoftwareListFolder, MachineNameFolder: String;
    MemCardLastUsed_MachineName: String;
    MemCardFileExtFilter: String;
    ActiveFileID: Integer; // what set type is this (gamename, clone, bios)
    FoundInputExtra: Boolean; // sets to FALSE is settings "record_timecode" and "exit_after_playback" do not exist in mame.ini
    procedure GetFiles(FeatureIndex: Byte; CheckGameNameSubFolder: Boolean);
    //procedure SelectFileDialog(FeatureIndex: Byte);
    procedure CheckMemoryCardSupport;
    procedure UpdateLastMemoryCardUsed;
    procedure CheckSaveStateSupport;
    procedure DisablePage(PageIndex: Byte);
    procedure ParseMAMEIni;
    procedure ReadMAMESettings(const iniFile: String; IsMAMEDefaultSettings: Boolean = False);
    procedure ELV_SelectItem(ELV_Holder: TEasyListView; ItemHolder: TEasyItem);
    function  GetRecordMovieFileExtension: String;
    procedure RecordMovieFilter_FileType;
    procedure ReSelectInputFile;
    procedure ReSelectSaveStateFile;
    procedure ReSelectRecordMovieFile;
    procedure EditFileName(ELV_Holder: TEasyListView);
    procedure EditFileName_EndEdit_ELV(ELV_Holder: TEasyListView);
    procedure DeleteFileName(ELV_Holder: TEasyListView);
    procedure ValidateKeyActions_ELV(ELV_Holder: TEasyListView; var CharCode: Word; var Shift: TShiftState);
    function  GetItem_ELV(const FileFullPath: String; ELV_Holder: TEasyListView; CheckFullPath: Boolean = True): TEasyItem;
    procedure AddMemoryCardToSlot(SlotIndex: ShortInt = -1);
    function  MountCommandLine: Boolean;
    procedure SetBottomButtons(IsEnabled: Boolean);
    function  CheckInvalidEditBoxKeyPress(var iKey: Char): Boolean;
    procedure SetCheckBoxStateColor(CheckBoxSource: TAdvOfficeCheckBoxEx);
  public
    { Public declarations }
    sysID: Integer;
    MachineNameToRun, CommandLine, EmulatorFileName: String;
    IsMultiSlotGame: Boolean;
  end;

const
  RecordMovieSubDir: String = 'record_video\';
var
  FormArcadeRunGameExtraMAME: TFormArcadeRunGameExtraMAME;

implementation

uses uMain;

{$R *.dfm}

function TFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFileName;
    1: Result:= eSizeText;
    2: Result:= eDateTimeText;
    3: Result:= eFileFolderRelative;
  end;
end;

procedure TFormArcadeRunGameExtraMAME.GetFiles(FeatureIndex: Byte; CheckGameNameSubFolder: Boolean);

  function AddFile_ELV(ELV_Holder: TEasyListView; const iFileName, iFolderName: String; IsGameSubFolder: Boolean): Boolean;
  var
    Item: TEasyItem;
    iRelative: String;
  begin
    case FeatureIndex of
      20,21: iRelative:= FolderInput;
      22: iRelative:= FolderState;
      23, 24, 25: iRelative:= FolderRecordMovie; // record .avi; .wav; .mng
      32: iRelative:= FolderMemoryCard;
    end;

    iRelative:= StringReplace(iFolderName, iRelative, '', [rfIgnoreCase]);
    Item:= ELV_Holder.Items.AddCustom(TFileInfo, nil);
    {case FormSelectFile.Tag of
      20, 21: TFileInfo(Item).eImageIndex:= 18; // Input
          22: TFileInfo(Item).ImageIndex:= 16; // Save state
          23: TFileInfo(Item).eImageIndex:= 00; // Wave
      24, 25: TFileInfo(Item).eImageIndex:= 06; // MNG, AVI
      26, 29, 30: TFileInfo(Item).eImageIndex:= 07; // Left panel filter, Select Font File
      27, 28, 31: TFileInfo(Item).eImageIndex:= 06; // PNG
      32:  // Memory Card files
    end;}
    TFileInfo(Item).eFileName:= iFileName;
    TFileInfo(Item).eFileFolder:= iFolderName;
    TFileInfo(Item).eFileFolderRelative:= iRelative;
    TFileInfo(Item).eSize:= GetFileSize(iFolderName+iFileName);
    TFileInfo(Item).eSizeText:= FormMain.GetSizeType(TFileInfo(Item).eSize, False);
    TFileInfo(Item).eDateTime:= FileAgeW(iFolderName+iFileName);
    TFileInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TFileInfo(Item).eDateTime);
    TFileInfo(Item).eIsGameSubFolder:= IsGameSubFolder;
  end;

  function ELV_StartAdd(ELV_Holder: TEasyListView): Boolean;
  begin
    Result:= True;
    ELV_Holder.BeginUpdate;
    ELV_Holder.Items.ReIndexDisable:= True;
  end;

  function ELV_EndAdd(ELV_Holder: TEasyListView): Boolean;
  begin
    Result:= True;
    ELV_Holder.Items.ReIndexDisable:= False;
    ELV_Holder.Sort.SortAll;
    ELV_Holder.EndUpdate;
    if ELV_Holder.Scrollbars.VertBarVisible then
       begin
         ELV_Holder.Header.Columns[0].Width:= ELV_Holder.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
         ELV_Holder.Sort.SortAll;
       end;
  end;

  function GetFilesMulti(const FolderStr, FileMaskStr: String): Boolean;
  var
    Search: TSearchRec;
  begin
    if FindFirst(FolderStr+FileMaskStr, $37, Search) = 0 then
    begin
      repeat
        if (Search.Name <> '.') and (Search.Name <> '..') then
        begin
          //if not (Search.Attr and $10 = $10) then // is is a sub-folder inside the main folder ??? ignore it...
          if (Search.Attr and $10 <> $10) then
          begin
            case FeatureIndex of
              20, 21: AddFile_ELV(InputListView, Search.Name, FolderStr, True); // input
              22: AddFile_ELV(SaveStateListView, Search.Name, FolderStr, True); // save state
              23, 24, 25: AddFile_ELV(RecordMovieListView, Search.Name, FolderStr, True); // record movie (.avi; .wav; .nng)
              32: AddFile_ELV(MemoryCardListView, Search.Name, FolderStr, True); // memory card
            end;
          end;
        end;
      until (FindNext(Search) <> 0);
    end;
    FindClose(Search);
  end;

var
  iFolder, iFileMask, iFileExtension, iFolderRelative: String;
begin
  iFolder:= '';
  case FeatureIndex of
    20, 21: // input
      begin
        iFolder:= FolderInput;
        iFileMask:= '*.inp';
        iFileExtension:= '.inp';
      end;
    22: // save state
      begin
        iFolder:= FolderState;
        if sysID = idSupermodel then
           begin
             iFileMask:= FormMain.MemGameInfo.eName+'.st*';
             iFileExtension:= '.st*';
           end
        else
           begin
             // MAME
             iFileMask:= '*.sta';
             iFileExtension:= '.sta';
           end;
      end;
    23: // record movie (.wav)
      begin
        iFolder:= FolderRecordMovie;
        iFileMask:= '*.wav';
        iFileExtension:= '.wav';
      end;
    24: // record movie (.mng)
      begin
        iFolder:= FolderRecordMovie;
        iFileMask:= '*.mng';
        iFileExtension:= '.mng';
      end;
    25: // record movie (.avi)
      begin
        iFolder:= FolderRecordMovie;
        iFileMask:= '*.avi';
        iFileExtension:= '.avi';
      end;
    32: // memory card
      begin
        iFolder:= FolderMemoryCard;
        iFileMask:= '*.*'; // '*.mc';
        iFileExtension:= '.*';//'.mc';
      end;
  end;
  if iFolder = '' then
     Exit;
  iFolderRelative:= iFolder;

  case FeatureIndex of
    20, 21: ELV_StartAdd(InputListView); // input
    22: ELV_StartAdd(SaveStateListView); // save state
    23, 24, 25: ELV_StartAdd(RecordMovieListView); // record movie (.avi; .wav; .mng)
    32: ELV_StartAdd(MemoryCardListView); // memory card
  end;

  // MachineNameFolder is empty for arcade games/machines
  if not (FeatureIndex in [23, 24, 25]) then
     iFolder:= iFolder+MachineNameFolder; // "inp_dir\arcade_gamename.inp" (arcade game)
  // EL will not allow softlist games to be in the "inp_dir\expert11\" folder because you might run a MSX1 game with a MSX2 machine
  // this is for arcade games only
  // "memcard\psu\gamefile.*" -> for PlayStation non-arcade memory cards (software lists)

  case FeatureIndex of
    32:
      begin
        GetFilesMulti(iFolder, FormMain.MemGameInfo.eName+iFileExtension); // for "memcard\psu\gamename.*"...
        GetFilesMulti(iFolder, FormMain.MemGameInfo.eTitle+iFileExtension); // for "memcard\psu\game_title.*"...
      end;
    23, 24, 25:
      begin
        if FileExists(iFolder+FormMain.MemGameInfo.eName+iFileExtension) then
           AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // record movie (.avi; .wav; .mng)

        if FileExists(iFolder+FormMain.MemGameInfo.eTitle+iFileExtension) then
           AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder, False); // record movie (.avi; .wav; .mng)

        //20, 21: AddFile_ELV(InputListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // input // will not allow "mame_inpdir\expert11\gooniesb.inp" file!!!!!
        //22: AddFile_ELV(SaveStateListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // save state // MAME doesn't support this, files must be in "\gamename\" subfolder!!!!!
      end;
  end;
  
  if FeatureIndex = 32 then
     begin
       GetFilesMulti(iFolder, FormMain.MemGameInfo.eName+iFileExtension); // for "memcard\psu\gamename.*"...
       GetFilesMulti(iFolder, FormMain.MemGameInfo.eTitle+iFileExtension); // for "memcard\psu\game_title.*"...
     end
  else
  begin
    if FileExists(iFolder+FormMain.MemGameInfo.eName+iFileExtension) then
       begin
         case FeatureIndex of
           20, 21:
             begin
               if MachineNameFolder = '' then // only for MAME arcade; softlist games cannot be used here! (March 10, 2019)
                  AddFile_ELV(InputListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // input // will not allow "mame_inpdir\expert11\gooniesb.inp" file!!!!!
             end;
           //22: AddFile_ELV(SaveStateListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // save state // MAME doesn't support this, files must be in "\gamename\" subfolder!!!!!
           23, 24, 25: AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // record movie (.avi; .wav; .mng)
           // no longer used! 32: AddFile_ELV(MemoryCardListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder, False); // memory card
         end;
       end;
    if FeatureIndex in [23, 24, 25] then //, 32] then // [20, 21, 23, 24, 25, 32] then
    begin
      if FileExists(iFolder+FormMain.MemGameInfo.eTitle+iFileExtension) then
         begin
           case FeatureIndex of
             //20, 21: AddFile_ELV(InputListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder, False); // for "inputdir\gametitle.inp"; "inputdir\expert11\gametitle.inp"
             23, 24, 25: AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder, False); // record movie (.avi; .wav; .mng)
             // no longer used! 32: AddFile_ELV(MemoryCardListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder, False); // for "memcard\psu\gametitle.mc"
           end;
         end;
    end;
  end;

  if SoftwareListFolder <> '' then
     begin
       // "inp_dir\expert11\msx1_cart\gooniesb.inp"
       // "sta_dir\expert11\msx1_cart\gooniesb\gooniesb.sta"

       // "memcard_dir\machine_name\softlist_name\memcard-filename.*
       
       // "memcard_dir\psu\psx\wildarms.*" -> game name
       // "memcard_dir\psu\psx\Wild Arms (USA).*" -> game title
       // "memcard_dir\psu\psx\wildarms\wildarms.*" -> gam name
       // "memcard_dir\psu\psx\wildarms\Wild Arms (USA).*" -> game title
       if FeatureIndex = 32 then
       begin
         GetFilesMulti(iFolder+SoftwareListFolder, FormMain.MemGameInfo.eName+iFileExtension); // for "memcard\psu\psx\gamename.*"...
         GetFilesMulti(iFolder+SoftwareListFolder, FormMain.MemGameInfo.eTitle+iFileExtension); // for "memcard\psu\psx\game_title.*"...
       end
       else
       begin
         if FileExists(iFolder+SoftwareListFolder+FormMain.MemGameInfo.eName+iFileExtension) then
            begin
              case FeatureIndex of
                20, 21: AddFile_ELV(InputListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder+SoftwareListFolder, False); // input "inpdir\expert11\msx1_cart\gooniesb.inp"
                23, 24, 25: AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder+SoftwareListFolder, False); // record movie (.avi; .wav; .mng)
                //22: AddFile_ELV(SaveStateListView, FormMain.MemGameInfo.eName+iFileExtension, iFolder+SoftwareListFolder, False); // save state .... MAME doesn't support this! August 25, 2016
              end;
            end;
         if FeatureIndex in [20, 21, 23, 24, 25] then //, 32] then
         begin
           if FileExists(iFolder+SoftwareListFolder+FormMain.MemGameInfo.eTitle+iFileExtension) then
              begin
                case FeatureIndex of
                  20, 21: AddFile_ELV(InputListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder+SoftwareListFolder, False); // "inputdir\expert11\msx1_cart\gametitle.inp"
                  23, 24, 25: AddFile_ELV(RecordMovieListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder+SoftwareListFolder, False); // record movie (.avi; .wav; .mng)
                  // no longer used! 32: AddFile_ELV(MemoryCardListView, FormMain.MemGameInfo.eTitle+iFileExtension, iFolder+SoftwareListFolder, False); // "memcard\psu\psx\gametitle.mc"
                end;
              end;
         end;
       end;

       case FeatureIndex of
         20, 21, 22, 32: iFolder:= iFolder+SoftwareListFolder+FormMain.MemGameInfo.eName+'\'; // "inp_dir\expert11\gooniesb\multi_filenames.inp"
         23, 24, 25: iFolder:= iFolder+FormMain.MemGameInfo.eName+'\'; // "inp_dir\expert11\gooniesb\multi_filenames.inp"
       end;
     end
  else
     if sysID <> idSupermodel then // Supermodel doesn't not support "\Saves\gamename\name.st?" game name sub-folder scan
        iFolder:= iFolder+FormMain.MemGameInfo.eName+'\'; // "inp_dir\gamename\multi_filenames.inp" (arcade game)

  if FeatureIndex = 32 then
     GetFilesMulti(iFolder, iFileMask) // for "memcard\gamename\*.*"... or "memcard\psu\psx\gamename\*.*" (for softlists)
     //GetFilesMulti(iFolder, iFileMask+'*') // for "memcard\gamename\*.mc*"... or "memcard\psu\psx\gamename\*.mc*" (for softlists)
  else
     GetFilesMulti(iFolder, iFileMask); // input, save state, record movie must be in a "\gamename\" sub-folder... ?!

  case FeatureIndex of
    20, 21: ELV_EndAdd(InputListView); // input
    22: ELV_EndAdd(SaveStateListView); // save state
    23, 24, 25: ELV_EndAdd(RecordMovieListView); // record movie (.avi; .wav; .mng)
    32: ELV_EndAdd(MemoryCardListVieW); // memory card
  end;
end;

procedure TFormArcadeRunGameExtraMAME.CheckMemoryCardSupport;
var
  MemCardSlots: TStringList;
  sectionStr, MemCardLastUsed_MachineName: String;
  Loop, iTop, iHeight: Integer;
  MemcardFile: TMemIniFile;
begin
  MemCardFileExtFilter:= '';
  if (FormMain.MemGameInfo.eSoftwareName <> '') and (MachineNameToRun = '') then
     begin
       DisablePage(2); //InsertMemoryCard_Box);
       Exit;
     end;
  if not FileExists(FormMain.GetMemcardListFile(FormMain.MemGameInfo.eSystemID)) then
     begin
       DisablePage(2); //InsertMemoryCard_Box);
       Exit;
     end;
  MemCardFile:= TMemIniFile.Create(FormMain.GetMemcardListFile(FormMain.MemGameInfo.eSystemID));
  //MemcardFile:= THashedStringList.Create;
  //MemcardFile.LoadFromFile(FormMain.GetMemcardListFile(FormMain.MemGameInfo.eSystemID));
  
  if FormMain.MemGameInfo.eSoftwareName = '' then
     begin
       if FormMain.IsNeoGeoDriver(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eDriverName, FormMain.MemGameInfo.eBiosName, True) then
          sectionStr:= 'neogeo'
       else
          sectionStr:= FormMain.MemGameInfo.eName
     end
  else
     begin
       sectionStr:= MachineNameToRun;
       // var MachineNameToRun comes from uMain.ExecuteGame()
     end;
  MemCardLastUsed_MachineName:= sectionStr;

  MemCardSlots:= TStringList.Create;
  MemCardFile.ReadSectionValues(sectionStr, MemCardSlots);
  FreeAndNil(MemcardFile);

  if MemCardSlots.Count = 0 then
     begin
       DisablePage(2); //InsertMemoryCard_Box)
       MemCardLastUsed_MachineName:= '';
     end
  else
     begin
       MemCardFileExtFilter:= MemCardSlots[0];
       Loop:= PosEx(';', MemCardFileExtFilter); // first "  ;  " char in the string
       if Loop = 0 then
          begin
            //SetLength(MemCardFileExtArray, 1);
            //MemCardFileExtArray[1]:= '.'+MemCardFileExtFilter;
            MemCardFileExtFilter:= '*.'+MemCardFileExtFilter+'?';
            //MemCardFileExtFilter:= '('+MemCardFileExtFilter+')|'+MemCardFileExtFilter;
          end
       else
          begin
            MemCardFileExtfilter:= StringReplace(MemCardFileExtFilter, ';', '?;*.', [rfReplaceAll]);
            MemCardFileExtfilter:= '*.'+MemCardFileExtfilter+'?'
          end;
       MemCardFileExtFilter:= 'Memory Card Files ('+MemCardFileExtFilter+')|'+MemCardFileExtFilter+'|All Files (*.*)|*.*';

       Loop:= MemCardSlots.Count-1; // -1 because the first entry is the file extension (can be multiple extensions)
       if Loop < 4 then
          begin
            case Loop of
              1: iTop:= 53;
              2: iTop:= 80;
              3: iTop:= 105;
            end;
            iHeight:= MemoryCardFileFolderPanel.Top-iTop;
            MemoryCardFileFolderPanel.Top:= iTop;
            MemoryCardFileFolderPanel.Height:= MemoryCardFileFolderPanel.Height+iHeight;
          end;
       for Loop:=1 to MemCardSlots.Count-1 do
       begin
         case Loop of
           1: LabelInsertMemoryCard_Slot1.Hint:= MemCardSlots[Loop]; // get MAME's parameter string for the selected machine
           2:
             begin
               LabelInsertMemoryCard_Slot2.Hint:= MemCardSlots[Loop]; // get MAME's parameter string for the selected machine
               LabelInsertMemoryCard_Slot2.Enabled:= LabelInsertMemoryCard_Slot2.Hint <> '';
               InsertMemoryCard_Slot2.Enabled:= LabelInsertMemoryCard_Slot2.Enabled;
               ButtonInsertMemoryCard_Slot2_SelectFile.Enabled:= LabelInsertMemoryCard_Slot2.Enabled;
               ButtonInsertMemoryCard_Slot2_LastUsed.Enabled:= LabelInsertMemoryCard_Slot2.Enabled;
               ButtonInsertMemoryCard_Slot2_Clear.Enabled:= LabelInsertMemoryCard_Slot2.Enabled;
             end;
           3:
             begin
               LabelInsertMemoryCard_Slot3.Hint:= MemCardSlots[Loop]; // get MAME's parameter string for the selected machine
               LabelInsertMemoryCard_Slot3.Enabled:= LabelInsertMemoryCard_Slot3.Hint <> '';
               InsertMemoryCard_Slot3.Enabled:= LabelInsertMemoryCard_Slot3.Enabled;
               ButtonInsertMemoryCard_Slot3_SelectFile.Enabled:= LabelInsertMemoryCard_Slot3.Enabled;
               ButtonInsertMemoryCard_Slot3_LastUsed.Enabled:= LabelInsertMemoryCard_Slot3.Enabled;
               ButtonInsertMemoryCard_Slot3_Clear.Enabled:= LabelInsertMemoryCard_Slot3.Enabled;
             end;
           4:
             begin
               LabelInsertMemoryCard_Slot4.Hint:= MemCardSlots[Loop]; // get MAME's parameter string for the selected machine
               LabelInsertMemoryCard_Slot4.Enabled:= LabelInsertMemoryCard_Slot4.Hint <> '';
               InsertMemoryCard_Slot4.Enabled:= LabelInsertMemoryCard_Slot4.Enabled;
               ButtonInsertMemoryCard_Slot4_SelectFile.Enabled:= LabelInsertMemoryCard_Slot4.Enabled;
               ButtonInsertMemoryCard_Slot4_LastUsed.Enabled:= LabelInsertMemoryCard_Slot4.Enabled;
               ButtonInsertMemoryCard_Slot4_Clear.Enabled:= LabelInsertMemoryCard_Slot4.Enabled;
             end;
         end;
       end;
       if FileExists(FormMain.GetMemcardLastUsedFile(FormMain.MemGameInfo.eSystemID, MemCardLastUsed_MachineName)) then
       begin
         MemCardSlots.Clear;
         MemCardFile:= TMemIniFile.Create(FormMain.GetMemcardLastUsedFile(FormMain.MemGameInfo.eSystemID, MemCardLastUsed_MachineName));
         MemCardFile.ReadSectionValues(FormMain.MemGameInfo.eName, MemCardSlots);
         FreeAndNil(MemCardFile);
         InsertMemoryCard_Slot1.Hint:= MemcardSlots.Values['slot1'];
         InsertMemoryCard_Slot2.Hint:= MemcardSlots.Values['slot2'];
         InsertMemoryCard_Slot3.Hint:= MemcardSlots.Values['slot3'];
         InsertMemoryCard_Slot4.Hint:= MemcardSlots.Values['slot4'];
         InsertMemoryCard_Slot1.Text:= InsertMemoryCard_Slot1.Hint;
         InsertMemoryCard_Slot2.Text:= InsertMemoryCard_Slot2.Hint;
         InsertMemoryCard_Slot3.Text:= InsertMemoryCard_Slot3.Hint;
         InsertMemoryCard_Slot4.Text:= InsertMemoryCard_Slot4.Hint;
       end;
     end;
  FreeAndNil(MemcardSlots);
end;

procedure TFormArcadeRunGameExtraMAME.UpdateLastMemoryCardUsed;
var
  MemCardLastUsed: TMemIniFile;
  mFolder: String;
begin
  if not Enabled_InsertMemoryCard.Checked then
     Exit;
  if (InsertMemoryCard_Slot1.Text = '') and (InsertMemoryCard_Slot2.Text = '') and
     (InsertMemoryCard_Slot3.Text = '') and (InsertMemoryCard_Slot4.Text = '') then
     Exit;

  mFolder:= FormMain.GetMemcardLastUsedFile(FormMain.MemGameInfo.eSystemID, MemCardLastUsed_MachineName);
  if mFolder = '' then
     Exit;
  ForceDirectories(ExtractFilePath(mFolder)); // make sure the destination folder already exists...
  MemCardLastUsed:= TMemIniFile.Create(FormMain.GetMemcardLastUsedFile(FormMain.MemGameInfo.eSystemID, MemCardLastUsed_MachineName));
  MemCardLastUsed.WriteString(FormMain.MemGameInfo.eName, 'slot1', InsertMemoryCard_Slot1.Text);
  if InsertMemoryCard_Slot2.Enabled then
     MemCardLastUsed.WriteString(FormMain.MemGameInfo.eName, 'slot2', InsertMemoryCard_Slot2.Text);
  if InsertMemoryCard_Slot3.Enabled then
     MemCardLastUsed.WriteString(FormMain.MemGameInfo.eName, 'slot3', InsertMemoryCard_Slot3.Text);
  if InsertMemoryCard_Slot4.Enabled then
     MemCardLastUsed.WriteString(FormMain.MemGameInfo.eName, 'slot4', InsertMemoryCard_Slot4.Text);
  MemCardLastUsed.UpdateFile;
  FreeAndNil(MemCardLastUsed);
end;

procedure TFormArcadeRunGameExtraMAME.CheckSaveStateSupport;
var
  Group: TEasyGroup;
  Item: TEasyItem;
  GameFound: Boolean;
begin
  if sysID = idSupermodel then
     Exit; // this validation is only for MAME
  if FormMain.MemGameInfo.eSoftwareName = '' then
     begin
       if FormMain.MemGameInfo.eSaveState <> 1 then
          LabelLoadSaveStateNotSupportedMsg.Visible:= True;
     end
  else
     begin
       if MachineNameToRun = '' then
          begin
            // there is no MAME machine selected to run the software list game....
            DisablePage(1);
            Exit;
          end;
     end;
  GameFound:= False;
  if FormMain.IsGroupedView then
    begin
      Group:= FormMain.GamesListView.Groups.FirstGroup;
      repeat
        if (uMain.TGroupInfo(Group).eSystemID = FormMain.MemGameInfo.eSystemID) and (uMain.TGroupInfo(Group).eSoftwareName = '') then
        begin
          Item:= FormMain.GamesListView.Groups.FirstInGroup(Group);
          repeat
            if uMain.TEasyGameInfo(Item).eName = MachineNameToRun then
               begin
                 LabelMachineInUse.Hint:= uMain.TEasyGameInfo(Item).eTitle;
                 GameFound:= True;
                 if uMain.TEasyGameInfo(Item).eSaveState <> 1 then
                    LabelLoadSaveStateNotSupportedMsg.Visible:= True;
               end;
            Item:= FormMain.GamesListView.Groups.NextInGroup(Group, Item);
          until (Item = nil) or GameFound;
        end;
        Group:= FormMain.GamesListView.Groups.NextGroup(Group);
      until (Group = nil) or GameFound;
    end
    else
    begin
      Item:= FormMain.GamesListView.Groups.FirstItem;
      repeat
        if (uMain.TEasyGameInfo(Item).eSystemID = FormMain.MemGameInfo.eSystemID) and (uMain.TEasyGameInfo(Item).eSoftwareName = '') then
           begin
             if uMain.TEasyGameInfo(Item).eName = MachineNameToRun then
                begin
                  LabelMachineInUse.Hint:= uMain.TEasyGameInfo(Item).eTitle;
                  GameFound:= True;
                  if uMain.TEasyGameInfo(Item).eSaveState <> 1 then
                     LabelLoadSaveStateNotSupportedMsg.Visible:= True;
                end;
           end;
        Item:= FormMain.GamesListView.Groups.NextItem(Item);
      until (Item = nil) or GameFound;
    end;
end;

procedure TFormArcadeRunGameExtraMAME.DisablePage(PageIndex: Byte);
begin
  case PageIndex of
    0:
      begin
        PageButtonInput.Enabled:= False;
        Enabled_PlaybackRecordInput.Checked:= False;
      end;
    1:
      begin
        PageButtonSaveState.Enabled:= False;
        Enabled_LoadSaveState.Checked:= False;
      end;
    2:
      begin
        PageButtonMemoryCard.Enabled:= False;
        Enabled_InsertMemoryCard.Checked:= False;
      end;
    3:
      begin
        PageButtonRecordMovie.Enabled:= False;
        Enabled_RecordMovie.Checked:= False;
      end;
  end;
end;

procedure TFormArcadeRunGameExtraMAME.ParseMAMEIni;
var
  Loop: Integer;
  strFile: String;
begin
  strFile:= FormMain.GetArcadeEmuIniFileName(FormMain.MemGameInfo.eSystemID, EmulatorFileName);//FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID]);
  ReadMAMESettings(strFile, True); // read mame.ini first...

  ActiveFileID:= -1;

  if FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
     ActiveFileID:= 10
  else
  begin
    case FormMain.GameIsClone(FormMain.MemGameInfo.eClone) of
      True : ActiveFileID:= 11;
      False: ActiveFileID:= 12;
    end;
  end;

  for Loop:= 1 to MaxIniCountMAME do
  begin
    if Loop <= ActiveFileID  then
    begin
      strFile:= FormMain.GetCustomIniFileMAME(Loop);
      if strFile <> '' then
      begin
        if Loop = 9 then // drivername.ini
           begin
             if FileExists(FormMain.IniFilesDir[FormMain.MemGameInfo.eSystemID]+strFile+'.ini') then
                strFile:= FormMain.IniFilesDir[FormMain.MemGameInfo.eSystemID]+strFile+'.ini'
             else
                strFile:= FormMain.IniFilesDir[FormMain.MemGameInfo.eSystemID]+'source\'+strFile+'.ini';
           end
        else
           strFile:= FormMain.IniFilesDir[FormMain.MemGameInfo.eSystemID]+strFile+'.ini';

        ReadMAMESettings(strFile); // read all gamename.ini options
      end;
    end
    else
       Break;
  end;
end;

procedure TFormArcadeRunGameExtraMAME.ReadMAMESettings(const iniFile: String; IsMAMEDefaultSettings: Boolean = False);
var
  MAMEIniFile: THashedStringList;
  TextLine, EntryString, iFolder: String;
  Loop: Integer;
begin
  if not FileExists(EmulatorFileName) then
     Exit;

  if not FileExists(iniFile) then
     Exit;

  //if IsMAMEDefaultSettings then
  //   begin
  //     //FolderInput:= 'inp';
  //     //FolderState:= 'sta';
  //     //FolderMemoryCard:= 'memcard';
  //     //FolderRecordMovie:= FormMain.imgFolder[FormMain.MemGameInfo.eSystemID, 1]; // this will be the same as snap directory, plus "\videosnaps\" sub-folder
  //   end;

  MAMEIniFile:= THashedStringList.Create;
  MAMEIniFile.LoadFromFile(iniFile);
  for Loop:=0 to MAMEIniFile.Count -1 do
  begin
    TextLine:= MAMEIniFile[Loop];
    if TextLine <> '' then
       begin
         EntryString:= XML_GetEntryName(TextLine);
         if EntryString <> '' then
            EntryString:= EntryString+' ';

         if (EntryString = 'input_directory ') and IsMAMEDefaultSettings then
            begin
              iFolder:= ExtractMAMEIniValue(TextLine);
              if iFolder <> '' then
                 FolderInput:= iFolder;
            end
         else
         if (EntryString = 'state_directory ') and IsMAMEDefaultSettings then
            begin
              iFolder:= ExtractMAMEIniValue(TextLine);
              if iFolder <> '' then
                 FolderState:= iFolder;
            end
         else
         if (EntryString = 'snapshot_directory ') and IsMAMEDefaultSettings then
            begin
              iFolder:= ExtractMAMEiniValue(TextLine);
              if iFolder <> '' then
                 FolderRecordMovie:= iFolder;
            end
         else
         if EntryString = 'autosave ' then
            begin
              AutoSaveState.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              if IsMAMEDefaultSettings then
                 begin
                   AutoSaveState.Visible:= True;
                   SaveStateAuto_LastChecked:= AutoSaveState.Checked;
                 end;
            end
         else
         if EntryString = 'record_timecode ' then
            begin
              InputRecordTimecodeFile.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              InputRecTimeCodeFile_LastChecked:= InputRecordTimecodeFile.Checked;
              if IsMAMEDefaultSettings then
                 FoundInputExtra:= True;
            end
         else
         if EntryString = 'exit_after_playback ' then
            begin
              InputExitEmulatorAfterInputPlayback.Checked:= Boolean(StrToInt(ExtractMAMEIniValue(TextLine)));
              InputExitEmuAfterPlay_LastChecked:= InputExitEmulatorAfterInputPlayback.Checked;
              if IsMAMEDefaultSettings then
                 FoundInputExtra:= True;
            end;
       end;
  end;
  FreeAndNil(MAMEIniFile);
  //FormMain.imgFolder[FormMain.MemGameInfo.eSystemID, 1]; // in-game snapshot folder!!!

  //if iniDirString <> '' then
  //   iniDirString:= FullEmuFolderFix(iniDirString, SystemID, False, IsAlterMAME)
end;

procedure TFormArcadeRunGameExtraMAME.ELV_SelectItem(ELV_Holder: TEasyListView; ItemHolder: TEasyItem);
begin
  if ItemHolder = nil then
     Exit;
  ELV_Holder.Selection.ClearAll;
  ItemHolder.Selected:= True;
  ELV_Holder.Selection.FocusedItem:= ItemHolder;
  ItemHolder.MakeVisible(emvMiddle);//(emvAuto);
end;

procedure TFormArcadeRunGameExtraMAME.ReSelectInputFile;
var
  Item: TEasyItem;
  GameFound, IsFullPath: Boolean;
  iFileStr, ItemFileStr: String;
begin
  if not FormMain.CheckTotal(InputListView) then
     begin
       if InputListView.Tag = 1 then // "Record" radio button is checked
          begin
            InputFileName.Text:= FormMain.MemGameInfo.eName+'.inp';
            Exit;
          end
       else
          Exit;
     end;
  InputListView.Selection.ClearAll;
  LabelInputSelectedFileFolder.Caption:= '';
  GameFound:= False;
  case InputListView.Tag of
    0: iFileStr:= InputPlayback_CurrentFile;
    1: iFileStr:= InputRecord_CurrentFile;
  end;
  if iFileStr = '' then
     begin
       Item:= InputListView.Groups.FirstItem;
       GameFound:= True;
     end
  else
  begin
    IsFullPath:= PosEx('\', iFileStr) <> 0;
    Item:= InputListView.Groups.FirstItem;
    repeat
      case IsFullPath of
        True : ItemFileStr:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
        False: ItemFileStr:= TFileInfo(Item).eFileName;
      end;
      //if SameText(TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName, iFileStr) then
      if SameText(ItemFileStr, iFileStr) then
         GameFound:= True
      else
         Item:= InputListView.Groups.NextItem(Item);
    until (Item = nil) or GameFound;
  end;
  if GameFound then
     ELV_SelectItem(InputListView, Item)
  else
     if InputListView.Tag = 1 then
        begin
          InputFileName.Text:= iFileStr;
        end;

  InputListView.SetFocus;
end;

procedure TFormArcadeRunGameExtraMAME.ReSelectSaveStateFile;
begin
  if not FormMain.CheckTotal(SaveStateListView) then
     Exit;

  SaveStateListView.Selection.ClearAll;
  LabelSaveStateSelectedFileFolder.Caption:= '';
  ELV_SelectItem(SaveStateListView, SaveStateListView.Groups.FirstItem);

  SaveStateListView.SetFocus;
end;

procedure TFormArcadeRunGameExtraMAME.ReSelectRecordMovieFile;
var
  Item: TEasyItem;
  GameFound: Boolean;
  iFileStr, ItemFileStr: String;
begin
  if not FormMain.CheckTotal(RecordMovieListView) then
     begin
       RecordMovieFileName.Text:= FormMain.MemGameInfo.eName+GetRecordMovieFileExtension; // reset to game name
       Exit;
     end;
  RecordMovieListView.Selection.ClearAll;
  LabelRecordMovieSelectedFileFolder.Caption:= '';
  GameFound:= False;
  case RecordMovieListView.Tag of
    0: iFileStr:= RecordMovieAVI_CurrentFile;
    1: iFileStr:= RecordMovieMNG_CurrentFile;
    2: iFileStr:= RecordMovieWAV_CurrentFile;
  end;
  if iFileStr = '' then
     begin
       Item:= RecordMovieListView.Groups.FirstVisibleItem;
       GameFound:= True;
     end
  else
  begin
    Item:= RecordMovieListView.Groups.FirstVisibleItem;
    repeat
      ItemFileStr:= TFileInfo(Item).eFileName;
      if SameText(ItemFileStr, iFileStr) then
         GameFound:= True
      else
         Item:= RecordMovieListView.Groups.NextVisibleItem(Item);
    until (Item = nil) or GameFound;
  end;
  if GameFound then
     ELV_SelectItem(RecordMovieListView, Item)
  else
     RecordMovieFileName.Text:= iFileStr;

  RecordMovieListView.SetFocus;
end;

procedure TFormArcadeRunGameExtraMAME.EditFileName(ELV_Holder: TEasyListView);
begin
  if not FormMain.CheckSelected(ELV_Holder) then
     Exit;

  FormMain.SetFormKeyPreview(FormArcadeRunGameExtraMAME); // disable Form.KeyPreview to focus on TEasyListView key presses
  SetBottomButtons(False);
  FormMain.ELV_EnableEdit(ELV_Holder);
end;

procedure TFormArcadeRunGameExtraMAME.EditFileName_EndEdit_ELV(ELV_Holder: TEasyListView);
begin
  FormMain.ELV_SetEditManager(ELV_Holder, False);
  FormMain.SetFormKeyPreview(FormArcadeRunGameExtraMAME);
  SetBottomButtons(True);
end;

procedure TFormArcadeRunGameExtraMAME.DeleteFileName(ELV_Holder: TEasyListView);
var
  Item, NearItem: TEasyItem;
  FileStr, FileCategory: String;
begin
  if not FormMain.CheckSelected(ELV_Holder) then
     Exit;
  case NotebookPages.Tag of
    1: FileCategory:= 'an input';
    2: FileCategory:= 'a save state';
    3: FileCategory:= 'a memory card';
    4: FileCategory:= 'a movie';
  end;
  Item:= ELV_Holder.Selection.First;
  NearItem:= ELV_Holder.Groups.PrevItem(Item);
  if NearItem = nil then
     NearItem:= ELV_Holder.Groups.NextItem(Item);
  FileStr:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
  CallMessageBox;
  //ShowGameNameEntryMsgBox;
  FormMain.AddMsgText('Emulator   ', MsgTxtColors.colorKeyTitle, [fsBold], FormMain.AlignEmuGameText, -1, 'Trebuchet MS');
  FormMain.AddMsgText(FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID]+#13#10, MsgTxtColors.colorKeyValue, [fsBold], FormMain.AlignEmuGameText, -1, 'Trebuchet MS');

  if FormMain.MemGameInfo.eSoftwareName <> '' then
     begin
       FormMain.AddMsgText('Software List   ', MsgTxtColors.colorKeyTitle, [fsBold], FormMain.AlignEmuGameText, -1, 'Trebuchet MS');
       FormMain.AddMsgText(FormMain.MemGameInfo.eCategory+#13#10, MsgTxtColors.colorKeyValue, [fsBold], FormMain.AlignEmuGameText, -1, 'Trebuchet MS');
     end;
  FormMain.AddMsgText(#13#10);

  FormMain.AddMsgText('File:'+#13#10, clBlack, [fsBold]);
  FormMain.AddMsgText(FileStr+#13#10, MsgTxtColors.colorCmdLine, [], taLeftJustify, 10, 'Lucida Console');
  FormMain.AddMsgText('Size: ', clBlack, [fsBold]);
  FormMain.AddMsgText(TFileInfo(Item).eSizeText+#13#10);
  FormMain.AddMsgText('Date modified: ', clBlack, [fsBold]);
  FormMain.AddMsgText(TFileInfo(Item).eDateTimeText+#13#10);

  FormMain.AddMsgText(#13#10+'   Are you sure you want to delete this file ? Recycle bin is not supported...');

  if GenerateMessage('Delete File', 'You''re about to delete '+FileCategory+' file.', '', 1, False, 2) = mrNo then
     Exit;

  DeleteFile(TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName);
  FileStr:= ChangeFileExt(FileStr, '.timecode'); // for input files
  if FileExists(FileStr) then
     DeleteFile(FileStr);
  Sleep(100);
  ELV_Holder.Groups.DeleteItem(Item);
  ELV_SelectItem(ELV_Holder, NearItem);
end;

procedure TFormArcadeRunGameExtraMAME.ValidateKeyActions_ELV(ELV_Holder: TEasyListView; var CharCode: Word; var Shift: TShiftState);
begin
  if FormMain.ELV_IsEditing(ELV_Holder) then
     begin
       CharCode:= 0;
       Exit;
     end;
  case CharCode of
    VK_RETURN:
      begin
        if ELV_Holder = MemoryCardListView then
           AddMemoryCardToSlot;
      end;
    VK_F2: EditFileName(ELV_Holder);
    VK_DELETE: DeleteFileName(ELV_Holder);
  end;
end;

function TFormArcadeRunGameExtraMAME.GetItem_ELV(const FileFullPath: String; ELV_Holder: TEasyListView; CheckFullPath: Boolean = True): TEasyItem;
var
  rItem: TEasyItem;
begin
  Result:= nil;
  if not FormMain.CheckTotal(ELV_Holder) then
     Exit;
  rItem:= ELV_Holder.Groups.FirstItem;
  repeat
    if SameText(TFileInfo(rItem).eFileFolder+TFileInfo(rItem).eFileName, FileFullPath) then
       Result:= rItem
    else
       rItem:= ELV_Holder.Groups.NextItem(rItem);
  until (rItem = nil) or (Result <> nil);
end;

procedure TFormArcadeRunGameExtraMAME.AddMemoryCardToSlot(SlotIndex: ShortInt = -1);
var
  Item: TEasyItem;
  FileExt: String;
  SlotID: Byte;
begin
  // SlotIndex = -1 means auto detection (mouse double-click)
  if not FormMain.CheckSelected(MemoryCardListView) then
    Exit;
  Item:= MemoryCardListView.Selection.First;
  if SlotIndex = -1 then
     begin
       if InsertMemoryCard_Slot2.Enabled then
       begin
         FileExt:= ExtractFileExt(TFileInfo(Item).eFileName);
         if SameText('.mc2', FileExt) then
            SlotID:= 2
         else
            SlotID:= 1;
       end
       else
         SlotID:= 1;
     end
  else
     SlotID:= SlotIndex;

  case SlotID of
    1: InsertMemoryCard_Slot1.Text:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
    2: InsertMemoryCard_Slot2.Text:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
    3: InsertMemoryCard_Slot3.Text:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
    4: InsertMemoryCard_Slot4.Text:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;
  end;
end;

function TFormArcadeRunGameExtraMAME.MountCommandLine: Boolean;
var
  tmpCmd, RelativePathStr, RecFileName: String;
  selItem, RecordFileNameItem: TEasyItem;
  AddParam: Boolean;
begin
  Result:= True;
  if Enabled_PlaybackRecordInput.Checked then
  begin
    AddParam:= False;
    selItem:= InputListView.Selection.First;
    if selItem <> nil then
       RelativePathStr:= TFileInfo(selItem).eFileFolder+TFileInfo(selItem).eFileName;
    case InputPlayback.Checked of
      True:
        begin
          // need to check if ELV has files... if not, even if feature is enabled, ignore this!!!!
          if selItem = nil then
          begin
            if FormMain.CheckTotal(InputListView) then
               begin
                 GenerateMessage('Error', 'Filename is blank.', '    Playback input filename is not selected. Select a file in the list or uncheck "Enabled" to disable this feature.');
                 Result:= False;
                 Exit;
               end
            else
               AddParam:= False;
          end
          else
            AddParam:= True;
          RelativePathStr:= StringReplace(RelativePathStr, FolderInput, '', [rfIgnoreCase]);
        end;
      False:
        begin
          RecFileName:= InputFileName.Text;
          if RecFileName <> '' then
             RecFileName:= ChangeFileExt(RecFileName, '.inp')
          else
             begin
               GenerateMessage('Error', 'Filename is blank.', 'Record input filename is empty. Select a file in the list or type a new filename in the edit box.');
               Result:= False;
             end;
          if selItem <> nil then
             begin
               AddParam:= True;
               if not SameText(TFileInfo(selItem).eFileName, RecFileName) then
                  begin
                    RecordFileNameItem:= GetItem_ELV(RecFileName, InputListView, False);
                    if RecordFileNameItem = nil then
                       RelativePathStr:= FolderInput+MachineNameFolder+SoftwareListFolder+FormMain.MemGameInfo.eName+'\'+RecFileName
                    else
                       RelativePathStr:= TFileInfo(RecordFileNameItem).eFileFolder+TFileInfo(RecordFileNameItem).eFileName;
                  end;
               RelativePathStr:= StringReplace(RelativePathStr, FolderInput, '', [rfIgnoreCase]);
             end
          else
             begin
               AddParam:= True;
               RelativePathStr:= FolderInput+MachineNameFolder+SoftwareListFolder+FormMain.MemGameInfo.eName+'\'+RecFileName;
               RelativePathStr:= StringReplace(RelativePathStr, FolderInput, '', [rfIgnoreCase]);
             end;
        end;
    end;
    // must surround .inp file with quotes or MAME will fail to load if filename contain space chars
    if AddParam then
    begin
      case InputPlayback.Checked of
        True : tmpCmd:= ' -playback "';
        False: tmpCmd:= ' -record "';
      end;
      if FormMain.GetMAMEBuild(FormMain.MemGameInfo.eSystemID)  < 59 then
         RelativePathStr:= ChangeFileExt(RelativePathStr, ''); // previous to v0.59 MAME adds a .inp extension automatically!!!

      tmpCmd:= tmpCmd+RelativePathStr+'"';
      case InputPlayback.Checked of
        True:
          begin
            if InputExitEmuAfterPlay_LastChecked <> InputExitEmulatorAfterInputPlayback.Checked then
               tmpCmd:= tmpCmd+' -exit_after_playback';
          end;
        False:
          begin
            if InputRecTimeCodeFile_LastChecked <> InputRecordTimecodeFile.Checked then
               tmpCmd:= tmpCmd+' -record_timecode';
          end;
      end;
      CommandLine:= CommandLine+tmpCmd;
    end;
  end;

  RelativePathStr:= '';
  RecFileName:= '';
  if Enabled_LoadSaveState.Checked then
  begin
    AddParam:= True;
    selItem:= SaveStateListView.Selection.First;
    if selItem = nil then
       begin
         if FormMain.CheckTotal(SaveStateListView) then
            begin
              GenerateMessage('Error', 'Filename is blank.', 'Load save state filename is not selected. Select a file in the list or uncheck "Enabled" to disable this feature.');
              Result:= False;
              Exit;
            end
         else
            AddParam:= False;
       end;

    if AddParam then
    begin
      RecFileName:= ChangeFileExt(TFileInfo(selItem).eFileName, '');
      //if FormMain.MemGameInfo.eSoftwareName <> '' then
      //   RelativePathStr:= StringReplace(TFileInfo(selItem).eFileFolder, FolderSaveState, '', [rfIgnoreCase]);

      tmpCmd:= ' -state "'+RecFileName+'"';
      //if RelativePathStr <> '' then
      //   tmpCmd:= tmpCmd+' -statename '+RelativePathStr;
      if SaveStateAuto_LastChecked <> AutoSaveState.Checked then
         begin
           case AutoSaveState.Checked of
             True : tmpCmd:= tmpCmd+' -autosave';
             False: tmpCmd:= tmpCmd+' -noautosave';
           end;
         end;

      CommandLine:= CommandLine+tmpCmd;
    end;
  end;

  RelativePathStr:= '';
  RecFileName:= '';
  tmpCmd:= '';
  if Enabled_InsertMemoryCard.Checked then
  begin
    if InsertMemoryCard_Slot1.Enabled then
    begin
      RecFileName:= InsertMemoryCard_Slot1.Text;
      if RecFileName <> '' then
         tmpCmd:= ' -'+LabelInsertMemoryCard_Slot1.Hint+' "'+RecFileName+'"';
    end;
    if InsertMemoryCard_Slot2.Enabled then
    begin
      RecFileName:= InsertMemoryCard_Slot2.Text;
      if RecFileName <> '' then
         tmpCmd:= tmpCmd+' -'+LabelInsertMemoryCard_Slot2.Hint+' "'+RecFileName+'"';
    end;
    if InsertMemoryCard_Slot3.Enabled then
    begin
      RecFileName:= InsertMemoryCard_Slot3.Text;
      if RecFileName <> '' then
         tmpCmd:= tmpCmd+' -'+LabelInsertMemoryCard_Slot3.Hint+' "'+RecFileName+'"';
    end;
    if InsertMemoryCard_Slot4.Enabled then
    begin
      RecFileName:= InsertMemoryCard_Slot4.Text;
      if RecFileName <> '' then
         tmpCmd:= tmpCmd+' -'+LabelInsertMemoryCard_Slot4.Hint+' "'+RecFileName+'"';
    end;

    if tmpCmd <> '' then
       CommandLine:= CommandLine+tmpCmd;
  end;

  if Enabled_RecordMovie.Checked then
  begin
    RelativePathStr:= '';
    tmpCmd:= '';
    RecFileName:= RecordMovieFileName.Text;
    if RecFileName <> '' then
       RecFileName:= ChangeFileExt(RecFileName, GetRecordMovieFileExtension)
    else
       begin
         GenerateMessage('Error', 'Filename is blank.', 'Record movie filename is blank. Either select a file in the list, enter a new filename '+
                                                         'or uncheck "Enabled" to disable this feature.');
         Result:= False;
         Exit;
       end;

    selItem:= RecordMovieListView.Selection.First;
    if selItem <> nil then
       begin
         AddParam:= True;
         if not SameText(TFileInfo(selItem).eFileName, RecFileName) then
            begin
              RecordFileNameItem:= GetItem_ELV(RecFileName, RecordMovieListView, False);
              if RecordFileNameItem = nil then
                 RelativePathStr:= FolderRecordMovie+FormMain.MemGameInfo.eName+'\'+RecFileName
              else
                 RelativePathStr:= TFileInfo(RecordFileNameItem).eFileFolder+TFileInfo(RecordFileNameItem).eFileName;
            end
         else
            RelativePathStr:= TFileInfo(selItem).eFileFolder+TFileInfo(selItem).eFileName;
       end
    else
       begin
         AddParam:= True;
         RelativePathStr:= FolderRecordMovie+FormMain.MemGameInfo.eName+'\'+RecFileName;
       end;

    if AddParam then
    begin
      RelativePathStr:= StringReplace(RelativePathStr, LabelRecordMovieRootFolder.HelpKeyword, '', [rfIgnoreCase]);
      case RecordMovieListView.Tag of
        0: tmpCmd:= ' -aviwrite "'+RelativePathStr+'"';// AVI
        1: tmpCmd:= ' -mngwrite "'+RelativePathStr+'"';// AVI; MNG
        2: tmpCmd:= ' -wavwrite "'+RelativePathStr+'"';// AVI; MNG; WAV
      end;

      if tmpCmd <> '' then
         CommandLine:= CommandLine+tmpCmd;
    end;
  end;
  //if CommandLine <> '' then
  //   ShowMessage(CommandLine); // for debugging only
end;

procedure TFormArcadeRunGameExtraMAME.SetBottomButtons(IsEnabled: Boolean);
begin
  ButtonOk.Enabled:= IsEnabled;
  ButtonAbort.Enabled:= IsEnabled;
end;

procedure TFormArcadeRunGameExtraMAME.FormShow(Sender: TObject);
const
  iTop: Integer = 26;
var
  Loop: Integer;

  function AdjustDisabledPanel(PanelHolder: TPanel): Boolean;
  begin
    Result:= True;
    PanelHolder.Left:= 8;
    PanelHolder.Top:= 22;
    PanelHolder.Width:= NotebookPages.Width-16;
    PanelHolder.Height:= NotebookPages.Height-22-8;
    PanelHolder.ParentBackground:= False;
    PanelHolder.Color:= NotebookPages.Color;// clBlue;
    //PanelHolder.Visible:= True;
    //PanelHolder.Color:= clSilver;
  end;

begin
  FormMain.ELV_ResetNormalColors(InputListView);
  FormMain.ELV_ResetNormalColors(SaveStateListView);
  FormMain.ELV_ResetNormalColors(MemoryCardListView);
  FormMain.ELV_ResetNormalColors(RecordMovieListView);

  CommandLine:= '';

  MemCardLastUsed_MachineName:= '';
  MachineNameFolder:= MachineNameToRun;
  if MachineNameFolder <> '' then
     MachineNameFolder:= MachineNameFolder+'\';

  SoftwareListFolder:= FormMain.MemGameInfo.eSoftwareName;
  if SoftwareListFolder <> '' then
     SoftwareListFolder:= SoftwareListFolder+'\';

  FolderInput:= 'inp';
  FolderState:= 'sta';
  FolderMemoryCard:= 'memcard';
  FolderRecordMovie:= 'snap';

  FoundInputExtra:= False;

  InputRecordTimecodeFile.Left:= 170;

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, GameIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);
  //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
  //                                            GameIcon.Picture.Icon);

  FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, SystemIcon.Picture.Icon);

  LabelGameName.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption+#13#10+FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID];

  if IsNightMode then
  begin
    SetFormColors(FormArcadeRunGameExtraMAME, TopBar, BottomBar, LabelGameTitle, LabelGameName, nil, FormMain.MemGameInfo.eGameSetStatus, IsNightMode);
    NotebookPages.Color:= FormArcadeRunGameExtraMAME.Color;

    SetPanelNightColors(PanelInputListView,FormArcadeRunGameExtraMAME.Color, -1, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);

    SetTabButtonLineColors(PagesButtonBottomLine);

    SetLabelColors(LabelMachineInUse,      LabelGameName.Font.Color, clrLightBlack);
    SetLabelColors(LabelSoftwareListTitle, LabelGameName.Font.Color, clrLightBlack);

    // playback/record panel
    SetPanelNightColors(PanelInputListView, FormArcadeRunGameExtraMAME.Color, -1, PanelInputListView.ColorFrame, PanelInputListView.ColorInnerFrame);

    SetLabelColors(LabelInputSelectedFileFolder, clSilver, clrLightBlack);
    SetLabelBkFrameColors(LabelInputSelectedFileFolder, clrDarkGray, PanelInputListView.ColorFrame);

    FormMain.SetEasyListViewColors(InputListView, menu_background_color[1], item_caption_active_color[1]);

    SetLabelColors(LabelInputFileName, clGray, clrDarkGray);

    // Load a Save State panel
    SetLabelColors(LabelLoadSaveStateNotSupportedMsg, clrLightRed, clMaroon);

    SetPanelNightColors(PanelSaveStateListView, FormArcadeRunGameExtraMAME.Color, -1, PanelInputListView.ColorFrame, PanelInputListView.ColorInnerFrame);

    SetLabelColors(LabelSaveStateSelectedFileFolder, clSilver, clrDarkGray);
    SetLabelBkFrameColors(LabelSaveStateSelectedFileFolder, clrDarkGray, PanelSaveStateListView.ColorFrame);
    FormMain.SetEasyListViewColors(SaveStateListView, menu_background_color[1], item_caption_active_color[1]);

    // Insert Memory Card panel
    SetLabelColors(LabelInsertMemoryCard_Slot1, clCream, item_caption_active_shadow_color[1]);
    SetLabelColors(LabelInsertMemoryCard_Slot2, clCream, item_caption_active_shadow_color[1]);
    SetLabelColors(LabelInsertMemoryCard_Slot3, clCream, item_caption_active_shadow_color[1]);
    SetLabelColors(LabelInsertMemoryCard_Slot4, clCream, item_caption_active_shadow_color[1]);

    SetPanelNightColors(MemoryCardFileFolderPanel, FormArcadeRunGameExtraMAME.Color, -1, PanelInputListView.ColorFrame, PanelInputListView.ColorInnerFrame);
    SetLabelColors(LabelMemoryCardSelectedFileFolder, clSilver, clrDarkGray);
    SetLabelBkFrameColors(LabelMemoryCardSelectedFileFolder, clrDarkGray, MemoryCardFileFolderPanel.ColorFrame);
    FormMain.SetEasyListViewColors(MemoryCardListView, menu_background_color[1], item_caption_active_color[1]);

    // Record Session to a Movie panel
    SetLabelColors(LabelRecordMovieFileName, clCream, item_caption_active_shadow_color[1]);
    SetLabelColors(LabelRecordMovieRootFolder, clSilver, clrLightBlack);

    SetPanelNightColors(PanelRecordMovieListView, FormArcadeRunGameExtraMAME.Color, -1, PanelInputListView.ColorFrame, PanelInputListView.ColorInnerFrame);
    SetLabelColors(LabelRecordMovieSelectedFileFolder, clSilver, clrLightBlack);
    SetLabelBkFrameColors(LabelRecordMovieSelectedFileFolder, clrDarkGray, PanelRecordMovieListView.ColorFrame);
    FormMain.SetEasyListViewColors(RecordMovieListView, menu_background_color[1], item_caption_active_color[1]);

    SetLabelColors(LabelInfo, clrLightGreen, clrDarkGreen);

    for Loop:= 0 to FormArcadeRunGameExtraMAME.ComponentCount-1 do
    begin
      if FormArcadeRunGameExtraMAME.Components[Loop] is TBitBtnEx then
         FormMain.SetButtonExColors(TBitBtnEx(FormArcadeRunGameExtraMAME.Components[Loop]))
      else
      if FormArcadeRunGameExtraMAME.Components[Loop] is TSpeedButtonEx then
         FormMain.SetButtonExColors(TSpeedButtonEx(FormArcadeRunGameExtraMAME.Components[Loop]))
      else
      if FormArcadeRunGameExtraMAME.Components[Loop] is TAdvOfficeCheckBoxEx then
         begin
           SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormArcadeRunGameExtraMAME.Components[Loop]), clCream, item_caption_active_shadow_color[1]);
           FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormArcadeRunGameExtraMAME.Components[Loop]));
         end
      else
      if FormArcadeRunGameExtraMAME.Components[Loop] is TAdvOfficeRadioButtonEx then
         begin
           SetRadioButtonColors(TAdvOfficeRadioButtonEx(FormArcadeRunGameExtraMAME.Components[Loop]), clCream, item_caption_active_shadow_color[1]);
           FormMain.SetRadioButtonExCustomIcon(TAdvOfficeRadioButtonEx(FormArcadeRunGameExtraMAME.Components[Loop]));
         end
      else
      if FormArcadeRunGameExtraMAME.Components[Loop] is TEditEx then
         SetEditNightColors(TEditEx(FormArcadeRunGameExtraMAME.Components[Loop]));
    end;

    FormMain.SetEasyListViewHeaderColors(InputListView, True);
    FormMain.SetEasyListViewHeaderColors(SaveStateListView, True);
    FormMain.SetEasyListViewHeaderColors(MemoryCardListView, True);
    FormMain.SetEasyListViewHeaderColors(RecordMovieListView, True);

    FormMain.ELV_SetEditBkColor(InputListView);
    FormMain.ELV_SetEditBkColor(SaveStateListView);
    FormMain.ELV_SetEditBkColor(MemoryCardListView);
    FormMain.ELV_SetEditBkColor(RecordMovieListView);

    FormMain.ELV_SetRibbonNightColors(0, InputListView, True);
    FormMain.ELV_SetRibbonNightColors(0, SaveStateListView, True);
    FormMain.ELV_SetRibbonNightColors(0, MemoryCardListView, True);
    FormMain.ELV_SetRibbonNightColors(0, RecordMovieListView, True);

    FormMain.SetWin10DarkScrollBar(InputListView);
    FormMain.SetWin10DarkScrollBar(SaveStateListView);
    FormMain.SetWin10DarkScrollBar(MemoryCardListView);
    FormMain.SetWin10DarkScrollBar(RecordMovieListView);
  end;
  
  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, IsNightMode); // change top bar color based on game set status // for light mode and night mode

  //SetLightColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, False); // change top bar color based on game set status

  // Call adjust form for higher resolutions
  // ... it must be called before the AdjustDisabledPanel() functions!!!!

  AdjustDisabledPanel(PanelDisabledInput);
  AdjustDisabledPanel(PanelDisabledSaveState);
  AdjustDisabledPanel(PanelDisabledMemoryCard);
  PanelDisabledSaveStateNotSupportedMsg.Left:= 95;
  PanelDisabledSaveStateNotSupportedMsg.Width:= (NotebookPages.Width-PanelDisabledSaveStateNotSupportedMsg.Left)-10;
  PanelDisabledSaveStateNotSupportedMsg.ParentBackground:= False;
  PanelDisabledSaveStateNotSupportedMsg.Color:= NotebookPages.Color;

  AdjustDisabledPanel(PanelDisabledRecordMovie);

  LabelInputSelectedFileFolder.Caption:= '';
  InputPlayback_CurrentFile:= '';
  InputRecord_CurrentFile:= '';

  LabelSaveStateSelectedFileFolder.Caption:= '';

  LabelMemoryCardSelectedFileFolder.Caption:= '';
  LabelRecordMovieSelectedFileFolder.Caption:= '';

  RecordMovieAVI_CurrentFile:= '';
  RecordMovieWAV_CurrentFile:= '';
  RecordMovieMNG_CurrentFile:= '';

  LabelRecordMovieSelectedFileFolder.Caption:= '';
  LabelRecordMovieRootFolder.Caption:= '';

  if sysID = idSupermodel then
  begin
    FolderState:= 'Saves'; // this folder name is fixed in Supermodel source code
  end
  else
  begin
    ParseMAMEIni;

    if FolderInput <> '' then
       FolderInput:= FormMain.FullEmuFolderFix(FolderInput, FormMain.MemGameInfo.eSystemID, False);

    //if FolderState <> '' then
    //   FolderState:= FormMain.FullEmuFolderFix(FolderState, FormMain.MemGameInfo.eSystemID, False);

    FolderMemoryCard:= FormMain.FullEmuFolderFix(FolderMemoryCard, FormMain.MemGameInfo.eSystemID, False);

    if FolderRecordMovie <> '' then
       begin
         // .HelpKeyword holds the "mame_snapdir" full path to generate the command line correctly
         LabelRecordMovieRootFolder.HelpKeyword:= FormMain.FullEmuFolderFix(FolderRecordMovie, FormMain.MemGameInfo.eSystemID, False);
         FolderRecordMovie:= LabelRecordMovieRootFolder.HelpKeyword+RecordMovieSubDir+SoftwareListFolder;
         LabelRecordMovieRootFolder.Caption:= LabelRecordMovieRootFolder.Hint+' '+FolderRecordMovie;
       end;

    if not FoundInputExtra then
       InputExitEmulatorAfterInputPlayback.Visible:= False;
    CheckMemoryCardSupport;
  end;

  if FolderState <> '' then
     FolderState:= FormMain.FullEmuFolderFix(FolderState, FormMain.MemGameInfo.eSystemID, False);

  CheckSaveStateSupport; // MAME only

  LabelSoftwareListTitle.Visible:= FormMain.MemGameInfo.eSoftwareName <> '';
  if LabelSoftwareListTitle.Visible then
     begin
       FormArcadeRunGameExtraMAME.ClientHeight:= FormArcadeRunGameExtraMAME.ClientHeight+iTop;
       PagesButtonBottomLine.Top:= PagesButtonBottomLine.Top+iTop;
       PageButtonInput.Top:= PageButtonInput.Top+iTop;
       PageButtonSaveState.Top:= PageButtonSaveState.Top+iTop;
       PageButtonMemoryCard.Top:= PageButtonMemoryCard.Top+iTop;
       PageButtonRecordMovie.Top:= PageButtonRecordMovie.Top+iTop;

       LabelMachineInUse.Visible:= True;
       //LabelGameName.Top:= LabelGameName.Top-LabelSoftwareListTitle.Height;
       //LabelGameName.Height:= LabelGameName.Height+iTop;
       LabelGameName.Caption:= LabelGameName.Caption+#13#10+'software list:'+#13#10+'run with machine';

       LabelSoftwareListTitle.Caption:= FormMain.MemGameInfo.eCategory;
       LabelSoftwareListTitle.Left:= 182;
       LabelSoftwareListTitle.Top:= LabelGameName.Top+(LabelSoftwareListTitle.Height*2)-2;
       LabelMachineInUse.Caption:= '['+MachineNameToRun+']: '+LabelMachineInUse.Hint;
       LabelMachineInUse.Top:= LabelSoftwareListTitle.Top+LabelSoftwareListTitle.Height-1;// LabelGameNameCloneOf.Top; //  LabelSoftwareListTitle.Top+12;
       TopBar.Height:= TopBar.Height+iTop;//6;
     end;

  // this has to be done on code or ELV crashes... :_((
  InputListView.Header.Columns[0].SortDirection:= esdNone;
  InputListView.Header.Columns[2].SortDirection:= esdDescending;

  SaveStateListView.Header.Columns[0].SortDirection:= esdNone;
  SaveStateListView.Header.Columns[2].SortDirection:= esdDescending;

  MemoryCardListView.Header.Columns[0].SortDirection:= esdNone;
  MemoryCardListView.Header.Columns[2].SortDirection:= esdDescending;

  RecordMovieListView.Header.Columns[0].SortDirection:= esdNone;
  RecordMovieListView.Header.Columns[2].SortDirection:= esdDescending;

  if sysID = idSupermodel then
     begin
       // hide all other buttons and move save state button to left
       PageButtonSaveState.Down:= True;
       PageButtonSaveState.Click;
       PageButtonInput.Visible:= False;
       PageButtonMemoryCard.Visible:= False;
       PageButtonRecordMovie.Visible:= False;
       PageButtonSaveState.Left:= PageButtonInput.Left;

       Enabled_LoadSaveState.Checked:= True; // auto-enable save state; user can disable it if needed
     end;
end;

procedure TFormArcadeRunGameExtraMAME.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  {case FormMain.MenuArcadeBrowseGames.Tag of
    0:
      begin
        case Key of
          #13: ButtonOk.Click;
          #27: ButtonAbort.Click;
        end;
      end;
    else
      begin
        case Key of
         'S', 's': ButtonOk.Click;
         'Q', 'q': ButtonAbort.Click;
        end;
      end;
  end;}
end;

procedure TFormArcadeRunGameExtraMAME.InputPlaybackClick(Sender: TObject);
begin
  if TAdvOfficeRadioButtonEx(Sender).Tag = InputListView.Tag then
     begin
       TAdvOfficeRadioButtonEx(Sender).Checked:= True;
       Exit;
     end;

  ButtonInputResetFileName.Enabled:= TAdvOfficeRadioButtonEx(Sender).Tag = 1;
  ButtonInputResetFileNameTitle.Enabled:= ButtonInputResetFileName.Enabled;
  if FoundInputExtra then
     begin
       // only for new MAME builds that support these settings...
       InputExitEmulatorAfterInputPlayback.Visible:= TAdvOfficeRadioButtonEx(Sender).Tag = 0;
       InputRecordTimecodeFile.Visible:= ButtonInputResetFileName.Enabled;
     end;

  InputListView.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;

  InputFileName.Enabled:= InputListView.Tag = 1;
  //LabelInputFileName.Enabled:= InputFileName.Enabled;
  TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  if TAdvOfficeRadioButtonEx(Sender).Tag = 0 then
     begin
       InputRecord.Font.Style:= [];
       LabelInputFileName.Caption:= 'Selected File (file extension optional)';
       if IsNightMode then
          SetLabelColors(LabelInputFileName, clGray, clrDarkGray)
          //LabelInputFileName.Font.Color:= clrGray
       else
          LabelInputFileName.Font.Color:= clrDarkGray;
     end
  else
     begin
       InputPlayback.Font.Style:= [];
       LabelInputFileName.Caption:= 'New File (file extension optional)';
       if IsNightMode then
          SetLabelColors(LabelInputFileName, clCream, item_caption_active_shadow_color[1])
       else
          LabelInputFileName.Font.Color:= clBlack;
     end;
  //InputFileName.Tag:= 1;
  ReselectInputFile;
  //InputFileName.Tag:= 0;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot1_LastUsedClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot1.Text:= InsertMemoryCard_Slot1.Hint;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot2_LastUsedClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot2.Text:= InsertMemoryCard_Slot2.Hint;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot3_LastUsedClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot3.Text:= InsertMemoryCard_Slot3.Hint;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot4_LastUsedClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot4.Text:= InsertMemoryCard_Slot4.Hint;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot1_ClearClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot1.Text:= '';
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot2_ClearClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot2.Text:= '';
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot3_ClearClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot3.Text:= '';
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot4_ClearClick(
  Sender: TObject);
begin
  InsertMemoryCard_Slot4.Text:= '';
end;

procedure TFormArcadeRunGameExtraMAME.PageButtonInputClick(Sender: TObject);

  function UncheckButton(ButtonHolder: TSpeedButtonEx): Boolean;
  begin
    Result:= TSpeedButtonEx(ButtonHolder).Top = TSpeedButtonEx(Sender).Top;
    if Result then
       begin
         TSpeedButtonEx(ButtonHolder).Top:= TSpeedButtonEx(ButtonHolder).Top+3;
         TSpeedButtonEx(ButtonHolder).Height:= TSpeedButtonEx(ButtonHolder).Height-3;
         if not IsNightMode then
            TSpeedButtonEx(ButtonHolder).Font.Color:= clrDarkGray;
       end;
  end;

begin
  if TSpeedButtonEx(Sender).Tag = NotebookPages.Tag then
     Exit;
  TSpeedButtonEx(Sender).Top:= TSpeedButtonEx(Sender).Top-3;
  TSpeedButtonEx(Sender).Height:= TSpeedButtonEx(Sender).Height+3;
  if not IsNightMode then
     TSpeedButtonEx(Sender).Font.Color:= clBlack;

  case TSpeedButtonEx(Sender).Tag of
    1:
      begin
        UncheckButton(PageButtonSaveState);
        UncheckButton(PageButtonMemoryCard);
        UncheckButton(PageButtonRecordMovie);
      end;
    2:
      begin
        UncheckButton(PageButtonInput);
        UncheckButton(PageButtonMemoryCard);
        UncheckButton(PageButtonRecordMovie);
      end;
    3:
      begin
        UncheckButton(PageButtonInput);
        UncheckButton(PageButtonSaveState);
        UncheckButton(PageButtonRecordMovie);
      end;
    4:
      begin
        UncheckButton(PageButtonInput);
        UncheckButton(PageButtonSaveState);
        UncheckButton(PageButtonMemoryCard);
      end;
  end;

  NotebookPages.Tag:= TSpeedButtonEx(Sender).Tag;
  NoteBookPages.PageIndex:= TSpeedButtonEx(Sender).Tag-1;
end;

procedure TFormArcadeRunGameExtraMAME.SetCheckBoxStateColor(CheckBoxSource: TAdvOfficeCheckBoxEx);
begin
  if IsNightMode then
     begin
       case CheckBoxSource.Checked of
         True : SetCheckBoxColors(CheckBoxSource, clrOrangeBarTop);
         False: SetCheckBoxColors(CheckBoxSource, clCream, item_caption_active_shadow_color[1]);
       end;
     end
  else
     begin
       case CheckBoxSource.Checked of
         True : CheckBoxSource.Font.Color:= clNavy;
         False: CheckBoxSource.Font.Color:= clBlack;
       end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.Enabled_PlaybackRecordInputClick(
  Sender: TObject);
begin
  if TAdvOfficeCheckBoxEx(Sender).Checked then
     begin
       if not FormMain.CheckTotal(InputListView) then
          GetFiles(20, True);
     end;
  SetCheckBoxStateColor(TAdvOfficeCheckBoxEx(Sender));
  PanelDisabledInput.Visible:= not TAdvOfficeCheckBoxEx(Sender).Checked;

  ReselectInputFile;
end;

procedure TFormArcadeRunGameExtraMAME.InputFileNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  // playback/record input cannot have full path!!!
  if Key in ['/', '*', '?', '<', '>', '|', ':', ';', '\', '"'] then
     begin
       Key:= Char(0);
       Exit;
     end;
  if InputListView.Tag = 1 then
     InputRecord_CurrentFile:= InputFileName.Text;
end;

procedure TFormArcadeRunGameExtraMAME.InputListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       InputListView.BeginUpdate;
       InputListView.Sort.SortAll;
       InputListView.EndUpdate(False);
     end;
end;

function TFormArcadeRunGameExtraMAME.InputListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileName, TFileInfo(gItem2).eFileName);
    1: Result:= CompareIntValue(TFileInfo(gItem1).eSize, TFileInfo(gItem2).eSize);
    2: Result:= CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
    3: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileFolder, TFileInfo(gItem2).eFileFolder);
  end;
end;

procedure TFormArcadeRunGameExtraMAME.InputListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       InputFileName.Text:= TFileInfo(InputListView.Selection.First).eFileName;
       LabelInputSelectedFileFolder.Caption:= ' '+TFileInfo(InputListView.Selection.First).eFileFolder;
       case InputListView.Tag of
         0: InputPlayback_CurrentFile:= TFileInfo(InputListView.Selection.First).eFileFolder+TFileInfo(InputListView.Selection.First).eFileName;
         1: InputRecord_CurrentFile:= TFileInfo(InputListView.Selection.First).eFileFolder+TFileInfo(InputListView.Selection.First).eFileName;
       end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.InputListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  ValidateKeyActions_ELV(InputListView, CharCode, Shift);
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInputResetFileNameClick(
  Sender: TObject);
var
  iFullPath: String;
begin
  case TBitBtnEx(Sender).Tag of
    0: InputRecord_CurrentFile:= FormMain.MemGameInfo.eName+'.inp'; // reset to game name
    1: InputRecord_CurrentFile:= FormMain.MemGameInfo.eTitle+'.inp'; // reset to game title
  end;
  ReselectInputFile;
  exit;

  iFullPath:= FolderInput+MachineNameFolder+SoftwareListFolder;
  case TBitBtnEx(Sender).Tag of
    0: iFullPath:= iFullPath+FormMain.MemGameInfo.eName+'.inp'; // reset to game name
    1: iFullPath:= iFullPath+FormMain.MemGameInfo.eTitle+'.inp'; // reset to game title
  end;
  InputRecord_CurrentFile:= iFullPath;
  ReselectInputFile;
end;

procedure TFormArcadeRunGameExtraMAME.SaveStateListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       SaveStateListView.BeginUpdate;
       SaveStateListView.Sort.SortAll;
       SaveStateListView.EndUpdate(False);
     end;
end;

function TFormArcadeRunGameExtraMAME.SaveStateListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileName, TFileInfo(gItem2).eFileName);
    1: Result:= CompareIntValue(TFileInfo(gItem1).eSize, TFileInfo(gItem2).eSize);
    2: Result:= CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
  end;
end;

procedure TFormArcadeRunGameExtraMAME.SaveStateListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelSaveStateSelectedFileFolder.Caption:= ' '+TFileInfo(SaveStateListView.Selection.First).eFileFolder;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.SaveStateListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  ValidateKeyActions_ELV(SaveStateListView, CharCode, Shift);
end;

procedure TFormArcadeRunGameExtraMAME.Enabled_LoadSaveStateClick(
  Sender: TObject);
begin
  if TAdvOfficeCheckBoxEx(Sender).Checked then
     begin
       if not FormMain.CheckTotal(SaveStateListView) then
          GetFiles(22, True);
     end;
  SetCheckBoxStateColor(TAdvOfficeCheckBoxEx(Sender));

  PanelDisabledSaveState.Visible:= not TAdvOfficeCheckBoxEx(Sender).Checked;
  if sysID <> idSupermodel then
     PanelDisabledSaveStateNotSupportedMsg.Visible:= PanelDisabledSaveState.Visible
  else
     PanelDisabledSaveStateNotSupportedMsg.Visible:= True;

  ReSelectSaveStateFile;
end;

procedure TFormArcadeRunGameExtraMAME.InputListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  EditFileName_EndEdit_ELV(InputListView);
end;

procedure TFormArcadeRunGameExtraMAME.InputListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  oldFile, newFile: String;
  iRename: Boolean;
  RemoveItem: TEasyItem;
begin
  oldFile:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;

  if NewValue = '' then
     begin
       Accept:= False;
       Exit;
     end;
     
  NewValue:= ChangeFileExt(NewValue, '.inp');
  newFile:= TFileInfo(Item).eFileFolder+NewValue;
  iRename:= False;
  RemoveItem:= nil;
  if not SameText(NewValue, TFileInfo(Item).eFileName) then
     begin
       if FileExists(newFile) then
          begin
            RemoveItem:= GetItem_ELV(newFile, InputListView);

            CallMessageBox;
            FormMain.AddMsgText('    The destination file already exists.'+#13#10);
            FormMain.AddMsgText(newFile, clNavy, [fsBold]);
            FormMain.AddMsgText(#13#10+'Size: '+TFileInfo(RemoveItem).eSizeText+
                                #13#10+'Date modified: '+TFileInfo(RemoveItem).eDateTimeText+' ');

            if TFileInfo(RemoveItem).eDateTime > TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(newer)', MsgTxtColors.colorFileName, [fsBold])
            else
            if TFileInfo(RemoveItem).eDateTime < TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(older)', MsgTxtColors.colorFileName, [fsBold])
            else
               FormMain.AddMsgText('(same date)', MsgTxtColors.colorFileName, [fsBold]);

            FormMain.AddMsgText(#13#10+#13#10+'    Do you want to rename ');
            FormMain.AddMsgText(TFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' and overwrite the file above ?');

            if GenerateMessage('Rename File', 'Rename file from "'+TFileInfo(Item).eFileName+'" to "'+NewValue+'".', '', 1, False, 2) = mrYes then
               begin
                 iRename:= True;
               end;
          end
       else
          iRename:= True;
     end;
  if Accept then
     begin
       if iRename then
          begin
            if RenameFile(oldFile, newFile) then
               TFileInfo(Item).eFileName:= NewValue;

            // rename the .timecode file as well
            oldFile:= ChangeFileExt(oldFile, '.timecode');
            if FileExists(oldFile) then
               begin
                 newFile:= ChangeFileExt(newFile, '.timecode');
                 RenameFile(oldFile, newFile);
               end;
            Sleep(100);
            InputListView.Groups.DeleteItem(RemoveItem);
            //UpdateFileNameInfo(oFile, NewValue, True);
          end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= not FormMain.ELV_IsEditing(InputListView);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(SaveStateListView);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(MemoryCardListView);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(RecordMovieListView);

  if CanClose then
     begin
       if FormArcadeRunGameExtraMAME.ModalResult = mrYes then
          begin
            if MountCommandLine then
               UpdateLastMemoryCardUsed
            else
               CanClose:= False;
          end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.SaveStateListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  EditFileName_EndEdit_ELV(SaveStateListView);
end;

procedure TFormArcadeRunGameExtraMAME.SaveStateListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  oldFile, newFile: String;
  iRename: Boolean;
  RemoveItem: TEasyItem;
begin
  oldFile:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;

  if NewValue = '' then
     begin
       Accept:= False;
       Exit;
     end;

  NewValue:= ChangeFileExt(NewValue, '.sta');
  newFile:= TFileInfo(Item).eFileFolder+NewValue;
  iRename:= False;
  RemoveItem:= nil;
  if not SameText(NewValue, TFileInfo(Item).eFileName) then
     begin
       if FileExists(newFile) then
          begin
            RemoveItem:= GetItem_ELV(newFile, SaveStateListView);

            CallMessageBox;
            FormMain.AddMsgText('    The destination file already exists.'+#13#10);
            FormMain.AddMsgText(newFile, clNavy, [fsBold]);
            FormMain.AddMsgText(#13#10+'Size: '+TFileInfo(RemoveItem).eSizeText+
                                #13#10+'Date modified: '+TFileInfo(RemoveItem).eDateTimeText+' ');

            if TFileInfo(RemoveItem).eDateTime > TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(newer)', MsgTxtColors.colorFileName, [fsBold])
            else
            if TFileInfo(RemoveItem).eDateTime < TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(older)', MsgTxtColors.colorFileName, [fsBold])
            else
               FormMain.AddMsgText('(same date)', MsgTxtColors.colorFileName, [fsBold]);

            FormMain.AddMsgText(#13#10+#13#10+'    Do you want to rename ');
            FormMain.AddMsgText(TFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' and overwrite the file above ?');

            if GenerateMessage('Rename File', 'Rename file from "'+TFileInfo(Item).eFileName+'" to "'+NewValue+'".', '', 1, False, 2) = mrYes then
               begin
                 iRename:= True;
               end;
          end
       else
          iRename:= True;
     end;
  if Accept then
     begin
       if iRename then
          begin
            if RenameFile(oldFile, newFile) then
               TFileInfo(Item).eFileName:= NewValue;

            Sleep(100);
            SaveStateListView.Groups.DeleteItem(RemoveItem);
            //UpdateFileNameInfo(oFile, NewValue, True);
          end;
     end;
end;


procedure TFormArcadeRunGameExtraMAME.Enabled_InsertMemoryCardClick(
  Sender: TObject);
begin
  if TAdvOfficeCheckBoxEx(Sender).Checked then
     begin
       if not FormMain.CheckTotal(MemoryCardListView) then
          begin
            GetFiles(32, True);
            // get last used memcard slot 1
            // get last used memcard slot 2
          end;
     end;

  SetCheckBoxStateColor(TAdvOfficeCheckBoxEx(Sender));
  PanelDisabledMemoryCard.Visible:= not TAdvOfficeCheckBoxEx(Sender).Checked;
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MemoryCardListView.BeginUpdate;
       MemoryCardListView.Sort.SortAll;
       MemoryCardListView.EndUpdate(False);
     end;
end;

function TFormArcadeRunGameExtraMAME.MemoryCardListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileName, TFileInfo(gItem2).eFileName);
    1: Result:= CompareIntValue(TFileInfo(gItem1).eSize, TFileInfo(gItem2).eSize);
    2: Result:= CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
    3: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileFolder, TFileInfo(gItem2).eFileFolder);
  end;
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  EditFileName_EndEdit_ELV(MemoryCardListView);
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  oldFile, newFile, fileExt, fileExt_NewValue: String;
  iRename: Boolean;
  RemoveItem: TEasyItem;
begin
  oldFile:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;

  if NewValue = '' then
     begin
       Accept:= False;
       Exit;
     end;

  fileExt:= ExtractFileExt(TFileInfo(Item).eFileName);
  fileExt_NewValue:= ExtractFileExt(NewValue);
  if fileExt_NewValue = '' then
     NewValue:= ChangeFileExt(NewValue, fileExt);
  newFile:= TFileInfo(Item).eFileFolder+NewValue;
  iRename:= False;
  RemoveItem:= nil;
  if not SameText(NewValue, TFileInfo(Item).eFileName) then
     begin
       if FileExists(newFile) then
          begin
            RemoveItem:= GetItem_ELV(newFile, MemoryCardListView);

            CallMessageBox;
            FormMain.AddMsgText('    The destination file already exists.'+#13#10);
            FormMain.AddMsgText(newFile, clNavy, [fsBold]);
            FormMain.AddMsgText(#13#10+'Size: '+TFileInfo(RemoveItem).eSizeText+
                                #13#10+'Date modified: '+TFileInfo(RemoveItem).eDateTimeText+' ');

            if TFileInfo(RemoveItem).eDateTime > TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(newer)', MsgTxtColors.colorFileName, [fsBold])
            else
            if TFileInfo(RemoveItem).eDateTime < TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(older)', MsgTxtColors.colorFileName, [fsBold])
            else
               FormMain.AddMsgText('(same date)', MsgTxtColors.colorFileName, [fsBold]);

            FormMain.AddMsgText(#13#10+#13#10+'    Do you want to rename ');
            FormMain.AddMsgText(TFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' and overwrite the file above ?');

            if GenerateMessage('Rename File', 'Rename file from "'+TFileInfo(Item).eFileName+'" to "'+NewValue+'".', '', 1, False, 2) = mrYes then
               begin
                 iRename:= True;
               end;
          end
       else
          iRename:= True;
     end;
  if Accept then
     begin
       if iRename then
          begin
            if RenameFile(oldFile, newFile) then
               TFileInfo(Item).eFileName:= NewValue;

            Sleep(100);
            MemoryCardListView.Groups.DeleteItem(RemoveItem);
          end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelMemoryCardSelectedFileFolder.Caption:= ' '+TFileInfo(MemoryCardListView.Selection.First).eFileFolder;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  ValidateKeyActions_ELV(MemoryCardListView, CharCode, Shift);
end;

procedure TFormArcadeRunGameExtraMAME.PopupELVPopup(Sender: TObject);
begin
  PopupMemoryCardAssignToSlot1.Visible:= PopupELV.PopupComponent = MemoryCardListView;
  PopupMemoryCardAssignToSlot2.Visible:= (PopupMemoryCardAssignToSlot1.Visible) and (InsertMemoryCard_Slot2.Enabled);
  PopupMemoryCardAssignToSlot3.Visible:= (PopupMemoryCardAssignToSlot3.Visible) and (InsertMemoryCard_Slot3.Enabled);
  PopupMemoryCardAssignToSlot4.Visible:= (PopupMemoryCardAssignToSlot4.Visible) and (InsertMemoryCard_Slot4.Enabled);
  PopupInputRenameFile.Enabled:= FormMain.CheckTotal(PopupELV.PopupComponent as TEasyListView);
  PopupInputDeleteFile.Enabled:= PopupInputRenameFile.Enabled;
end;

procedure TFormArcadeRunGameExtraMAME.Enabled_RecordMovieClick(Sender: TObject);
begin
  if TAdvOfficeCheckBoxEx(Sender).Checked then
     begin
       if not FormMain.CheckTotal(InputListView) then
          begin
            GetFiles(25, True); // 25 - AVI
            GetFiles(24, True); // 24 - MNG
            GetFiles(23, True); // 23 - WAV
          end;
     end;

  SetCheckBoxStateColor(TAdvOfficeCheckBoxEx(Sender));
  PanelDisabledRecordMovie.Visible:= not TAdvOfficeCheckBoxEx(Sender).Checked;
  RecordMovieFilter_FileType;
end;

function TFormArcadeRunGameExtraMAME.GetRecordMovieFileExtension: String;
begin
  if RecordMovieAVI.Checked then
     Result:= '.avi'
  else
  if RecordMovieMNG.Checked then
     Result:= '.mng'
  else
  if RecordMovieWAV.Checked then
     Result:= '.wav';
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieFilter_FileType;
var
  Item: TEasyItem;
  FileExtStr: String;
begin
  if not FormMain.CheckTotal(RecordMovieListView) then
     begin
       ReSelectRecordMovieFile;
       Exit;
     end;
  RecordMovieListView.BeginUpdate;
  RecordMovieListView.Selection.ClearAll;
  RecordMovieListView.Groups.MakeAllVisible;
  RecordMovieListView.Groups.Rebuild(True); // need to rebuild to list gets messed up
  Item:= RecordMovieListView.Groups.FirstItem;
  repeat
    FileExtStr:= ExtractFileExt(TFileInfo(Item).eFileName);
    Item.Visible:= SameText(FileExtStr, GetRecordMovieFileExtension);
    Item:= RecordMovieListView.Groups.NextItem(Item);
  until Item = nil;
  RecordMovieListView.Groups.Rebuild(True); // need to rebuild to list gets messed up
  RecordMovieListView.EndUpdate(False);

  ReSelectRecordMovieFile;
end;

procedure TFormArcadeRunGameExtraMAME.PopupInputRenameFileClick(Sender: TObject);
begin
  if SameText(PopupELV.PopupComponent.ClassName, 'TEasyListView') then
     EditFileName(PopupELV.PopupComponent as TEasyListView);
  //if PopupELV.PopupComponent = InputListView then
  //   EditFileName(InputListView);
end;

procedure TFormArcadeRunGameExtraMAME.PopupInputDeleteFileClick(Sender: TObject);
begin
  if SameText(PopupELV.PopupComponent.ClassName, 'TEasyListView') then
     DeleteFileName(PopupELV.PopupComponent as TEasyListView);
end;

procedure TFormArcadeRunGameExtraMAME.MemoryCardListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if Button = cmbLeft then
     AddMemoryCardToSlot;
end;

procedure TFormArcadeRunGameExtraMAME.PopupMemoryCardAssignToSlot1Click(
  Sender: TObject);
begin
  AddMemoryCardToSlot(TMenuItem(Sender).Tag);
end;

function TFormArcadeRunGameExtraMAME.CheckInvalidEditBoxKeyPress(var iKey: Char): Boolean;
begin
  Result:= iKey in ['/', '*', '?', '<', '>', '|', ';', '"'];
end;

procedure TFormArcadeRunGameExtraMAME.InsertMemoryCard_Slot1KeyPress(
  Sender: TObject; var Key: Char);
begin
  // there can't be surround quotes...
  if CheckInvalidEditBoxKeyPress(Key) then
     begin
       Key:= Char(0);
       Exit;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.InsertMemoryCard_Slot2KeyPress(
  Sender: TObject; var Key: Char);
begin
  // there can't be surround quotes...
  if CheckInvalidEditBoxKeyPress(Key) then
     begin
       Key:= Char(0);
       Exit;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.InsertMemoryCard_Slot3KeyPress(
  Sender: TObject; var Key: Char);
begin
  // there can't be surround quotes...
  if CheckInvalidEditBoxKeyPress(Key) then
     begin
       Key:= Char(0);
       Exit;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.InsertMemoryCard_Slot4KeyPress(
  Sender: TObject; var Key: Char);
begin
  // there can't be surround quotes...
  if CheckInvalidEditBoxKeyPress(Key) then
     begin
       Key:= Char(0);
       Exit;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot1_SelectFileClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(22, 'Select a memory card file for SLOT 1', InsertMemoryCard_Slot1, False, True, FolderMemoryCard, MemCardFileExtFilter);
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot2_SelectFileClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(22, 'Select a memory card file for SLOT 2', InsertMemoryCard_Slot2, False, True, FolderMemoryCard, MemCardFileExtFilter);
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot3_SelectFileClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(22, 'Select a memory card file for SLOT 3', InsertMemoryCard_Slot3, False, True, FolderMemoryCard, MemCardFileExtFilter);
end;

procedure TFormArcadeRunGameExtraMAME.ButtonInsertMemoryCard_Slot4_SelectFileClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(22, 'Select a memory card file for SLOT 4', InsertMemoryCard_Slot4, False, True, FolderMemoryCard, MemCardFileExtFilter);
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieAVIClick(Sender: TObject);
begin
  if TAdvOfficeRadioButtonEx(Sender).Tag = RecordMovieListView.Tag then
     begin
       TAdvOfficeRadioButtonEx(Sender).Checked:= True;
       Exit;
     end;
  RecordMovieListView.Tag:= TAdvOfficeRadioButtonEx(Sender).Tag;

  TAdvOfficeRadioButtonEx(Sender).Font.Style:= [fsBold];
  case TAdvOfficeRadioButtonEx(Sender).Tag of
    0:
      begin
        RecordMovieMNG.Font.Style:= [];
        RecordMovieWAV.Font.Style:= [];
      end;
    1:
      begin
        RecordMovieAVI.Font.Style:= [];
        RecordMovieWAV.Font.Style:= [];
      end;
    2:
      begin
        RecordMovieAVI.Font.Style:= [];
        RecordMovieMNG.Font.Style:= [];
      end;
  end;
  RecordMovieFilter_FileType;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       RecordMovieListView.BeginUpdate;
       RecordMovieListView.Sort.SortAll;
       RecordMovieListView.EndUpdate(False);
     end;
end;

function TFormArcadeRunGameExtraMAME.RecordMovieListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileName, TFileInfo(gItem2).eFileName);
    1: Result:= CompareIntValue(TFileInfo(gItem1).eSize, TFileInfo(gItem2).eSize);
    2: Result:= CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
    3: Result:= FormMain.iCompare(TFileInfo(gItem1).eFileFolder, TFileInfo(gItem2).eFileFolder);
  end;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieListViewItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
var
  oldFile, newFile: String;
  iRename: Boolean;
  RemoveItem: TEasyItem;
begin
  oldFile:= TFileInfo(Item).eFileFolder+TFileInfo(Item).eFileName;

  if NewValue = '' then
     begin
       Accept:= False;
       Exit;
     end;

  NewValue:= ChangeFileExt(NewValue, GetRecordMovieFileExtension);
  newFile:= TFileInfo(Item).eFileFolder+NewValue;
  iRename:= False;
  RemoveItem:= nil;
  if not SameText(NewValue, TFileInfo(Item).eFileName) then
     begin
       if FileExists(newFile) then
          begin
            RemoveItem:= GetItem_ELV(newFile, InputListView);

            CallMessageBox;
            FormMain.AddMsgText('    The destination file already exists.'+#13#10);
            FormMain.AddMsgText(newFile, clNavy, [fsBold]);
            FormMain.AddMsgText(#13#10+'Size: '+TFileInfo(RemoveItem).eSizeText+
                                #13#10+'Date modified: '+TFileInfo(RemoveItem).eDateTimeText+' ');

            if TFileInfo(RemoveItem).eDateTime > TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(newer)', MsgTxtColors.colorFileName, [fsBold])
            else
            if TFileInfo(RemoveItem).eDateTime < TFileInfo(Item).eDateTime then
               FormMain.AddMsgText('(older)', MsgTxtColors.colorFileName, [fsBold])
            else
               FormMain.AddMsgText('(same date)', MsgTxtColors.colorFileName, [fsBold]);

            FormMain.AddMsgText(#13#10+#13#10+'    Do you want to rename ');
            FormMain.AddMsgText(TFileInfo(Item).eFileName, MsgTxtColors.colorFileName, [fsBold]);
            FormMain.AddMsgText(' and overwrite the file above ?');

            if GenerateMessage('Rename File', 'Rename file from "'+TFileInfo(Item).eFileName+'" to "'+NewValue+'".', '', 1, False, 2) = mrYes then
               begin
                 iRename:= True;
               end;
          end
       else
          iRename:= True;
     end;
  if Accept then
     begin
       if iRename then
          begin
            if RenameFile(oldFile, newFile) then
               TFileInfo(Item).eFileName:= NewValue;

            Sleep(100);
            RecordMovieListView.Groups.DeleteItem(RemoveItem);
          end;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieListViewItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  EditFileName_EndEdit_ELV(RecordMovieListView);
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       LabelRecordMovieSelectedFileFolder.Caption:= ' '+TFileInfo(RecordMovieListView.Selection.First).eFileFolder;
       RecordMovieFileName.Text:= TFileInfo(RecordMovieListView.Selection.First).eFileName; //TFileInfo(RecordMovieListView.Selection.First).eFileFolder+TFileInfo(RecordMovieListView.Selection.First).eFileName;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  ValidateKeyActions_ELV(RecordMovieListView, CharCode, Shift);
end;

procedure TFormArcadeRunGameExtraMAME.ButtonRecordMovieResetFileNameClick(
  Sender: TObject);
begin
  case TBitBtnEx(Sender).Tag of
    0: RecordMovieFileName.Text:= FormMain.MemGameInfo.eName+GetRecordMovieFileExtension; // reset to game name
    1: RecordMovieFileName.Text:= FormMain.MemGameInfo.eTitle+GetRecordMovieFileExtension; // reset to game title
  end;
  ReselectRecordMovieFile;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieFileNameChange(Sender: TObject);
begin
  case RecordMovieListView.Tag of
    0: RecordMovieAVI_CurrentFile:= RecordMovieFileName.Text;
    1: RecordMovieMNG_CurrentFile:= RecordMovieFileName.Text;
    2: RecordMovieWAV_CurrentFile:= RecordMovieFileName.Text;
  end;
end;

procedure TFormArcadeRunGameExtraMAME.RecordMovieFileNameKeyPress(
  Sender: TObject; var Key: Char);
begin
  // files cannot have full path; they are saved in "mame_snapdir\" no matter what!!!
  if Key in ['/', '*', '?', '<', '>', '|', ':', ';', '\', '"'] then
     begin
       Key:= Char(0);
       Exit;
     end;
end;

procedure TFormArcadeRunGameExtraMAME.FormCreate(Sender: TObject);
begin
  if FormMain.MenuCustomizeSplashScreen.Tag = 0 then //if Screen.Fonts.IndexOf('Terminal') = -1 then
     FormMain.ChangeLabelFontConsolas(LabelLoadSaveStateNotSupportedMsg, 9, [fsBold]);
end;

end.
