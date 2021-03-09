unit uArcadeFiltersGamesExtra;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, uCommon, Buttons,
  AdvOfficeButtons, PanelEx, AdvGroupBox, ShadowLabel, ButtonsEx,
  ColorBoxEx;

type
  TFormArcadeFiltersExtra = class(TForm)
    FilterGamesMainCPU: TAdvOfficeCheckBoxEx;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelControlType: TShadowLabel;
    LabelInterfaceType: TShadowLabel;
    InterfaceType: TComboBox2Ex;
    LabelAudioType: TShadowLabel;
    AudioType: TComboBox2Ex;
    LabelGamesROMs: TShadowLabel;
    GamesROMs: TComboBox2Ex;
    LabelDeviceROMs: TShadowLabel;
    HideDeviceSets: TAdvOfficeCheckBoxEx;
    DeviceROMs: TComboBox2Ex;
    LabelBios: TShadowLabel;
    Bios: TComboBox2Ex;
    HideBiosSets: TAdvOfficeCheckBoxEx;
    HideGamesWithCHDFiles: TAdvOfficeCheckBoxEx;
    ButtonDefaultOptions: TBitBtnEx;
    LabelSTVMultiSlot: TShadowLabel;
    NeoGeoMVS: TAdvOfficeCheckBoxEx;
    STVMultiSlot: TAdvOfficeCheckBoxEx;
    LabelNeoGeoMVS: TShadowLabel;
    ControlType_New: TComboBox2Ex;
    ScreenOrientation: TComboBox2Ex;
    LabelScreenOrientation: TShadowLabel;
    ShowMergedSetsOnly: TAdvOfficeCheckBoxEx;
    HideNoDumpROMsGames: TAdvOfficeCheckBoxEx;
    SaveState: TComboBox2Ex;
    LabelSaveState: TShadowLabel;
    CategoryFiltersGroupBox: TAdvGroupBoxEx;
    LabelCategoryFiltersGroupBoxHint: TShadowLabel;
    ButtonCategoriesToHideInfo: TBitBtnEx;
    CategoryCasino: TAdvOfficeCheckBoxEx;
    CategoryFruitMachines: TAdvOfficeCheckBoxEx;
    CategoryRhythm: TAdvOfficeCheckBoxEx;
    CategoryMature: TAdvOfficeCheckBoxEx;
    CategoryMahjong: TAdvOfficeCheckBoxEx;
    CategoryTabletop: TAdvOfficeCheckBoxEx;
    CategoryPinMAME: TAdvOfficeCheckBoxEx;
    CategoryQuiz: TAdvOfficeCheckBoxEx;
    CategoryUtilities: TAdvOfficeCheckBoxEx;
    CategoryCalculator: TAdvOfficeCheckBoxEx;
    CategoryEducational: TAdvOfficeCheckBoxEx;
    CategoryElectronic: TAdvOfficeCheckBoxEx;
    CategoryPrinters: TAdvOfficeCheckBoxEx;
    CategoryPhones: TAdvOfficeCheckBoxEx;
    CategoryMAMEConsoleMachines: TAdvOfficeCheckBoxEx;
    CategoryMAMEComputerMachines: TAdvOfficeCheckBoxEx;
    CategoryMAMEHandheldMachines: TAdvOfficeCheckBoxEx;
    ShowOnlySetsCRC32Collision: TAdvOfficeCheckBoxEx;
    CategoryMusic: TAdvOfficeCheckBoxEx;
    CategoryBoardGame: TAdvOfficeCheckBoxEx;
    CategorySlotMachines: TAdvOfficeCheckBoxEx;
    HideMAMESoftlist_vgmplay: TAdvOfficeCheckBoxEx;
    SpecialList: TComboBox2Ex;
    LabelSpecialList: TShadowLabel;
    LabelHideMAMESoftlist_vgmplay: TShadowLabel;
    procedure FormActivate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonDefaultOptionsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCategoriesToHideInfoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure ELV_PopulateControlType;
    procedure UpdateSettings;
  public
    { Public declarations }
    mResult: Integer;
    ControlName: String;
    ApplyFilter_Misc: Boolean;
  end;

var
  FormArcadeFiltersExtra: TFormArcadeFiltersExtra;

