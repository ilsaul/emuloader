unit uColorPickerEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, ImgList, StdCtrls, Math, Buttons,
  ButtonsEx, ShadowLabel, EditEx, uCommon;

type
  PRGB = ^TRGB;
  TRGB = record b, g, r: Byte;
  end;
  PRGBA = ^TRGBA;
  TRGBA = record b, g, r, a: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBARRAY = array[0..0] of TRGB;
  THSB = record h, s, b: Word;
  end;

  TFormColorPickerEx = class(TForm)
    ilMain_orig: TImageList;
    Edit_Green: TEditEx;
    Edit_Blue: TEditEx;
    Edit_Red: TEditEx;
    timeAni: TTimer;
    Edit_Alpha: TEditEx;
    Edit_Red_Label: TShadowLabel;
    Edit_Green_Label: TShadowLabel;
    Edit_Blue_Label: TShadowLabel;
    Edit_Hex_Label: TShadowLabel;
    Edit_Alpha_Label: TShadowLabel;
    Edit_Hex: TEditEx;
    imgColorBox: TImage;
    imgZBar: TImage;
    imgColor: TImage;
    ButtonVar16: TSpeedButtonEx;
    imgAlpha: TImage;
    imgPal: TImage;
    ButtonVar64: TSpeedButtonEx;
    TrackBarR: TImage;
    TrackBarG: TImage;
    TrackBarB: TImage;
    imgColor_newLabel: TShadowLabel;
    imgColor_currentLabel: TShadowLabel;
    ButtonCancel: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    IL_MarkerIcon: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure imgZBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgZBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgZBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgColorBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgColorBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure timeAniTimer(Sender: TObject);
    procedure ButtonVar16Click(Sender: TObject);
    procedure imgColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAlphaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAlphaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgAlphaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit_RedKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_RedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_HexKeyPress(Sender: TObject; var Key: Char);
    procedure TrackBarRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBarRMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBarBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarBMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBarGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarBMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    MarkerIconIndex, MarkerCenter, MarkerAlign: Integer;
    BarBmpRed, BarBmpGreen, BarBmpBlue,
    HBoxBmp, HBarBmp, ABarBmp, ColorBmp: TBitmap;

    RGBColor: TRGB;
    RGBAlpha: Byte;
    HSBColor: THSB;
    ColorMode, CellMul, CellDiv,
    BasicColors_CellMul, BasicColors_CellDiv: Byte;

    DoColor, DoBar, DoVar, DoAlpha,
    DoBarRed, DoBarGreen, DoBarBlue: Boolean;

    LUT138: array of Byte; // dynamic array, must be imgColorBox.Width+1 to work properly
    CTab: array[0..255] of TRGB;

    VarIdx: Integer; // for 16 / 64 shades of color
    AniCount: Integer; // for the timer

    BoxX, BoxY, BarX, BarA: Integer;
    LastHue: Integer;
    TextEnter: Boolean;
    blockColor1, blockColor2: TColor; // for the alpha bar and current/new color box (dark colors / light colors)

    //function  ExtractIcon(const iFileName: String; var iHandleIcon: THandle; var iIconId: DWORD; IconWidth, IconHeight: Integer): Boolean;
    procedure AddMarkerIcon;
    procedure Gradient(Col1, Col2: TColor; Bmp: TBitmap);
    procedure CreateImageBMP(var BmpSource: TBitmap; ImageDest: TImage; iColor: TColor = -1; DrawGradient: Boolean = False);
    procedure UpdateTrackBarR;
    procedure UpdateTrackBarG;
    procedure UpdateTrackBarB;

    procedure PaintColorPnl;
    procedure PaintVar;
    procedure PaintBasicColors;
    procedure PaintColorHueBox;
    procedure CreateHueBar; // create HBarBmp with the HUE bar
    procedure PaintHueBar;  // paint the HUE in TImage
    procedure PaintAlphaBar;
    procedure PaintAlphaColor;
    procedure imgColorBar_HSBtoRGB;

    function  GetColor: TColor;
    procedure SetColor(Color: TColor; Alpha: Byte; Update: Boolean);
    procedure UpdateTrackBarsRGB;
    procedure UpdateColorsRGB;
    procedure UpdateEditBoxRGB;
    procedure Resize4K;
    { Private declarations }
  public
    NewColor: TColor;
    OldColor: TColor; // current color
    OldAlpha: Byte;   // current alpha
    //UseDarkColors, Use4K: Boolean;
    MarkerIconPath: String;
    mmResult: Integer;
    { Public declarations }
  end;

const
  AniStep = 4;

var
  FormColorPickerEx: TFormColorPickerEx;

implementation

{$R *.dfm}

uses
  uColorUtils;

procedure TFormColorPickerEx.AddMarkerIcon;
var
  hIcon: THandle;
  nIconId: DWORD;
  tmpIcon: TIcon;
  iIconWidth, iIconHeight: Integer;
  iFile: String;
begin
  MarkerIconIndex:= 0;
  if MarkerIconPath = '' then
     iFile:= ExtractFilePath(Application.ExeName)
  else
     iFile:= MarkerIconPath;
  iFile:= iFile+'ColorPickerEx-marker.ico';
  if not FileExists(iFile) then
     begin
       IL_MarkerIcon.AddImage(iLMain_orig, 0);
       Exit;
     end;
  iIconWidth:=  IL_MarkerIcon.Width;
  iIconHeight:= IL_MarkerIcon.Height;

  if ExtractIcon(iFile, hIcon, nIconId, iIconWidth, iIconHeight) then
     begin
       tmpIcon:= TIcon.Create;
       tmpIcon.Handle:= hIcon;
       MarkerIconIndex:= IL_MarkerIcon.AddIcon(tmpIcon);
       tmpIcon.ReleaseHandle;
       FreeAndNil(tmpIcon);
     end;
  DestroyIcon(hIcon);
  if MarkerIconIndex = -1 then
     MarkerIconIndex:= 0;
