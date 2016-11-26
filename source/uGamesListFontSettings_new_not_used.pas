unit uGamesListFontSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  MPCommonObjects, EasyListview, StdCtrls, ImgList,
  MPCommonUtilities, ExtCtrls, Buttons, PanelEx, uCommon;

type
  TGameCustomFont = record
    eFontParent,
    eFontClone,
    eFontPreliminary,
    eFontMissingROMs,
    eFontMissingROMsPreliminary: TFont;
  end;

  TFormGamesListFontSettings = class(TForm)
    IL_FontSettings: TImageList;
    GamesFont: TEasyListview;
    PanelBottomButtons: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PanelBottomListButtons: TPanelEx;
    ButtonClearSelection: TBitBtn;
    ButtonCopyParentFont: TBitBtn;
    ButtonDefaultFont: TBitBtn;
    ButtonResetFont: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GamesFontItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonResetFontClick(Sender: TObject);
    procedure ButtonDefaultFontClick(Sender: TObject);
    procedure GamesFontKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonClearSelectionClick(Sender: TObject);
    procedure GamesFontItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure GamesFontDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure ButtonCopyParentFontClick(Sender: TObject);
  private
    tGameFont: TGameFontArray;
    tFont_Parent, tFont_Clone, tFont_Preliminary, tFont_MissingROMs, tFont_MissingROMsPreliminary: array[0..MaxArcadeSystems] of TFont;
    function  IsFontSameAsAllSystems(sysID: Byte; FontID: ShortInt): Boolean;
    procedure InitAllFonts;
    procedure PopulateELV;
    procedure SelectGameFont(FontHolder: TFont; TitleID: ShortInt);
    procedure InitializeFont(var tFontVar: TFont; gameFont: TFont);
    procedure UpdateFont(tFont: TFont; var gameFont: TFont);
    procedure ModifyFont(sysID, FontID: ShortInt);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGamesListFontSettings: TFormGamesListFontSettings;

implementation

uses uMain;

{$R *.dfm}

function TFormGamesListFontSettings.IsFontSameAsAllSystems(sysID: Byte; FontID: ShortInt): Boolean;
var
  tempFont: TFont;
begin
  Result:= True;
  case FontID of
    0: Result:= tFont_Parent[sysID] = tFont_Parent[0];
    1: Result:= tFont_Clone[sysID] = tFont_Clone[0];
    2: Result:= tFont_Preliminary[sysID] = tFont_Preliminary[0];
    3: Result:= tFont_MissingROMs[sysID] = tFont_MissingROMs[0];
    4: Result:= tFont_MissingROMsPreliminary[sysID] = tFont_MissingROMsPreliminary[0];
  end;
end;

procedure TFormGamesListFontSettings.InitAllFonts;
var
  iLoop: Integer;
begin
  for iLoop:= 0 to MaxArcadeSystems do
  begin
    tGameFont[idMAME, 0]:= TFont.Create;
  end;

end;

procedure TFormGamesListFontSettings.PopulateELV;
var
  Group: TEasyGroup;
  Loop: Integer;

  function AddGroup(sysID: ShortInt): Boolean;
  begin
    Result:= True;
    Group:= GamesFont.Groups.Add;
    Group.ImageIndex:= sysID;
    if sysID > 0 then
       Group.Caption:= FormMain.GetEmulatorDescription(sysID)
    else
       Group.Caption:= 'All Systems';
  end;

  function AddItem(Index: ShortInt; ItemCaption: String; IsNormal: Boolean = True): Boolean;
  begin
    Result:= True;
    with Group.Items.Add do
    begin
      ImageIndex:= Index;
      StateImageIndex:= Group.ImageIndex; // hold system ID
      Caption:= ItemCaption;
      Tag:= Ord(not IsNormal);
    end;

    //with GamesFont.Items.Add do
    //begin
    //  ImageIndex:= Index;
    //  Caption:= ItemCaption;
    //  Tag:= Ord(not IsNormal);
    //end;
  end;

