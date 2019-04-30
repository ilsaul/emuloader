unit uArcadeSoftwareListSelectMachineToRunGame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, ExtCtrls, Buttons, PanelEx,
  MPCommonObjects, MPCommonUtilities, EasyListview, AdvOfficeButtons, IniFiles,
  ButtonsEx;

type
  TFormArcadeSoftwareListMachineToRunGame = class(TForm)
    BottomBar: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameName: TShadowLabel;
    LabelSoftwarelistTitleW: TShadowLabel;
    ButtonResetToCurrent: TBitBtnEx;
    ShowAvailableMachinesOnly: TAdvOfficeCheckBox;
    HidePreliminaryMachines: TAdvOfficeCheckBox;
    LabelTotalMachines: TShadowLabel;
    IconMediaType: TImage;
    FrameMachinesList: TPanelEx;
    MachinesListView: TEasyListview;
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
  FormArcadeSoftwareListMachineToRunGame: TFormArcadeSoftwareListMachineToRunGame;

implementation

uses uMain, uCommon, uCommonCustom;

{$R *.dfm}


procedure TFormArcadeSoftwareListMachineToRunGame.FormKeyPress(Sender: TObject;
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

procedure TFormArcadeSoftwareListMachineToRunGame.ResizeForm;
var
  iScreenWidth, iScreenHeight, iWidth, iHeight, iWidthDec: Integer;
begin
  exit;
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  iWidth:= 0;
  iHeight:= 0;
  iWidthDec:= 0;

  if iScreenHeight = 480 then
     begin
       iWidth:= 635;
       iHeight:= -100;
     end
  else
  if iScreenHeight >= 720 then
     begin
       if MachinesListView.Scrollbars.VertBarVisible then
          iHeight:= 100;
     end;

  if iScreenWidth = 800 then
     begin
       iWidth:= 790;
       iHeight:= 0;
       MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width-10;
       MachinesListView.Header.Columns[1].Width:= MachinesListView.Header.Columns[1].Width-10;
       MachinesListView.Header.Columns[2].Width:= MachinesListView.Header.Columns[2].Width-12;
       MachinesListView.Header.Columns[4].Width:= MachinesListView.Header.Columns[4].Width-10;
     end
  else
  if iScreenWidth >= 1152 then
     begin
       iWidth:= 200-4;
       MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width+75;
       MachinesListView.Header.Columns[1].Width:= MachinesListView.Header.Columns[1].Width+25;
       MachinesListView.Header.Columns[2].Width:= MachinesListView.Header.Columns[2].Width+75;
       MachinesListView.Header.Columns[4].Width:= MachinesListView.Header.Columns[4].Width+25;
     end;

  if iScreenWidth <= 800 then
     iWidthDec:= -(FormArcadeSoftwareListMachineToRunGame.Width-iWidth+10)
  else
  if iScreenWidth >= 1152 then
     iWidthDec:= iWidth;//(FormSoftwareListMachineToRunGame.Width+iWidth+10);

  FormArcadeSoftwareListMachineToRunGame.Width:= FormArcadeSoftwareListMachineToRunGame.Width+iWidthDec;
  FormArcadeSoftwareListMachineToRunGame.Height:= FormArcadeSoftwareListMachineToRunGame.Height+iHeight;

  FrameMachinesList.Width:= FrameMachinesList.Width+iWidthDec;
  FrameMachinesList.Height:= FrameMachinesList.Height+iHeight;

  MachinesListView.Width:= MachinesListView.Width+iWidthDec-4;
  MachinesListView.Height:= MachinesListView.Height+iHeight;
  LabelGameTitle.Width:= LabelGameTitle.Width+iWidthDec;
  ButtonYes.Left:= ButtonYes.Left+iWidthDec;
  ButtonNo.Left:= ButtonNo.Left+iWidthDec;
  LabelSoftwarelistTitleW.Width:= LabelSoftwarelistTitleW.Width+iWidthDec;
end;

procedure TFormArcadeSoftwareListMachineToRunGame.FormCreate(Sender: TObject);
begin
  FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame, FormMain.MemGameInfo.eMediaType, IconMediaType, FormMain.MemGameInfo.eSoftwareExecParameter, True);

  FormMain.LoadGameIconIntoImage(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, GameIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eIsCustomGame);

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        LabelSoftwarelistTitleW.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+' - '+MediaTypeCustom[FormMain.MemGameInfo.eCustomMediaType, 0];
        //FormMain.IL_StandardIconsExtraLarge.GetIcon(MaxGameID+FormMain.MemGameInfo.eCustomSystemID, MessageIcon.Picture.Icon);
        LabelGameName.Caption:= 'file: '+FormMain.MemGameInfo.eName;
      end;
    False:
      begin
        LabelSoftwarelistTitleW.Caption:= FormMain.MemGameInfo.eCategory;

        //FormMain.IL_StandardIconsExtraLarge.GetIcon(FormMain.GetMAMEImageIndex(FormMain.MemGameInfo.eROMIdentification, FormMain.MemGameInfo.eSoftwareName),
        //                                               MessageIcon.Picture.Icon);
        LabelGameName.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;
      end;
  end;

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  if FormMain.MemGameInfo.eSoftwareUsageTip <> '' then
     begin
       LabelGameName.Caption:= LabelGameName.Caption+#13#10+
                               'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;
     end;
  //else
  //   LabelGameNameCloneOf.Top:= IconMediaType.Top+1;

  BringToFront;
