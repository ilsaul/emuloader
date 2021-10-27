unit uGamesListFontSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  MPCommonObjects, EasyListview, StdCtrls, ImgList, GraphicEx,
  MPCommonUtilities, ExtCtrls, Buttons, PanelEx, uCommon, uCommonCustom,
  Menus, BarMenus, ShadowLabel, AdvOfficeButtons, EditEx, ButtonsEx, ColorBoxEx;

type
  TFormGamesListFontSettings = class(TForm)
    IL_FontSettings: TImageList;
    GamesFont: TEasyListview;
    PopupFontSettings: TBcBarPopupMenu;
    PopupResetAllToCurrentFonts: TMenuItem;
    PopupSetSelectedToDefaultFonts: TMenuItem;
    PopupCopyFontFromArcadeParentFont: TMenuItem;
    N1: TMenuItem;
    PopupSetFontsToMatchAllSystemsFont: TMenuItem;
    PopupResetSelectedToCurrentFonts: TMenuItem;
    PopupSetAllToDefaultFonts: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PanelBottom: TPanelEx;
    GamesBackgroundColor: TColorBoxEx;
    ButtonDefaultBkSortedColor: TBitBtnEx;
    GamesBackgroundImageEnable: TAdvOfficeCheckBoxEx;
    GamesBackgroundImage: TEditEx;
    GamesTileBackground: TAdvOfficeCheckBoxEx;
    GamesBackgroundImageButtonUpdate: TBitBtnEx;
    GamesBackgroundImageButtonSelect: TBitBtnEx;
    LabelBackgroundColor: TShadowLabel;
    Label1: TLabel;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    PopupShowAvailableSystemsOnly: TMenuItem;
    PopupHelp: TMenuItem;
    PopupSetAllConsoleComputerSystemsFontsToAllSystems: TMenuItem;
    N4: TMenuItem;
    PopupSetAllToArcadeParentGameFont: TMenuItem;
    PopupCopyAllFontsFromLightMode: TMenuItem;
    N5: TMenuItem;
    PopupCopySelectedFontsFromLightMode: TMenuItem;
    PopupShowFontName: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GamesFontItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GamesFontKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure GamesFontItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure GamesFontDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      ShiftState: TShiftState; var Handled: Boolean);
    procedure PopupFontSettingsMeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure PopupSetSelectedToDefaultFontsClick(Sender: TObject);
    procedure PopupSetAllToDefaultFontsClick(Sender: TObject);
    procedure GamesBackgroundColorSelect(Sender: TObject);
    procedure ButtonDefaultBkSortedColorClick(Sender: TObject);
    procedure GamesBackgroundImageEnableClick(Sender: TObject);
    procedure GamesTileBackgroundClick(Sender: TObject);
    procedure GamesBackgroundImageButtonSelectClick(Sender: TObject);
    procedure GamesBackgroundImageButtonUpdateClick(Sender: TObject);
    procedure PopupShowAvailableSystemsOnlyClick(Sender: TObject);
    procedure PopupSetFontsToMatchAllSystemsFontClick(Sender: TObject);
    procedure PopupSetAllConsoleComputerSystemsFontsToAllSystemsClick(
      Sender: TObject);
    procedure PopupHelpClick(Sender: TObject);
    procedure PopupShowFontNameClick(Sender: TObject);
    procedure GamesFontItemImageDrawIsCustom(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var IsCustom: Boolean);
    procedure GamesFontItemImageGetSize(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; var ImageWidth,
      ImageHeight: Integer);
    procedure GamesFontItemImageDraw(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: TEasyColumn; ACanvas: TCanvas;
      const RectArray: TEasyRectArrayObject;
      AlphaBlender: TEasyAlphaBlender);
  private
    ArcadeSystemsHave: Boolean;
    tFont_Parent, tFont_Clone, tFont_Preliminary, tFont_MissingROMs, tFont_MissingROMsPreliminary: TFont;
    PixelsMin, PixelsMax: Integer;
    tFont_ConsoleComputer: array[1..MaxConsoleComputerSystems] of TFont;
    //ScrollBarLastVisible: Boolean;
    //FontNameDetail_Index, FontSizeDetail_Index: ShortInt;
    TileDetailsTextColor: TColor;
    procedure DeInitConsoleComputerFonts(IsMainFontsArray: Boolean);
    procedure UpdateFontSizeInfo(Item: TEasyItem; UpdatePixelsLabel: Boolean = False);
    function  IsArcadeSystem(Item: TEasyItem): Boolean;
    //procedure ELV_UpdateScrollBar;
    procedure UpdateFontSizeInfoAllSystems;
    procedure PopulateELV;
    //procedure InitializeFont(var tempFontVar: TFont; MainGamesListFont: TFont; AutoCreateFontVar: Boolean);
    procedure ModifyFont(ItemToUpdate: TEasyItem);
    procedure ResizeForm;
    procedure Resize4K;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGamesListFontSettings: TFormGamesListFontSettings;

implementation

uses uMain;

{$R *.dfm}

