unit uZTestWorkbench;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ButtonsEx, ShadowLabel, ExtCtrls, PanelEx;
  // Win7TaskBarProgressUnit, ActiveX; // both for Taskbar progress bar;

type
  TFormZTestWorkbench = class(TForm)
    PanelEx1: TPanelEx;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ShadowLabel2: TShadowLabel;
    ShadowLabel3: TShadowLabel;
    Label1: TLabel;
    BitBtnEx1: TBitBtnEx;
    BitBtnEx3: TBitBtnEx;
    BitBtnEx2: TBitBtnEx;
    BitBtnEx4: TBitBtnEx;
    BitBtnEx5: TBitBtnEx;
    procedure BitBtnEx2Click(Sender: TObject);
    procedure BitBtnEx1Click(Sender: TObject);
    procedure BitBtnEx3Click(Sender: TObject);
    procedure BitBtnEx5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormZTestWorkbench: TFormZTestWorkbench;

implementation

{$R *.dfm}

uses uMain, uCommon;

procedure TFormZTestWorkbench.BitBtnEx2Click(Sender: TObject);
var
  hIcon: THandle;
  nIconId: DWORD;

  tmpIcon, FinalIcon: TIcon;

  bmpIcon: TBitmap;
  iRect: TRect;
  bMask: HBITMAP;
  bColor: HBITMAP;

  function Ico2Bmp(iIcon: TIcon): TBitmap;
  var
    IconInfo: TIconInfo;
  begin
    GetIconInfo(iIcon.Handle, IconInfo);

    bMask:= IconInfo.hbmMask;
    bColor:= IconInfo.hbmColor;
    Result:= TBitmap.Create;

    with Result do
      begin
        HandleType:= bmDIB;
        PixelFormat:= pf32bit;
        TransparentMode:= tmAuto;
        Transparent:= True;
        Width:=  (IconInfo.xHotspot*2);
        Height:= (IconInfo.yHotspot*2);
        MaskHandle:= IconInfo.hbmMask;
        Handle:= IconInfo.hbmColor;
        //DrawIconEx(Canvas.Handle, 0, 0, iIcon.Handle, Width, Height, 0, 0, DI_NORMAL);
        //DrawIcon(Canvas.Handle, 0, 0, iIcon.Handle)
        Canvas.Draw(0, 0, iIcon);
      end;
  end;

  function Bmp2Ico(Bitmap: TBitmap): TIcon;
  var
    IconInfo2: TIconInfo;
  begin
    IconInfo2.fIcon:= True;
    IconInfo2.xHotspot:= Bitmap.Width;
    IconInfo2.yHotspot:= Bitmap.Height;
    IconInfo2.hbmColor:= Bitmap.Handle;
    IconInfo2.hbmMask:=  Bitmap.MaskHandle;
    Result:= TIcon.Create;
    Result.Handle:= CreateIconIndirect(IconInfo2);
  end;

  procedure ChangeWhiteToBlack32(var Bitmap: TBitmap; TopIndex: Integer);
  var
    scanline: PRGBQuad;
    y: Integer;
    x: Integer;
    iBitmap: TBitmap;
  begin
    //Assert(Bitmap.PixelFormat = pf32bit); // bitmap is always pf32bit

    //Bitmap.Canvas.Lock;
    iBitmap:= TBitmap.Create;

    with iBitmap do
    begin
      PixelFormat:= pf32bit;
      {TransparentMode:= tmAuto;
      Transparent:= True;
      Palette:= Bitmap.Palette;
      TransparentColor:= Bitmap.TransparentColor;}
      Width:=  Bitmap.Width;
      Height:= Bitmap.Height;
      //Handle:= Bitmap.Handle;
      //MaskHandle:= Bitmap.MaskHandle;
      Canvas.Draw(0, 0, Bitmap);
    end;

    for y := TopIndex to Bitmap.Height - 1 do
    begin
      scanline := Bitmap.ScanLine[y];
      for x := 0 to Bitmap.Width - 1 do
      begin
        with scanline^ do
        begin
          //if rgbReserved = 0 then
          //   FillChar(scanline^, SizeOf(TRGBQuad), 0);

          if (rgbBlue = 255) and (rgbGreen = 255) and (rgbRed = 255) then
          //if (rgbBlue = 72) and (rgbGreen = 72) and (rgbRed = 255) then
             //begin rgbBlue:= 128; rgbGreen:= 128; rgbRed:= 128; end;
             //  rev:= rgbReserved; end; //showmessagew('rev: '+IntToStr(rev)); end;
             //rgbReserved:= 100;
             FillChar(scanline^, SizeOf(TRGBQuad), 0);
        end;
        Inc(scanline);
      end;
    end;
    //Bitmap.Canvas.UnLock;
    //FinalIcon:= Bmp2Ico(iBitmap);

    FreeAndNil(iBitmap);
  end;

  function InvertBitmap(Bitmap: TBitmap; TopIndex: Integer): TBitmap;
  var
    x, y: Integer;
    ByteArray: PByteArray;
  begin
    for y := TopIndex{0} to Bitmap.Height-1 do
    begin
      ByteArray:= Bitmap.ScanLine[y];
      for x := 0 to Bitmap.Width * 3 - 1 do
      begin
        ByteArray[x] := 255 - ByteArray[x];
      end;
    end;
    Result:= Bitmap;
  end;

  function InvertBmp1(SourceBmp: TBitmap; TopIndex: Integer): TBitmap;
  var
    i, j: Longint;
    tmp: TBitMap;
    red, green, blue: Byte;
    PixelColor: Longint;
  begin
    tmp := TBitmap.Create;
    tmp.PixelFormat:= pf32bit;
    tmp.TransparentMode:= tmAuto;
    tmp.Transparent:= True;
    tmp.Width  := SourceBmp.Width;
    tmp.Height := SourceBmp.Height;
    tmp.Assign(SourceBmp);
    for i := 0 to SourceBmp.Width - 1 do
    begin
      for j := 0 to SourceBmp.Height - 1 do
      begin
        PixelColor := ColorToRGB(SourceBmp.Canvas.Pixels[i, j]);
        red := PixelColor;
        green := PixelColor shr 8;
        blue := PixelColor shr 16;

        red  := 255 - red;
        green := 255 - green;
        blue := 255 - blue;
        tmp.Canvas.pixels[i, j] := (red shl 8 + green) shl 8 + blue;
      end;
    end;
    FinalIcon:= Bmp2Ico(tmp);
    //Result := tmp;
    tmp.Free;
  end;

