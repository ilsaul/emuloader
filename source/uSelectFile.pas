unit uSelectFile;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  MPCommonObjects, MPCommonUtilities, EasyListview,
  ShadowLabel, Buttons, PanelEx;

type
  TFileInfo = class(TEasyItemStored)
  private
    //fImageIndex: Integer;
    fFileName: String;
    fFileFolder: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    //function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    //property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eFileName: String read fFileName write fFileName;
    property eFileFolder: String read fFileFolder write fFileFolder;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
  end;

type
  TFormSelectFile = class(TForm)
    FilesFolder: TShadowLabel;
    FilesListView: TEasyListview;
    PanelEx1: TPanelEx;
    LabelShortcuts: TShadowLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelGameTitle: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameNameCloneOf: TShadowLabel;
    NewFilename: TEdit;
    LabelNewFilename: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure NewFilenameKeyPress(Sender: TObject; var Key: Char);
    procedure FilesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function FilesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure FilesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure FilesListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    procedure LoadFilesList;
  public
    { Public declarations }
    MsgResult, sysID: Integer;
    tmpList: THashedStringList;
  end;

var
  FormSelectFile: TFormSelectFile;

implementation

{$R *.dfm}

uses uMain, uCommon;

function TFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFileName;
    1: Result:= eSizeText;
    2: Result:= eDateTimeText;
  end;
end;

{function TFileInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     Result:= eImageIndex
  else
     Result:= -1;
end;}

procedure TFormSelectFile.LoadFilesList;
var
  Loop: Integer;
  Item: TEasyItem;
begin
  if tmpList.Count > 0 then
     begin
       FilesListView.BeginUpdate;
       FilesListView.Items.ReIndexDisable:= True;
       for Loop:= 0 to tmpList.Count-1 do
       begin
         Item:= FilesListView.Items.AddCustom(TFileInfo, nil);
         {case FormSelectFile.Tag of
           20, 21: TFileInfo(Item).eImageIndex:= 18; // Input
           //   22: TFileInfo(Item).ImageIndex:= 16; // Save state
               23: TFileInfo(Item).eImageIndex:= 00; // Wave
           24, 25: TFileInfo(Item).eImageIndex:= 06; // MNG, AVI
           26, 29, 30: TFileInfo(Item).eImageIndex:= 07; // Left panel filter, Select Font File
           27, 28, 31: TFileInfo(Item).eImageIndex:= 06; // PNG
         end;}
         TFileInfo(Item).eFileName:= ExtractFileName(tmpList[Loop]);
         TFileInfo(Item).eFileFolder:= ExtractFilePath(tmpList[Loop]);
         TFileInfo(Item).eSize:= GetFileSize(tmpList[Loop]);
         TFileInfo(Item).eSizeText:= FormMain.GetSizeType(TFileInfo(Item).eSize, False);
         TFileInfo(Item).eDateTime:= FileAge(tmpList[Loop]);
         TFileInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TFileInfo(Item).eDateTime);
       end;
       FilesListView.Items.ReIndexDisable:= False;
       FilesListView.Sort.SortAll;
       FilesListView.EndUpdate;
       if FilesListView.Scrollbars.VertBarVisible then
          begin
            FilesListView.Header.Columns[0].Width:= FilesListView.Header.Columns[0].Width-16;
            FilesListView.Sort.SortAll;
          end;
     end;
  FreeAndNil(tmpList);

  if FormSelectFile.Tag in [20, 21, 23, 24, 25] then
     NewFilename.Text:= FormMain.MemGameInfo.eName;

  case FormSelectFile.Tag of
    20, 21: NewFilename.Text:= NewFilename.Text+'.inp'; // playback / record input
    23: NewFilename.Text:= NewFilename.Text+'.wav'; // record wave output
    24: NewFilename.Text:= NewFilename.Text+'.mng'; // record mng output
    25: NewFilename.Text:= NewFilename.Text+'.avi'; // record avi output
  end;
  //case FormSelectFile.Tag of
  //  23: NewFilename.Text:= FormMain.MemGameInfo.eName+'.wav'; // record wave output
  //  24: NewFilename.Text:= FormMain.MemGameInfo.eName+'.mng'; // record mng output
  //  25: NewFilename.Text:= FormMain.MemGameInfo.eName+'.avi'; // record avi output
  //end;
end;

procedure TFormSelectFile.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(FilesListView);
  if not (FormSelectFile.Tag in [26, 28, 29, 31]) then
     begin
       //FormMain.GetGameROMIcon(GameIcon);
       //LabelGameDetails.Caption:= 'name: '+FormMain.MemGameInfo.eName;
       //if FormMain.GameIsClone(FormMain.MemGameInfo.eClone) then
       //   LabelGameDetails.Caption:= LabelGameDetails.Caption+Format(' [clone of: %s]', [FormMain.MemGameInfo.eClone]);
       //if FormMain.ValidateBiosName(FormMain.MemGameInfo.eBiosName, FormMain.MemGameInfo.eName) then
       //   LabelGameDetails.Caption:= LabelGameDetails.Caption+Format(' [bios: %s]', [FormMain.MemGameInfo.eBiosName]);
     end
  else
     begin
       //PanelGameStatus.Visible:= False;
       //TopBar.Visible:= False;
       //FormMain.IL IL_StandardIconsExtraLarge.GetIcon(MemGameInfo.eROMIdentification, GameIcon);
     end;
  //LabelGameTitle.Caption:= LabelGameTitle2;
  LoadFilesList;
end;

procedure TFormSelectFile.NewFilenameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['\', '/', ':', '*', '?', '"', '<', '>', '|'] then
     Key:= Char(0)
end;

procedure TFormSelectFile.FilesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       NewFilename.Text:= TFileInfo(Item).eFileName;
       if FormSelectFile.Tag in [27..31] then
          FilesFolder.Caption:= TFileInfo(Item).eFileFolder;
     end;
end;

procedure TFormSelectFile.FilesListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
var
  FolderStr: String;
begin
  case CharCode of
    VK_RETURN: ButtonOk.Click;
    VK_ESCAPE: ButtonCancel.Click;
    VK_DELETE:
      begin
        if FormMain.CheckSelected(FilesListView) then
           begin
             if FormSelectFile.Tag in [27..31] then
                FolderStr:= TFileInfo(FilesListView.Selection.First).eFileFolder
             else
                FolderStr:= FilesFolder.Caption;
                
             if DeleteFile(FolderStr+TFileInfo(FilesListView.Selection.First).eFileName) then
                FilesListView.Selection.DeleteSelected(True);
           end;
      end;
  end;
end;

procedure TFormSelectFile.FormCreate(Sender: TObject);
begin
  tmpList:= THashedStringList.Create;
  FilesFolder.Caption:= '';
end;

procedure TFormSelectFile.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     MsgResult:= ModalResult;
end;

procedure TFormSelectFile.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

function TFormSelectFile.FilesListViewItemCompare(
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
    2: CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
  end;
end;

procedure TFormSelectFile.FilesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       FilesListView.BeginUpdate;
       FilesListView.Sort.SortAll;
       FilesListView.EndUpdate(False);
     end;
end;

procedure TFormSelectFile.FilesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonOk.Click;
end;

procedure TFormSelectFile.FilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Position = 2 then
     ACanvas.Font.Size:= ACanvas.Font.Size-1;
end;

end.
