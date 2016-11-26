unit uGameDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, ToolWin, Buttons,
  uCommon, MPCommonObjects, MPCommonUtilities, EasyListview, ShadowLabel,
  PanelEx, // Internal error: U752 :_((( line '8'
  GraphicEx, Dialogs, ImgList;

const
  aGameStatus: String = 'Game Status';
  aScreenType: packed array[-1..3] of String = ('', 'Raster', 'Vector', 'LCD', 'Unknown');
  FileStatusStr: packed array[0..1] of String = ('Missing', 'Found');
  LeftTextMaxSize: Integer = 198;

type
  TFormGameDetails = class(TForm)
    TopBar: TPanelEx;
    ROMsListView: TEasyListview;
    FrameROMsListView: TShape;
    LabelYear: TShadowLabel;
    LabelYearValue: TShadowLabel;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    GameIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    LabelScanMode: TShadowLabel;
    IL_FileType: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ROMsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ROMsListViewItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ROMsListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    function ROMsListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
  private
    { Private declarations }
    //missFilesList: THashedStringList;
    IsZiNcSystem: Boolean;
    ZiNcFilePath: String;
    TextPos, LeftPanelSize, LeftPanelMinimumTextSize, LeftPanelLastText, LeftPanelLastTextHeight: Integer;
    missFile: TMemIniFile;
    function  FindZiNcFile(const NameString: String): String;
    function  CreateLabelTitle(const lTitle: String): TShadowLabel;
    function  CreateLabelValue(const tValue: String; DriverIndex: ShortInt = -1): TShadowLabel;
    function  AddEntry2(const sLabelTitle: String; sValue: WideString = ''; sImageIndex: ShortInt = -1): Boolean;
    //function  AddEntry2(const sLabelTitle: String; sValue: String = ''; sImageIndex: ShortInt = -1): Boolean;
    function  GetDriverStatusImageIndex(StatusID: ShortInt): ShortInt;
    procedure FillGameTree;
    procedure FillROMsTree;
  public
    { Public declarations }
  end;

var
  FormGameDetails: TFormGameDetails;

implementation

uses uMain;

{$R *.DFM}

function TFormGameDetails.FindZiNcFile(const NameString: String): String;
begin
  Result:= '';
  if ZiNcFilePath <> '' then
     begin
       if FileExists(ZiNcFilePath+NameString+'.zip') then
          Result:= ZiNcFilePath+NameString+'.zip';
     end;
end;

procedure TFormGameDetails.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#27, #13] then
     Close;
end;

function TFormGameDetails.CreateLabelTitle(const lTitle: String): TShadowLabel;
var
  newLabel: TShadowLabel;
begin
  newLabel:= TShadowLabel.Create(Self);
  newLabel.Parent:= FormGameDetails;
  newLabel.Font:= LabelYear.Font;
  newLabel.ShadowEnabled:= LabelYear.ShadowEnabled;
  newLabel.ShadowColor:= LabelYear.ShadowColor;
  newLabel.ShowAccelChar:= False;
  newLabel.Left:= LabelYear.Left;
  newLabel.Top:= TextPos;
  newLabel.Caption:= lTitle;
end;

function TFormGameDetails.CreateLabelValue(const tValue: String; DriverIndex: ShortInt = -1): TShadowLabel;
var
  newLabelValue: TShadowLabel;
  ValueStr: String;
begin
  {if DriverIndex > -1 then
     begin
       case DriverIndex of
         1: ValueStr:= aStatus[FormMain.MemGameInfo.eEmulationStatus];
         2: ValueStr:= aStatus[FormMain.MemGameInfo.eColorStatus];
         3: ValueStr:= aStatus[FormMain.MemGameInfo.eSoundStatus];
         4: ValueStr:= aStatus[FormMain.MemGameInfo.eGraphicStatus];
       end;
     end
  else}
     ValueStr:= tValue;
  if ValueStr = '' then
     Exit;
  newLabelValue:= TShadowLabel.Create(Self);
  newLabelValue.Parent:= FormGameDetails;
  newLabelValue.Font:= LabelYearValue.Font;
  newLabelValue.ShadowEnabled:= LabelYearValue.ShadowEnabled;
  newLabelValue.ShadowColor:= LabelYearValue.ShadowColor;
  newLabelValue.ShowAccelChar:= False;
  //newLabelValue.Transparent:= False;
  //newLabelValue.Color:= clSkyBlue;
  case DriverIndex of
    -1: newLabelValue.Left:= LabelYearValue.Left;
     1: // EmulationStatus
       begin
         newLabelValue.Left:= 5;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eEmulationStatus);
       end;
     2: // ColorStatus
       begin
         newLabelValue.Left:= 74;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eColorStatus);
       end;
     3: // SoundStatus
       begin
         newLabelValue.Left:= 110;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eSoundStatus);
       end;
     4: // GraphicStatus
       begin
         newLabelValue.Left:= 150;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eGraphicStatus);
       end;
  end;
  if DriverIndex <> -1 then
     begin
       case NewLabelValue.Tag of
         0: NewLabelValue.Font.Color:= clRed;   // preliminary driver
         1: NewLabelValue.Font.Color:= clGreen; // good driver
         2: NewLabelValue.Font.Color:= clOlive; // imperfect driver
       end
     end;
  newLabelValue.Top:= TextPos;
  newLabelValue.Caption:= ValueStr;
  //TextPos:= TextPos+LabelYearValue.Height;//15;
  Result:= newLabelValue;
  LeftPanelLastText:= newLabelValue.Top;
end;

{procedure TFormGameDetails.Wrap_Label(ALabel:TLabel;AText:string);
var
  i:integer;
  s:string;
  WrappedText:string;
begin
  // to simulate a WordWrap in strings without spaces....
  // need to give a max size in pixels to improve this function
  s:='';
  WrappedText:='';
  ALabel.caption:='';
  i:=1;
  while i<=Length(AText) do begin
    s:=s+AText[i];
    if ALabel.Canvas.TextWidth(s)>ALabel.ClientWidth then begin
      System.Delete(s,Length(s),1);
      WrappedText:=WrappedText+s+#13#10;
      s:='';
    end
    else
      inc(i);
  end;

  ALabel.Caption:=WrappedText;

end;}

function TFormGameDetails.AddEntry2(const sLabelTitle: String; sValue: WideString = ''; sImageIndex: ShortInt = -1): Boolean;
var
  LabelTemp: TShadowLabel;

  function AddFileInfo(const FileStr: String; FileFound: Boolean): Boolean;
  begin
    Result:= FileFound;
  end;

begin
  Result:= sValue <> '';
  if not Result then
     Exit;

  CreateLabelTitle(sLabelTitle);
  LabelTemp:= CreateLabelValue(sValue);
  LabelTemp.Caption:= sValue;
  LabelTemp.Tag:= sImageIndex;
  case sImageIndex of
   -5: LabelTemp.Font.Color:= $00a65300;//clNavy; // game type: "Game Files" string
    0: LabelTemp.Font.Color:= clRed;   // File Missing
    1: LabelTemp.Font.Color:= clGreen; // Have File / ROM
    2: LabelTemp.Font.Color:= clOlive; // Missing ROMs/CHDs
    20: LabelTemp.Font.Color:= $00a65300;//clNavy; // Scan Mode
  end;

  if LabelTemp.Width > LeftPanelSize then
     LeftPanelSize:= LabelTemp.Width;
  if LeftPanelSize > LeftTextMaxSize then
     begin
       LeftPanelSize:= LeftTextMaxSize;
       // enable WordWrap and create a 2 lines label
       // for manufacturer, category and maybe game file (CPS3 has a really huge .chd filename)
       // DOESN'T work for filenames without spaces (September 16, 2016)

       LabelTemp.AutoSize:= False;
       LabelTemp.Width:= LeftPanelSize;
       LabelTemp.Height:= LabelTemp.Height+8;
       LabelTemp.WordWrap:= True;
       LabelTemp.AutoSize:= True;
       LabelTemp.AutoSize:= False;
       LabelTemp.Width:= LeftPanelSize;
       //TextPos:= TextPos+LabelTemp.Height;
     end;
  LeftPanelLastTextHeight:= LabelTemp.Height;
  TextPos:= TextPos+LeftPanelLastTextHeight;
  //TextPos:= TextPos+LabelTemp.Height;
