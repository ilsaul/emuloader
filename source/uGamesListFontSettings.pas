unit uGamesListFontSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  MPCommonObjects, EasyListview, StdCtrls, ImgList, GraphicEx,
  MPCommonUtilities, ExtCtrls, Buttons, PanelEx, uCommon, uCommonCustom,
  Menus, BarMenus, ShadowLabel, AdvOfficeButtons;

type
  TFormGamesListFontSettings = class(TForm)
    IL_FontSettings: TImageList;
    GamesFont: TEasyListview;
    PopupFontSettings: TBcBarPopupMenu;
    PopupResetAllToCurrentFonts: TMenuItem;
    PopupSetSelectedToDefaultFonts: TMenuItem;
    CopyFromParent1: TMenuItem;
    N1: TMenuItem;
    SetFontsToMatchAllSystemsFont1: TMenuItem;
    PopupResetSelectedToCurrentFonts: TMenuItem;
    PopupSetAllToDefaultFonts: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PanelBottom: TPanelEx;
    GamesBackgroundColor: TColorBox;
    ButtonDefaultBkSortedColor: TBitBtn;
    GamesBackgroundImageEnable: TAdvOfficeCheckBox;
    GamesBackgroundImage: TEdit;
    GamesTileBackground: TAdvOfficeCheckBox;
    GamesBackgroundImageButtonUpdate: TBitBtn;
    GamesBackgroundImageButtonSelect: TBitBtn;
    LabelBackgroundColor: TShadowLabel;
    Label1: TLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    PopupShowAvailableSystemsOnly: TMenuItem;
    PopupHelp: TMenuItem;
    SetAllConsoleComputerSystemsFontsToAllSystems1: TMenuItem;
    N4: TMenuItem;
    SetAllToArcadeParentGameFont1: TMenuItem;
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
    procedure FormResize(Sender: TObject);
    procedure PopupShowAvailableSystemsOnlyClick(Sender: TObject);
    procedure SetFontsToMatchAllSystemsFont1Click(Sender: TObject);
    procedure SetAllConsoleComputerSystemsFontsToAllSystems1Click(
      Sender: TObject);
    procedure PopupHelpClick(Sender: TObject);
  private
    ArcadeSystemsHave: Boolean;
    tFont_Parent, tFont_Clone, tFont_Preliminary, tFont_MissingROMs, tFont_MissingROMsPreliminary: TFont;
    PixelsMin, PixelsMax: Integer;
    tFont_ConsoleComputer: array[1..MaxConsoleComputerSystems] of TFont;
    ScrollBarLastVisible: Boolean;
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGamesListFontSettings: TFormGamesListFontSettings;

implementation

uses uMain;

{$R *.dfm}

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
  NewPixelsValue, FontSizeValue: Integer;
  //FontNameValue: WideString;

  function GetFontParamsStr(var FontSource: TFont): String;
  begin
    if Assigned(FontSource) then
       begin
         NewPixelsValue:= FormMain.GetFontHeightSize(FontSource);
         //FontNameValue:= FontSource.Name;
         FontSizeValue:= FontSource.Size;
       end
    else
       begin
         NewPixelsValue:= FormMain.GetFontHeightSize(GamesFont.Font);
         //FontNameValue:= GamesFont.Font.Name;
         FontSizeValue:= GamesFont.Font.Size;
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
        //FontNameValue:= GamesFont.Font.Name;
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

  Item.Captions[1]:= '  font size: '+IntToStr(FontSizeValue)+' - height: '+IntToStr(NewPixelsValue)+' pixels ';
  //Item.Captions[2]:= '  font: '+FontNameValue;
  //Item.Captions[2]:= IntToStr(NewPixelsValue);

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

