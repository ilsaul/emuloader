unit uArcadeMAMu_SelectIconFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, MPCommonObjects, EasyListview, ImgList,
  unitExIcon, IniFiles, ExtCtrls, ShadowLabel, Buttons, ButtonsEx;

type
  TFileInfo = class(TEasyItemStored)
  private
    fImageIndex: Integer;
    fFileName: String;
    fFileFolder: String;
    fSize: Int64;
    fSizeText: String;
    fDateTime: Integer;
    fDateTimeText: String;
  protected
    function GetCaptions(Column: Integer): WideString; override;
    function GetImageIndexes(Column: Integer): TCommonImageIndexInteger; override;
  public
    property eImageIndex: Integer read fImageIndex write fImageIndex;
    property eFileName: String read fFileName write fFileName;
    property eFileFolder: String read fFileFolder write fFileFolder;
    property eSize: Int64 read fSize write fSize;
    property eSizeText: String read fSizeText write fSizeText;
    property eDateTime: Integer read fDateTime write fDateTime;
    property eDateTimeText: String read fDateTimeText write fDateTimeText;
  end;

  TFormArcadeMAMu_SelectIconFile = class(TForm)
    FilesListView: TEasyListview;
    IL_IconFiles: TImageList;
    Shape1: TShape;
    LabelCurrentSourceFile: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    procedure FormShow(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function FilesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
  private
    { Private declarations }
    procedure LoadIconFiles;
  public
    { Public declarations }
    mmResult: Integer;
    SelectedFileName: String;
  end;

var
  FormArcadeMAMu_SelectIconFile: TFormArcadeMAMu_SelectIconFile;

implementation

{$R *.dfm}

uses uMain, uCommon, uArcadeMAMu_IconsManager;

function TFileInfo.GetCaptions(Column: Integer): WideString;
begin
  case Column of
    0: Result:= eFileName;
    5: Result:= eDateTimeText;
  end;
end;

function TFileInfo.GetImageIndexes(Column: Integer): TCommonImageIndexInteger;
begin
  if Column = 0 then
     Result:= eImageIndex
  else
     Result:= -1;
end;

procedure TFormArcadeMAMu_SelectIconFile.FormShow(Sender: TObject);
begin
  mmResult:= mrCancel;
  SelectedFileName:= '';
  FormMain.ELV_ResetNormalColors(FilesListView);
  LoadIconFiles;
  if FilesListView.Scrollbars.VertBarVisible then
     FilesListView.HotTrack.Enabled:= False;
end;

procedure TFormArcadeMAMu_SelectIconFile.ButtonCancelClick(Sender: TObject);
begin
  mmResult:= mrCancel;
  Close;
end;

procedure TFormArcadeMAMu_SelectIconFile.ButtonOkClick(Sender: TObject);
begin
  mmResult:= mrOk;
  Close;
end;

procedure TFormArcadeMAMu_SelectIconFile.LoadIconFiles;
var
  Loop: Integer;
  Icon32: TExIcon;
  icoIndex: Integer;
  Item: TEasyItem;
  iFile: String;

  function AddIconToList: Integer;
  var
    nIcon: TIcon;
  begin
    nIcon:= TIcon.Create;
    nIcon.Width:= 32; //Icon32.Images[icoLoop].Width;
    nIcon.Height:= 32; //Icon32.Images[icoLoop].Height;
    nIcon.Handle:= Icon32.Handle;
    Result:= IL_IconFiles.AddIcon(nIcon);
    nIcon.ReleaseHandle;
    FreeAndNil(nIcon);
  end;


begin
  if FormArcadeMAMu_IconsManager.ZZZIconList.Count = 0 then
     begin
       FormMain.ShowMessageBox('Error', 'No files found.', '    There are no files available '+
                       'in icons folder(s). Aborting...', 2);
       Exit;
     end;
  FilesListView.BeginUpdate;
  FilesListView.Items.ReIndexDisable:= True;
  for Loop:= 0 to FormArcadeMAMu_IconsManager.ZZZIconList.Count-1 do
  begin
    if FormMain.ScanFoldersIcon(FormArcadeMAMu_IconsManager.ZZZIconList.ValueFromIndex[Loop], '', idMAME, iFile, False) then
    begin
      Item:= FilesListView.Items.AddCustom(TFileInfo, nil);
      TFileInfo(Item).eImageIndex:= -1;

      if FormMain.LoadMAMu_Icon(iFile, Icon32, icoIndex, False) then
         begin
           Icon32.CurrentImage:= icoIndex;
           TFileInfo(Item).eImageIndex:= AddIconToList;
           Icon32.Releasehandle;
           FreeAndNil(Icon32);
         end;
      TFileInfo(Item).eFileName:= ExtractFileName(iFile);
      TFileInfo(Item).eFileFolder:= ExtractFilePath(iFile);
      TFileInfo(Item).eSize:= GetFileSize(iFile);
      TFileInfo(Item).eSizeText:= FormMain.GetSizeType(TFileInfo(Item).eSize, False);
      TFileInfo(Item).eDateTime:= FileAgeW(iFile);
      TFileInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TFileInfo(Item).eDateTime);
      Item.Details[1]:= 5;
    end;
  end;
  FilesListView.Items.ReIndexDisable:= False;
  FilesListView.Sort.SortAll;
  FilesListView.EndUpdate;
end;

procedure TFormArcadeMAMu_SelectIconFile.FilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Consolas';
       ACanvas.Font.Size:= 8;
     end;
  //FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormArcadeMAMu_SelectIconFile.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       if mmResult = mrOk then
          begin
            if FormMain.CheckSelected(FilesListView) then
               SelectedFileName:= TFileInfo(FilesListView.Selection.First).eFileName;
          end;
     end;
end;

function TFormArcadeMAMu_SelectIconFile.FilesListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
begin
  if Column.Index = 0 then
     begin
       DoDefault:= False;
       Result:= FormMain.iCompare(TFileInfo(Item1).eFileName, TFileInfo(Item2).eFileName);
     end;
end;

end.
