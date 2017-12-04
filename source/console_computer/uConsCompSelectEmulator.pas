unit uConsCompSelectEmulator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, uCommon, uCommonCustom, ImgList, MPCommonObjects, EasyListview, ExtCtrls,
  Buttons;

type
  TFormConsCompSelectEmulator = class(TForm)
    EmulatorsList: TEasyListview;
    LabelTips: TLabel;
    BottomFrame: TShape;
    IL_EmulatorIcon: TImageList;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    IL_Systems: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EmulatorsListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure EmulatorsListGroupPaintText(Sender: TCustomEasyListview;
      Group: TEasyGroup; ACanvas: TCanvas);
    procedure EmulatorsListItemCheckChange(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    newEmulatorIndexToUseCustom: packed array[1..MaxConsoleComputerSystems] of ShortInt; // emulator index to use 1..4
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
    Group.ImageIndex:= sysID;
    Group.Caption:= SystemsListCustom[sysID, 0];
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
  FormMain.ELV_ResetNormalColors(EmulatorsList);
  AddEmulatorsList;
  if EmulatorsList.Scrollbars.VertBarVisible then
     begin
       EmulatorsList.Header.Columns[0].Width:= EmulatorsList.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
       EmulatorsList.CellSizes.Report.Width:= EmulatorsList.CellSizes.Report.Width-GetSystemMetrics(SM_CXVSCROLL);
     end;
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
       //ACanvas.Font.Color:= ListSelectionColors[4, 0];
     end;
  if Position = 1 then
     begin
       ACanvas.Font.Name:= 'Tahoma';
       ACanvas.Font.Size:= ACanvas.Font.Size-1;
       ACanvas.Font.Color:= $00606060; //clGray;
     end;
end;

procedure TFormConsCompSelectEmulator.EmulatorsListGroupPaintText(
  Sender: TCustomEasyListview; Group: TEasyGroup; ACanvas: TCanvas);
begin
  ACanvas.Font.Size:= ACanvas.Font.Size+2;
  ACanvas.Font.Name:= 'Trebuchet MS';
  ACanvas.Font.Color:= clMaroon;
  ACanvas.Font.Style:= [fsItalic];
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
  iSize: Integer;
begin
  //error... move this to .FormCreate() and add support for 4K resolution (increase form size, font sizes, icon sizes)
  if Screen.Width = 640 then
   begin
     iSize:= 25;
     EmulatorsList.CellSizes.Tile.Width:= EmulatorsList.CellSizes.Tile.Width-iSize;
     EmulatorsList.Width:= EmulatorsList.Width-iSize;
     BottomFrame.Width:= BottomFrame.Width-iSize;
     ButtonOk.Left:= ButtonOk.Left-iSize;
     ButtonCancel.Left:= ButtonCancel.Left-iSize;
     FormConsCompSelectEmulator.Width:= FormConsCompSelectEmulator.Width-iSize;
   end;

  iSize:= -1;
  case Screen.Height of
    480: iSize:= 220;
    600: iSize:= 100;
  end;
  //iSize:= 220; // debug only, do not enable
  if iSize <> -1 then
     begin
       EmulatorsList.Height:= EmulatorsList.Height-iSize;
       BottomFrame.Top:= BottomFrame.Top-iSize;
       ButtonOk.Top:= ButtonOk.Top-iSize;
       ButtonCancel.Top:= ButtonCancel.Top-iSize;
       LabelTips.Top:= LabelTips.Top-iSize;
       FormConsCompSelectEmulator.Height:= FormConsCompSelectEmulator.Height-iSize;
     end;
end;

procedure TFormConsCompSelectEmulator.FormCreate(Sender: TObject);
begin
  ResizeForm;
end;


end.