{procedure TFormGamesListFontSettings.ELV_UpdateScrollBar;
begin
  if GamesFont.Scrollbars.VertBarVisible then
     begin
       if not ScrollBarLastVisible then
          begin
            GamesFont.Header.Columns[0].Width:= GamesFont.Header.Columns[0].Width-GetSystemMetrics(SM_CXVSCROLL);
            ScrollBarLastVisible:= True;
          end;
     end
  else
     begin
       if ScrollBarLastVisible then
          begin
            GamesFont.Header.Columns[0].Width:= GamesFont.Header.Columns[0].Width+GetSystemMetrics(SM_CXVSCROLL);
            ScrollBarLastVisible:= False;
          end;
     end;
end;}

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
    //if GamesFont.PaintInfoItem.TileDetailCount = 2 then
    //   Item.Details[1]:= 1
    //else
    //   begin
    //     Item.Details[1]:= 1;
    //     Item.Details[2]:= 2;
    //   end;
  end;

begin
  ELV_PopulateCustomSystems(GamesFont, -1, 4, True);
  GamesFont.BeginUpdate;
  GamesFont.Items.ReIndexDisable:= True;
  AddItem(5, 'All Systems', 0);
  //AddItem(4, 'Preliminary Set, Missing ROMs/CHDs', -1, False);
  //AddItem(4, 'Preliminary / Missing ROMs', -1, False);
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

    //if Item.StateImageIndex = -1 then
    //   UpdateFontSizeInfo(Item)
    //else
    //   begin
    //     Item.Details[1]:= 1;
    //     //if GamesFont.PaintInfoItem.TileDetailCount = 2 then
    //     //   Item.Details[1]:= 1
    //     //else
    //     //   begin
    //     //     Item.Details[1]:= 1;
    //     //     Item.Details[2]:= 2;
    //     //   end;
    //     UpdateFontSizeInfo(Item);
    //   end;
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
  HaveScrollBar: Boolean;
  iWidth, iHeight: Integer;
