unit uCustomParameters;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, IniFiles,
  EditEx, ButtonsEx, ShadowLabel, PanelEx, TntComCtrls, MPCommonObjects,
  EasyListview, MPCommonUtilities, AdvOfficeButtons;

type
  TFormCustomParameters = class(TForm)
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    GameIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    PanelBottom: TPanelEx;
    ButtonReload: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    CustomParametersGroupBox: TPanelEx;
    CustomParametersGroupBoxLabel: TShadowLabel;
    CustomParameters_Edit: TEditEx;
    LabelCustomParamFile: TShadowLabel;
    CustomParametersSamplesGroupBox: TPanelEx;
    CustomParametersSamplesGroupBoxLabel: TShadowLabel;
    CustomParametersSamples: TTntRichEdit;
    LabelTips1: TShadowLabel;
    LabelTips1ParamMedia1: TShadowLabel;
    LabelTips1ParamMedia2: TShadowLabel;
    LabelTips2: TShadowLabel;
    CustomParametersSamplesFrame: TShape;
    LabelTips1ParamGameTag: TShadowLabel;
    SoftwareUsageTitle: TShadowLabel;
    SoftwareUsageText: TShadowLabel;
    SoftwareRequirementText: TShadowLabel;
    SoftwareRequirementTitle: TShadowLabel;
    PanelMachineSlotsGroupBox: TPanelEx;
    MachinesListView: TEasyListview;
    PanelMachineSlotsGroupBoxLabel: TShadowLabel;
    MachineSlotsRunCommandLabel: TShadowLabel;
    MachineSlotsRunCommand: TEditEx;
    MachineSlotsRunCommandButtonRun: TBitBtnEx;
    MachineSlotsInfoFrame: TShape;
    MachineSlotsInfo: TTntRichEdit;
    MachinesSlotsRadioButton: TAdvOfficeRadioButtonEx;
    MachinesMediaRadioButton: TAdvOfficeRadioButtonEx;
    MachineSlotsInfoTitleLabel: TShadowLabel;
    ButtonMachinesPanelShowHide: TBitBtnEx;
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonReloadClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MachinesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure MachinesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MachineSlotsRunCommandButtonRunClick(Sender: TObject);
    procedure MachineSlotsRunCommandKeyPress(Sender: TObject;
      var Key: Char);
    function MachinesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure MachinesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure MachinesSlotsRadioButtonClick(Sender: TObject);
    procedure MachineSlotsInfoURLClick(Sender: TObject;
      const URL: WideString);
    procedure ButtonMachinesPanelShowHideClick(
      Sender: TObject);
  private
    { Private declarations }
    paramFilePath, paramFileName: String;
    CurrentMachineName: String;
    ListSlotsStr, ListMediaStr: String;
    procedure AddParamSamples;
    procedure WriteCustomCommandLine;
    procedure Resize4K;
    procedure ResizeLowRes;
    procedure AdjustMachinesPanel;
    procedure PopulateMachinesList;
    procedure MachinesSlotsFixTitle(ValidateTitleStrings: Boolean = True);
    procedure MachineCommandSetEditText;
    procedure MachineCommandShowSlotsMediaText(const GameName: WideString);
    procedure MachineCommandExecute;
    procedure MachinesPanelReadWrite(IsRead: Boolean);
  public
    { Public declarations }
  end;

