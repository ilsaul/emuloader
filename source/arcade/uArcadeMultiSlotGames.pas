unit uArcadeMultiSlotGames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, MPCommonObjects, EasyListview, MPCommonUtilities,
  PanelEx, IniFiles, ExtCtrls, Menus, BarMenus, ShadowLabel, ButtonsEx;

type
  TFormArcadeMultiSlotGames = class(TForm)
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonNo: TBitBtnEx;
    ButtonUp: TBitBtnEx;
    ButtonDown: TBitBtnEx;
    ButtonRemoveFromList: TBitBtnEx;
    LabelHelpText: TShadowLabel;
    PanelNeoGeoMVS: TPanelEx;
    LabelMultiSlotMachines: TShadowLabel;
    ButtonChangePanelNeoGeoMVS: TBitBtnEx;
    PanelMultiSlotMachines: TPanelEx;
    LabelMultiSlotMachinesChooseMachineToRun: TShadowLabel;
    MultiSlotMachines: TEasyListview;
    ButtonOkMultiSlotMachines: TBitBtnEx;
    LabelMultiSlotMachinesBoldDefaultMachine: TShadowLabel;
    ButtonCancelMultiSlotMachines: TBitBtnEx;
    GamesList: TEasyListview;
    procedure FormShow(Sender: TObject);
    procedure GamesListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GamesListItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonUpClick(Sender: TObject);
    procedure ButtonRemoveFromListClick(Sender: TObject);
    procedure GamesListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonChangePanelNeoGeoMVSClick(Sender: TObject);
    procedure ButtonOkMultiSlotMachinesClick(Sender: TObject);
    procedure MultiSlotMachinesDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure MultiSlotMachinesKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonCancelMultiSlotMachinesClick(Sender: TObject);
    procedure MultiSlotMachinesItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    LastSelectedMachine: TEasyItem;
    procedure UpdateLabelSelectedMachine(Item: TEasyItem);
    procedure AddMachinesMultiSlot;
    procedure UpdateSlotIndex;
    procedure AddMultiGames;
    procedure MoveToSlot(MoveUp: Boolean);
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormArcadeMultiSlotGames: TFormArcadeMultiSlotGames;

implementation

uses uMain, uCommon;

{$R *.dfm}

