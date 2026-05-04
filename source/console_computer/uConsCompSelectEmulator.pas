unit uConsCompSelectEmulator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, uCommonCustom, ImgList, MPCommonObjects, EasyListview,
  MPCommonUtilities, ExtCtrls, Buttons, AdvOfficeButtons, PanelEx,
  ShadowLabel, ButtonsEx;

type
  TFormConsCompSelectEmulator = class(TForm)
    EmulatorsList: TEasyListview;
    IL_EmulatorIcon: TImageList;
    PanelBottom: TPanelEx;
    LabelTips: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EmulatorsListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure EmulatorsListItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EmulatorsListGroupImageDrawIsCustom(
      Sender: TCustomEasyListview; Group: TEasyGroup;
      var IsCustom: Boolean);
    procedure EmulatorsListGroupImageGetSize(Sender: TCustomEasyListview;
      Group: TEasyGroup; var ImageWidth, ImageHeight: Integer);
    procedure EmulatorsListGroupImageDraw(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
  private
    newEmulatorIndexToUseCustom: packed array[1..MaxConsoleComputerSystems] of ShortInt; // emulator index to use 1..4
    SystemIcon: array [1..MaxConsoleComputersystems] of TImage;
    
    procedure AddIconImage(sysID: Integer);
    procedure FreeIconImages;
    procedure AddEmulatorsList;
    procedure ResizeForm;
    procedure Resize4K;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompSelectEmulator: TFormConsCompSelectEmulator;

implementation

uses uMain;

{$R *.dfm}

procedure TFormConsCompSelectEmulator.Resize4K;
begin
  if not Is4KMode then
     Exit;
  with FormConsCompSelectEmulator do
  begin
    ClientWidth:=  1600;
    ClientHeight:= 1200;
    Font.Size:= 16;

    PanelBottom.Height:= 71;
    LabelTips.Caption:= 'Tip: '+LabelTips.Caption;
    FormMain.Set4KLabelSpecs(LabelTips, 10, 9, 622, 55, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);

    FormMain.Set4KImageListSpecs(IL_EmulatorIcon, 48);

    FormMain.Set4KListViewSpecs(EmulatorsList, 10, -1, ClientWidth-20, (ClientHeight-PanelBottom.Height-10)-EmulatorsList.Top, 16, False, 18);
    FormMain.Set4KListViewCheckBoxHDSpecs(EmulatorsList);
    EmulatorsList.CellSizes.Tile.Width := EmulatorsList.Width-30;
    EmulatorsList.CellSizes.Tile.Height:= 64;

    EmulatorsList.Selection.FullCellIndent:= 134;
    EmulatorsList.PaintInfoItem.CheckIndent:= 134;
    EmulatorsList.PaintInfoGroup.CaptionIndent:= 8;
    EmulatorsList.PaintInfoGroup.MarginTop.Size:= 64;
    EmulatorsList.GroupFont.Style:= [];
  end;
end;

procedure TFormConsCompSelectEmulator.AddIconImage(sysID: Integer);
begin
  SystemIcon[sysID]:= TImage.Create(nil);
  if Is4KMode then
     SystemIcon[sysID].Width:= 128
  else
     SystemIcon[sysID].Width:= 68;

  SystemIcon[sysID].Height:= SystemIcon[sysID].Width;
  FormMain.LoadSystemIcon(sysID, SystemIcon[sysID], True);
end;

procedure TFormConsCompSelectEmulator.FreeIconImages;
var
  Loop: Integer;
begin
  for Loop:= Low(SystemIcon) to High(SystemIcon) do
      FreeAndNil(SystemIcon[Loop]);
end;

procedure TFormConsCompSelectEmulator.AddEmulatorsList;
var
  Loop: Byte;
  LoopEmu: ShortInt;
  sysID: Integer;
  Item, selItem: TEasyItem;
  Group: TEasyGroup;
  sysList: TStringList;
  sys1Index, sys2Index: ShortInt;
  SelectCurrentEmu: Boolean;
begin
  for Loop:=1 to MaxConsoleComputerSystems do
      newEmulatorIndexToUseCustom[Loop]:= EmulatorIndexToUseCustom[Loop]; // initialize temp array so user can confirm or cancel changes

  selItem:= nil;
  SelectCurrentEmu:= FormMain.CheckSingleSelected(FormMain.GamesListView);
  if SelectCurrentEmu then
     SelectCurrentEmu:= uMain.TEasyGameInfo(FormMain.SelectedEasyItem).eIsCustomGame;

  sysList:= TStringList.Create;
  sysList.BeginUpdate;

  GetExtIcon('.exe', IL_EmulatorIcon);
  GetExtIcon('.bat', IL_EmulatorIcon);
  for Loop:=1 to MaxConsoleComputerSystems do
  begin
    LoopEmu:= 0;
    if EmulatorFileCustom[Loop, 1] <> '' then
       Inc(LoopEmu);
    if EmulatorFileCustom[Loop, 2] <> '' then
       Inc(LoopEmu);
    if EmulatorFileCustom[Loop, 3] <> '' then
       Inc(LoopEmu);
    if EmulatorFileCustom[Loop, 4] <> '' then
       Inc(LoopEmu);

    if LoopEmu > 1 then
       sysList.Add(SystemsListCustom[Loop, 0]+' ='+IntToStr(Loop));
  end;
  sysList.Sort;

  sys1Index:= sysList.IndexOfName(SystemsListCustom[39, 0]+' '); // Commodore 64
  sys2Index:= sysList.IndexOfName(SystemsListCustom[56, 0]+' '); // Commodore 128
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[2, 0]+' ');  // Game Boy Color
  sys2Index:= sysList.IndexOfName(SystemsListCustom[31, 0]+' '); // Game Boy Advance
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[5, 0]+' ');  // Atari 2600
  sys2Index:= sysList.IndexOfName(SystemsListCustom[48, 0]+' '); // Atari 400/800/XL
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[3, 0]+' ');  // Nintendo 8-bit
  sys2Index:= sysList.IndexOfName(SystemsListCustom[65, 0]+' '); // Nintendo 3DS
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[29, 0]+' '); // Nintendo DS
  sys2Index:= sysList.IndexOfName(SystemsListCustom[65, 0]+' '); // Nintendo 3DS
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sysList.EndUpdate;
  if sysList.Count = 0 then
     begin
       FreeAndNil(sysList);
       Exit;
     end;

  EmulatorsList.BeginUpdate;
  EmulatorsList.Items.ReIndexDisable:= True;
  for Loop:=0 to sysList.Count-1 do
  begin
    sysID:= StrToInt(sysList.ValueFromIndex[Loop]);
    Group:= EmulatorsList.Groups.Add;
    AddIconImage(sysID);


    Group.ImageIndex:= sysID;
    Group.Caption:= SystemsListCustom[sysID, 0];
    Group.Captions[1]:= '      '+LowerCase(GetSystemTypeTitle(sysID, False));
    Group.Details[1]:= 1;
    Group.DetailCount:= 2;

    Group.Tag:= newEmulatorIndexToUseCustom[sysID];
    //Group.Tag:= FormMain.EmulatorIndexToUse[sysID]; // this holds the selected emulator... [-1, 1, 2, 3, 4]

    for LoopEmu:= 1 to 4 do
    begin
      if EmulatorFileCustom[sysID, LoopEmu] <> '' then
         begin
           Item:= Group.Items.Add;
           Item.StateImageIndex:= sysID; // this holds the system ID
           Item.ImageIndex:= GetAppIcon(EmulatorFileCustom[sysID, LoopEmu], IL_EmulatorIcon, 32);
           if Item.ImageIndex = -1 then
              Item.ImageIndex:= 0;//Ord(FormMain.IsExeBatchFile(EmulatorFileCustom[sysID, LoopEmu]));

           Item.Caption:= Format('%-466s', [EmulatorVersionCustom[sysID, LoopEmu]]);
           Item.Captions[1]:= EmulatorFileCustom[sysID, LoopEmu];
           Item.Details[1]:= 1;
           Item.Tag:= LoopEmu; // this holds the emulator index

           if newEmulatorIndexToUseCustom[sysID] = LoopEmu then
              Item.Checked:= True;

           if SelectCurrentEmu then
           begin
             if sysID = FormMain.MemGameInfo.eCustomSystemID then
             begin
               if LoopEmu = EmulatorIndexToUseCustom[FormMain.MemGameInfo.eCustomSystemID] then
               begin
                 selItem:= Item;
                 SelectCurrentEmu:= False; // do not check this again
               end;
             end;
           end;
         end;
    end;
  end;
  FreeAndNil(sysList);

  if FormMain.CheckTotal(EmulatorsList) then
     begin
       Group:= EmulatorsList.Groups.FirstGroup; // get first group (default group), should not be here
       EmulatorsList.Groups.DeleteGroup(Group); // delete the group
       EmulatorsList.Groups.ExpandAll;
     end;

  EmulatorsList.Items.ReIndexDisable:= False;
  EmulatorsList.EndUpdate;
  EmulatorsList.Tag:= 1;
  if selItem <> nil then
     begin
       selItem.MakeVisible(emvMiddle);//emvAuto);
       selItem.Selected:= True;
     end;