implementation

uses uMain, uStatus;

{$R *.dfm}

procedure TFormArcadeFiltersExtra.ELV_PopulateControlType;
var
  Loop: Integer;
  cStr: String;
begin
  ControlType_New.Items.BeginUpdate;
  for Loop:=0 to FormMain.ControlType.Count-1 do
  begin
    cStr:= FormMain.ControlType.ValueFromIndex[Loop];
    if cStr <> '' then
       ControlType_New.Items.Add(cStr);
  end;
  ControlType_New.Items.EndUpdate;
  ControlType_New.DropDownCount:= ControlType_New.Items.Count+2;
end;

procedure TFormArcadeFiltersExtra.UpdateSettings;
var
  ValueStr: String;

  function FilterChanged(CurrentValue, NewValue: Integer): Boolean;
  begin
    Result:= NewValue <> CurrentValue;
    if Result then
       ApplyFilter_Misc:= True;
  end;

  function ResetFilterCheckBox(CheckBoxHolder: TAdvOfficeCheckBoxEx): Boolean;
  begin
    Result:= True;
    if CheckBoxHolder.Checked <> (Boolean(CheckBoxHolder.Tag)) then
       CheckBoxHolder.Checked:= Boolean(CheckBoxHolder.Tag);
  end;

begin
  ValueStr:= ''; // new selection, control type
  if ControlType_New.ItemIndex > 0 then
     ValueStr:= FormMain.ControlType.Names[ControlType_New.ItemIndex-1];

  case mResult of
    mrOk:
      begin
        // ApplyFilter_Misc:= False; // not needed as it is defined in OnActivate() event

        if ControlName <> ValueStr then
           begin
             ControlName:= ValueStr;
             ApplyFilter_Misc:= True;
           end;

        FilterChanged(LabelBios.Tag, Bios.ItemIndex);
        LabelBios.Tag:= Bios.ItemIndex;

        FilterChanged(HideBiosSets.Tag, Ord(HideBiosSets.Checked));
        HideBiosSets.Tag:= Ord(HideBiosSets.Checked);

        FilterChanged(LabelInterfaceType.Tag, InterfaceType.ItemIndex);
        LabelInterfaceType.Tag:= InterfaceType.ItemIndex;

        FilterChanged(LabelAudioType.Tag, AudioType.ItemIndex);
        LabelAudioType.Tag:= AudioType.ItemIndex;

        FilterChanged(LabelDeviceROMs.Tag, DeviceROMs.ItemIndex);
        LabelDeviceROMs.Tag:= DeviceROMs.ItemIndex;

        FilterChanged(HideDeviceSets.Tag, Ord(HideDeviceSets.Checked));
        HideDeviceSets.Tag:= Ord(HideDeviceSets.Checked);

        //FilterChanged(HideDeviceSetsNoROMs.Tag, Ord(HideDeviceSetsNoROMs.Checked)); // no longer used used (December 24, 2017)
        //HideDeviceSetsNoROMs.Tag:= Ord(HideDeviceSetsNoROMs.Checked); // no longer used used (December 24, 2017)

        FilterChanged(LabelGamesROMs.Tag, GamesROMs.ItemIndex);
        LabelGamesROMs.Tag:= GamesROMs.ItemIndex;

        FilterChanged(CategoryCasino.Tag, Ord(CategoryCasino.Checked));
        CategoryCasino.Tag:= Ord(CategoryCasino.Checked);

        FilterChanged(CategoryFruitMachines.Tag, Ord(CategoryFruitMachines.Checked));
        CategoryFruitMachines.Tag:= Ord(CategoryFruitMachines.Checked);

        FilterChanged(CategorySlotMachines.Tag, Ord(CategorySlotMachines.Checked));
        CategorySlotMachines.Tag:= Ord(CategorySlotMachines.Checked);

        FilterChanged(CategoryRhythm.Tag, Ord(CategoryRhythm.Checked));
        CategoryRhythm.Tag:= Ord(CategoryRhythm.Checked);

        FilterChanged(CategoryMature.Tag, Ord(CategoryMature.Checked));
        CategoryMature.Tag:= Ord(CategoryMature.Checked);

        FilterChanged(CategoryMahjong.Tag, Ord(CategoryMahjong.Checked));
        CategoryMahjong.Tag:= Ord(CategoryMahjong.Checked);

        FilterChanged(CategoryTabletop.Tag, Ord(CategoryTabletop.Checked));
        CategoryTabletop.Tag:= Ord(CategoryTabletop.Checked);

        FilterChanged(CategoryPinMAME.Tag, Ord(CategoryPinMAME.Checked));
        CategoryPinMAME.Tag:= Ord(CategoryPinMAME.Checked);

        FilterChanged(CategoryBoardGame.Tag, Ord(CategoryBoardGame.Checked));
        CategoryBoardGame.Tag:= Ord(CategoryBoardGame.Checked);

        FilterChanged(CategoryQuiz.Tag, Ord(CategoryQuiz.Checked));
        CategoryQuiz.Tag:= Ord(CategoryQuiz.Checked);

        FilterChanged(CategoryUtilities.Tag, Ord(CategoryUtilities.Checked));
        CategoryUtilities.Tag:= Ord(CategoryUtilities.Checked);

        FilterChanged(CategoryCalculator.Tag, Ord(CategoryCalculator.Checked));
        CategoryCalculator.Tag:= Ord(CategoryCalculator.Checked);

        FilterChanged(CategoryEducational.Tag, Ord(CategoryEducational.Checked));
        CategoryEducational.Tag:= Ord(CategoryEducational.Checked);

        FilterChanged(CategoryElectronic.Tag, Ord(CategoryElectronic.Checked));
        CategoryElectronic.Tag:= Ord(CategoryElectronic.Checked);

        FilterChanged(CategoryPrinters.Tag, Ord(CategoryPrinters.Checked));
        CategoryPrinters.Tag:= Ord(CategoryPrinters.Checked);

        FilterChanged(CategoryMusic.Tag, Ord(CategoryMusic.Checked));
        CategoryMusic.Tag:= Ord(CategoryMusic.Checked);

        FilterChanged(CategoryMAMEConsoleMachines.Tag, Ord(CategoryMAMEConsoleMachines.Checked));
        CategoryMAMEConsoleMachines.Tag:= Ord(CategoryMAMEConsoleMachines.Checked);

        FilterChanged(CategoryMAMEComputerMachines.Tag, Ord(CategoryMAMEComputerMachines.Checked));
        CategoryMAMEComputerMachines.Tag:= Ord(CategoryMAMEComputerMachines.Checked);

        FilterChanged(CategoryMAMEHandheldMachines.Tag, Ord(CategoryMAMEHandheldMachines.Checked));
        CategoryMAMEHandheldMachines.Tag:= Ord(CategoryMAMEHandheldMachines.Checked);

        FilterChanged(HideGamesWithCHDFiles.Tag, Ord(HideGamesWithCHDFiles.Checked));
        HideGamesWithCHDFiles.Tag:= Ord(HideGamesWithCHDFiles.Checked);

        FilterChanged(HideNoDumpROMsGames.Tag, Ord(HideNoDumpROMsGames.Checked));
        HideNoDumpROMsGames.Tag:= Ord(HideNoDumpROMsGames.Checked);

        FilterChanged(LabelScreenOrientation.Tag, ScreenOrientation.ItemIndex);
        LabelScreenOrientation.Tag:= ScreenOrientation.ItemIndex;

        FilterChanged(LabelSaveState.Tag, SaveState.ItemIndex);
        LabelSaveState.Tag:= SaveState.ItemIndex;

        FilterChanged(NeoGeoMVS.Tag, Ord(NeoGeoMVS.Checked));
        NeoGeoMVS.Tag:= Ord(NeoGeoMVS.Checked);

        FilterChanged(STVMultiSlot.Tag, Ord(STVMultiSlot.Checked));
        STVMultiSlot.Tag:= Ord(STVMultiSlot.Checked);

        FilterChanged(ShowMergedSetsOnly.Tag, Ord(ShowMergedSetsOnly.Checked));
        ShowMergedSetsOnly.Tag:= Ord(ShowMergedSetsOnly.Checked);

        FilterChanged(ShowOnlySetsCRC32Collision.Tag, Ord(ShowOnlySetsCRC32Collision.Checked));
        ShowOnlySetsCRC32Collision.Tag:= Ord(ShowOnlySetsCRC32Collision.Checked);

        FilterChanged(HideMAMESoftlist_vgmplay.Tag, Ord(HideMAMESoftlist_vgmplay.Checked));
        HideMAMESoftlist_vgmplay.Tag:= Ord(HideMAMESoftlist_vgmplay.Checked);

        FilterChanged(LabelSpecialList.Tag, SpecialList.ItemIndex);
        LabelSpecialList.Tag:= SpecialList.ItemIndex;

        //FilterChanged(FilterGamesMainCPU.Tag, Ord(FilterGamesMainCPU.Checked));
        FilterGamesMainCPU.Tag:= Ord(FilterGamesMainCPU.Checked);
      end;
    mrCancel:
      begin
        if ValueStr <> ControlName then
           begin
             if ControlName = '' then
                SetSelectedComboBox(0, ControlType_New)
             else
                SetSelectedComboBox(FormMain.ControlType.IndexOfName(ControlName)+1, ControlType_New);
           end;

        FormMain.SetExtraFilter(LabelBios, Bios);
        ResetFilterCheckBox(HideBiosSets);

        FormMain.SetExtraFilter(LabelInterfaceType, InterfaceType);
        FormMain.SetExtraFilter(LabelAudioType, AudioType);

        FormMain.SetExtraFilter(LabelDeviceROMs, DeviceROMs);
        ResetFilterCheckBox(HideDeviceSets);
        //ResetFilterCheckBox(FormFiltersExtra.HideDeviceSetsNoROMs); // no longer used (December 24, 2017)

        ResetFilterCheckBox(CategoryCasino);
        ResetFilterCheckBox(CategoryFruitMachines);
        ResetFilterCheckBox(CategorySlotMachines);
        ResetFilterCheckBox(CategoryRhythm);
        ResetFilterCheckBox(CategoryMature);
        ResetFilterCheckBox(CategoryMahjong);
        ResetFilterCheckBox(CategoryTabletop);
        ResetFilterCheckBox(CategoryPinMAME);
        ResetFilterCheckBox(CategoryBoardGame);
        ResetFilterCheckBox(CategoryQuiz);

        ResetFilterCheckBox(CategoryUtilities);
        ResetFilterCheckBox(CategoryCalculator);
        ResetFilterCheckBox(CategoryEducational);
        ResetFilterCheckBox(CategoryElectronic);
        ResetFilterCheckBox(CategoryPrinters);
        ResetFilterCheckBox(CategoryPhones);
        ResetFiltercheckBox(CategoryMusic);

        ResetFilterCheckBox(CategoryMAMEConsoleMachines);
        ResetFilterCheckBox(CategoryMAMEComputerMachines);
        ResetFilterCheckBox(CategoryMAMEHandheldMachines);

        FormMain.SetExtraFilter(LabelGamesROMs, GamesROMs);

        ResetFilterCheckBox(HideGamesWithCHDFiles);

        ResetFilterCheckBox(HideNoDumpROMsGames);

        FormMain.SetExtraFilter(LabelScreenOrientation, ScreenOrientation);

        FormMain.SetExtraFilter(LabelSaveState, SaveState);

        ResetFilterCheckBox(NeoGeoMVS);
        ResetFilterCheckBox(STVMultiSlot);

        ResetFilterCheckBox(ShowMergedSetsOnly);

        ResetFilterCheckBox(ShowOnlySetsCRC32Collision);

        ResetFilterCheckBox(HideMAMESoftlist_vgmplay);

        FormMAin.SetExtraFilter(LabelSpecialList, SpecialList);

        ResetFilterCheckBox(FilterGamesMainCPU);
      end;
  end;
