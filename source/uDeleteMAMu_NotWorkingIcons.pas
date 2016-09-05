unit uDeleteMAMu_NotWorkingIcons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ImgList,
  MPCommonObjects, EasyListview, StdCtrls, ComCtrls, ToolWin,
  unitExIcon, ShadowLabel, ExtCtrls, Buttons;

type
  TNotWorkingGameInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fIconLoaded: Boolean;
    fROMIdentification: Integer;
    fSystemID: Integer;
    fTitle: WideString;
    fName: String;
    fClone: String;
    fCloneParent: String;
    fDriverName: String;
    fDriverStatus: ShortInt;
    fSoftwareName: String;
    fGameStatus: ShortInt; // 0 - have or miss; 1 - missing ROMs/CHDs
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eIconLoaded: Boolean read fIconLoaded write fIconLoaded;
    property eROMIdentification: Integer read fROMIdentification write fROMIdentification;
    property eSystemID: Integer read fSystemID write fSystemID;
    property eTitle: WideString read fTitle write fTitle;
    property eName: String read fName write fName;
    property eClone: String read fClone write fClone;
    property eCloneParent: String read fCloneParent write fCloneParent;
    property eDriverName: String read fDriverName write fDriverName;
    property eDriverStatus: ShortInt read fDriverStatus write fDriverStatus;
    property eSoftwareName: String read fSoftwareName write fSoftwareName;
    property eGameStatus: ShortInt read fGameStatus write fGameStatus;
  end;

type
  TFormDeleteMAMu_NotWorkingIcons = class(TForm)
    NotWorkingIcons: TEasyListview;
    IL_NotWorking: TImageList;
    Panel1: TPanel;
    LabelHotkeys: TShadowLabel;
    ButtonSourceIcon: TBitBtn;
    ButtonDeleteFiles: TBitBtn;
    ButtonCancel: TBitBtn;
    procedure NotWorkingIconsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure NotWorkingIconsKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormShow(Sender: TObject);
    procedure NotWorkingIconsItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonSourceIconClick(Sender: TObject);
    procedure ButtonDeleteFilesClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
    function  AddMAMu_Icon(sysID: Integer; const GameName, SoftwareName: String): Integer;
    procedure PopulateGamesList;
    procedure ReplaceZZZIcon;
    function  CheckNameZZZ(FileNameStr: String): Boolean;
  public
    { Public declarations }
    mmResult: Integer;
    procedure SetMode;
  end;

var
  FormDeleteMAMu_NotWorkingIcons: TFormDeleteMAMu_NotWorkingIcons;

implementation

uses uMain, uMAMu_IconsManager, uCommon, uSelectIconFile;

{$R *.dfm}

function TNotWorkingGameInfo.GetCaptions(Column: Integer): WideString;
var
  TextGameStr, FullStr: String;
begin
  case Column of
    0: Result:= eTitle;
    1:
      begin
        TextGameStr:= eName;
        if FormMain.GameIsClone(eClone) then
           TextGameStr:= TextGameStr+' ['+eClone+']';
        if eSoftwareName <> '' then
           TextGameStr:= TextGameStr+' [xml '+eSoftwareName+']';
        FullStr:= '%s%'+IntToStr(39-Length(TextGameStr))+'s';
        Result:= Format(FullStr, [TextGameStr, ' [driver: '+aStatus[eDriverStatus]+']']);
      end;
  end;
end;

function TNotWorkingGameInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     begin
       case FormDeleteMAMu_NotWorkingIcons.LabelHotkeys.Tag of
         //0: Result:= 0; // delete icons
         1, 2: // copy / update "zzz" icon to game name 1-> copy; 2-> update
           begin
             if not eIconLoaded then
                begin
                  eImageIndex:= FormDeleteMAMu_NotWorkingIcons.AddMAMu_Icon(eSystemID, eName, eSoftwareName);
                  if eImageIndex = -1 then
                     eImageIndex:= FormMain.GetMAMEImageIndex(eROMIdentification, eSoftwareName);
                  eIconLoaded:= True;
                end;
           end;
       end;
       Result:= eImageIndex;
     end
  else
     Result:= -1;
end;

function TFormDeleteMAMu_NotWorkingIcons.AddMAMu_Icon(sysID: Integer; const GameName, SoftwareName: String): Integer;
var
  Icon32: TExIcon;
  tmpIco: TIcon;
  icoIndex: Integer;
  FilePath: String;