end;

procedure TFormConsCompSelectEmulator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormConsCompSelectEmulator.FormShow(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  Resize4K;

  FormMain.ELV_ResetNormalColors(EmulatorsList);

  if IsNightMode then
     begin
       FormConsCompSelectEmulator.Color:= menu_background_color[1];
       PanelBottom.Frames:= [];
       SetBottomPanelColors(PanelBottom);
       FormMain.SetEasyListViewColors(EmulatorsList, menu_background_color[1], item_caption_active_color[1], item_caption_active_color[1]);
       EmulatorsList.GroupFont.Color:= clrOrangeBarTop;
       FormMain.ELV_SetCheckRadioCustomIcon(EmulatorsList);
       FormMain.SetWin10DarkScrollBar(EmulatorsList);
       SetLabelColors(LabelTips, item_caption_active_color[1], item_caption_active_shadow_color[1]);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
     end;

  ResizeForm;

  if IsNightMode then
     FormMain.ELV_SetNightModeColors(EmulatorsList);

  AddEmulatorsList;
  if EmulatorsList.Scrollbars.VertBarVisible then
     begin
       EmulatorsList.Header.Columns[0].Width:= EmulatorsList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
       EmulatorsList.CellSizes.Report.Width:= EmulatorsList.CellSizes.Report.Width-GetSystemMetrics(SM_CXVSCROLL);
     end;
  FormMain.HideFilterMsgBox;
  Screen.Cursor:= crDefault;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Checked then
     begin
       if Position = 0 then
          begin
            if Is4KMode then
               ACanvas.Font.Name:= 'Segoe UI Semibold';
            ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
          end;
     end;
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Verdana';
       if Is4KMode then
          ACanvas.Font.Size:= 14
       else
          ACanvas.Font.Size:= 8;
       ACanvas.Font.Color:= clrMedDarkGray;
       if IsNightMode and Item.Selected then
          ACanvas.Font.Color:= clrDarkGray;
     end;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListItemCheckChange(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  lastChecked: TEasyItem;
begin
  // Group.Tag -> this holds the selected emulator... [-1, 1, 2, 3, 4]
  // Item.Tag  -> this holds the system ID... [1, 2..]
  if EmulatorsList.Tag = 0 then
     Exit;
  case Item.Checked of
    True:
      begin
        if Item.Tag <> Item.OwnerGroup.Tag then
           begin
             if Item.OwnerGroup.Tag <> -1 then
                lastChecked:= Item.OwnerGroup.Item[Item.OwnerGroup.Tag-1]
             else
                lastChecked:= nil;
             Item.OwnerGroup.Tag:= Item.Tag;
             if lastChecked <> nil then
                lastChecked.Checked:= False;
           end;
      end;
    False:
      begin
        if Item.Tag = Item.OwnerGroup.Tag then
           Item.Checked:= True; // same item was unchecked, force checked and do nothing else
      end;
  end;
  newEmulatorIndexToUseCustom[Item.StateImageIndex]:= Item.Tag;
end;

procedure TFormConsCompSelectEmulator.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Loop: Integer;
begin
  if CanClose then
     begin
       FreeIconImages;
       if FormConsCompSelectEmulator.ModalResult = mrOk then
       begin
         for Loop:=1 to MaxConsoleComputerSystems do
             EmulatorIndexToUseCustom[Loop]:= newEmulatorIndexToUseCustom[Loop];  // uMain.EmulatorIndexToUse[] array with new values
         UpdateCustomEmulatorsInfo(False, True); // only update Emulator to use; do not update param index... and do not update emulators filenames
       end;
     end;
end;

procedure TFormConsCompSelectEmulator.ResizeForm;
var
  iScreenWidth, iScreenHeight, iDiff: Integer;
begin
  if Is4KMode then
     Exit;
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  iDiff:= -1;
  if iScreenHeight > 900 then
     iDiff:= 800-FormConsCompSelectEmulator.Height;

  if iDiff <> -1 then
     begin
       EmulatorsList.Height:= EmulatorsList.Height+iDiff;
       FormConsCompSelectEmulator.Height:= FormConsCompSelectEmulator.Height+iDiff;
     end;

  iDiff:= -1;
  if iScreenWidth > 800 then
     iDiff:= 820-FormConsCompSelectEmulator.Width;

  if iDiff <> -1 then
     begin
       EmulatorsList.CellSizes.Tile.Width:= EmulatorsList.CellSizes.Tile.Width+iDiff;
       EmulatorsList.Width:= EmulatorsList.Width+iDiff;
       ButtonOk.Left:= ButtonOk.Left+iDiff;
       ButtonCancel.Left:= ButtonCancel.Left+iDiff;
       FormConsCompSelectEmulator.Width:= FormConsCompSelectEmulator.Width+iDiff;
     end;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupImageDrawIsCustom(
  Sender: TCustomEasyListview; Group: TEasyGroup; var IsCustom: Boolean);
begin
  IsCustom:= True;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupImageGetSize(
  Sender: TCustomEasyListview; Group: TEasyGroup; var ImageWidth,
  ImageHeight: Integer);
begin
  if Is4KMode then
     ImageWidth:= 128
  else
     ImageWidth:= 68;

  ImageHeight:= ImageWidth;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupImageDraw(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas;
  const RectArray: TEasyRectArrayObject; AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop, iSysTypeIndex: Integer;
begin
  ACanvas.Lock;

  if Is4KMode then
     iSysTypeIndex:= 59
  else
     iSysTypeIndex:= 49;

  iLeft:= RectArray.IconRect.Left-5; // -5 to move icon closer to the left border and give some space between the icon and selection bar
  iTop:=  RectArray.IconRect.Top+5;  // -> +5 is to be the same as "no custom icon drawing"
  ACanvas.Draw(iLeft, iTop+iSysTypeIndex{+54}, SystemIcon[Group.ImageIndex].Picture.Icon); // +54 to move system icon below system title line

  iSysTypeIndex:= ACanvas.Pen.Color;
  ACanvas.Pen.Color:= clrBorderGroupBoxGrayBk;

  if Is4KMode then
     begin
       // 128x128 group system icons
       ACanvas.MoveTo(iLeft+132, iTop+48+2);
       ACanvas.LineTo(iLeft+(EmulatorsList.CellSizes.Tile.Width-20), iTop+48+2);
     end
  else
     begin
       // 68x68 group system icons
       ACanvas.MoveTo(iLeft+72, iTop+32+2);
       ACanvas.LineTo(iLeft+(EmulatorsList.CellSizes.Tile.Width-20), iTop+32+2);
     end;
  ACanvas.Pen.Color:= iSysTypeIndex;

  iSysTypeIndex:= -1;
  if SystemIsConsole(Group.ImageIndex) then
     iSysTypeIndex:= 1 // index 25 is "console" icon (42 pixels text width)
  else
  if SystemIsComputer(Group.ImageIndex) then
     iSysTypeIndex:= 2 // index 26 is "computer" icon (53 pixels text width)
  else
  if SystemIsHandheld(Group.ImageIndex) then
     iSysTypeIndex:= 3; // index 27 is "handheld" icon (53 pixels text width)

  if Is4KMode then
  begin
    case iSysTypeIndex of
      1: iLeft:= iLeft+(EmulatorsList.Width-131);
      2: iLeft:= iLeft+(EmulatorsList.Width-136);
      3: iLeft:= iLeft+(EmulatorsList.Width-139);
    end;
  end
  else
  begin
    case iSysTypeIndex of
      1: iLeft:= iLeft+(EmulatorsList.Width-120);
      2: iLeft:= iLeft+(EmulatorsList.Width-132);
      3: iLeft:= iLeft+(EmulatorsList.Width-129);
    end;
  end;

  if Is4KMode then
     begin
       iLeft:= iLeft-49;
       iTop:=  iTop+10;
     end
  else
     iTop:= iTop+(32-FormMain.IL_SystemType_Standard.Height) div 2;

  if iSysTypeIndex <> -1 then
     begin
       Inc(iLeft, 5);
       if Is4KMode then
          FormMain.IL_GroupedMode.Draw(ACanvas, iLeft, iTop, iSysTypeIndex+4)
       else
          FormMain.IL_SystemType_Standard.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
     end;

  ACanvas.Font.Name:= FormMain.Get4KFont;
  ACAnvas.Font.Size:= FormMain.GetDefaultFontSize;
  if Is4KMode then
     iLeft:= iLeft+36
  else
     begin
       iLeft:= iLeft+28;
       iTop:=  iTop+4;
     end;
  ACanvas.Font.Style:= [];

  if IsNightMode then
     ACanvas.Font.Color:= item_caption_active_color[1]
  else
     ACanvas.Font.Color:= clBlack;

  ACanvas.TextOut(iLeft, iTop, GetSystemTypeTitle(Group.ImageIndex, False));
  ACanvas.UnLock;
end;


end.