end;

procedure TFormColorPickerEx.Gradient(Col1, Col2: TColor; Bmp: TBitmap);
type
  PixArray = array [1..3] of Byte;
var
  i, big, rdiv, gdiv, bdiv, h, w: Integer;
  ts: TStringList;
  p: ^PixArray;
begin
  rdiv:= GetRValue(Col1) - GetRValue(Col2);
  gdiv:= GetgValue(Col1) - GetgValue(Col2);
  bdiv:= GetbValue(Col1) - GetbValue(Col2);

  bmp.PixelFormat:= pf24Bit;

  for h:= 0 to bmp.Height-1 do
  begin
    p:= bmp.ScanLine[h];
    for w:= 0 to bmp.Width-1 do
    begin
      p^[1]:= GetBvalue(Col1) - Round((w / bmp.Width) * bdiv);
      p^[2]:= GetGvalue(Col1) - Round((w / bmp.Width) * gdiv);
      p^[3]:= GetRvalue(Col1) - Round((w / bmp.Width) * rdiv);
      Inc(p);
    end;
  end;
end;

function TFormColorPickerEx.GetColor: TColor;
begin
  Result := RGB(RGBColor.r, RGBColor.g, RGBColor.b);
end;

procedure TFormColorPickerEx.SetColor(Color: TColor; Alpha: Byte; Update: Boolean);
var
  c: Integer;
  h, s, b: Word;
begin
  RGBAlpha:= Alpha;
  if not Update then
     OldColor:= Color;
  c:= ColorToRGB(Color);
  RGBColor.b:= Byte(c shr 16);
  RGBColor.g:= Byte(c shr 8);
  RGBColor.r:= Byte(c);
  RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, h, s, b);
  BoxX:= MulDiv(imgColorBox.Width-1, s, 255);
  BoxY:= (imgColorBox.Height-1)-MulDiv(imgColorBox.Height-1, b, 255);
  BarX:= MulDiv(imgZBar.Width, h, 360);
  BarA:= MulDiv(imgAlpha.Height-1, RGBAlpha, 255);
  LastHue:= -1;
  PaintColorPnl;
end;

procedure TFormColorPickerEx.UpdateTrackBarsRGB;
begin
  UpdateTrackBarR;
  UpdateTrackBarG;
  UpdateTrackBarB;
end;

procedure TFormColorPickerEx.UpdateColorsRGB;
begin
  // called when setting RGB colors in edit boxes and TImage RGB bars
  SetColor((RGBColor.b shl 16) + (RGBColor.g shl 8) + (RGBColor.r), RGBAlpha, True); // set color so the ZBar changes when entering RGB values manually (October 04, 2021)
end;

procedure TFormColorPickerEx.UpdateEditBoxRGB;

  procedure UpdateControl(ColorEdit: TEdit; const Value: String);
  begin
    if not SameText(ColorEdit.Text, Value) then
       ColorEdit.Text:= Value;
  end;

begin
  UpdateControl(Edit_Hex  , LowerCase(IntToHex(RGBColor.r, 2) + IntToHex(RGBColor.g, 2) + IntToHex(RGBColor.b, 2)));
  UpdateControl(Edit_Red  , IntToStr(RGBColor.r));
  UpdateControl(Edit_Green, IntToStr(RGBColor.g));
  UpdateControl(Edit_Blue , IntToStr(RGBColor.b));
  UpdateControl(Edit_Alpha, IntToStr(RGBAlpha));
end;

procedure TFormColorPickerEx.PaintVar;
var
  x, y, i, j, k, q, h: Integer;
  col: TColor;
  cell: TRect;
  s: Double;
  MarkerX, MarkerY: Integer;
begin
  imgColorBox.Canvas.Brush.Color:= clBlack;
  imgColorBox.Canvas.Rectangle(Canvas.ClipRect);
  MarkerX:= -1;
  MarkerY:= -1;
  // 16 / 32 / 64 mode
  if ButtonVar16.Down then
     begin
       CellMul:= 4;
       CellDiv:= (imgColorBox.Width) div CellMul;
       q:= 8;
     end
  else
  if ButtonVar64.Down then
     begin
       CellMul:= 8;
       CellDiv:= (imgColorBox.Width) div CellMul;
       q:= 32;
     end;

  s:= 255 / (q - 1);
  j:= (q * 2) - 1;
  h:= MulDiv(360, BarX, imgZBar.Width);
  for i:= 0 to q-1 do
  begin
    k:= Trunc(s * i);
    HSBtoRGB(h, k, 255, CTab[i].r, CTab[i].g, CTab[i].b);
    HSBtoRGB(h, 255, k, CTab[j - i].r, CTab[j - i].g, CTab[j - i].b);
  end;
  HBoxBmp.Canvas.Brush.Style:= bsClear;
  HBoxBmp.Canvas.Brush.Color:= clBlack;
  HBoxBmp.Canvas.Pen.Color  := clBlack;
  HBoxBmp.Canvas.Rectangle(0, 0, imgColorBox.Width, imgColorBox.Height);
  HBoxBmp.Canvas.Brush.Style:= bsSolid;
  for y:= 0 to CellMul-1 do
  begin
    for x:= 0 to CellMul-1 do
    begin
      i:= (y * CellMul) + x;
      col:= (cTab[i].b shl 16) + (cTab[i].g shl 8) + cTab[i].r;
      HBoxBmp.Canvas.Brush.Color:= col;
      HBoxBmp.Canvas.Pen.Color  := col;
      cell.Left:= 1 + (x * CellDiv);
      cell.Top := 1 + (y * CellDiv);
      cell.Right := cell.Left + CellDiv - 2;
      cell.Bottom:= cell.Top  + CellDiv - 2;
      HBoxBmp.Canvas.Rectangle(cell);
      if MarkerX = -1 then
         if col = RGB(RGBColor.r, RGBColor.g, RGBColor.b) then
            begin
              MarkerX:= cell.Left+((CellDiv div 2)-1)-MarkerCenter;
              MarkerY:= cell.Top+ ((CellDiv div 2)-1)-MarkerCenter;
            end;
    end;
  end;
  if MarkerX <> -1 then
     if not timeAni.Enabled then
        IL_MarkerIcon.Draw(HBoxBmp.Canvas, MarkerX, MarkerY, MarkerIconIndex, True); // Paint Marker
  imgColorBox.Canvas.Draw(0, 0, HBoxBmp);