begin
  Image1.Picture.Icon:= nil; // clear it first

  if ExtractIcon('D:\EmuLoader\resources\main_icons\image_01_gamesnap.ico', hIcon, nIconId, Image1.Width, Image1.Height) then
  //if PrivateExtractIcons(PChar('D:\EmuLoader\resources\main_icons\image_01_gamesnap.ico'), 0,
  //                       Image1.Width, Image1.Height, @hIcon, @nIconId, 1, LR_LOADFROMFILE) <> 0 then
     begin
       tmpIcon:= TIcon.Create;
       tmpIcon.Handle:= hIcon;

       bmpIcon:= Ico2Bmp(tmpIcon);

       //Image1.Picture.Bitmap.Handle:= bmpIcon.Handle;
       //exit;
       ChangeWhiteToBlack32(bmpIcon, 61);
       //Image1.Picture.Bitmap.Handle:= bmpIcon.Handle;
       //exit;

       iRect:= bmpIcon.Canvas.ClipRect;
       iRect.Top:= 61;

       bmpIcon.Canvas.CopyMode:= cmDstInvert;
       bmpIcon.Canvas.CopyRect(iRect, bmpIcon.Canvas, bmpIcon.Canvas.ClipRect);
       bmpIcon.Canvas.CopyMode:= cmSrcCopy;
       bmpIcon.MaskHandle:= bMask;


       //InvertRect(bmpIcon.Canvas.Handle, iRect);

       FinalIcon:= Bmp2Ico(bmpIcon);
       GetIconToImage(FinalIcon.Handle, Image1, Image1.Width, Image1.Height);
       //Image1.Picture.Icon.Handle:= FinalIcon.Handle; // doesn't work!

       tmpIcon.ReleaseHandle;
       FreeAndNil(tmpIcon);
       bmpIcon.ReleaseHandle;
       bmpIcon.ReleaseMaskHandle;
       FreeAndNil(bmpIcon);
       FreeAndNil(FinalIcon);
     end;

  DestroyIcon(hIcon);
end;

procedure TFormZTestWorkbench.BitBtnEx1Click(Sender: TObject);
var
  icoS: TIcon;
