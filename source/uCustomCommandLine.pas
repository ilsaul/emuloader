unit uCustomCommandLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, GR32_Image, IniFiles,
  ImgList, MPCommonObjects, EasyListview;

type
  TFormCustomCommandLine = class(TForm)
    TopBar: TImage32;
    ParametersBox: TGroupBox;
    ButtonMoveParameterDown: TButton;
    ButtonParameterDelete: TButton;
    ButtonMoveParameterUp: TButton;
    ButtonUpdate: TButton;
    LabelPrefixToAdd: TLabel;
    PrefixToAdd: TEdit;
    LabelFieldToAdd: TLabel;
    FieldToAdd: TComboBoxEx;
    LabelSuffixToAdd: TLabel;
    SuffixToAdd: TEdit;
    ButtonAddParameter: TButton;
    ParameterSurroundWithQuotes: TCheckBox;
    PrefixSendLeadingSpace: TCheckBox;
    AdditionalParametersBox: TGroupBox;
    AdditionalParameters: TEdit;
    LabelGameDescription: TLabel;
    BottomBar: TImage32;
    ButtonReload: TButton;
    ButtonClearCustomCommandLine: TButton;
    ButtonPreview: TButton;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    LabelCustomEmulatorFile: TGroupBox;
    EmulatorBatchFile: TEdit;
    ButtonEmulatorBatchFileBrowse: TButton;
    ParametersListView: TEasyListview;
    LabelIniFile: TLabel;
    procedure ButtonEmulatorBatchFileBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonClearCustomCommandLineClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonAddParameterClick(Sender: TObject);
    procedure ButtonMoveParameterUpClick(Sender: TObject);
    procedure ButtonParameterDeleteClick(Sender: TObject);
    procedure ButtonReloadClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonPreviewClick(Sender: TObject);
    procedure ParametersListViewKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ParametersListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure EmulatorBatchFileEnter(Sender: TObject);
    procedure EmulatorBatchFileExit(Sender: TObject);
    procedure ParametersListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    FileNameFullPath: String;
    procedure WriteCustomCommandLine;
  public
    { Public declarations }
  end;

var
  FormCustomCommandLine: TFormCustomCommandLine;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormCustomCommandLine.WriteCustomCommandLine;
var
  CommandLineFile: THashedStringList;
  pStr: String;

  function GenerateParams(pIndex: ShortInt): String;
  var
    Item: TEasyItem;
  begin
    Result:= '';
    if not FormMain.CheckTotal(ParametersListView) then
       Exit;
    Item:= ParametersListView.Groups.FirstItem;
    repeat
      case pIndex of
        0: // prefix
          begin
            if Item.Index = 0 then
               Result:= Item.Caption
            else
               Result:= Result+'¬'+Item.Caption;
          end;
        1: // field
          begin
            if Item.Index = 0 then
               Result:= IntToStr(Item.StateImageIndex)
            else
               Result:= Result+'¬'+IntToStr(Item.StateImageIndex);
          end;
        2: // sufix
          begin
            if Item.Index = 0 then
               Result:= Item.Captions[2]
            else
               Result:= Result+'¬'+Item.Captions[2];
          end;
        3: // quotes
          begin
            if Item.Index = 0 then
               Result:= IntToStr(Ord(Boolean(Item.Captions[3] = 'Yes')))
            else
               Result:= Result+'¬'+IntToStr(Ord(Boolean(Item.Captions[3] = 'Yes')));
          end;
      end;
      Item:= ParametersListView.Groups.NextItem(Item);
    until Item = nil;
    if Result <> '' then
       Result:= Result+';';
  end;

begin
  if FormMain.CheckReadOnly(FileNameFullPath) then
     Exit;

  CommandLineFile:= THashedStringList.Create;
  CommandLineFile.BeginUpdate;
  CommandLineFile.Add('FileName='+EmulatorBatchFile.Text);
  pStr:= GenerateParams(0);
  CommandLineFile.Add('Prefix='+pStr);
  pStr:= GenerateParams(1);
  CommandLineFile.Add('PrefixSendLeadingSpace='+IntToStr(Ord(PrefixSendLeadingSpace.Checked)));
  CommandLineFile.Add('Parameters='+pStr);
  pStr:= GenerateParams(2);
  CommandLineFile.Add('Suffix='+pStr);
  pStr:= GenerateParams(3);
  CommandLineFile.Add('Quotes='+pStr);
  CommandLineFile.Add('AdditionalParameters='+AdditionalParameters.Text);
  CommandLineFile.EndUpdate;
  case CheckAndCreateFolder(ExtractFilePath(FileNameFullPath)) of
    True : CommandLineFile.SaveToFile(FileNameFullPath);
    False: GenerateMessage('Error', 'Save Custom Command Line', 'Failed to update file.'+#13#10+
                           Format('Could not save "%s" file. Folder was '+
                           'not found and could not be created.', [FileNameFullPath]), 2, False, 1);
  end;
  FreeAndNil(CommandLineFile);