var
  FormCustomParameters: TFormCustomParameters;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormCustomParameters.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormCustomParameters do
  begin
    ClientWidth:=  2874;
    ClientHeight:= 1191;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, GameIcon, LabelGameTitle, 1435, LabelEmulatorVersion, 1190);
    TopBar.Height:= 168;
    LabelEmulatorVersion.Height:= 70; // 4 lines of text

    FormMain.Set4KLabelSpecs(SoftwareUsageTitle, 16, 168, -1, -1, 16);
    FormMain.Set4KLabelFontNameSpecs(SoftwareUsageTitle);
    FormMain.Set4KLabelSpecs(SoftwareUsageText, 202, 173, 1213, 24, 14);

    FormMain.Set4KLabelSpecs(SoftwareRequirementTitle, 16, 198, -1, -1, 16);
    FormMain.Set4KLabelFontNameSpecs(SoftwareRequirementTitle);
    FormMain.Set4KLabelSpecs(SoftwareRequirementText, 386, 203, 1029, 24, 14);

    FormMain.Set4KBoxLabel(CustomParametersGroupBox, CustomParametersGroupBoxLabel, 16, 243, 93, 1398);
    //CustomParametersGroupBoxLabel.Caption:= 'Custom Paramters                                               '+
    //          '(for software lists, you can enter a machine name before the parameters to overwrite current selected MAME machine)';

    FormMain.Set4KEditSpecs(CustomParameters_Edit, 10, 45, CustomParametersGroupBox.Width-22, 36, 18);

    FormMain.Set4KLabelSpecs(LabelTips1, 24, 352, -1, -1, 16);
    LabelTips1.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KLabelSpecs(LabelTips1ParamMedia1, 69, 352, -1, -1, 16);
    LabelTips1ParamMedia1.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KLabelSpecs(LabelTips1ParamMedia2, 712, 379, -1, -1, 16);
    LabelTips1ParamMedia2.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KLabelSpecs(LabelTips2, 24, 414, -1, -1, 16);
    LabelTips2.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KLabelSpecs(LabelTips1ParamGameTag, 169, 414, -1, -1, 16);
    LabelTips1ParamGameTag.Font.Name:= FormMain.Get4KSystemFont;

    FormMain.Set4KBoxLabel(CustomParametersSamplesGroupBox, CustomParametersSamplesGroupBoxLabel, 16, 457, 647, 1398);
    FormMain.Set4KRichEditSpecs(CustomParametersSamples, 11, 46, CustomParametersSamplesGroupBox.Width-24, CustomParametersSamplesGroupBox.Height-46-13, 16);
    FormMain.Set4KShapeSpecs(CustomParametersSamplesFrame, 10, 45, CustomParametersSamplesGroupBox.Width-22, CustomParametersSamplesGroupBox.Height-45-12);

    FormMain.Set4KButtonSpecs(ButtonMachinesPanelShowHide,
                              CustomParametersGroupBox.Left+CustomParametersGroupBox.Width-32, 374, 32, 45, 22, 1);
     
    // "Machine Slots Info" panel
    FormMain.Set4KBoxLabel(PanelMachineSlotsGroupBox, PanelMachineSlotsGroupBoxLabel, 1439, 16, 1159, 1419);

    FormMain.Set4KListViewSpecs(MachinesListView, 10, 45, PanelMachineSlotsGroupBox.Width-22, 271, 16);
    MachinesListView.CellSizes.Report.Height:= 37;

    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 0, 651);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 1, 205);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 2, 160);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 3, 205);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 4, 140);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 5, 34);

    MachinesListView.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    //MachinesListEditor.PaintInfoColumn.CaptionIndent:= 4; // reset to default value

    FormMain.Set4KButtonSpecs(MachineSlotsRunCommandButtonRun, PanelMachineSlotsGroupBox.Width-11-168,
                              MachinesListView.Top+MachinesListView.Height+10, 168, 36, 16);
    FormMain.Set4KEditSpecs(MachineSlotsRunCommand, 360, MachineSlotsRunCommandButtonRun.Top, MachineSlotsRunCommandButtonRun.Left-5-360, 36, 18);
    FormMain.Set4KLabelSpecs(MachineSlotsRunCommandLabel, 214, MachineSlotsRunCommand.Top+2, -1, -1, 16);

    FormMain.Set4KRadioButtonSpecs(MachinesSlotsRadioButton,  16, MachineSlotsRunCommand.Top, 75, 36, 16);
    FormMain.Set4KRadioButtonSpecs(MachinesMediaRadioButton, 105, MachineSlotsRunCommand.Top, 90, 36, 16);

    FormMain.Set4KShapeSpecs(MachineSlotsInfoFrame, 10, MachineSlotsRunCommand.Top+46, PanelMachineSlotsGroupBox.Width-22,
                             PanelMachineSlotsGroupBox.Height-12-(MachineSlotsRunCommand.Top+46));

    FormMain.Set4KLabelSpecs(MachineSlotsInfoTitleLabel, 13, MachineSlotsInfoFrame.Top+2, MachineSlotsInfoFrame.Width-6, 29, 18);
    FormMain.Set4KRichEditSpecs(MachineSlotsInfo, 12, MachineSlotsInfoFrame.Top+2+29, MachineSlotsInfoFrame.Width-4, MachineSlotsInfoFrame.Height-4-29, 18);

    PanelBottom.Height:= 71;
    FormMain.Set4KButtonSpecs(ButtonReload, 10, 16, 100, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonCancel, CustomParametersGroupBox.Left+CustomParametersGroupBox.Width-168, 16, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk, ButtonCancel.Left-10-168, 16, 168, 45, 16);
    FormMain.Set4KLabelSpecs(LabelCustomParamFile, ButtonReload.Left+ButtonReload.Width+10, 25, 935, 28, 16);
  end;
end;

procedure TFormCustomParameters.ResizeLowRes;
var
   iResW, iDiff: Integer;
begin
  if Is4KMode then
     Exit;

  iResW:= Screen.Width;
  if iResW >= 1600 then
     Exit;

  iDiff:= FormCustomParameters.Width-(iResW-26); // screen resolution - 26 pixels to give it some room

  // 1533 is the form with

  if iResW > 1280 then // 1340 -> 193 pixels too big
     FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 0, 231) // -> 103 less
  else
  if iResW < 1360 then // 1254 -> 279 pixels too big (resolutions 1280 ; 1152 ; 1024)
      begin
        FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 0, 227); // -> 107 less
        MachinesListView.Header.Columns[4].Visible:= False; // hide "save state" column
      end;

  FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 1,  70); // ->  40 less
  FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 3,  70); // ->  40 less

  MachineSlotsRunCommand.Width:= MachineSlotsRunCommand.Width-iDiff;
  MachineSlotsRunCommandButtonRun.Left:= MachineSlotsRunCommandButtonRun.Left-iDiff;

  MachinesListView.Width:= MachinesListView.Width-iDiff;
  MachineSlotsInfoTitleLabel.Width:= MachineSlotsInfoTitleLabel.Width-iDiff;
  MachineSlotsInfo.Width:= MachineSlotsInfo.Width-iDiff;
  MachineSlotsInfoFrame.Width:= MachineSlotsInfoFrame.Width-iDiff;

  PanelMachineSlotsGroupBox.Width:= PanelMachineSlotsGroupBox.Width-iDiff;

  FormCustomParameters.ClientWidth:= FormCustomParameters.ClientWidth-iDiff;
end;

procedure TFormCustomParameters.AdjustMachinesPanel;
var
  iDiff, iCount, iScrollBar: Integer;
