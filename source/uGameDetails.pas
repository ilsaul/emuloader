unit uGameDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, IniFiles, ToolWin, Buttons,
  uCommon, uCommonCustom, MPCommonObjects, MPCommonUtilities, EasyListview, ShadowLabel,
  PanelEx, // Internal error: U752 :_((( line '8'
  GraphicEx, Dialogs, ImgList, ZipForge, SevenZip;

type
  TFormGameDetails = class(TForm)
    TopBar: TPanelEx;
    LabelYear: TShadowLabel;
    LabelYearValue: TShadowLabel;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    GameIcon: TImage;
    LabelEmulatorVersion: TShadowLabel;
    LabelScanMode: TShadowLabel;
    IL_FileType: TImageList;
    ROMsListView: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LeftTextMaxSize: Integer;
    IsZiNcSystem: Boolean;
    ZiNcFilePath: String;
    EmuConGameFileName: WideString;
    TextPos, LeftPanelSize, LeftPanelMinimumTextSize, LeftPanelLastText, LeftPanelLastTextHeight: Integer;
    MissingSetZipContents: THashedStringList;
    CRC32CollisionFile: TStringList;
    missFile: TMemIniFile;
    IsSetMissing: Boolean;
    function  FindZiNcFile(const NameString: String): String;
    procedure CreateLabelTitle(const lTitle: WideString);
    procedure CreateLabelValue(const tValue: WideString; var ShadowLabelVar: TShadowLabel; DriverIndex: ShortInt = -1);
    procedure SetLabelColor(LabelSource: TShadowLabel; StateIndex: ShortInt);
    function  AddEntry2(const sLabelTitle: String; sValue: WideString = ''; sImageIndex: ShortInt = -1; const sLabelHint: String = ''): Boolean;
    function  GetDriverStatusImageIndex(StatusID: ShortInt): ShortInt;
    procedure FillGameTree;
    function  FileSizeStr(iFileSize: Int64; const CHDFileName: WideString = ''; iArcadeMediaType: Integer = -1): String;
    procedure FillROMsTree;
    procedure FillEmuConGameFilesTree;
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormGameDetails: TFormGameDetails;

implementation

uses uMain;

{$R *.DFM}

procedure TFormGameDetails.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormGameDetails do
  begin
    ClientWidth:= 2230;
    ClientHeight:= 659;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, GameIcon, LabelGameTitle, 1635, LabelEmulatorVersion, 1370, LabelScanMode, 1664);

    FormMain.Set4KLabelSpecs(LabelYear, 10, 159, -1, -1, 16);
    FormMain.Set4KLabelFontNameSpecs(LabelYear);

    FormMain.Set4KLabelSpecs(LabelYearValue, 174, LabelYear.Top, -1, -1, 16);

    FormMain.Set4KListViewSpecs(ROMsListView, 580, 159, 1628, 490, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(ROMsListView);

    ROMsListView.Header.Columns[0].Width:= 700;
    ROMsListView.Header.Columns[1].Width:= 120;
    ROMsListView.Header.Columns[2].Width:= 504;
    ROMsListView.Header.Columns[3].Width:= 180;
    ROMsListView.Header.Columns[4].Width:= 180;
    ROMsListView.Header.Columns[5].Width:= 120;

    ROMsListView.CellSizes.Report.Height:= 38;

    ROMsListView.ImagesSmall:= FormMain.IL_MediaType_Large;
    ROMsListView.ImagesState:= FormMain.IL_Misc_Large;
    ROMsListView.PaintInfoItem.ImageIndent:= 3;
  end;
end;

procedure TFormGameDetails.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#27, #13] then
     Close;
end;

function TFormGameDetails.FindZiNcFile(const NameString: String): String;
begin
  Result:= '';
  if ZiNcFilePath <> '' then
     begin
       if FileExists(ZiNcFilePath+NameString+'.zip') then
          Result:= ZiNcFilePath+NameString+'.zip';
     end;
end;

procedure TFormGameDetails.CreateLabelTitle(const lTitle: WideString);
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

{procedure TFormGameDetails.CreateLabelValue(const tValue: WideString; var ShadowLabelVar: TShadowLabel; DriverIndex: ShortInt = -1);
var
  newLabelValue: TShadowLabel;
  ValueStr: String;
begin
  // this code might still be used in the future (TEasyListview instead of TLabel), do not delete (February 21, 2018)
  //if DriverIndex > -1 then
  //   begin
  //     case DriverIndex of
  //       1: ValueStr:= aStatus[FormMain.MemGameInfo.eEmulationStatus];
  //       2: ValueStr:= aStatus[FormMain.MemGameInfo.eColorStatus];
  //       3: ValueStr:= aStatus[FormMain.MemGameInfo.eSoundStatus];
  //       4: ValueStr:= aStatus[FormMain.MemGameInfo.eGraphicStatus];
  //     end;
  //   end
  //else
     ValueStr:= tValue;
  if (ValueStr = '') then //and (DriverIndex = -1) then
     Exit;

  newLabelValue:= TShadowLabel.Create(Self);
  newLabelValue.Parent:= FormGameDetails;
  newLabelValue.Font:= LabelYearValue.Font;
  newLabelValue.ShadowEnabled:= LabelYearValue.ShadowEnabled;
  newLabelValue.ShadowColor:= LabelYearValue.ShadowColor;
  newLabelValue.ShowAccelChar:= False;
  newLabelValue.Left:= LabelYearValue.Left; // default position

  case DriverIndex of
    //-1: newLabelValue.Left:= LabelYearValue.Left; // do nothing... this really need to be here ?
     1: // EmulationStatus
       begin
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eEmulationStatus);
       end;
     2: // ProtectionStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+103
         else
            newLabelValue.Left:= newLabelValue.Left+61;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eProtectionStatus);
       end;
     3: // GraphicStatus
       begin
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eGraphicStatus);
       end;
     4: // ColorStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+82
         else
            newLabelValue.Left:= newLabelValue.Left+49;

         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eColorStatus);
       end;
     5: // SoundStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+82+60
         else
            newLabelValue.Left:= newLabelValue.Left+48+39;

         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eSoundStatus);
       end;
  end;
  
  if DriverIndex = -1 then
     SetLabelColor(NewLabelValue, NewLabelValue.Tag);
  //else
  //   SetLabelColor(NewLabelValue, 21);

  newLabelValue.Top:= TextPos;
  newLabelValue.Caption:= ValueStr;
  ShadowLabelVar:= newLabelValue;
  LeftPanelLastText:= newLabelValue.Top;
end;}

procedure TFormGameDetails.CreateLabelValue(const tValue: WideString; var ShadowLabelVar: TShadowLabel; DriverIndex: ShortInt = -1);
var
  newLabelValue: TShadowLabel;
  ValueStr: String;
begin
  // this code might still be used in the future (TEasyListview instead of TLabel), do not delete (February 21, 2018)
  //if DriverIndex > -1 then
  //   begin
  //     case DriverIndex of
  //       1: ValueStr:= aStatus[FormMain.MemGameInfo.eEmulationStatus];
  //       2: ValueStr:= aStatus[FormMain.MemGameInfo.eColorStatus];
  //       3: ValueStr:= aStatus[FormMain.MemGameInfo.eSoundStatus];
  //       4: ValueStr:= aStatus[FormMain.MemGameInfo.eGraphicStatus];
  //     end;
  //   end
  //else
     ValueStr:= tValue;
  if ValueStr = '' then
     Exit;

  newLabelValue:= TShadowLabel.Create(Self);
  newLabelValue.Parent:= FormGameDetails;
  newLabelValue.Font:= LabelYearValue.Font;
  newLabelValue.ShadowEnabled:= LabelYearValue.ShadowEnabled;
  newLabelValue.ShadowColor:= LabelYearValue.ShadowColor;
  newLabelValue.ShowAccelChar:= False;
  newLabelValue.Left:= LabelYearValue.Left; // default position

  case DriverIndex of
    //-1: newLabelValue.Left:= LabelYearValue.Left; // do nothing... this really need to be here ?
     1: // EmulationStatus
       begin
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eEmulationStatus);
       end;
     2: // ProtectionStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+103
         else
            newLabelValue.Left:= newLabelValue.Left+61;
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eProtectionStatus);
       end;
     3: // GraphicStatus
       begin
         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eGraphicStatus);
       end;
     4: // ColorStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+82
         else
            newLabelValue.Left:= newLabelValue.Left+49;

         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eColorStatus);
       end;
     5: // SoundStatus
       begin
         if Is4KMode then
            newLabelValue.Left:= newLabelValue.Left+82+60
         else
            newLabelValue.Left:= newLabelValue.Left+48+39;

         newLabelValue.Tag:= GetDriverStatusImageIndex(FormMain.MemGameInfo.eSoundStatus);
       end;
  end;
  if DriverIndex <> -1 then
     SetLabelColor(NewLabelValue, NewLabelValue.Tag);

  newLabelValue.Top:= TextPos;
  newLabelValue.Caption:= ValueStr;
  ShadowLabelVar:= newLabelValue;
  LeftPanelLastText:= newLabelValue.Top;
