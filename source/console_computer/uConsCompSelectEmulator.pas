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
    IL_Systems: TImageList;
    PanelBottom: TPanelEx;
    LabelTips: TShadowLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    UseSmallIcons: TAdvOfficeCheckBoxEx;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EmulatorsListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure EmulatorsListGroupPaintText(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas);
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
    procedure UseSmallIconsClick(Sender: TObject);
  private
    newEmulatorIndexToUseCustom: packed array[1..MaxConsoleComputerSystems] of ShortInt; // emulator index to use 1..4
    SystemIcon: array [1..MaxConsoleComputersystems] of TImage;
    
    procedure AddIconImage(sysID: Integer);
    procedure FreeIconImages;
    procedure AddEmulatorsList;
    procedure ResizeForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompSelectEmulator: TFormConsCompSelectEmulator;

implementation

uses uMain;

{$R *.dfm}

procedure TFormConsCompSelectEmulator.AddIconImage(sysID: Integer);
begin
  SystemIcon[sysID]:= TImage.Create(nil);
  if UseSmallIcons.Checked then
     SystemIcon[sysID].Width:= 32
  else
    SystemIcon[sysID].Width:= 128;
  SystemIcon[sysID].Height:= SystemIcon[sysID].Width;
  FormMain.LoadIconIntoImage(SystemsListCustom[sysID, 1], SystemIcon[sysID], -1, True);
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
  Item: TEasyItem;
  Group: TEasyGroup;
  sysList: TStringList;
  sys1Index, sys2Index: ShortInt;



begin
  for Loop:=1 to MaxConsoleComputerSystems do
      newEmulatorIndexToUseCustom[Loop]:= EmulatorIndexToUseCustom[Loop]; // initialize temp array so user can confirm or cancel changes

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

  sys1Index:= sysList.IndexOfName(SystemsListCustom[2, 0]+' '); // Game Boy Color
  sys2Index:= sysList.IndexOfName(SystemsListCustom[31, 0]+' '); // Game Boy Advance
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[5, 0]+' '); // Atari 2600
  sys2Index:= sysList.IndexOfName(SystemsListCustom[48, 0]+' '); // Atari 400/800/XL
  if (sys1Index <> -1) and (sys2Index <> -1) then
     sysList.Exchange(sys1Index, sys2Index);

  sys1Index:= sysList.IndexOfName(SystemsListCustom[3, 0]+' '); // Nintendo 8-bit
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
           Item.ImageIndex:= GetAppIcon(EmulatorFileCustom[sysID, LoopEmu], IL_EmulatorIcon);
           if Item.ImageIndex = -1 then
              Item.ImageIndex:= Ord(FormMain.IsExeBatchFile(EmulatorFileCustom[sysID, LoopEmu]));

           Item.Caption:= Format('%-466s', [EmulatorVersionCustom[sysID, LoopEmu]]);
           Item.Captions[1]:= EmulatorFileCustom[sysID, LoopEmu];
           Item.Details[1]:= 1;
           Item.Tag:= LoopEmu; // this holds the emulator index

           if newEmulatorIndexToUseCustom[sysID] = LoopEmu then
              Item.Checked:= True;
         end;
    end;
  end;
  FreeAndNil(sysList);

  if FormMain.CheckTotal(EmulatorsList) then
     begin
       Group:= EmulatorsList.Groups.FirstGroup; // get first group (default group), should not be here!!!
       EmulatorsList.Groups.DeleteGroup(Group); // delete the group...
       EmulatorsList.Groups.ExpandAll;
     end;

  EmulatorsList.Items.ReIndexDisable:= False;
  EmulatorsList.EndUpdate;
  EmulatorsList.Tag:= 1;
end;