begin
  iCount:= MachinesListView.Groups.ItemCount;
  if iCount >= 6 then
     Exit;

  if MachinesListView.Scrollbars.HorzBarVisible then
     iScrollBar:= GetSystemMetrics(SM_CXHSCROLL)
  else
     iScrollBar:= 0;

  iDiff:= (MachinesListView.CellSizes.Report.Height*iCount)+4+MachinesListView.Header.Height+7+iScrollBar;
  iDiff:= MachinesListView.Height-iDiff;

  if iDiff = 0 then
     Exit;

  MachinesListView.Height:= MachinesListView.Height-iDiff;
  MachinesSlotsRadioButton.Top:= MachinesSlotsRadioButton.Top-iDiff;
  MachinesMediaRadioButton.Top:= MachinesMediaRadioButton.Top-iDiff;
  MachineSlotsRunCommandLabel.Top:= MachineSlotsRunCommandLabel.Top-iDiff;
  MachineSlotsRunCommand.Top:= MachineSlotsRunCommand.Top-iDiff;
  MachineSlotsRunCommandButtonRun.Top:= MachineSlotsRunCommandButtonRun.Top-iDiff;

  MachineSlotsInfoFrame.Top:= MachineSlotsInfoFrame.Top-iDiff;
  MachineSlotsInfoFrame.Height:= MachineSlotsInfoFrame.Height+iDiff;
  MachineSlotsInfoTitleLabel.Top:= MachineSlotsInfoTitleLabel.Top-iDiff;

  MachineSlotsInfo.Top:= MachineSlotsInfo.Top-iDiff;
  MachineSlotsInfo.Height:= MachineSlotsInfo.Height+iDiff;
end;

procedure TFormCustomParameters.AddParamSamples;

  function AddSample(const TitleStr, ParameterStr: WideString): Boolean;
  var
    iSize: Integer;
  begin
    Result:= True;
    //CustomParametersSamples.SelAttributes.Style:= [fsBold];
    CustomParametersSamples.SelText:= TitleStr+#13;
    CustomParametersSamples.SelAttributes.Style:= [];

    if CustomParametersSamples.Font.Size = 16 then // if Is4KMode then
       iSize:= 18
    else
       iSize:= 10;
    if IsNightMode then
       CustomParametersSamples.SelAttributes.Color:= clCream;
    CustomParametersSamples.SelAttributes.Size:= iSize;
    CustomParametersSamples.SelAttributes.Name:= 'Consolas';
    CustomParametersSamples.SelText:= ParameterStr+#13;
    CustomParametersSamples.SelAttributes.Size:= CustomParametersSamples.Font.Size;
    CustomParametersSamples.SelAttributes.Name:= FormMain.Get4KFont;
    if IsNightMode then
       CustomParametersSamples.SelAttributes.Color:= CustomParametersSamples.Font.Color;
  end;

begin
  CustomParametersSamples.SelStart:=  0; // move caret to the beginning of the text; no need to move scrollar to the top anymore
  CustomParametersSamples.SelLength:= 0; // ensure no text is selected
  AddSample('    TI-99/4A cartridge game (ti99_cart.xml software) with arguments to attach the speech synthesizer',
            '-ioport peb -ioport:peb:slot3 speech');

  AddSample(#13+'    Intellivision cartridge game (intv.xml software) with arguments to attach the Intellivoice Voice Synthesis Module',
            '-cart1 voice -cart2');

  AddSample(#13+'    MSX cartridge game (msx1_cart.xml software) with arguments to overwrite selected MAME machine and insert the cartridge in slot #2',
            'fsa1wsx -cart2');

  AddSample(#13+'    MSX cartridge game (msx1_cart.xml software) with arguments to attach the MoonSound cartridge and insert the cartridge in slot #2',
            '-cartslot1 moonsound -cart2');

  Addsample(#13+'    Commodore 64 floppy game (c64_flop_misc.xml software) with arguments to load and run the game without typing commands',
            '-autoboot_delay "2" -autoboot_command "LOAD\"ARTHUR\",8\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nRUN\n"');

  AddSample(#13+'    Atari 800 machine with arguments to attach a cassette tape player',
                //'    (notice the <gamename> tag)',
            '-sio cassette');

  CustomParametersSamples.SelStart:=  0;
  CustomParametersSamples.SelLength:= 0;
  CustomParametersSamples.ReadOnly:= True;
end;

procedure TFormCustomParameters.WriteCustomCommandLine;
var
  CommandLineFile: TStrings;
  pStr: String;
begin
  if CheckReadOnly(paramFilePath+paramFileName) then
     Exit;

  pStr:= Trim(CustomParameters_Edit.Text);
  if pStr = '' then
     Exit;

  try
    CommandLineFile:= TStringList.Create;
    CommandLineFile.Add('custom_params='+pStr);
    ForceDirectories(ExtractFilePath(paramFilePath+paramFileName));
    CommandLineFile.SaveToFile(paramFilePath+paramFileName);
  finally
    FreeAndNil(CommandLineFile);
  end;
end;