{
    Known motherboards:
    ===================
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+
    | Model   | Year | Slots | Generation | Video chipset         | Notes                                                                    |
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+
    | MV-1    | 1990 | 1     | 1          | PRO-B0/PRO-C0/LSPC-A0 | Original full-featured 1-slot board                                      |
    | MV-1F   |      | 1     | 2          | NEO-B1/LSPC2-A2       | 2nd-generation 1-slot board, no memory card headers                      |
    | MV-1FZ  |      | 1     | 2          | NEO-B1/LSPC2-A2       | Cost-reduced MV-1F without LED displays/mahjong inputs/stereo output     |
    | MV-1FZS |      | 1     | 2          | NEO-B1/LSPC2-A2       | Spanish MV-1FZ                                                           |
    | MV-1A   | 1995 | 1     | 3          | NEO-MGA/NEO-GRC       | 3rd-generation 1-slot board, removes coin lockouts                       |
    | MV-1ACH | 1995 | 1     | 3          | NEO-MGA/NEO-GRC       | Chinese MV-1A                                                            |
    | MV-1AX  |      | 1     | 3          | NEO-MGA/NEO-GRC       | MV-1A with soldered BIOS                                                 |
    | MV-1B   |      | 1     | 4          | NEO-GRC2              | 4th-generation 1-slot board, soldered BIOS, no SM1 ROM, 8-pin SIT header |
    | MV-1C   | 1999 | 1     | 5          | NEO-GRZ               | Final iteration, vertical cartridge slot                                 |
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+
    | MV-2B   |      | 2     | 1          | PRO-B0/PRO-C0/LSPC-A0 | Original full-featured 2-slot board                                      |
    | MV-2F   |      | 2     | 2          | NEO-B1/LSPC2-A2       | 2nd-geneation 2-slot board, onboard PCMCIA slot and 3.5mm jacks          |
    | MV-2FS  |      | 2     | 2          | NEO-B1/LSPC2-A2       | Spanish MV-2F                                                            |
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+
    | MV-4    | 1990 | 4     | 1          | PRO-B0/PRO-C0/LSPC-A0 | Original 4-slot board                                                    |
    | MV-4F   |      | 4     | 2          | NEO-B1/LSPC2-A2       | 2nd-generation 4-slot board                                              |
    | MV-4FS  |      | 4     | 2          | NEO-B1/LSPC2-A2       | Spanish MV-4                                                             |
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+
    | MV-6    | 1990 | 6     | 1          | PRO-B0/PRO-C0/LSPC-A0 | 2-board stack - mainboard and slot board                                 |
    +---------+------+-------+------------+-----------------------+--------------------------------------------------------------------------+

    Mainboard features
    ==================
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
    |       |Vid |Slots|Edge |Coins|Counters|Lockouts|Mahjong|8-pin|Memcard|Mono/St|Phones|7-seg|EL |  BIOS  |Data In|Orient|
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
    |MV-1   | B0 |  1  |JAMMA|  2  |   2    |   2    |   2   | no  |header |switch |header| yes |no | socket |  yes  |horiz |
    |MV-1F  | B1 |  1  |JAMMA|  2  |   2    |   2    |   2   | no  | none  |switch |header| yes |no | socket |  no   |horiz |
    |MV-1FZ | B1 |  1  |JAMMA|  2  |   2    |   2    |   0   | no  | none  | mono  | none | no  |no | socket |  yes  |horiz |
    |MV-1A  |MGA |  1  |JAMMA|  2  |   2    |   0    |   0   | no  | none  | mono  | none | no  |no | socket |  no   |horiz |
    |MV-1AX |MGA |  1  |JAMMA|  2  |   2    |   0    |   0   | no  | none  | mono  | none | no  |no |soldered|  no   |horiz |
    |MV-1B  |GRC2|  1  |JAMMA|  2  |   2    |   0    |   0   | yes | none  | mono  | none | no  |no |soldered|  no   |horiz |
    |MV-1C  |GRZ |  1  |JAMMA|  2  |   2    |   0    |   0   | yes | none  | mono  | none | no  |no |soldered|  no   | vert |
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
    |MV-2B  | B0 |  2  | MVS |  4  |   2    |   2    |   2   | no  |header | both  |header| yes |yes| socket |  no   | vert |
    |MV-2F  | B1 |  2  | MVS |  4  |   2    |   2    |   2   | no  |onboard| both  |jacks | yes |yes| socket |  no   | vert |
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
    |MV-4-25| B0 |  4  | MVS |  4  |   2    |   2    |   2   | no  |header | both  |header| yes |yes| socket |  no   | vert |
    |MV-4F  | B1 |  4  | MVS |  4  |   2    |   2    |   2   | no  |header | both  |header| yes |yes| socket |  no   | vert |
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
    |MV-6   | B0 |  6  | MVS |  4  |   2    |   2    |   2   | no  |header | both  |header| yes |yes| socket |  no   | vert |
    +-------+----+-----+-----+-----+--------+--------+-------+-----+-------+-------+------+-----+---+--------+-------+------+
}