end;

procedure TFormColorPickerEx.PaintBasicColors;
const
  Colors: Array[0..15] of TColor = (clBlack, clWhite, clGray, clSilver,
    clMaroon, clRed, clGreen, clLime, clOlive, clYellow, clNavy, clBlue,
    clPurple, clFuchsia, clTeal, clAqua);
var
  i, j, hSolid: Integer;
  x, y: Integer;
  cell: TRect;
  col: TColor;
  PalBmp: TBitmap;
begin
  // Paint 16 colors palette
  CreateImageBMP(PalBmp, imgPal);
  PalBmp.Canvas.Brush.Style:= bsClear;
  PalBmp.Canvas.Brush.Color:= clBlack;
  PalBmp.Canvas.Pen.Color  := clBlack;
  PalBmp.Canvas.Rectangle(0, 0, imgPal.Width, imgPal.Height);
  PalBmp.Canvas.Brush.Style:= bsSolid;

  BasicColors_CellMul:= 8;
  BasicColors_CellDiv:= imgPal.Width div 2;
  hSolid:= (imgPal.Height-10) div 8;

  j:= 0;
  for y:= 0 to BasicColors_CellMul-1 do
  begin
    for x:= 0 to 1 do
    begin
      i:= j+x;
      col:= Colors[i];
      PalBmp.Canvas.Brush.Color:= col;
      PalBmp.Canvas.Pen.Color  := col;
      cell.Left:= 1+(x*BasicColors_CellDiv);
      cell.Top := 1+(y*BasicColors_CellDiv);
      Cell.Right := Cell.Left+hSolid;
      Cell.Bottom:= Cell.Top+ hSolid;
      PalBmp.Canvas.Rectangle(Cell);
    end;
    Inc(j, 2);
  end;
  imgPal.Canvas.Draw(0, 0, PalBmp);
  PalBmp.Free;

  // original code
  {i := 0;
  j := 0;
  hSolid:= (imgPal.Height-10) div 8; // -4 -> 1px * 2 left/right borders, 2px border between tiles
  while j < 8 do
  begin
    imgPal.Canvas.Brush.Color := Colors[i];
    imgPal.Canvas.FillRect(Rect(1, (j*hSolid)+1, (imgPal.Width div 2)-1, (j + 1) * hSolid));
    //imgPal.Canvas.FillRect(Rect(0, j * hSolid, imgPal.Width div 2, (j + 1) * hSolid));
    imgPal.Canvas.Brush.Color := Colors[i + 1];
    imgPal.Canvas.FillRect(Rect((imgPal.Width div 2)+1, (j*hSolid)+2, imgPal.Width-1, (j + 1) * hSolid));
    imgPal.Canvas.FillRect(Rect((imgPal.Width div 2)+1, (j*hSolid)+2, imgPal.Width-1, (j + 1) * hSolid));
    //imgPal.Canvas.FillRect(Rect(imgPal.Width div 2, j * hSolid, imgPal.Width, (j + 1) * hSolid));
    //imgPal.Canvas.FillRect(Rect(imgPal.Width div 2, j * hSolid, imgPal.Width, (j + 1) * hSolid));
    inc(i, 2);
    inc(j);
  end;}
end;

procedure TFormColorPickerEx.PaintColorPnl;
begin
  NewColor:= (RGBColor.b shl 16) + (RGBColor.g shl 8) + RGBColor.r;
  PaintHueBar;
  PaintAlphaBar;
  if DoVar then
     PaintVar // 16 / 64 colors
  else
     PaintColorHueBox;

  PaintAlphaColor;
  imgColor.Canvas.Pen.Color  := clBlack;
  imgColor.Canvas.Brush.Style:= bsClear;

  if not TextEnter then
  begin
    UpdateTrackBarsRGB;
    UpdateEditBoxRGB;
  end;
  Application.ProcessMessages;
end;

procedure TFormColorPickerEx.ButtonVar16Click(Sender: TObject);
begin
  DoVar:= TSpeedButtonEx(Sender).Down;
  LastHue:= -1;
  PaintColorPnl;
end;

procedure TFormColorPickerEx.CreateImageBMP(var BmpSource: TBitmap; ImageDest: TImage; iColor: TColor = -1; DrawGradient: Boolean = False);
begin
  BmpSource:= TBitmap.Create;
  BmpSource.Width:=  ImageDest.Width;
  BmpSource.Height:= ImageDest.Height;
  BmpSource.PixelFormat:= pf24bit;
  if DrawGradient then
     Gradient(clBlack, iColor, BmpSource);
end;

procedure TFormColorPickerEx.UpdateTrackBarR;
begin
  TrackBarR.Canvas.Draw(0, 0, BarBmpRed);
  IL_MarkerIcon.Draw(TrackBarR.Canvas, RGBColor.r -MarkerCenter, MarkerAlign, MarkerIconIndex, True); // Paint Marker
end;