begin
  GamesFont.BeginUpdate;
  for Loop:= Low(tFont_Parent) to High(tFont_Parent) do
  begin
    AddGroup(Loop); // all systems
    AddItem(0, 'Select a Font for Parent Games');
    AddItem(1, 'Select a Font for Clone Games');
    AddItem(2, 'Select a Font for Preliminary Games');
    AddItem(3, 'Select a Font for Games With Missing ROMs/CHDs', False);
    AddItem(4, 'Select a Font for Preliminary Games With Missing ROMs/CHDs', False);
    GamesFont.EndUpdate;
  end;
  //GamesFont.Groups.FirstItem.Selected:= True;
  //GamesFont.Selection.FocusedItem:= GamesFont.Groups.FirstItem;
end;

procedure TFormGamesListFontSettings.SelectGameFont(FontHolder: TFont; TitleID: ShortInt);
begin
  FormMain.FontDialog.Font:= FontHolder;
  FormMain.FontDialog.Tag:= TitleID;
  if not FormMain.FontDialog.Execute then
     Exit;
  FontHolder.Color:= FormMain.FontDialog.Font.Color;
  FontHolder.Name:= FormMain.FontDialog.Font.Name;
  FontHolder.Size:= FormMain.FontDialog.Font.Size;
  FontHolder.Style:= FormMain.FontDialog.Font.Style;
  GamesFont.Refresh;
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.InitializeFont(var tFontVar: TFont; gameFont: TFont);
begin
  if not Assigned(tFontVar) then
       tFontVar:= TFont.Create;
  if gameFont <> nil then
  begin
    tFontVar.Color:= gameFont.Color;
    tFontVar.Name:= gameFont.Name;
    tFontVar.Size:= gameFont.Size;
    tFontVar.Style:= gameFont.Style;
  end
  else
  begin
    //if FontID > 0 then
    //begin
    //  tFontVar.Color:= gameFont.Color;
    //  tFontVar.Name:= gameFont.Name;
    //  tFontVar.Size:= gameFont.Size;
    //  tFontVar.Style:= gameFont.Style;
    //end;
  end;
end;

procedure TFormGamesListFontSettings.UpdateFont(tFont: TFont; var gameFont: TFont);
begin
  gameFont.Color:= tFont.Color;
  gameFont.Name:= tFont.Name;
  gameFont.Size:= tFont.Size;
  gameFont.Style:= tFont.Style;
end;

procedure TFormGamesListFontSettings.ModifyFont(sysID, FontID: ShortInt);
begin
  case FontID of
    0: SelectGameFont(tFont_Parent[sysID], FontID);
    1: SelectGameFont(tFont_Clone[sysID], FontID);
    2: SelectGameFont(tFont_Preliminary[sysID], FontID);
    3: SelectGameFont(tFont_MissingROMs[sysID], FontID);
    4: SelectGameFont(tFont_MissingROMsPreliminary[sysID], FontID);
  end;
end;

procedure TFormGamesListFontSettings.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  FormMain.ELV_ResetNormalColors(GamesFont);
  FormMain.ELV_SetBackgroundColor(GamesFont);
  if FormMain.GamesListView.BackGround.Enabled then
     begin
       GamesFont.BackGround.Image.Assign(FormMain.GamesListView.BackGround.Image);
       GamesFont.BackGround.Tile:= FormMain.GamesListView.BackGround.Tile;
       GamesFont.BackGround.Enabled:= True;
     end;

  for Loop:= Low(tFont_Parent) to High(tFont_Parent) do
  begin
    InitializeFont(tFont_Parent[Loop], FormMain.Font_Parent[Loop]);
    InitializeFont(tFont_Clone[Loop], FormMain.Font_Clone[Loop]);
    InitializeFont(tFont_Preliminary[Loop], FormMain.Font_Preliminary[Loop]);
    InitializeFont(tFont_MissingROMs[Loop], FormMain.Font_MissingROMs[Loop]);
    InitializeFont(tFont_MissingROMsPreliminary[Loop], FormMain.Font_MissingROMsPreliminary[Loop]);
  end;
  PopulateELV;
end;