procedure TFormGamesListFontSettings.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormGamesListFontSettings do
  begin
    FormMain.Set4KImageListSpecs(IL_FontSettings, 128);
    Font.Size:= 16;

    GamesFont.Align:= alNone;
    GamesFont.CellSizes.Tile.Height:= 144;
    GamesFont.CellSizes.Tile.Width:=  600;
    GamesFont.PaintInfoItem.TileDetailTextIndent:= FormMain.IL_SystemType_ExtraLarge.Width-6;
    FormMain.Set4KListViewSpecs(GamesFont, -1, -1, (GamesFont.CellSizes.Tile.Width*6)+20, GamesFont.CellSizes.Tile.Height*12, 16);

    PanelBottom.Height:= 90;

    ClientWidth:=  GamesFont.Width-20;
    ClientHeight:= GamesFont.Height+PanelBottom.Height;

    FormMain.Set4KLabelSpecs(LabelBackgroundColor, 10, 8, -1, -1, 16);
    FormMain.Set4KColorBoxSpecs(GamesBackgroundColor, 10, 44);
    FormMain.Set4KButtonSpecs(ButtonDefaultBkSortedColor, GamesBackgroundColor.Left+GamesBackgroundColor.Width+5, GamesBackgroundColor.Top, 89, 36, 16);

    FormMain.Set4KCheckBoxSpecs(GamesBackgroundImageEnable, ButtonDefaultBkSortedColor.Left+ButtonDefaultBkSortedColor.Width+19, 6, 345, 36, 16);
    FormMain.Set4KEditSpecs(GamesBackgroundImage, GamesBackgroundImageEnable.Left, 44, 950, 36, 16);
    FormMain.Set4KButtonSpecs(GamesBackgroundImageButtonSelect, GamesBackgroundImage.Left+GamesBackgroundImage.Width+5,
                                                                GamesBackgroundImage.Top, 89, 36, 16);
    FormMain.Set4KButtonSpecs(GamesBackgroundImageButtonUpdate, GamesBackgroundImageButtonSelect.Left+GamesBackgroundImageButtonSelect.Width+3,
                                                                GamesBackgroundImage.Top, 89, 36, 16);

    FormMain.Set4KCheckBoxSpecs(GamesTileBackground, GamesBackgroundImage.Left+GamesBackgroundImage.Width-60, 6, 65, 36, 16);

    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
    ButtonOk.Top:= (PanelBottom.Height-ButtonOk.Height)-10;
    ButtonCancel.Top:= ButtonOk.Top;
  end;
end;

procedure TFormGamesListFontSettings.DeInitConsoleComputerFonts(IsMainFontsArray: Boolean);
var
  Loop: Integer;
begin
  for Loop:= 1 to MaxConsoleComputerSystems do
  begin
    if IsMainFontsArray then
       FreeAndNil(FormMain.Font_ConsoleComputer[Loop])
    else
       FreeAndNil(tFont_ConsoleComputer[Loop]);
  end;
end;

procedure TFormGamesListFontSettings.UpdateFontSizeInfo(Item: TEasyItem; UpdatePixelsLabel: Boolean = False);
var
  NewPixelsValue, FontSizeValue, DetailLine: Integer;
  FontNameValue: WideString;

  function GetFontParamsStr(var FontSource: TFont): String;
  begin
    if Assigned(FontSource) then
       begin
         NewPixelsValue:= FormMain.GetFontHeightSize(FontSource);
         FontNameValue:=  FontSource.Name;
         FontSizeValue:=  FontSource.Size;
       end
    else
       begin
         NewPixelsValue:= FormMain.GetFontHeightSize(GamesFont.Font);
         FontNameValue:=  GamesFont.Font.Name;
         FontSizeValue:=  GamesFont.Font.Size;
       end;
  end;

begin
  NewPixelsValue:= -1;
  case Item.Index of
    0: GetFontParamsStr(tFont_Parent);
    1: GetFontParamsStr(tFont_Clone);
    2: GetFontParamsStr(tFont_Preliminary);
    3: GetFontParamsStr(tFont_MissingROMs);
    4: GetFontParamsStr(tFont_MissingROMsPreliminary);
    5: // all systems
      begin
        NewPixelsValue:= FormMain.GetFontHeightSize(GamesFont.Font);
        FontNameValue:= GamesFont.Font.Name;
        FontSizeValue:= GamesFont.Font.Size;
      end;
  else
      GetFontParamsStr(tFont_ConsoleComputer[Item.StateImageIndex]);
  end;

  if PixelsMin = -1 then
     PixelsMin:= NewPixelsValue;
  if PixelsMax = -1 then
     PixelsMax:= NewPixelsValue;

  if NewPixelsValue <= PixelsMin then
     PixelsMin:= NewPixelsValue
  else
  if NewPixelsValue >= PixelsMax then
     PixelsMax:= NewPixelsValue;

  if PopupShowFontName.Checked then
     begin
       //Item.Captions[1]:= '  font name: '+FontNameValue;
       Item.Captions[1]:= '  font: '+FontNameValue;
       Item.Details[1]:= 1;
     end;

  DetailLine:= Ord(PopupShowFontName.Checked)+1; // PopupShowFontName.Checked + 1 -> either Captions[1] or Captions[2]
  //Item.Captions[DetailLine]:= '  font size: '+IntToStr(FontSizeValue)+' - height: '+IntToStr(NewPixelsValue)+' pixels ';
  Item.Captions[DetailLine]:= '  size: '+IntToStr(FontSizeValue)+' - height: '+IntToStr(NewPixelsValue)+' pixels ';

  Item.Details[DetailLine]:= DetailLine;

  if PixelsMin > PixelsMax then
     begin
       NewPixelsValue:= PixelsMin;
       PixelsMin:= PixelsMax;
       PixelsMax:= NewPixelsValue;
     end;
end;

function TFormGamesListFontSettings.IsArcadeSystem(Item: TEasyItem): Boolean;
begin
  Result:= Item.StateImageIndex = -1;
end;

procedure TFormGamesListFontSettings.UpdateFontSizeInfoAllSystems;
var
  Item: TEasyItem;