end;

function TFormGameDetails.GetDriverStatusImageIndex(StatusID: ShortInt): ShortInt;
begin
  case StatusID of
   -1: Result:= -1;
    0: Result:= 1;
    1: Result:= 2;
    2: Result:= 0;
  else
    Result:= -1;
  end;
end;

procedure TFormGameDetails.FillGameTree;
var
  ZipName, ZipParent, ZipBios, ZipExtension, SampleName, ZipDevice, tmpString, SamplesFolder: String;
  IsBiosGame, FileFound, IsSegaModel2, NoROMs: Boolean;
  ImgIndex: ShortInt;
  ListSamples, SamplesPathList: THashedStringList;
  Loop: Integer;

  function AddControlsList(const ctrlList: String): Boolean;
  var
    TempString: String;
    Loop: Integer;
    ButtonsOnly: Boolean;
  begin
    Result:= (ctrlList <> '') or (FormMain.MemGameInfo.eButtonsCount > 0);
    if not Result then
       Exit;
    TempString:= '';
    ButtonsOnly:= True;
    if ctrlList <> '' then
       if not SameText(ctrlList, 'buttons') then
       begin
         for Loop:=1 to Length(ctrlList) do
         begin
           if (ctrlList[Loop] = ',') or (Loop = Length(ctrlList)) then
              begin
                if Loop = Length(ctrlList) then
                   TempString:= TempString+ctrlList[Loop];
                if ButtonsOnly then
                   begin
                     AddEntry2('Controls', FormMain.ControlType.Values[TempString]);
                     ButtonsOnly:= False;
                   end
                else
                     AddEntry2('', FormMain.ControlType.Values[TempString]);
                TempString:= '';
              end
           else
              TempString:= TempString+ctrlList[Loop];
         end;
       end;
    if FormMain.MemGameInfo.eButtonsCount > 0 then
       begin
         if FormMain.MemGameInfo.eButtonsCount > 1 then
            TempString:= ' Buttons'
         else
            TempString:= ' Button';
         TempString:= IntToStr(FormMain.MemGameInfo.eButtonsCount)+TempString;
         if ButtonsOnly then
            AddEntry2('Controls', TempString)
         else
            AddEntry2('', TempString);
       end;
  end;

  function IsCHDGameOnly: Boolean;
  begin
    Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
    if Result then
       begin
         Result:= FormMain.MemGameInfo.eCHDsCount > 0;
         if Result then
            begin
              Result:= TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets = nil;
              if Result then
                 Result:= not FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName);
            end;
       end;
  end;

  function IsBiosSetOnly: Boolean;
  begin
    // if is a bios set (gamename=bios, biosname = '' or biosname=gamename), return FALSE, and ADD string "zip not found".
    // if is a game set, check for Taito G-NET and others alike... bios set only + CHD file
    // return TRUE, and DO NOT add string "zip not found"
    Result:= FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName);
    if Result then
       Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
  end;

  function IsDeviceSetOnly: Boolean;
  begin
    Result:= TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets <> nil;
    if Result then
       Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
  end;

  function AddSoftEntry(const iString: String; sTitle: String = ''): Boolean;
  begin
    Result:= True;
    AddEntry2(sTitle, iString);
  end;

  function AddDriverStatus: Boolean;
  var
    iLabelDriver: TShadowLabel;
  begin
    if FormMain.MemGameInfo.eSoftwareName <> '' then
       Exit; // why add EmulationStatus if it's the same as DriverStatus ????
    if FormMain.MemGameInfo.eDriverStatus < 1 then //= -1 then
       Exit; // driver is "good" or "none" then don't add extra status texts

    {
    // this is for the experimental EasyListView left panel!!!! September 16, 2016
    if FormMain.MemGameInfo.eEmulationStatus <> -1 then
       AddEntry2('', 'Emulation', FormMain.MemGameInfo.eEmulationStatus);
    if FormMain.MemGameInfo.eColorStatus <> -1 then
       AddEntry2('', 'Color', FormMain.MemGameInfo.eColorStatus);
    if FormMain.MemGameInfo.eSoundStatus <> -1 then
       AddEntry2('', 'Sound', FormMain.MemGameInfo.eSoundStatus);
    if FormMain.MemGameInfo.eGraphicStatus <> -1 then
       AddEntry2('', 'Graphic', FormMain.MemGameInfo.eGraphicStatus);
    }

    {case DriverIndex of
      1: ValueStr:= aStatus[FormMain.MemGameInfo.eEmulationStatus];
      2: ValueStr:= aStatus[FormMain.MemGameInfo.eColorStatus];
      3: ValueStr:= aStatus[FormMain.MemGameInfo.eSoundStatus];
      4: ValueStr:= aStatus[FormMain.MemGameInfo.eGraphicStatus];
    end;}


    iLabelDriver:= nil;
    if FormMain.MemGameInfo.eEmulationStatus <> -1 then
       iLabelDriver:= CreateLabelValue('   Emulation', 1);
    if FormMain.MemGameInfo.eColorStatus <> -1 then
       iLabelDriver:= CreateLabelValue('Color', 2);
    if FormMain.MemGameInfo.eSoundStatus <> -1 then
       iLabelDriver:= CreateLabelValue('Sound', 3);
    if FormMain.MemGameInfo.eGraphicStatus <> -1 then
       iLabelDriver:= CreateLabelValue('Graphic', 4);
    if iLabelDriver <> nil then
       TextPos:= TextPos+iLabelDriver.Height;
  end;

