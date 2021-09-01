unit uArcadeSoftwareListSelectMachineToRunGame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, ExtCtrls, Buttons, PanelEx,
  MPCommonObjects, MPCommonUtilities, EasyListview, AdvOfficeButtons, IniFiles,
  ButtonsEx;

type
  TFormArcadeSoftwareListMachineToRunGame = class(TForm)
    PanelBottom: TPanelEx;
    ButtonYes: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    TopBar: TPanelEx;
    GameIcon: TImage;
    LabelGameTitle: TShadowLabel;
    LabelGameName: TShadowLabel;
    LabelSoftwarelistTitleW: TShadowLabel;
    ButtonResetToCurrent: TBitBtnEx;
    ShowAvailableMachinesOnly: TAdvOfficeCheckBoxEx;
    HidePreliminaryMachines: TAdvOfficeCheckBoxEx;
    LabelTotalMachines: TShadowLabel;
    IconMediaType: TImage;
    MachinesListView: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    function MachinesListViewItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
  private
    { Private declarations }
    //SelectedMachineName: String;
    //procedure ResizeForm;
    procedure ReselectItem(const MachineName: String);
    procedure ChangeFilters;
    procedure ReadWriteSettings(ReadMode: Boolean);
    procedure Resize4K;
  public
    { Public declarations }
    CurrentMachineName: String;
  end;

var
  FormArcadeSoftwareListMachineToRunGame: TFormArcadeSoftwareListMachineToRunGame;

implementation

uses uMain, uCommon, uCommonCustom;

{$R *.dfm}

procedure TFormArcadeSoftwareListMachineToRunGame.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormArcadeSoftwareListMachineToRunGame do
  begin
    ClientWidth:= 2184;
    ClientHeight:= 1211;
    Font.Size:= 16;

    FormMain.Set4KEmuGameTopPanel(TopBar, GameIcon, IconMediaType, LabelGameTitle, 1640, LabelGameName, ClientWidth-205-20);

    FormMain.Set4KLabelSpecs(LabelTotalMachines, 10, 160, -1, -1, 16);
    FormMain.Set4KLabelSpecs(LabelSoftwarelistTitleW, (ClientWidth-1900) div 2, 160, 1900, 24, 14);

    PanelBottom.Height:= 71;

    FormMain.Set4KButtonSpecs(ButtonResetToCurrent, 10, 16, 168, 45, 16);
    FormMain.Set4KCheckBoxSpecs(ShowAvailableMachinesOnly, ButtonResetToCurrent.Left+ButtonResetToCurrent.Width+10, 20, 250, 36, 16);
    FormMain.Set4KCheckBoxSpecs(HidePreliminaryMachines, 444, 20, 380, 36, 16);

    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonYes, ButtonNo, False);

    FormMain.Set4KListViewSpecs(MachinesListView, 10, LabelTotalMachines.Top+40, 2164, 937, 16);
    MachinesListView.CellSizes.Report.Height:= 37;

    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 0, 880);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 1, 250);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 2, 465);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 3, 145);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 4, 250);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 5, 138);
    FormMain.Set4KListViewColumnSizeSpecs(MachinesListView, 6,  34);

    MachinesListView.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    MachinesListView.PaintInfoColumn.CaptionIndent:= 4; // reset to default value    
  end;
end;

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