end;

procedure TFormGameDetails.SetLabelColor(LabelSource: TShadowLabel; StateIndex: ShortInt);
begin
  case StateIndex of
    -5: // game type: "Game Files" string
      begin
        LabelSource.Font.Color:= MsgTxtColors.colorFileName;
        if IsNightMode then
           LabelSource.ShadowColor:= clNavy;
      end;
    21: // unknown driver status
      begin
        if IsNightMode then
           LabelSource.Font.Color:= clrDarkGray2
        else
           LabelSource.Font.Color:= clSilver;
        //LabelSource.Font.Color:= item_caption_disabled_color[Ord(IsNightMode)];
        if IsNightMode then
           LabelSource.ShadowColor:= clNavy;
      end;
     0: // File Missing
      begin
        if IsNightMode then
           LabelSource.Font.Color:= clrLightRed
        else
           LabelSource.Font.Color:= clRed;
        if IsNightMode then
           LabelSource.ShadowColor:= $323200;
      end;
     1: // Have File / ROM
       begin
         if IsNightMode then
             begin
               LabelSource.Font.Color:= clrLightGreen;// clLime;
               LabelSource.ShadowColor:= $003232;
             end
         else
             LabelSource.Font.Color:= clGreen;
       end;
      2: // Missing ROMs/CHDs
       begin
         if IsNightMode then
            begin
              LabelSource.Font.Color:= clrOrangeBarTop;//clYellow;
              LabelSource.ShadowColor:= $003232;
            end
         else
            LabelSource.Font.Color:= clOlive;
       end;
      20: LabelSource.Font.Color:= MsgTxtColors.colorFileName; // Scan Mode
    end;
end;

function TFormGameDetails.AddEntry2(const sLabelTitle: String; sValue: WideString = ''; sImageIndex: ShortInt = -1; const sLabelHint: String = ''): Boolean;
var
  LabelTemp: TShadowLabel;

  function AddFileInfo(const FileStr: WideString; FileFound: Boolean): Boolean;
  begin
    Result:= FileFound;
  end;

begin
  Result:= sValue <> '';
  if not Result then
     Exit;

  CreateLabelTitle(sLabelTitle);
  CreateLabelValue(sValue, LabelTemp);
  LabelTemp.Caption:= sValue;
  LabelTemp.Tag:= sImageIndex;

  SetLabelColor(LabelTemp, sImageIndex);

  if LabelTemp.Width > LeftPanelSize then
     LeftPanelSize:= LabelTemp.Width;
  if LeftPanelSize > LeftTextMaxSize then
     begin
       LeftPanelSize:= LeftTextMaxSize;
       // enable WordWrap and create a 2 lines label
       // for manufacturer, category and game file (MAME "CPS3" set has a really huge .chd filename)
       LabelTemp.AutoSize:= False;
       LabelTemp.Width:= LeftPanelSize;
       LabelTemp.Height:= LabelTemp.Height*2;

       LabelTemp.WordWrap:= True;
       LabelTemp.WordWrapSpaceless:= True;

       if sLabelHint <> '' then
          begin // only enable label hint if text is bigger than panel
            LabelTemp.Hint:= sLabelHint;
            LabelTemp.ShowHint:= True;
          end;
     end;
  LeftPanelLastTextHeight:= LabelTemp.Height;
  TextPos:= TextPos+LeftPanelLastTextHeight;
end;

function TFormGameDetails.GetDriverStatusImageIndex(StatusID: ShortInt): ShortInt;
begin
  case StatusID of
   -1: Result:= 21;
    0: Result:= 1;
    1: Result:= 2;
    2: Result:= 0;
  else
    Result:= 21;
  end;
end;

procedure TFormGameDetails.FillGameTree;
var
  ZipExtension, SampleName, ZipDevice, tmpString, SamplesFolder: String;
  ZipName, ZipParent, ZipBios: WideString;
  IsBiosGame, FileFound, IsSegaModel2, NoROMs: Boolean;
  ImgIndex: ShortInt;
  ListSamples: THashedStringList;
  Loop: Integer;
  Supermodel3ControlsList, SamplesPathList: TStringList;
  ReqSoftwareName, ReqSetName, sFileName: String;

  function AddControlsList(const ctrlList: String): Boolean;
  var
    TempString: String;
    Loop: Integer;
    ButtonsOnly: Boolean;
  begin
    Result:= (ctrlList <> '') or (FormMain.MemGameInfo.eButtonsCount > 0);
    if not Result then
       Exit;

    if FormMain.MemGameInfo.eSystemID = idSupermodel then
       begin
         Result:= FormMain.ValidateFile(FormMain.GetControlTypeFile(idSupermodel));
         if not Result then
            Exit;

         Supermodel3ControlsList:= TStringList.Create;
         Supermodel3ControlsList.LoadFromFile(FormMain.GetControlTypeFile(idSupermodel));
       end;

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

                if FormMain.MemGameInfo.eSystemID = idSupermodel then
                   begin
                     if TempString <> '' then
                        begin
                          TempString:= 'input_'+TempString;
                          if ButtonsOnly then
                             begin
                               AddEntry2('Controls', Supermodel3ControlsList.Values[TempString]);
                               ButtonsOnly:= False;
                             end
                          else
                             AddEntry2('', Supermodel3ControlsList.Values[TempString]);
                        end;
                   end
                else
                begin
                  if ButtonsOnly then
                     begin
                       AddEntry2('Controls', FormMain.ControlType.Values[TempString]);
                       ButtonsOnly:= False;
                     end
                  else
                     begin
                       if TempString <> 'buttons' then
                          AddEntry2('', FormMain.ControlType.Values[TempString]);
                     end;
                end;

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
    if FormMain.MemGameInfo.eSystemID = idSupermodel then
       FreeAndNil(Supermodel3ControlsList);
  end;

  function IsCHDGameOnly: Boolean;
  begin
    // no game set, no bios set, no device sets
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
    // no main game set, just device sets
    Result:= TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets <> nil;
    if Result then
       Result:= not FormMain.GameHaveROMs(FormMain.MemGameInfo.eHaveGameROMs);
  end;

  function AddSoftEntry(const iString: String; sTitle: WideString = ''): Boolean;
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
    if FormMain.MemGameInfo.eDriverStatus < 1 then
       Exit; // driver is "good" or "none" then don't add extra status texts

    iLabelDriver:= nil;
    //if FormMain.MemGameInfo.eEmulationStatus <> -1 then
       CreateLabelValue('Emulation', iLabelDriver, 1);

    //if FormMain.MemGameInfo.eProtectionStatus <> -1 then
       CreateLabelValue('Protection', iLabelDriver, 2);

    //if (FormMain.MemGameInfo.eEmulationStatus <> -1) or (FormMain.MemGameInfo.eProtectionStatus <> -1) then
    if iLabelDriver <> nil then
       TextPos:= TextPos+iLabelDriver.Height;

    //if FormMain.MemGameInfo.eGraphicStatus <> -1 then
       CreateLabelValue('Graphic', iLabelDriver, 3);

    //if FormMain.MemGameInfo.eColorStatus <> -1 then
       CreateLabelValue('Color', iLabelDriver, 4);

    //if FormMain.MemGameInfo.eSoundStatus <> -1 then
       CreateLabelValue('Sound', iLabelDriver, 5);

    if iLabelDriver <> nil then
       TextPos:= TextPos+iLabelDriver.Height;
  end;

  function GetZipContents(ZipFileName: String): Boolean;
  var
    ArchiveItem: TZFArchiveItem;
    iSetNameStr: String;
    IsCollision: Boolean;
    ROMFileMemoryStream: TWideMemoryStream;
  begin
    Result:= FileExists(ZipFileName);
    if not Result then
       Exit;
    MissingSetZipContents.BeginUpdate;
    iSetNameStr:= ChangeFileExtW(ExtractFileNameW(ZipFileName), '');

    IsCollision:= Assigned(CRC32CollisionFile) and (CRC32CollisionFile.IndexOf(iSetNameStr) <> -1);
    if IsCollision then
       ROMFileMemoryStream:= TWideMemoryStream.Create;

    with FormMain.ZipForge do
    begin
      FileName:= ZipFileName;

      // Open existing archive file
      try
        OpenArchive(fmOpenRead or fmShareDenyNone);

        Result:= FileCount > 0;
        if Result then
           begin
             // Search text files stored inside the archive
             if FindFirst('*.*', ArchiveItem) then
                begin
                  repeat
                    if IsCollision then
                       begin
                         ExtractToStream(ArchiveItem.FileName, ROMFileMemoryStream);
                         FormMain.GenerateStreamSHA1(ROMFileMemoryStream, MissingSetZipContents, iSetNameStr);
                       end
                    else
                       MissingSetZipContents.Add(iSetNameStr+'='+LowerCase(IntToHex(ArchiveItem.CRC, 8)));
                  until (not FindNext(ArchiveItem));
                end
             else
                Result:= False;
           end;
        CloseArchive;
        FormMain.ZipForge.FileName:= '';
      except
        Result:= False;
        CloseArchive;
        FormMain.ZipForge.FileName:= '';
      end;
    end;
    MissingSetZipContents.EndUpdate;
    if IsCollision then
       begin
         ROMFileMemoryStream.Clear;
         FreeAndNil(ROMFileMemoryStream);
       end;
  end;

  function GetSevenZipContents(SevenZipFileName: String): Boolean;
  var
    ArchiveItem: I7zInArchive;
    Loop7z: Integer;
    iSetNameStr: String;
    IsCollision: Boolean;
    ROMFileMemoryStream: TWideMemoryStream;
  begin
    Result:= FileExists(SevenZipFileName);
    if not Result then
       Exit;

    try
      ArchiveItem:= CreateInArchive(CLSID_CFormat7z);
    except
      Result:= False;
      Exit;
    end;

    MissingSetZipContents.BeginUpdate;
    iSetNameStr:= ChangeFileExtW(ExtractFileNameW(SevenZipFileName), '');

    IsCollision:= Assigned(CRC32CollisionFile) and (CRC32CollisionFile.IndexOf(iSetNameStr) <> -1);
    if IsCollision then
       ROMFileMemoryStream:= TWideMemoryStream.Create;
       
    with ArchiveItem do
    begin
      // Open existing archive file
      try
        OpenFile(SevenZipFileName);

        Result:= NumberOfItems > 0;
        if Result then
           begin
             // Search text files stored inside the archive
             for Loop7z:= 0 to NumberOfItems-1 do
             begin
               if not ItemIsFolder[Loop7z] then
                  begin
                    if IsCollision then
                       begin
                         ExtractItem(Loop7z, ROMFileMemoryStream, False);
                         FormMain.GenerateStreamSHA1(ROMFileMemoryStream, MissingSetZipContents, iSetNameStr);
                       end
                    else
                       MissingSetZipContents.Add(iSetNameStr+'='+LowerCase(IntToHex(ItemCRC[Loop7z], 8)));
                  end;
             end;
           end;
        Close;
      except
        Result:= False;
        Close;
      end;
    end;
    MissingSetZipContents.EndUpdate;
    if IsCollision then
       begin
         ROMFileMemoryStream.Clear;
         FreeAndNil(ROMFileMemoryStream);
       end;
  end;

  function GetFileContents(const iFile: WideString): Boolean;
  begin
    Result:= IsSetMissing;
    if not Result then
       Exit;

    if FormMain.IsZipFile(iFile) then
       Result:= GetZipContents(iFile)
    else
       Result:= GetSevenZipContents(iFile);
  end;