procedure TFormArcadeMultiSlotGames.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormArcadeMultiSlotGames do
  begin
    FormMain.Set4KListViewSpecs(GamesList, 10, 10, 1975, 419, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(GamesList);
    //FormMain.Set4KListViewCheckBoxHDSpecs(GamesList);
    GamesList.CellSizes.Report.Height:= 37;

    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 0,  35);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 1, 950);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 2, 250);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 3, 250);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 4, 180);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 5, 150);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 6, 100);
    FormMain.Set4KListViewColumnSizeSpecs(GamesList, 7,  34);

    GamesList.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    GamesList.PaintInfoColumn.CaptionIndent:= 4; // reset to default value
    // ??? GamesList.PaintInfoItem.ImageIndent:= 4; // reset to default value (must increase first/last column width)

    FormMain.Set4KButtonSpecs(ButtonUp,             10,             GamesList.Top+GamesList.Height+10, 168, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonDown,           ButtonUp.Left+ButtonUp.Width+10,     ButtonUp.Top, 168, 36, 16);
    FormMain.Set4KButtonSpecs(ButtonRemoveFromList, ButtonDown.Left+ButtonDown.Width+10, ButtonUp.Top, 168, 36, 16);

    FormMain.Set4KLabelSpecs(LabelHelpText, 1002, ButtonUp.Top, 522, 47, 14); // Verdana

    FormMain.Set4KPanelSpecs(PanelNeoGeoMVS, 10, ButtonUp.Top+ButtonUp.Height+70, GamesList.Width, 44);
    FormMain.Set4KLabelSpecs(LabelMultiSlotMachines, 10, 10, 1862, 25, 16);
    FormMain.Set4KButtonSpecs(ButtonChangePanelNeoGeoMVS, PanelNeoGeoMVS.Width-89-4, 4, 89, 36, 16);

    PanelBottom.Height:= 71;

    ClientWidth:=  GamesList.Width+20;
    ClientHeight:= PanelNeoGeoMVS.Top+PanelNeoGeoMVS.Height+10+PanelBottom.Height;

    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonNo);

    FormMain.Set4KPanelSpecs(PanelMultiSlotMachines, 26, 100, 1943, 378);

    FormMain.Set4KListViewSpecs(MultiSlotMachines, 23, 23, 1895, 271, 16);
    FormMain.Set4KListViewHeaderFontSizeSpecs(MultiSlotMachines);
    MultiSlotMachines.CellSizes.Report.Height:= 37;

    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 0, 488);
    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 1, 100);
    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 2, 150);
    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 3, 400);
    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 4, 250);
    FormMain.Set4KListViewColumnSizeSpecs(MultiSlotMachines, 5, 500);

    MultiSlotMachines.ImagesSmall:= FormMain.IL_StandardIconsLarge;
    //MultiSlotMachines.ImagesState:= ???
    MultiSlotMachines.PaintInfoColumn.CaptionIndent:= 4; // reset to default value
    // ??? MultiSlotMachines.PaintInfoItem.ImageIndent:= 4; // reset to default value (must increase first/last column width)

    FormMain.Set4KLabelSpecs(LabelMultiSlotMachinesChooseMachineToRun, 23,
                             MultiSlotMachines.Top+MultiSlotMachines.Height+30, -1, -1, 14);

    FormMain.Set4KLabelSpecs(LabelMultiSlotMachinesBoldDefaultMachine, 992, LabelMultiSlotMachinesChooseMachineToRun.Top, -1, -1, 14);

    FormMain.Set4KButtonSpecs(ButtonCancelMultiSlotMachines,
                              MultiSlotMachines.Left+MultiSlotMachines.Width-89,
                              MultiSlotMachines.Top+MultislotMachines.Height+23, 89, 36, 16);

    FormMain.Set4KButtonSpecs(ButtonOkMultiSlotMachines,
                              ButtonCancelMultiSlotMachines.Left-89-10,
                              ButtonCancelMultiSlotMachines.Top, 89, 36, 16);
  end;
end;

procedure TFormArcadeMultiSlotGames.UpdateLabelSelectedMachine(Item: TEasyItem);
begin
  LabelMultiSlotMachines.Caption:= 'Use Machine: '+Item.Caption+'    '+
                                   Item.Captions[1]+'    '+
                                   Item.Captions[2]+'    '+
                                   '['+Item.Captions[4]+']';
  LabelMultiSlotMachines.Tag:= Item.Tag;
  LabelMultiSlotMachines.Hint:= Item.Captions[4];
end;

procedure TFormArcadeMultiSlotGames.AddMachinesMultiSlot;
var
  iLoop: Integer;
  iName, SectionStr, LastUsedName, tmpStr: String;
  MachinesIni: TMemIniFile;
  MachinesList: TStringList;
  Item: TEasyItem;
  GamesFile: THashedStringList;
  AddIcon: Boolean;