begin
  LeftPanelSize:= 0;
  LeftPanelLastText:= 0;
  LeftPanelLastTextHeight:= LabelYearValue.Height;
  LabelYearValue.Visible:= FormMain.MemGameInfo.eYear <> '';
  LabelYear.Visible:= LabelYearValue.Visible;
  NoROMs:= False;
  if LabelYearValue.Visible then
     begin
       LabelYearValue.Caption:= FormMain.MemGameInfo.eYear;
       TextPos:= LabelYear.Top+LabelYear.Height;
     end
  else
     TextPos:= LabelYear.Top;
  IsSegaModel2:= FormMain.MemGameInfo.eSystemID = idSegaModel2;

  AddEntry2('Manufacturer', FormMain.MemGameInfo.eManufacturer);

  // AddEntry2('Alternate Title', Utf8Decode('グラディウス'));
  // maybe ????? April 25, 2016

  case FormMain.MemGameInfo.eAudioType of
    0: AddEntry2('Audio', 'Standard Audio (chip)');
    1: AddEntry2('Audio', 'Discrete Audio');
    2:
      begin
        if FileExists(FormMain.GetAudioSamplesFile(FormMain.MemGameInfo.eSystemID)) then
           begin
             ListSamples:= THashedStringList.Create;
             ListSamples.LoadFromFile(FormMain.GetAudioSamplesFile(FormMain.MemGameInfo.eSystemID));
             SampleName:= ListSamples.Values[FormMain.MemGameInfo.eName];
             if SampleName <> '' then
                begin
                  FileFound:= False;
                  tmpString:= FormMain.LoadFolderSpecial_MAME(FormMain.MemGameInfo.eSystemID, FormMain.EmulatorFile[FormMain.MemGameInfo.eSystemID], 2);
                  FormMain.ExtractFolders2MAME(FormMain.MemGameInfo.eSystemID, tmpString, SamplesPathList);
                  tmpString:= '';
                  for Loop:=0 to SamplesPathList.Count-1 do
                  begin
                    SamplesFolder:= SamplesPathList[Loop];

                    ZipExtension:= '.zip';
                    FileFound:= FileExists(SamplesFolder+SampleName+ZipExtension);
                    if not FileFound then
                       begin
                         ZipExtension:= '.7z';
                         FileFound:= FileExists(SamplesFolder+SampleName+ZipExtension);
                       end;
                    if FileFound then
                       Break;
                  end;
                  FreeAndNil(SamplesPathList);
                  tmpString:= SampleName;
                  if FileFound then
                     tmpString:= tmpString+ZipExtension+' ('+
                                 FormMain.GetSizeType(GetFileSize(SamplesFolder+SampleName+ZipExtension), False)+')'
                  else
                     tmpString:= tmpString+' (.zip; .7z)';

                  AddEntry2('Audio Samples', tmpString, Ord(FileFound));
                end;
             FreeAndNil(ListSamples);
           end
        else
           AddEntry2('Audio', 'Samples'); // for systems other than MAME, this will never be execute, but still...
      end;
  end;

  tmpString:= '';
  if FormMain.MemGameInfo.eSystemID <> idZiNc then
     begin
       if FormMain.MemGameInfo.eScreenType <> -1 then
          tmpString:= aScreenType[FormMain.MemGameInfo.eScreenType];

       if FormMain.MemGameInfo.eScreenOrientation <> -1 then
          begin
            if tmpString = '' then
               tmpString:= aOrientation[FormMain.MemGameInfo.eScreenOrientation]
            else
               tmpString:= aScreenType[FormMain.MemGameInfo.eScreenType]+' ('+aOrientation[FormMain.MemGameInfo.eScreenOrientation]+')';
          end;
     end
  else
     tmpString:= aScreenType[0];

  AddEntry2('Video', tmpString);

  tmpString:= '';
  if FormMain.MemGameInfo.eScreenResolution <> '' then
     tmpString:= FormMain.MemGameInfo.eScreenResolution;
  if FormMain.MemGameInfo.eScreenRefreshRate <> '' then
     begin
       if tmpString <> '' then
          tmpString:= tmpString+' @ ';
       tmpString:= tmpString+FormMain.MemGameInfo.eScreenRefreshRate+' Hz';
     end;
  if tmpString <> '' then
     begin
       if FormMain.MemGameInfo.eScreenResolution <> '' then
          AddEntry2('   Resolution', tmpString)
       else
          AddEntry2('   Refresh Rate', tmpString);
     end;

  //if FormMain.MemGameInfo.eScreenResolution <> '' then
  //   AddEntry2('   Resolution', FormMain.MemGameInfo.eScreenResolution);
  //if FormMain.MemGameInfo.eScreenRefreshRate <> '' then
  //   AddEntry2('   Refresh Rate', FormMain.MemGameInfo.eScreenRefreshRate+' Hz');

  if IsSegaModel2 then
     FormMain.TempGameVars.eBiosName:= 'model2'
  else
     FormMain.TempGameVars.eBiosName:= FormMain.MemGameInfo.eBiosName;
  IsBiosGame:= not FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eName); // will return true is bios <> game name!!!!!

  if not IsBiosGame then
     AddEntry2('Bios Name', FormMain.MemGameInfo.eBiosName);
  AddEntry2('Driver Name', FormMain.MemGameInfo.eDriverName);

  ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eDriverStatus);
  AddEntry2('Driver Status', aStatus[FormMain.MemGameInfo.eDriverStatus], ImgIndex);
  AddDriverStatus;

  if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) and (FormMain.MemGameInfo.eSoftwareName = '') then
     begin
       // -1 -> unknown (empty); 0 -> unsupported; 1 -> supported
       tmpString:= '';
       case FormMain.MemGameInfo.eSaveState of
        //-1: tmpString:= 'Unknown';
         0: tmpString:= 'Unsupported';
         1: tmpString:= 'Supported';
        end;
        if tmpString <> '' then
           AddEntry2('Save State', tmpString);
     end;

  //if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) and (FormMain.MemGameInfo.eSoftwareName = '') then
  //   begin
  //     ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eEmulationStatus);
  //     AddEntry2('   Emulation', aStatus[FormMain.MemGameInfo.eEmulationStatus], ImgIndex);
  //     ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eColorStatus);
  //     AddEntry2('   Color', aStatus[FormMain.MemGameInfo.eColorStatus], ImgIndex);
  //     ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eSoundStatus);
  //     AddEntry2('   Sound', aStatus[FormMain.MemGameInfo.eSoundStatus], ImgIndex);
  //     ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eGraphicStatus);
  //     AddEntry2('   Graphic', aStatus[FormMain.MemGameInfo.eGraphicStatus], ImgIndex);
  //   end;

  if FormMain.MemGameInfo.eSoftwareName = '' then
     tmpString:= 'Category'
  else
     tmpString:= 'Software List';
  AddEntry2(tmpString, FormMain.MemGameInfo.eCategory); // AddEntry2('Category', '');
  tmpString:= '';
  //if FormMain.MemGameInfo.eSoftwareName <> '' then
  //   AddEntry2('XML List', FormMain.MemGameInfo.eSoftwareName); // not needed; info shown in top bar (game title; game name)
  AddEntry2('Version Added', FormMain.MemGameInfo.eVersionAdded);

  AddEntry2('Compatibility', FormMain.MemGameInfo.eSoftwareCompatible);
  AddEntry2('Usage', FormMain.MemGameInfo.eSoftwareUsageTip);

  AddEntry2('Main CPU Chip', FormMain.MemGameInfo.eChipCPU);

  AddEntry2('Language', FormMain.MemGameInfo.eLanguage);

  AddEntry2('# of Players', FormMain.GetNumberPlayersInfo(FormMain.MemGameInfo.eNumberPlayers, FormMain.MemGameInfo.eNumberPlayersIni));

  if (FormMain.MemGameInfo.eSystemID = idZiNc) and (not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification)) then // ZinC game index
     AddEntry2('Game Index', IntToStr(FormMain.MemGameInfo.eScreenType));

  AddControlsList(FormMain.MemGameInfo.eControls);

  if FormMain.MemGameInfo.eMechanical then
     AddEntry2('Mechanical', 'Yes');

  if FormMain.MemGameInfo.ePlayedDate <> 0 then
     AddEntry2('Last Played', FormMain.GetDateTimeStr(FormMain.MemGameInfo.ePlayedDate, True, True));

  tmpString:= '';
  if FormMain.MemGameInfo.ePlayed > 0 then
     tmpString:= IntToStr(FormMain.MemGameInfo.ePlayed)+'x  ';
  if FormMain.MemGameInfo.eTotalPlaytime > 0 then
     tmpString:= tmpString+GetPlayTime(FormMain.MemGameInfo.eTotalPlaytime, True);
  if tmpString <> '' then
     AddEntry2('Playtime', tmpString);
  tmpString:= '';


  //if FormMain.MemGameInfo.ePlayed > 0 then
  //   begin
  //     tmpString:= IntToStr(FormMain.MemGameInfo.ePlayed)+'x';
  //     if FormMain.MemGameInfo.ePlayedDate <> 0 then
  //        tmpString:= tmpString+' ('+FormMain.GetDateTimeStr(FormMain.MemGameInfo.ePlayedDate, True, True)+')';
  //     AddEntry2('Played', tmpString);
  //   end;

  //if FormMain.MemGameInfo.eTotalPlaytime > 0 then
  //   AddEntry2('Playtime', GetPlayTime(FormMain.MemGameInfo.eTotalPlaytime, True));

  if FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID] <> '' then
     LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+
                                    FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID];

  //if FormMain.MemGameInfo.eGameSizeText <> '' then
     AddEntry2('Game Size', FormMain.MemGameInfo.eGameSizeText);

  // added in June 10, 2015 (show software list strings)
  ImgIndex:= Length(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList);
  if ImgIndex > 0 then
     begin
       AddSoftEntry(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[0], 'Software List');
       //AddEntry2('Software List', uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[0]);
       if ImgIndex > 1 then
          begin
            for Loop:= 1 to (ImgIndex-1) do
                AddSoftEntry(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[Loop]);
                //AddEntry2('', uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[Loop]);
          end;
     end;
  //AddEntry2('Scan Mode', aScanMode[FormMain.MemGameInfo.eScanMode], 20); // no longer used (info at top bar)

  //tmpString:= 'this set is a ';
  tmpString:= '';
  if IsSegaModel2 and IsBiosGame then
     tmpString:= 'Bios'
  else
  if FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
     tmpString:= 'Bios'
  else
  if FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification) then
     tmpString:= 'Device'
  else
     begin
       if FormMain.MemGameInfo.eSoftwareName = '' then
          begin
            case FormMain.MemGameInfo.eSystemType of
              0: tmpString:= 'Game';
              1: tmpString:= 'Machine';
            end;
          end
       else
          tmpString:= 'Softwarelist game';
     end;
  AddEntry2('Game Files', tmpString, -5);//' ');
  //if FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs) or (FormMain.MemGameInfo.eSystemID = idDaphne) then
  //   AddEntry2('Game Files', ' ')
  //else
  //   AddEntry2('Game Files', 'No game set needed');

  // if (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count = 0) and (FormMain.MemGameInfo.eSystemID <> idDaphne) then
  //if (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil) and (FormMain.MemGameInfo.eSystemID <> idDaphne) then
  if ((TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) or
     ((TEasyGameInfo(FormMain.SelectedEasyItem).eHaveGameROMs = 0) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) then
     begin
       NoROMs:= True;
       AddEntry2('   Game Set', 'Set with no Game ROMs', 1) // special case for sets with no ROMs
     end
  else
  begin
    ZipName:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
    if ZipName <> '' then
       begin
         if IsZiNcSystem then
            ZiNcFilePath:= ExtractFilePath(ZipName);
       end;
    if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
       begin
         case IsZiNcSystem of
           True : ZipParent:= FindZiNcFile(FormMain.MemGameInfo.eClone);
           False: ZipParent:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
         end;
       end;
  end;

    //if IsSegaModel2 then
    //   FormMain.TempGameVars.eBiosName:= 'model2'
    //else
    //   FormMain.TempGameVars.eBiosName:= FormMain.MemGameInfo.eBiosName;
    //IsBiosGame:= FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eName); // will return true is bios <> game name!!!!!
    if not IsBiosGame then
       begin
         case IsZiNcSystem of
           True : ZipBios:= FindZiNcFile(FormMain.MemGameInfo.eBiosName);
           False: ZipBios:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
         end;
       end;

    if FormMain.SystemUseSevenZip(FormMain.MemGameInfo.eSystemID) then
       tmpString:= ' (.zip; .7z)'
    else
       tmpString:= '.zip';

    if ZipName <> '' then
       AddEntry2('   Game Set', ExtractFileName(ZipName), Ord(ZipName <> ''))
       //AddEntry2('   Game Set', ExtractFileName(ZipName)+' ('+
       //                     FormMain.GetSizeType(GetFileSize(ZipName), False)+')', Ord(ZipName <> ''))
    else
    if IsCHDGameOnly then
       begin
         // nothing here... this is for the Need for Speed intall disk games and others alike
         // still need to double-check this and make sure there's no need to validate IsCHDGameOnly...
       end
    else
    if (not IsBiosSetOnly) and (not IsDeviceSetOnly) and (not NoROMs) then
       begin
         if not FormMain.MemGameInfo.eIsMerged then
            AddEntry2('   Game Set', FormMain.MemGameInfo.eName+tmpString, 0)
         else
            AddEntry2('   Game Set', FormMain.MemGameInfo.eName+tmpString, 0); // 'Merged in parent set', 1); // for merged clone sets!!!
       end;
    if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) and (not NoROMs) then
       begin
         if ZipParent <> '' then
            AddEntry2('   Parent Set', ExtractFileName(ZipParent), 1)
            //AddEntry2('   Parent Set', ExtractFileName(ZipParent)+ ' ('+
            //                       FormMain.GetSizeType(GetFileSize(ZipParent), False)+')', 1)
         else
         if {not }IsBiosSetOnly then // this is for G-NET and others with bios set + chd (no game set)
            AddEntry2('   Parent Set', FormMain.MemGameInfo.eClone+tmpString, 0);
       end;
    if not IsBiosGame then
       begin
         if IsSegaModel2 then
            FormMain.TempGameVars.eTitle:= '   Board ROMs'
         else
            FormMain.TempGameVars.eTitle:= '   Bios Set';
         if ZipBios <> '' then
            AddEntry2(FormMain.TempGameVars.eTitle, ExtractFileName(ZipBios), 1)
            //AddEntry2(FormMain.TempGameVars.eTitle, ExtractFileName(ZipBios)+ ' ('+
            //                     FormMain.GetSizeType(GetFileSize(ZipBios), False)+')', 1)
         else
            AddEntry2(FormMain.TempGameVars.eTitle, FormMain.TempGameVars.eBiosName+tmpString, 0);
       end;

    {
    if ZipName <> '' then
       AddEntry2('   Game Set', FileStatusStr[1]+': '+ExtractFileName(ZipName)+ ' ('+
                            FormMain.GetSizeType(GetFileSize(ZipName), False)+')', Ord(ZipName <> ''))
    else
    if IsCHDGameOnly then
       begin
         // nothing here... this is for the Need for Speed intall disk games
         // still need to double-check this and make sure there's no need to validate IsCHDGameOnly...
       end
    else
    if not IsBiosSetOnly then
       begin
         if LabelEmulatorVersion.Tag <> 1 then // not used anymore... use "MemGameInfo.eIsMerged" instead!!!!
            AddEntry2('   Game Set', FileStatusStr[0]+': '+FormMain.MemGameInfo.eName+tmpString, 0)
         else
            AddEntry2('   Game Set', FileStatusStr[0]+ ' (Merged in parent set)', 1);//ImgIndex); // for merged clone sets!!!
       end;

    if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
       begin
         if ZipParent <> '' then
            AddEntry2('   Parent Set', FileStatusStr[1]+': '+ExtractFileName(ZipParent)+ ' ('+
                                   FormMain.GetSizeType(GetFileSize(ZipParent), False)+')', 1)
         else
         if not IsBiosSetOnly then // this is for G-NET and others with bios set + chd (no game set)
            AddEntry2('   Parent Set', FileStatusStr[0]+': '+FormMain.MemGameInfo.eClone+tmpString, 0);
       end;
    if IsBiosGame then
       begin
         if IsSegaModel2 then
            FormMain.TempGameVars.eTitle:= '   Board ROMs'
         else
            FormMain.TempGameVars.eTitle:= '   Bios Set';
         if ZipBios <> '' then
            AddEntry2(FormMain.TempGameVars.eTitle, FileStatusStr[1]+': '+ExtractFileName(ZipBios)+ ' ('+
                                 FormMain.GetSizeType(GetFileSize(ZipBios), False)+')', 1)
         else
            AddEntry2(FormMain.TempGameVars.eTitle, FileStatusStr[0]+': '+FormMain.TempGameVars.eBiosName+tmpString, 0);
       end;}
  //end; // should be removed from here ???? May 30, 2015

  if TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets <> nil then
     begin
       for ImgIndex:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets.Count-1 do
       begin
         ZipDevice:= FormMain.SearchZIPFolder(TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex], 1);
         if ZipDevice <> '' then
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), ExtractFileName(ZipDevice), 1)
            //AddEntry2('   Device Set '+IntToStr(imgIndex+1), ExtractFileName(ZipDevice)+ ' ('+
            //                      FormMain.GetSizeType(GetFileSize(ZipDevice), False)+')', 1)
         else
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex]+tmpString, 0);
       end;
       //FreeAndNil(ListDeviceSets);
     end;
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
end;

