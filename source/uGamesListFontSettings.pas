unit uGamesListFontSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  MPCommonObjects, EasyListview, StdCtrls, ImgList,
  MPCommonUtilities, ExtCtrls, Buttons, PanelEx;

type
  TFormGamesListFontSettings = class(TForm)
    IL_FontSettings: TImageList;
    GamesFont: TEasyListview;
    ButtonResetFont: TBitBtn;
    ButtonDefaultFont: TBitBtn;
    ButtonCopyParentFont: TBitBtn;
    ButtonClearSelection: TBitBtn;
    Shape1: TShape;
    PanelEx1: TPanelEx;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
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
    tFont_Parent, tFont_Clone, tFont_Preliminary, tFont_MissingROMs, tFont_MissingROMsPreliminary: TFont;
    procedure PopulateELV;
    procedure SelectGameFont(FontHolder: TFont; TitleID: ShortInt);
    procedure InitializeFont(var tFontVar: TFont; gameFont: TFont);
    procedure UpdateFont(tFont: TFont; var gameFont: TFont);
    procedure ModifyFont(const fID: ShortInt);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGamesListFontSettings: TFormGamesListFontSettings;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormGamesListFontSettings.PopulateELV;

  procedure AddItem(Index: ShortInt; ItemCaption: String; IsNormal: Boolean = True);
  begin
    with GamesFont.Items.Add do
    begin
      ImageIndex:= Index;
      Caption:= ItemCaption;
      Tag:= Ord(not IsNormal);
    end;
  end;

begin
  GamesFont.BeginUpdate;
  AddItem(0, 'Select a Font for Parent Games');
  AddItem(1, 'Select a Font for Clone Games');
  AddItem(2, 'Select a Font for Preliminary Games');
  AddItem(3, 'Select a Font for Games With Missing ROMs/CHDs', False);
  AddItem(4, 'Select a Font for Preliminary Games With Missing ROMs/CHDs', False); 
  GamesFont.EndUpdate;
  GamesFont.Groups.FirstItem.Selected:= True;
  GamesFont.Selection.FocusedItem:= GamesFont.Groups.FirstItem;
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
  tFontVar.Color:= gameFont.Color;
  tFontVar.Name:= gameFont.Name;
  tFontVar.Size:= gameFont.Size;
  tFontVar.Style:= gameFont.Style;
end;

procedure TFormGamesListFontSettings.UpdateFont(tFont: TFont; var gameFont: TFont);
begin
  gameFont.Color:= tFont.Color;
  gameFont.Name:= tFont.Name;
  gameFont.Size:= tFont.Size;
  gameFont.Style:= tFont.Style;
end;

procedure TFormGamesListFontSettings.ModifyFont(const fID: ShortInt);
begin
  case fID of
    0: SelectGameFont(tFont_Parent, fID);
    1: SelectGameFont(tFont_Clone, fID);
    2: SelectGameFont(tFont_Preliminary, fID);
    3: SelectGameFont(tFont_MissingROMs, fID);
    4: SelectGameFont(tFont_MissingROMsPreliminary, fID);
  end;
end;

procedure TFormGamesListFontSettings.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(GamesFont);
  FormMain.ELV_SetBackgroundColor(GamesFont);
  if FormMain.GamesListView.BackGround.Enabled then
     begin
       GamesFont.BackGround.Image.Assign(FormMain.GamesListView.BackGround.Image);
       GamesFont.BackGround.Tile:= FormMain.GamesListView.BackGround.Tile;
       GamesFont.BackGround.Enabled:= True;
     end;

  InitializeFont(tFont_Parent, FormMain.Font_Parent);
  InitializeFont(tFont_Clone, FormMain.Font_Clone);
  InitializeFont(tFont_Preliminary, FormMain.Font_Preliminary);
  InitializeFont(tFont_MissingROMs, FormMain.Font_MissingROMs);
  InitializeFont(tFont_MissingROMsPreliminary, FormMain.Font_MissingROMsPreliminary);
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
    0: ACanvas.Font:= tFont_Parent;
    1: ACanvas.Font:= tFont_Clone;
    2: ACanvas.Font:= tFont_Preliminary;
    3: ACanvas.Font:= tFont_MissingROMs;
    4: ACanvas.Font:= tFont_MissingROMsPreliminary;
  end;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
end;

procedure TFormGamesListFontSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
     begin
       UpdateFont(tFont_Parent, FormMain.Font_Parent);
       UpdateFont(tFont_Clone, FormMain.Font_Clone);
       UpdateFont(tFont_Preliminary, FormMain.Font_Preliminary);
       UpdateFont(tFont_MissingROMs, FormMain.Font_MissingROMs);
       UpdateFont(tFont_MissingROMsPreliminary, FormMain.Font_MissingROMsPreliminary);
       FormMain.GamesListView.Refresh;
     end;
  tFont_Parent.Free;
  tFont_Clone.Free;
  tFont_Preliminary.Free;
  tFont_MissingROMs.Free;
  tFont_MissingROMsPreliminary.Free;
end;

procedure TFormGamesListFontSettings.ButtonResetFontClick(Sender: TObject);
begin
  InitializeFont(tFont_Parent, FormMain.Font_Parent);
  InitializeFont(tFont_Clone, FormMain.Font_Clone);
  InitializeFont(tFont_Preliminary, FormMain.Font_Preliminary);
  InitializeFont(tFont_MissingROMs, FormMain.Font_MissingROMs);
  InitializeFont(tFont_MissingROMsPreliminary, FormMain.Font_MissingROMsPreliminary);
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.ButtonDefaultFontClick(
  Sender: TObject);
begin
  FormMain.SetDefaultFont(tFont_Parent, 0);
  FormMain.SetDefaultFont(tFont_Clone, 1);
  FormMain.SetDefaultFont(tFont_Preliminary, 2);
  FormMain.SetDefaultFont(tFont_MissingROMs, 3);
  FormMain.SetDefaultFont(tFont_MissingROMsPreliminary, 4);
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.GamesFontKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_RETURN then
     begin
       if FormMain.CheckSelected(GamesFont) then
          ModifyFont(GamesFont.Selection.First.ImageIndex);
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
     ModifyFont(GamesFont.Selection.First.ImageIndex);
end;

procedure TFormGamesListFontSettings.ButtonCopyParentFontClick(
  Sender: TObject);
begin
  UpdateFont(tFont_Parent, tFont_Clone);
  UpdateFont(tFont_Parent, tFont_Preliminary);
  UpdateFont(tFont_Parent, tFont_MissingROMs);
  UpdateFont(tFont_Parent, tFont_MissingROMsPreliminary);
  GamesFont.Refresh;
  GamesFont.SetFocus;
end;

end.