begin
  GamesFont.BeginUpdate;
  Item:= GamesFont.Groups.FirstItem;
  repeat
    UpdateFontSizeInfo(Item);
    Item:= GamesFont.Groups.NextItem(Item);
  until Item = nil;
  GamesFont.EndUpdate;
end;

procedure TFormGamesListFontSettings.PopulateELV;
var
  Item: TEasyItem;

  function AddItem(Index: ShortInt; ItemCaption: String; CustomSysID: ShortInt = -1; IsNormal: Boolean = True): Boolean;
  begin
    Result:= True;
    Item:= GamesFont.Items.Insert(0);
    Item.ImageIndex:= Index; // to display the icons only, nothing more...
    Item.StateImageIndex:= CustomSysID; // to keep track of console/computer system IDs (EmuCon)
    Item.Caption:= ItemCaption;
    Item.Tag:= Ord(not IsNormal); // for the selection ribbon; 1 (True) -> normal blue color; 0 (False) -> Missing ROMs red color
    Item.Details[1]:= 1;
  end;

begin
  ELV_PopulateCustomSystems(GamesFont, -1, 4, True);
  GamesFont.BeginUpdate;
  GamesFont.Items.ReIndexDisable:= True;
  AddItem(5, 'All Computer/Console Systems', 0);
  AddItem(4, 'Missing ROMs, Preliminary', -1, False);
  AddItem(3, 'Missing ROMs/CHDs', -1, False);
  AddItem(2, 'Preliminary Set');
  AddItem(1, 'Clone Set');
  AddItem(0, 'Parent Set');

  GamesFont.Items.ReIndexDisable:= False;

  GamesFont.EndUpdate;
  GamesFont.BeginUpdate;
  Item:= GamesFont.Groups.FirstItem;
  repeat
    if IsArcadeSystem(Item) then
       begin
         Item.Visible:= ArcadeSystemsHave;
         UpdateFontSizeInfo(Item)
       end
    else
    begin
      Item.Details[1]:= 1;
      UpdateFontSizeInfo(Item);
      if PopupShowAvailableSystemsOnly.Checked then
         begin
           if Item.StateImageIndex > 0 then
              Item.Visible:= FormMain.IsSystemAvailable(Item.StateImageIndex, True);
         end;
    end;

    Item:= GamesFont.Groups.NextItem(Item);
  until Item = nil;
  GamesFont.EndUpdate;

  GamesFont.Groups.FirstItem.Selected:= True;
  GamesFont.Selection.FocusedItem:= GamesFont.Groups.FirstItem;
  UpdateFontSizeInfo(GamesFont.Groups.FirstItem, True);
end;

procedure TFormGamesListFontSettings.ModifyFont(ItemToUpdate: TEasyItem);
begin
  if IsArcadeSystem(ItemToUpdate) then
     begin
       // MAME and arcade
       case ItemToUpdate.ImageIndex of
         0: FormMain.FontDialog.Font:= tFont_Parent;
         1: FormMain.FontDialog.Font:= tFont_Clone;
         2: FormMain.FontDialog.Font:= tFont_Preliminary;
         3: FormMain.FontDialog.Font:= tFont_MissingROMs;
         4: FormMain.FontDialog.Font:= tFont_MissingROMsPreliminary;
       end;
     end
   else
     begin
       if ItemToUpdate.StateImageIndex = 0 then // "All Systems"
          FormMain.FontDialog.Font:= GamesFont.Font
       else
       if Assigned(tFont_ConsoleComputer[ItemToUpdate.StateImageIndex]) then
          FormMain.FontDialog.Font:= tFont_ConsoleComputer[ItemToUpdate.StateImageIndex]
       else
          FormMain.FontDialog.Font:= GamesFont.Font;
     end;

  //FormMain.FontDialog.Tag:= TitleID; // to show proper title in the FontDialog component
  if not FormMain.FontDialog.Execute then
     begin
       GamesFont.SetFocus;
       Exit;
     end;

  GamesFont.BeginUpdate;
  if IsArcadeSystem(ItemToUpdate) then
     begin
       case ItemToUpdate.ImageIndex of
         0: FormMain.SetFont(FormMain.FontDialog.Font, tFont_Parent);
         1: FormMain.SetFont(FormMain.FontDialog.Font, tFont_Clone);
         2: FormMain.SetFont(FormMain.FontDialog.Font, tFont_Preliminary);
         3: FormMain.SetFont(FormMain.FontDialog.Font, tFont_MissingROMs);
         4: FormMain.SetFont(FormMain.FontDialog.Font, tFont_MissingROMsPreliminary);
       end;
     end
  else
     begin
       if ItemToUpdate.StateImageIndex = 0 then // "All Systems"
          GamesFont.Font:= FormMain.FontDialog.Font
       else
          begin
            if FormMain.IsSameFont(FormMain.FontDialog.Font, GamesFont.Font) then
               FreeAndNil(tFont_ConsoleComputer[ItemToUpdate.StateImageIndex])
            else
               FormMain.SetFont(FormMain.FontDialog.Font, tFont_ConsoleComputer[ItemToUpdate.StateImageIndex], True);
          end;
     end;

  UpdateFontSizeInfo(ItemToUpdate, True);
  if ItemToUpdate.StateImageIndex = 0 then // "All Systems"
     UpdateFontSizeInfoAllSystems;
  GamesFont.EndUpdate;
end;

procedure TFormGamesListFontSettings.ResizeForm;
var
  iNewWidth, iNewHeight: Integer;
  iWidth, iHeight, ItemsColCount, ItemsLineCount: Integer;