procedure TFormGameDetails.FillROMsTree;
var
  sFile: String;
  Item: TEasyItem;
  //Have, Miss: Integer;
  romMissStatus: ShortInt;
  ValidCHD: Boolean;
  //missFile: TMemIniFile;
  StatusImageIndex: Integer;

  function GetROM_ImageIndex: ShortInt;
  begin
    case romMissStatus of
      -1:
        begin
          if FormMain.MemGameInfo.eScanMode = 0 then
             begin
               case FormMain.MemGameInfo.eGameSetStatus of
                 1: StatusImageIndex:= 0;
                 0: StatusImageIndex:= 0;//(Ord(FormMain.IsROM_Miss(FormMain.MemGameInfo.eROMIdentification)));
                 2: StatusImageIndex:= 1;
               end;
             end
          else
             begin
               // for quick scan and force available
               case FormMain.MemGameInfo.eGameSetStatus of
                 1: StatusImageIndex:= 1; // missing ROMs/CHDs
                 0: StatusImageIndex:= 0; // all good
                 2: StatusImageIndex:= 1; // missing all files
                end;
             end;
        end;
      0: StatusImageIndex:= 1; // file Missing
      1: StatusImageIndex:= 2; // CHD file found with bad SHA-1
    end;
    Result:= StatusImageIndex;
  end;

  function GetCHD_NewImageIndex(IsChecksumOk: Boolean): ShortInt;
  begin
    Result:= Ord(not IsChecksumOk); // OK -> 0; not Ok -> 2;
    if Result = 1 then
       Result:= Result+1; // Check not OK
  end;

  function CheckEmptyVar(VarStr: String; AddCommaSeparator: Boolean = False): String;
  begin
    Result:= '';
    if VarStr <> '' then
       begin
         case AddCommaSeparator of
           True : Result:= VarStr+', ';
           False: Result:= VarStr+' ';
         end;
       end;
  end;

  function GetROM_Status(const CRC32String, SHA1String: String; const ROMTag: ShortInt; IsCHDFile, IsBadDump: Boolean; CHDHeaderVersion: Byte = 0): String;
  var
    StrCHD: String;
    iChecksum: String;
  begin
    Result:= '';
    StrCHD:= '';
    case ROMTag of
      //12, 15, 18: StrCHD:= 'CHD ';
      13, 16, 19: StrCHD:= 'Dev ';
      14, 17, 20: StrCHD:= 'Bios ';
    end;
    if ROMTag >= 12 then
       begin
         if (CRC32String = '') and (SHA1String <> '') then
            iChecksum:= SHA1String // for the new file format
         else
         if (CRC32String = '') and (SHA1String = '') then
            iChecksum:= ''
         else
            iChecksum:= CRC32String; // fallback to the old file format (EL v8.2.1) ????
       end
    else
       iChecksum:= CRC32String;

    case ROMTag of
      1, 4, 7, 10: // device ROM
        begin
          if not FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification) then
             Result:= 'Device';
        end;
      2, 5, 8, 11: // bios ROM
        begin
          if not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
             begin
               if FormMain.MemGameInfo.eSystemID = idSegaModel2 then
                  begin
                    if FormMain.MemGameInfo.eName <> 'model2' then
                       Result:= 'Board ROM';
                  end
               else
                  Result:= 'Bios';
             end;
        end;
    end;
    if (FormMain.MemGameInfo.eScanMode = 0) or (ROMTag >= 12) then // (ROMTag in [3, 4, 5]) then
    begin
      //if (ROMTag in [3, 4, 5]) and (StatusImageIndex <> 1) and (iChecksum <> '') then// (CRC32String <> '') then
      if IsCHDFile and (StatusImageIndex <> 1) and (iChecksum <> '') then
      //if (ROMTag >= 12) and (StatusImageIndex <> 1) and (iChecksum <> '') then
         begin
           if CHDHeaderVersion > 0 then
              Result:= StrCHD+CheckEmptyVar(Result)+'v'+IntToStr(CHDHeaderVersion)
           else
              Result:= StrCHD+CheckEmptyVar(Result)+'v ?';
         end;
      //else
      //   Result:=  CheckEmptyVar(Result);

      case StatusImageIndex of
        0:
          begin
            if iChecksum <> '' then //CRC32String <> '' then
               Result:= CheckEmptyVar(Result)+'Ok';
          end;
        1:
          begin
            if iChecksum <> '' then //CRC32String <> '' then
               Result:= CheckEmptyVar(Result)+'Missing'
            else
               begin
                 if FormMain.MemGameInfo.eGameSetStatus = 1 then
                    StatusImageIndex:= 0;
               end;
          end;
        2:
          begin
            // 'Bad Checksum'; // for CHDs only...
            Result:= CheckEmptyVar(Result);
            if Length(iChecksum) > 32 then //CRC32String) > 32 then
               Result:= Result+'Bad SHA-1'
            else
               Result:= Result+'Bad MD5';
               //Result:= CheckEmptyVar(Result)+'SHA-1';
          end;
      end;
    end;
    if iChecksum = '' then //CRC32String = '' then
       Result:= CheckEmptyVar(Result, True)+'No Dump'
    else
    if IsBadDump then
       Result:= CheckEmptyVar(Result, True)+'Bad Dump';
  end;

  {function GetROM_Status(const CRC32String, SHA1String: String; const ROMTag: ShortInt; CHDHeaderVersion: Byte = 0): String;
  var
    StrCHD: String;
    iChecksum: String;
  begin
    Result:= '';
    StrCHD:= '';
    case ROMTag of
      //3: StrCHD:= 'CHD ';
      4: StrCHD:= 'Bios CHD ';
      5: StrCHD:= 'Dev CHD ';
    end;
    if ROMTag > 2 then
       begin
         if (CRC32String = '') and (SHA1String <> '') then
            iChecksum:= SHA1String // for the new file format
         else
         if (CRC32String = '') and (SHA1String = '') then
            iChecksum:= ''
         else
            iChecksum:= CRC32String; // fallback in the old file format ????
       end
    else
       iChecksum:= CRC32String;

    case ROMTag of
      1: // device ROM
        begin
          if not FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification) then
             Result:= 'Device ROM';
        end;
      2: // bios ROM
        begin
          if not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
             begin
               if FormMain.MemGameInfo.eSystemID = idSegaModel2 then
                  begin
                    if FormMain.MemGameInfo.eName <> 'model2' then
                       Result:= 'Board ROM';
                  end
               else
                  Result:= 'Bios ROM';
             end;
        end;
    end;
    if (FormMain.MemGameInfo.eScanMode = 0) or (ROMTag in [3, 4, 5]) then
    begin
      if (ROMTag in [3, 4, 5]) and (StatusImageIndex <> 1) and (iChecksum <> '') then// (CRC32String <> '') then
         begin
           if CHDHeaderVersion > 0 then
              Result:= StrCHD+CheckEmptyVar(Result)+'v'+IntToStr(CHDHeaderVersion)
           else
              Result:= StrCHD+CheckEmptyVar(Result)+'v ?';

           //Result:= StrCHD+Result;
         end;
      //else
      //   Result:=  CheckEmptyVar(Result);

      case StatusImageIndex of
        0:
          begin
            if iChecksum <> '' then //CRC32String <> '' then
               Result:= CheckEmptyVar(Result)+'Ok';
          end;
        1:
          begin
            if iChecksum <> '' then //CRC32String <> '' then
               Result:= CheckEmptyVar(Result)+'Missing'
            else
               begin
                 if FormMain.MemGameInfo.eGameSetStatus = 1 then
                    StatusImageIndex:= 0;
               end;
          end;
        2:
          begin
            // 'Bad Checksum'; // for CHDs only...
            Result:= CheckEmptyVar(Result);
            if Length(iChecksum) > 32 then //CRC32String) > 32 then
               Result:= Result+'Bad SHA-1'
            else
               Result:= Result+'Bad MD5';
               //Result:= CheckEmptyVar(Result)+'SHA-1';
          end;
      end;
    end;
    if iChecksum = '' then //CRC32String = '' then
       Result:= CheckEmptyVar(Result)+'No Dump';
  end;}

  function AddROMs: Boolean;
  var
    LoopROMs, sIndex: Integer;
    isCHD: Boolean;
    tmpString, tmpString2, CHDFile, CHDInfo, CHDChecksum, LineStr: String;
    HeaderVerCHD: Byte;
    romName, romCRC32, romSHA1: String;
    romTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file
    IsCRC32Collision, IsNewFileFormat, IsBadDump: Boolean;
    iTempStr: String;
    iTempInt: Integer;

    function AddMissCHDExtra(CHDFound: Boolean; ParentCHDName: String): Boolean;
    begin
      Result:= (not CHDFound) and (ParentCHDName <> '');
      if not Result then
         Exit;

      CHDInfo:= '(Parent: '+ParentCHDName+')';
      //CHDInfo:= '             (Parent: '+ParentCHDName+')';
      AddEntry2('', CHDInfo, 0);
    end;

  begin
    Result:= True;
    if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil then
       Exit;
    //Have:= 0;
    //Miss:= 0;

    // add ROMs nodes
    ROMsListView.BeginUpdate;
    ROMsListView.Items.ReIndexDisable:= True;

    for LoopROMs:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count-1 do
    begin
      LineStr:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo[LoopROMs];
      IsNewFileFormat:= PosEx('<name>', LineStr) <> 0;
      if IsNewFileFormat then
         begin
           // FileID MediaType IsCRC32Collision IsBadDump<name>Filename/><crc>CRC32/><sha1>/SHA-1 or MD5/>
           //   12       3           4             5
           romTagIndex:= StrToInt(LineStr[1]+LineStr[2]);
           IsCHD:= Boolean(StrToInt(LineStr[3])); // the position 3 now holds the media type; 0 -> rom/cart/flop/cass; 1 -> CHDs
           IsCRC32Collision:= Boolean(StrToInt(LineStr[4]));
           if LineStr[5] <> '<' then // start of <name> tag on EL v8.2.2 "sysname.elrom" file format...
              IsBadDump:= Boolean(StrToInt(LineStr[5]))
           else
              IsBadDump:= False; // is EL v8.2.2 old "sysname.elrom" file format

           FormMain.GetROMDetailsInfo(LineStr, FormMain.GameIsClone(FormMain.MemGameInfo.eClone), romName, romCRC32, romSHA1, tmpString2);
           //IsCHD:= romTagIndex >= 12;
           //if not IsCHD then

           //if not IsCHD then
           //   IsCHD:= ((romCRC32 = '') and (romSHA1 <> '')) or
           //           (SameText(ExtractFileExt(romName), '.chd'));
         end;
         
      tmpString:= '';
      romMissStatus:= -1;

      if Assigned(missFile) then
         begin
           // crc32;sha1=ikaruga.chd
           iTempStr:= FormMain.GetMissCheckEntry(romCRC32, romSHA1);
           romMissStatus:= missFile.ReadInteger(FormMain.MemGameInfo.eName, iTempStr, -1);
         end;

      Item:= ROMsListView.Items.Add;
      GetROM_ImageIndex;

      case isCHD of
        True:
          begin
            HeaderVerCHD:= 0;
            tmpString:= ''; // holds CHD name
            //tmpString2:= ''; // holds Parent CHD name; info got from code above...

            if IsNewFileFormat then
               begin
                 tmpString:= romName; // tmpString holds the name of the CHD
                 //tmpString2:= SoftListGetEntryValue(LineStr, 'parentname'); // tmpString2 is the parent CHD name!!!... info got from code above
               end;
            //  False:
            //    begin
                  // old code; must remove it later....
                  {sIndex:= PosEx('_"parentchd"_', romName);
                  if sIndex = 0 then
                     tmpString:= romName // ROM Name
                  else
                     begin
                       // for MAME/HB MAME only since other systems do not have a parentchd entry!!!!
                       tmpString:= Copy(romName, 1, sIndex-1);
                       tmpString2:= romName;
                       Delete(tmpString2, 1, sIndex+12); // tmpString2 is the parent CHD name!!!
                       if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) then
                          Delete(tmpString2, 1, 2); // for MAME/HBMAME only!
                     end;}
            //    end;

            Item.Caption:= tmpString; // tmpString holds the name of the CHD

            case IsZiNcSystem of
              True : CHDFile:= FormMain.SearchZiNcCHDFolder(tmpString, FormMain.MemGameInfo.eName, ZiNcFilePath);
              False: CHDFile:= FormMain.SearchCHDFolder(tmpString, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eSystemID);
            end;
            CHDInfo:= tmpString;
            if CHDFile <> '' then
               begin
                 if IsNewFileFormat then
                    begin
                      if romSHA1 <> '' then
                         ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romSHA1, CHDChecksum, HeaderVerCHD)
                      else
                         ValidCHD:= True; // no dump...
                    end;
                   //False:
                   //  begin
                       //if romCRC32 <> '' then
                       //   ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romCRC32, CHDChecksum, HeaderVerCHD)
                       //else
                       //   ValidCHD:= True; // no dump...
                   //  end;
                 StatusImageIndex:= GetCHD_NewImageIndex(ValidCHD);
                 Item.Captions[1]:= CHDChecksum;
               end
            else
               begin
                 if romSHA1 <> '' then
                    StatusImageIndex:= 1 // file missing
                 else
                    begin
                      //if FormMain.MemGameInfo.eGameSetStatus = 1 then
                      if FormMain.MemGameInfo.eGameSetStatus <> 2 then
                         StatusImageIndex:= 0 // file not found but it's a "no dump"...
                      else
                         StatusImageIndex:= 1;
                    end;
               end;

            //showMessage('rom tag: '+IntToStr(romTagIndex));
            case romTagIndex of
              12, 15, 18: AddEntry2('   CHD', CHDInfo, Ord(CHDFile <> ''));
              13, 16, 19: AddEntry2('   Bios CHD', CHDInfo, Ord(CHDFile <> ''));
              14, 17, 20: AddEntry2('   Device CHD', CHDInfo, Ord(CHDFile <> ''));

              //15: AddEntry2('   CD', CHDInfo, Ord(CHDFile <> ''));
              //16: AddEntry2('   Bios CD', CHDInfo, Ord(CHDFile <> ''));
              //17: AddEntry2('   Device CD', CHDInfo, Ord(CHDFile <> ''));

              //18: AddEntry2('   Flash', CHDInfo, Ord(CHDFile <> ''));
              //19: AddEntry2('   Bios Flash', CHDInfo, Ord(CHDFile <> ''));
              //20: AddEntry2('   Device Flash', CHDInfo, Ord(CHDFile <> ''));
            end;
            AddMissCHDExtra(CHDFile <> '', tmpString2);

            if (tmpString2 <> '') and (tmpString2 <> tmpString) then
               begin
                 case IsZiNcSystem of
                   True : CHDFile:= FormMain.SearchZiNcCHDFolder(tmpString2, FormMain.MemGameInfo.eName, ZiNcFilePath);
                   False: CHDFile:= FormMain.SearchCHDFolder(tmpString2, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eSystemID);
                 end;
                 CHDInfo:= tmpString2;
                 if CHDFile <> '' then
                    begin
                      if IsNewFileFormat then
                         begin
                           if romSHA1 <> '' then
                              ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romSHA1, CHDChecksum, HeaderVerCHD)
                           else
                              ValidCHD:= True;
                         end;
                        //False:
                        //  begin
                            // old code; must remove it later....
                            //if romCRC32 <> '' then
                            //   ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romCRC32, CHDChecksum, HeaderVerCHD)
                            //else
                            //   ValidCHD:= True;
                        //  end;
                      Item.Caption:= tmpString2;
                      StatusImageIndex:= GetCHD_NewImageIndex(ValidCHD);
                      Item.Captions[1]:= CHDChecksum;
                    end
                 else
                    begin
                      if romCRC32 <> '' then
                         StatusImageIndex:= 1 // file missing
                      else
                         begin
                           if FormMain.MemGameInfo.eGameSetStatus = 1 then
                              StatusImageIndex:= 0 // file not found but it's a "no dump"...
                           else
                              StatusImageIndex:= 1;
                         end;
                    end;
                 AddEntry2('   Parent CHD', tmpString2, Ord(CHDFile <> ''));
               end;
          end;
        False:
          begin
            Item.Caption:= romName; // ROM Name
          end;
      end;
      Item.Tag:= Ord(IsCHD); // 0 -> ROM; 1 -> CHD
      Item.StateImageIndex:= StatusImageIndex;
      case isCHD of
        True:
          begin
            case romTagIndex of
              12, 13, 14: Item.ImageIndex:= 19; // HDD (also general CHD)
              15, 16, 17: Item.ImageIndex:= 20; // CD
              18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card
            end;
            //Item.ImageIndex:= 16;
          end;
        False:
          begin
            case romTagIndex of
              00, 01, 02: Item.ImageIndex:= 15; // ROM
              03, 04, 05: Item.ImageIndex:= 16; // Cartridge
              06, 07, 08: Item.ImageIndex:= 17; // Floppy Disk
              09, 10, 11: Item.ImageIndex:= 18; // Cassette Tape
              12, 13, 14: Item.ImageIndex:= 19; // HDD... is there any game ROMs with region="hdd" ???? not sure but better to have this here!!!
              15, 16, 17: Item.ImageIndex:= 20; // CD (Demul (v5.8.2) have .bin files ROMs that are actually image CDs
              18, 19, 20: Item.ImageIndex:= 21; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
            end;

            {if FormMain.MemGameInfo.eSoftwareName = '' then
               begin
                 if FormMain.IsDecoCassMachine(FormMain.MemGameInfo.eDriverName) then
                    begin
                      case SameText(ExtractFileExt(romName), '.cas') of
                        True : Item.ImageIndex:= 19;
                        False: Item.ImageIndex:= 15;
                      end;
                    end
                 else
                 if FormMain.IsSEGASystem24Machine(FormMain.MemGameInfo.eDriverName) then
                    begin
                      case SameText(ExtractFileExt(romName), '.img') of
                        True : Item.ImageIndex:= 18;
                        False: Item.ImageIndex:= 15;
                      end;
                    end
                 else
                    Item.ImageIndex:= 15 // ROM icon
               end
            else
               begin
                 if PosEx('cart', FormMain.MemGameInfo.eSoftwareExecParameter) <> 0 then
                    Item.ImageIndex:= 17
                 else
                 if PosEx('flop', FormMain.MemGameInfo.eSoftwareExecParameter) <> 0 then
                    Item.ImageIndex:= 18
                 else
                 if PosEx('cass', FormMain.MemGameInfo.eSoftwareExecParameter) <> 0 then
                    Item.ImageIndex:= 19
                 else
                    Item.ImageIndex:= 15; // ROM image
               end;}
          end;
      end;
      //Item.ImageIndex:= StatusImageIndex;
      //case isCHD of
      //  True : Item.StateImageIndex:= 16;
      //  False: Item.StateImageIndex:= 15;
      //end;
      Item.Captions[1]:= romCRC32; // ROM CRC32 Checksum
      Item.Captions[2]:= romSHA1; // ROM SHA-1 Checksum
      Item.Captions[3]:= GetROM_Status(romCRC32, romSHA1, romTagIndex, IsCHD, IsBadDump, HeaderVerCHD); // ROM Status

      //case Item.ImageIndex of
      //  0, 2: Inc(Have);
      //  1: Inc(Miss);
      //end;
    end;

    ROMsListView.Items.ReIndexDisable:= False;
    ROMsListView.EndUpdate;
  end;