begin
  icoS:= TIcon.Create;
  //icoS.LoadFromStream();
  icoS.Handle:= LoadImage(HInstance, PChar('D:\emulators\mame\icons\ffight.ico'), IMAGE_ICON, 32, 32, LR_LOADFROMFILE);
  Image1.Picture.Icon.Handle:= icoS.Handle;
  icoS.ReleaseHandle;
  FreeAndNil(icoS);
end;

// TaskBar progress bar ???
//type
//  ITaskbarList = interface(IUnknown)
//    ['{56FDF342-FD6D-11D0-958A-006097C9A090}']
//    function HrInit: HRESULT; stdcall;
//    function AddTab(hwnd: HWND): HRESULT; stdcall;
//    function DeleteTab(hwnd: HWND): HRESULT; stdcall;
//    function ActivateTab(hwnd: HWND): HRESULT; stdcall;
//    function SetActiveAlt(hwnd: HWND): HRESULT; stdcall;
//  end;

//  ITaskbarList2 = interface(ITaskbarList)
//    ['{602D4995-B13A-429B-A66E-1935E44F4317}']
//    function MarkFullscreenWindow(hwnd: HWND;
//      fFullscreen: BOOL): HRESULT; stdcall;
//  end;

//  THUMBBUTTON = record
//    dwMask: DWORD;
//    iId: UINT;
//    iBitmap: UINT;
//    hIcon: HICON;
//    szTip: packed array[0..259] of WCHAR;
//    dwFlags: DWORD;
//  end;
//  TThumbButton = THUMBBUTTON;
//  PThumbButton = ^TThumbButton;

//  ITaskbarList3 = interface(ITaskbarList2)
//    ['{EA1AFB91-9E28-4B86-90E9-9E9F8A5EEFAF}']
//    function SetProgressValue(hwnd: HWND; ullCompleted: UInt64;
//      ullTotal: UInt64): HRESULT; stdcall;
//    function SetProgressState(hwnd: HWND;
//      tbpFlags: Integer): HRESULT; stdcall;
//    function RegisterTab(hwndTab: HWND; hwndMDI: HWND): HRESULT; stdcall;
//    function UnregisterTab(hwndTab: HWND): HRESULT; stdcall;
//    function SetTabOrder(hwndTab: HWND;
//      hwndInsertBefore: HWND): HRESULT; stdcall;
//    function SetTabActive(hwndTab: HWND; hwndMDI: HWND;
//      tbatFlags: Integer): HRESULT; stdcall;
//    function ThumbBarAddButtons(hwnd: HWND; cButtons: UINT;
//      pButton: PThumbButton): HRESULT; stdcall;
//    function ThumbBarUpdateButtons(hwnd: HWND; cButtons: UINT;
//      pButton: PThumbButton): HRESULT; stdcall;
//    function ThumbBarSetImageList(hwnd: HWND;
//      himl: HIMAGELIST): HRESULT; stdcall;
//    function SetOverlayIcon(hwnd: HWND; hIcon: HICON;
//      pszDescription: LPCWSTR): HRESULT; stdcall;
//    function SetThumbnailTooltip(hwnd: HWND;
//      pszTip: LPCWSTR): HRESULT; stdcall;
//    function SetThumbnailClip(hwnd: HWND;
//      var prcClip: TRect): HRESULT; stdcall;
//  end;

//const
//  CLSID_TaskbarList: TGUID = '{56FDF344-FD6D-11d0-958A-006097C9A090}';
//  TBPF_NOPROGRESS    = 0;
//  TBPF_INDETERMINATE = $1;
//  TBPF_NORMAL        = $2;
//  TBPF_ERROR         = $4;
//  TBPF_PAUSED        = $8;


procedure TFormZTestWorkbench.BitBtnEx3Click(Sender: TObject);
//var
//  TBL: ITaskbarList3;
//  I: Integer;
begin
{  CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC, ITaskbarList3, TBL);

  if (TBL <> nil) then
    TBL.SetProgressState(Application.Handle, TBPF_NORMAL);//TBPF_INDETERMINATE);
  try
    for I := 0 to 100 do
    begin
      if (TBL <> nil) then
        TBL.SetProgressValue(Application.Handle, I, 100);
      Sleep(100);
    end;
  finally
    if (TBL <> nil) then
      begin
        TBL.SetProgressState(Application.Handle, TBPF_NOPROGRESS);
        TBL:= nil;
      end;
  end;}
