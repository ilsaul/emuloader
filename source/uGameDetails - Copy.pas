unit uGameDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, ToolWin, Buttons,
  uCommon, MPCommonObjects, EasyListview, ShadowLabel, PanelEx, // Internal error: U752 :_((( line '8'
  GraphicEx, Dialogs;

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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ROMsListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ROMsListViewItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
  private
    { Private declarations }
    missFile: TMemIniFile;
    IsZiNcSystem: Boolean;
    ZiNcFilePath: String;
    TextPos, LeftPanelSize, LeftPanelMinimumTextSize, LeftPanelLastText: Integer;
    function  FindZiNcFile(const NameString: String): String;
    function  AddEntry2(const sLabelTitle: String; sValue: String = ''; sImageIndex: ShortInt = -1): Boolean;
    //function  AddEntry2(const sLabelTitle: String; sValue: String = ''; sImageIndex: ShortInt = -1): Boolean;
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

function TFormGameDetails.AddEntry2(const sLabelTitle: String; sValue: String = ''; sImageIndex: ShortInt = -1): Boolean;
var
  LabelTemp: TShadowLabel;

  function CreateLabel(const lTitle: String): TShadowLabel;
  var
    newLabel, newLabelValue: TShadowLabel;
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

    newLabelValue:= TShadowLabel.Create(Self);
    newLabelValue.Parent:= FormGameDetails;
    newLabelValue.Font:= LabelYearValue.Font;
    newLabelValue.ShadowEnabled:= LabelYearValue.ShadowEnabled;
    newLabelValue.ShadowColor:= LabelYearValue.ShadowColor;
    newLabelValue.ShowAccelChar:= False;
    //newLabelValue.Transparent:= False;
    //newLabelValue.Color:= clSkyBlue;
    newLabelValue.Left:= LabelYearValue.Left;
    newLabelValue.Top:= TextPos;
    newLabelValue.Caption:= lTitle;
    //TextPos:= TextPos+LabelYearValue.Height;//15;
    Result:= newLabelValue;
    LeftPanelLastText:= newLabelValue.Top;
  end;

  function AddFileInfo(const FileStr: String; FileFound: Boolean): Boolean;
  begin
    Result:= FileFound;
  end;

begin
  Result:= sValue <> '';
  if not Result then
     Exit;

  LabelTemp:= CreateLabel(sLabelTitle);
  LabelTemp.Caption:= sValue;
  LabelTemp.Tag:= sImageIndex;
  case sImageIndex of
   -5:
     begin
       // game type: "Game Files" string
       LabelTemp.Font.Color:= $00A65300;//clNavy;
       LabelTemp.Font.Name:= 'Segoe UI Semibold';
       LabelTemp.Font.Style:= [fsBold];
     end;
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
       LabelTemp.AutoSize:= False;
       LabelTemp.Width:= LeftPanelSize;
       LabelTemp.Height:= LabelTemp.Height+5;
       LabelTemp.WordWrap:= True;
       LabelTemp.AutoSize:= True;
       LabelTemp.AutoSize:= False;
       LabelTemp.Width:= LeftPanelSize;
       //TextPos:= TextPos+LabelTemp.Height;
     end;
  TextPos:= TextPos+LabelTemp.Height;
end;

procedure TFormGameDetails.FillGameTree;
var
  ZipName, ZipParent, ZipBios, ZipExtension, SampleName, ZipDevice, tmpString, SamplesFolder: String;
  IsBiosGame, FileFound, IsSegaModel2: Boolean;
  ImgIndex: ShortInt;
  ListSamples: THashedStringList;
  Loop: Integer;

  function AddControlsList(const ctrlList: String): Boolean;
  var
    TempString: String;
    Loop{, Counter}: Integer;
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
              //Result:= FormMain.MemGameInfo.eUseDeviceROMs = 0;
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

  function GetDriverStatusImageIndex(StatusID: ShortInt): ShortInt;
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