begin
  if Is4KMode then
     Exit;

  iWidth:=  Screen.Width;
  iHeight:= Screen.Height;

  if (iWidth >= 3840) and (iHeight >= 2160) then
     begin // set screen size to 2560x1440 (1440p)
       iWidth:=  2560;
       iHeight:= 1440;
     end;

  if iWidth >= 1920 then // 1280 then
     begin
       FormMain.Set4KImageListSpecs(IL_FontSettings, 68);
       GamesFont.PaintInfoItem.TileDetailTextIndent:= FormMain.IL_SystemType_Standard.Width-6;
     end;

  if iWidth <= 1440 then
     GamesFont.PaintInfoItem.ImageIndent:= 0;

  case iWidth of
    1024:
      begin
        ItemsColCount:=  3;
        ItemsLineCount:= 9;
        iNewWidth:= 1000;
        iNewHeight:= 623;
        GamesFont.CellSizes.Tile.Width:= 325;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1280, 1360, 1366:
      begin
        ItemsColCount:= 4;
        iNewWidth:= 1260;
        case iHeight of
          1024:
            begin
              ItemsLineCount:= 12;
              iNewHeight:= 923;
            end;
          720, 768:
            begin
              ItemsLineCount:= 9;
              iNewHeight:= 623;
            end;
        end;
        GamesFont.CellSizes.Tile.Width:= 309;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1440: // 1440x900 (16:10 resolution)
      begin
        ItemsColCount:=   4;
        ItemsLineCount:= 12;
        iNewWidth:= 1336;
        iNewHeight:= 803;
        GamesFont.CellSizes.Tile.Width:= 328;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1600, 1680, 1768:
      begin
        ItemsColCount:= 6; // 1600
        GamesFont.CellSizes.Tile.Width:= 256;
        GamesFont.CellSizes.Tile.Height:= 78;

        case iHeight of
          1024, 900, 992:
            begin
              ItemsLineCount:= 9;
              iNewHeight:= 785;
              iNewWidth:= 1560;
            end;
          1200:
            begin
              ItemsLineCount:= 12;
              //HaveScrollBar:= False;
              iNewHeight:= 1019;
              iNewWidth:= 1546;
            end;
          1050:
            begin
              ItemsLineCount:= 12;
              iNewHeight:= 947;
              iNewWidth:= 1627;
              //HaveScrollBar:= False;
              GamesFont.CellSizes.Tile.Width:= 270;
              GamesFont.CellSizes.Tile.Height:= 72;
            end;
        end;
      end;
    1920, 2048:
      begin
        ItemsColCount:=   6;
        ItemsLineCount:= 12;
        // 1920x1080 / 1920x1200 / 1920x1440 / 2048x1536
        //IL_FontSettings.Width:= 48;
        //IL_FontSettings.Height:= 48;
        GamesFont.CellSizes.Tile.Width:= 312;
        GamesFont.CellSizes.Tile.Height:= 78;
        GamesFont.PaintInfoItem.ImageIndent:= 0;
        iNewHeight:= 1018;
        iNewWidth:= 1880;
      end;
    2560: // 2560x1440 / 2560x1600
      begin
        ItemsColCount:=   6;
        ItemsLineCount:= 12;
        GamesFont.CellSizes.Tile.Height:= 104;
        GamesFont.CellSizes.Tile.Width:= 420;
        iNewWidth:= 2530;
        iNewHeight:= (GamesFont.CellSizes.Tile.Height*12)+PanelBottom.Height+29;// 1355; // +24 is extra height
        // must fix this later with "Form.ClientHeight" and "Form.ClientWidth"
      end;
    {3840: // this is no longer valid, use 4K mode instead (April 20, 2021)
      begin
        GamesFont.CellSizes.Tile.Height:= 148;
        GamesFont.CellSizes.Tile.Width:= 600;
        iNewWidth:= (GamesFont.CellSizes.Tile.Width*6)+8; // *6 columns -> +8 left/right border
        if Is4KMode then
           iNewHeight:= 1859+36 // 36 -> PanelBottom 90 - 54  (90 = 4K) -- (54 = regular)
        else
           iNewHeight:= 1859;
        IL_FontSettings.Width:= 128;
        IL_FontSettings.Height:= 128;
      end;}
  end;

  iNewWidth:=  GamesFont.CellSizes.Tile.Width*ItemsColCount;
  iNewHeight:= GamesFont.CellSizes.Tile.Height*ItemsLineCount;
  GamesFont.Width:=  iNewWidth+20;
  GamesFont.Height:= iNewHeight;

  if GamesFont.Scrollbars.VertBarVisible then
     iNewWidth:= iNewWidth+GetSystemMetrics(SM_CXVSCROLL);

  FormGamesListFontSettings.ClientWidth:=  iNewWidth;
  FormGamesListFontSettings.ClientHeight:= iNewHeight+PanelBottom.Height;

  ButtonCancel.Left:= PanelBottom.Width-ButtonCancel.Width-16;
  ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;
end;

procedure TFormGamesListFontSettings.FormShow(Sender: TObject);
var
  Loop: Integer;
  strFolder: String;