procedure TFormColorPickerEx.UpdateTrackBarG;
begin
  TrackBarG.Canvas.Draw(0, 0, BarBmpGreen);
  IL_MarkerIcon.Draw(TrackBarG.Canvas, RGBColor.g -MarkerCenter, MarkerAlign, MarkerIconIndex, True); // Paint Marker
end;

procedure TFormColorPickerEx.UpdateTrackBarB;
begin
  TrackBarB.Canvas.Draw(0, 0, BarBmpBlue);
  IL_MarkerIcon.Draw(TrackBarB.Canvas, RGBColor.b -MarkerCenter, MarkerAlign, MarkerIconIndex, True); // Paint Marker
end;

procedure TFormColorPickerEx.FormCreate(Sender: TObject);
begin
  mmResult:= mrCancel;
  OldColor:= clNone;
  // no new work has been done on this component from http://rmklever.com/?paged=4
end;

procedure TFormColorPickerEx.FormShow(Sender: TObject);
var
  Loop: Integer;

  function SetLabelColors(LabelSource: TShadowLabel; iColor: TColor): Boolean;
  begin
    Result:= True;
    LabelSource.Font.Color:= iColor;
    LabelSource.UseCustomDisabledFontColor:= True;
  end;

  function SetEditColors(EditSource: TEditEx): Boolean;
  begin
    Result:= True;
    EditSource.Color:= clrDarkGray;
    EditSource.ColorFrame:= clGray;
    EditSource.ColorFrameFocused:= clSilver;
    EditSource.ColorFrameDisabled:= clrMedDarkGray;
    EditSource.ColorDisabled:= menu_background_color[1];
    EditSource.Font.Color:= clCream;
    EditSource.UseCustomBorder:= True;
  end;

  function SetButtonColors(ButtonSource: TBitBtnEx): Boolean; overload;
  begin
    Result:= True;
    ButtonSource.Font.Color:= clCream;
    ButtonSource.UseCustomDraw:= True;
  end;

  function SetButtonColors(ButtonSource: TSpeedButtonEx): Boolean; overload;
  begin
    Result:= True;
    ButtonSource.Font.Color:= clCream;
    ButtonSource.UseCustomDraw:= True;
  end;

begin
  Resize4K;

  MarkerCenter:= (IL_MarkerIcon.Width div 2)-1;
  MarkerAlign:=  (imgZBar.Height+1-IL_MarkerIcon.Width) div 2;

  if IsNightMode then
     begin
       FormColorPickerEx.Color:= menu_background_color[1];
       for Loop:= 0 to FormColorPickerEx.ComponentCount-1 do
       begin
         if FormColorPickerEx.Components[Loop] is TShadowLabel then
            SetLabelColors(TShadowLabel(FormColorPickerEx.Components[Loop]), item_caption_active_color[1])
         else
         if FormColorPickerEx.Components[Loop] is TEditEx then
            SetEditColors(TEditEx(FormColorPickerEx.Components[Loop]))
         else
         if FormColorPickerEx.Components[Loop] is TBitBtnEx then
            SetButtonColors(TBitBtnEx(FormColorPickerEx.Components[Loop]))
         else
         if FormColorPickerEx.Components[Loop] is TSpeedButtonEx then
            SetButtonColors(TSpeedButtonEx(FormColorPickerEx.Components[Loop]));
       end;
     end;

  if Is4KMode then
     begin
       // darker checkerboard
       blockColor1:= 104;
       blockColor2:= 155;
     end
  else
     begin
       // lighter checkerboard (silver, white)
       blockColor1:= 204;
       blockColor2:= 255;
     end;

  AddMarkerIcon;
  SetLength(LUT138, imgColorBox.Width+1); // must be +1 larger than imgColorBox.Width
  for Loop:= 0 to High(LUT138)-1 do
      LUT138[Loop]:= MulDiv(255, Loop, High(LUT138)-1);

  CreateImageBMP(BarBmpRed,   TrackBarR, clRed,  True);
  CreateImageBMP(BarBmpGreen, TrackBarG, clLime, True);
  CreateImageBMP(BarBmpBlue,  TrackBarB, clBlue, True);

  CreateImageBMP(HBarBmp, imgZBar);
  CreateHueBar;

  CreateImageBMP(HBoxBmp,  imgColorbox);
  CreateImageBMP(ABarBmp,  imgAlpha);
  CreateImageBMP(ColorBmp, imgColor);

  if OldColor = clNone then
     begin
       // current color was not specified, show a random color
       Randomize;
       RGBColor.r:= Random(255);
       RGBColor.g:= Random(255);
       RGBColor.b:= Random(255);
     end
  else
     begin
       // current color specified by the user
       RGBColor.r:= GetRValue(OldColor);
       RGBColor.g:= GetGValue(OldColor);
       RGBColor.b:= GetBValue(OldColor);
     end;
  RGBAlpha:= 255; // alpha channel is opaque by default and not used by the frontend //Random(255);
  OldColor:= (RGBColor.b shl 16) + (RGBColor.g shl 8) + RGBColor.r; // current selected color
  OldAlpha:= RGBAlpha; // current selected alpha level

  DoBarRed:=   False;
  DoBarGreen:= False;
  DoBarBlue:=  False;
  DoColor:= False;
  DoBar:=   False;
  DoVar:=   False;

  VarIdx:=  -1;
  LastHue:= -1;

  PaintBasicColors;
  SetColor((RGBColor.b shl 16) + (RGBColor.g shl 8) + (RGBColor.r), RGBAlpha, False);
end;

procedure TFormColorPickerEx.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       case mmResult of
         mrOk:
           begin
             if NewColor = clNone then
                NewColor:= OldColor;
           end;
         mrCancel: NewColor:= -1;
       end;

       SetLength(LUT138, 0);

       BarBmpRed.Free;
       BarBmpGreen.Free;
       BarBmpBlue.Free;

       ColorBmp.Free;
       ABarBmp.Free;
       HBarBmp.Free;
       HBoxBmp.Free;
     end;