begin
  if not PanelNeoGeoMVS.Visible then
     Exit;

  if not FormMain.ValidateFile(FormMain.GetArcadeMultiSlotFile(FormArcadeMultiSlotGames.Tag)) then
     Exit;

  // this is for Neo-Geo MVS only
  SectionStr:= 'neogeo';
  MachinesIni:= TMemIniFile.Create(FormMain.GetArcadeMultiSlotFile(FormArcadeMultiSlotGames.Tag)); // (FormMain.GetArcadeFolder+'mame_multislot_machines.txt');

  MultiSlotMachines.BeginUpdate;
  MultiSlotMachines.Items.ReIndexDisable:= True;

  MachinesList:= TStringList.Create;
  MachinesIni.ReadSection(SectionStr, MachinesList);
  ButtonChangePanelNeoGeoMVS.Visible:= MachinesList.Count > 0;
  if MachinesList.Count > 0 then
  begin
    AddIcon:= FormMain.ValidateFile(FormMain.GetGamesFolderEL+GetSystemFileName(FormArcadeMultiSlotGames.Tag, 2));
    if AddIcon then
       begin
         GamesFile:= THashedStringList.Create;
         GamesFile.LoadFromFile(FormMain.GetGamesFolderEL+GetSystemFileName(FormArcadeMultiSlotGames.Tag, 2));
       end;

    LastUsedName:= MachinesIni.ReadString('lastused', SectionStr, SectionStr);

    for iLoop:=0 to MachinesList.Count-1 do
    begin
      iName:= MachinesIni.ReadString(SectionStr, MachinesList[iLoop], '');
      if iName <> '' then
      begin
        Item:= MultiSlotMachines.Items.Add;

        Item.Tag:= StrToInt(SoftListGetEntryValue(iName, 'slots'));
        if AddIcon then
           begin
             tmpStr:= GamesFile.Values[MachinesList[iLoop]];
             if tmpStr <> '' then
                Item.ImageIndex:= StrToInt(Copy(tmpStr, 1, 2))
             else
                Item.ImageIndex:= 500; // set a bogus index to show an empty space
           end;

        Item.Caption:= SoftListGetEntryValue(iName, 'title'); // machine title
        Item.Captions[1]:= SoftListGetEntryValue(iName, 'year'); // year
        Item.Captions[2]:= IntToStr(Item.Tag)+'-slot'; //SoftListGetEntryValue(iName, 'slots')+'-slot'; // slot configuration
        Item.Captions[3]:= SoftListGetEntryValue(iName, 'videochipset'); // video chipset
        Item.Captions[4]:= MachinesList[iLoop]; // machine name
        Item.Captions[5]:= SoftListGetEntryValue(iName, 'notes'); // notes
        if SameText(MachinesList[iLoop], SectionStr) then
           Item.Bold:= True;

        if MachinesList[iLoop] = LastUsedName then
           begin
             UpdateLabelSelectedMachine(Item);
             Item.Selected:= True;
             LastSelectedMachine:= Item;
           end;
      end;
    end;
    if AddIcon then
       FreeAndNil(GamesFile);
  end;

  MultiSlotMachines.Items.ReIndexDisable:= False;
  if FormMain.CheckTotal(MultiSlotMachines) then
     begin
       MultiSlotMachines.Header.Columns[0].AutoSizeToFit;
       MultiSlotMachines.Header.Columns[3].AutoSizeToFit;
       MultiSlotMachines.Header.Columns[4].AutoSizeToFit;

       iLoop:= MultiSlotMachines.Header.Columns[0].Width;
       iLoop:= MultiSlotMachines.Header.Columns[1].Width+iLoop;
       iLoop:= MultiSlotMachines.Header.Columns[2].Width+iLoop;
       iLoop:= MultiSlotMachines.Header.Columns[3].Width+iLoop;
       iLoop:= MultiSlotMachines.Header.Columns[4].Width+iLoop;
       iLoop:= MultiSlotMachines.Width-iLoop-2;
       if MultiSlotMachines.Scrollbars.VertBarVisible then
          iLoop:= iLoop-GetSystemMetrics(SM_CXVSCROLL);
       MultiSlotMachines.Header.Columns[5].Width:= iLoop;
     end;
  MultiSlotMachines.EndUpdate;

  FreeAndNil(MachinesIni);
  FreeAndNil(MachinesList);
end;

procedure TFormArcadeMultiSlotGames.UpdateSlotIndex;
var
  Item: TEasyItem;
begin
  GamesList.BeginUpdate;
  Item:= GamesList.Groups.FirstItem;
  repeat
    Item.Caption:= IntToStr(Item.Index+1);
    Item:= GamesList.Groups.NextItem(Item);
  until Item = nil;
  GamesList.EndUpdate;
end;