begin
  if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil then // if (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count = 0) then
     begin
       ROMsListView.Visible:= False;
       //Shape2.Visible:= False;
       //Shape3.Visible:= False;
       Exit;
     end;

  sFile:= FormMain.GetGamesFolderEL(Ord(FormMain.MemGameInfo.eSoftwareName <> ''))+GetSystemFileName(FormMain.MemGameInfo.eSystemID, 3, FormMain.MemGameInfo.eSoftwareName);
  if FileExists(sFile) then
     missFile:= TMemIniFile.Create(sFile);
     
  AddROMs;
  FreeAndNil(missFile);
end;

procedure TFormGameDetails.FormShow(Sender: TObject);
var
  Loop: Integer;
  CHDsAllNoDump: Boolean;
  iROM, iSHA1: String;

  ROMsCount, BottomPos, HeaderSize, iROMsHeight: Integer;
begin
  FormMain.ELV_ResetNormalColors(ROMsListView);

  //FormMain.LoadGameIDThumbIcon(SystemIcon, FormMain.MemGameInfo.eROMIdentification);
  //FormMain.IL_ArcadeSystem_Large.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

  FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
                                              SystemIcon.Picture.Icon);
  FormMain.IL_ArcadeSystem_Small.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
  LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;

  IsZiNcSystem:= FormMain.MemGameInfo.eSystemID = idZiNc;
  ZiNcFilePath:= '';

  LabelScanMode.Caption:= LabelScanMode.Hint+#13#10+aScanMode[FormMain.MemGameInfo.eScanMode];
  //LabelGameStatus.Caption:= LabelGameStatus.Hint+#13#10+FormMain.GetGameStatusText(FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eROMIdentification);
  case FormMain.MemGameInfo.eGameSetStatus of
    0: TopBar.Color1:= $00f0fae5; // green
    1: TopBar.Color1:= $00e5f0fa; // red (based on green)
    2: TopBar.Color1:= $00d9d9d9;//$00eeeeee; // silver (base on green)
  end;
  FormMain.CheckSevenZip(FormMain.MemGameInfo.eSystemID);

  LeftPanelMinimumTextSize:= 137; // this should be 198 due to the driver status colored texts ?????
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // Checksum column size is 65, difference is 186...

  if FormMain.MemGameInfo.eCHDsCount > 0 then
     begin
       CHDsAllNoDump:= FormMain.IsROMsListBasedSys(FormMain.MemGameInfo.eSystemID);
       //if not FormMain.MemGameInfo.eROMsAllNoDump then // this is only for ROMs; CHD files are not included!
          begin
            if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then
            begin
              for Loop:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count-1 do
              begin
                iROM:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo[Loop];
                //iROM:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.ValueFromIndex[Loop];
                // 12 and higher = CHD files
                if StrToInt(iROM[1]+iROM[2]) >= 12 then //in ['12', '13', '14'] then
                   begin
                     iSHA1:= SoftListGetEntryValue(iROM, 'sha1');
                     if iSHA1 = '' then
                        iSHA1:= SoftListGetEntryValue(iROM, 'md5'); // for old MAME builds
                     if iSHA1 <> '' then
                        begin
                          CHDsAllNoDump:= False;
                          Break;
                        end;
                   end;
              end;
            end;
          end;
       if not CHDsAllNoDump then
          begin
            LeftPanelMinimumTextSize:= 0;
            //FormGameDetails.ClientWidth:= FormGameDetails.ClientWidth+186;
            //ROMsListView.Header.Columns[1].Width:= 248;
            //ROMsListView.Header.Columns[2].Width:= 119;
            //ROMsListView.Width:= ROMsListView.Width+186;
            //FrameROMsListView.Width:= FrameROMsListView.Width+186;
          end;
     end;

  // part from Form.Activate event!!!
  if FormGameDetails.Tag <> 0 then
     Exit;
  FormGameDetails.Tag:= 1;
  FillGameTree;
  Application.ProcessMessages;
  FillROMsTree;

  //if Screen.Width >= 1024 then
  //   begin
  //     ROMsListView.Width:= ROMsListView.Width+250;
  //     FrameROMsListView.Width:= FrameROMsListView.Width+250;
  //     FormGameDetails.ClientWidth:= FormGameDetails.ClientWidth+250;
  //     LabelGameTitle.Width:= LabelGameTitle.Width+250;
  //     LabelScanMode.Left:= LabelScanMode.Left+250;
  //   end;

  if LeftPanelSize < LeftTextMaxSize then // 198
     begin
       if (LeftPanelMinimumTextSize > 0) and (LeftPanelSize < LeftPanelMinimumTextSize) then
          LeftPanelSize:= LeftPanelMinimumTextSize;

       FrameROMsListView.Left:= LabelYearValue.Left+LeftPanelSize+6; // 6 for the border
       ROMsListView.Left:= FrameROMsListView.Left+1;
       FormGameDetails.ClientWidth:= ROMsListView.Left+ROMsListView.Width+7; // 7 for the border
       //LabelGameTitle.Width:= TopBar.Width-LabelGameTitle.Left-7;
       //LabelScanMode.Left:= TopBar.Width-(LabelScanMode.Width+7);
     end;
  LabelGameTitle.Width:= TopBar.Width-LabelGameTitle.Left-7;
  LabelScanMode.Left:= TopBar.Width-(LabelScanMode.Width+7);

  BottomPos:= LeftPanelLastText+LeftPanelLastTextHeight;//LabelYearValue.Height;

  HeaderSize:= ROMsListView.Header.Height+2+4; // +4 for the bottom border
  ROMsCount:= ROMsListView.Groups.ItemCount;
  if ROMsCount <= 25 then
     iROMsHeight:= HeaderSize+(ROMsCount*ROMsListView.CellSizes.Report.Height)
  else
     iROMsHeight:= HeaderSize+(25*ROMsListView.CellSizes.Report.Height);

  //iFormHeight:= LeftPanelLastText+LabelYearValue.Height+6; // 6 for the border

  //if ROMsCount <= 25 then // 25 files visible max!
     begin
       if BottomPos < (iROMsHeight+ROMsListView.Top) then
          BottomPos:= iROMsHeight+ROMsListView.Top;
     //ROMsListView.Height:= HeaderSize+(25*ROMsListView.CellSizes.Report.Height)//+4; // 25 files visible max!
     end;

  ROMsListView.Height:= BottomPos-ROMsListView.Top;//HeaderSize+(ROMsCount*ROMsListView.CellSizes.Report.Height);//+4;
  FrameROMsListView.Height:= ROMsListView.Height+2;
  Loop:= ROMsListView.Header.Columns[3].Width;
  ROMsListView.BeginUpdate;
  ROMsListView.Header.Columns[3].AutoSizeToFit;
  if ROMsListView.Header.Columns[3].Width < 50 then
     ROMsListView.Header.Columns[3].Width:= 50;

  if ROMsListView.Header.Columns[3].Width <> Loop then
     ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width+(Loop-ROMsListView.Header.Columns[3].Width);
  if ROMsListView.Groups.ItemCount > 0 then
     ROMsListView.Header.Columns[0].Caption:= 'Name'+Format('%25s', [IntToStr(ROMsListView.Groups.VisibleItemCount)+' files']);

  if ROMsListView.Scrollbars.VertBarVisible then
     ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);

  //ROMsListView.Header.Columns[3].Width:= ROMsListView.Header.Columns[3].Width-16;
  ROMsListView.EndUpdate;

  //LabelNoROMs.Top:= FrameROMsListView.Top+16;
  //if not FormMain.CheckTotal(ROMsListView) then
  //   LabelNoROMs.Left:= FrameROMsListView.Left+((FrameROMsListView.Width-LabelNoROMs.Width) div 2);

  Inc(BottomPos, 7); // add 7 pixels to make the 6 pixels border

  //FormGameDetails.ClientHeight:= 400;//

  if FormGameDetails.ClientHeight <> BottomPos then
     FormGameDetails.ClientHeight:= BottomPos;

  //FormGameDetails.VertScrollBar.Visible:= True;
  //FormGameDetails.HorzScrollBar.Visible:= True;
  //if FormGameDetails.ClientWidth > 620 then
  //   FormGameDetails.ClientWidth:= 620;
  //if FormGameDetails.ClientHeight > 400 then
  //   FormGameDetails.ClientHeight:= 400;

  // no used anymore ???? is this a debug stuff ? ... what this is, remember can't I (May 23, 2016)
  //BottomPos:= ROMsListView.Header.Columns[0].Width+ROMsListView.Header.Columns[1].Width+ROMsListView.Header.Columns[2].Width;
  //Caption:= 'header: '+IntToStr(BottomPos)+'  -> ELV width: '+IntToStr(ROMsListView.ClientWidth);

  if (Screen.Height = 480) or (Screen.Height = 600) then
     begin
       if FormGameDetails.Width > (Screen.Width-6) then
       begin
         with HorzScrollBar do
         begin
           // Set the range to twice the ClientWidth of the form
           // This means that the form��s logical size is twice as big
           // as the physical window.
           // Note that Range must always be larger than the ClientWidth
           Range:= FormGameDetails.ClientWidth;
           Position:= 0;
           Increment:= 10;  { clicking the scroll arrows moves the form 10 pixels }
           Tracking:= True;
           Visible:= True;  { Show the scrollbar }
         end;
         FormGameDetails.Width:= Screen.Width-6;
       end;

       if FormGameDetails.Height > (Screen.Height-60) then
       begin
          with VertScrollBar do
          begin
            Range:= FormGameDetails.ClientHeight;
            Position:= 0;
            Increment:= 10;  { clicking the scroll arrows moves the form 10 pixels }
            Tracking:= True;
            Visible:= True;  { Show the scrollbar }
          end;
          FormGameDetails.Height:= Screen.Height-60;
       end;
     end;
