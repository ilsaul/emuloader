unit GradientEx;

interface

uses
  Windows
 ,SysUtils
 ,Classes
 ,Graphics
 ,Controls
 ;

type
 TGradientDirection = (gdLeftRight, gdTopBottom);

procedure DrawGradient(Canvas: TCanvas; R: TRect; StartColor, EndColor: TColor; Direction: TGradientDirection = gdLeftRight);
procedure DrawGradientFocal(Canvas: TCanvas; R: TRect; StartColor, EndColor: TColor; FocalPoint: Integer);

implementation

type
 COLOR16 = Word; { is declared as Shortint in Delphi 7 }

 PTriVertex = ^TTriVertex;
 _TRIVERTEX = packed record
   x     : Longint;
   y     : Longint;
   Red   : COLOR16;
   Green : COLOR16;
   Blue  : COLOR16;
   Alpha : COLOR16;
 end;
 TTriVertex = _TRIVERTEX;
 TRIVERTEX = _TRIVERTEX;



function WindowsGradientFill(DC: THandle; Vertex: PTriVertex; NumVertex: ULONG; Mesh: Pointer; NumMesh, Mode: ULONG): BOOL;
 stdcall; external 'msimg32.dll' name 'GradientFill';


procedure SetVertex(var Vertex: TTriVertex; X, Y: Integer; Color: TColor);
begin
 Vertex.x      := X;
 Vertex.y      := Y;
 Vertex.Red    := (Color and $000000FF) shl 8;   
 Vertex.Green  := (Color and $0000FF00);         
 Vertex.Blue   := (Color and $00FF0000) shr 8;    
 Vertex.Alpha  := 0;
end; 

procedure SetTriangle(var Triangle: TGradientTriangle; Vertex1, Vertex2, Vertex3: Integer);
begin
 Triangle.Vertex1 := Vertex1;
 Triangle.Vertex2 := Vertex2;
 Triangle.Vertex3 := Vertex3;
end; 

procedure DrawGradient(Canvas: TCanvas; R: TRect; StartColor, EndColor: TColor; Direction: TGradientDirection);
var
 Vertices : array[0..1] of TTriVertex;
 Rects    : array[0..0] of TGradientRect;
 Mode     : ULONG;
begin
 SetVertex(Vertices[0], R.Left, R.Top, StartColor);
 SetVertex(Vertices[1], R.Right, R.Bottom, EndColor);

 Rects[0].UpperLeft  := 0;
 Rects[0].LowerRight := 1;

 if Direction = gdLeftRight then
   Mode := GRADIENT_FILL_RECT_H
 else
   Mode := GRADIENT_FILL_RECT_V;

 WindowsGradientFill(Canvas.Handle, @Vertices, 2, @Rects, 1, Mode);
end; 

procedure DrawGradientFocal(Canvas: TCanvas; R: TRect; StartColor, EndColor: TColor; FocalPoint: Integer);
var
 Vertices   : array[0..8] of TTriVertex;
 Triangles  : array[0..7] of TGradientTriangle;   
 MiddleX    : Integer;
 MiddleY    : Integer;
begin

 MiddleX  := R.Left + (R.Right{ WidthOf(R)} div 2);
 MiddleY  := R.Top  + (R.Bottom{HeightOf(R)} div 2);

 SetVertex(Vertices[0], R.Left     ,R.Top     ,EndColor);
 SetVertex(Vertices[1], MiddleX    ,R.Top     ,EndColor);
 SetVertex(Vertices[2], R.Right    ,R.Top     ,EndColor);
 SetVertex(Vertices[3], R.Left     ,MiddleY   ,EndColor);
 SetVertex(Vertices[4], MiddleX    ,MiddleY   ,EndColor);
 SetVertex(Vertices[5], R.Right    ,MiddleY   ,EndColor);
 SetVertex(Vertices[6], R.Left     ,R.Bottom  ,EndColor);
 SetVertex(Vertices[7], MiddleX    ,R.Bottom  ,EndColor);
 SetVertex(Vertices[8], R.Right    ,R.Bottom  ,EndColor);

 if not (FocalPoint in [0..8]) then
   FocalPoint := 4;

 SetVertex(Vertices[FocalPoint], Vertices[FocalPoint].X, Vertices[FocalPoint].Y, StartColor);


 SetTriangle(Triangles[0], 0, 1, 4);
 SetTriangle(Triangles[1], 0, 4, 3);
 SetTriangle(Triangles[2], 1, 2, 4);
 SetTriangle(Triangles[3], 2, 5, 4);
 SetTriangle(Triangles[4], 4, 5, 8);
 SetTriangle(Triangles[5], 4, 7, 8);
 SetTriangle(Triangles[6], 4, 7, 6);
 SetTriangle(Triangles[7], 3, 4, 6);

 WindowsGradientFill(Canvas.Handle, @Vertices, 9, @Triangles, 8, GRADIENT_FILL_TRIANGLE);

end; 

end.