end;

procedure TFormCustomCommandLine.ButtonEmulatorBatchFileBrowseClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(2, 'Select a file', EmulatorBatchFile, False);
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormCustomCommandLine.FormShow(Sender: TObject);
begin
  //FormMain.LoadBarImage(TopBar, 'msgbox_top.png');
  //FormMain.LoadSystemTopIcon(FormCustomCommandLine, FormMain.MemGameInfo.eSystemID);
  //FormMain.LoadBarBottom(BottomBar);
  FormMain.ELV_ResetNormalColors(ParametersListView);
  //FormMain.GetGameROMIcon(TopBar);

  case TopBar.Tag of
    0, 1: LabelGameDescription.Caption:= FormMain.MemGameInfo.eTitle;
       2: LabelGameDescription.Caption:= FormMain.GetArcadeEmulatorDescription(FormMain.MemGameInfo.eSystemID);
  end;
  case TopBar.Tag of
    0:
      begin
        FileNameFullPath:= FormMain.MemGameInfo.eName;
        Caption:= Caption+' [Game]';
      end;
    1:
      begin
        FileNameFullPath:= ChangeFileExt(FormMain.MemGameInfo.eDriverName, '');
        Caption:= Caption+' [Driver]';
      end;
    2:
      begin
        FileNameFullPath:= FormMain.GetArcadeSystemIniSection(FormMain.MemGameInfo.eSystemID, True);
        Caption:= Caption+' [System]';
      end;
  end;

  FileNameFullPath:= FormMain.GetCustomCommandLineFileFullPath(FileNameFullPath, FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eSystemType, FormMain.MemGameInfo.eSoftwareName);
  LabelIniFile.Caption:= '> File: "'+FileNameFullPath+'"';
  LabelGameDescription.Caption:= LabelGameDescription.Caption;
  ButtonReload.Click;
end;

procedure TFormCustomCommandLine.ButtonClearCustomCommandLineClick(Sender: TObject);
begin
  EmulatorBatchFile.Clear;
  PrefixToAdd.Clear;
  PrefixSendLeadingSpace.Checked:= True;
  FormMain.ClearListView(ParametersListView);
  SuffixToAdd.Clear;
  ParameterSurroundWithQuotes.Checked:= False;
  AdditionalParameters.Clear;
end;

procedure TFormCustomCommandLine.ButtonOkClick(Sender: TObject);
begin
  if EmulatorBatchFile.Text = '' then
     FormMain.BlinkBkEdit(EmulatorBatchFile)
  else
     begin
       WriteCustomCommandLine;
       Close;
     end;
end;

procedure TFormCustomCommandLine.ButtonAddParameterClick(Sender: TObject);
begin
  if FieldToAdd.ItemIndex = -1 then
     Exit;
  ParametersListView.BeginUpdate;
  with ParametersListView.Items.Add do
  begin
    Caption:= PrefixToAdd.Text;
    ImageIndex:= FieldToAdd.ItemsEx[FieldToAdd.ItemIndex].ImageIndex; // real index of column
    StateImageIndex:= FieldToAdd.ItemIndex; // index of item in the FieldToAdd
    Captions[1]:= FieldToAdd.ItemsEx[FieldToAdd.ItemIndex].Caption;
    Captions[2]:= SuffixToAdd.Text;
    case ParameterSurroundWithQuotes.Checked of
      True : Captions[3]:= 'Yes';
      False: Captions[3]:= 'No';
    end;
  end;
  ParametersListView.EndUpdate;
end;

procedure TFormCustomCommandLine.ButtonMoveParameterUpClick(
  Sender: TObject);
begin
  FormMain.ELV_MoveItem(ParametersListView, Boolean(TButton(Sender).Tag));
end;

procedure TFormCustomCommandLine.ButtonParameterDeleteClick(
  Sender: TObject);
begin
  ParametersListView.Selection.DeleteSelected;
  ParametersListView.SetFocus;
end;

procedure TFormCustomCommandLine.ButtonReloadClick(Sender: TObject);
begin
  if FormMain.ReadCustomCommandLine(FileNameFullPath) = '' then
     begin
       // add a name field
       SetComboBoxEx(FieldToAdd, 1 , True); // Name field
       ButtonAddParameter.Click;
     end;
end;