end;

procedure TFormColorPickerEx.Resize4K;
var
  iPos: Integer;

  function MoveImage(iImage: TImage; iLeft, iTop, iWidth, iHeight: Integer): Boolean;
  begin
    Result:= True;
    iImage.Left  := iLeft;
    iImage.Top   := iTop;
    iImage.Width := iWidth;
    iImage.Height:= iHeight;
  end;

  function MoveRGBEdit(iTop: Integer; iLabel: TShadowLabel; iBarImage: TImage; iEdit: TEditEx): Boolean;
  begin
    Result:= True;
    iLabel.Top:= iTop+2;
    MoveImage(iBarImage, 82, iTop, 255, 37);
    iEdit.Left:=   353;
    iEdit.Top:=    iTop;
    iEdit.Width:=  58;
    iEdit.Height:= 37;
    iEdit.Font.Size:= 16;
  end;

  function MoveButton(iButton: TBitBtnEx; iLeft: Integer): Boolean; overload;
  begin
    Result:= True;
    iButton.Left:=  iLeft;
    iButton.Top:=   ClientHeight-16-45;
    iButton.Width:= 168;
    iButton.Height:= 45;
  end;

  function MoveButton(iButton: TSpeedButtonEx; iTop: Integer): Boolean; overload;
  begin
    Result:= True;
    iButton.Font.Size:= 16;
    iButton.Left:=   16;
    iButton.Width:=  37;
    iButton.Height:= 37;
    iButton.Top:=    iTop;
  end;

begin
  if not Is4KMode then
     Exit;

  with FormColorPickerEx do
  begin
    Font.Size:= 16;
    IL_MarkerIcon.Width:=  24;
    IL_MarkerIcon.Height:= 24;

    MoveImage(imgAlpha, 16, 16, 37, 256);
    MoveImage(imgColorBox, imgAlpha.Left+imgAlpha.Width+16,  16, 512, 512);
    MoveImage(imgPal, imgColorBox.Left+imgColorBox.Width+16, 16, 128, 512);
    MoveImage(imgZBar, 16, imgColorBox.Top+imgColorBox.Height+16, imgPal.Left+imgPal.Width-16, 37);

    MoveButton(ButtonVar64, imgColorBox.Top+imgColorBox.Height-36);
    MoveButton(ButtonVar16, ButtonVar64.Top-ButtonVar64.Height);

    MoveRGBEdit(imgZBar.Top+imgZBar.Height+32,       Edit_Red_Label,   TrackBarR, Edit_Red);
    MoveRGBEdit(Edit_Red.Top+Edit_Red.Height+16,     Edit_Green_Label, TrackBarG, Edit_Green);
    MoveRGBEdit(Edit_Green.Top+Edit_Green.Height+16, Edit_Blue_Label,  TrackBarB, Edit_Blue);

    Edit_Hex.Left  := TrackBarR.Left;
    Edit_Hex.Top   := Edit_Blue.Top+Edit_Blue.Height+16;
    Edit_Hex.Width := 105;
    Edit_Hex.Height:= 37;
    Edit_Hex.Font.Size:= 16;
    Edit_Hex_Label.Top:= Edit_Hex.Top+2;

    Edit_Alpha.Left  := Edit_Red.Left;
    Edit_Alpha.Top   := Edit_Hex.Top;
    Edit_Alpha.Width := Edit_Red.Width;
    Edit_Alpha.Height:= 37;
    Edit_Alpha.Font.Size:= 16;
    Edit_Alpha_Label.Top:= Edit_Hex.Top+2;

    MoveImage(imgColor, Edit_Red.Left+Edit_Red.Width+110, Edit_Red.Top+Edit_Red.Height, 110, 128);
    imgColor_newLabel.Left:= imgColor.Left+36;
    imgColor_newLabel.Top:=  imgColor.Top-imgColor_newLabel.Height-3;

    imgColor_currentLabel.Left:= imgColor.Left+22;
    imgColor_currentLabel.Top:=  imgColor.Top+imgColor.Height-3;

    ClientWidth:= imgPal.Left+imgPal.Width+16;
    ClientHeight:= Edit_Hex.Top+Edit_Hex.Height+64+45+16; // 64 pixels between Edit_Hex and buttons; 45 Button.Height

    MoveButton(ButtonOk, (ClientWidth-(168+10+168)) div 2);
    MoveButton(ButtonCancel, ButtonOk.Left+ButtonOk.Width+10);
  end;
end;

procedure TFormColorPickerEx.ButtonOkClick(Sender: TObject);
begin
  mmResult:= TBitBtnEx(Sender).ModalResult;
  Close;
end;

procedure TFormColorPickerEx.imgColorBar_HSBtoRGB;
begin
  HSBtoRGB(MulDiv(360, BarX, imgZBar.Width), LUT138[BoxX], 255 - LUT138[BoxY],
           RGBColor.r, RGBColor.g, RGBColor.b);
end;

procedure TFormColorPickerEx.imgAlphaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoAlpha := True;
  if Y < 0 then
     Y:= 0;
  if Y > imgAlpha.Height-1 then
     Y:= imgAlpha.Height-1;
  BarA:= Y;
  RGBAlpha:= MulDiv(255, BarA, imgAlpha.Height-1);
  PaintColorPnl;
end;

procedure TFormColorPickerEx.imgAlphaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if not DoAlpha then
    Exit;
  if Y < 0 then
     Y:= 0;
  if Y > imgAlpha.Height-1 then
     Y:= imgAlpha.Height-1;

  if BarA <> Y then
  begin
    BarA:= Y;
    RGBAlpha:= MulDiv(255, BarA, imgAlpha.Height-1);
    PaintColorPnl;
  end;