begin
  Result:= -1;
  if not FormMain.ScanFoldersIcon(GameName, SoftwareName, sysID, FilePath, False) then
     Exit;

  if FormMain.LoadMAMu_Icon(FilePath, Icon32, icoIndex, False) then
     begin
       Icon32.CurrentImage:= icoIndex;
       tmpIco:= TIcon.Create;
       tmpIco.Width:= 32;//Icon32.Images[icoLoop].Width;
       tmpIco.Height:= 32;//Icon32.Images[icoLoop].Width;
       tmpIco.Handle:= Icon32.Handle;
       Result:= IL_NotWorking.AddIcon(tmpIco);
       FreeAndNil(tmpIco);
     end;
  FreeAndNil(Icon32);
end;

procedure TFormDeleteMAMu_NotWorkingIcons.PopulateGamesList;
var
  Item, addItem: TEasyItem;
  Continue: Boolean;
  zIcon: TIcon;
  addIndex, selItem: Integer;
begin
  if not FormMain.CheckTotal(FormMAMu_IconsManager.MissingIconsList) then
     Exit;
  NotWorkingIcons.BeginUpdate;
  if LabelHotKeys.Tag in [1, 2] then
     begin
       addItem:= NotWorkingIcons.Items.AddCustom(TNotWorkingGameInfo, nil);
       TNotWorkingGameInfo(addItem).eImageIndex:= MaxGameID+1;
       TNotWorkingGameInfo(addItem).eIconLoaded:= True;
       TNotWorkingGameInfo(addItem).eROMIdentification:= -1;
       TNotWorkingGameInfo(addItem).eSystemID:= 1;
       case LabelHotKeys.Tag of
         1: TNotWorkingGameInfo(addItem).eTitle:= '!Icon To Copy';
         2: TNotWorkingGameInfo(addItem).eTitle:= '!Icon To Update';
       end;
       TNotWorkingGameInfo(addItem).eName:= FormMAMu_IconsManager.SourceIconFile; //'zzz.ico';
       TNotWorkingGameInfo(addItem).eClone:= '';
       TNotWorkingGameInfo(addItem).eCloneParent:= '';
       TNotWorkingGameInfo(addItem).eDriverName:= '';
       TNotWorkingGameInfo(addItem).eDriverStatus:= 0;
       TNotWorkingGameInfo(addItem).eSoftwareName:= '';
       TNotWorkingGameInfo(addItem).eGameStatus:= 0;
       addItem.Checked:= False;
       addItem.Details[1]:= 1;
     end;

  selItem:= 1;
  case LabelHotkeys.Tag of
    0, 2: Item:= FormMAMu_IconsManager.MissingIconsList.Groups.FirstItem; // delete files / update "zzz.ico" to all "not working" games
    1: Item:= FormMAMu_IConsManager.MissingIconsList.Selection.First; // copy "zzz.ico" to selected games
  end;
  repeat
    Continue:= True;
    case LabelHotkeys.Tag of
      0: Continue:= TMissingIconInfo(Item).eIsIconZZZ and (TMissingIconInfo(Item).eDriverStatus <> 2);
      2: Continue:= TMissingIconInfo(Item).eIsIconZZZ;
    end;
    if Continue then
       begin
         addItem:= NotWorkingIcons.Items.AddCustom(TNotWorkingGameInfo, nil);
         case LabelHotkeys.Tag of
           0:
             begin
               zIcon:= TIcon.Create;
               // add the softlistname sub-folder after "FormMAMu_Folder" here...
               zIcon.LoadFromFile(FormMain.MAMu_Folder+TMissingIconInfo(Item).eName+'.ico'); // index = MaxGameID+1
               addIndex:= IL_NotWorking.AddIcon(zIcon);
               FreeAndNil(zIcon);
               TNotWorkingGameInfo(addItem).eImageIndex:= addIndex;
             end;
           2: TNotWorkingGameInfo(addItem).eImageIndex:= MaxGameID+1;
           //0, 2: TNotWorkingGameInfo(addItem).eImageIndex:= MaxGameID+1;
           1:
             begin
                TNotWorkingGameInfo(addItem).eImageIndex:= -1;
                TNotWorkingGameInfo(addItem).eIconLoaded:= False;
             end;
         end;
         TNotWorkingGameInfo(addItem).eROMIdentification:= TMissingIconInfo(Item).eROMIdentification;
         TNotWorkingGameInfo(addItem).eSystemID:= TMissingIconInfo(Item).eSystemID;
         TNotWorkingGameInfo(addItem).eTitle:= TMissingIconInfo(Item).eTitle;
         TNotWorkingGameInfo(addItem).eName:= TMissingIconInfo(Item).eName;
         TNotWorkingGameInfo(addItem).eClone:= TMissingIconInfo(Item).eClone;
         TNotWorkingGameInfo(addItem).eCloneParent:= TMissingIconInfo(Item).eCloneParent;
         TNotWorkingGameInfo(addItem).eDriverName:= TMissingIconInfo(Item).eDriverName;
         TNotWorkingGameInfo(addItem).eDriverStatus:= TMissingIconInfo(Item).eDriverStatus;
         TNotWorkingGameInfo(addItem).eSoftwareName:= TMissingIconInfo(Item).eSoftwareName;
         TNotWorkingGameInfo(addItem).eGameStatus:= TMissingIconInfo(Item).eGameStatus;
         addItem.Checked:= True;
         addItem.Details[1]:= 1;
       end;
    case LabelHotkeys.Tag of
      0, 2: Item:= FormMAMu_IconsManager.MissingIconsList.Groups.NextItem(Item); // delete files
      1: Item:= FormMain.ELV_GetNextSelected(FormMAMu_IConsManager.MissingIconsList, Item, selItem); // copy / update "zzz.ico" to selected games
      //1: Item:= FormMAMu_IConsManager.MissingIconsList.Selection.Next(Item); // copy / update "zzz.ico" to selected games
    end;
  until Item = nil;
  NotWorkingIcons.EndUpdate;
  case LabelHotkeys.Tag of
    0: FormDeleteMAMu_NotWorkingIcons.Caption:= Format('%s - [%u Files]', [FormDeleteMAMu_NotWorkingIcons.Caption, NotWorkingIcons.Groups.ItemCount]);
    1, 2: FormDeleteMAMu_NotWorkingIcons.Caption:= Format('%s - [%u Games]', [FormDeleteMAMu_NotWorkingIcons.Caption, NotWorkingIcons.Groups.ItemCount-1]);
  end;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.NotWorkingIconsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not (CheckNameZZZ(TNotWorkingGameInfo(Item).eName)) then
     begin
       FormMain.GetCanvasFontCustom(TNotWorkingGameInfo(Item).eGameStatus,
                      TNotWorkingGameInfo(Item).eDriverStatus,
                      TNotWorkingGameInfo(Item).eClone, ACanvas, True);
     end
  else
     begin
       ACanvas.Font.Name:= 'Trebuchet MS';
       ACanvas.Font.Size:= 10;
       ACanvas.Font.Style:= [fsItalic];
     end;
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= 8;
       ACanvas.Font.Style:= [];
       ACAnvas.Font.Color:= clMaroon;
     end;
  //FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Ghosted{esosGhosted in Item.State} then
     if not CheckNameZZZ(TNotWorkingGameInfo(Item).eName) then
        ACanvas.Font.Color:= clGray;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.SetMode;