procedure TFormCustomCommandLine.ButtonUpdateClick(Sender: TObject);
begin
  case FormMain.CheckSelected(ParametersListView) of
    True:
      begin
        ParametersListView.Selection.First.ImageIndex:= FieldToAdd.ItemsEx[FieldToAdd.ItemIndex].ImageIndex;
        ParametersListView.Selection.First.StateImageIndex:= FieldToAdd.ItemIndex;
        ParametersListView.Selection.First.Caption:= PrefixToAdd.Text;
        ParametersListView.Selection.First.Captions[1]:= FieldToAdd.ItemsEx[FieldToAdd.ItemIndex].Caption;
        ParametersListView.Selection.First.Captions[2]:= SuffixToAdd.Text;
        case ParameterSurroundWithQuotes.Checked of
          True : ParametersListView.Selection.First.Captions[3]:= 'Yes';
          False: ParametersListView.Selection.First.Captions[3]:= 'No';
        end;
      end;
    False:
      begin
        GenerateMessage('Error', 'Cannot update an empty parameter.', 'You did not selected a parameter to update. '+
                        'Please select one to continue.', 2, False, 1);
      end;
  end;
end;

procedure TFormCustomCommandLine.ButtonPreviewClick(Sender: TObject);
var
  cmdLine, sPrefix, sParameters, sSuffix, sQuotes: String;
  Item: TEasyItem;
begin
  if EmulatorBatchFile.Text = '' then
     begin
       FormMain.BlinkBkEdit(EmulatorBatchFile);
       Exit;
     end;
  cmdLine:= '';
  if FormMain.CheckTotal(ParametersListView) then
     begin
       Item:= ParametersListView.Groups.FirstItem;
       repeat
         sPrefix:= Item.Caption;
         if (cmdLine <> '') and PrefixSendLeadingSpace.Checked then
            sPrefix:= ' '+sPrefix;

         sParameters:= FormMain.GetBatchFileFieldIndex(IntToStr(Item.StateImageIndex));
         sSuffix:= Item.Captions[2];
         case SameText(Item.Captions[3], 'No') of
           True : sQuotes:= '';
           False: sQuotes:= '"';
         end;
         
         case StrToInt(sParameters) of
           00: cmdLine:= cmdLine+sPrefix+sQuotes+FormMain.MemGameInfo.eTitle+sQuotes+sSuffix;
           09: cmdLine:= cmdLine+sPrefix+sQuotes+FormMain.MemGameInfo.eName+sQuotes+sSuffix;
           10: cmdLine:= cmdLine+sPrefix+sQuotes+FormMain.MemGameInfo.eClone+sQuotes+sSuffix;
           11: cmdLine:= cmdLine+sPrefix+sQuotes+FormMain.MemGameInfo.eDriverName+sQuotes+sSuffix;
           //-2: cmdLine:= cmdLine+sPrefix+sQuotes+
           //              aControlType[StrToInt(FormMain.MountControlTypesList(FormMain.MemGameInfo.eControls, nil, nil, True)), 0]+
           //              sQuotes+sSuffix;
         end;
         Item:= ParametersListView.Groups.NextItem(Item);
       until Item = nil;
     end;
  if cmdLine <> '' then
     cmdLine:= SystemStr+EmulatorBatchFile.Text+SystemStr+' '+cmdLine
  else
     cmdLine:= SystemStr+EmulatorBatchFile.Text+SystemStr;
  if AdditionalParameters.Text <> '' then
     cmdLine:= cmdLine+' '+AdditionalParameters.Text;
  if cmdLine <> '' then
     GenerateMessage('Custom Command Line', 'This is a preview of the command line that will be used to run the game.',
                     cmdLine, 2);
end;

procedure TFormCustomCommandLine.ParametersListViewKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
     ButtonParameterDelete.Click;
end;

procedure TFormCustomCommandLine.ParametersListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  Index: Integer;
begin
  if not Item.Selected then
     Exit;

  PrefixToAdd.Text:= Item.Caption;
  Index:= FieldToAdd.Items.IndexOf(Item.Captions[1]);
  if Index = -1 then
     Index:= 0;
  SetComboBoxEx(FieldToAdd, Index, True);
  SuffixToAdd.Text:= Item.Captions[2];
  ParameterSurroundWithQuotes.Checked:= Item.Captions[3] = 'Yes';
end;

procedure TFormCustomCommandLine.EmulatorBatchFileEnter(Sender: TObject);
begin
  TEdit(Sender).Color:= clWindow;
end;

procedure TFormCustomCommandLine.EmulatorBatchFileExit(Sender: TObject);
begin
  TEdit(Sender).Color:= $00fafafa;
end;

procedure TFormCustomCommandLine.ParametersListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;


end.
