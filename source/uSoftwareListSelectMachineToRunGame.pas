unit uSoftwareListSelectMachineToRunGame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, ExtCtrls, Buttons, PanelEx,
  MPCommonObjects, MPCommonUtilities, EasyListview, AdvOfficeButtons, IniFiles;

type
  TFormSoftwareListMachineToRunGame = class(TForm)
    PanelMessages: TPanelEx;
    ButtonYes: TBitBtn;
    ButtonNo: TBitBtn;
    PanelTop: TPanelEx;
    MessageIcon: TImage;
    LabelTitle: TShadowLabel;
    LabelGameNameCloneOf: TShadowLabel;
    MachinesListView: TEasyListview;
    LabelUsage: TShadowLabel;
    LabelSoftwarelistTitleW: TShadowLabel;
    ButtonResetToCurrent: TBitBtn;
    ShowAvailableMachinesOnly: TAdvOfficeCheckBox;
    HidePreliminaryMachines: TAdvOfficeCheckBox;
    LabelTotalMachines: TShadowLabel;
    IconMediaType: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MachinesListViewColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure MachinesListViewItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure ShowAvailableMachinesOnlyClick(Sender: TObject);
    procedure ButtonResetToCurrentClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MachinesListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure MachinesListViewDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
  private
    { Private declarations }
    //SelectedMachineName: String;
    procedure ResizeForm;
    procedure ReselectItem(const MachineName: String);
    procedure ChangeFilters;
    procedure ReadWriteSettings(ReadMode: Boolean);
  public
    { Public declarations }
    CurrentMachineName: String;
  end;

var
  FormSoftwareListMachineToRunGame: TFormSoftwareListMachineToRunGame;

implementation

uses uMain, uCommon, uCommonCustom;

{$R *.dfm}


procedure TFormSoftwareListMachineToRunGame.FormKeyPress(Sender: TObject;
  var Key: Char);

  procedure CheckFocusedButton;
  begin
    if ButtonYes.Focused then
       ButtonYes.Click
    else
    if ButtonNo.Focused then
       ButtonNo.Click
    else
       ButtonYes.Click;
  end;

begin
  case FormMain.MenuArcadeBrowseGames.Tag of
    0:
      begin
        case Key of
          #13: CheckFocusedButton;
          #27: ButtonNo.Click;
        end;
      end;
    else
      begin
        case Key of
         'S', 's': CheckFocusedButton;
         'Q', 'q': ButtonNo.Click;
        end;
      end;
  end;
end;

procedure TFormSoftwareListMachineToRunGame.ResizeForm;
var
  iWidth, iHeight, iWidthDec: Integer;
begin
  if Screen.Width >= 1024 then
     Exit;

  if Screen.Height = 480 then
     begin
       iWidth:= 635;
       iHeight:= 100;
     end
  else
  if Screen.Width = 800 then
     begin
       iWidth:= 790;
       iHeight:= 0;
       MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width-5;
       MachinesListView.Header.Columns[1].Width:= MachinesListView.Header.Columns[1].Width-10;
       MachinesListView.Header.Columns[4].Width:= MachinesListView.Header.Columns[4].Width-10;
     end;

  iWidthDec:= FormSoftwareListMachineToRunGame.Width-iWidth+10;

  FormSoftwareListMachineToRunGame.Width:= FormSoftwareListMachineToRunGame.Width-iWidthDec;
  FormSoftwareListMachineToRunGame.Height:= FormSoftwareListMachineToRunGame.Height-iHeight;
  MachinesListView.Width:= MachinesListView.Width-iWidthDec;
  MachinesListView.Height:= MachinesListView.Height-iHeight;
  LabelTitle.Width:= LabelTitle.Width-iWidthDec;
  ButtonYes.Left:= ButtonYes.Left-iWidthDec;
  ButtonNo.Left:= ButtonNo.Left-iWidthDec;
  LabelSoftwarelistTitleW.Width:= LabelSoftwarelistTitleW.Width-iWidthDec;
end;