begin
  Resize4K;
  FormMain.ELV_ResetNormalColors(GamesFont);
  if IsNightMode then
     begin
       SetBottomPanelColors(PanelBottom);
       SetEditNightColors(GamesBackgroundImage);
       SetLabelColors(LabelBackgroundColor, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetColorBoxColors(GamesBackgroundColor, True);
       SetCheckBoxColors(GamesBackgroundImageEnable, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       SetCheckBoxColors(GamesTileBackground,        item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(GamesBackgroundImageEnable);
       FormMain.SetCheckBoxExCustomIcon(GamesTileBackground);

       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(GamesBackgroundImageButtonSelect);
       FormMain.SetButtonExColors(GamesBackgroundImageButtonUpdate);
       FormMain.SetButtonExColors(ButtonDefaultBkSortedColor);

       FormMain.SetWin10DarkScrollBar(GamesFont);
       FormMain.SetWin10DarkScrollBar(GamesBackgroundColor);
     end;

  SetSelectedColorBox(GamesBackgroundColor, FormMain.GamesListView.Color);
  TileDetailsTextColor:= GetContrastColor(GamesFont.Color);
  //ResizeForm;

  ArcadeSystemsHave:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    if FormMain.IsSystemAvailable(Loop) then
       begin
         ArcadeSystemsHave:= True;
         Break;
       end;
  end;

  if FormMain.GamesListView.BackGround.Enabled then
     begin
       GamesFont.BackGround.Image.Assign(FormMain.GamesListView.BackGround.Image);
       GamesFont.BackGround.Tile:= FormMain.GamesListView.BackGround.Tile;
       GamesFont.BackGround.Enabled:= True;
     end;

  GamesFont.Font:= FormMain.GamesListView.Font;

  FormMain.SetFont(FormMain.Font_Parent, tFont_Parent, True);
  FormMain.SetFont(FormMain.Font_Clone, tFont_Clone, True);
  FormMain.SetFont(FormMain.Font_Preliminary, tFont_Preliminary, True);
  FormMain.SetFont(FormMain.Font_MissingROMs, tFont_MissingROMs, True);
  FormMain.SetFont(FormMain.Font_MissingROMsPreliminary, tFont_MissingROMsPreliminary, True);

  PixelsMin:= -1;
  PixelsMax:= -1;
  for Loop:=1 to MaxConsoleComputerSystems do
  begin
    if Assigned(FormMain.Font_ConsoleComputer[Loop]) then
       FormMain.SetFont(FormMain.Font_ConsoleComputer[Loop], tFont_ConsoleComputer[Loop], True);
  end;

  PopulateELV;
  ResizeForm;
  
  strFolder:= FormMain.GetFolderFull(33);
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(0),  strFolder, IL_FontSettings); // parent
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(9),  strFolder, IL_FontSettings); // clone
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(12), strFolder, IL_FontSettings); // preliminary
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(30), strFolder, IL_FontSettings); // found with missing rom/chd
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(25), strFolder, IL_FontSettings); // preliminary found widht misssing rom/chd

  FormMain.AddDefaultIcons('emucon.ico', FormMain.GetFolderFull(32), IL_FontSettings);      // all systems
  FormMain.LoadNonArcadeSystemIcons(IL_FontSettings, False, False, True);

  //ScrollBarLastVisible:= False;
  CallCenterWindow(FormGamesListFontSettings);
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
    5: ACanvas.Font:= GamesFont.Font;
  else
    begin
      if Assigned(tFont_ConsoleComputer[Item.StateImageIndex]) then
         ACanvas.Font:= tFont_ConsoleComputer[Item.StateImageIndex]
      else
         ACanvas.Font:= GamesFont.Font;
    end;
  end;

  if Position in [1, 2] then
     begin
       ACanvas.Font.Name:= FormMain.Get4KFont;
       ACanvas.Font.Size:= FormMain.GetDefaultFontSize;
       ACanvas.Font.Color:= TileDetailsTextColor;
       ACanvas.Font.Style:= [];
     end;

  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas, Ord(Item.ImageIndex in [3, 4]));
end;

procedure TFormGamesListFontSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Loop: Integer;
begin
  if ModalResult = mrOk then
     begin
       FormMain.ClearListView(GamesFont);
       FormMain.GamesListView.BeginUpdate;
       FormMain.GamesListView.Font:= GamesFont.Font;
       FormMain.SetFont(tFont_Parent, FormMain.Font_Parent);
       FormMain.SetFont(tFont_Clone, FormMain.Font_Clone);
       FormMain.SetFont(tFont_Preliminary, FormMain.Font_Preliminary);
       FormMain.SetFont(tFont_MissingROMs, FormMain.Font_MissingROMs);
       FormMain.SetFont(tFont_MissingROMsPreliminary, FormMain.Font_MissingROMsPreliminary);

       DeInitConsoleComputerFonts(True);

       for Loop:= 1 to MaxConsoleComputerSystems do
       begin
         if Assigned(tFont_ConsoleComputer[Loop]) then
            FormMain.SetFont(tFont_ConsoleComputer[Loop], FormMain.Font_ConsoleComputer[Loop], True);
       end;

       FormMain.GamesListView.EndUpdate;
       FormMain.WriteCustomGameFontFile(IsNightMode);
     end;
  FreeAndNil(tFont_Parent);
  FreeAndNil(tFont_Clone);
  FreeAndNil(tFont_Preliminary);
  FreeAndNil(tFont_MissingROMs);
  FreeandNil(tFont_MissingROMsPreliminary);
  DeInitConsoleComputerFonts(False);
end;

procedure TFormGamesListFontSettings.GamesFontKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  if CharCode = VK_RETURN then
     begin
       if FormMain.CheckSelected(GamesFont) then
          ModifyFont(GamesFont.Selection.First);
     end;
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
     ModifyFont(GamesFont.Selection.First);
end;