end;

procedure TFormZTestWorkbench.BitBtnEx5Click(Sender: TObject);
var
  hIcon: THandle;
  nIconId: DWORD;

  tmpIcon, FinalIcon: TIcon;

  bmpIcon, bmpMask: TBitmap;

  function Ico2Bmp(iIcon: TIcon):Boolean;
  var
    IconInfo: TIconInfo;
  begin
    Result:= True;
    GetIconInfo(iIcon.Handle, IconInfo);

    bmpIcon:= TBitmap.Create;
    with bmpIcon do
      begin
        PixelFormat:= pf32bit;
        TransparentMode:= tmAuto;
        Transparent:= True;
        Width:=  (IconInfo.xHotspot*2);
        Height:= (IconInfo.yHotspot*2);
        Handle:= IconInfo.hbmColor;
        MaskHandle:= IconInfo.hbmMask;
        Canvas.Draw(0, 0, iIcon);
      end;

    bmpMask:= TBitmap.Create;
    with bmpMask do
      begin
        PixelFormat:= pf32bit;
        TransparentMode:= tmAuto;
        Transparent:= True;
        Width:=  (IconInfo.xHotspot*2);
        Height:= (IconInfo.yHotspot*2);
        Handle:= IconInfo.hbmMask;      // invert these two so the mask can be edited
        MaskHandle:= IconInfo.hbmColor; // invert these two so the mask can be edited
        Canvas.Draw(0, 0, iIcon);
      end;
    //Image1.Picture.Bitmap.Assign(bmpIcon); // debugging only
    //Image2.Picture.Bitmap.Assign(bmpMask); // debugging only
  end;

  function Bmp2Ico(Bitmap, MaskBitmap: TBitmap): TIcon;
  var
    IconInfo2: TIconInfo;
  begin
    IconInfo2.fIcon:= True;
    IconInfo2.xHotspot:= Bitmap.Width;
    IconInfo2.yHotspot:= Bitmap.Height;
    IconInfo2.hbmColor:= Bitmap.Handle;
    IconInfo2.hbmMask:=  Bitmap.MaskHandle;// MaskBitmap.Handle; // Bitmap.MaskHandle;
    Result:= TIcon.Create;
    Result.Handle:= CreateIconIndirect(IconInfo2);
  end;

  procedure ChangeWhiteToBlack32({var Bitmap: TBitmap; }TopIndex: Integer; FontColorCurrent, FontColorNew: TColor);
  var
    scanline, scanlineMask: PRGBQuad;
    y: Integer;
    x: Integer;
    //rev: Byte;
    iBitmap, iBitmapMask: TBitmap;
    iRect: TRect;
    oldColor, newColor: TRGB;
  begin
    //Assert(Bitmap.PixelFormat = pf32bit); // bitmap is always pf32bit
    // get the front bitmap part to edit
    iBitmap:= TBitmap.Create;
    iRect:= bmpIcon{Bitmap}.Canvas.ClipRect;
    with iBitmap do
    begin
      PixelFormat:= pf32bit;
      Transparent:= True;
      Width:=  bmpIcon{Bitmap}.Width;
      Height:= bmpIcon{Bitmap}.Height;
    end;
    iBitmap.Canvas.CopyRect(iRect, bmpIcon{Bitmap}.Canvas, iRect); // copy to a new TBitmap so we can edit pixels

    // get the mask bitmap part to edit
    iBitmapMask:= TBitmap.Create;
    iRect:= bmpIcon{Bitmap}.Canvas.ClipRect;
    with iBitmapMask do
    begin
      PixelFormat:= pf32bit;
      Transparent:= True;
      Width:=  bmpIcon{Bitmap}.Width;
      Height:= bmpIcon{Bitmap}.Height;
    end;
    iBitmapMask.Canvas.CopyRect(iRect, bmpMask.Canvas, iRect); // copy to a new TBitmap so we can edit pixels

    oldColor.Red:= GetRValue(FontColorCurrent); // red
    oldColor.Green:= GetGValue(FontColorCurrent); // green
    oldColor.Blue:= GetBValue(FontColorCurrent); // blue

    newColor.Red:= GetRValue(FontColorNew); // red
    newColor.Green:= GetGValue(FontColorNew); // green
    newColor.Blue:= GetBValue(FontColorNew); // blue

    // edit text pixels according to desired color (semi-transparent pixels is not yet supported/verified ?)
    // white text on front, mask must be white
    // black text on front, mask but be changed to black as well
    for y := TopIndex to iBitmap.Height - 1 do
    begin
      scanline := iBitmap.ScanLine[y];
      scanlineMask:= iBitmapMask.ScanLine[y];
      for x := 0 to iBitmap.Width - 1 do
      begin
        with scanline^ do
        begin
          if (rgbRed = oldColor.Red) and (rgbGreen = oldColor.Green) and (rgbBlue = oldColor.Blue) then
             begin
               rgbRed:= newColor.Red; rgbGreen:= newColor.Green; rgbBlue:= newColor.Blue;
               //FillChar(scanline^, SizeOf(TRGBQuad), 0); / this also changes the opacity level... wrong!
               with scanlineMask^do
               begin
                 if (rgbBlue <> 0) and (rgbGreen <> 0) and (rgbRed <> 0) then
                 rgbBlue:= 0; rgbGreen:= 0; rgbRed:= 0; // should this be always black ?
                 //FillChar(scanlineMask^, SizeOf(TRGBQuad), 0);
               end;
             end;
        end;
        Inc(scanline);
        Inc(scanlineMask);
      end;
    end;
    iRect:= bmpIcon.Canvas.ClipRect;
    iRect.Top:= TopIndex;
    bmpIcon.Canvas.CopyRect(iRect, iBitmap.Canvas, iRect);
    bmpMask.Canvas.CopyRect(iRect, iBitmapMask.Canvas, iRect);
    //Image1.Picture.Bitmap.Assign(bmpIcon);
    //Image2.Picture.Bitmap.Assign(bmpMask);
    FreeAndNil(iBitmap);
    FreeAndNil(iBitmapMask);
  end;