procedure TFormCustomParameters.PopulateMachinesList;
var
  Item: TEasyItem;
  Group: TEasyGroup;
  slName, mName, iCurrentMachineName: String;
  LastUsedMachine: THashedStringList;
  LastUsedIndex: Integer;
  iStr: String;

  function AddMachineToList: Boolean;
  var
    Loop: Byte;
  begin
    //if Result then
    //   Result:= IsROM_Have(TEasyGameInfo(Item).eROMIdentification); // machines you don't have are also added to the list
    if FormMain.TempGameVars.eSoftwareName <> '' then
    begin
      Result:= TEasyGameInfo(Item).eSystemID = FormMain.TempGameVars.eSystemID;
      if Result then
         Result:= Length(TEasyGameInfo(Item).eSoftwareList) > 0;
      if Result then
      begin
        for Loop:= Low(TEasyGameInfo(Item).eSoftwareList) to High(TEasyGameInfo(Item).eSoftwareList) do
        begin
          mName:= TEasyGameInfo(Item).eSoftwareList[Loop];
          if mName = slName then
          begin
            with MachinesListView.Items.Add do
            begin
              Tag:= uMain.TEasyGameInfo(Item).eGameSetStatus;
              ImageIndex:= FormMain.GetMAMEImageIndex(TEasyGameInfo(Item).eROMIdentification, TEasyGameInfo(Item).eSoftwareName, TEasyGameInfo(Item).eGameSetStatus);
              case TEasyGameInfo(Item).eIsFavorite of
                True : StateImageIndexes[0]:= 3;
                False: StateImageIndexes[0]:= 500;
              end;
              StateImageIndexes[5]:= TEasyGameInfo(Item).eDriverStatus;

              Caption:= TEasyGameInfo(Item).eTitle;
              Captions[1]:= TEasyGameInfo(Item).eName;
              iStr:= TEasyGameInfo(Item).eScreenRefreshRate;
              if iStr <> '' then
              begin
                if not Is4KMode then
                   iStr:= Format('%2.2f', [StrToFloat(iStr)]);
                iStr:= iStr+' Hz';
              end;
              Captions[2]:= iStr;
              Captions[3]:= TEasyGameInfo(Item).eClone;
              Captions[4]:= aSaveState[TEasyGameInfo(Item).eSaveState];
              if TEasyGameInfo(Item).eName = CurrentMachineName then
                 begin
                   Selected:= True;
                   Focused:=  True;
                   MachinesListView.Hint:= Captions[1];
                   MachineSlotsRunCommand.Text:= ListSlotsStr;
                 end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      with MachinesListView.Items.Add do
      begin
        Tag:= FormMain.TempGameVars.eGameSetStatus;
        ImageIndex:= FormMain.GetMAMEImageIndex(FormMain.TempGameVars.eROMIdentification, FormMain.TempGameVars.eSoftwareName, FormMain.TempGameVars.eGameSetStatus);
        case FormMain.TempGameVars.eIsFavorite of
          True : StateImageIndexes[0]:= 3;
          False: StateImageIndexes[0]:= 500;
        end;
        StateImageIndexes[5]:= FormMain.TempGameVars.eDriverStatus;

        Caption:= FormMain.TempGameVars.eTitle;
        Captions[1]:= FormMain.TempGameVars.eName;
        iStr:= FormMain.TempGameVars.eScreenRefreshRate;
        if iStr <> '' then
        begin
          if not Is4KMode then
             iStr:= Format('%2.2f', [StrToFloat(iStr)]);
          iStr:= iStr+' Hz';
        end;
        Captions[2]:= iStr;
        Captions[3]:= FormMain.TempGameVars.eClone;
        Captions[4]:= aSaveState[FormMain.TempGameVars.eSaveState];

        Selected:= True;
        Focused:=  True;
        MachinesListView.Hint:= Captions[1];
        MachineSlotsRunCommand.Text:= ListSlotsStr;
      end;
    end;
  end;

  function ELV_PopulateSoftwareMachines: Boolean;
  begin
    Result:= True;
    if FormMain.TempGameVars.eSoftwareName <> '' then
       slName:= FormMain.TempGameVars.eSoftwareName
    else
       slName:= FormMain.TempGameVars.eName;
    MachinesListView.BeginUpdate;
    MachinesListView.Items.ReIndexDisable:= True;

    if FormMain.TempGameVars.eSoftwareName <> '' then
    begin
      if FormMain.IsGroupedView then
      begin
        Group:= FormMain.GamesListView.Groups.FirstGroup;
        repeat
          if (TGroupInfo(Group).eSoftwareName = '') and (TGroupInfo(Group).eSystemID = FormMain.TempGameVars.eSystemID) then
          begin
            Item:= FormMain.GamesListView.Groups.FirstInGroup(Group);
            repeat
              AddMachineToList;
              Item:= FormMain.GamesListView.Groups.NextInGroup(Group, Item);
            until (Item = nil);
          end;
          Group:= FormMain.GamesListView.Groups.NextGroup(Group);
        until Group = nil;
      end
      else
      begin
        Item:= FormMain.GamesListView.Groups.FirstItem;
        repeat
          if TEasyGameInfo(Item).eSoftwareName = '' then
             AddMachineToList;
          Item:= FormMain.GamesListView.Groups.NextItem(Item);
        until Item = nil;
      end;
    end
    else
      AddMachineToList; // game name, clone of, machine name (no need to go search main games list)

    MachinesListView.Sort.SortAll;
    MachinesListView.Items.ReIndexDisable:= False;
    MachinesListView.EndUpdate;
    if MachinesListView.Scrollbars.VertBarVisible then
       begin
         MachinesListView.BeginUpdate;
         MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
         MachinesListView.EndUpdate;
         //MachinesListView.Height:= MachinesListView.Height+1;
         //MachinesListView.Height:= MachinesListView.Height-1;
       end;

    if FormMain.CheckSelected(MachinesListView) then
       MachinesListView.Selection.First.MakeVisible(emvMiddle);
  end;

