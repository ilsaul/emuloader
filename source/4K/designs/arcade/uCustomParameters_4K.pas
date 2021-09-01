unit uCustomParameters_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, GR32_Image, IniFiles,
  EditEx, ImgList, MPCommonObjects, EasyListview, ButtonsEx,
  AdvOfficeButtons, ShadowLabel, AdvGroupBox, PanelEx, TntComCtrls;

type
  TFormCustomParameters4K = class(TForm)
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
    PanelEx1: TPanelEx;
    ShadowLabel1: TShadowLabel;
    CustomParameters_Edit: TEditEx;
    LabelCustomParamFile: TShadowLabel;
    CustomParametersSamplesGroupBox: TPanelEx;
    CustomParametersSamplesGroupBoxLabel: TShadowLabel;
    CustomParametersSamples: TTntRichEdit;
    LabelTips1: TShadowLabel;
    LabelTips1Param1: TShadowLabel;
    LabelTips2: TShadowLabel;
    LabelTips1Tag: TShadowLabel;
    LabelTips1Param2: TShadowLabel;
    SoftwareUsageTitle: TShadowLabel;
    SoftwareUsageText: TShadowLabel;
    ShadowLabel2: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    PanelMachineSlots: TPanelEx;
    CommandLinePreviewGroupBoxLabel: TShadowLabel;
    MachineSlotsRunCommandLabel: TShadowLabel;
    MachineSlotsInfoFrame: TShape;
    MachinesListView: TEasyListview;
    MachineSlotsRunCommand: TEditEx;
    MachineSlotsRunCommandButtonRun: TBitBtnEx;
    MachineSlotsInfo: TTntRichEdit;
    RecordMovieAVI: TAdvOfficeRadioButtonEx;
    AdvOfficeRadioButtonEx1: TAdvOfficeRadioButtonEx;
    ShadowLabel4: TShadowLabel;
    BitBtnEx1: TBitBtnEx;
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonReloadClick(Sender: TObject);
  private
    { Private declarations }
    paramFilePath, paramFileName: String;
    procedure AddParamSamples;
    procedure WriteCustomCommandLine;
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormCustomParameters4K: TFormCustomParameters4K;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormCustomParameters4K.AddParamSamples;

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
    CustomParametersSamples.SelAttributes.Size:= iSize;
    CustomParametersSamples.SelAttributes.Name:= 'Consolas';
    CustomParametersSamples.SelText:= ParameterStr+#13;
    CustomParametersSamples.SelAttributes.Size:= CustomParametersSamples.Font.Size;
    CustomParametersSamples.SelAttributes.Name:= FormMain.Get4KFont;
  end;

begin
  CustomParametersSamples.SelStart:=  0; // move caret to the beginning of the text; no need to move scrollar to the top anymore
  CustomParametersSamples.SelLength:= 0; // ensure no text is selected
  AddSample('    TI-99/4A cartridge game (ti99_cart.xml software list) with the arguments to "attach" the speech synthesizer',
            '-ioport peb -ioport:peb:slot3 speech');

  AddSample(#13+'    Intellivision cartridge game (intv.xml software list) with the arguments to "attach" the Intellivoice Voice Synthesis Module',
            '-cart1 voice -cart2');

  AddSample(#13+'    MSX cartridge game (msx1_cart.xml software list) with a specific machine to override selected MAME machine and insert a game cartridge in slot #2.',
            'fsa1wsx -cart2');

  AddSample(#13+'    MSX cartridge game (msx1_cart.xml software list) with the arguments to "attach" the MoonSound cartridge and insert a game cartridge in slot #2.'+#13+
                '    (notice the <gamename> tag)',
            '-cart2 <gamename> -cartslot1 moonsound');

  CustomParametersSamples.ReadOnly:= True;
end;

procedure TFormCustomParameters4K.WriteCustomCommandLine;
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
    CommandLineFile.Add(pStr);
    CommandLineFile.SaveToFile(paramFilePath+paramFileName);
  finally
    FreeAndNil(CommandLineFile);
  end;
end;

procedure TFormCustomParameters4K.FormShow(Sender: TObject);
var
  Loop: Integer;
  iStr: String;
