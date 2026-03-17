unit uSelectFile;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  MPCommonObjects, MPCommonUtilities, EasyListview,
  ShadowLabel, Buttons, PanelEx, EditEx, ButtonsEx;

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
    SelectFile_FilesListView: TEasyListview;
    PanelBottom: TPanelEx;
    LabelShortcuts: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    TopBar: TPanelEx;
    SystemIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelEmulatorVersion: TShadowLabel;
    NewFilename: TEditEx;
    LabelNewFilename: TShadowLabel;
    procedure FormShow(Sender: TObject);
    procedure NewFilenameKeyPress(Sender: TObject; var Key: Char);
    procedure SelectFile_FilesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure SelectFile_FilesListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function SelectFile_FilesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure SelectFile_FilesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure SelectFile_FilesListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure SelectFile_FilesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    procedure LoadFilesList;
    procedure Resize4K;
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

procedure TFormSelectFile.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormSelectFile do
  begin
    ClientWidth:= 1200;
    ClientHeight:= 700;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, SystemIcon, nil, LabelGameTitle, 1040, LabelEmulatorVersion, 1040);
    LabelEmulatorVersion.Left:= LabelGameTitle.Left;

    FormMain.Set4KLabelSpecs(LabelNewFilename, 10, 548, 573, 31, 16);
    FormMain.Set4KEditSpecs(NewFilename, 591, 543, 600, 36, 16);

    FormMain.Set4KListViewSpecs(SelectFile_FilesListView, 10, 160, 1180, 330, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(SelectFile_FilesListView);
    SelectFile_FilesListView.ShowThemedBorder:= True;

    SelectFile_FilesListView.PaintInfoColumn.Border:= 4;        // set default value
    SelectFile_FilesListView.PaintInfoColumn.CaptionIndent:= 4; // set default value
    SelectFile_FilesListView.CellSizes.Report.Height:= 37;

    SelectFile_FilesListView.Header.Columns[0].Width:= 776;
    SelectFile_FilesListView.Header.Columns[1].Width:= 180;
    SelectFile_FilesListView.Header.Columns[2].Width:= 220;

    FormMain.Set4KLabelSpecs(FilesFolder, 10, 500, 1180, 28, 16);

    PanelBottom.Height:= 100;
    FormMain.Set4KLabelSpecs(LabelShortcuts, 281, 5, -1, -1, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel);
    ButtonOk.Top:=     45;
    ButtonCancel.Top:= 45;
  end;
end;

procedure TFormSelectFile.LoadFilesList;
var
  Loop: Integer;
  Item: TEasyItem;
begin
  if tmpList.Count > 0 then
     begin
       SelectFile_FilesListView.BeginUpdate;
       SelectFile_FilesListView.Items.ReIndexDisable:= True;
       for Loop:= 0 to tmpList.Count-1 do
       begin
         Item:= SelectFile_FilesListView.Items.AddCustom(TFileInfo, nil);
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
         TFileInfo(Item).eDateTime:= FileAgeW(tmpList[Loop]);
         TFileInfo(Item).eDateTimeText:= FormMain.GetDateTimeStr(TFileInfo(Item).eDateTime);
       end;
       SelectFile_FilesListView.Items.ReIndexDisable:= False;
       SelectFile_FilesListView.Sort.SortAll;
       SelectFile_FilesListView.EndUpdate;
       if SelectFile_FilesListView.Scrollbars.VertBarVisible then
          begin
            SelectFile_FilesListView.Header.Columns[0].Width:= SelectFile_FilesListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
            SelectFile_FilesListView.Sort.SortAll;
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
  Resize4K;
  FormMain.ELV_ResetNormalColors(SelectFile_FilesListView);

  SetFormColors(FormSelectFile, TopBar, PanelBottom, LabelGameTitle, LabelEmulatorVersion, nil, -1, IsNightMode);
  SetColorEmulatorTopBar(TopBar, idMAME, True);

  if IsNightMode then
     begin
       SetLabelColors(FilesFolder, clSilver);
       SetLabelColors(LabelNewFilename, item_caption_active_color[1]);
       SetLabelColors(LabelShortcuts, clrLightRed);
       SetEditNightColors(NewFileName);

       FormMain.SetEasyListViewColors(SelectFile_FilesListView, menu_background_color[1], item_caption_active_color[1], -1, clrBorderGroupBoxGrayBk);
       FormMain.SetEasyListViewHeaderColors(SelectFile_FilesListView, True, False, Is4KMode, True);
       //FormMain.SetEasyListViewColors(SelectFile_FilesListView, FormSelectFile.Color, clWhite, -1, clGray);
       //FormMain.SetEasyListViewHeaderColors(SelectFile_FilesListView, True, False, False);
       FormMain.ELV_SetRibbonNightColors(0, SelectFile_FilesListView, True);
       FormMain.SetWin10DarkScrollBar(SelectFile_FilesListView);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
     end;


  //SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar); // change top bar color based on game set status

  LoadFilesList;
end;

procedure TFormSelectFile.NewFilenameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['\', '/', ':', '*', '?', '"', '<', '>', '|'] then
     Key:= Char(0);
end;

procedure TFormSelectFile.SelectFile_FilesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       NewFilename.Text:= TFileInfo(Item).eFileName;
       if FormSelectFile.Tag in [27..31] then
          FilesFolder.Caption:= TFileInfo(Item).eFileFolder;
     end;
end;

procedure TFormSelectFile.SelectFile_FilesListViewKeyAction(
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
        if FormMain.CheckSelected(SelectFile_FilesListView) then
           begin
             if FormSelectFile.Tag in [27..31] then
                FolderStr:= TFileInfo(SelectFile_FilesListView.Selection.First).eFileFolder
             else
                FolderStr:= FilesFolder.Caption;
                
             if DeleteFile(FolderStr+TFileInfo(SelectFile_FilesListView.Selection.First).eFileName) then
                SelectFile_FilesListView.Selection.DeleteSelected(True);
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

function TFormSelectFile.SelectFile_FilesListViewItemCompare(
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
    2: Result:= CompareIntValue(TFileInfo(gItem1).eDateTime, TFileInfo(gItem2).eDateTime);
  end;
end;

procedure TFormSelectFile.SelectFile_FilesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       SelectFile_FilesListView.BeginUpdate;
       SelectFile_FilesListView.Sort.SortAll;
       SelectFile_FilesListView.EndUpdate(False);
     end;
end;

procedure TFormSelectFile.SelectFile_FilesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonOk.Click;
end;

procedure TFormSelectFile.SelectFile_FilesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Is4KMode then
     if Position = 2 then
        ACanvas.Font.Size:= ACanvas.Font.Size-1;
end;

end.