begin
  if not PanelMachineSlotsGroupBox.Visible then
     Exit; // screen resolution is too small

  //if FormMain.TempGameVars.eSoftwareName = ''  then
  //   Exit;

  if FormMain.TempGameVars.eSoftwareName <> ''  then
     FormMain.ShowFilterMsgBox('View Slots / Media Options', 'Populating compatible machines list, please wait...', FormMain.IsGroupedView)
  else
     FormMain.ShowFilterMsgBox('View Slots / Media Options', 'Populating machines list, please wait...', FormMain.IsGroupedView);

  if FormMain.TempGameVars.eSoftwareName <> ''  then
  begin
    LastUsedIndex:= -1;
    LastUsedMachine:= THashedStringList.Create;
    iCurrentMachineName:= '';

    if FileExists(FormMain.GetMAMEMachineSoftListFile(True, FormMain.TempGameVars.eSystemID)) then
       begin
         LastUsedMachine.LoadFromFile(FormMain.GetMAMEMachineSoftListFile(True, FormMain.TempGameVars.eSystemID));
         LastUsedIndex:= LastUsedMachine.IndexOfName(FormMain.TempGameVars.eSoftwareName);
         if LastUsedIndex <> -1 then
            iCurrentMachineName:= LastUsedMachine.Values[FormMain.TempGameVars.eSoftwareName];
       end;

    CurrentMachineName:= iCurrentMachineName;
  end
  else
  begin
    // game name, clone of, selected machine
    CurrentMachineName:= MachinesListView.Hint;    
  end;
  if CurrentMachineName = '' then
     CurrentMachineName:= MachinesListView.Hint;

  MachinesListView.Hint:= '';
  ELV_PopulateSoftwareMachines;

  FormMain.HideFilterMsgBox;
  if FormMain.CheckTotal(MachinesListView) then
     begin
       if MachinesListView.Groups.ItemCount > 1 then
       begin
         //if FormArcadeSoftwareListMachineToRunGame.ShowModal = mrYes then
         //begin
         //  //if CheckSelected(FormArcadeSoftwareListMachineToRunGame.MachinesListView) then
         //  //   iCurrentMachineName:= FormArcadeSoftwareListMachineToRunGame.MachinesListView.Selection.First.Captions[1];
         //end;
       end
       else
       begin
         if iCurrentMachineName = '' then
            begin
              // no machine is selected or there is only one machine for the selected MAME software list
              iCurrentMachineName:= MachinesListView.Groups.FirstItem.Captions[1];
            end;
       end;
     end
  else
     FormMain.ShowMessageBox('Info', 'Select Machine to Run Software List Game',
                             '    No machine sets were found. Make sure you have a MAME games list.'+#13#10+
                             'Software List: '+FormMain.TempGameVars.eCategory+' ['+FormMain.TempGameVars.eSoftwareName+']');
  //FormMain.ClearListView(MachinesListView);
  FreeAndNil(LastUsedMachine);

  // Result:= {MachineNameVar:= }iCurrentMachineName; // this will be used in the uMain.ExecuteGame command line... MAME/HBMAME only!
end;

procedure TFormCustomParameters.MachinesSlotsFixTitle(ValidateTitleStrings: Boolean = True);
var
  iLineStr: WideString;
begin
  if ValidateTitleStrings then
  begin
    MachineSlotsInfoTitleLabel.Caption:= '';
    if MachineSlotsInfo.Lines.Count < 2 then
       Exit;

    iLineStr:= MachineSlotsInfo.Lines[1];
    if iLineStr = '' then
       Exit;
    if iLineStr[1] <> '-' then
       Exit;
  end;

  //iLineStr:= MachineSlotsInfo.Lines[0];
  //MachineSlotsInfo.SelStart:= 0;
  //MachineSlotsInfo.SelLength:= Length(iLineStr);
  //MachineSlotsInfo.SelAttributes.Color:= clCream;
  //MachineSlotsInfo.SelAttributes.Style:= [fsBold];
  if ValidateTitleStrings then
     begin
       MachineSlotsInfoTitleLabel.Caption:= MachineSlotsInfo.Lines[0];
       MachineSlotsInfo.Lines.Delete(1); // delete the "------- -----" line from the title header
       MachineSlotsInfo.Lines.Delete(0); // delete the "------- -----" line from the title header
     end;
  //MachineSlotsInfo.SelLength:= 0; // make sure no text is selected
  //MachineSlotsInfo.SelStart:=  0; // move caret to the beginning of the text (move scroll bar to the top)
end;

procedure TFormCustomParameters.MachineCommandSetEditText;
var
  iStr: String;
begin
  if FormMain.CheckSelected(MachinesListView) then
     begin
       if MachinesSlotsRadioButton.Checked then
          iStr:= ListSlotsStr
       else
          iStr:= ListMediaStr;
     end
  else
     iStr:= '';
  if not SameText(MachineSlotsRunCommand.Text, iStr) then
     MachineSlotsRunCommand.Text:= iStr;
end;

procedure TFormCustomParameters.MachineCommandShowSlotsMediaText(const GameName: WideString);
var
  iFile: TStrings;
  iLoop, iNameLength: Integer;
  iStr: String;
  FoundEntry: Boolean;
begin

    case MachinesSlotsRadioButton.Checked of
      True : iStr:= FormMain.GetMAMEListSlotsFile(FormMain.TempGameVars.eSystemID, True);
      False: iStr:= FormMain.GetMAMEListMediaFile(FormMain.TempGameVars.eSystemID, True);
    end;
    if not FileExists(iStr) then
       Exit;
    iFile:= TStringList.Create;
    iFile.LoadFromFile(iStr);
    if iFile.Count = 0 then
       begin
         FreeAndNil(iFile);
         Exit;
       end;

  MachineSlotsInfo.ReadOnly:= False; // must do this so the ENTER char #13 is properly added (TntRichEdit unicode bug ?)
  MachineSlotsInfo.Lines.BeginUpdate;
  MachineSlotsInfo.Clear;
  MachineSlotsInfo.SelStart:=  0;
  MachineSlotsInfo.SelLength:= 0; // ensure no text is selected
  iNameLength:= Length(GameName)+1;
  FoundEntry:= False;

  MachineSlotsInfoTitleLabel.Caption:= iFile[0];
  //MachineSlotsInfo.SelText:= iFile[0]+#13; // add header

  if MachinesSlotsRadioButton.Checked then
  begin
    // -listslots
    for iLoop:=2 to iFile.Count-1 do
    begin
      iStr:= iFile[iLoop];
      if FoundEntry then
         begin
           if (iStr <> '') and (iStr[1] <> ' ') then
              Break
           else
              MachineSlotsInfo.SelText:= iStr+#13;
         end
      else
         begin
           if SameText(Copy(iStr, 1, iNameLength), GameName+' ') then
              begin
                FoundEntry:= True;
                MachineSlotsInfo.SelText:= iStr+#13;
              end;
         end;
    end;
  end
  else
  begin
    // -listmedia
    for iLoop:=2 to iFile.Count-1 do
    begin
      iStr:= iFile[iLoop];
      if FoundEntry then
         begin
           if (iStr <> '') and (not SameText(Copy(iStr, 1, iNameLength), GameName+' ')) then
              Break
           else
              MachineSlotsInfo.SelText:= iStr+#13;
         end
      else
         begin
           if SameText(Copy(iStr, 1, iNameLength), GameName+' ') then
              begin
                FoundEntry:= True;
                MachineSlotsInfo.SelText:= iStr+#13;
              end;
         end;
    end;
  end;
  MachinesSlotsFixTitle(False);
  MachineSlotsInfo.Lines.EndUpdate;

  FreeAndNil(iFile);
  MachineSlotsInfo.ReadOnly:= True;