end;

procedure TFormArcadeSoftwareListMachineToRunGame.ReadWriteSettings(ReadMode: Boolean);
var
  INIFile: TMemIniFile;
  SectionStr: String;
begin
  if not FileExists(FormMain.GetFrontendExtraIniFile) then
     Exit;
  SectionStr:= 'SelectMachineSoftwareListGame';
  try
    INIFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
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

procedure TFormArcadeSoftwareListMachineToRunGame.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(MachinesListView);
  ResizeForm;
  if IsNightMode then
  begin
    SetFormColors(FormArcadeSoftwareListMachineToRunGame, TopBar, BottomBar, LabelGameTitle, LabelGameName, FormMain.MemGameInfo.eGameSetStatus, IsNightMode);
    SetLabelColors(LabelTotalMachines, LabelGameName.Font.Color, LabelGameName.ShadowColor);
    SetLabelColors(LabelSoftwarelistTitleW, clrLightRed, clrLightBlack);

    FrameMachinesList.Color1:= FormArcadeSoftwareListMachineToRunGame.Color;

    FormMain.SetEasyListViewColors(MachinesListView, FormArcadeSoftwareListMachineToRunGame.Color, clWhite);

    SetCheckBoxColors(ShowAvailableMachinesOnly, item_caption_active_color[1], item_caption_active_shadow_color[1]);//clWhite, clNavy);
    SetCheckBoxColors(HidePreliminaryMachines, item_caption_active_color[1], item_caption_active_shadow_color[1]);//clWhite, clNavy);

    FormMain.SetButtonExColors(ButtonYes);
    FormMain.SetButtonExColors(ButtonNo);
    FormMain.SetButtonExColors(ButtonResetToCurrent);

    FormMain.ELV_SetRibbonNightColors(0, MachinesListView, True);
  end;

  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, IsNightMode); // change top bar color based on game set status

  ReadWriteSettings(True);
  MachinesListView.Header.Columns[0].SortDirection:= esdAscending;
  MachinesListView.BeginUpdate;
  MachinesListView.Sort.SortAll;
  if MachinesListView.Scrollbars.VertBarVisible then
     MachinesListView.Header.Columns[0].Width:= MachinesListView.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
  MachinesListView.EndUpdate(False);

  if CurrentMachineName <> '' then
     ReselectItem(CurrentMachineName);

  FormArcadeSoftwareListMachineToRunGame.Tag:= 0;
  ChangeFilters;
end;

procedure TFormArcadeSoftwareListMachineToRunGame.MachinesListViewColumnClick(
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

procedure TFormArcadeSoftwareListMachineToRunGame.MachinesListViewItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  FormMain.ELV_ItemPaintText_General(MachinesListView, Item, ACanvas);
  FormMain.GetCanvasDefaultFont(ACanvas, Item.Tag, Item.StateImageIndexes[6], IsNightMode);
  if Item.Captions[1] = CurrentMachineName then
     begin
       Item.Bold:= True;
       ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
     end;

end;

procedure TFormArcadeSoftwareListMachineToRunGame.ReselectItem(const MachineName: String);
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

procedure TFormArcadeSoftwareListMachineToRunGame.ChangeFilters;
var
  Item: TEasyItem;
  KeepGame: Boolean;
  SelectedName: String;
begin
  if FormArcadeSoftwareListMachineToRunGame.Tag = 1 then
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

procedure TFormArcadeSoftwareListMachineToRunGame.ShowAvailableMachinesOnlyClick(
  Sender: TObject);
begin
  ChangeFilters;
end;

procedure TFormArcadeSoftwareListMachineToRunGame.ButtonResetToCurrentClick(
  Sender: TObject);
begin
  ReselectItem(CurrentMachineName);
end;

procedure TFormArcadeSoftwareListMachineToRunGame.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     ReadWriteSettings(False);
end;

procedure TFormArcadeSoftwareListMachineToRunGame.MachinesListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       if IsNightMode then
          FormMain.ELV_SetRibbonNightColors(Item.Tag, MachinesListView)
       else
          FormMain.ELV_SetSelectRibbon(Item.Tag, MachinesListView);
     end;
end;

procedure TFormArcadeSoftwareListMachineToRunGame.MachinesListViewDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonYes.Click;
end;

end.