end;

procedure TFormArcadeFiltersExtra.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;
  Tag:= 1;
  ApplyFilter_Misc:= False; // set default to FALSE; only set to TRUE if user click "Apply" button AND only if any of the filters changed
  ELV_PopulateControlType;
  SetSelectedComboBox(FormMain.ControlType.IndexOfName(ControlName)+1, ControlType_New);

  // FormMain.SetWin10DarkScrollBar(ControlType_New); // this does NOT work :_((
end;

procedure TFormArcadeFiltersExtra.ButtonOkClick(Sender: TObject);
begin
  mResult:= TBitBtnEx(Sender).ModalResult;
end;

procedure TFormArcadeFiltersExtra.ButtonDefaultOptionsClick(Sender: TObject);
begin
  Bios.ItemIndex:= 0;
  HideBiosSets.Checked:= False;
  SetSelectedComboBox(0, ControlType_New);
  InterfaceType.ItemIndex:= 0;
  AudioType.ItemIndex:= 0;
  DeviceROMs.ItemIndex:= 0;
  HideDeviceSets.Checked:= False;
  //HideDeviceSetsNoROMs.Checked:= False;
  GamesROMs.ItemIndex:= 0;
  CategoryCasino.Checked:= True;
  CategoryFruitMachines.Checked:= True;
  CategorySlotMachines.Checked:= True;
  CategoryRhythm.Checked:= True;
  CategoryMature.Checked:= True;
  CategoryMahjong.Checked:= True;
  CategoryTabletop.Checked:= True;
  CategoryPinMAME.Checked:= True;
  CategoryBoardGame.Checked:= True;
  CategoryQuiz.Checked:= True;

  CategoryUtilities.Checked:= True;
  CategoryCalculator.Checked:= True;
  CategoryEducational.Checked:= True;
  CategoryElectronic.Checked:= True;
  CategoryPrinters.Checked:= True;
  CategoryPhones.Checked:= True;
  CategoryMusic.Checked:= True;

  CategoryMAMEConsoleMachines.Checked:= True;
  CategoryMAMEConsoleMachines.Checked:= True;
  CategoryMAMEHandheldMachines.Checked:= True;

  HideGamesWithCHDFiles.Checked:= False;
  HideNoDumpROMsGames.Checked:= False;
  NeoGeoMVS.Checked:= False;
  STVMultiSlot.Checked:= False;
  ScreenOrientation.ItemIndex:= 0;
  ShowMergedSetsOnly.Checked:= False;
  ShowOnlySetsCRC32Collision.Checked:= False;
  SaveState.ItemIndex:= 0;

  HideMAMESoftlist_vgmplay.Checked:= False;

  SpecialList.ItemIndex:= 0;
  
  FilterGamesMainCPU.Checked:= False;