procedure TFormArcadeMultiSlotGames.AddMultiGames;
var
  iLoop, iTotalW: Integer;

  procedure SetColAutoFit(ColumnIndex: Integer);
  var
    MinSize: Byte;
  begin
    if not GamesList.Header.Columns[ColumnIndex].Visible then
       Exit;
    GamesList.Header.Columns[ColumnIndex].AutoSizeToFit;
    if not Is4KMode then
       GamesList.Header.Columns[ColumnIndex].Width:= GamesList.Header.Columns[ColumnIndex].Width-GamesList.ImagesSmall.Width;
    if Is4KMode then
    begin
      case ColumnIndex of
        2: MinSize:= 75;
        3: MinSize:= 100;
        4: MinSize:= 80;
        5: MinSize:= 85;
        6: MinSize:= 60;
      end;
    end
    else
    begin
      case ColumnIndex of
        2: MinSize:= 44;
        3: MinSize:= 57;
        4: MinSize:= 47;
        5: MinSize:= 49;
        6: MinSize:= 35;
      end;
    end;
    if GamesList.Header.Columns[ColumnIndex].Width < MinSize then
       GamesList.Header.Columns[ColumnIndex].Width:= MinSize;
  end;

begin
  GamesList.BeginUpdate;
  SetColAutoFit(2);
  SetColAutoFit(3);
  SetColAutoFit(4);
  SetColAutoFit(5);
  SetColAutoFit(6);

  iTotalW:= 0;
  for iLoop:=0 to GamesList.Header.Columns.Count-1 do
  begin
    if GamesList.Header.Columns[iLoop].Visible then
       iTotalW:= iTotalW+GamesList.Header.Columns[iLoop].Width;
  end;

  if iTotalW < (GamesList.Width-2) then
     GamesList.Header.Columns[1].Width:= GamesList.Header.Columns[1].Width+((GamesList.Width-2)-iTotalW);

  GamesList.EndUpdate(False);

  UpdateSlotIndex;
end;

procedure TFormArcadeMultiSlotGames.MoveToSlot(MoveUp: Boolean);
var
  selItem, newPosItem: TEasyItem;
begin
  if GamesList.Selection.Count <> 1 then
     Exit;
  selItem:= GamesList.Selection.First;
  case MoveUp of
    True : newPosItem:= GamesList.Groups.PrevItem(selItem);
    False: newPosItem:= GamesList.Groups.NextItem(selItem);
  end;
  if newPosItem <> nil then
     begin
       GamesList.Items.Exchange(selItem.Index, newPosItem.Index);
       selItem.Caption:= IntToStr(selItem.Index+1);
       newPosItem.Caption:= IntToStr(newPosItem.Index+1);

     end;
  GamesList.SetFocus;
end;

procedure TFormArcadeMultiSlotGames.FormShow(Sender: TObject);
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(GamesList);
  FormMain.ELV_ResetNormalColors(MultiSlotMachines);

  if Is4KMode then
     begin
       if not PanelNeoGeoMVS.Visible then
          FormArcadeMultiSlotGames.ClientHeight:= ClientHeight-(PanelNeoGeoMVS.Height+10);
     end
  else
     begin
       PanelMultiSlotMachines.Top:= 60; // place panel at correct position

       if PanelNeoGeoMVS.Visible then
          FormArcadeMultiSlotGames.Height:= 440 // default form height at runtime; it's bigger at design mode
       else
          FormArcadeMultiSlotGames.Height:= 440-PanelNeoGeoMVS.Height;
     end;

  SetFormColors(FormArcadeMultiSlotGames, nil, PanelBottom, nil, nil, nil, -1, True);
  if IsNightMode then
     begin
       FormMain.SetEasyListViewColors(GamesList,         menu_background_color[1], clWhite, -1, clrBorderGroupBoxGrayBk);
       FormMain.SetEasyListViewColors(MultiSlotMachines, menu_background_color[1], clWhite, -1, clrBorderGroupBoxGrayBk);

       FormMain.SetEasyListViewHeaderColors(GamesList,         True, False, Is4KMode, True);
       FormMain.SetEasyListViewHeaderColors(MultiSlotMachines, True, False, Is4KMode, True);

       FormMain.ELV_SetRibbonNightColors(0, GamesList, True);
       FormMain.ELV_SetRibbonNightColors(0, MultiSlotMachines, True);
       FormMain.SetWin10DarkScrollBar(GamesList);
       FormMain.SetWin10DarkScrollBar(MultiSlotMachines);

       SetPanelBorderColors(PanelNeoGeoMVS, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);
       PanelNeoGeoMVS.Color1:= clrLightBlack;

       SetLabelColors(LabelMultiSlotMachines, clCream, item_caption_active_shadow_color[1]);
       SetLabelColors(LabelHelpText,          clrLightRed, clMaroon);

       SetLabelColors(LabelMultiSlotMachinesChooseMachineToRun, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetLabelColors(LabelMultiSlotMachinesBoldDefaultMachine, clrLightBlue, clNavy);

       FormMain.SetPanelExStyle(PanelMultiSlotMachines, True);
       SetPanelNightColors(PanelMultiSlotMachines,
                           clrLightBlack,
                           clrDarkGray,
                           clrBorderGroupBoxGrayBk,
                           clrInnerBorderGroupBoxGrayBk);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonNo);
       FormMain.SetButtonExColors(ButtonUp);
       FormMain.SetButtonExColors(ButtonDown);
       FormMain.SetButtonExColors(ButtonRemoveFromList);
       FormMain.SetButtonExColors(ButtonChangePanelNeoGeoMVS);
       FormMain.SetButtonExColors(ButtonOkMultiSlotMachines);
       FormMain.SetButtonExColors(ButtonCancelMultiSlotMachines);
     end;

  LastSelectedMachine:= nil;
  AddMachinesMultiSlot;
  AddMultiGames;
  PanelMultiSlotMachines.Visible:= False; // cannot add items to EasyListView while "visible = FALSE" or it triggers "access violation" error