begin
  //GamesFont.CellSizes.Tile.Height:= 148;
  //GamesFont.CellSizes.Tile.Width:= 600;
  //IL_FontSettings.Width:= 128;
  //IL_FontSettings.Height:= 128;

  iWidth:= Screen.Width;
  iHeight:= Screen.Height;
  HaveScrollBar:= iWidth < 1920;

  //if iWidth < 800 then
  //   begin
  //     IL_FontSettings.Width:= 32;
  //     IL_FontSettings.Height:= 32;
  //   end
  //else

  if iWidth >= 1920 then // 1280 then
     begin
       IL_FontSettings.Width:= 68;
       IL_FontSettings.Height:= 68;
     end;

  if iWidth >= 1024 then
     begin
       //FontSizeDetail_Index:= 1;
       //FontNameDetail_Index:= 2;
       //GamesFont.PaintInfoItem.TileDetailCount:= 3;
     end
  else
     begin
       //FontSizeDetail_Index:= 1;
       //FontNameDetail_Index:= -1;
       //GamesFont.PaintInfoItem.TileDetailCount:= 2;
     end;
  if iWidth <= 1440 then
     GamesFont.PaintInfoItem.ImageIndent:= 0;

  case iWidth of //Screen.Width of
     640:
       begin
         iNewWidth:= 625;
         iNewHeight:= 400;
         GamesFont.CellSizes.Tile.Width:= 300;
         GamesFont.CellSizes.Tile.Height:= 60;
       end;
     720:
       begin
         iNewWidth:= 700;
         iNewHeight:= 400;
         GamesFont.CellSizes.Tile.Width:= 338;
         GamesFont.CellSizes.Tile.Height:= 60;
       end;
     800:
       begin
         iNewWidth:= 780;
         iNewHeight:= 540;
         GamesFont.CellSizes.Tile.Width:= 252;//378;
         GamesFont.CellSizes.Tile.Height:= 60;
       end;
     960:
       begin
         iNewWidth:= 930;
         iNewHeight:= 503;// 517;
         GamesFont.CellSizes.Tile.Width:= 302;//425;
         GamesFont.CellSizes.Tile.Height:= 60;
       end;
    1024:
      begin
        iNewWidth:= 1000;
        iNewHeight:= 623;
        GamesFont.CellSizes.Tile.Width:= 325;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1280, 1360, 1366:
      begin
        iNewWidth:= 1260;
        case iHeight of
          1024: iNewHeight:= 923;
          720: iNewHeight:= 623;
          768: iNewHeight:= 623;
        end;
        GamesFont.CellSizes.Tile.Width:= 309;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1440: // 1440x900 (16:10 resolution)
      begin
        iNewWidth:= 1336;
        iNewHeight:= 803;
        GamesFont.CellSizes.Tile.Width:= 328;
        GamesFont.CellSizes.Tile.Height:= 60;
      end;
    1600, 1680, 1768:
      begin
        GamesFont.CellSizes.Tile.Width:= 256;
        GamesFont.CellSizes.Tile.Height:= 78;
        case iHeight of
          1024, 900, 992:
            begin
              iNewHeight:= 785;
              iNewWidth:= 1560;
            end;
          1200:
            begin
              HaveScrollBar:= False;
              iNewHeight:= 1019;
              iNewWidth:= 1546;
            end;
          1050:
            begin
              iNewHeight:= 947;
              iNewWidth:= 1627;
              HaveScrollBar:= False;
              GamesFont.CellSizes.Tile.Width:= 270;
              GamesFont.CellSizes.Tile.Height:= 72;
            end;
        end;
      end;
    1920, 2048:
      begin
        // 1920x1080 / 1920x1200 / 1920x1440 / 2048x1536
        //IL_FontSettings.Width:= 48;
        //IL_FontSettings.Height:= 48;
        GamesFont.CellSizes.Tile.Width:= 312;
        GamesFont.CellSizes.Tile.Height:= 78;
        GamesFont.PaintInfoItem.ImageIndent:= 0;
        iNewHeight:= 1018;
        iNewWidth:= 1880;

        //GamesFont.CellSizes.Tile.Height:= 78;
        //GamesFont.CellSizes.Tile.Width:= 317;
        {if iWidth = 1920 then
           begin
             case iHeight of
               1080: iNewHeight:= 1018;
               1200: iNewHeight:= 1123;
               1440:
                 begin
                   GamesFont.CellSizes.Tile.Width:= 311;
                   GamesFont.CellSizes.Tile.Height:= 104;
                   iNewWidth:= 1873;
                   iNewHeight:= 1330;
                 end;
             end;
           end
        else
           begin // 2048x1536
             iNewWidth:= 1873;
             iNewHeight:= 1330;
           end;}
      end;
    2560: // 2560x1440 / 2560x1600
      begin
        GamesFont.CellSizes.Tile.Height:= 106;
        GamesFont.CellSizes.Tile.Width:= 420;
        iNewWidth:= 2530;
        //iNewWidth:= (GamesFont.CellSizes.Tile.Width*6)+8-10; // *6 columns -> +8 left/right border
        iNewHeight:= 1355;
      end;
    3840:
      begin
        GamesFont.CellSizes.Tile.Height:= 148;
        GamesFont.CellSizes.Tile.Width:= 600;
        iNewWidth:= (GamesFont.CellSizes.Tile.Width*6)+8; // *6 columns -> +8 left/right border
        iNewHeight:= 1859;
        IL_FontSettings.Width:= 128;
        IL_FontSettings.Height:= 128;
      end;
  end;

  if iNewWidth <> FormGamesListFontSettings.Width then
     FormGamesListFontSettings.Width:= iNewWidth;

  if iNewHeight <> FormGamesListFontSettings.Height then
     FormGamesListFontSettings.Height:= iNewHeight;

  if iWidth < 960 then
     begin
       //need to decrease size only for 640 resolution!!!
       if iWidth = 640 then
          begin
            GamesBackgroundColor.Width:= 158;
            ButtonDefaultBkSortedColor.Left:= 168;
            GamesBackgroundImageEnable.Left:= 240;
            GamesTileBackground.Left:= 472;
            GamesBackgroundImage.Left:= 240;
            GamesBackgroundImage.Width:= 270;
            GamesBackgroundImageButtonUpdate.Left:= 512;
            GamesBackgroundImageButtonSelect.Left:= 561;
          end;
       PanelBottom.Height:= 91;

       ButtonOk.Top:= 58;
       ButtonCancel.Top:= 58;

       //ButtonCancel.Left:= PanelBottom.Width-ButtonCancel.Width-4;//ButtonOk.Left+ButtonOk.Width+11; // 22 pixels apart!!!
       //ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;

       //ButtonOk.Left:= (PanelBottom.Width-((ButtonCancel.Left-ButtonOk.Left)+ButtonCancel.Width)) div 2;
       //ButtonCancel.Left:= ButtonOk.Left+ButtonOk.Width+11; // 22 pixels apart!!!
     end;

  if iWidth < 960 then
     ButtonCancel.Left:= PanelBottom.Width-ButtonCancel.Width-8
  else
     ButtonCancel.Left:= PanelBottom.Width-ButtonCancel.Width-16;//ButtonOk.Left+ButtonOk.Width+11; // 22 pixels apart!!!
  ButtonOk.Left:= ButtonCancel.Left-ButtonOk.Width-4;

  if not HaveScrollBar then
     begin
       GamesFont.Align:= alNone;
       GamesFont.Width:= GamesFont.Width+GetSystemMetrics(SM_CXVSCROLL);
     end;