begin
  LeftPanelSize:= 0;
  LeftPanelLastText:= 0;
  LabelYearValue.Visible:= FormMain.MemGameInfo.eYear <> '';
  LabelYear.Visible:= LabelYearValue.Visible;
  if LabelYearValue.Visible then
     begin
       LabelYearValue.Caption:= FormMain.MemGameInfo.eYear;
       TextPos:= LabelYear.Top+17
     end
  else
     TextPos:= LabelYear.Top;
  IsSegaModel2:= FormMain.MemGameInfo.eSystemID = idSegaModel2;
  //LabelYearValue.Caption:= FillBlank(FormMain.MemGameInfo.eYear);
  if FormMain.MemGameInfo.eManufacturer <> '' then
     AddEntry2('Manufacturer', FormMain.MemGameInfo.eManufacturer);

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
                  tmpString:= '';
                  FileFound:= False;
                  for Loop:=0 to FormMain.SamplesDir[Ord(FormMain.MemGameInfo.eSystemID = idMAME)].Count-1 do
                  begin
                    SamplesFolder:= FormMain.SamplesDir[Ord(FormMain.MemGameInfo.eSystemID = idMAME)].Strings[Loop];

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
           AddEntry2('Audio', 'Samples'); // for systems other than MAME, this will never be execute but still...
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
          tmpString:= tmpString+' at ';
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
  IsBiosGame:= FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eName); // will return true is bios <> game name!!!!!

  if IsBiosGame then
     AddEntry2('Bios Name', FormMain.MemGameInfo.eBiosName);
  AddEntry2('Driver Name', FormMain.MemGameInfo.eDriverName);

  ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eDriverStatus);
  AddEntry2('Driver Status', aStatus[FormMain.MemGameInfo.eDriverStatus], ImgIndex);
  if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) then
     begin
       ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eEmulationStatus);
       AddEntry2('   Emulation', aStatus[FormMain.MemGameInfo.eEmulationStatus], ImgIndex);
       ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eColorStatus);
       AddEntry2('   Color', aStatus[FormMain.MemGameInfo.eColorStatus], ImgIndex);
       ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eSoundStatus);
       AddEntry2('   Sound', aStatus[FormMain.MemGameInfo.eSoundStatus], ImgIndex);
       ImgIndex:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eGraphicStatus);
       AddEntry2('   Graphic', aStatus[FormMain.MemGameInfo.eGraphicStatus], ImgIndex);
     end;

  AddEntry2('Category', FormMain.MemGameInfo.eCategory);
  AddEntry2('Version Added', FormMain.MemGameInfo.eVersionAdded);

  AddEntry2('# of Players', FormMain.GetNumberPlayersInfo(FormMain.MemGameInfo.eNumberPlayers, FormMain.MemGameInfo.eNumberPlayersIni));
  AddEntry2('Main CPU Chip', FormMain.MemGameInfo.eChipCPU);
  if FormMain.MemGameInfo.eLanguage <> '' then
     AddEntry2('Language', FormMain.MemGameInfo.eLanguage);

  if (FormMain.MemGameInfo.eSystemID = idZiNc) and (not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification)) then // ZinC game index
     AddEntry2('Game Index', IntToStr(FormMain.MemGameInfo.eScreenType));

  if FormMain.MemGameInfo.eMechanical then
     AddEntry2('Mechanical', 'Yes');

  AddControlsList(FormMain.MemGameInfo.eControls);

  if FormMain.MemGameInfo.ePlayed > 0 then
     begin
       tmpString:= IntToStr(FormMain.MemGameInfo.ePlayed)+'x';
       if FormMain.MemGameInfo.ePlayedDate <> 0 then
          tmpString:= tmpString+' ('+FormMain.GetDateTimeStr(FormMain.MemGameInfo.ePlayedDate)+')';
       AddEntry2('Played', tmpString);
     end;
  tmpString:= '';
  if FormMain.MemGameInfo.eTotalPlaytime > 0 then
     AddEntry2('Playtime', GetPlayTime(FormMain.MemGameInfo.eTotalPlaytime, True));

  // MAME merged set status
  if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) and (FormMain.GameIsClone(FormMain.MemGameInfo.eClone)) then
     if FormMain.IsGameMerged(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eName) then
        LabelEmulatorVersion.Tag:= 1; // means merged into parent set
        
  if FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID] <> '' then
     LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+
                                    FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID];

  if FormMain.MemGameInfo.eGameSizeText <> '' then
     AddEntry2('Game Size', FormMain.MemGameInfo.eGameSizeText);

  //AddEntry2('Scan Mode', aScanMode[FormMain.MemGameInfo.eScanMode], 20); // no longer used (info at top bar)

  tmpString:= 'this set is a ';
  if FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
     tmpString:= tmpString+'bios'
  else
  if FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification) then
     tmpString:= tmpString+'device'
  else
     tmpString:= tmpString+'game';
  AddEntry2('Game Files', tmpString, -5);//' ');
  //if FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs) or (FormMain.MemGameInfo.eSystemID = idDaphne) then
  //   AddEntry2('Game Files', ' ')
  //else
  //   AddEntry2('Game Files', 'No game set needed');

  // if (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count = 0) and (FormMain.MemGameInfo.eSystemID <> idDaphne) then
  //if (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil) and (FormMain.MemGameInfo.eSystemID <> idDaphne) then
  if ((TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) or
     ((TEasyGameInfo(FormMain.SelectedEasyItem).eHaveGameROMs = 0) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) then
     AddEntry2('   Game Set', 'This set contain no ROMs', 1) // special case for sets with no ROMs
  else
  begin
    ZipName:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSystemID);
    if ZipName <> '' then
       begin
         if IsZiNcSystem then
            ZiNcFilePath:= ExtractFilePath(ZipName);
       end;
    if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
       begin
         case IsZiNcSystem of
           True : ZipParent:= FindZiNcFile(FormMain.MemGameInfo.eClone);
           False: ZipParent:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID);
         end;
       end;
  end;

    //if IsSegaModel2 then
    //   FormMain.TempGameVars.eBiosName:= 'model2'
    //else
    //   FormMain.TempGameVars.eBiosName:= FormMain.MemGameInfo.eBiosName;
    //IsBiosGame:= FormMain.ValidateBiosName(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eName); // will return true is bios <> game name!!!!!
    if IsBiosGame then
       begin
         case IsZiNcSystem of
           True : ZipBios:= FindZiNcFile(FormMain.MemGameInfo.eBiosName);
           False: ZipBios:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eSystemID);
         end;
       end;

    if FormMain.SystemUseSevenZip(FormMain.MemGameInfo.eSystemID) then
       tmpString:= ' (.zip; .7z)'
    else
       tmpString:= '.zip';

    if ZipName <> '' then
       AddEntry2('   Game Set', ExtractFileName(ZipName)+' ('+
                            FormMain.GetSizeType(GetFileSize(ZipName), False)+')', Ord(ZipName <> ''))
    else
    if IsCHDGameOnly then
       begin
         // nothing here... this is for the Need for Speed intall disk games and others alike
         // still need to double-check this and make sure there's no need to validate IsCHDGameOnly...
       end
    else
    if (not IsBiosSetOnly) and (not IsDeviceSetOnly) then //and (TEasyGameInfo(FormMain.SelectedEasyItem).eHaveGameROMs = 0) then
       begin
         if LabelEmulatorVersion.Tag <> 1 then
            AddEntry2('   Game Set', FormMain.MemGameInfo.eName+tmpString, 0)
         else
            AddEntry2('   Game Set', 'Merged in parent set', 1); // for merged clone sets!!!
       end;

    if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
       begin
         if ZipParent <> '' then
            AddEntry2('   Parent Set', ExtractFileName(ZipParent)+ ' ('+
                                   FormMain.GetSizeType(GetFileSize(ZipParent), False)+')', 1)
         else
         if not IsBiosSetOnly then // this is for G-NET and others with bios set + chd (no game set)
            AddEntry2('   Parent Set', FormMain.MemGameInfo.eClone+tmpString, 0);
       end;
    if IsBiosGame then
       begin
         if IsSegaModel2 then
            FormMain.TempGameVars.eTitle:= '   Board ROMs'
         else
            FormMain.TempGameVars.eTitle:= '   Bios Set';
         if ZipBios <> '' then
            AddEntry2(FormMain.TempGameVars.eTitle, ExtractFileName(ZipBios)+ ' ('+
                                 FormMain.GetSizeType(GetFileSize(ZipBios), False)+')', 1)
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
         if LabelEmulatorVersion.Tag <> 1 then
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

  // if FormMain.MemGameInfo.eUseDeviceROMs = 1 then
  if TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets <> nil then
     begin
       for ImgIndex:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets.Count-1 do
       begin
         ZipDevice:= FormMain.SearchZIPFolder(TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex], 1);
         if ZipDevice <> '' then
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), ExtractFileName(ZipDevice)+ ' ('+
                                  FormMain.GetSizeType(GetFileSize(ZipDevice), False)+')', 1)
         else
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex]+tmpString, 0);
       end;
       //FreeAndNil(ListDeviceSets);
     end;
  {
  if FormMain.MemGameInfo.eUseDeviceROMs = 1 then
     begin
       FormMain.LoadListDeviceROMs(FormMain.MemGameInfo.eSystemID);
       ListDeviceSets:= TStringList.Create;
       FormMain.ListGamesDeviceROMs[Ord(FormMain.MemGameInfo.eSystemID = 1)].ReadSection(FormMain.MemGameInfo.eName, ListDeviceSets);
       FreeAndNil(FormMain.ListGamesDeviceROMs[Ord(FormMain.MemGameInfo.eSystemID = 1)]);

       for ImgIndex:=0 to ListDeviceSets.Count-1 do
       begin
         ZipDevice:= FormMain.SearchZIPFolder(ListDeviceSets[imgIndex], 1);
         if ZipDevice <> '' then
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), FileStatusStr[1]+': '+ExtractFileName(ZipDevice)+ ' ('+
                                  FormMain.GetSizeType(GetFileSize(ZipDevice), False)+')', 1)
         else
            AddEntry2('   Device Set '+IntToStr(imgIndex+1), FileStatusStr[0]+': '+ListDeviceSets[imgIndex]+tmpString, 0);
       end;
       FreeAndNil(ListDeviceSets);
     end;}
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
end;