begin
  //Resize4K;

  CustomParametersSamples.Clear; // ensure RichEdit is clear of any texts to prevent garbage (Unicode mode enabled does this)

  if SystemIcon.Tag <> 2 then
  begin
    FormMain.LoadSystemROMIdIcon(FormMain.TempGameVars.eSystemID, FormMain.TempGameVars.eCustomSystemID, FormMain.TempGameVars.eROMIdentification, SystemIcon, FormMain.TempGameVars.eSoftwareName, FormMain.TempGameVars.eGameSetStatus, FormMain.TempGameVars.eIsCustomGame);
    FormMain.LoadGameIcon(GameIcon, False);

    case FormMain.GameIsClone(FormMain.TempGameVars.eClone) of
      True : LabelEmulatorVersion.Caption:= 'name: '+FormMain.TempGameVars.eName+' [clone of '+FormMain.TempGameVars.eClone+']';
      False: LabelEmulatorVersion.Caption:= 'name: '+FormMain.TempGameVars.eName;
    end;
    if FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.TempGameVars.eName) then
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [bios '+FormMain.TempGameVars.eBiosName+']';

    if FormMain.TempGameVars.eSoftwareName <> '' then             //  change this to [software n64: Nintendo 64] ?
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [software '+FormMain.TempGameVars.eSoftwareName+']';

    if FormMain.TempGameVars.eIsMerged then
       LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+' [merged]';

    if FormMain.TempGameVars.eSoftwareName <> '' then
       begin
         LabelEmulatorVersion.Layout:= tlTop;
         LabelEmulatorVersion.Height:= LabelEmulatorVersion.Height*2; // 54 pixels
         LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+'software list: '+FormMain.TempGameVars.eCategory;
         if FormMain.TempGameVars.eSoftwareUsageTip <> '' then
            LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+FormMain.TempGameVars.eSoftwareUsageTip;
       end;

    LabelScanMode.Caption:= LabelScanMode.Hint+#13#10+aScanMode[FormMain.TempGameVars.eScanMode];

    SetFormColors(FormCustomParameters4K, TopBar, PanelBottom, LabelGameTitle, LabelEmulatorVersion, LabelScanMode, FormMain.TempGameVars.eGameSetStatus, IsNightMode);
    SetColorsGameTopBar(FormMain.TempGameVars.eGameSetStatus, TopBar); // change top bar color based on game set status
  end
  else
  begin
    FormMain.LoadSystemIcon(-1, SystemIcon, False);
    SetFormColors(FormCustomParameters4K, TopBar, PanelBottom, LabelGameTitle, LabelEmulatorVersion, nil, -1, IsNightMode);
    LabelEmulatorVersion.Caption:= 'name: '+FormMain.TempGameVars.eName;
    LabelScanMode.Visible:= False;
  end;

  LabelGameTitle.Caption:= FormMain.TempGameVars.eTitle;

  if IsNightMode then
     begin
       for Loop:= 0 to FormCustomParameters4K.ComponentCount-1 do
       begin
         if FormCustomParameters4K.Components[Loop] is TPanelEx then
         begin
           iStr:= TPanelEx(FormCustomParameters4K.Components[Loop]).Name;
           if PosEx('GroupBox', iStr) <> 0 then
              begin
                SetPanelColors(TPanelEx(FormCustomParameters4K.Components[Loop]), clrMedDarkGray, -1, True);
                SetPanelBorderColors(TPanelEx(FormCustomParameters4K.Components[Loop]), clrLightGrayFrame, clrBorderGroupBoxGrayBk);
              end;
         end
         else
         if FormCustomParameters4K.Components[Loop] is TShadowLabel then
         begin
           iStr:= TPanelEx(FormCustomParameters4K.Components[Loop]).Name;
           if PosEx('GroupBoxLabel', iStr) <> 0 then
           begin
             SetLabelBkFrameColors(TShadowLabel(FormCustomParameters4K.Components[Loop]), clrBorderGroupBoxGrayBk, $00404040, clBlack);
             SetLabelColors(TShadowLabel(FormCustomParameters4K.Components[Loop]), clCream);
           end;
         end
         else
         if FormCustomParameters4K.Components[Loop] is TBitBtnEx then
            FormMain.SetButtonExColors(TBitBtnEx(FormCustomParameters4K.Components[Loop]))
         else
         if FormCustomParameters4K.Components[Loop] is TEditEx then
            SetEditNightColors(TEditEx(FormCustomParameters4K.Components[Loop]))
         else
         if FormCustomParameters4K.Components[Loop] is TAdvOfficeCheckBoxEx then
          begin
            SetCheckBoxColors(TAdvOfficeCheckBoxEx(FormCustomParameters4K.Components[Loop]), item_caption_active_color[1], item_caption_active_shadow_color[1]);
            TAdvOfficeCheckBoxEx(FormCustomParameters4K.Components[Loop]).DisabledFontColor:= clGray;
            TAdvOfficeCheckBoxEx(FormCustomParameters4K.Components[Loop]).DisabledFontShadowColor:= clrMedDarkGray;
            FormMain.SetCheckBoxExCustomIcon(TAdvOfficeCheckBoxEx(FormCustomParameters4K.Components[Loop]));
          end;
       end;

       CustomParametersSamples.Color:= CustomParametersSamplesGroupBox.Color1;//CustomParameters_Edit.Color;
       CustomParametersSamples.Font.Color:= item_caption_active_color[1];
       FormMain.SetWin10DarkScrollBar(CustomParametersSamples);
       SetLabelColors(LabelCustomParamFile, clrLightRed);

       SetLabelColors(LabelTips1, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelTips2, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       SetLabelColors(LabelTips1Tag, clrOrange);
       SetLabelColors(LabelTips2Tag, clrOrange);

       SetLabelColors(LabelTips1Param1, clrLightGreen);
       SetLabelColors(LabelTips1Param2, clrLightGreen);
       //CommandLinePreview.Color:= clrDarkGray;
       //CommandLinePreview.BorderStyle:= bsNone;
       //CommandLinePreview.Font.Color:= clCream;

       //FormMain.SetWin10DarkScrollBar(ParametersListView);
       //FormMain.SetWin10DarkScrollBar(CommandLinePreview);
     end;

  paramFilePath:= FormMain.GetCustomParamsFolder(FormMain.TempGameVars.eSystemID);
  paramFileName:= GameIcon.Hint;
  LabelCustomParamFile.Caption:= paramFilePath+paramFileName;
  
  AddParamSamples;

  ButtonReload.Click;
end;

procedure TFormCustomParameters4K.ButtonOkClick(Sender: TObject);
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

procedure TFormCustomParameters4K.ButtonReloadClick(Sender: TObject);
var
  iStr: String;
begin
  iStr:= FormMain.CustomParam_ReadParams(paramFilePath+paramFileName);
  CustomParameters_Edit.Text:= iStr;
end;


end.