procedure TFormGamesListFontSettings.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormGamesListFontSettings.GamesFontItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Item.ImageIndex of
    0: ACanvas.Font:= tFont_Parent[Item.StateImageIndex];
    1: ACanvas.Font:= tFont_Clone[Item.StateImageIndex];
    2: ACanvas.Font:= tFont_Preliminary[Item.StateImageIndex];
    3: ACanvas.Font:= tFont_MissingROMs[Item.StateImageIndex];
    4: ACanvas.Font:= tFont_MissingROMsPreliminary[Item.StateImageIndex];
  end;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormGamesListFontSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  iLoop: Integer;
begin
  if ModalResult = mrOk then
     begin
       for iLoop:= Low(tFont_Parent) to High(tFont_Parent) do
       begin
         UpdateFont(tFont_Parent[iLoop], FormMain.Font_Parent[iLoop]);
         UpdateFont(tFont_Clone[iLoop], FormMain.Font_Clone[iLoop]);
         UpdateFont(tFont_Preliminary[iLoop], FormMain.Font_Preliminary[iLoop]);
         UpdateFont(tFont_MissingROMs[iLoop], FormMain.Font_MissingROMs[iLoop]);
         UpdateFont(tFont_MissingROMsPreliminary[iLoop], FormMain.Font_MissingROMsPreliminary[iLoop]);
       end;
       FormMain.GamesListView.Refresh;
     end;
  for iLoop:= Low(tFont_Parent) to High(tFont_Parent) do
  begin
    tFont_Parent[iLoop].Free;
    tFont_Clone[iLoop].Free;
    tFont_Preliminary[iLoop].Free;
    tFont_MissingROMs[iLoop].Free;
    tFont_MissingROMsPreliminary[iLoop].Free;
  end;
end;

procedure TFormGamesListFontSettings.ButtonResetFontClick(Sender: TObject);
begin
  InitializeFont(tFont_Parent[0], FormMain.Font_Parent[0]);
  InitializeFont(tFont_Clone[0], FormMain.Font_Clone[0]);
  InitializeFont(tFont_Preliminary[0], FormMain.Font_Preliminary[0]);
  InitializeFont(tFont_MissingROMs[0], FormMain.Font_MissingROMs[0]);
  InitializeFont(tFont_MissingROMsPreliminary[0], FormMain.Font_MissingROMsPreliminary[0]);
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.ButtonDefaultFontClick(
  Sender: TObject);
begin
  FormMain.SetDefaultFont(tFont_Parent[0], 0);
  FormMain.SetDefaultFont(tFont_Clone[0], 1);
  FormMain.SetDefaultFont(tFont_Preliminary[0], 2);
  FormMain.SetDefaultFont(tFont_MissingROMs[0], 3);
  FormMain.SetDefaultFont(tFont_MissingROMsPreliminary[0], 4);
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.GamesFontKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_RETURN then
     begin
       if FormMain.CheckSelected(GamesFont) then
          ModifyFont(GamesFont.Selection.First.StateImageIndex, GamesFont.Selection.First.ImageIndex);
     end;
end;

procedure TFormGamesListFontSettings.ButtonClearSelectionClick(
  Sender: TObject);
begin
  GamesFont.Selection.ClearAll;
end;

procedure TFormGamesListFontSettings.GamesFontItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     FormMain.ELV_SetSelectRibbon(Item.Tag, GamesFont);
end;

procedure TFormGamesListFontSettings.GamesFontDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; ShiftState: TShiftState; var Handled: Boolean);
begin
  if FormMain.CheckSelected(GamesFont) then
     ModifyFont(GamesFont.Selection.First.StateImageIndex, GamesFont.Selection.First.ImageIndex);
end;

procedure TFormGamesListFontSettings.ButtonCopyParentFontClick(
  Sender: TObject);
var
  sysID: ShortInt;
begin
  if not FormMain.CheckSelected(GamesFont) then
     Exit;

  sysID:= GamesFont.Selection.First.StateImageIndex;
  UpdateFont(tFont_Parent[sysID], tFont_Clone[sysID]);
  UpdateFont(tFont_Parent[sysID], tFont_Preliminary[sysID]);
  UpdateFont(tFont_Parent[sysID], tFont_MissingROMs[sysID]);
  UpdateFont(tFont_Parent[sysID], tFont_MissingROMsPreliminary[sysID]);
  GamesFont.Refresh;
  GamesFont.SetFocus;
end;

end.