end;

procedure TFormColorPickerEx.imgAlphaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DoAlpha:= False;
end;

procedure TFormColorPickerEx.imgZBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar:= True;
  if X < 0 then
     X:= 0;
  if X > imgZBar.Width-1 then
     X:= imgZBar.Width-1;
  BarX:= X;
  imgColorbar_HSBtoRGB;
  PaintColorPnl;
end;

procedure TFormColorPickerEx.imgZBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBar then
     Exit;
  if X < 0 then
     X:= 0;
  if X > imgZBar.Width-1 then
     X:= imgZBar.Width-1;

  if BarX <> X then
  begin
    BarX:= X;
    imgColorbar_HSBtoRGB;
    PaintColorPnl;
  end;
end;

procedure TFormColorPickerEx.imgZBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar:= False;
end;

procedure TFormColorPickerEx.imgColorBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DoVar then
  begin
    VarIdx:= ((y div CellDiv) * CellMul) + (x div CellDiv);
    RGBColor.r:= CTab[VarIdx].r;
    RGBColor.g:= CTab[VarIdx].g;
    RGBColor.b:= CTab[VarIdx].b;

    RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, HSBColor.h, HSBColor.s, HSBColor.b);
    BoxX:= MulDiv(imgColorBox.Width, HSBColor.s, 255);
    BoxY:= imgColorBox.Height-MulDiv(imgColorBox.Height, HSBColor.b, 255);
    AniCount:= AniStep;
    TimeAni.Enabled:= VarIdx <> -1; // 16 / 64 block color click animation; can be disabled, just comment this code line
    UpdateColorsRGB; // call this after the animation to prevent double marker showing up; example: RGB(0, 255, 77)
    Exit;
  end;
  
  DoColor:= True;
  if X < 0 then
     X:= 0;
  if X > imgColorBox.Width-1 then
     X:= imgColorBox.Width-1;
  if Y < 0 then
     Y:= 0;
  if Y > imgColorBox.Height-1 then
     Y:= imgColorBox.Height-1;

  BoxX:= X;
  BoxY:= Y;
  imgColorBar_HSBtoRGB;
  PaintColorPnl;
end;

procedure TFormColorPickerEx.imgColorBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoColor then
    Exit;
  if X < 0 then
     X:= 0;
  if X > imgColorBox.Width-1 then
     X:= imgColorBox.Width-1;
  if Y < 0 then
     Y:= 0;
  if Y > imgColorBox.Height - 1 then
     Y:= imgColorBox.Height - 1;

  if (BoxX <> X) or (BoxY <> Y) then
  begin
    BoxX:= X;
    BoxY:= Y;
    imgColorBar_HSBtoRGB;
    PaintColorPnl;
  end;
end;

procedure TFormColorPickerEx.imgColorBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoColor:= False;
end;

procedure TFormColorPickerEx.imgColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Y > (imgColor.Height div 2) then
     SetColor(OldColor, OldAlpha, False); // set current color (initial color when calling the dialog)
end;

procedure TFormColorPickerEx.imgPalMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetColor(imgPal.Canvas.Pixels[X, Y], 255, True);
end;

procedure TFormColorPickerEx.PaintColorHueBox;
var
  Row: PRGBArray;
  slMain, slSize, slPtr: Integer;
  x, y, w, h: Integer;
  m1, q1, q2, q3, s1, s2: Integer;
  r, g, b: Byte;
  LUT: array of Byte;
begin
  h:= MulDiv(360, BarX, imgZBar.Width);
  if h <> LastHue then
  begin // only update if needed
    LastHue:= h;
    HSBtoRGB(h, 255, 255, r, g, b);
    h:= HBoxBmp.Height- 1;
    w:= HBoxBmp.Width - 1;
    SetLength(LUT, w);
    for x:= 0 to w do
        LUT[x]:= MulDiv(255, x, w);
    slMain:= Integer(HBoxBmp.ScanLine[0]);
    slSize:= Integer(HBoxBmp.ScanLine[1]) - slMain;
    slPtr := slMain;
    for y:= 0 to h do
    begin
      s1:= LUT[y];
      m1:= s1 * -255 shr 8 + 255;
      q1:= (s1 * -r shr 8 + r) - m1; // Red
      q2:= (s1 * -g shr 8 + g) - m1; // Green
      q3:= (s1 * -b shr 8 + b) - m1; // Blue
      for x:= 0 to w do
      begin
        s2:= LUT[x];
        Row:= PRGBArray(slPtr);
        Row[x].r:= Byte(s2 * q1 shr 8 + m1);
        Row[x].g:= Byte(s2 * q2 shr 8 + m1);
        Row[x].b:= Byte(s2 * q3 shr 8 + m1);
      end;
      slPtr:= slPtr+slSize;
    end;
    SetLength(LUT, 0);
  end;
  imgColorBox.Canvas.Draw(0, 0, HBoxBmp);
  IL_MarkerIcon.Draw(imgColorBox.Canvas, BoxX -MarkerCenter, BoxY -MarkerCenter, MarkerIconIndex, True); // Paint Marker
end;

procedure TFormColorPickerEx.CreateHueBar;
var
  Row: PRGBArray;
  x, y: Integer;
begin
  for y:= 0 to imgZBar.Height-1 do
  begin
    Row:= PRGBArray(HBarBmp.ScanLine[y]);
    for x:= 0 to HBarBmp.Width-1 do
        HSBToRGB(MulDiv(360, x, imgZBar.Width), 255, 255, Row[x].r, Row[x].g, Row[x].b);
  end;
end;

procedure TFormColorPickerEx.PaintHueBar;
begin
  imgZBar.Canvas.Draw(0, 0, HBarBmp);
  IL_MarkerIcon.Draw(imgZBar.Canvas, BarX -MarkerCenter, MarkerAlign, 0, True); // Paint Marker