end;

procedure TFormGameDetails.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.StateImageIndex = 2 then
     ACanvas.Font.Color:= clRed;   // wrong checksum (for CHDs only)
  case Position of
    1, 2:
      begin
        ACanvas.Font.Name:= 'Consolas';
        ACanvas.Font.Size:= 9;
      end;
    3:
     begin
       //ACanvas.Font.Name:= 'Tahoma';
       //ACanvas.Font.Size:= 9;
       if (FormMain.MemGameInfo.eGameSetStatus = 1) and (Item.StateImageIndex = 1) then
          ACanvas.Font.Color:= clRed;
     end;
  end;
end;

procedure TFormGameDetails.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FormMain.ClearListView(ROMsListView);
end;

procedure TFormGameDetails.ROMsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Ord(Item.StateImageIndex = 2), ROMsListView);
end;

procedure TFormGameDetails.ROMsListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       ROMsListView.BeginUpdate;
       ROMsListView.Sort.SortAll;
       ROMsListView.EndUpdate(False);
     end;
end;

function TFormGameDetails.ROMsListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(gItem1.Caption, gItem2.Caption);
    1: Result:= FormMain.iCompare(gItem1.Captions[1], gItem2.Captions[1]);
    2: Result:= FormMain.iCompare(gItem1.Captions[2], gItem2.Captions[2]);
    3: Result:= FormMain.iCompare(gItem1.Captions[3], gItem2.Captions[3]);
  end;
  // try to put CHD files at the bottom ????? what for ? some games have device ROMs after CHD files
  //if (gItem1.Tag = 0) and (gItem2.Tag = 1) then
  //   Result:= -1
  //else
  //if (gItem1.Tag = 1) and (gItem2.Tag = 0) then
  //   Result:= 1;
end;


end.

