unit uAuditGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, IniFiles, StdCtrls, Menus, CommCtrl;




{type
  pGameDetails = ^TGameDetails;
  TGameDetails = record
    GameIndex: Integer;
    ImageIndex: Integer;
    Caption: String;
    CRC: String;
    Size: Integer;
  end;}

type
  TFormAudit = class(TForm)
    ImageListResults: TImageList;
    PopupAuditGames: TPopupMenu;
    PopupAuditGameAgain: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    PopupShowOnlyBadGames: TMenuItem;
    N1: TMenuItem;
    PopupShowGamesDetails: TMenuItem;
    PopupHideGamesDetails: TMenuItem;
    SaveAuditDialog: TSaveDialog;
    PopupSaveResultstoHTMLFile: TMenuItem;
    PopupSaveBadGamestoHTMLFile: TMenuItem;
    LabelGameDescription: TLabel;
    LabelMergedMasterGame: TLabel;
    LabelAuditedGames: TLabel;
    LabelAudited: TLabel;
    LabelGood: TLabel;
    LabelGoodAuditedGames: TLabel;
    LabelMissingSets: TLabel;
    LabelMissingGameFiles: TLabel;
    LabelErrors: TLabel;
    LabelBadAuditedGames: TLabel;
    ButtonClose: TButton;
    ButtonCancel: TButton;
    AuditROMsTree: TTreeView;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure PopupShowGamesDetailsClick(Sender: TObject);
    procedure PopupHideGamesDetailsClick(Sender: TObject);
    procedure PopupShowOnlyBadGamesClick(Sender: TObject);
    procedure PopupAuditGameAgainClick(Sender: TObject);
    procedure PopupSaveResultstoHTMLFileClick(Sender: TObject);
    procedure PopupSaveBadGamestoHTMLFileClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AuditROMsTreeCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure AuditROMsTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    {procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);}
  private
    ListROMName, ListROMSize, ListROMCRC: String;
    ROMsList: THashedStringList;
    ROMStatus: Integer;
    GameOk, Auditing: Boolean;
    aBiosDriver: TMemIniFile;
    function  LoadToolbarIcons: Boolean;

    function  TestROMSizeCRC(ListSize, ZIPName, ZIPSize, ListCRC, ZIPCRC: String): String;
    function  MountHTMLLine(StringData: String): String;
    function  MountGameLine(NodeLevel: Integer; BitmapFileName: String; IconIndex: Integer; NodeText: String): String;

    // bold nodes functions
    procedure SetNodeState(node : TTreeNode; State : Integer);
    function  GetNodeState(node : TTreeNode): Integer;

    procedure Bold(node : TTreeNode);
    procedure UnBold(node : TTreeNode);
    function IsBold(node : TTreeNode) : Boolean;
    procedure ToggleBold(node : TTreeNode);


    { Private declarations }
  public
    //Games: array of TGameDetails;
    ROMsName, ROMsSize, ROMsCRC: THashedStringList;
    GameName, ParentGameName, LabelStatusFormat: String;
    TotalGames, AvailableGames, UnavailableGames, GoodGames, BadGames, CurrentGame, AuditMode: Integer;
    function  CreateMD5Checksum(DiskFileName, DiskMD5: String; out RealMD5Value: String): Boolean;
    function  MountFilesList(GameName: String): String;
    function  AuditGame(GameName, ParentGameName: String; RenameFiles: Boolean): Boolean;
    procedure Audit(FixFileNames: Boolean);
    { Public declarations }
  end;

var
  FormAudit: TFormAudit;

implementation

uses uMain, uStatus, uCommon, uFilesUtil;

{$R *.DFM}

procedure TFormAudit.Bold(node : TTreeNode);
begin
  SetNodeState(node, TVIS_BOLD);
end;

procedure TFormAudit.UnBold(node : TTreeNode);
begin
  SetNodeState(node, 0);
end;

function TFormAudit.IsBold(node : TTreeNode) : Boolean;
begin
  Result := ((GetNodeState(node) and TVIS_BOLD) <> 0);
end;

procedure TFormAudit.ToggleBold(node : TTreeNode);
begin
 if IsBold(node) then
    UnBold(node)
 else
    Bold(node);
end;

procedure TFormAudit.SetNodeState(node : TTreeNode; State : Integer);
var
  tvi  : TTVItem;
begin
  FillChar(tvi, Sizeof(tvi), 0);
  tvi.hItem := node.ItemID;
  tvi.mask := TVIF_STATE;
  tvi.stateMask := TVIS_BOLD;
  tvi.state := State;
  TreeView_SetItem(node.Handle, tvi);
(********************************************************************************)
(*  Using OnChange causes an access violation error when no OnChange event      *)
(*  handler is specified within the program. Using the TCustomTreeView.Change   *)
(*  procedure instead resolves this problem.                                    *)
(********************************************************************************)
//OnChange(Self,Node);
  //Change(Node);
end;

function TFormAudit.GetNodeState(node : TTreeNode): Integer;
var
  tvi  : TTVItem;
begin
  FillChar(tvi, Sizeof(tvi), 0);
  tvi.hItem := node.ItemID;
  tvi.mask := TVIF_STATE;
  tvi.stateMask := TVIS_BOLD;
  TreeView_GetItem(Handle, tvi);
  Result := tvi.state;
end;

// procedures ---------------------------
function TFormAudit.LoadToolbarIcons: Boolean;
var
  Loop: ShortInt;