var
  zIcon: TIcon;
  //FolderStr: String;
begin
  FormDeleteMAMu_NotWorkingIcons.Tag:= FormMAMu_IconsManager.ButtonSystem.Tag;
  ButtonSourceIcon.Enabled:= LabelHotkeys.Tag <> 0; // delete files only support zzz.ico ?
  FormMAMu_IconsManager.SourceIconFile:= 'zzz.ico';
  case LabelHotkeys.Tag of
    0:
      begin
        FormDeleteMAMu_NotWorkingIcons.Caption:= 'Delete '+FormDeleteMAMu_NotWorkingIcons.Caption;
        LabelHotkeys.Caption:= LabelHotkeys.Caption+'Delete Files';
      end;
    1:
      begin
        FormDeleteMAMu_NotWorkingIcons.Caption:= 'Copy '+FormDeleteMAMu_NotWorkingIcons.Caption;
        ButtonDeleteFiles.Caption:= 'Copy Files';
        ButtonDeleteFiles.Hint:= 'Click here to copy "zzz" icon to checked games';
        LabelHotkeys.Caption:= LabelHotkeys.Caption+'Copy Files';
      end;
    2:
      begin
        FormDeleteMAMu_NotWorkingIcons.Caption:= 'Update '+FormDeleteMAMu_NotWorkingIcons.Caption;
        ButtonDeleteFiles.Caption:= 'Update Files';
        ButtonDeleteFiles.Hint:= 'Click here to update "zzz" icon to checked games';
        LabelHotkeys.Caption:= LabelHotkeys.Caption+'Update Files';
      end;
  end;
  if not FileExists(FormMain.MAMu_Folder+FormMAMu_IconsManager.SourceIconFile) then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    Required file ');
       FormMain.AddMsgText(FormMain.MAMu_Folder+FormMAMu_IconsManager.SourceIconFile, $00a65300,[fsBold]);
       FormMain.AddMsgText(' was not found. Cannot proceed...');
       GenerateMessage('Error', 'File not found', '', 2, False, 1);
       //ButtonCancel.Click;
       Exit;
     end;

  FormMain.AddGamesSystemsIcons(IL_NotWorking, False);
  zIcon:= TIcon.Create;
  //zIcon.LoadFromFile(IncludeTrailingPathDelimiter(FormMain.MAMu_Folders[1])+FormMAMu_IconsManager.SourceIconFile); // index = MaxGameID+1
  zIcon.LoadFromFile(FormMain.MAMu_Folder+FormMAMu_IconsManager.SourceIconFile); // index = MaxGameID+1

  IL_NotWorking.AddIcon(zIcon);
  FreeAndNil(zIcon);
  //FolderStr:= FormMain.GetFolderFull(32);
  //FormMain.AddDefaultIcons('mamu_.ico', FolderStr, IL_ToolBarButtons);
  //FormMain.AddDefaultIcons('delete.ico', FolderStr, IL_ToolBarButtons);
  //FormMain.AddDefaultIcons('stop.ico', FolderStr, IL_ToolBarButtons);

  //FormMain.AddDefaultIcons('zzz.ico',  IncludeTrailingPathDelimiter(FormMain.MAMu_Folders[1]), IL_ToolBarButtons);
  FormMain.ELV_ResetNormalColors(NotWorkingIcons);
  //FormMain.ELV_SetBackgroundColor(NotWorkingIcons, True);
  PopulateGamesList;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.ReplaceZZZIcon;