{procedure TFormArcadeSoftwareListMachineToRunGame.ResizeForm;
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

  FormArcadeSoftwareListMachineToRunGame.Width:=  FormArcadeSoftwareListMachineToRunGame.Width+ iWidthDec;
  FormArcadeSoftwareListMachineToRunGame.Height:= FormArcadeSoftwareListMachineToRunGame.Height+iHeight;

  FrameMachinesList.Width:=  FrameMachinesList.Width +iWidthDec;
  FrameMachinesList.Height:= FrameMachinesList.Height+iHeight;

  MachinesListView.Width:=  MachinesListView.Width+iWidthDec-2;
  MachinesListView.Height:= MachinesListView.Height+iHeight;
  LabelGameTitle.Width:= LabelGameTitle.Width+iWidthDec;
  ButtonYes.Left:= ButtonYes.Left+iWidthDec;
  ButtonNo.Left:=  ButtonNo.Left +iWidthDec;
  LabelSoftwarelistTitleW.Width:= LabelSoftwarelistTitleW.Width+iWidthDec;
end;}

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
  Resize4K;
  FormMain.ELV_ResetNormalColors(MachinesListView);
  FormMain.SetEasyListViewHeaderColors(MachinesListView, True, False, Is4KMode, True);
  //ResizeForm; // no longer used (May 29, 2021)
  if IsNightMode then
  begin
    SetFormColors(FormArcadeSoftwareListMachineToRunGame, TopBar, PanelBottom, LabelGameTitle, LabelGameName, nil, FormMain.MemGameInfo.eGameSetStatus, IsNightMode);
    SetLabelColors(LabelTotalMachines,      LabelGameName.Font.Color, LabelGameName.ShadowColor);
    SetLabelColors(LabelSoftwarelistTitleW, clrLightRed, clrLightBlack);

    FormMain.SetEasyListViewColors(MachinesListView, FormArcadeSoftwareListMachineToRunGame.Color, clWhite, -1, clrBorderGroupBoxGrayBk);
    FormMain.SetEasyListViewHeaderColors(MachinesListView, True, False, Is4KMode, True);
    FormMain.SetWin10DarkScrollBar(MachinesListView);

    SetCheckBoxColors(ShowAvailableMachinesOnly, item_caption_active_color[1], item_caption_active_shadow_color[1]);
    SetCheckBoxColors(HidePreliminaryMachines,   item_caption_active_color[1], item_caption_active_shadow_color[1]);

    FormMain.SetCheckBoxExCustomIcon(ShowAvailableMachinesOnly);
    FormMain.SetCheckBoxExCustomIcon(HidePreliminaryMachines);

    FormMain.SetButtonExColors(ButtonYes);
    FormMain.SetButtonExColors(ButtonNo);
    FormMain.SetButtonExColors(ButtonResetToCurrent);

    FormMain.ELV_SetRibbonNightColors(0, MachinesListView, True);
  end;

  SetColorsGameTopBar(FormMain.MemGameInfo.eGameSetStatus, TopBar, IsNightMode); // change top bar color based on game set status

  FormMain.GetMediaTypeIconMsgBox(FormMain.MemGameInfo.eCustomMediaType, FormMain.MemGameInfo.eIsCustomGame,
                                  FormMain.MemGameInfo.eMediaType, FormMain.MemGameInfo.eArcadeCHDMediaType, IconMediaType,
                                  FormMain.MemGameInfo.eSoftwareExecParameter, FormMain.MemGameInfo.eSoftwareName, True);

  FormMain.LoadSystemROMIdIcon(FormMain.MemGameInfo.eSystemID, FormMain.MemGameInfo.eCustomSystemID, FormMain.MemGameInfo.eROMIdentification, GameIcon, FormMain.MemGameInfo.eSoftwareName, FormMain.MemGameInfo.eGameSetStatus, FormMain.MemGameInfo.eIsCustomGame);

  case FormMain.MemGameInfo.eIsCustomGame of
    True:
      begin
        LabelSoftwarelistTitleW.Caption:= SystemsListCustom[FormMain.MemGameInfo.eCustomSystemID, 0]+' - '+MediaTypeCustom[FormMain.MemGameInfo.eCustomMediaType, 0];
        LabelGameName.Caption:= 'file: '+FormMain.MemGameInfo.eName;
      end;
    False:
      begin
        LabelSoftwarelistTitleW.Caption:= FormMain.MemGameInfo.eCategory;
        LabelGameName.Caption:= 'name: '+FormMain.StatusBar_GamesGameName.Caption;
      end;
  end;

  LabelGameTitle.Caption:= FormMain.MemGameInfo.eTitle;

  if FormMain.MemGameInfo.eSoftwareUsageTip <> '' then
     begin
       LabelGameName.Caption:= LabelGameName.Caption+#13#10+
                               'usage: '+FormMain.MemGameInfo.eSoftwareUsageTip;
     end;

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
  FormMain.GetCanvasDefaultFont(ACanvas, Item.Tag, Item.StateImageIndexes[6], IsNightMode, Is4KMode);
  if Item.Captions[1] = CurrentMachineName then
     begin
       Item.Bold:= True;
       ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
       if IsNightMode then
          ACanvas.Font.Color:= clrOrangeVivid;
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

function TFormArcadeSoftwareListMachineToRunGame.MachinesListViewItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(gItem1.Caption, gItem2.Caption);         // machine title
    1: Result:= FormMain.iCompare(gItem1.Captions[1], gItem2.Captions[1]); // game name
    2: Result:= FormMain.iCompare(gItem1.Captions[2], gItem2.Captions[2]); // manufacturer
    3: Result:= FormMain.iCompare(gItem1.Captions[3], gItem2.Captions[3]); // monitor frequency (Hz)
    4: Result:= FormMain.iCompare(gItem1.Captions[4], gItem2.Captions[4]); // clone of
    5: Result:= AnsiCompareText  (gItem1.Captions[5], gItem2.Captions[5]); // save state
  end;
end;

end.