procedure TFormGameDetails.FillROMsTree;
var
  sFile: String;
  Item: TEasyItem;
  //Have, Miss: Integer;
  romMissStatus: ShortInt;
  ValidCHD: Boolean;

  function GetROM_ImageIndex: ShortInt;
  begin
    case romMissStatus of
      -1:
        begin
          if FormMain.MemGameInfo.eScanMode = 0 then
             begin
               case FormMain.MemGameInfo.eGameSetStatus of
                 1: Item.ImageIndex:= 0;
                 0: Item.ImageIndex:= 0;//(Ord(FormMain.IsROM_Miss(FormMain.MemGameInfo.eROMIdentification)));
                 2: Item.ImageIndex:= 1;
               end;
             end
          else
             begin
               // for quick scan and force available
               case FormMain.MemGameInfo.eGameSetStatus of
                 1: Item.ImageIndex:= 1; // missing ROMs/CHDs
                 0: Item.ImageIndex:= 0; // all good
                 2: Item.ImageIndex:= 1; // missing all files
                end;
             end;
        end;
      0: Item.ImageIndex:= 1; // file Missing
      1: Item.ImageIndex:= 2; // CHD file found with bad SHA-1
    end;
    Result:= Item.ImageIndex;
  end;

  function GetCHD_NewImageIndex(IsChecksumOk: Boolean): ShortInt;
  begin
    Result:= Ord(not IsChecksumOk); // OK -> 0; not Ok -> 2;
    if Result = 1 then
       Result:= Result+1; // Check not OK
  end;

  function CheckEmptyVar(VarStr: String): String;
  begin
    Result:= '';
    if VarStr <> '' then
       Result:= VarStr+', ';
  end;

  function GetROM_Status(const CRCString: String; const ROMTag: ShortInt; CHDHeaderVersion: Byte = 0): String;
  var
    StrCHD: String;
  begin
    Result:= '';
    StrCHD:= '';
    case ROMTag of
      //3: StrCHD:= 'CHD ';
      4: StrCHD:= 'Bios CHD ';
      5: StrCHD:= 'Dev CHD ';
    end;

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
      if (ROMTag in [3, 4, 5]) and (Item.ImageIndex <> 1) and (CRCString <> '') then
         begin
           if CHDHeaderVersion > 0 then
              Result:= StrCHD+CheckEmptyVar(Result)+'v'+IntToStr(CHDHeaderVersion)
           else
              Result:= StrCHD+CheckEmptyVar(Result)+'v ?';

           //Result:= StrCHD+Result;
         end;
      //else
      //   Result:=  CheckEmptyVar(Result);

      case Item.ImageIndex of
        0:
          begin
            if CRCString <> '' then
               Result:= CheckEmptyVar(Result)+'Ok';
          end;
        1:
          begin
            if CRCString <> '' then
               Result:= CheckEmptyVar(Result)+'Missing'
            else
               begin
                 if FormMain.MemGameInfo.eGameSetStatus = 1 then
                    Item.ImageIndex:= 0;
               end;
          end;
        2:
          begin
            // 'Bad Checksum'; // for CHDs only...
            Result:= CheckEmptyVar(Result);
            if Length(CRCString) > 32 then
               Result:= Result+'Bad SHA-1'
            else
               Result:= Result+'Bad MD5';
               //Result:= CheckEmptyVar(Result)+'SHA-1';
          end;
      end;
    end;
    if CRCString = '' then
       Result:= CheckEmptyVar(Result)+'No Dump';
  end;

  function AddROMs: Boolean;
  var
    LoopROMs, sIndex: Integer;
    isCHD: Boolean;
    tmpString, tmpString2, CHDFile, CHDInfo, CHDChecksum: String;
    HeaderVerCHD: Byte;
    romName, romCRC: String;
    romTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file

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
      romName:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.ValueFromIndex[LoopROMs];
      romTagIndex:= 0;
      //romIsDevice:= False;
      //romIsBios:= False;
      if FormMain.IsROMsListBasedSys(FormMain.MemGameInfo.eSystemID) then
         begin
           romTagIndex:= StrToInt(romName[1]);
           Delete(romName, 1, 2);
         end;
      romCRC:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Names[LoopROMs];
      tmpString:= '';
      romMissStatus:= -1;

      isCHD:= (Length(romCRC) > 8) or
              (SameText(ExtractFileExt(romName), '.chd') );

      if not IsCHD then
         IsCHD:= romTagIndex in [3, 4, 5];

      if Assigned(missfile) then
         begin
           case isCHD of
             True : romMissStatus:= missFile.ReadInteger(FormMain.MemGameInfo.eName, romName, -1); // CHD file
             False: romMissStatus:= missFile.ReadInteger(FormMain.MemGameInfo.eName, romCRC, -1); // ROM file
           end;
         end;

      Item:= ROMsListView.Items.Add;
      GetROM_ImageIndex;
      
      case isCHD of
        True:
          begin
            HeaderVerCHD:= 0;
            tmpString:= ''; // holds CHD name
            tmpString2:= ''; // holds Parent CHD name
            // extract the _"parentchd"_ and get the CHD filename (discard parent CHD name)
            sIndex:= Pos('_"parentchd"_', romName);
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
               end;

            Item.Caption:= tmpString;

            case IsZiNcSystem of
              True : CHDFile:= FormMain.SearchZiNcCHDFolder(tmpString, FormMain.MemGameInfo.eName, ZiNcFilePath);
              False: CHDFile:= FormMain.SearchCHDFolder(tmpString, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eSystemID);
            end;
            CHDInfo:= tmpString;
            if CHDFile <> '' then
               begin
                 if romCRC <> '' then
                    ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romCRC, CHDChecksum, HeaderVerCHD)
                 else
                    ValidCHD:= True; // no dump...

                 Item.ImageIndex:= GetCHD_NewImageIndex(ValidCHD);
                 Item.Captions[1]:= CHDChecksum;
               end
            else
               begin
                 if romCRC <> '' then
                    Item.ImageIndex:= 1 // file missing
                 else
                    begin
                      //if FormMain.MemGameInfo.eGameSetStatus = 1 then
                      if FormMain.MemGameInfo.eGameSetStatus <> 2 then
                         Item.ImageIndex:= 0 // file not found but it's a "no dump"...
                      else
                         Item.ImageIndex:= 1;
                    end;
               end;

            //showMessage('rom tag: '+IntToStr(romTagIndex));
            case romTagIndex of
              3: AddEntry2('   CHD', CHDInfo, Ord(CHDFile <> ''));
              4: AddEntry2('   Bios CHD', CHDInfo, Ord(CHDFile <> ''));
              5: AddEntry2('   Device CHD', CHDInfo, Ord(CHDFile <> ''));
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
                      if romCRC <> '' then
                         ValidCHD:= FormMain.CreateCHD_SHA1(CHDFile, romCRC, CHDChecksum, HeaderVerCHD)
                      else
                         ValidCHD:= True;
                      Item.Caption:= tmpString2;
                      Item.ImageIndex:= GetCHD_NewImageIndex(ValidCHD);
                      Item.Captions[1]:= CHDChecksum;
                    end
                 else
                    begin
                      if romCRC <> '' then
                         Item.ImageIndex:= 1 // file missing
                      else
                         begin
                           if FormMain.MemGameInfo.eGameSetStatus = 1 then
                              Item.ImageIndex:= 0 // file not found but it's a "no dump"...
                           else
                              Item.ImageIndex:= 1;
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
      Item.Captions[1]:= romCRC; // ROM Checksum
      Item.Captions[2]:= GetROM_Status(romCRC, romTagIndex, HeaderVerCHD); // ROM Status
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

  sFile:= FormMain.GetGamesFolderEL+ChangeFileExt(GetSystemFileName(FormMain.MemGameInfo.eSystemID), '.miss');
  if FileExists(sFile) then
     missFile:= TMemIniFile.Create(sFile);
  AddROMs;
  FreeAndNil(missFile);