end;

procedure TFormArcadeFiltersExtra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormArcadeFiltersExtra.ButtonCategoriesToHideInfoClick(
  Sender: TObject);
begin
  FormMain.InitMessageBox;// CallMessageBox;
  FormMain.AddMsgText('    To use these MAME/HBMAME filters you must place ');
  FormMain.AddMsgText('catver.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' or ');
  FormMain.AddMsgText('category.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' / ');
  FormMain.AddMsgText('mature.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('category_hb.ini', MsgTxtColors.colorFileName, [fsBold]);

  FormMain.AddMsgText(' from AntoPISA in ');
  FormMain.AddMsgText(FormMain.GetFolderFull(43), MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' folder and restart the frontend to load the new info in the games list.'+
                      #13#10+#13#10+'You can find ');
  FormMain.AddMsgText('catver.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('category.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' and ');
  FormMain.AddMsgText('category_hb.ini', MsgTxtColors.colorFileName, [fsBold]);

  FormMain.AddMsgText(' at AntoPISA renameSET page: http://www.progettosnaps.net/renameset/'+#13#10+#13#10+'File ');
  FormMain.AddMsgText('mature.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' is at http://www.progettosnaps.net/catver/ and is required so the frontend can properly filter adult/mature games if you''re using ');
  FormMain.AddMsgText('category.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText('. File ');
  FormMain.AddMsgText('catver.ini', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' is also available at Progetto EMMA: http://www.progettoemma.net/history/catlist.php'+#13#10+#13#10+
                      'The ');
  FormMain.AddMsgText('MAME Console Machines', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('MAME Computer Machines', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(', ');
  FormMain.AddMsgText('MAME Handheld Machines', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' filters will show/hide MAME machines only (from -listxml output). Software lists are not included.');

  GenerateMessage('Help', 'Hide categories based on an external file.', '', 2);
end;

procedure TFormArcadeFiltersExtra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     UpdateSettings;
end;


end.