end;

procedure TFormColorPickerEx.PaintAlphaColor;
var
  Row: PRGBArray;
  RowOff: Integer;
  x, y, a: Integer;
  bool: Boolean;
  c1, c2, c3: TRGB;
  iSize: Integer;
begin
  iSize:= ColorBmp.Height div 2;
  c1.R:= blockColor1;
  c1.G:= blockColor1;
  c1.B:= blockColor1;
  c2.R:= blockColor2;
  c2.G:= blockColor2;
  c2.B:= blockColor2;
  Row:= PRGBArray(ColorBmp.ScanLine[0]);
  RowOff:= Integer(ColorBmp.ScanLine[1]) - Integer(ColorBmp.ScanLine[0]);

  a:= 255 - RGBAlpha;
  c3.r:= RGBColor.r;
  c3.g:= RGBColor.g;
  c3.b:= RGBColor.b;

  //a := 255 - OldAlpha; // current color at the top
  //c3.b := Byte(OldColor shr 16);
  //c3.g := Byte(OldColor shr 8);
  //c3.r := Byte(OldColor);
  for y:= 0 to ColorBmp.Height-1 do
  begin
    bool:= (y and 4 = 0);
    if y = iSize then
    begin
      a:= 255 - OldAlpha;
      c3.b:= Byte(OldColor shr 16);
      c3.g:= Byte(OldColor shr 8);
      c3.r:= Byte(OldColor);

      //a := 255 - RGBAlpha; // new color at the bottom
      //c3.r := RGBColor.r;
      //c3.g := RGBColor.g;
      //c3.b := RGBColor.b;
    end;
    c1.R:= a * (blockColor1 - c3.r) shr 8 + c3.r;
    c1.G:= a * (blockColor1 - c3.g) shr 8 + c3.g;
    c1.B:= a * (blockColor1 - c3.b) shr 8 + c3.b;
    c2.R:= a * (blockColor2 - c3.r) shr 8 + c3.r;
    c2.G:= a * (blockColor2 - c3.g) shr 8 + c3.g;
    c2.B:= a * (blockColor2 - c3.b) shr 8 + c3.b; 
    for x:= 0 to ColorBmp.Width-1 do
    begin
      if ((x + 1) mod 4 = 0) then
         bool:= not bool;
      if bool then
         Row[x]:= c1
      else
         Row[x]:= c2;
    end;
    Row:= PRGBArray(Integer(Row) + RowOff);
  end;
  imgColor.Canvas.Draw(0, 0, ColorBmp);
end;

procedure TFormColorPickerEx.PaintAlphaBar;
var
  Row: PRGBArray;
  RowOff: Integer;
  x, y, a: Integer;
  bool: Boolean;
  c1, c2: TRGB;
begin
  // c1, c2 -> checkered background colors
  c1.R:= blockColor1;
  c1.G:= blockColor1;
  c1.B:= blockColor1;
  c2.R:= blockColor2;
  c2.G:= blockColor2;
  c2.B:= blockColor2; 
  Row:= PRGBArray(ABarBmp.ScanLine[0]);
  RowOff:= Integer(ABarBmp.ScanLine[1]) - Integer(ABarBmp.ScanLine[0]);

  for y:= 0 to ABarBmp.Height-1 do
  begin
    bool:= (y and 4 = 0);
    a:= 255 - MulDiv(255, y, imgAlpha.Height-1);
    c1.R:= a * (blockColor1 - RGBColor.r) shr 8 + RGBColor.r;
    c1.G:= a * (blockColor1 - RGBColor.g) shr 8 + RGBColor.g;
    c1.B:= a * (blockColor1 - RGBColor.b) shr 8 + RGBColor.b;
    c2.R:= a * (blockColor2 - RGBColor.r) shr 8 + RGBColor.r;
    c2.G:= a * (blockColor2 - RGBColor.g) shr 8 + RGBColor.g;
    c2.B:= a * (blockColor2 - RGBColor.b) shr 8 + RGBColor.b; 
    for x:= 0 to ABarBmp.Width-1 do
    begin
      if ((x + 1) mod 4 = 0) then
         bool:= not bool;
      if bool then
         Row[x]:= c1
      else
         Row[x]:= c2;
    end;
    Row:= PRGBArray(Integer(Row) + RowOff);
  end;
  IL_MarkerIcon.Draw(aBarBmp.Canvas, MarkerAlign, BarA -MarkerCenter, MarkerIconIndex, True); // Paint Marker
  imgAlpha.Canvas.Draw(0, 0, ABarBmp);
end;

procedure TFormColorPickerEx.TrackBarRMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarRed:= True;
  if X < 0 then
     X:= 0;
  if X > TrackBarR.Width then
     X:= TrackBarR.Width;

  RGBColor.r:= X;
  UpdateTrackBarR;
  Application.ProcessMessages;
  UpdateColorsRGB;
end;

procedure TFormColorPickerEx.TrackBarRMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBarRed then
     Exit;
  if X < 0 then
     X:= 0;
  if X > TrackBarR.Width then
     X:= TrackBarR.Width;

  if RGBColor.r <> X then
  begin
    RGBColor.r:= X;
    UpdateTrackBarR;
    Application.ProcessMessages;
    UpdateColorsRGB;
  end;
end;

procedure TFormColorPickerEx.TrackBarGMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarGreen:= True;
  if X < 0 then
     X:= 0;
  if X > TrackBarG.Width then
     X:= TrackBarG.Width;

  RGBColor.g:= X;
  UpdateTrackBarG;
  Application.ProcessMessages;
  UpdateColorsRGB;
end;

procedure TFormColorPickerEx.TrackBarRMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarRed:= False;
end;