begin
  Image1.Picture.Icon:= nil; // clear it first
  Image2.Picture.Icon:= nil; // clear it first
  Image3.Picture.Icon:= nil; // clear it first
  Image4.Picture.Icon:= nil; // clear it first
  Image5.Picture.Icon:= nil; // clear it first

  //if PrivateExtractIcons(PChar('D:\EmuLoader\resources\main_icons\toolbar_filters\viewmode_01_details.ico' {'D:\EmuLoader\resources\main_icons\image_03_flyer.ico'}), 0,
  //                       Image1.Width, Image1.Height, @hIcon, @nIconId, 1, LR_LOADFROMFILE) <> 0 then
  if ExtractIcon('D:\EmuLoader\resources\main_icons\toolbar_filters\'+{'hide_games - Copy.ico'}'hide_games.ico', hIcon, nIconId, Image1.Width, Image1.Height) then
     begin
       tmpIcon:= TIcon.Create;
       tmpIcon.Handle:= hIcon;

       FormMain.IconChangeFontColor(tmpIcon, FinalIcon, clWhite, clBlack);//, $004a4a4a);

       GetIconToImage(FinalIcon.Handle, Image3, Image3.Width, Image3.Height);
       GetIconToImage(tmpIcon.Handle, Image4, Image4.Width, Image4.Height);

       FormMain.AddDefaultIcons({'hide_games - Copy.ico'}'hide_games.ico', FormMain.GetFolderFull(40), nil, 1, Image5);

       {GetIconToImage(tmpIcon.Handle, Image4, Image4.Width, Image4.Height);

       Ico2Bmp(tmpIcon);}

       {ChangeWhiteToBlack32(61, clWhite, clBlue);//clBlack);
       Image1.Picture.Bitmap.Assign(bmpIcon);
       Image2.Picture.Bitmap.Assign(bmpMask);

       FinalIcon:= Bmp2Ico(bmpIcon, bmpMask);
       GetIconToImage(FinalIcon.Handle, Image3, Image3.Width, Image3.Height);
       //Image1.Picture.Icon.Handle:= FinalIcon.Handle; // doesn't work!

       //bmpIcon.ReleaseHandle;
       //bmpIcon.ReleaseMaskHandle;
       FreeAndNil(bmpIcon);

       //bmpMask.ReleaseHandle;
       //bmpMask.ReleaseMaskHandle;
       FreeAndNil(bmpMask);}
       DestroyIcon(FinalIcon.Handle);
       FreeAndNil(FinalIcon);

       tmpIcon.ReleaseHandle;
       FreeAndNil(tmpIcon);
     end;

  DestroyIcon(hIcon);
end;

end.
