unit uArcadeRunExtraMAME_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, uCommon, StdCtrls, Buttons, AdvGroupBox,
  AdvOfficeButtons, ShadowLabel, ExtCtrls, PanelEx, MPCommonObjects,
  MPCommonUtilities, EasyListview, Menus, BarMenus, EditEx, ButtonsEx,
  BevelEx;

type
  TFormArcadeRunGameExtraMAME4K = class(TForm)
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameName: TShadowLabel;
    BottomBar: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonAbort: TBitBtnEx;
    LabelInfo: TShadowLabel;
    SystemIcon: TImage;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcadeRunGameExtraMAME4K: TFormArcadeRunGameExtraMAME4K;

implementation

uses uMain;

{$R *.dfm}


end.