end;

procedure TFormCustomParameters.MachineCommandExecute;
var
  CommandLine: String;
begin
  if not FormMain.CheckSelected(MachinesListView) then
     Exit;
  CommandLine:= Trim(MachineSlotsRunCommand.Text);
  if CommandLine = '' then
     CommandLine:= MachinesListView.Hint+' '+ListSlotsStr
  else
  begin
    CommandLine:= MachinesListView.Hint+' '+LowerCase(CommandLine);
    if (PosEx(ListSlotsStr, CommandLine) = 0) and (PosEx(ListMediaStr, CommandLine) = 0) then
       CommandLine:= CommandLine+' '+ListSlotsStr;
  end;

  CommandLine:= SystemStr+FormMain.EmulatorFile[FormMain.TempGameVars.eSystemID]+SystemStr+' '+CommandLine;

  MachineSlotsInfo.Lines.BeginUpdate;
  MachineSlotsInfo.Clear;
  MachineSlotsInfo.SelStart:= 0;
  FormMain.RunProcessCaptureConsoleOutput(CommandLine, nil, MachineSlotsInfo); // create a pipe with the CreateProcess() API and send DOS box text to a StringList
  MachinesSlotsFixTitle;                // content will be sent directly to the RichEdit (no TStringList var required)
  MachineSlotsInfo.Lines.EndUpdate;
end;

procedure TFormCustomParameters.MachinesPanelReadWrite(IsRead: Boolean);
var
  iFile: TMemIniFile;
begin
  if IsRead and (not FormMain.ValidateFile(FormMain.GetFrontendIniFile)) then
     Exit;

  iFile:= TMemIniFile.Create(FormMain.GetFrontendIniFile);
  if IsRead then
     begin
       if iFile.ReadInteger('Preferences', 'CustomParameters_ShowMachinesPanel', 1) = 0 then
          begin
            ButtonMachinesPanelShowHide.Click;
            FormCustomParameters.Left:= (Screen.Width-FormCustomParameters.Width) div 2;
          end;
     end
  else
     begin
       iFile.WriteInteger('Preferences', 'CustomParameters_ShowMachinesPanel', ButtonMachinesPanelShowHide.Tag);
       iFile.UpdateFile;
     end;
  FreeAndNil(iFile);
end;

procedure TFormCustomParameters.FormShow(Sender: TObject);
var
  Loop: Integer;
  iStr: String;
