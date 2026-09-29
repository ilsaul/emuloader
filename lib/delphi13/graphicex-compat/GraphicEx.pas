unit GraphicEx;

{ Delphi 13 / Win64 compatibility replacement for Mike Lischke's GraphicEx.
  The original library links 32-bit C object files and cannot be used in
  Win64. EmuLoader only uses TPNGGraphic and TGIFGraphic as TBitmap
  descendants, so these classes decode through the VCL imaging units and
  keep the TBitmap behaviour (Canvas, Scanline, PixelFormat, Assign). }

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg;

type
  TGraphicExGraphic = class(TBitmap)
  protected
    procedure DecodeStream(Stream: TStream); virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
  end;

  TPNGGraphic = class(TGraphicExGraphic)
  protected
    procedure DecodeStream(Stream: TStream); override;
  end;

  TGIFGraphic = class(TGraphicExGraphic)
  protected
    procedure DecodeStream(Stream: TStream); override;
  end;

implementation

{ TGraphicExGraphic }

procedure TGraphicExGraphic.LoadFromStream(Stream: TStream);
begin
  DecodeStream(Stream);
end;

{ TPNGGraphic }

procedure TPNGGraphic.DecodeStream(Stream: TStream);
var
  Png: TPngImage;
  X, Y: Integer;
  Src: PRGBTriple;
  Alpha: PByte;
  Dst: PRGBQuad;
  C: TColor;
begin
  Png := TPngImage.Create;
  try
    Png.LoadFromStream(Stream);
    if Png.Header.ColorType in [COLOR_RGBALPHA, COLOR_GRAYSCALEALPHA] then
    begin
      // Same result as GraphicEx: 32-bit BGRA, alpha not premultiplied.
      PixelFormat := pf32bit;
      AlphaFormat := afIgnored;
      SetSize(Png.Width, Png.Height);
      for Y := 0 to Png.Height - 1 do
      begin
        Dst := ScanLine[Y];
        Alpha := PByte(Png.AlphaScanline[Y]);
        if Png.Header.ColorType = COLOR_RGBALPHA then
        begin
          Src := Png.Scanline[Y];
          for X := 0 to Png.Width - 1 do
          begin
            Dst.rgbBlue := Src.rgbtBlue;
            Dst.rgbGreen := Src.rgbtGreen;
            Dst.rgbRed := Src.rgbtRed;
            Dst.rgbReserved := Alpha^;
            Inc(Src);
            Inc(Alpha);
            Inc(Dst);
          end;
        end
        else
          for X := 0 to Png.Width - 1 do
          begin
            C := Png.Pixels[X, Y];
            Dst.rgbBlue := GetBValue(C);
            Dst.rgbGreen := GetGValue(C);
            Dst.rgbRed := GetRValue(C);
            Dst.rgbReserved := Alpha^;
            Inc(Alpha);
            Inc(Dst);
          end;
      end;
    end
    else
      Assign(Png);
  finally
    Png.Free;
  end;
end;

{ TGIFGraphic }

procedure TGIFGraphic.DecodeStream(Stream: TStream);
var
  Gif: TGIFImage;
begin
  Gif := TGIFImage.Create;
  try
    Gif.LoadFromStream(Stream);
    Assign(Gif);
  finally
    Gif.Free;
  end;
end;

end.