end;

procedure TFormGamesListFontSettings.FormShow(Sender: TObject);
var
  Loop: Integer;
  strFolder: String;
begin
  FormMain.ELV_ResetNormalColors(GamesFont);
  FormMain.SetSelectedColorBox(GamesBackgroundColor, FormMain.GamesListView.Color);
  TileDetailsTextColor:= GetContrastColor(GamesFont.Color);
  ResizeForm;

  ArcadeSystemsHave:= False;
  for Loop:= 1 to MaxArcadeSystems do
  begin
    if FormMain.IsSystemAvailable(Loop) then
       begin
         ArcadeSystemsHave:= True;
         Break;
       end;
  end;

  strFolder:= FormMain.GetFolderFull(33);
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(0), strFolder, IL_FontSettings); // parent
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(9), strFolder, IL_FontSettings); // clone
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(12), strFolder, IL_FontSettings); // preliminary
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(30), strFolder, IL_FontSettings); // found with missing rom/chd
  FormMain.AddDefaultIcons(FormMain.GetELGameIconFileName(25), strFolder, IL_FontSettings); // preliminary found widht misssing rom/chd

  FormMain.AddDefaultIcons('emucon.ico', FormMain.GetFolderFull(32), IL_FontSettings); // all systems
  FormMain.LoadNonArcadeSystemIcons(IL_FontSettings, False, False, True);

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
  ScrollBarLastVisible:= False;
  //ELV_UpdateScrollBar;
  FormGamesListFontSettings.Left:= (Screen.Width shr 1)-(FormGamesListFontSettings.Width shr 1)-1;
  FormGamesListFontSettings.Top:= (Screen.Height shr 1)-(FormGamesListFontSettings.Height shr 1)-1-20;
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

  if Position = 1 then //[1, 2] then
     begin
       ACanvas.Font.Name:= 'Segoe UI';
       ACanvas.Font.Size:= 9;
       ACanvas.Font.Color:= TileDetailsTextColor;
       ACanvas.Font.Style:= [];//fsItalic];
     end;
  FormMain.ELV_ItemPaintText_General(Sender, Item, ACanvas);
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
       FormMain.GamesListView.Font:= GamesFont.Font; // FormMain.SetFont(GamesFont.Font, FormMain.GamesListView.Font);
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
       FormMain.UpdateCustomGameFontFile;
       //FormMain.GamesListView.Refresh;
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
        FormMain.SetDefaultFont(tFont_Parent, 0);
        FormMain.SetDefaultFont(tFont_Clone, 1);
        FormMain.SetDefaultFont(tFont_Preliminary, 2);
        FormMain.SetDefaultFont(tFont_MissingROMs, 3);
        FormMain.SetDefaultFont(tFont_MissingROMsPreliminary, 4);

        GamesFont.Font:= tFont_Parent;
     end
  else
     begin // reset to current from uMain.GamesListView
       GamesFont.Font:= FormMain.GamesListView.Font;

       FormMain.SetFont(FormMain.Font_Parent, tFont_Parent);
       FormMain.SetFont(FormMain.Font_Clone, tFont_Clone);
       FormMain.SetFont(FormMain.Font_Preliminary, tFont_Preliminary);
       FormMain.SetFont(FormMain.Font_MissingROMs, tFont_MissingROMs);
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
                0: FormMain.SetDefaultFont(tFont_Parent, 0);
                1: FormMain.SetDefaultFont(tFont_Clone, 1);
                2: FormMain.SetDefaultFont(tFont_Preliminary, 2);
                3: FormMain.SetDefaultFont(tFont_MissingROMs, 3);
                4: FormMain.SetDefaultFont(tFont_MissingROMsPreliminary, 4);
              end;
            end
         else
            begin
              case selItem.ImageIndex of
                0: FormMain.SetFont(FormMain.Font_Parent, tFont_Parent);
                1: FormMain.SetFont(FormMain.Font_Clone, tFont_Clone);
                2: FormMain.SetFont(FormMain.Font_Preliminary, tFont_Preliminary);
                3: FormMain.SetFont(FormMain.Font_MissingROMs, tFont_MissingROMs);
                4: FormMain.SetFont(FormMain.Font_MissingROMsPreliminary, tFont_MissingROMsPreliminary);
              end;
            end;
       end
    else
       begin
         if TMenuItem(Sender).Tag = 0 then
            begin
              if selItem.StateImageIndex = 0 then
                 FormMain.SetDefaultFont(GamesFont.Font, 0)
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
    //if selItem.StateImageIndex = 0 then // "All Systems"
    //   UpdateFontSizeInfoAllSystems;
    //  err
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
  //FormMain.MachinesListSidePanel.Color:= FormMain.GamesListView.Color;
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
                     GamesFont.BackGround.Image:= nil;
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