procedure TFormSoftwareListMachineToRunGame.FormCreate(Sender: TObject);
begin
  if PanelMessages.Tag = 1 then
     PanelTop.Color1:= $00e5f0fa // red
  else
     PanelTop.Color1:= $00faf0e5; // blue

  // $00faf0e5 // blue
  // $00e5f0fa // red
  // $00f0fae5 // green
  // $00e5fafa // yellow
  // $00eeeeee // silver

  FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType, IconMediaType, FormMain.MemGameInfo.eSoftwareExecParameter);
  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        LabelSoftwarelistTitleW.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+' - '+MediaTypeCustom[FormMain.MemGameInfo.eCustomMediaType, 0];
        //FormSoftwareListMachineToRunGame.Caption:= 'Select a Machine to Run the Custom Game With';
        FormMain.IL_StandardIconsExtraLarge.GetIcon(MaxGameID+FormMain.MemGameInfo.eCustomSystemID, MessageIcon.Picture.Icon);
        LabelGameNameCloneOf.Canvas.Lock;
        LabelGameNameCloneOf.Caption:= MediaTypeCustom[FormMain.MemGameInfo.eCustomMediaType, 0];
        LabelGameNameCloneOf.Caption:= LabelGameNameCloneOf.Caption+'; file extension '+ExtractFileExt(FormMain.MemGameInfo.eName);
        LabelGameNameCloneOf.Canvas.Unlock;
      end;
    False:
      begin
        LabelSoftwarelistTitleW.Caption:= FormMain.MemGameInfo.eCategory;// FormMain.GetSoftwareListTitle(FormMain.MemGameInfo.eSoftwareName);
        FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
                                                       MessageIcon.Picture.Icon);
        LabelGameNameCloneOf.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;
      end;
  end;

  LabelTitle.Caption:= FormMain.MemGameInfo.eTitle;
  //LabelGameNameCloneOf.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;

  if FormMain.MemGameInfo.eSoftwareUsageTip <> '' then
     begin
       LabelGameNameCloneOf.Caption:= LabelGameNameCloneOf.Caption+#13#10+
                                      'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;
       //LabelUsage.Caption:= 'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;
       //LabelUsage.Visible:= True;
     end
  else
     LabelGameNameCloneOf.Top:= IconMediaType.Top+1;

  //LabelSoftwarelistTitleW.Caption:= FormMain.MemGameInfo.eCategory;// FormMain.GetSoftwareListTitle(FormMain.MemGameInfo.eSoftwareName);
  BringToFront;
end;

procedure TFormSoftwareListMachineToRunGame.ReadWriteSettings(ReadMode: Boolean);
var
  INIFile: TMemIniFile;
  SectionStr: String;
begin
  if not FileExists(FormMain.FrontendPath+'el_extras.ini') then
     Exit;
  SectionStr:= 'SelectMachineSoftwareListGame';
  try
    INIFile:= TMemIniFile.Create(FormMain.FrontendPath+'el_extras.ini');
    if ReadMode then
       begin
         ShowAvailableMachinesOnly.Checked:= Boolean(INIFile.ReadInteger(SectionStr, 'ShowAvailableMachinesOnly', 0));
         HidePreliminaryMachines.Checked:= Boolean(INIFile.ReadInteger(SectionStr, 'HidePreliminaryMachines', 0));
       end
    else
       begin
         INIFile.WriteInteger(SectionStr, 'ShowAvailableMachinesOnly', Ord(ShowAvailableMachinesOnly.Checked));
         INIFile.WriteInteger(SectionStr, 'HidePreliminaryMachines', Ord(HidePreliminaryMachines.Checked));
       end;
  finally
    if not ReadMode then
       INIFile.UpdateFile;
    FreeAndNil(INIFile);
  end;
end;

procedure TFormSoftwareListMachineToRunGame.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(MachinesListView);
  ResizeForm;
  ReadWriteSettings(True);
  MachinesListView.Header.Columns[0].SortDirection:= esdAscending;
  MachinesListView.BeginUpdate;
  MachinesListView.Sort.SortAll;
  if MachinesListView.Scrollbars.VertBarVisible then
     MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  MachinesListView.EndUpdate(False);

  if CurrentMachineName <> '' then
     ReselectItem(CurrentMachineName);

  FormSoftwareListMachineToRunGame.Tag:= 0;
  ChangeFilters;