begin
  FormMain.ELV_ResetNormalColors(MachinesListView);
  FormMain.ClearListView(MachinesListView);
  MachineSlotsInfo.Clear;
  CustomParametersSamples.Clear; // ensure TntRichEdit is clear of any texts to prevent garbage (Unicode mode enabled does this)
  //if (not Is4KMode) and (Screen.Width < 1600) then
  //   begin
  //     ClientWidth:= 779; // for standard resolution mode
  //     PanelMachineSlotsGroupBox.Visible:= False;
  //   end;
  Resize4K;
  ResizeLowRes;

  if SystemIcon.Tag <> 2 then
  begin
    FormMain.LoadSystemROMIdIcon(FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eCustomSystemID, FormMain.TempGameVars.eROMIdentification, SystemIcon, FormMain.TempGameVars.eSoftwareName, FormMain.TempGameVars.eGameSetStatus, FormMain.TempGameVars.eIsCustomGame);
    if SystemIcon.Tag <> 3 then
       FormMain.LoadGameIcon(GameIcon, False)
    else
       FormMain.LoadSystemIcon(FormMain.TempGameVars.eSystemID, GameIcon, False); // edit "machine to run software game with"

    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : LabelEmulatorVersion.Caption:= 'name: '+FormMain.TempGameVars.eName+' [clone of '+FormMain.TempGameVars.eClone+']';
      False: LabelEmulatorVersion.Caption:= 'name: '+FormMain.TempGameVars.eName;
    end;
    if SystemIcon.Tag = 3 then
       LabelEmulatorVersion.Caption:= 'machine '+LabelEmulatorVersion.Caption;

    if FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eName) then
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [bios '+FormMain.TempGameVars.eBiosName+']';

    if FormMain.TempGameVars.eSoftwareName <> '' then             //  change this to [software n64: Nintendo 64] ?
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [software '+FormMain.TempGameVars.eSoftwareName+']';

    if FormMain.TempGameVars.eIsMerged then
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [merged]';

    if FormMain.TempGameVars.eSoftwareName <> '' then
       begin
         //LabelEmulatorVersion.Layout:= tlTop;
         LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+'software list: '+FormMain.TempGameVars.eCategory;
         if FormMain.TempGameVars.eSoftwareCompatible <> '' then
            LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+FormMain.TempGameVars.eSoftwareCompatible;
       end
    else
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+FormMain.EmulatorVersion[FormMain.TempGameVars.eSystemID];

    //LabelScanMode.Caption:= LabelScanMode.Hint+#13#10+aScanMode[FormMain.TempGameVars.eScanMode];

    SetFormColors(FormCustomParameters, TopBar, PanelBottom, LabelGameTitle, LabelEmulatorVersion, nil, FormMain.TempGameVars.eGameSetStatus, IsNightMode);
    SetColorsGameTopBar(FormMain.TempGameVars.eGameSetStatus, TopBar); // change top bar color based on game set status
  end
  else
  begin
    FormMain.LoadSystemIcon(-1, SystemIcon, False);
    if FormMain.TempGameVars.eName = FormMain.TempGameVars.eSoftwareName then
       FormMain.GetMediaTypeIconMsgBox(FormMain.TempGameVars.eCustomMediaType, FormMain.TempGameVars.eIsCustomGame,
                                  FormMain.TempGameVars.eMediaType, FormMain.TempGameVars.eArcadeCHDMediaType, GameIcon,
                                  FormMain.TempGameVars.eSoftwareExecParameter, FormMain.TempGameVars.eSoftwareName, True)
    else
    if FormMain.TempGameVars.eSoftwareCompatible <> '' then
       FormMain.LoadSystemROMIdIcon(FormMain.TempGameVars.eSystemID, -1, FormMain.TempGameVars.eROMIdentification, GameIcon, FormMain.TempGameVars.eSoftwareName, FormMain.TempGameVars.eGameSetStatus, False)
    else
       FormMain.LoadSystemIcon(-1, GameIcon, False);
    SetFormColors(FormCustomParameters, TopBar, PanelBottom, LabelGameTitle, LabelEmulatorVersion, nil, -1, IsNightMode);
    LabelEmulatorVersion.Caption:= 'software name: '+FormMain.TempGameVars.eName;
    if FormMain.TempGameVars.eSoftwareCompatible <> '' then
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+FormMain.TempGameVars.eSoftwareCompatible;
  end;

  //add the requirement parameter or software name or device above the "usage: " text ????
  //Grab from ...FormMain.SoftListGetRequirementInfo(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSoftwareName, ReqSetName, ReqSoftwareName);
  LabelGameTitle.Caption:= FormMain.TempGameVars.eTitle;

  if IsNightMode then
     begin
       for Loop:= 0 to FormCustomParameters.ComponentCount-1 do
       begin
         if FormCustomParameters.Components[Loop] is TPanelEx then
         begin
           iStr:= TPanelEx(FormCustomParameters.Components[Loop]).Name;
           if PosEx('GroupBox', iStr) <> 0 then
              begin
                SetPanelColors(TPanelEx(FormCustomParameters.Components[Loop]), clrMedDarkGray, -1, True);
                SetPanelBorderColors(TPanelEx(FormCustomParameters.Components[Loop]), clrLightGrayFrame, clrBorderGroupBoxGrayBk);
              end;
         end
         else
         if FormCustomParameters.Components[Loop] is TShadowLabel then
         begin
           iStr:= TPanelEx(FormCustomParameters.Components[Loop]).Name;
           if PosEx('GroupBoxLabel', iStr) <> 0 then
           begin
             SetLabelBkFrameColors(TShadowLabel(FormCustomParameters.Components[Loop]), clrBorderGroupBoxGrayBk, $00404040, clBlack);
             SetLabelColors(TShadowLabel(FormCustomParameters.Components[Loop]), clCream);
           end;
         end
         else
         if FormCustomParameters.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormCustomParameters.Components[Loop]))
         else
         if FormCustomParameters.Components[Loop] is TEditEx then
            SetEditNightColors(TEditEx(FormCustomParameters.Components[Loop]))
         else
         if FormCustomParameters.Components[Loop] is TAdvOfficeRadioButtonEx then
         begin
           SetRadioButtonColors(TAdvOfficeRadioButtonEx(FormCustomParameters.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
           TAdvOfficeRadioButtonEx(FormCustomParameters.Components[Loop]).DisabledFontColor:= clGray;
           TAdvOfficeRadioButtonEx(FormCustomParameters.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
           FormMain.SetRadioButtonExCustomIcon(TAdvOfficeRadioButtonEx(FormCustomParameters.Components[Loop]));
         end;
       end;

       CustomParametersSamples.Color:= CustomParameters_Edit.Color;
       CustomParametersSamples.Font.Color:= item_caption_active_color[1];
       FormMain.SetWin10DarkScrollBar(CustomParametersSamples);
       CustomParametersSamplesFrame.Pen.Color:= CustomParameters_Edit.ColorFrame;
       SetLabelColors(LabelCustomParamFile, clrLightRed);

       SetLabelColors(LabelTips1, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelTips2, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(LabelTips1ParamMedia1, clrLightGreen);
       SetLabelColors(LabelTips1ParamMedia2, clrLightGreen);

       SetLabelColors(LabelTips1ParamGameTag, clrOrange);

       SetLabelColors(SoftwareUsageTitle, clrLightRed);
       SetLabelColors(SoftwareUsageText,  item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(SoftwareRequirementTitle, clrLightRed);
       SetLabelColors(SoftwareRequirementText,  item_caption_active_color[1], item_caption_active_shadow_color[1]);

       // "Machine Slots Info" panel

       SetPanelColors(PanelMachineSlotsGroupBox, clrMedDarkGray, -1, True);
       SetPanelBorderColors(PanelMachineSlotsGroupBox, clrLightGrayFrame, clrBorderGroupBoxGrayBk);

       //SetLabelBkFrameColors(CommandLinePreviewGroupBoxLabel, clrBorderGroupBoxGrayBk, $00404040, clBlack);
       //SetLabelColors(CommandLinePreviewGroupBoxLabel, clCream);

       FormMain.SetEasyListViewColors(MachinesListView, menu_background_color[1]{CustomParameters_Edit.Color}, clWhite, -1, CustomParameters_Edit.ColorFrame);//clrBorderGroupBoxGrayBk);
       FormMain.SetEasyListViewHeaderColors(MachinesListView, True, False, Is4KMode, True);
       FormMain.ELV_SetRibbonNightColors(0, MachinesListView, True);
       FormMain.SetWin10DarkScrollBar(MachinesListView);

       SetLabelColors(MachineSlotsRunCommandLabel, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       MachineSlotsInfoFrame.Pen.Color:= CustomParameters_Edit.ColorFrame;
       MachineSlotsInfoFrame.Brush.Color:= CustomParameters_Edit.Color;
       MachineSlotsInfo.Color:= CustomParameters_Edit.Color;
       MachineSlotsInfo.Font.Color:= item_caption_active_color[1];
       MachineSlotsInfoTitleLabel.Font.Color:= clCream;
       FormMain.SetWin10DarkScrollBar(MachineSlotsInfo);
     end;

  paramFilePath:= FormMain.GetCustomParamsFolder(FormMain.TempGameVars.eSystemID);
  paramFileName:= GameIcon.Hint;
  LabelCustomParamFile.Caption:= paramFilePath+paramFileName;

  AddParamSamples;

  ButtonReload.Click;

  ListSlotsStr:= '-listslots';
  ListMediaStr:= '-listmedia';
  PopulateMachinesList;
  AdjustMachinesPanel;

  MachinesPanelReadWrite(True);
  if ButtonMachinesPanelShowHide.Tag = 1 then
     MachinesListView.SetFocus
  else
     CustomParametersSamples.SetFocus;
end;

procedure TFormCustomParameters.ButtonOkClick(Sender: TObject);
var
  iStr: String;
begin
  iStr:= Trim(CustomParameters_Edit.Text);
  if iStr = '' then
     FormMain.BlinkBkEdit(CustomParameters_Edit)
  else
     begin
       WriteCustomCommandLine;
       Close;
     end;
end;

procedure TFormCustomParameters.ButtonReloadClick(Sender: TObject);
var
  iStr: String;
begin
  iStr:= FormMain.CustomParam_ReadParams(paramFilePath+paramFileName);
  CustomParameters_Edit.Text:= iStr;
end;

procedure TFormCustomParameters.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormCustomParameters.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       FormMain.ClearListView(MachinesListView);
       MachinesPanelReadWrite(False);
     end;
end;

procedure TFormCustomParameters.MachinesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  FormMain.GetCanvasDefaultFont(ACanvas, Item.Tag, Item.StateImageIndexes[4], IsNightMode, Is4KMode);
  if Item.Captions[1] = CurrentMachineName then
     begin
       Item.Bold:= True;
       ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
       //if IsNightMode then
       //   ACanvas.Font.Color:= clrOrangeVivid;
     end;
end;

procedure TFormCustomParameters.MachinesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if MachinesListView.Hint <> Item.Captions[1] then
     begin
       MachinesListView.Hint:= Item.Captions[1];
       MachineCommandSetEditText;
       MachineCommandShowSlotsMediaText(Item.Captions[1]);
     end;
end;

procedure TFormCustomParameters.MachineSlotsRunCommandButtonRunClick(
  Sender: TObject);
begin
  MachineCommandExecute;
end;

procedure TFormCustomParameters.MachineSlotsRunCommandKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     MachineSlotsRunCommandButtonRun.Click;
end;

function TFormCustomParameters.MachinesListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(gItem1.Caption, gItem2.Caption);               // machine title
    1: Result:= FormMain.iCompare(gItem1.Captions[1], gItem2.Captions[1]);       // game name
    2: Result:= FormMain.iCompare(gItem1.Captions[2], gItem2.Captions[2]);       // monitor frequency (Hz)
    3: Result:= FormMain.iCompare(gItem1.Captions[3], gItem2.Captions[3]);       // clone of
  end;
end;

procedure TFormCustomParameters.MachinesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MachinesListView.BeginUpdate;
       MachinesListView.Sort.SortAll;
       MachinesListView.EndUpdate(False);
       FormMain.ELV_CheckItemVisible(MachinesListView, MachinesListView.Selection.First, True);
     end;
end;

procedure TFormCustomParameters.MachinesSlotsRadioButtonClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(MachinesListView) then
     begin
       MachineCommandSetEditText;
       MachineCommandShowSlotsMediaText(MachinesListView.Selection.First.Captions[1]);
     end;
end;

procedure TFormCustomParameters.MachineSlotsInfoURLClick(Sender: TObject;
  const URL: WideString);
begin
  CallShellExecute(nil, URL);
end;

procedure TFormCustomParameters.ButtonMachinesPanelShowHideClick(
  Sender: TObject);
var
  iBorder: Integer;
begin
  // Tag = 1 -> panel is visible
  // Tag = 0 -> panel is not visible
  ButtonMachinesPanelShowHide.Tag:= Ord(not Boolean(ButtonMachinesPanelShowHide.Tag));
  if Is4KMode then
     iBorder:= 16
  else
     iBorder:= 8;
  if ButtonMachinesPanelShowHide.Tag = 0 then
     begin
       // hide panel
       FormCustomParameters.ClientWidth:= CustomParametersGroupBox.Left+CustomParametersGroupBox.Width+iBorder;
       ButtonMachinesPanelShowHide.Caption:= '4'; // Marlett font, right arrow

     end
  else
     begin
       // show panel
       FormCustomParameters.ClientWidth:= PanelMachineSlotsGroupBox.Left+PanelMachineSlotsGroupBox.Width+iBorder;
       ButtonMachinesPanelShowHide.Caption:= '3'; // Marlett font, left arrow
     end;
end;

end.