procedure TFormConsCompSelectEmulator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormConsCompSelectEmulator.FormShow(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  ResizeForm;
  FormMain.ELV_ResetNormalColors(EmulatorsList);
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
          ACanvas.Font.Style:= ACanvas.Font.Style+[fsBold];
     end;
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Verdana';
       ACanvas.Font.Size:= 8;
       ACanvas.Font.Color:= clrMedDarkGray;//$00606060;
       if IsNightMode and Item.Selected then
          ACanvas.Font.Color:= clrDarkGray;
     end;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupPaintText(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas);
begin
  ACanvas.Font.Size:= 10;//ACanvas.Font.Size+2;
  ACanvas.Font.Name:= 'Trebuchet MS';
  if IsNightMode then
     ACanvas.Font.Color:= clrOrangeBarTop
  else
     ACanvas.Font.Color:= clMaroon;

  if LabelTips.Tag = 1 then
     ACanvas.Font.Style:= [fsBold, fsItalic]
  else
     ACanvas.Font.Style:= [fsBold];
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
       //FormMain.PopupGames.HelpContext:= 1; // this has no use anymore... the only place it was being checked in uMain.GamesPopup.OnPopup() event
     end;
end;

procedure TFormConsCompSelectEmulator.ResizeForm;
var
  iScreenWidth, iScreenHeight, iDiff: Integer;
begin
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
  if UseSmallIcons.Checked then
     ImageWidth:= 32
  else
     ImageWidth:= 128;

  ImageHeight:= ImageWidth;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupImageDraw(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas;
  const RectArray: TEasyRectArrayObject; AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop, iSysTypeIndex: Integer;
begin
  ACanvas.Lock;

  if UseSmallIcons.Checked then
     iLeft:= RectArray.IconRect.Left
  else
     iLeft:= RectArray.IconRect.Left-5; // -5 to move icon closer to the left border and give some space between the icon and selection bar
  iTop:=  RectArray.IconRect.Top+5; // -> +5 is to be the same as "no custom icon drawing"

  ACanvas.Draw(iLeft, iTop, SystemIcon[Group.ImageIndex].Picture.Icon);

  iSysTypeIndex:= ACanvas.Pen.Color;
  ACanvas.Pen.Color:= clrBorderGroupBoxGrayBk;// clMedGray;
  if UseSmallIcons.Checked then
     begin
       ACanvas.MoveTo(iLeft-5, iTop+32+2); // 32x32 group system icons // EmulatorsList.ImagesGroup.Height+2);
       ACanvas.LineTo(iLeft+(EmulatorsList.CellSizes.Tile.Width-25), iTop+32+2); // 32x32 group system icons //EmulatorsList.ImagesGroup.Height+2);
     end
  else
     begin
       ACanvas.MoveTo(iLeft+132, iTop+32+2); // EmulatorsList.ImagesGroup.Height+2);
       ACanvas.LineTo(iLeft+(EmulatorsList.CellSizes.Tile.Width-20), iTop+32+2); // EmulatorsList.ImagesGroup.Height+2);
     end;
  ACanvas.Pen.Color:= iSysTypeIndex;

  iSysTypeIndex:= -1;
  if SystemIsConsole(Group.ImageIndex) then
     iSysTypeIndex:= 25 // index 25 is "console" icon (42 pixels text width)
  else
  if SystemIsComputer(Group.ImageIndex) then
     iSysTypeIndex:= 26 // index 26 is "computer" icon (53 pixels text width)
  else
  if SystemIsHandheld(Group.ImageIndex) then
     iSysTypeIndex:= 27; // index 27 is "handheld" icon (53 pixels text width)

  if iSysTypeIndex = 25 then
     iLeft:= iLeft+(EmulatorsList.Width-112)
  else
     iLeft:= iLeft+(EmulatorsList.Width-124);
  iTop:= iTop+(EmulatorsList.ImagesGroup.Height-FormMain.IL_MenuPopup.Height) div 2;

  if iSysTypeIndex <> -1 then
     begin
       if not UseSmallIcons.Checked then
          Inc(iLeft, 5);
       FormMain.IL_MenuPopup.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
     end;

  ACanvas.Font.Name:= 'Segoe UI';
  ACAnvas.Font.Size:= 9;
  ACanvas.Font.Style:= [];
  //if LabelTips.Tag = 1 then
  //   ACanvas.Font.Style:= [fsItalic];
  if IsNightMode then
     ACanvas.Font.Color:= item_caption_active_color[1]
  else
     ACanvas.Font.Color:= clBlack;

  ACanvas.TextOut(iLeft+20, iTop, GetSystemTypeTitle(Group.ImageIndex, False));
  ACanvas.UnLock;
end;

procedure TFormConsCompSelectEmulator.UseSmallIconsClick(Sender: TObject);
var
  Group: TEasyGroup;
begin
  if UseSmallIcons.Checked then
     begin
       EmulatorsList.Selection.FullCellIndent:= 0;
       EmulatorsList.PaintInfoItem.CheckIndent:= 15;
     end
  else
     begin
       EmulatorsList.Selection.FullCellIndent:= 134;
       EmulatorsList.PaintInfoItem.CheckIndent:= 134;
     end;

  if not FormMain.CheckTotal(EmulatorsList) then
     Exit;

  EmulatorsList.BeginUpdate;
  FreeIconImages;
  Group:= EmulatorsList.Groups.FirstGroup;
  repeat
    AddIconImage(Group.ImageIndex);
    Group:= EmulatorsList.Groups.NextGroup(Group);
  until Group = nil;
  EmulatorsList.EndUpdate;
end;

end.