end;

procedure TFormSoftwareListMachineToRunGame.MachinesListViewColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       MachinesListView.BeginUpdate;
       MachinesListView.Sort.SortAll;
       MachinesListView.EndUpdate(False);
     end;
end;

procedure TFormSoftwareListMachineToRunGame.MachinesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  //FormMain.GetCanvasFontCustom(idMAME, Item.Tag, Item.StateImageIndex, Item.Captions[4], ACanvas);
  case FormMain.MemGameInfo.eIsCustomGame of
    True : FormMain.GetCanvasFontCustom(idMAME, Item.Tag, Item.StateImageIndex, Item.Captions[4], ACanvas);
    False: FormMain.GetCanvasFontCustom(FormMain.MemGameInfo.eSystemID, Item.Tag, Item.StateImageIndex, Item.Captions[4], ACanvas);
  end;
  if Item.Captions[1] = CurrentMachineName then
     begin
       Item.Bold:= True;
       ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
     end;
end;

procedure TFormSoftwareListMachineToRunGame.ReselectItem(const MachineName: String);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotalVisible(MachinesListView) then
     Exit;
  Item:= MachinesListView.Groups.FirstVisibleItem;
  repeat
    Item:= MachinesListView.Groups.NextVisibleItem(Item);
  until (Item = nil) or (Item.Captions[1] = MachineName);
  if Item = nil then
     Item:= MachinesListView.Groups.FirstVisibleItem;
  Item.Selected:= True;
  MachinesListView.Selection.FocusedItem:= Item;
  Item.MakeVisible(emvMiddle); //(emvAuto);
  MachinesListView.SetFocus;
end;

procedure TFormSoftwareListMachineToRunGame.ChangeFilters;
var
  Item: TEasyItem;
  KeepGame: Boolean;
  SelectedName: String;
begin
  if FormSoftwareListMachineToRunGame.Tag = 1 then
     Exit;
  if MachinesListView.Selection.First <> nil then
     SelectedName:= MachinesListView.Selection.First.Captions[1]
  else
     SelectedName:= CurrentMachineName;
  MachinesListView.Selection.ClearAll;
  MachinesListView.BeginUpdate;
  MachinesListView.Groups.MakeAllVisible;
  MachinesListView.Groups.Rebuild(True); // need to rebuild to list gets messed up
  Item:= MachinesListView.Groups.FirstItem;
  repeat
    KeepGame:= True;
    if (Item.Captions[1] <> SelectedName) and (Item.Captions[1] <> CurrentMachineName) then
    begin
      if ShowAvailableMachinesOnly.Checked then
         KeepGame:= Item.Tag = 0; // Tag holds eGameSetStatus field
      if KeepGame then
         begin
           if HidePreliminaryMachines.Checked then
              KeepGame:= Item.StateImageIndexes[6] <> 2;
         end;
    end;
    Item.Visible:= KeepGame;
    Item:= MachinesListView.Groups.NextItem(Item);
  until Item = nil;
  MachinesListView.Groups.Rebuild(True);
  MachinesListView.EndUpdate(False);
  LabelTotalMachines.Caption:= 'Total '+IntToStr(MachinesListView.Groups.VisibleItemCount);
  ReselectItem(SelectedName);
end;

procedure TFormSoftwareListMachineToRunGame.ShowAvailableMachinesOnlyClick(
  Sender: TObject);
begin
  ChangeFilters;
end;

procedure TFormSoftwareListMachineToRunGame.ButtonResetToCurrentClick(
  Sender: TObject);
begin
  ReselectItem(CurrentMachineName);
end;

procedure TFormSoftwareListMachineToRunGame.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     ReadWriteSettings(False);
end;

procedure TFormSoftwareListMachineToRunGame.MachinesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Item.Tag, MachinesListView);
end;

procedure TFormSoftwareListMachineToRunGame.MachinesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonYes.Click;
end;

end.