begin
  LeftPanelSize:= 0;
  LeftPanelLastText:= 0;
  LeftPanelLastTextHeight:= LabelYearValue.Height;
  LabelYearValue.Visible:= FormMain.MemGameInfo.eYear <> '';
  LabelYear.Visible:= LabelYearValue.Visible;
  NoROMs:= False;
  sFileName:= ''; // to check if requirement is a software list or a device that must be attached in a machine (if empty is a device, not a software)
  if LabelYearValue.Visible then
     begin
       LabelYearValue.Caption:= FormMain.MemGameInfo.eYear;
       TextPos:= LabelYear.Top+LabelYear.Height;
     end
  else
     TextPos:= LabelYear.Top;
  IsSegaModel2:= FormMain.MemGameInfo.eSystemID = idSegaModel2;

  AddEntry2('Manufacturer', FormMain.MemGameInfo.eManufacturer);

  // AddEntry2('Alternate Title', Utf8Decode('グラディウス')); ... for MAME software list only
  // maybe ?????

  if not FormMain.MemGameInfo.eIsCustomGame then
  begin
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

    if FormMain.MemGameInfo.eRequiresArtwork then
       AddEntry2('Artwork', 'External Artwork Required');
       
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

    if FormMain.MemGameInfo.eCocktailStatus <> -1 then
       AddEntry2('Cocktail', aStatus[FormMain.MemGameInfo.eCocktailStatus], GetDriverStatusImageIndex(FormMain.MemGameInfo.eCocktailStatus));

    if FormMain.MemGameInfo.eNetwork <> -1 then
       AddEntry2('Local Network', aStatus[FormMain.MemGameInfo.eNetwork], GetDriverStatusImageIndex(FormMain.MemGameInfo.eNetwork));

    if FormMain.IsMAMEBasedSys(FormMain.MemGameInfo.eSystemID) and (FormMain.MemGameInfo.eSoftwareName = '') then
       begin
         tmpString:= aSaveState[FormMain.MemGameInfo.eSaveState];
         if tmpString <> '' then
            AddEntry2('Save State', tmpString);
       end;
  end;

  if FormMain.MemGameInfo.eSoftwareName = '' then
     tmpString:= 'Category'
  else
     tmpString:= 'Software List';
  AddEntry2(tmpString, FormMain.MemGameInfo.eCategory);
  tmpString:= '';

  if not FormMain.MemGameInfo.eIsCustomGame then
  begin
    AddEntry2('Version Added', FormMain.MemGameInfo.eVersionAdded);

    AddEntry2('Compatibility', FormMain.MemGameInfo.eSoftwareCompatible);
    AddEntry2('Usage', FormMain.MemGameInfo.eSoftwareUsageTip);
    
    if FormMain.MemGameInfo.eSoftwareName <> '' then
       begin
         FormMain.SoftListGetRequirementInfo(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSoftwareName, ReqSetName, ReqSoftwareName);
         sFileName:= FormMain.GetGamesFolderEL(1, FormMain.MemGameInfo.eSystemID)+GetSystemFileName(FormMain.MemGameInfo.eSystemID, 0, ReqSoftwareName);
         if (ReqSetName <> '') or (ReqSoftwareName <> '') then
         begin
           if FileExists(sFileName) then
           begin
             if ReqSetName <> '' then
                AddEntry2('Require Set', ReqSetName);
             if ReqSoftwareName <> '' then
                AddEntry2('', 'Softlist: '+ReqSoftwareName);
           end
           else
           begin
             // it's a device, not a software list XML file (August 12, 2021)
             if (ReqSetName <> '') or (ReqSoftwareName <> '') then
                begin
                  if FormMain.MemGameInfo.eSoftwareName <> 'pcecd' then
                  begin
                    if ReqSoftwareName <> '' then
                       AddEntry2('Require Dev', ReqSoftwareName+':'+ReqSetName)
                    else
                       AddEntry2('Require Dev', ReqSetName);
                  end
                  else
                     AddEntry2('Require Dev', '-cart '+ReqSetName);
                end;
             sFileName:= '';
           end;
         end;
       end;

    AddEntry2('Main CPU Chip', FormMain.MemGameInfo.eChipCPU);

    AddEntry2('Language', FormMain.MemGameInfo.eLanguage);

    AddEntry2('# of Players', FormMain.GetNumberPlayersInfo(FormMain.MemGameInfo.eNumberPlayers, FormMain.MemGameInfo.eNumberPlayersIni));

    if (FormMain.MemGameInfo.eSystemID = idZiNc) and (not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification)) then // ZinC game index
       AddEntry2('Game Index', IntToStr(FormMain.MemGameInfo.eScreenType));

    AddControlsList(FormMain.MemGameInfo.eControls);

    if FormMain.MemGameInfo.eMechanical then
       AddEntry2('Mechanical', 'Yes');
  end;

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

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        if EmulatorVersionCustom[FormMain.MemGameInfo.eCustomSystemID, EmulatorIndexToUseCustom[FormMain.MemGameInfo.eCustomSystemID]] <> '' then
           LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+
                                          EmulatorVersionCustom[FormMain.MemGameInfo.eCustomSystemID, EmulatorIndexToUseCustom[FormMain.MemGameInfo.eCustomSystemID]];
      end;
    False:
      begin
        if FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID] <> '' then
           LabelEmulatorVersion.Caption:= LabelEmulatorVersion.Caption+#13#10+
                                          FormMain.EmulatorVersion[FormMain.MemGameInfo.eSystemID];
      end;
  end;

  AddEntry2('Game Size', FormMain.MemGameInfo.eGameSizeText);

  // added in June 10, 2015 (show software list strings)
  ImgIndex:= Length(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList);
  if ImgIndex > 0 then
     begin
       AddSoftEntry(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[0], 'Software List');
       if ImgIndex > 1 then
          begin
            for Loop:= 1 to (ImgIndex-1) do
                AddSoftEntry(uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eSoftwareList[Loop]);
          end;
     end;

  tmpString:= '';

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        tmpString:= GetSystemTypeTitle(FormMain.MemGameInfo.eCustomSystemID, False)+' Game'; // EmuCon game
      end;
    False:
      begin
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
      end;
  end;

  AddEntry2('Game Files', tmpString, -5);

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        if FormMain.SearchGameFile(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eCustomMediaType, False, False, FormMain.TempGameVars.eName) then
           begin
             ZipName:= FormMain.TempGameVars.eName;
             EmuConGameFileName:= ZipName;
           end;

        FormMain.TempGameVars.eName:= '';
        if ZipName <> '' then
           AddEntry2('   Game Set', ExtractFileNameW(ZipName), Ord(ZipName <> ''))
        else
           AddEntry2('   Game Set', FormMain.MemGameInfo.eName, 0);
      end;
    False:
      begin
        if ((TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) or
           ((TEasyGameInfo(FormMain.SelectedEasyItem).eHaveGameROMs = 0) and (FormMain.MemGameInfo.eSystemID <> idDaphne)) then
           begin
             NoROMs:= True;
           end
        else
        begin
          ZipName:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
          if ZipName <> '' then
             begin
               if IsZiNcSystem then
                  ZiNcFilePath:= ExtractFilePathW(ZipName);
             end;
          if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
             begin
               case IsZiNcSystem of
                 True : ZipParent:= FindZiNcFile(FormMain.MemGameInfo.eClone);
                 False: ZipParent:= FormMain.SearchZIPFolder(FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
               end;
             end;
        end;

        if not IsBiosGame then
           begin
             case IsZiNcSystem of
               True : ZipBios:= FindZiNcFile(FormMain.MemGameInfo.eBiosName);
               False: ZipBios:= FormMain.SearchZIPFolder(FormMain.TempGameVars.eBiosName, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
             end;
           end;

        if IsSetMissing then
           MissingSetZipContents:= THashedStringList.Create;

        if FormMain.SystemUseSevenZip(FormMain.MemGameInfo.eSystemID) then
           tmpString:= ' (.zip; .7z)'
        else
           tmpString:= '.zip';

        if NoROMs then
           AddEntry2('   Game Set', 'Set with no Game ROMs') // special case for sets with no ROMs
        else
        if FormMain.MemGameInfo.eGameROMsNoDump then
           AddEntry2('   Game Set', FormMain.MemGameInfo.eName+' (No Game ROMs)')
        else
        if ZipName <> '' then
           begin
             AddEntry2('   Game Set', ExtractFileNameW(ZipName), Ord(ZipName <> ''));
             if IsSetMissing then
                GetFileContents(ZipName);
           end
        else
        if IsCHDGameOnly then
           begin
             // nothing here... this is for "Need for Speed" intall disk games and others alike
             // still need to double-check this and make sure there's no need to validate IsCHDGameOnly...
           end
        else
        if (not IsBiosSetOnly) and (not IsDeviceSetOnly) and (not NoROMs) then
           begin
             if not FormMain.MemGameInfo.eIsMerged then
                AddEntry2('   Game Set', FormMain.MemGameInfo.eName+tmpString, 0)
             else
                AddEntry2('   Game Set', FormMain.MemGameInfo.eName+' (Merged)', 1); // 'Merged in parent set', 1); // for merged clone sets!!!
           end;
        if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) and (not NoROMs) then
           begin
             if FormMain.MemGameInfo.eParentGameROMsNoDump then
                AddEntry2('   Parent Set', FormMain.MemGameInfo.eClone+' (No Game ROMs)', 1)
             else
             if IsBiosSetOnly or (ZipParent = '') then // this is for G-NET and others with bios set + chd (no game set)
                AddEntry2('   Parent Set', FormMain.MemGameInfo.eClone+tmpString, 0)
             else
             if ZipParent <> '' then
                begin
                  AddEntry2('   Parent Set', ExtractFileNameW(ZipParent), 1);
                  if IsSetMissing then
                     GetFileContents(ZipParent);
                end;
           end;
        if not IsBiosGame then
           begin
             if IsSegaModel2 then
                FormMain.TempGameVars.eTitle:= '   Board ROMs'
             else
                FormMain.TempGameVars.eTitle:= '   Bios Set';
             if ZipBios <> '' then
                begin
                  AddEntry2(FormMain.TempGameVars.eTitle, ExtractFileNameW(ZipBios), 1);
                  if IsSetMissing then
                     GetFileContents(ZipBios);
                end
             else
                AddEntry2(FormMain.TempGameVars.eTitle, FormMain.TempGameVars.eBiosName+tmpString, 0);
           end;

        if TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets <> nil then
           begin
             for ImgIndex:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets.Count-1 do
             begin
               ZipDevice:= FormMain.SearchZIPFolder(TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex], 1);
               if ZipDevice <> '' then
                  begin
                    AddEntry2('   Device Set '+IntToStr(imgIndex+1), ExtractFileNameW(ZipDevice), 1);
                    if IsSetMissing then
                       GetFileContents(ZipDevice);
                  end
               else
                  AddEntry2('   Device Set '+IntToStr(imgIndex+1), TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets[ImgIndex]+tmpString, 0);
             end;
           end;

          if ReqSetName <> '' then
             begin
               if FormMain.MemGameInfo.eSoftwareName = 'pcecd' then
                  begin
                    // special handling ("pce" or "tg16" machines
                    if ReqSoftwareName = '' then
                    begin
                      ZipName:= FormMain.SearchZIPFolder(ReqSetName, FormMain.MemGameInfo.eSystemID, 'pce');
                      if ZipName = '' then
                         ZipName:= FormMain.SearchZIPFolder(ReqSetName, FormMain.MemGameInfo.eSystemID, 'tg16');
                    end;
                  end
               else
                  ZipName:= FormMain.SearchZIPFolder(ReqSetName, FormMain.MemGameInfo.eSystemID, ReqSoftwareName);

               if sFileName <> '' then // will check for "emuloader\arcade\mame_softwarelist_games\software.el"
               begin
                 if ZipName <> '' then
                    AddEntry2('   Require Set', ExtractFileNameW(ZipName), Ord(ZipName <> ''))
                 else
                    AddEntry2('   Require Set', ReqSetName, 0);
               end;
             end;
      end;
  end;

  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
end;

function TFormGameDetails.FileSizeStr(iFileSize: Int64; const CHDFileName: WideString = ''; iArcadeMediaType: Integer = -1): String;
var
  iSize: Int64;
begin
  Result:= '';
  if FormMain.MemGameInfo.eIsCustomGame then
     begin
       if iFileSize > 0 then
          Result:= FormMain.GetSizeType(iFileSize, (FormMain.MemGameInfo.eCustomMediaType = 1)); // file size string, "bits" for cartridges, "bytes" for everything else
     end
  else
     begin
       iSize:= 0;
       if iArcadeMediaType > 11 then
          begin
            // it's a CHD file; must get the file size, if file exists
            if CHDFileName <> '' then
               begin
                 iSize:= GetFileSizeW(CHDFileName);
                 if iSize < 1 then
                    Exit;
               end;
          end
       else
          iSize:= iFileSize;
       if iSize > 0 then
          Result:= FormMain.GetSizeType(iSize, (iArcadeMediaType in [3, 4, 5])); // ROM size
     end;
end;

procedure TFormGameDetails.FillROMsTree;
var
  sFile: String;
  Item: TEasyItem;
  romMissStatus: ShortInt;
  ValidCHD: Boolean;
  StatusImageIndex: Integer;

  function GetROM_ImageIndex: ShortInt;
  begin
    if IsSetMissing and (MissingSetZipContents.Count > 0) then
    begin
      if romMissStatus <> -1 then
         StatusImageIndex:= romMissStatus
      else
         StatusImageIndex:= 1; // missing ROM
    end
    else
    begin
      case romMissStatus of
        -1:
          begin
            if FormMain.MemGameInfo.eScanMode = 0 then
               begin
                 case FormMain.MemGameInfo.eGameSetStatus of
                   0: StatusImageIndex:= 0;
                   1: StatusImageIndex:= 0;
                   2: StatusImageIndex:= 1;
                 end;
               end
            else
               begin
                 // for quick scan and force available
                 case FormMain.MemGameInfo.eGameSetStatus of
                   0: StatusImageIndex:= 0; // all good
                   1: StatusImageIndex:= 1; // missing ROMs/CHDs
                   2: StatusImageIndex:= 1; // missing all files
                  end;
               end;
          end;
        0: StatusImageIndex:= 1; // file Missing
        1: StatusImageIndex:= 2; // CHD file found with bad SHA-1
      end;
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

  function GetROM_Status(const CRC32String, SHA1String: String; const ROMTag: ShortInt; IsCHDFile, IsBadDump, IsROMFromParentSet: Boolean; CHDHeaderVersion: Byte = 0): String;
  var
    StrCHD: String;
    iChecksum: String;
  begin
    Result:= '';
    StrCHD:= '';
    if FormMain.IsFileID_DeviceCHD(ROMTag) then
       StrCHD:= 'Dev '
    else
    if FormMain.IsFileID_BiosCHD(ROMTag) then
       StrCHD:= 'Bios ';

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

    if FormMain.IsFileID_DeviceROM(ROMTag) then
       begin
         if not FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification) then
            Result:= 'Device'; // device ROM
       end
   else
   if FormMain.IsFileID_BiosROM(ROMTag) then
      begin
        if not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification) then
           begin
             if FormMain.MemGameInfo.eSystemID = idSegaModel2 then
                begin
                  if FormMain.MemGameInfo.eName <> 'model2' then
                     Result:= 'Board ROM'; // bios ROM
                end
             else
                Result:= 'Bios'; // bios ROM
           end;
      end;

    if IsROMFromParentSet and
       (not FormMain.IsROM_Device(FormMain.MemGameInfo.eROMIdentification)) and
       (not FormMain.IsROM_Bios(FormMain.MemGameInfo.eROMIdentification)) then
       Result:= 'Parent'+Result;
    if (FormMain.MemGameInfo.eScanMode = 0) or (ROMTag >= 12) then
    begin
      if IsCHDFile and (StatusImageIndex <> 1) and (iChecksum <> '') then
         begin
           if CHDHeaderVersion > 0 then
              Result:= StrCHD+CheckEmptyVar(Result)+'v'+IntToStr(CHDHeaderVersion)
           else
              Result:= StrCHD+CheckEmptyVar(Result)+'v ?';
         end;

      case StatusImageIndex of
        0:
          begin
            if iChecksum <> '' then
               Result:= CheckEmptyVar(Result, True)+'Ok';
          end;
        1:
          begin
            if iChecksum <> '' then
               Result:= CheckEmptyVar(Result, True)+'Missing'
            else
               begin
                 if FormMain.MemGameInfo.eGameSetStatus in [1, 2] then
                    StatusImageIndex:= 0;
               end;
          end;
        2:
          begin
            // 'Bad Checksum'; // for CHDs only
            Result:= CheckEmptyVar(Result);
            if Length(iChecksum) > 32 then
               Result:= Result+'Bad SHA-1'
            else
               Result:= Result+'Bad MD5';
          end;
      end;
    end;
    if iChecksum = '' then
       Result:= CheckEmptyVar(Result, True)+'No Dump'
    else
    if IsBadDump then
       Result:= CheckEmptyVar(Result, True)+'Bad Dump';
  end;

  function AddROMs: Boolean;
  var
    LoopROMs, IcoIndexSubtract: Integer;
    isCHD: Boolean;
    tmpString, tmpString2, CHDFile, CHDInfo, CHDChecksum, LineStr: String;
    HeaderVerCHD: Byte;
    romName, romCRC32, romSHA1, romDeviceName: String; //, romParentName}: String;
    romSize: Int64;
    romTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file
    IsCRC32Collision, IsNewFileFormat, IsBadDump, IsParentROM: Boolean;
    iTempStr: String;
    FoundROM: Boolean;

    function AddMissCHDExtra(CHDFound: Boolean; ParentCHDName: String): Boolean;
    begin
      Result:= (not CHDFound) and (ParentCHDName <> '');
      if not Result then
         Exit;

      CHDInfo:= '(Parent: '+ParentCHDName+')';
      AddEntry2('', CHDInfo, 0, ParentCHDName);
    end;

  begin
    Result:= True;
    if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil then
       Exit;

    // add ROMs nodes
    ROMsListView.BeginUpdate;
    ROMsListView.Items.ReIndexDisable:= True;

    for LoopROMs:=0 to TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo.Count-1 do
    begin
      LineStr:= TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo[LoopROMs];
      IsNewFileFormat:= PosEx('<name>', LineStr) <> 0;
      if IsNewFileFormat then
         begin
           // FileID MediaType IsCRC32Collision IsBadDump IsParentROM <name>Filename/><crc>CRC32/><sha1>/SHA-1 or MD5/>
           //   12       3           4             5           6
           romTagIndex:= StrToInt(LineStr[1]+LineStr[2]);
           IsCHD:= FormMain.IsMediaTypeCHD(StrToInt(LineStr[3]), False); // the position 3 now holds the media type; 0 -> rom/cart/flop/cass; 1 -> CHDs
           IsCRC32Collision:= Boolean(StrToInt(LineStr[4]));
           if LineStr[5] <> '<' then // start of <name> tag on EL v8.2.2 "sysname.elrom" file format...
              IsBadDump:= Boolean(StrToInt(LineStr[5]))
           else
              IsBadDump:= False; // it's EL v8.2.2 old "sysname.elrom" file format

           if LineStr[6] <> '<' then
              IsParentROM:= Boolean(StrToInt(LineStr[6]))
           else
              IsParentROM:= False; // it's EL v8.2.2 old "sysname.elrom" file format

           FormMain.GetROMDetailsInfo(LineStr, FormMain.GameIsClone(FormMain.MemGameInfo.eClone), romName, romCRC32, romSHA1, tmpString2, romDeviceName);

           romSize:= 0;
           iTempStr:= SoftListGetEntryValue(LineStr, 'size');
           if iTempStr <> '' then
              romSize:= StrToInt(iTempStr);
         end;

      tmpString:= '';
      romMissStatus:= -1;

      if IsSetMissing and (MissingSetZipContents.Count > 0) then
         begin
           // get ROM state from zip contents (November 17, 2018)
           if not IsCHD then
           begin
             if (romCRC32 = '') and (romSHA1 = '') and (not IsBadDump) then
                romMissStatus:= 0 // ROMs "nodump" do not need further processing... 
             else
             if FormMain.IsFileID_GameROM(romTagIndex) or FormMain.IsFileID_DeviceROM(romTagIndex) or
                FormMain.IsFileID_GameCHD(romTagIndex) or FormMain.IsFileID_DeviceCHD(romTagIndex) then
                begin
                  FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eName+'='+romSHA1) <> -1;
                  if not FoundROM then
                     FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eName+'='+romCRC32) <> -1;

                  if (not FoundROM) and FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
                  begin
                    FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eClone+'='+romSHA1) <> -1;
                    if not FoundROM then
                       FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eClone+'='+romCRC32) <> -1;
                  end;

                  if (not FoundROM) and (romDeviceName <> '') then
                  begin
                    FoundROM:= MissingSetZipContents.IndexOf(romDeviceName+'='+romSHA1) <> -1;
                    if not FoundROM then
                       FoundROM:= MissingSetZipContents.IndexOf(romDeviceName+'='+romCRC32) <> -1;
                  end;

                  romMissStatus:= Ord(not FoundROM); // 0 -> ROM found, green icon; 1 -> ROM not found, gray icon
                end
             else
             if FormMain.IsFileID_BiosROM(romTagIndex) or FormMain.IsFileID_BiosCHD(romTagIndex) then
                begin
                  if FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName) then
                  begin
                    FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eBiosName+'='+romSHA1) <> -1;
                    if not FoundROM then
                       FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eBiosName+'='+romCRC32) <> -1;

                    romMissStatus:= Ord(not FoundROM);
                  end
                  else
                  begin
                    FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eName+'='+romSHA1) <> -1;
                    if not FoundROM then
                       FoundROM:= MissingSetZipContents.IndexOf(FormMain.MemGameInfo.eName+'='+romCRC32) <> -1;

                    romMissStatus:= Ord(not FoundROM);
                  end;
                end;
           end;
         end
      else // business as usual
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

            if IsNewFileFormat then
               tmpString:= romName; // tmpString holds the name of the CHD

            Item.Caption:= tmpString; // tmpString holds the name of the CHD

            case IsZiNcSystem of
              True : CHDFile:= FormMain.SearchZiNcCHDFolder(tmpString, FormMain.MemGameInfo.eName, ZiNcFilePath);
              False: CHDFile:= FormMain.SearchCHDFolder(tmpString, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
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
                 StatusImageIndex:= GetCHD_NewImageIndex(ValidCHD);
                 Item.Captions[1]:= CHDChecksum;
               end
            else
               begin
                 if romSHA1 <> '' then
                    StatusImageIndex:= 1 // file missing
                 else
                    begin
                      if FormMain.MemGameInfo.eGameSetStatus <> 2 then
                         StatusImageIndex:= 0 // file not found but it's a "no dump", tag it as available
                      else
                         StatusImageIndex:= 1;
                    end;
               end;

            if FormMain.IsFileID_GameCHD(romTagIndex) then
               AddEntry2('   CHD', CHDInfo, Ord(CHDFile <> ''), CHDInfo)
            else
            if FormMain.IsFileID_DeviceCHD(romTagIndex) then
               AddEntry2('   Device CHD', CHDInfo, Ord(CHDFile <> ''), CHDInfo)
            else
            if FormMain.IsFileID_BiosCHD(romTagIndex) then
               AddEntry2('   Bios CHD', CHDInfo, Ord(CHDFile <> ''), CHDInfo);

            AddMissCHDExtra(CHDFile <> '', tmpString2);

            if (tmpString2 <> '') and (tmpString2 <> tmpString) then
               begin
                 case IsZiNcSystem of
                   True : CHDFile:= FormMain.SearchZiNcCHDFolder(tmpString2, FormMain.MemGameInfo.eName, ZiNcFilePath);
                   False: CHDFile:= FormMain.SearchCHDFolder(tmpString2, FormMain.MemGameInfo.eName, FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eClone, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSoftwareName);
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
                 AddEntry2('   Parent CHD', tmpString2, Ord(CHDFile <> ''), tmpString2);
               end;
          end;
        False:
          begin
            if tmpString2 = '' then
               Item.Caption:= romName // ROM Name
            else
               Item.Caption:= tmpString2; // ROM Parent Name (alternate name, for clone sets)
          end;
      end;
      Item.Tag:= Ord(IsCHD); // 0 -> ROM; 1 -> CHD

      Item.Captions[1]:= romCRC32; // ROM CRC32 Checksum
      Item.Captions[2]:= romSHA1;  // ROM SHA-1 Checksum
      Item.Captions[3]:= FileSizeStr(romSize, CHDFile, romTagIndex); // ROM size
      Item.Captions[4]:= romDeviceName; // device name
      Item.Captions[5]:= GetROM_Status(romCRC32, romSHA1, romTagIndex, IsCHD, IsBadDump, IsParentROM, HeaderVerCHD); // ROM Status
      
      Item.StateImageIndex:= StatusImageIndex;
      if Is4KMode then
         IcoIndexSubtract:= 15 // bigger icon size, different index IL_MediaType 24x24
      else
         IcoIndexSubtract:= 0; // IL_LeftPanel 16x16
      case isCHD of
        True:
          begin
            case romTagIndex of
              12, 13, 14: Item.ImageIndex:= 22-IcoIndexSubtract; // HDD (also general CHD)
              15, 16, 17: Item.ImageIndex:= 20-IcoIndexSubtract; // CD
              18, 19, 20: Item.ImageIndex:= 21-IcoIndexSubtract; // Compact Flash Card
              21, 22, 23: Item.ImageIndex:= 23-IcoIndexSubtract; // Video Tape (VHS)
            end;
          end;
        False:
          begin
            if FormMain.MemGameInfo.eSoftwareName = 'vgmplay' then
               Item.ImageIndex:= 24-IcoIndexSubtract
            else
            case romTagIndex of
              00, 01, 02: Item.ImageIndex:= 15-IcoIndexSubtract; // ROM
              03, 04, 05: Item.ImageIndex:= 16-IcoIndexSubtract; // Cartridge
              06, 07, 08: Item.ImageIndex:= 17-IcoIndexSubtract; // Floppy Disk
              09, 10, 11: Item.ImageIndex:= 18-IcoIndexSubtract; // Cassette Tape
              12, 13, 14: Item.ImageIndex:= 22-IcoIndexSubtract; // HDD... is there any game ROMs with region="hdd" ???? not sure but better to have this here!!!
              15, 16, 17: Item.ImageIndex:= 20-IcoIndexSubtract; // CD (Demul (v5.8.2) have .bin files ROMs that are actually image CDs
              18, 19, 20: Item.ImageIndex:= 21-IcoIndexSubtract; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
              21, 22, 23: Item.ImageIndex:= 23-IcoIndexSubtract; // Video Tape (VHS) (but it's not a CHD file)...
            end;
          end;
      end;
    end;

    ROMsListView.Items.ReIndexDisable:= False;
    ROMsListView.EndUpdate;
  end;

begin
  if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo = nil then
     begin
       ROMsListView.Visible:= False;
       Exit;
     end;

  sFile:= FormMain.GetGamesFolderEL(Ord(FormMain.MemGameInfo.eSoftwareName <> ''), FormMain.MemGameInfo.eSystemID)+
          GetSystemFileName(FormMain.MemGameInfo.eSystemID, 3, FormMain.MemGameInfo.eSoftwareName);
  if FileExists(sFile) then
     missFile:= TMemIniFile.Create(sFile);

  AddROMs;
  FreeAndNil(missFile);
end;

procedure TFormGameDetails.FillEmuConGameFilesTree;
var
  Item: TEasyItem;
  StatusImageIndex: Integer;
  ZippedROMFile: TWideMemoryStream;

  IsZippedFile: Boolean;
  romCRC32, romSHA1: String;
  romName: WideString;
  romSize: Int64;
  //romTagIndex: Byte; // 0 -> game ROM; 1 -> device ROM; 2 -> bios ROM; 3 -> chd file

  ArchiveItemZip: TZFArchiveItem; // ZipForge (.zip)
  ArchiveItem7Zip: I7zInArchive;  // SevenZip (.7z)
  Loop7z: Integer;
  FileExtensionStr: String;

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

  function GenerateSHA1Checksum(MemoryStreamVar: TWideMemoryStream): String;
  var
    FileSHA1: String;
  begin
    Result:= '';
    if MemoryStreamVar.Size = 0 then
       Exit;
    FileSHA1:= '';
    try
      MemoryStreamVar.Position:= 0;
      FileSHA1:= GetSHA1_ValueMemoryStream(MemoryStreamVar);
    except
    end;

    if FileSHA1 <> '' then
       Result:= FileSHA1;
  end;

  function ELV_AddFile: Boolean;
  var
    IcoIndexSubtract: Integer;
  begin
    Result:= True;
    Item:= ROMsListView.Items.Add;
    StatusImageIndex:= 0; // GetROM_ImageIndex;
    Item.Caption:= romName; // ROM Name
    //eCustomMediaType: ShortInt; // 0 -> ROM; 1 -> Cartridge; 2 -> Disc Image; 3 -> Floppy; 4 -> Cassette; 5 -> Hard Disk Drive
    Item.Tag:= Ord(FormMain.IsMediaTypeCHD(FormMain.MemGameInfo.eCustomMediaType, True));
    Item.StateImageIndex:= 0; //StatusImageIndex;
    
    if Is4KMode then
       IcoIndexSubtract:= 15 // bigger icon size, different index IL_MediaType 24x24
    else
       IcoIndexSubtract:= 0; // IL_LeftPanel 16x16

    case FormMain.MemGameInfo.eCustomMediaType of
      00: Item.ImageIndex:= 15-IcoIndexSubtract; // ROM
      01: Item.ImageIndex:= 16-IcoIndexSubtract; // Cartridge
      03: Item.ImageIndex:= 17-IcoIndexSubtract; // Floppy Disk
      04: Item.ImageIndex:= 18-IcoIndexSubtract; // Cassette Tape
      05: Item.ImageIndex:= 22-IcoIndexSubtract; // HDD... is there any game ROMs with region="hdd" ???? not sure but better to have this here!!!
      02: Item.ImageIndex:= 20-IcoIndexSubtract; // Disc Image
      //18, 19, 20: Item.ImageIndex:= 21-IcoIndexSubtract; // Compact Flash Card (but it's not a CHD file)... "Konami System 573"
    end;

    Item.Captions[1]:= romCRC32; // ROM CRC32 Checksum
    Item.Captions[2]:= romSHA1;  // ROM SHA-1 Checksum
    Item.Captions[3]:= FileSizeStr(romSize); // FormMain.GetSizeType(romSize, (FormMain.MemGameInfo.eCustomMediaType = 1)); // file size string, "bits" for cartridges, "bytes" for everything else
    Item.Captions[4]:= '';   // device name (not used by EmuCon games)
    Item.Captions[5]:= 'Ok'; // GetROM_Status(romCRC32, romSHA1, romTagIndex, IsCHD, IsBadDump, IsParentROM, HeaderVerCHD); // ROM Status
  end;

begin
  if EmuConGameFileName = '' then
     begin
       ROMsListView.Visible:= False;
       Exit;
     end;

  IsZippedFile:= FormMain.IsZipFile(EmuConGameFileName);
  // add ROMs nodes
  ROMsListView.BeginUpdate;
  ROMsListView.Items.ReIndexDisable:= True;

  // romTagIndex
  // romName
  // romCRC32
  // romSHA1
  // romSize

  if IsZippedFile then
  begin
    if FileExistsW(EmuconGameFileName) then
    begin
      ZippedROMFile:= TWideMemoryStream.Create;
      FileExtensionStr:= ExtractFileExt(EmuConGameFileName);
      if FormMain.MemGameInfo.eIsUnicode then
         EmuConGameFileName:= GetShortFileNameW(EmuConGameFileName); // must convert to DOS name or ZipForge / SevenZip crash when trying to open a Unicode filename
      if SameText('.zip', FileExtensionStr) then
         begin
           with FormMain.ZipForge do
           begin
             FileName:= EmuConGameFileName;
             // Open existing archive file
             try
               OpenArchive(fmOpenRead or fmShareDenyNone);

               if FileCount > 0 then
                  begin
                    // Search text files stored inside the archive
                    if (FindFirst('*', ArchiveItemZip, faAnyFile-faDirectory)) then
                       begin
                         repeat
                           romName:= ArchiveItemZip.FileName;
                           romCRC32:= LowerCase(IntToHex(ArchiveItemZip.CRC, 8));
                           romSHA1:= '';
                           romSize:= ArchiveItemZip.UncompressedSize;
                           if romSize = -1 then
                              romSize:= 0;
                           ZippedROMFile.Clear;
                           if romSize < 33554435 then // 32MB max
                              ExtractToStream(ArchiveItemZip.FileName, ZippedROMFile);
                           romSHA1:= GenerateSHA1Checksum(ZippedROMFile);
                           ELV_AddFile;
                         until (not FindNext(ArchiveItemZip));
                       end;
                  end;
               CloseArchive;
               FileName:= '';
             except
               CloseArchive;
               FileName:= '';
             end;
           end;
         end
      else
      if SameText('.7z', FileExtensionStr) then
         begin
           ArchiveItem7Zip:= CreateInArchive(CLSID_CFormat7z);
           with ArchiveItem7Zip do
           begin
             try
               OpenFile(EmuConGameFileName);
               if NumberOfItems > 0 then
                  begin
                    // Search text files stored inside the archive
                    for Loop7z:= 0 to NumberOfItems-1 do
                    begin
                      if not ItemIsFolder[Loop7z] then
                         begin
                           romName:= ItemPath[Loop7z];
                           romCRC32:= LowerCase(IntToHex(ItemCRC[Loop7z], 8));
                           romSHA1:= '';
                           romSize:= ItemSize[Loop7z];
                           if romSize = -1 then
                              romSize:= 0;
                           ZippedROMFile.Clear;
                           if romSize < 33554435 then // 32MB max
                              ExtractItem(Loop7z, ZippedROMFile, False);
                           romSHA1:= GenerateSHA1Checksum(ZippedROMFile);
                           ELV_AddFile;
                         end;
                    end;
                  end;
               Close;
             except
               Close;
             end;
           end;
         end;
      FreeAndNil(ZippedROMFile);
    end;
  end
  else
  begin
    // game file is not zipped, will generate CRC32 checksum and maybe SHA-1 checksum (only if file size is less than 50 MegaBytes!)
    Screen.Cursor:= crHourGlass;
    romName:= FormMain.MemGameInfo.eName;
    romSize:= GetFileSizeW(EmuConGameFileName);
    if romSize = -1 then
       romSize:= 0;
    if romSize < 52428800 then
       begin
         // files larger than 50 MegaBytes takes way too long to generate checksums!!!
         romCRC32:= CalcFileCRC32(EmuConGameFileName);
         if romSize < 33554435 then
            romSHA1:= GetSHA1_Value(EmuConGameFileName);
       end;
    ELV_AddFile;
    Screen.Cursor:= crDefault;
  end;

  ROMsListView.Items.ReIndexDisable:= False;
  ROMsListView.EndUpdate;
end;

procedure TFormGameDetails.ROMsListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.StateImageIndex = 2 then
     begin
       if IsNightMode then
          ACanvas.Font.Color:= clrLightRed
       else
          ACanvas.Font.Color:= clRed;   // wrong checksum, CHDs only
     end
  else
  if Item.StateImageIndex = 1 then
     begin
       if IsNightMode then
          ACanvas.Font.Color:= clSilver
       else
          ACanvas.Font.Color:= clrMedDarkGray;
     end;

  case Position of
    1, 2:
      begin
        ACanvas.Font.Name:= 'Consolas';
      end;
    5:
     begin
       if Item.StateImageIndex = 1 then
          begin
            if IsNightMode then
               ACanvas.Font.Color:= clrLightRed
            else
               ACanvas.Font.Color:= clRed; // missing
          end;
     end;
  end;
end;

procedure TFormGameDetails.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FormMain.ClearListView(ROMsListView);
  // make sure everything is freed from RAM... just to be sure
  if Assigned(MissingSetZipContents) then
     FreeAndNil(MissingSetZipContents);

  if Assigned(CRC32CollisionFile) then
     FreeAndNil(CRC32CollisionFile);

  if Assigned(missFile) then
     FreeAndNil(missFile);
end;

procedure TFormGameDetails.ROMsListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if IsNightMode then
          FormMain.ELV_SetRibbonNightColors(Ord(Item.StateImageIndex = 2), ROMsListView)
       else
          FormMain.ELV_SetSelectRibbon(Ord(Item.StateImageIndex = 2), ROMsListView);
     end;
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
    0: Result:= FormMain.iCompare(gItem1.Caption, gItem2.Caption);         // file name
    1: Result:= FormMain.iCompare(gItem1.Captions[1], gItem2.Captions[1]); // CRC-32 checksum
    2: Result:= FormMain.iCompare(gItem1.Captions[2], gItem2.Captions[2]); // SHA-1 checksum
    3: Result:= FormMain.iCompare(gItem1.Captions[3], gItem2.Captions[3]); // file size
    4: Result:= FormMain.iCompare(gItem1.Captions[4], gItem2.Captions[4]); // device name
    5: Result:= FormMain.iCompare(gItem1.Captions[5], gItem2.Captions[5]); // file status
  end;
  // try to put CHD files at the bottom ????? what for ? some games have device ROMs after CHD files
  //if (gItem1.Tag = 0) and (gItem2.Tag = 1) then
  //   Result:= -1
  //else
  //if (gItem1.Tag = 1) and (gItem2.Tag = 0) then
  //   Result:= 1;
end;

procedure TFormGameDetails.FormShow(Sender: TObject);
var
  Loop: Integer;
  CHDsAllNoDump: Boolean;
  iROM, iSHA1: String;

  ROMsCount, BottomPos, HeaderSize, iROMsHeight: Integer;
  iNewWidth, iSize: Integer;
  iFormWidth: Integer;
begin
  Resize4K;
  if Is4KMode then
     begin
       LeftTextMaxSize:= 400;
       LeftPanelMinimumTextSize:= 250;
     end
  else
     begin
       LeftTextMaxSize:= 198;
       LeftPanelMinimumTextSize:= 137; // this should be 198 due to the driver status colored texts ?????
       // Checksum column size is 65, difference is 186...
     end;

  FormMain.ELV_ResetNormalColors(ROMsListView);
  iFormWidth:= FormGameDetails.ClientWidth;

  FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, SystemIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);
  FormMain.LoadGameIcon(GameIcon, FormMain.MemGameInfo.eIsCustomGame); // load game icon / emucon icon

  if FormMain.MemGameInfo.eIsCustomGame then
    begin
      LabelScanMode.Visible:= False;
      if Is4KMode then
         LabelEmulatorVersion.Width:= 1600
      else
         LabelEmulatorVersion.Width:= 875;
    end;

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;
  LabelEmulatorVersion.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;

  IsZiNcSystem:= FormMain.MemGameInfo.eSystemID = idZiNc;
  ZiNcFilePath:= '';
  LabelScanMode.Caption:= LabelScanMode.Hint+#13#10+aScanMode[FormMain.MemGameInfo.eScanMode];

  SetFormColors(FormGameDetails, TopBar, nil, LabelGameTitle, LabelEmulatorVersion, LabelScanMode, FormMain.MemGameInfo.eGameSetStatus, IsNightMode);
  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar); // change top bar color based on game set status
  if IsNightMode then
     begin
       SetLabelColors(LabelYear,      clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelYearValue, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.SetEasyListViewColors(ROMsListView, menu_background_color[1], clWhite, -1, clrBorderGroupBoxGrayBk);
       FormMain.SetEasyListViewHeaderColors(ROMsListView, True, False, Is4KMode, True);
       FormMain.ELV_SetRibbonNightColors(0, ROMsListView, True);
       FormMain.SetWin10DarkScrollBar(ROMsListView);
     end;
  
  FormMain.CheckSevenZip(FormMain.MemGameInfo.eSystemID);

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
                // 12 and higher = CHD files
                if StrToInt(iROM[1]+iROM[2]) >= 12 then
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
          end;
     end;
     
  EmuConGameFileName:= '';

  if TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil then
     begin
       if Assigned(TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets) then
       if TEasyGameInfo(FormMain.SelectedEasyItem).eDeviceSets.Count > 1 then
          ROMsListView.Header.Columns[4].Visible:= True;
     end;

  IsSetMissing:= False;
  if not FormMain.MemGameInfo.eIsCustomGame then
     begin
       IsSetMissing:= (FormMain.MemGameInfo.eSystemID <> idDaphne) and (TEasyGameInfo(FormMain.SelectedEasyItem).eROMInfo <> nil) and
                      FormMain.IsROM_Miss(FormMain.MemGameInfo.eROMIdentification) and (not FormMain.MemGameInfo.eROMsAllNoDump) and
                      (not FormMain.IsROM_HaveMissROMs(FormMain.MemGameInfo.eGameSetStatus)) and //(not FormMain.MemGameInfo.eROMsAllNoDump) and
                      //(not FormMain.IsROM_Have(FormMain.MemGameInfo.eGameSetStatus)) and
                      (FormMain.MemGameInfo.eSoftwareName = '');

       if IsSetMissing then
       if FileExists(FormMain.GetGamesFolderEL(0)+GetSystemFileName(FormMain.MemGameInfo.eSystemID, 9)) then
          begin
            CRC32CollisionFile:= TStringList.Create;
            CRC32CollisionFile.LoadFromFile(FormMain.GetGamesFolderEL(0)+GetSystemFileName(FormMain.MemGameInfo.eSystemID, 9));
          end;
     end;
  ROMsListView.Width:= 2500;
  FillGameTree;
  Application.ProcessMessages;
  case FormMain.MemGameInfo.eIsCustomGame of
    True : FillEmuConGameFilesTree;
    False: FillROMsTree;
  end;

  if Is4KMode then
     iSize:= 10
  else
     iSize:= 7;
  if IsSetMissing then
     begin
       FreeAndNil(CRC32CollisionFile);
       FreeAndNil(MissingSetZipContents);
     end;

  if LeftPanelSize < LeftTextMaxSize then // 198
     begin
       if (LeftPanelMinimumTextSize > 0) and (LeftPanelSize < LeftPanelMinimumTextSize) then
          LeftPanelSize:= LeftPanelMinimumTextSize;

       ROMsListView.Left:= LabelYearValue.Left+LeftPanelSize+6; // 6 for the border
       FormGameDetails.ClientWidth:= ROMsListView.Left+ROMsListView.Width+iSize; // iSize = 7 for the border (10 for 4K mode)
     end;

  BottomPos:= LeftPanelLastText+LeftPanelLastTextHeight;

  HeaderSize:= ROMsListView.Header.Height+Ord(ROMsListView.BorderHeaderFix)+ROMsListView.PaintInfoColumn.Border+4;// 2+4; // +4 for the bottom border ?
  ROMsCount:= ROMsListView.Groups.ItemCount;
  iROMsHeight:= HeaderSize+(ROMsCount*ROMsListView.CellSizes.Report.Height)+ROMsListView.PaintInfoColumn.Border; // + header border = 2 ???
  if IsNightMode then
     Inc(iROMsHeight); // to prevent mouse wheel scroll when scroll bars are not needed
     
  if BottomPos < (iROMsHeight+ROMsListView.Top) then
     BottomPos:= iROMsHeight+ROMsListView.Top;

  if BottomPos > (Screen.Height-100) then
     BottomPos:= (Screen.Height-100); // prevent form height from being larger than screen height

  ROMsListView.Height:= BottomPos-ROMsListView.Top;

  Inc(BottomPos, 3); // add 4 pixels to the bottom of "FrameROMsListView"
  ROMsListView.BeginUpdate;

  if ROMsListView.Header.Columns[3].Visible then
     begin
       if Is4KMode then
          iNewWidth:= 50
       else
          iNewWidth:= 35;

       ROMsListView.Header.Columns[3].AutoSizeToFit; // file size column
       if ROMsListView.Header.Columns[3].Width < iNewWidth then
          ROMsListView.Header.Columns[3].Width:= iNewWidth;
     end;

  if ROMsListView.Header.Columns[4].Visible then
     begin
       if Is4KMode then
          iNewWidth:= 75
       else
          iNewWidth:= 50;

       ROMsListView.Header.Columns[4].AutoSizeToFit; // device column
       if ROMsListView.Header.Columns[4].Width < iNewWidth then
          ROMsListView.Header.Columns[4].Width:= iNewWidth;
     end;

  if Is4KMode then
     iNewWidth:= 75
  else
     iNewWidth:= 50;

  ROMsListView.Header.Columns[5].AutoSizeToFit; // status column
  if ROMsListView.Header.Columns[5].Width < iNewWidth then
     ROMsListView.Header.Columns[5].Width:= iNewWidth;

  iNewWidth:= 0;
  for Loop:=0 to ROMsListView.Header.Columns.Count-1 do
  begin
    if ROMsListView.Header.Columns[Loop].Visible then
       Inc(iNewWidth, ROMsListView.Header.Columns[Loop].Width);
  end;
  iNewWidth:= iNewWidth+ROMsListView.PaintInfoColumn.Border;

  if iNewWidth <> ROMsListView.Width then
     begin
       ROMsListView.Width:= iNewWidth;
       FormGameDetails.ClientWidth:= ROMsListView.Left+ROMsListView.Width+iSize; //7;

       LabelGameTitle.Width:= TopBar.Width-LabelGameTitle.Left-iSize; //7;
       LabelScanMode.Left:= TopBar.Width-(LabelScanMode.Width+iSize); //7);
     end;

  if ROMsListView.Groups.ItemCount > 0 then
     ROMsListView.Header.Columns[0].Caption:= 'Name'+Format('%25s', [IntToStr(ROMsListView.Groups.VisibleItemCount)+' files']);

  if ROMsListView.Scrollbars.VertBarVisible then
     ROMsListView.Header.Columns[0].Width:= ROMsListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);

  ROMsListView.EndUpdate;

  if Is4KMode then
     Inc(BottomPos, 7)  // add 7 pixels to make the 10 pixels border
  else
     Inc(BottomPos, 4); // add 4 pixels to make the  7 pixels border

  if FormGameDetails.ClientHeight <> BottomPos then
     FormGameDetails.ClientHeight:= BottomPos;

  CallCenterWindow(FormGameDetails);
end;


end.