end;

procedure TFormArcadeMultiSlotGames.GamesListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  Item.Ghosted:= Item.Index > (LabelMultiSlotMachines.Tag-1);

  case Position of
    0:
     begin
       ACanvas.Font.Style:= [fsBold];
       if not Item.Ghosted then
          begin
            if IsNightMode then
               ACanvas.Font.Color:= $00f1f1f1
            else
               ACanvas.Font.Color:= clrDarkGray;
          end;
     end;
    1:
     begin
       FormMain.GetCanvasDefaultFont(ACanvas, Item.Tag, Item.StateImageIndexes[7], IsNightMode, Is4KMode);
     end;
  end;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
  if Item.Ghosted then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormArcadeMultiSlotGames.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonNo.Click;
  end;
end;

procedure TFormArcadeMultiSlotGames.GamesListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Ord(Item.Tag = 1), GamesList);
end;

procedure TFormArcadeMultiSlotGames.ButtonUpClick(Sender: TObject);
begin
  MoveToSlot(Boolean(TBitBtnEx(Sender).Tag));
end;

procedure TFormArcadeMultiSlotGames.ButtonRemoveFromListClick(Sender: TObject);
begin
  GamesList.BeginUpdate;
  GamesList.Selection.DeleteSelected(True);
  GamesList.EndUpdate;
  UpdateSlotIndex;
end;

procedure TFormArcadeMultiSlotGames.GamesListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_UP, VK_DOWN:
      begin
        if Shift = [ssCtrl] then
           begin
             if CharCode = VK_UP then
                ButtonUp.Click
             else
                ButtonDown.Click;
           end;
      end;
    VK_DELETE: ButtonRemoveFromList.Click;
  end;
end;

procedure TFormArcadeMultiSlotGames.ButtonChangePanelNeoGeoMVSClick(
  Sender: TObject);
begin
  PanelMultiSlotMachines.Visible:= True;
  ButtonOk.Enabled:= False;
  MultiSlotMachines.SetFocus;
end;

procedure TFormArcadeMultiSlotGames.ButtonOkMultiSlotMachinesClick(
  Sender: TObject);
begin
  if FormMain.CheckSelected(MultiSlotMachines) then
     begin
       LastSelectedMachine:= MultiSlotMachines.Selection.First;
       UpdateLabelSelectedMachine(MultiSlotMachines.Selection.First);
     end;

  PanelMultiSlotMachines.Visible:= False;
  ButtonOk.Enabled:= True;
end;

procedure TFormArcadeMultiSlotGames.MultiSlotMachinesDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  ButtonOkMultiSlotMachines.Click;
end;

procedure TFormArcadeMultiSlotGames.MultiSlotMachinesKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_RETURN then
     ButtonOkMultiSlotMachines.Click;
end;

procedure TFormArcadeMultiSlotGames.ButtonCancelMultiSlotMachinesClick(
  Sender: TObject);
begin
  LastSelectedMachine.Selected:= True;
  PanelMultiSlotMachines.Visible:= False;
  ButtonOk.Enabled:= True;
end;

procedure TFormArcadeMultiSlotGames.MultiSlotMachinesItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Bold then
     begin
       ACanvas.Font.Name:=  FormMain.Get4KFontBold;
       ACanvas.Font.Color:= item_caption_active_color[1];
     end;
end;

end.