procedure TFormGamesListFontSettings.FormResize(Sender: TObject);
begin
  //Label1.Caption:= IntToStr(FormGamesListFontSettings.Width)+'x'+IntToStr(FormGamesListFontSettings.Height)+#13#10+
  //                 'Client Rect: '+IntToStr(FormGamesListFontSettings.ClientWidth)+'x'+IntToStr(FormGamesListFontSettings.ClientHeight);
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

procedure TFormGamesListFontSettings.SetFontsToMatchAllSystemsFont1Click(
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

procedure TFormGamesListFontSettings.SetAllConsoleComputerSystemsFontsToAllSystems1Click(
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
  CallMessageBox;
  FormMain.AddMsgText('    Customizing game fonts is easy. If you select different fonts, '+
                      'they might have different height in pixels. Even more so if you change the font size.'+#13#10+
                      'For thumbnails view mode this is a problem. To make this easy, you can see a ');
  FormMain.AddMsgText('font height', $00a65300, [fsBold]);
  FormMain.AddMsgText(' value next to the font size. This can help you to choose fonts that have the same height.'+#13#10+#13#10+
                      '    By default, all systems are visible in the list. To hide systems you don''t have, just enable the ');
  FormMain.AddMsgText('Show Available Systems Only', $00a65300, [fsBold]);
  FormMain.AddMsgText(' option in popup menu.');

  GenerateMessage('Help', 'Shed some light on the darkness.');
end;


end.