procedure TFormColorPickerEx.TrackBarGMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBarGreen then
     Exit;
  if X < 0 then
     X:= 0;
  if X > TrackBarG.Width then
     X:= TrackBarG.Width;

  if RGBColor.g <> X then
  begin
    RGBColor.g:= X;
    UpdateTrackBarG;
    Application.ProcessMessages;
    UpdateColorsRGB;
  end;
end;

procedure TFormColorPickerEx.TrackBarGMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarGreen:= False;
end;

procedure TFormColorPickerEx.TrackBarBMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarBlue:= True;
  if X < 0 then
     X:= 0;
  if X > TrackBarB.Width then
     X:= TrackBarB.Width;

  RGBColor.b:= X;
  UpdateTrackBarB;
  Application.ProcessMessages;
  UpdateColorsRGB;
end;

procedure TFormColorPickerEx.TrackBarBMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBarBlue then
     Exit;
  if X < 0 then
     X:= 0;
  if X > TrackBarB.Width then
     X:= TrackBarB.Width;

  if RGBColor.b <> X then
  begin
    RGBColor.b:= X;
    UpdateTrackBarB;
    Application.ProcessMessages;
    UpdateColorsRGB;
  end;
end;

procedure TFormColorPickerEx.TrackBarBMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBarBlue:= False;
end;

procedure TFormColorPickerEx.Edit_RedKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  iStr: String;
begin
  TextEnter:= True;

  iStr:= TEdit(Sender).Text;
  if iStr = '' then
     begin
       TextEnter:= False;
       Exit;
     end;

  if TEdit(Sender).Tag <> 4 then
  begin
    try
      i:= StrToInt(iStr);
    except
      TextEnter:= False;
      Exit;
    end;
    if i > 255 then
       begin
         TextEnter:= False;
         Exit;
       end;
    if iStr <> IntToStr(i) then
       TEdit(Sender).Text:=  IntToStr(i);
  end
  else
  begin
    if Length(TEdit(Sender).Text) < 6 then
       begin
         // HEX color value must be 6 chars
         TextEnter:= False;
         Exit;
       end;
  end;
  case TEdit(Sender).Tag of
    0: RGBColor.r:= i; // Red
    1: RGBColor.g:= i; // Green
    2: RGBColor.b:= i; // Blue
    3:
      begin
        RGBAlpha:= i;
        BarA:= MulDiv(imgAlpha.Height-1, i, 255);
      end;
    4: HEXtoRGB(TEdit(Sender).Text, RGBColor.r, RGBColor.g, RGBColor.b); // HEX #
  end;
  UpdateEditBoxRGB;
  // Delphi TColor is Blue Green Red (inverted)
  UpdateColorsRGB; // calling this will execute "SetColor" function, which in turn will execute "PaintColorPnl" function
  UpdateTrackBarsRGB;

  TextEnter:= False;
end;

procedure TFormColorPickerEx.Edit_RedKeyPress(Sender: TObject; var Key: Char);
begin                                  // Ctrl+C  Ctrl+V   Ctrl+X   Ctrl+A
  if not (Key in ['0'..'9', Chr(VK_BACK), Chr(3), Chr(22), Chr(24), Chr(1)]) then
     Key := #0;
end;

procedure TFormColorPickerEx.Edit_HexKeyPress(Sender: TObject; var Key: Char);
begin                                                      // Ctrl+C  Ctrl+V   Ctrl+X   Ctrl+A
  if not (Key in ['0'..'9', 'A'..'F', 'a'..'f', Chr(VK_BACK), Chr(3), Chr(22), Chr(24), Chr(1)]) then
     Key := #0;
end;

{
// get RGB colors from a HEX edit box
var
  r, g, b: Byte;
  s: String;
begin
  s:= Edit_Hex.Text;
  r:= StrToInt('$'+Copy(s, 1, 2));
  g:= StrToInt('$'+Copy(s, 3, 2));
  b:= StrToInt('$'+Copy(s, 5, 2));
  ShowMessage(IntToStr(r)+#13#10+IntToStr(g)+#13#10+IntToStr(b));
}

procedure TFormColorPickerEx.timeAniTimer(Sender: TObject);
var
  x, y: Integer;
  c: Integer;
begin
  // used to animate pressed colors with "16" / "64" buttons, if pressed/enabled
  AniCount:= AniCount - 1;
  if VarIdx <> -1 then
  begin
    y:= (VarIdx div CellMul);
    x:= (VarIdx - (CellMul * y));
    x:= CellDiv * x;
    y:= CellDiv * y;
    c:= (CTab[VarIdx].b shl 16) + (CTab[VarIdx].g shl 8) + CTab[VarIdx].r;
    if VarIdx < 8 then
       c:= Blend($00353535, c, Trunc(AniCount * (100 / AniStep)))  // clBlack
    else
       c:= Blend(clCream,   c, Trunc(AniCount * (100 / AniStep))); // clWhite
    HBoxBmp.Canvas.Pen.Color  := c;
    HBoxBmp.Canvas.Brush.Color:= c;
    HBoxBmp.Canvas.Brush.Style:= bsSolid;
    //HBoxBmp.Canvas.RoundRect(x + 1, y + 1, x + CellDiv - 1, y + CellDiv - 1, 3, 3);
    HBoxBmp.Canvas.Rectangle(x + 1, y + 1, x + CellDiv - 1, y + CellDiv - 1);

    IL_MarkerIcon.Draw(HBoxBmp.Canvas, x+((CellDiv div 2){-1})-MarkerCenter, y+((CellDiv div 2){-1})-MarkerCenter, MarkerIconIndex, True); // Paint Marker
    imgColorBox.Canvas.Draw(0, 0, HBoxBmp);
  end;
  timeAni.Enabled:= (AniCount > 0) or (VarIdx = -1);
end;


procedure TFormColorPickerEx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

end.