begin
  Result:= True;
  for Loop:=0 to 17 do
  begin
    if not FileExists(FormMain.FrontendPath+'resources\images\toolbars\Audit\'+IntToStr(Loop)+'.ico') then
       Result:= False;
  end;
  if ((not FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\77.ico')) and
      (not FileExists(FormMain.FrontendPath+'resources\images\toolbars\Main\toolbar\29.ico'))) then
     Result:= False;

  if Result then
     begin
       if ImageListResults.Count > 0 then
          ImageListResults.Clear;
       for Loop:= 0 to 17 do
       begin
         FormMain.AddDefaultIcons('Audit\'+IntToStr(Loop)+'.ico', ImageListResults, 1, False);
       end;
       FormMain.AddDefaultIcons('Main\toolbar\77.ico', ImageListResults, 1, False);
       FormMain.AddDefaultIcons('Main\toolbar\29.ico', ImageListResults, 1, False);
     end;
end;

function TFormAudit.MountFilesList(GameName: String): String;
var
  Loop, Loop2: Integer;
  GameType: String;
begin
  Result:= '';
  ROMsName.BeginUpdate;
  ROMsSize.BeginUpdate;
  ROMsCRC.BeginUpdate;
  ROMsName.Clear;
  ROMsSize.Clear;
  ROMsCRC.Clear;
  case aBiosDriver.ValueExists('bios', GameName) of
    True : GameType:= 'bios ';
    False: GameType:= 'game ';
  end;

  for Loop:=0 to ROMsList.Count -1 do
  begin
    if ROMsList[Loop] = GameType+GameName then
       begin
         for Loop2:=(Loop+1) to ROMsList.Count -1 do
         begin
           if Pos('cloneof', ROMsList[Loop2]) > 0 then
              Result:= Copy(ROMsList[Loop2],9, Length(ROMsList[Loop2]))
           else
           if Pos(' ', ROMsList[Loop2]) > 0 then
              Break
           else
              FormMain.GetGameROMs(ROMsList[Loop2], True);
         end;
         Break;
       end;
  end;
  ROMsName.EndUpdate;
  ROMsSize.EndUpdate;
  ROMsCRC.EndUpdate;
end;

function TFormAudit.CreateMD5Checksum(DiskFileName, DiskMD5: String; out RealMD5Value: String): Boolean;
var
  TestFile: TFileStream;
  FileName, MD5ChecksumFound: String;
  Buffer: array [0..15] of Byte;
  Loop: ShortInt;

const
  HexTable: String = '0123456789ABCDEF';

  function ByteToHex(Value: Byte): String;
  var
    zwVal: Byte;
  begin
    zwVal := (Value and $0F); //first mask (Lo) Byte of Value
    Result:= HexTable[zwVal + 1]; //from HexTable to Result
    zwVal := (Value and $F0) shr 4; //second mask (Hi) Byte of Value and 4Bits to the right shift
    Result:= HexTable[zwVal + 1] + Result; //add from HexTable to Result
  end;

begin
  FileName:= FormMain.SearchCHDFolder(GameName, DiskFilename);
  Result:= (FileName <> 'Not Found');
  if Result then
     begin
       TestFile:= TFileStream.Create(FileName, (fmOpenRead or fmShareDenyNone));
       TestFile.Seek(44, soFromBeginning); // go to byte 44 (begining of MD5 checksum on .chd files)
       TestFile.ReadBuffer(Buffer, 16); // read 16 bytes (size of MD5 checksum on .chd files)
       FreeAndNil(TestFile);
       MD5ChecksumFound:= '';
       for loop:=0 to 15 do
         MD5ChecksumFound:= MD5ChecksumFound+LowerCase(ByteToHex(Buffer[Loop])); // put all hexa values together

       RealMD5Value:= MD5ChecksumFound;
       Result:= (MD5ChecksumFound = DiskMD5);
     end;
end;

function TFormAudit.TestROMSizeCRC(ListSize, ZIPName, ZIPSize, ListCRC, ZIPCRC: String): String;
var
  SizeOk, CRCOk, DiskImage: Boolean;
  SumCRC: String;
  CRCStatus: Integer;
begin
  ROMStatus:= 12;
  DiskImage:= (Length(ListCRC) = 32);
  case DiskImage of
    True : SizeOk:= True;
    False: SizeOk:= ZIPSize = ListSize;
  end;

  // Delete zeroes from begining of CRC number
  if not DiskImage then
     begin
       if Length(ZIPCRC) < 8 then
          Delete(ListCRC,1 , (8 - Length(ZIPCRC)));
     end;

  case DiskImage of
    False: CRCOk:= ZIPCRC = ListCRC;
    True : CRCOk:= CreateMD5Checksum(ZIPName, ListCRC, ZIPCRC);
  end;

  if ((ListCRC = '00000000') or (ListCRC = '0000000') or (ListCRC = '000000') or (ListCRC = '00000000000000000000000000000000')) then
     CRCStatus:= 1 // No Good Dump Known
  else
     begin
       case DiskImage of
         True:
           begin
             if not CRCOk then
               CRCStatus:= 0; // MD5 is wrong
           end;
         False:
           begin
             SumCRC:= LowerCase(Format('%x', [(StrToInt('$'+ZIPCRC)) + StrToInt(('$'+ListCRC))]));
             if ((SumCRC = 'ffffffff') or (SumCRC = 'fffffff') or (SumCRC = 'ffffff')) then
                CRCStatus:= 2 // ROM Need Redump
             else
                if not CRCOk then
                   CRCStatus:= 0; // CRC is wrong
           end;
       end;
     end;

  case DiskImage of
    False: Result:= Format('%12s  %10s  %8s', [ZIPName, ZIPSize, ZIPCRC]);
    True : Result:= Format('%12s  %10s  %32s', [ZIPName, ListSize, ZIPCRC]);
  end;

  case SizeOk of
    False:
      begin
        Result:= Result+Format('  [correct size: %10s]', [ListSize]);
        ROMStatus:= 6;
        GameOk:= False;
      end;
    True: ROMStatus:= 0;
  end;

  case CRCStatus of
    0: begin
         case DiskImage of
           False: Result:= Result+Format('  [correct crc: %8s]', [ListCRC]);
           True:
             begin
               if FormMain.MenuGamesAudit.Tag = 1 then
                  Result:= Result+Format('  [correct md5: %32s]', [ListCRC]);
             end;
         end;
         ROMStatus:= 6;
         GameOk:= False;
       end;
    1: begin
         Result:= Result+'  [No Good Dump Known]';
         case CRCOk of
           True:
             begin
               if ROMStatus <> 6 then
                  ROMStatus:= 2
               else
                  ROMStatus:= 8;
             end;
           False: ROMStatus:= 8;
         end;
       end;
    2: begin
         Result:= Result+'  [ROM Needs Redump]';
         case CRCOk of
           True:
             begin
               if ROMStatus <> 6 then
                  ROMStatus:= 4
               else
                  ROMStatus:= 10;
             end;
           False: ROMStatus:= 10;
         end;
       end;
  end;
end;

function TFormAudit.AuditGame(GameName, ParentGameName: String; RenameFiles: Boolean): Boolean;
var
  Loop, ROMIndex, ROMsCount, NotFoundROMsCount, CRCNumber: Integer;
  FileNotFound, ParentFileNotFound, OriginalGame, DiskImage, ZipOK, ParentZipOk: Boolean;
  ZIPFileName, ParentZIPFileName, ResultLine, FixedCRCHex, ROMsNodeEndText: String;
  ROMsNode: TTreeNode;

  function GetFixedCRC: String;
  begin
    case DiskImage of
      False:
        begin
          CRCNumber:= StrToInt('$'+ListROMCRC);
          FixedCRCHex:= LowerCase(Format('%x', [CRCNumber]));
        end;
      True: FixedCRCHex:= LowerCase(ListROMCRC);
    end;
  end;

  function RenameROM(FileToCheck: String; IsParent: Boolean): Boolean;
  begin
    if RenameFiles and (FileToCheck <> 'Not Found') then
       begin
         //ShowMessage('will rename file: '+FormMain.ListROMsNameFullPath[ROMIndex]+#13+'to: '+ROMsName[Loop]+#13+'of file: '+FileToCheck);
         case IsParent of
           False:
             begin
               if Pos('\', FormMain.ListROMsNameFullPath[ROMIndex]) <> 0 then
                  FormMain.RenameFileInsideZip(FileToCheck, FormMain.ListROMsNameFullPath[ROMIndex], ExtractFilePath(FormMain.ListROMsNameFullPath[ROMIndex])+ROMsName[Loop])
               else
                  FormMain.RenameFileInsideZip(FileToCheck, FormMain.ListROMsNameFullPath[ROMIndex], ROMsName[Loop]);
             end;
           True:
             begin

             end;
         end;
       end;
  end;

  procedure ScanCHDFileMD5;
  var
    CHDFileName: String;
  begin
    CHDFileName:= FormMain.SearchCHDFolder(GameName, ROMsName[Loop]);
    if CHDFileName <> 'Not Found' then
       begin
         // I need to read chd_md5.ini file for the full file MD5 checksum
         if ListROMSize = '0' then
            ListROMSize:= IntToStr(GetFileSize(CHDFileName));
         ResultLine:= TestROMSizeCRC(ListROMSize, ROMsName[Loop], ROMsSize[Loop], ListROMCRC, '-create');
         Inc(ROMsCount);
       end
    else
       begin
         ResultLine:= Format('%12s  %10s  %32s  [not found]', [ROMsName[Loop], ListROMSize, ROMsCRC[Loop]]);
         ROMStatus:= 12;
         GameOk:= False;
         Inc(NotFoundROMsCount);
       end;
  end;

begin
  Application.ProcessMessages;
  OriginalGame:= not ((ParentGameName <> '') and (ParentGameName <> GameName));
  ZIPFileName:= FormMain.SearchZIPFolder(GameName);
  FileNotFound:= True;
  ParentFileNotFound:= True;
  Result:= False;
  ROMsCount:= 0;
  NotFoundROMsCount:= 0;
  GameOk:= True;
  LabelMergedMasterGame.Caption:= '';
  //ROMStatus:=12;

  if Assigned(FormMain.ListROMsName) then
     FormMain.ListROMsName.Clear;
  if Assigned(FormMain.ListROMsSize) then
     FormMain.ListROMsSize.Clear;
  if Assigned(FormMain.ListROMsCRC) then
     FormMain.ListROMsCRC.Clear;

  if Assigned(FormMain.ParentListROMsName) then
     FormMain.ParentListROMsName.Clear;
  if Assigned(FormMain.ParentListROMsSize) then
     FormMain.ParentListROMsSize.Clear;
  if Assigned(FormMain.ParentListROMsCRC) then
     FormMain.ParentListROMsCRC.Clear;

  if Assigned(FormMain.ListROMsNameFullPath) then
     FormMain.ListROMsNameFullPath.Clear;

  if Assigned(FormMain.ParentListROMsNameFullPath) then
     FormMain.ParentListROMsNameFullPath.Clear;

  ZipOk:= True;
  ParentZipOk:= True;

  //with VST do
  //  RootNodeCount:= RootNodeCount+TotalGames;

  if ZIPFileName <> 'Not Found' then
     begin
        ZipOk:= FormMain.GetContents(ZIPFileName, True, False);
        FileNotFound:= False;
        if not OriginalGame then
           begin
             ParentZIPFileName:= FormMain.SearchZIPFolder(ParentGameName);
             if ParentZIPFileName <> 'Not Found' then
                begin
                   ParentFileNotFound:= False;
                   ParentZipOk:= FormMain.GetContents(ParentZIPFileName, False, True);
                   OriginalGame:= False;
                end;
           end;
     end
  else
     begin
       case OriginalGame of
         False:
           begin
             ParentZIPFileName:= FormMain.SearchZIPFolder(ParentGameName);
             if ParentZIPFileName <> 'Not Found' then
                begin
                   ParentFileNotFound:= False;
                   ParentZipOk:= FormMain.GetContents(ParentZIPFileName, True, True); // Original Line
                   OriginalGame:= False;
                end
             else
                begin
                  GameOk:= False;
                  Inc(UnavailableGames);
                end;
           end;
         True:
           begin
             GameOk:= False;
             Inc(UnavailableGames);
           end;
       end;
     end;

  case OriginalGame of
    True:
      begin
        ROMsNode:= AuditROMsTree.Items.Add(nil, GameName); // Add a root node
        case FileNotFound of
          True : ROMsNodeEndText:= ' - ['+GameName+'.zip not found]';
          False:
            begin
              case ZipOK of
                True : ROMsNodeEndText:= '';
                False: ROMsNodeEndText:= ' - ['+GameName+'.zip damaged]';
              end;
            end;
        end;
      end;
    False:
      begin
        case ParentFileNotFound of
          True:
            begin
              ROMsNode:= AuditROMsTree.Items.Add(nil, GameName+' ('+ParentGameName+')'); // Add a root node
              case FileNotFound of
                True : ROMsNodeEndText:= ' - ['+GameName+'.zip and '+ParentGameName+'.zip not found]';
                False:
                  begin
                    case ZipOK of
                      True : ROMsNodeEndText:= ' - ['+ParentGameName+'.zip not found]';
                      False: ROMsNodeEndText:= ' - ['+GameName+'.zip damaged and '+ParentGameName+'.zip not found]';
                    end;
                  end;
              end;
            end;
          False:
            begin
              ROMsNode:= AuditROMsTree.Items.Add(nil, GameName+' ('+ParentGameName+')'); // Add a root node
              case FileNotFound of
                True:
                  begin
                    case ParentZipOk of
                      True : ROMsNodeEndText:= ' - ['+GameName+'.zip not found]';
                      False: ROMsNodeEndText:= ' - ['+GameName+'.zip not found and '+ParentGameName+'.zip damaged]';
                    end;
                  end;
                False:
                  begin
                    if ZipOk and ParentZipOk then
                       ROMsNodeEndText:= ''
                    else
                    if (not ZipOk) and ParentZipOk then
                       ROMsNodeEndText:= ' - ['+GameName+'.zip damaged]'
                    else
                    if ZipOk and (not ParentZipOk) then
                       ROMsNodeEndText:= ' - ['+ParentGameName+'.zip damaged]'
                    else
                    if (not ZipOk) and (not ParentZipOk) then
                       ROMsNodeEndTExt:= ' - ['+GameName+'.zip and '+ParentGameName+'.zip damaged]';
                  end;
              end;
            end;
        end;
      end;
  end;

  Bold(ROMsNode);
  for Loop:=0 to ROMsName.Count -1 do
  begin
    {with VST do
    begin
      if Assigned(FocusedNode) then
        begin
          Count := StrToInt(Edit1.Text);
          ChildCount[FocusedNode]:= ChildCount[FocusedNode]+1;
          Expanded[FocusedNode]:= True;
          InvalidateToBottom(FocusedNode);
        end;
    end;}

    ROMStatus:= 12;
    if ((not FileNotFound) or (not ParentFileNotFound) or (LowerCase(ExtractFileExt(ROMsName[Loop])) = '.chd')) then
       begin
         ListROMName:= ROMsName[Loop];
         ListROMSize:= ROMsSize[Loop];
         ListROMCRC:= ROMsCRC[Loop];
         DiskImage:= (Length(ListROMCRC) = 32);
         case OriginalGame of
           True:
             begin
               ROMIndex:= FormMain.ListROMsName.IndexOf(ROMsName[Loop]);
               if ROMIndex <> -1 then
                  begin
                    // ROM Name is found will test Size and CRC
                    ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex]);
                    Inc(ROMsCount);
                  end
               else
                  begin
                    // will try to search for the correct CRC number
                    // ListROMCRC - ROMs.dat
                    // FormMain.ListROMsCRC - .zip file
                    if ((ListROMCRC <> '00000000') and (ListROMCRC <> '0000000') and
                        (ListROMCRC <> '000000') and (ListROMCRC <> '00000000000000000000000000000000')) then
                       begin
                         GetFixedCRC;
                         case DiskImage of
                           False:
                             begin
                               ROMIndex:= FormMain.ListROMsCRC.IndexOf(FixedCRCHex);
                                if ROMIndex > -1 then
                                   begin
                                     case RenameROM(ZIPFileName, False) of
                                       True:
                                         begin
                                           ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex])
                                                                       +'  [renamed from '+FormMain.ListROMsName[ROMIndex]+' to '+ROMsName[Loop]+']';
                                         end;
                                       False:
                                         begin
                                           ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex])
                                                                       +'  [correct name: '+ROMsName[Loop]+']';
                                         end;
                                     end;

                                     {if RenameFiles and (ZIPFileName <> 'Not Found') then
                                        begin
                                          ShowMessage('will rename file: '+FormMain.ListROMsNameFullPath[ROMIndex]+#13+'to: '+ROMsName[Loop]+#13+'of file: '+ZIPFileName);
                                          if Pos('\', FormMain.ListROMsNameFullPath[ROMIndex]) <> 0 then
                                             FormMain.RenameFileInsideZip(ZIPFileName, FormMain.ListROMsNameFullPath[ROMIndex], ExtractFilePath(FormMain.ListROMsNameFullPath[ROMIndex])+ROMsName[Loop])
                                          else
                                             FormMain.RenameFileInsideZip(ZIPFileName, FormMain.ListROMsNameFullPath[ROMIndex], ROMsName[Loop]);
                                        end;}
                                     Inc(ROMsCount);
                                     // found crc number
                                   end
                                else
                                   begin
                                     ResultLine:= Format('%12s  %10s  %8s  [not found]', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                                     ROMStatus:= 12;
                                     GameOk:= False;
                                     Inc(NotFoundROMsCount);
                                   end;
                             end;
                           True: ScanCHDFileMD5;
                         end;
                       end
                    else
                       begin
                         case DiskImage of
                           False: ResultLine:= Format('%12s  %10s  %8s', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                           True : ResultLine:= Format('%12s  %10s  %32s', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                         end;
                         Inc(ROMsCount);
                       end;
                  end;
             end;
           False:
             begin
               ROMIndex:= FormMain.ListROMsName.IndexOf(ROMsName[Loop]);
               if ROMIndex <> -1 then
                  begin
                    // ROM Name is found will test Size and CRC
                    ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex]);
                    Inc(ROMsCount);
                  end
               else
                  begin
                    // fixes... file needs to be search in the parent game first,
                    // or the CRC searching will not audit correctly
                    ROMIndex:= FormMain.ParentListROMsName.IndexOf(ROMsName[Loop]);
                    if ROMIndex <> -1 then
                       begin
                         // ROM Name is found will test Size and CRC
                         ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ParentListROMsName[ROMIndex], FormMain.ParentListROMsSize[ROMIndex], ListROMCRC, FormMain.ParentListROMsCRC[ROMIndex]);
                         Inc(ROMsCount);
                         case ROMStatus of
                            0: ROMStatus:= 1;
                            2: ROMStatus:= 3;
                            4: ROMStatus:= 5;
                            6: ROMStatus:= 7;
                            8: ROMStatus:= 9;
                           10: ROMStatus:= 11;
                         end;
                       end
                    else
                       begin
                         // will search for the crc number
                         if ((ListROMCRC <> '00000000') and (ListROMCRC <> '0000000') and
                             (ListROMCRC <> '000000') and (ListROMCRC <> '00000000000000000000000000000000')) then
                            begin
                              GetFixedCRC;
                              case DiskImage of
                                False:
                                  begin
                                    ROMIndex:= FormMain.ListROMsCRC.IndexOf(FixedCRCHex);
                                    if ROMIndex > -1 then
                                       begin
                                         case RenameROM(ZIPFileName, False) of
                                           True:
                                             begin
                                               ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex])
                                                                           +'  [renamed from '+FormMain.ListROMsName[ROMIndex]+' to '+ROMsName[Loop]+']';
                                             end;
                                           False:
                                             begin
                                               ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ListROMsName[ROMIndex], FormMain.ListROMsSize[ROMIndex], ListROMCRC, FormMain.ListROMsCRC[ROMIndex])
                                                                           +'  [correct name: '+ROMsName[Loop]+']';
                                             end;
                                         end;

                                         {if RenameFiles and (ZIPFileName <> 'Not Found')then
                                            begin
                                              ShowMessage('will rename file: '+FormMain.ListROMsNameFullPath[ROMIndex]+#13+'to: '+ROMsName[Loop]+#13+'of file: '+ZIPFileName);
                                              if Pos('\', FormMain.ListROMsNameFullPath[ROMIndex]) <> 0 then
                                                 FormMain.RenameFileInsideZip(ZIPFileName, FormMain.ListROMsNameFullPath[ROMIndex], ExtractFilePath(FormMain.ListROMsNameFullPath[ROMIndex])+ROMsName[Loop])
                                              else
                                                 FormMain.RenameFileInsideZip(ZIPFileName, FormMain.ListROMsNameFullPath[ROMIndex], ROMsName[Loop]);
                                            end;}

                                         Inc(ROMsCount);
                                         // found crc number
                                       end
                                    else
                                       begin
                                         ROMIndex:= FormMain.ParentListROMsCRC.IndexOf(FixedCRCHex);
                                         if ROMIndex > -1 then
                                            begin
                                              case RenameROM(ParentZIPFileName, True) of
                                                True:
                                                  begin
                                                    ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ParentListROMsName[ROMIndex], FormMain.ParentListROMsSize[ROMIndex], ListROMCRC, FormMain.ParentListROMsCRC[ROMIndex])
                                                                                +'  [renamed from '+FormMain.ParentListROMsName[ROMIndex]+' to '+ROMsName[Loop]+']';
                                                  end;
                                                False:
                                                  begin
                                                    ResultLine:= TestROMSizeCRC(ListROMSize, FormMain.ParentListROMsName[ROMIndex], FormMain.ParentListROMsSize[ROMIndex], ListROMCRC, FormMain.ParentListROMsCRC[ROMIndex])
                                                                                +'  [correct name: '+ROMsName[Loop]+']';
                                                  end;
                                              end;

                                              {if RenameFiles and (ParentZIPFileName <> 'Not Found')then
                                                 begin
                                                   ShowMessage('will rename file: '+FormMain.ParentListROMsNameFullPath[ROMIndex]+#13+'to: '+ROMsName[Loop]+#13+'of file: '+ParentZIPFileName);
                                                   if Pos('\', FormMain.ParentListROMsNameFullPath[ROMIndex]) <> 0 then
                                                      FormMain.RenameFileInsideZip(ParentZIPFileName, FormMain.ParentListROMsNameFullPath[ROMIndex], ExtractFilePath(FormMain.ParentListROMsNameFullPath[ROMIndex])+ROMsName[Loop])
                                                   else
                                                      FormMain.RenameFileInsideZip(ParentZIPFileName, FormMain.ParentListROMsNameFullPath[ROMIndex], ROMsName[Loop]);
                                                 end;}
                                              Inc(ROMsCount);
                                              // found crc number
                                              case ROMStatus of
                                                 0: ROMStatus:= 1;
                                                 2: ROMStatus:= 3;
                                                 4: ROMStatus:= 5;
                                                 6: ROMStatus:= 7;
                                                 8: ROMStatus:= 9;
                                                10: ROMStatus:= 11;
                                              end;
                                            end
                                         else
                                            begin
                                              ResultLine:= Format('%12s  %10s  %8s  [not found]', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                                              ROMStatus:= 12;
                                              GameOk:= False;
                                              Inc(NotFoundROMsCount);
                                            end;
                                       end;
                                  end;
                                True: ScanCHDFileMD5;
                              end;
                            end
                         else
                            begin
                              case DiskImage of
                                False: ResultLine:= Format('%12s  %10s  %8s', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                                True : ResultLine:= Format('%12s  %10s  %32s', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
                              end;
                              Inc(ROMsCount);
                            end;
                       end;
                  end;
             end;
         end;
         // here is the place that I would have to see if the file is OK, and add it to the
         // valid files temporary list
         // if CheckUnneededFiles then
         //   begin
              //if (Pos('correct size:', ResultLine) = 0) or (Pos('correct crc:', ResultLine) = 0) then
                 // file is OK, can be added
              //else
                 // file is not OK, don't add it to the list
         //   end;
       end
    else
       begin
         case DiskImage of
           False: ResultLine:= Format('%12s  %10s  %8s  [not found]', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
           True : ResultLine:= Format('%12s  %10s  %32s  [not found]', [ROMsName[Loop], ROMsSize[Loop], ROMsCRC[Loop]]);
         end;
         ROMStatus:= 12;
         GameOk:= False;
         Inc(NotFoundROMsCount);
       end;
    AuditROMsTree.Items.AddChild(ROMsNode, ResultLine);
    ROMsNode.GetLastChild.ImageIndex:= ROMStatus;
    ROMsNode.GetLastChild.SelectedIndex:= ROMStatus;
  end;

  if ((ROMsCount = ROMsName.Count) and (not OriginalGame) and (FileNotFound) and (AuditMode = 0)) then
     LabelMergedMasterGame.Caption:= Format(FormMain.GetLanguageText('Audit Games', 'MergedMasterGameMsg', 'Merged in %s.zip'), [ParentGameName]);

  case GameOk of
    True:
      begin
        if LabelMergedMasterGame.Caption = '' then
           begin
             ROMsNode.ImageIndex:= 13;
             ROMsNode.SelectedIndex:= 13;
           end
        else
           begin
             ROMsNode.ImageIndex:= 14;
             ROMsNode.SelectedIndex:= 14;
           end;
        Result:= True;
      end;
    False:
      begin
        ROMsNode.ImageIndex:= 15;
        ROMsNode.SelectedIndex:= 15;
        Result:= False;
        ROMsNode.Expand(True);
      end;
  end;

  // here would be the place to scan the file to see if .zip file has unneded files
  // if UnneededFilesListM.Count > 0 then
  //    begin
  //      for Counter:=0 to UnnededFilesListM.Count -1 do
  //      begin
  //      end;
  //    end;

  // if UnneededFilesListC.Count > 0 then
  //    begin
  //      for Counter:=0 to UnnededFilesListC.Count -1 do
  //      begin
  //      end;
  //    end;



  if ((ROMsNodeEndText <> '') and (LabelMergedMasterGame.Caption = '')) then
     ROMsNode.Text:= ROMsNode.Text+ROMsNodeEndText;

  if ROMsNode.ImageIndex = 14 then
     ROMsNode.Text:= ROMsNode.Text+' [merged]';

  if ((NotFoundROMsCount = ROMsName.Count) and (not FileNotFound) and (not ParentFileNotFound)) then
     Inc(UnavailableGames);

  if ((not OriginalGame) and (FileNotFound) and (not ParentFileNotFound)) then
     begin
       if ROMsCount <> ROMsName.Count then
          Inc(UnavailableGames);
     end;
  if AuditMode = 0 then
     ROMsNode.Expand(True);
  ListROMName:= '';
  ListROMSize:= '';
  ListROMCRC:= '';
end;

procedure TFormAudit.ButtonCloseClick(Sender: TObject);
begin
  LabelMergedMasterGame.Caption:= FormMain.GetLanguageText('Audit Games', 'CloseWindowMsg', 'Closing! Please wait a moment...');
  LabelMergedMasterGame.Refresh;
  AuditROMsTree.Items.BeginUpdate;
  AuditROMsTree.FullCollapse;
  AuditROMsTree.Items.Clear;
  AuditROMsTree.Items.EndUpdate;
  FreeAndNil(aBiosDriver);
  FormAudit.Release;
  FormAudit:= nil;
end;

procedure TFormAudit.Audit(FixFileNames: Boolean);
var
  Result: String;
  mGamesList: THashedStringList;
  GameROMsList: TextFile;
  Loop{, StartClock, EndClock}: Integer;
begin
  //StartClock:= GetTickCount;
  if LabelStatusFormat = '' then
     LabelStatusFormat:= '%.6d of %.6d';
  SetCurrentDir(ExtractFilePath(FormMain.EmulatorExecutable[FormMain.ButtonExecutablesMode.Tag]));
  //SetCurrentDir(ExtractFilePath(FormMain.GetCurrentEmulatorExecutable));

  if not Assigned(aBiosDriver) then
     aBiosDriver:= TMemIniFile.Create(FormMain.FrontendPath+'bios.ini');

  AuditROMsTree.Items.BeginUpdate;
  case AuditMode of
    0: //Single Audit
      begin
        if not Assigned(ROMsList) then
           begin
             ROMsList:= THashedStringList.Create;
             ROMsList.LoadFromFile(FormMain.FrontendPath+'resources\ROMs.dat');
           end;
        PopupAuditGameAgain.Enabled:= True;
        Auditing:= True;

        TotalGames:= 1;
        AvailableGames:= 0;
        UnavailableGames:= 0;
        GoodGames:= 0;
        BadGames:= 0;

        LabelAuditedGames.Caption:= Format(LabelStatusFormat, [1, 1]);
        ButtonCancel.Enabled:= False;
        Result:= MountFilesList(GameName);
        case AuditGame(GameName, ParentGameName, FixFileNames) of
          True : Inc(GoodGames);
          False: Inc(BadGames);
        end;
        Auditing:= False;

        LabelGoodAuditedGames.Caption:= Format(LabelStatusFormat, [GoodGames, 1]);
        LabelMissingGameFiles.Caption:= Format(LabelStatusFormat, [UnavailableGames, 1]);
        LabelBadAuditedGames.Caption:= Format(LabelStatusFormat, [BadGames, 1]);
        FreeAndNil(ROMsList);
      end;
    1, 2: // Audit All Games
      begin
        LabelMergedMasterGame.Visible:= False;
        PopupAuditGameAgain.Enabled:= False;
        Auditing:= True;
        ButtonClose.Enabled:= False;
        LabelGameDescription.Caption:= '';
        TotalGames:= 0;
        AvailableGames:= 0;
        UnavailableGames:= 0;
        GoodGames:= 0;
        BadGames:= 0;

        mGamesList:= THashedStringList.Create;
        GetGamesList(mGamesList, True, AuditMode = 1);
        TotalGames:= mGamesList.Count;

        case AuditMode of
          1: FreeAndNil(mGamesList);
          2: begin
               mGamesList.BeginUpdate;
               for Loop:=0 to mGamesList.Count -1 do
               begin
                 FormMain.GetROMFields(mGamesList[Loop]);
                 mGamesList[Loop]:= FormMain.mName;
               end;
               mGamesList.EndUpdate;
             end;
        end;
        Application.ProcessMessages;
        AvailableGames:= 0;
        UnavailableGames:= 0;
        GoodGames:= 0;
        BadGames:= 0;
        LabelGameDescription.Caption:= FormMain.GetLanguageText('Status Messages', 'VerifyGames', 'Verifying games. Please, wait a moment...');

        AssignFile(GameROMsList, FormMain.FrontendPath+'resources\ROMs.dat');
        Reset(GameROMsList);
        while not Eof(GameROMsList) do
        begin
          ReadLn(GameROMsList, Result);
          if ((Pos('bios ', Result) > 0) or (Pos('game ', Result) > 0)) then
             begin
               GameName:= Copy(Result, 6, Length(Result));
               ROMsName.BeginUpdate;
               ROMsSize.BeginUpdate;
               ROMsCRC.BeginUpdate;
               ROMsName.Clear;
               ROMsSize.Clear;
               ROMsCRC.Clear;
             end
          else
          if Pos('cloneof', Result) > 0 then
             ParentGameName:= Copy(Result, 9, Length(Result))
          else
          if ((Result = ' ') or (Eof(GameROMsList))) then
             begin
               if Result <> '' then
                  FormMain.GetGameROMs(Result, True);
               // End of game
               ROMsName.EndUpdate;
               ROMsSize.EndUpdate;
               ROMsCRC.EndUpdate;

               case AuditMode of
                 1:
                   begin
                     case AuditGame(GameName, ParentGameName, FixFileNames) of
                       True : Inc(GoodGames);
                       False: Inc(BadGames);
                     end;
                     Inc(CurrentGame);
                     LabelAuditedGames.Caption:= Format(LabelStatusFormat, [CurrentGame, TotalGames]);
                     LabelGoodAuditedGames.Caption:= Format(LabelStatusFormat, [GoodGames, CurrentGame]);
                     LabelMissingGameFiles.Caption:= Format(LabelStatusFormat, [UnavailableGames, CurrentGame]);
                     LabelBadAuditedGames.Caption:= Format(LabelStatusFormat, [BadGames, CurrentGame]);
                   end;
                 2:
                   begin
                     if mGamesList.IndexOf(GameName) > -1 then
                        begin
                          case AuditGame(GameName, ParentGameName, FixFileNames) of
                            True : Inc(GoodGames);
                            False: Inc(BadGames);
                          end;
                          Inc(CurrentGame);
                          LabelAuditedGames.Caption:= Format(LabelStatusFormat, [CurrentGame, TotalGames]);
                          LabelGoodAuditedGames.Caption:= Format(LabelStatusFormat, [GoodGames, CurrentGame]);
                          LabelMissingGameFiles.Caption:= Format(LabelStatusFormat, [UnavailableGames, CurrentGame]);
                          LabelBadAuditedGames.Caption:= Format(LabelStatusFormat, [BadGames, CurrentGame]);
                        end;
                   end;
               end;
               GameName:= '';
               ParentGameName:= '';
             end
          else
             FormMain.GetGameROMs(Result, True);

          Application.ProcessMessages;
          if ButtonCancel.Tag = 1 then
             Break;
        end;
        LabelGameDescription.Caption:= '';
        ButtonCancel.Tag:= 0;
        CloseFile(GameROMsList);
        FreeAndNil(mGamesList);

        ButtonClose.Enabled:= True;
        ButtonCancel.Enabled:= False;
        Auditing:= False;
        LabelMergedMasterGame.Caption:= '';
        LabelMergedMasterGame.Visible:= True;
      end;
  end;
  AuditROMsTree.Items.EndUpdate;
  FreeAndNil(ROMsName);
  FreeAndNil(ROMsSize);
  FreeAndNil(ROMsCRC);

  FreeAndNil(FormMain.ListROMsName);
  FreeAndNil(FormMain.ListROMsSize);
  FreeAndNil(FormMain.ListROMsCRC);
  FreeAndNil(FormMain.ParentListROMsName);
  FreeAndNil(FormMain.ParentListROMsSize);
  FreeAndNil(FormMain.ParentListROMsCRC);
  SetCurrentDir(FormMain.FrontendPath);
  //EndClock:=GetTickCount;
  //ShowMessage(IntToStr(EndClock-StartClock)); //Time in milliseconds
end;

procedure TFormAudit.FormCreate(Sender: TObject);
begin
  // Let the tree know how much data space we need.
  //VST.NodeDataSize := SizeOf(TGameDetails);
  // Set an initial number of nodes.
  //VST.RootNodeCount:= 0;
  {if FormMain.List.SmallImages = FormMain.BuiltInSmallListImageList then
     VST.Images:= FormMain.BuiltInSmallListImageList
  else
     VST.Images:= FormMain.SmallRealIconsImageList;}

  LoadToolbarIcons;

  ROMsName:= THashedStringList.Create;
  ROMsSize:= THashedStringList.Create;
  ROMsCRC:= THashedStringList.Create;

  FormMain.ListROMsName:= THashedStringList.Create;
  FormMain.ListROMsSize:= THashedStringList.Create;
  FormMain.ListROMsCRC:= THashedStringList.Create;
  FormMain.ListROMsNameFullPath:= THashedStringList.Create;
  FormMain.ParentListROMsName:= THashedStringList.Create;
  FormMain.ParentListROMsSize:= THashedStringList.Create;
  FormMain.ParentListROMsCRC:= THashedStringList.Create;
  FormMain.ParentListROMsNameFullPath:= THashedStringList.Create;
end;

procedure TFormAudit.ButtonCancelClick(Sender: TObject);
begin
  ButtonCancel.Tag:= 1;
end;

procedure TFormAudit.PopupShowGamesDetailsClick(Sender: TObject);
begin
  AuditROMsTree.Items.BeginUpdate;
  AuditROMsTree.FullExpand;
  AuditROMsTree.Items.EndUpdate;
end;

procedure TFormAudit.PopupHideGamesDetailsClick(Sender: TObject);
begin
  AuditROMsTree.Items.BeginUpdate;
  AuditROMsTree.FullCollapse;
  AuditROMsTree.Items.EndUpdate;
end;

procedure TFormAudit.PopupShowOnlyBadGamesClick(Sender: TObject);
var
  Loop: Integer;
  ROMsNode: TTreeNode;
begin
  PopupShowOnlyBadGames.Checked:= not PopupShowOnlyBadGames.Checked;
  case PopupShowOnlyBadGames.Checked of
    True:
      begin
        AuditROMsTree.Items.BeginUpdate;
        ROMsNode:= AuditROMsTree.Items.GetFirstNode;
        for Loop:=0 to AuditROMsTree.Items.Count-1 do
        begin
          if ((ROMsNode.ImageIndex = 13) or (ROMsNode.ImageIndex = 14)) then
             ROMsNode.Collapse(True);
          ROMsNode:= ROMsNode.GetNext;
        end;
        AuditROMsTree.Items.EndUpdate;
      end;
    False:
      begin
        AuditROMsTree.Items.BeginUpdate;
        AuditROMsTree.FullExpand;
        AuditROMsTree.Items.EndUpdate;
      end;
  end;
end;

procedure TFormAudit.PopupAuditGameAgainClick(Sender: TObject);
begin
  AuditROMsTree.Items.BeginUpdate;
  AuditROMsTree.Items.Clear;
  AuditROMsTree.Items.EndUpdate;

  ROMsName:= THashedStringList.Create;
  ROMsSize:= THashedStringList.Create;
  ROMsCRC:= THashedStringList.Create;

  FormMain.ListROMsName:= THashedStringList.Create;
  FormMain.ListROMsSize:= THashedStringList.Create;
  FormMain.ListROMsCRC:= THashedStringList.Create;
  FormMain.ParentListROMsName:= THashedStringList.Create;
  FormMain.ParentListROMsSize:= THashedStringList.Create;
  FormMain.ParentListROMsCRC:= THashedStringList.Create;

  Audit(False);
end;

function TFormAudit.MountHTMLLine(StringData: String): String;
var
  Loop: Integer;
begin
  Result:= '';
  for Loop:=0 to Length(StringData) do
  begin
    if StringData[Loop] = ' ' then
       Result:= Result+'&nbsp;'
    else
       Result:= Result+StringData[Loop];
  end;
end;

function TFormAudit.MountGameLine(NodeLevel: Integer; BitmapFileName: String; IconIndex: Integer; NodeText: String): String;
var
  IconList: TBitmap;
begin
  if not FileExists(ExtractFilePath(SaveAuditDialog.FileName)+BitmapFileName+'.bmp') then
     begin
       IconList:= TBitmap.Create;
       IconList.Transparent:= True;
       IconList.TransparentColor:= clWhite;
       ImageListResults.GetBitmap(IconIndex,IconList);
       IconList.SaveToFile(ExtractFilePath(SaveAuditDialog.FileName)+BitmapFileName+'.bmp');
       FreeAndNil(IconList);
     end;
  case NodeLevel of
    0: Result:= '<p><img src="'+BitmapFileName+'.bmp'+'" align="absmiddle">&nbsp;<b>'+NodeText+'</b><br>';
    1: Result:= '&nbsp;&nbsp;<img src="'+BitmapFileName+'.bmp'+'" align="absmiddle">&nbsp;'+MountHTMLLine(NodeText)+'<br>';
  end;
end;

procedure TFormAudit.PopupSaveResultstoHTMLFileClick(Sender: TObject);
var
 HTMLFile: Textfile;
 Node: TTreeNode;
begin
  if SaveAuditDialog.Execute then
     begin
       LabelMergedMasterGame.Caption:= FormMain.GetLanguageText('Audit Games', 'SaveGamesHTMLFileMsg', 'Saving games to HTML file. Please wait a moment...');
       AssignFile(HTMLFile, SaveAuditDialog.FileName);
       Rewrite(HTMLFile);
       TotalGames:= 0;
       AvailableGames:= 0;
       UnavailableGames:= 0;
       GoodGames:= 0;
       BadGames:= 0;
       try
         Node:= AuditROMsTree.Items.GetFirstnode;
         WriteLn(HTMLFile, '<p align="center"><font face="Tahoma" color="#FF0000" size="3"><b>'+FormMain.EmulatorVersion[1]+' audited games</b></font></p>');
         WriteLn(HTMLFile,'<p><font face="Courier New">');
         while Node <> nil do
         begin
           if Node.Level = 0 then
              begin
                case Node.ImageIndex of
                  13: begin
                        WriteLn(HTMLFile, MountGameLine(0, 'GameOk', 13, Node.Text));
                        Inc(GoodGames);
                      end;
                  14: begin
                        WriteLn(HTMLFile, MountGameLine(0, 'GameOk(Merged)', 14, Node.Text));
                        Inc(GoodGames);
                      end;
                  15: begin
                        WriteLn(HTMLFile, MountGameLine(0, 'GameError', 15, Node.Text));
                        Inc(BadGames);
                      end;
                end;
                if Pos('.zip not found]', Node.Text) > 0 then
                   Inc(UnavailableGames)
                else
                   Inc(AvailableGames);
                case Node.ImageIndex of
                  13..15: Inc(TotalGames);
                end;
              end
           else
              begin
                case Node.ImageIndex of
                   0: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok', 0, Node.Text));
                   1: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok(Merged)', 1, Node.Text));
                   2: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok_NoGoodDumpKnown', 2, Node.Text));
                   3: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok_NoGoodDumpKnown(Merged)', 3, Node.Text));
                   4: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok_RomNeedsRedump', 4, Node.Text));
                   5: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Ok_RomNeedsRedump(Merged)', 5, Node.Text));
                   6: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error', 6, Node.Text));
                   7: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error(Merged)', 7, Node.Text));
                   8: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error_NoGoodDumpKnown', 8, Node.Text));
                   9: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error_NoGoodDumpKnown(Merged)', 9, Node.Text));
                  10: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error_RomNeedsRedump', 10, Node.Text));
                  11: WriteLn(HTMLFile, MountGameLine(1, 'ROM_Error_RomNeedsRedump(Merged)', 11, Node.Text));
                  12: WriteLn(HTMLFile, MountGameLine(1, 'ROMNotFound', 12, Node.Text));
                end;
              end;

           Node:= Node.GetNext;
         end;
         WriteLn(HTMLFile, '</p>');
         WriteLn(HTMLFile, '<p><font face="Tahoma" size="2"><b>Audited Games: '+Format('%.4d', [TotalGames])+'<br>'+
                           'Good: '+Format('%.4d', [GoodGames])+'<br>'+'Missing Sets: '+Format('%.4d', [UnavailableGames])+'<br>'+
                           'Errors: '+Format('%.4d', [BadGames])+'</b><br><font color="#008000">Generated by Emu Loader v'+
                           FrontendVersion+'<br>Date: '+DateToStr(Date)+' - Time: '+TimeToStr(Time)+'</font></font></p>');
       finally
         CloseFile(HTMLFile);
         LabelMergedMasterGame.Caption:= '';
       end;
       FormMain.GetMessagesLng('Messages', 'CompleteOperationTitle', 'Operation Complete',
                               'Audit Games', 'HTMLFileSavedMsg', 'File "%s" saved with audit info.');
       GenerateMessage(FormMain.MessageText[0], Format(FormMain.MessageText[1], [SaveAuditDialog.FileName]), 2);
     end;
end;

procedure TFormAudit.PopupSaveBadGamestoHTMLFileClick(Sender: TObject);
var
 HTMLFile: Textfile;
 Node: TTreeNode;
 BadGame, AddBadGame, NoROMsFound: Boolean;
 GameDetails: THashedStringList;
 MasterSet, CloneSet: String[8];
 StringLine: String;
 Loop: Integer;
begin
  if SaveAuditDialog.Execute then
     begin
       LabelMergedMasterGame.Caption:= FormMain.GetLanguageText('Audit Games', 'SaveBadGamesHTMLFileMsg', 'Saving bad games to HTML file. Please wait a moment...');
       AssignFile(HTMLFile, SaveAuditDialog.FileName);
       Rewrite(HTMLFile);
       BadGame:= False;
       TotalGames:= 0;
       UnavailableGames:= 0;
       BadGames:= 0;
       NoROMsFound:= True;
       GameDetails:= THashedStringList.Create;
       try
         Node:= AuditROMsTree.Items.GetFirstnode;
         WriteLn(HTMLFile, '<p align="center"><font face="Tahoma" color="#FF0000" size="3"><b>'+FormMain.EmulatorVersion[1]+' bad games</b></font></p>');
         WriteLn(HTMLFile,'<p><font face="Courier New">');
         while Node <> nil do
         begin
           if Node.Level = 0 then
              begin
                if GameDetails.Count > 0 then
                   begin
                     if not NoROMsFound then
                        begin
                          for Loop:=0 to GameDetails.Count -1 do
                              WriteLn(HTMLFile, GameDetails[Loop]);
                          Inc(TotalGames);
                        end;
                     NoROMsFound:= True;
                     GameDetails.Clear;
                   end;

                if Node.ImageIndex = 15 then
                   begin
                     AddBadGame:= False;
                     GameDetails.Add(MountGameLine(0, 'GameError', 15, Node.Text));
                     BadGame:= True;
                     if Pos('.zip not found]', Node.Text) > 0 then
                        begin
                          if Pos(' and ', Node.Text) = 0 then
                             begin
                               if Pos('(', Node.Text) > 0 then
                                  begin
                                    StringLine:= Node.Text;
                                    MasterSet:= Trim(Copy(Node.Text, 1, Pos(' ', StringLine)-1));
                                    CloneSet:= Copy(Node.Text, Pos('(', StringLine)+1, (Pos(')', StringLine){-1}) - (Pos('(', StringLine)+1));

                                    if Pos(CloneSet+'.zip not found]', StringLine) > 0 then
                                       Inc(UnavailableGames)
                                    else
                                    if Pos(MasterSet+'.zip not found]', StringLine) > 0 then
                                       begin
                                         AddBadGame:= False;
                                         BadGame:= False;
                                       end;
                                  end;
                             end
                        end
                     else
                        AddBadGame:= True;
                   end
                else
                   BadGame:= False;
              end
           else
              begin
                if BadGame then
                   begin
                     case Node.ImageIndex of
                        0: GameDetails.Add(MountGameLine(1, 'ROM_Ok', 0, Node.Text));
                        1: GameDetails.Add(MountGameLine(1, 'ROM_Ok(Merged)', 1, Node.Text));
                        2: GameDetails.Add(MountGameLine(1, 'ROM_Ok_NoGoodDumpKnown', 2, Node.Text));
                        3: GameDetails.Add(MountGameLine(1, 'ROM_Ok_NoGoodDumpKnown(Merged)', 3, Node.Text));
                        4: GameDetails.Add(MountGameLine(1, 'ROM_Ok_RomNeedsRedump', 4, Node.Text));
                        5: GameDetails.Add(MountGameLine(1, 'ROM_Ok_RomNeedsRedump(Merged)', 5, Node.Text));
                        6: GameDetails.Add(MountGameLine(1, 'ROM_Error', 6, Node.Text));
                        7: GameDetails.Add(MountGameLine(1, 'ROM_Error(Merged)', 7, Node.Text));
                        8: GameDetails.Add(MountGameLine(1, 'ROM_Error_NoGoodDumpKnown', 8, Node.Text));
                        9: GameDetails.Add(MountGameLine(1, 'ROM_Error_NoGoodDumpKnown(Merged)', 9, Node.Text));
                       10: GameDetails.Add(MountGameLine(1, 'ROM_Error_RomNeedsRedump', 10, Node.Text));
                       11: GameDetails.Add(MountGameLine(1, 'ROM_Error_RomNeedsRedump(Merged)', 11, Node.Text));
                       12: GameDetails.Add(MountGameLine(1, 'ROMNotFound', 12, Node.Text));
                     end;

                     if Node.ImageIndex in [6..12] then
                        begin
                          if AddBadGame then
                             begin
                               AddBadGame:= False;
                               Inc(BadGames);
                             end;
                        end;

                     if Node.ImageIndex in [0..11] then
                        NoROMsFound:= False;
                   end;
              end;
           Node:= Node.GetNext;
         end;
         if GameDetails.Count > 0 then
            begin
              if not NoROMsFound then
                 begin
                   for Loop:=0 to GameDetails.Count -1 do
                       WriteLn(HTMLFile, GameDetails[Loop]);
                   Inc(TotalGames);
                 end;
            end;
         WriteLn(HTMLFile, '</p>');
         WriteLn(HTMLFile, '<p><font face="Tahoma" size="2"><b>Audited Games: '+Format('%.4d', [TotalGames])+'<br>'+
                           'Missing Sets: '+Format('%.4d of %.4d', [UnavailableGames, TotalGames])+'<br>'+
                           'Errors: '+Format('%.4d', [BadGames])+'</b><br><font color="#008000">Generated by Emu Loader v'+
                           FrontendVersion+'<br>Date: '+DateToStr(Date)+' - Time: '+TimeToStr(Time)+'</font></font></p>');
       finally
         CloseFile(HTMLFile);
         LabelMergedMasterGame.Caption:= '';
         FreeAndNil(GameDetails);
       end;
       FormMain.GetMessagesLng('Messages', 'CompleteOperationTitle', 'Operation Complete',
                               'Audit Games', 'HTMLFileSavedMsg', 'File "%s" saved with audit info.');
       GenerateMessage(FormMain.MessageText[0], Format(FormMain.MessageText[1], [SaveAuditDialog.FileName]), 2);
     end;
end;

procedure TFormAudit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_ESCAPE) or (Key = VK_RETURN)) then
     begin
       case Auditing of
         True : ButtonCancel.OnClick(Self);
         False: ButtonClose.OnClick(Self);
       end;
       Key:= 0;
     end;
end;

procedure TFormAudit.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormAudit);
end;

{procedure TFormAudit.VSTGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
//var
 // Data: pGameDetails;
begin
  // A handler for the OnGetText event is always needed as it provides the tree with the string data to display.
  // Note that we are always using WideString.
  //Data:= Sender.GetNodeData(Node);
  //if Assigned(Data) then
   //  CellText:= Data.Caption;
     //Text:= Data.Caption; // doesn't work!!! don't know where this "Text" property is from
end;

procedure TFormAudit.VSTFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
//var
 // Data: pGameDetails;
begin
  //Data:= Sender.GetNodeData(Node);
  // Explicitely free the string, the VCL cannot know that there is one but needs to free
  // it nonetheless. For more fields in such a record which must be freed use Finalize(Data^) instead touching
  // every member individually.
  //if Assigned(Data) then
  //   Data.Caption:= '';
end;

procedure TFormAudit.VSTInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
//var
//  Data: pGameDetails;
begin
  //with Sender do
  //begin
  //  Data:= GetNodeData(Node);
    // Construct a node caption. This event is triggered once for each node but
    // appears asynchronously, which means when the node is displayed not when it is added.
 //   Data.Caption:= GameName;// Format('Level %d, Index %d', [GetNodeLevel(Node), Node.Index]);
  //  Data.ImageIndex:= 3;
  //end;
end;

procedure TFormAudit.VSTGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
//var
//  Data: pGameDetails;
begin
  //if Node.Parent = Sender.RootNode then
  //   ImageIndex:= Data.ImageIndex;
end;}

procedure TFormAudit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       FreeAndNil(ROMsName);
       FreeAndNil(ROMsSize);
       FreeAndNil(ROMsCRC);

       FreeAndNil(FormMain.ListROMsName);
       FreeAndNil(FormMain.ListROMsSize);
       FreeAndNil(FormMain.ListROMsCRC);
       FreeAndNil(FormMain.ListROMsNameFullPath);
       FreeAndNil(FormMain.ParentListROMsName);
       FreeAndNil(FormMain.ParentListROMsSize);
       FreeAndNil(FormMain.ParentListROMsCRC);
       FreeAndNil(FormMain.ParentListROMsNameFullPath);
     end;
end;

procedure TFormAudit.AuditROMsTreeCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  Application.ProcessMessages;
end;

procedure TFormAudit.AuditROMsTreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  Application.ProcessMessages;
end;

end.