end;

procedure TFormGameDetails.FormShow(Sender: TObject);
var
  Loop: Integer;
  CHDsAllNoDump: Boolean;
  iROM: String;
  
  ROMsCount, BottomPos, HeaderSize, iROMsHeight: Integer;
begin
  FormMain.ELV_ResetNormalColors(ROMsListView);

  //FormMain.LoadGameIDThumbIcon(SystemIcon, FormMain.MemGameInfo.eROMIdentification);
  //FormMain.IL_ArcadeSystem_Large.GetIcon(FormMain.MemGameInfo.eSystemID, GameIcon.Picture.Icon);

  FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.MemGameInfo.eROMIdentification, SystemIcon.Picture.Icon);
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

  LeftPanelMinimumTextSize:= 137;
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
                iROM:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.ValueFromIndex[Loop];
                if iROM[1] in ['3', '4', '5'] then
                   begin
                     iROM:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Names[Loop];
                     if iROM <> '' then
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
            FormGameDetails.ClientWidth:= FormGameDetails.ClientWidth+186;
            ROMsListView.Header.Columns[1].Width:= 248;
            ROMsListView.Header.Columns[2].Width:= 119;
            ROMsListView.Width:= ROMsListView.Width+186;
            FrameROMsListView.Width:= FrameROMsListView.Width+186;
          end;
     end;

  // part from Form.Activate event!!!
  if FormGameDetails.Tag <> 0 then
     Exit;
  FormGameDetails.Tag:= 1;
  FillGameTree;
  Application.ProcessMessages;
  FillROMsTree;

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

  BottomPos:= LeftPanelLastText+LabelYearValue.Height;

  HeaderSize:= ROMsListView.Header.Height+2+4; // +4 for the bottom border
  ROMsCount:= ROMsListView.Groups.ItemCount;
  iROMsHeight:= HeaderSize+(ROMsCount*ROMsListView.CellSizes.Report.Height);
  //iFormHeight:= LeftPanelLastText+LabelYearValue.Height+6; // 6 for the border

  if ROMsCount < 26 then // 25 files visible max!
     begin
       if BottomPos < (iROMsHeight+ROMsListView.Top) then
          BottomPos:= iROMsHeight+ROMsListView.Top;
     //ROMsListView.Height:= HeaderSize+(25*ROMsListView.CellSizes.Report.Height)//+4; // 25 files visible max!
     end;

  ROMsListView.Height:= BottomPos-ROMsListView.Top;//HeaderSize+(ROMsCount*ROMsListView.CellSizes.Report.Height);//+4;
  FrameROMsListView.Height:= ROMsListView.Height+2;
  if ROMsListView.Groups.ItemCount > 0 then
     ROMsListView.Header.Columns[0].Caption:= 'Name'+Format('%25s', [IntToStr(ROMsListView.Groups.VisibleItemCount)+' files']);
  if ROMsListView.Scrollbars.VertBarVisible then
     ROMsListView.Header.Columns[2].Width:= ROMsListView.Header.Columns[2].Width-GetSystemMetrics(SM_CXVSCROLL);//16;

  //LabelNoROMs.Top:= FrameROMsListView.Top+16;
  //if not FormMain.CheckTotal(ROMsListView) then
  //   LabelNoROMs.Left:= FrameROMsListView.Left+((FrameROMsListView.Width-LabelNoROMs.Width) div 2);

  Inc(BottomPos, 7); // add 7 pixels to make the 6 pixels border

  if FormGameDetails.ClientHeight > BottomPos then
     FormGameDetails.ClientHeight:= BottomPos;

  //BottomPos:= ROMsListView.Header.Columns[0].Width+ROMsListView.Header.Columns[1].Width+ROMsListView.Header.Columns[2].Width;
  //Caption:= 'header: '+IntToStr(BottomPos)+'  -> ELV width: '+IntToStr(ROMsListView.ClientWidth);
end;

procedure TFormGameDetails.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.ImageIndex = 2 then
     ACanvas.Font.Color:= clRed;   // wrong checksum (for CHDs only)
  case Position of
    1: ACanvas.Font.Name:= 'Consolas';
    2:
     begin
       if (FormMain.MemGameInfo.eGameSetStatus = 1) and (Item.ImageIndex = 1) then
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
     FormMain.ELV_SetSelectRibbon(Ord(Item.ImageIndex = 2), ROMsListView);
end;

end.