procedure TFormGamesListFontSettings.PopupFontSettingsMeasureMenuItem(
  Sender: TObject; AMenuItem: TMenuItem; ACanvas: TCanvas; var Width,
  Height: Integer; ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  FormMain.SetPopupMenuMeasureItem(AMenuItem, ACanvas, Width, Height);
end;

procedure TFormGamesListFontSettings.PopupSetAllToDefaultFontsClick(
  Sender: TObject);
var
  Loop: Integer;
begin
  // set to default - Tag:= 0
  // set to current - Tag:= 1
  Screen.Cursor:= crHourGlass;
  GamesFont.BeginUpdate;
  DeInitConsoleComputerFonts(False);
  if TMenuItem(Sender).Tag = 0 then
     begin // reset to default
        FormMain.SetDefaultFont(tFont_Parent,                 0, IsNightMode, Is4KMode);
        FormMain.SetDefaultFont(tFont_Clone,                  1, IsNightMode, Is4KMode);
        FormMain.SetDefaultFont(tFont_Preliminary,            2, IsNightMode, Is4KMode);
        FormMain.SetDefaultFont(tFont_MissingROMs,            3, IsNightMode, Is4KMode);
        FormMain.SetDefaultFont(tFont_MissingROMsPreliminary, 4, IsNightMode, Is4KMode);

        GamesFont.Font:= tFont_Parent;
     end
  else
     begin // reset to current from uMain.GamesListView
       GamesFont.Font:= FormMain.GamesListView.Font;

       FormMain.SetFont(FormMain.Font_Parent,                 tFont_Parent);
       FormMain.SetFont(FormMain.Font_Clone,                  tFont_Clone);
       FormMain.SetFont(FormMain.Font_Preliminary,            tFont_Preliminary);
       FormMain.SetFont(FormMain.Font_MissingROMs,            tFont_MissingROMs);
       FormMain.SetFont(FormMain.Font_MissingROMsPreliminary, tFont_MissingROMsPreliminary);

       for Loop:=1 to MaxConsoleComputerSystems do
       begin
         if Assigned(FormMain.Font_ConsoleComputer[Loop]) then
            FormMain.SetFont(FormMain.Font_ConsoleComputer[Loop], tFont_ConsoleComputer[Loop], True);
       end;
     end;

  GamesFont.EndUpdate;
  UpdateFontSizeInfoAllSystems;
  Screen.Cursor:= crDefault;
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.PopupSetSelectedToDefaultFontsClick(Sender: TObject);
var
  selItem: TEasyItem;
begin
  // set to default - Tag:= 0
  // set to current - Tag:= 1
  if not FormMain.CheckSelected(GamesFont) then
     Exit;
  Screen.Cursor:= crHourGlass;
  GamesFont.BeginUpdate;
  selItem:= GamesFont.Selection.First;
  repeat
    if IsArcadeSystem(selItem) then
       begin
         if TMenuItem(Sender).Tag = 0 then
            begin
              case selItem.ImageIndex of
                0: FormMain.SetDefaultFont(tFont_Parent,                 0, IsNightMode, Is4KMode);
                1: FormMain.SetDefaultFont(tFont_Clone,                  1, IsNightMode, Is4KMode);
                2: FormMain.SetDefaultFont(tFont_Preliminary,            2, IsNightMode, Is4KMode);
                3: FormMain.SetDefaultFont(tFont_MissingROMs,            3, IsNightMode, Is4KMode);
                4: FormMain.SetDefaultFont(tFont_MissingROMsPreliminary, 4, IsNightMode, Is4KMode);
              end;
            end
         else
            begin
              case selItem.ImageIndex of
                0: FormMain.SetFont(FormMain.Font_Parent,                 tFont_Parent);
                1: FormMain.SetFont(FormMain.Font_Clone,                  tFont_Clone);
                2: FormMain.SetFont(FormMain.Font_Preliminary,            tFont_Preliminary);
                3: FormMain.SetFont(FormMain.Font_MissingROMs,            tFont_MissingROMs);
                4: FormMain.SetFont(FormMain.Font_MissingROMsPreliminary, tFont_MissingROMsPreliminary);
              end;
            end;
       end
    else
       begin
         if TMenuItem(Sender).Tag = 0 then
            begin
              if selItem.StateImageIndex = 0 then
                 FormMain.SetDefaultFont(GamesFont.Font, 0, IsNightMode, Is4KMode)
              else
                 FreeAndNil(tFont_ConsoleComputer[selItem.StateImageIndex]);
            end
         else
            begin
              if selItem.StateImageIndex = 0 then
                 GamesFont.Font:= FormMain.GamesListView.Font
              else
                begin
                  FreeAndNil(tFont_ConsoleComputer[selItem.StateImageIndex]);
                  FormMain.SetFont(FormMain.Font_ConsoleComputer[selItem.StateImageIndex], tFont_ConsoleComputer[selItem.StateImageIndex]);
                end;
            end;
       end;

    UpdateFontSizeInfo(selItem, True);
    selItem:= GamesFont.Selection.Next(selItem);
  until selItem = nil;

  GamesFont.EndUpdate;
  Screen.Cursor:= crDefault;
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.GamesBackgroundColorSelect(
  Sender: TObject);
begin
  GamesFont.Color:= GamesBackgroundColor.Selected;
  TileDetailsTextColor:= GetContrastColor(GamesFont.Color);
end;

procedure TFormGamesListFontSettings.ButtonDefaultBkSortedColorClick(
  Sender: TObject);
begin
  SetDefaultColorBox(GamesBackgroundColor);
end;

procedure TFormGamesListFontSettings.GamesBackgroundImageEnableClick(
  Sender: TObject);
begin
  GamesFont.BackGround.Enabled:= GamesBackgroundImageEnable.Checked;
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormGamesListFontSettings.GamesTileBackgroundClick(
  Sender: TObject);
begin
  GamesFont.BackGround.Tile:= GamesTileBackground.Checked;
end;

procedure TFormGamesListFontSettings.GamesBackgroundImageButtonSelectClick(
  Sender: TObject);
begin
  FormMain.DialogOpenFile(5, GamesBackgroundImageEnable.Caption, GamesBackgroundImage, False);
  GamesBackgroundImageButtonUpdate.Click;
end;

procedure TFormGamesListFontSettings.GamesBackgroundImageButtonUpdateClick(
  Sender: TObject);
var
  ListViewBk: TPNGGraphic;
  FileFullPath: String;
begin
  case GamesBackgroundImageEnable.Checked of
    True:
      begin
        FileFullPath:= FormMain.FullFolderFix(GamesBackgroundImage.Text, '', True);
        if (not FileExists(FileFullPath)) or (FileFullPath = '') then
           begin
             if not FormMain.IsStartup then
                begin
                  if GamesFont.BackGround.Image <> nil then
                     GamesFont.BackGround.Image := nil;
                  FormMain.BlinkBkEdit(GamesBackgroundImage);
                end;
             Exit;
           end;

        try
          ListViewBk:= TPNGGraphic.Create;
          ListViewBk.LoadFromFile(FileFullPath);
          GamesFont.BackGround.Image.Assign(ListViewBk);
          FreeAndNil(ListViewBk);
        except
          GamesFont.Background.Image:= nil;
        end;
      end;
    False:
      begin
        GamesFont.Background.Image:= nil;
      end;
  end;
end;

procedure TFormGamesListFontSettings.PopupShowAvailableSystemsOnlyClick(
  Sender: TObject);
var
  Item: TEasyItem;
begin
  GamesFont.BeginUpdate;
  GamesFont.Groups.MakeAllVisible;
  GamesFont.Groups.Rebuild(True); // need to rebuild or list gets messed up

  if PopupShowAvailableSystemsOnly.Checked then
     begin
       Item:= GamesFont.Groups.FirstItem;
       repeat
         if IsArcadeSystem(Item) then
            Item.Visible:= ArcadeSystemsHave
         else
            begin
              if Item.StateImageIndex > 0 then
                 Item.Visible:= FormMain.IsSystemAvailable(Item.StateImageIndex, True);
            end;
         Item:= GamesFont.Groups.NextItem(Item);
       until Item = nil;
     end;
  GamesFont.EndUpdate;
end;

procedure TFormGamesListFontSettings.PopupSetFontsToMatchAllSystemsFontClick(
  Sender: TObject);
var
  selItem: TEasyItem;
  IsAllSystemsSameArcadeParent: Boolean;
begin
  // Tag = 0 -> set selected to "All Systems" font
  // Tag = 1 -> set selected to "Arcade Parent Set" font
  if not FormMain.CheckSelected(GamesFont) then
     Exit;
  Screen.Cursor:= crHourGlass;

  if TMenuItem(Sender).Tag = 1 then
     IsAllSystemsSameArcadeParent:= GamesFont.Font = tFont_Parent;

  GamesFont.BeginUpdate;
  selItem:= GamesFont.Selection.First;
  repeat
    if IsArcadeSystem(selItem) then
       begin
         if TMenuItem(Sender).Tag = 0 then
            begin
              case selItem.ImageIndex of
                0: FormMain.SetFont(GamesFont.Font, tFont_Parent);
                1: FormMain.SetFont(GamesFont.Font, tFont_Clone);
                2: FormMain.SetFont(GamesFont.Font, tFont_Preliminary);
                3: FormMain.SetFont(GamesFont.Font, tFont_MissingROMs);
                4: FormMain.SetFont(GamesFont.Font, tFont_MissingROMsPreliminary);
              end;
            end
         else
            begin
              case selItem.ImageIndex of
                //0: FormMain.SetFont(tFont_Parent, tFont_Parent);
                1: FormMain.SetFont(tFont_Parent, tFont_Clone);
                2: FormMain.SetFont(tFont_Parent, tFont_Preliminary);
                3: FormMain.SetFont(tFont_Parent, tFont_MissingROMs);
                4: FormMain.SetFont(tFont_Parent, tFont_MissingROMsPreliminary);
              end;
            end;
       end
    else
       begin
         if selItem.StateImageIndex > 0 then
            FreeAndNil(tFont_ConsoleComputer[selItem.StateImageIndex]);

         if TMenuItem(Sender).Tag = 1 then
            begin
              if selItem.StateImageIndex = 0 then
                 GamesFont.Font:= tFont_Parent // FormMain.SetFont(tFont_Parent, GamesFont.Font)
              else
                 begin
                   if not IsAllSystemsSameArcadeParent then
                      FormMain.SetFont(tFont_Parent, tFont_ConsoleComputer[selItem.StateImageIndex], True);
                 end;
            end;
       end;

    UpdateFontSizeInfo(selItem, True);
    if selItem.StateImageIndex = 0 then
       UpdateFontSizeInfoAllSystems;

    selItem:= GamesFont.Selection.Next(selItem);
  until selItem = nil;

  GamesFont.EndUpdate;
  Screen.Cursor:= crDefault;
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.PopupSetAllConsoleComputerSystemsFontsToAllSystemsClick(
  Sender: TObject);
var
  selItem: TEasyItem;
begin
  // Tag = 0 -> set all console/computer to "All Systems" font
  // Tag = 1 -> set all console/computer to "Arcade Parent" font
  Screen.Cursor:= crHourGlass;
  GamesFont.BeginUpdate;
  selItem:= GamesFont.Groups.FirstItem;
  repeat
    if not IsArcadeSystem(selItem) then
       begin
         if selItem.StateImageIndex > 0 then // > 0 ... it cannot change the "All Systems" font!
            FreeAndNil(tFont_ConsoleComputer[selItem.StateImageIndex]);

         if TMenuItem(Sender).Tag = 1 then
            begin
              if selItem.StateImageIndex = 0 then
                 GamesFont.Font:= tFont_Parent;
            end;
       end;

    UpdateFontSizeInfo(selItem, True);
    selItem:= GamesFont.Groups.NextItem(selItem);
  until selItem = nil;

  GamesFont.EndUpdate;
  UpdateFontSizeInfoAllSystems;
  Screen.Cursor:= crDefault;
  GamesFont.SetFocus;
end;

procedure TFormGamesListFontSettings.PopupHelpClick(Sender: TObject);
begin
  FormMain.InitMessageBox;
  FormMain.AddMsgText('    Customizing game fonts is easy. If you select different fonts, '+
                      'they might have different height in pixels. Even more so if you change the font size.'+#13#10+
                      'For thumbnails view mode this is a problem. To make this easy, you can see a ');
  FormMain.AddMsgText('font height', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' value next to the font size. This can help you choose fonts that have the same height.'+#13#10+#13#10+
                      '    By default, all systems are visible in the list. To hide systems you don''t have, enable ');
  FormMain.AddMsgText('Show Available Systems Only', MsgTxtColors.colorKeyTitle, [fsBold]);
  FormMain.AddMsgText(' option in popup menu.');

  FormMain.ShowMessageBox('Help', 'Shed some light into the darkness.');
end;

procedure TFormGamesListFontSettings.PopupShowFontNameClick(
  Sender: TObject);
begin
  GamesFont.BeginUpdate;
  GamesFont.PaintInfoItem.TileDetailCount:= Ord(PopupShowFontName.Checked)+2;
  UpdateFontSizeInfoAllSystems;
  GamesFont.EndUpdate;
  GamesFont.SetFocus;
end;


procedure TFormGamesListFontSettings.GamesFontItemImageDrawIsCustom(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var IsCustom: Boolean);
begin
  //Exit; // debug only
  if GamesFont.ImagesExLarge.Width >= 68 then
     IsCustom:= True;
end;

procedure TFormGamesListFontSettings.GamesFontItemImageGetSize(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  var ImageWidth, ImageHeight: Integer);
begin
  //Exit; // debug only
  if GamesFont.ImagesExLarge.Width < 68 then
     Exit;

  //Exit; // debugging
  ImageWidth:=  GamesFont.ImagesExLarge.Width;
  ImageHeight:= GamesFont.ImagesExLarge.Height;
end;

procedure TFormGamesListFontSettings.GamesFontItemImageDraw(
  Sender: TCustomEasyListview; Item: TEasyItem; Column: TEasyColumn;
  ACanvas: TCanvas; const RectArray: TEasyRectArrayObject;
  AlphaBlender: TEasyAlphaBlender);
var
  iLeft, iTop, iSysTypeIndex, iImageIndex: Integer;
  iText: String;
begin
  //Exit; // debug only
  if GamesFont.ImagesExLarge.Width < 68 then
     Exit;

  ACanvas.Lock;
  iLeft:= RectArray.IconRect.Left+GamesFont.PaintInfoItem.ImageIndent;
  iTop:=  RectArray.IconRect.Top+(((RectArray.IconRect.Bottom-RectArray.IconRect.Top)-GamesFont.ImagesExLarge.Height) div 2);
  //iTop:=  RectArray.IconRect.Top+GamesFont.PaintInfoItem.ImageIndent+(GamesFont.PaintInfoItem.Border div 2);
  GamesFont.ImagesExLarge.Draw(ACanvas, iLeft, iTop, Item.ImageIndex);

  // .ItemIndex = index of icons; StateImageIndex = Console/Computer sysID
  if Item.StateImageIndex = 0 then
     begin
       ACanvas.Unlock;
       Exit; // 0 index is "All Systems"
     end;

  iImageIndex:= -1;
  iSysTypeIndex:= -1;
  if Item.StateImageIndex = -1 then
     iSysTypeIndex:= 0//4//24 // index 4 is "arcade" icon
  else
  begin
    if SystemIsConsole(Item.StateImageIndex) then
       iSysTypeIndex:= 1//5//25 // index 5 is "console" icon
    else
    if SystemIsComputer(Item.StateImageIndex) then
       iSysTypeIndex:= 2//6//26 // index 6 is "computer" icon
    else
    if SystemIsHandheld(Item.StateImageIndex) then
       iSysTypeIndex:= 3;//7;//27; // index 7 is "handheld" icon

    iImageIndex:= Item.StateImageIndex;
  end;

  if iSysTypeIndex <> -1 then
     begin
       iLeft:= iLeft+GamesFont.ImagesExLarge.Width;
       iLeft:= iLeft+4; // 4 -> space between sys icon and sys type icon
       if Is4KMode then
          begin
            iTop:= RectArray.TextRects[1].Top+8; // +8 is to align SysType icon with 2-lines details text
            FormMain.IL_SystemType_ExtraLarge.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
          end
       else
          begin
            iTop:= RectArray.TextRects[1].Top+3; // +3 is to align SysType icon with 2-lines details text
            FormMain.IL_SystemType_Standard.Draw(ACanvas, iLeft, iTop, iSysTypeIndex);
          end;
     end;
  ACanvas.UnLock;
end;


end.