var
  Icon32: TExIcon;
  icoIndex: Integer;
  nIcon: TIcon;
  Item: TEasyItem;
begin
  if not FormMain.LoadMAMu_Icon(FormMain.MAMu_Folder+FormMAMu_IconsManager.SourceIconFile, Icon32, icoIndex, False) then
     Exit;
  Item:= NotWorkingIcons.Groups.FirstItem;
  Icon32.CurrentImage:= icoIndex;
  nIcon:= TIcon.Create;
  nIcon.Width:= 32; //Icon32.Images[icoLoop].Width;
  nIcon.Height:= 32; //Icon32.Images[icoLoop].Height;
  nIcon.Handle:= Icon32.Handle;
  IL_NotWorking.ReplaceIcon(TNotWorkingGameInfo(Item).eImageIndex, nIcon);
  nIcon.ReleaseHandle;
  FreeAndNil(nIcon);
  Icon32.Releasehandle;
  FreeAndNil(Icon32);
  NotWorkingIcons.BeginUpdate;
  TNotWorkingGameInfo(Item).eName:= FormMAMu_IconsManager.SourceIconFile;
  NotWorkingIcons.EndUpdate;
end;

function TFormDeleteMAMu_NotWorkingIcons.CheckNameZZZ(FileNameStr: String): Boolean;
begin
  Result:= (FileNameStr = 'zzz.ico') or
           (Copy(FileNameStr , 1, 4) = 'zzz_');
end;

procedure TFormDeleteMAMu_NotWorkingIcons.NotWorkingIconsKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_RETURN: ButtonDeleteFiles.Click;
    VK_ESCAPE: ButtonCancel.Click;
  end;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.FormShow(Sender: TObject);
begin
  mmResult:= mrCancel;
  ButtonSourceIcon.Enabled:= LabelHotkeys.Tag <> 0;
  FormMain.ELV_SelectItem(NotWorkingIcons, 0);
  if NotWorkingIcons.Scrollbars.VertBarVisible then
     NotWorkingIcons.HotTrack.Enabled:= False;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.NotWorkingIconsItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if CheckNameZZZ(TNotWorkingGameInfo(Item).eName) then
     Item.Checked:= False
  else
  case Item.Checked of
    True : Item.State:= Item.State-[esosGhosted];
    False: Item.State:= Item.State+[esosGhosted];
  end;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.ButtonSourceIconClick(Sender: TObject);
var
  NewFileStr: String;
begin
  // select a new file for source (zzz_nameoffile.ico)
  // "zzz*.ico"
  NewFileStr:= '';
  FormMAMu_IconsManager.DetectFileMD5;
  if not Assigned(FormSelectIconFile) then
     FormSelectIconFile:= TFormSelectIconFile.Create(nil);
  FormSelectIconFile.ShowModal;
  NewFileStr:= FormSelectIconFile.SelectedFileName;
  FreeAndNil(FormSelectIconFile);
  if NewFileStr = '' then
     Exit;
  if SameText(NewFileStr, FormMAMu_IconsManager.SourceIconFile) then
     Exit;

  FormMAMu_IconsManager.SourceIconFile:= NewFileStr;
  ReplaceZZZIcon;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.ButtonDeleteFilesClick(Sender: TObject);
begin
  mmResult:= mrOk;
  Close;
end;

procedure TFormDeleteMAMu_NotWorkingIcons.ButtonCancelClick(Sender: TObject);
begin
  mmResult:= mrCancel;
  Close;
end;

end.
