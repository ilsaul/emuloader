unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  GR32_Image, GR32_Layers, StdCtrls;

type
  TFormStatus = class(TForm)
    ImageLogo: TImage32;
    LabelFrontendVersion: TLabel;
    LabelStatusType: TLabel;
    LabelMessage: TLabel;
    LabelProgress: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LabelStatusTypeChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImageLogoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure ImageLogoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure ImageLogoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    OldX,
    OldY,
    OldLeft,
    OldTop,
    ScreenDC           : HDC;
    MoveRect           : TRect;
    Moving             : Boolean;
  end;

var
  FormStatus: TFormStatus;

implementation

uses uMain, uCommon;

{$R *.DFM}

procedure TFormStatus.FormCreate(Sender: TObject);
begin
  LabelProgress.Caption:= '';
  LabelStatusType.Caption:= '';
  LabelMessage.Caption:= '';
  ImageLogo.SetupBitmap;
  with ImageLogo.Bitmap.Font do
  begin
    Color:= clWhite;
    Name := 'Tahoma';
    Size := 10;
    Style:= [fsBold];
  end;
  LabelFrontendVersion.Caption:= 'v'+FrontendVersion;
end;

procedure TFormStatus.LabelStatusTypeChanged(Sender: TObject);
begin
  LabelStatusType.Width:= 417;
end;

procedure TFormStatus.FormActivate(Sender: TObject);
begin
  if FormMain.LogoFileName = '' then
     FormMain.LogoFileName:= 'resources\images\logo\logo.jpg';
  ImageLogo.SetupBitmap;
  ImageLogo.Bitmap.Clear;
  case FileExists(FormMain.LogoFileName) of
    True : ImageLogo.Bitmap.LoadFromFile(FormMain.LogoFileName);
    False: ImageLogo.Bitmap.RenderText(10,10, 'File "'+FormMain.LogoFileName+'" not found', 4, $FFFFFFFF);
  end;
  FormStatus.Font.Color:= clWhite;
end;

procedure TFormStatus.FormShow(Sender: TObject);
begin
  if Application.Terminated then
     begin
       PostMessage(Handle, wm_Close, 0, 0);
       Exit;
     end;
  FormStatus.Left:= (Screen.Width shr 1)-(Width shr 1)-1;
  FormStatus.Top:=  (Screen.Height shr 1)-(Height shr 1)-1;
  SetWindowPos(FormStatus.Handle, hWnd_TopMost, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);

  LabelProgress.Hint:= FormMain.GetLanguageText('Audit Games', 'LabelStatusFormat', '%.6d of %.6d');
end;

procedure TFormStatus.ImageLogoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
     begin
       ScreenDC:= GetDC(0);
       OldX:= X;
       OldY:= Y;
       OldLeft:= X;
       OldTop:= Y;
       MoveRect:= BoundsRect;
       DrawFocusRect(ScreenDC, MoveRect);
       Moving:= True;
     end;
end;

procedure TFormStatus.ImageLogoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if Moving then
     begin
       DrawFocusRect(ScreenDC, MoveRect);
       OldX:= X;
       OldY:= Y;
       MoveRect:= Rect(Left+OldX-OldLeft,Top+OldY-OldTop,
                       Left+Width+OldX-OldLeft,Top+Height+OldY-OldTop);
       DrawFocusRect(ScreenDC, MoveRect);
     end;
end;

procedure TFormStatus.ImageLogoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
     begin
       ReleaseCapture;
       DrawFocusRect(ScreenDC, MoveRect);
       Left:= Left+X-OldLeft;
       Top:= Top+Y-OldTop;
       ReleaseDC(0, ScreenDC);
       Moving:= False;
     end;
end;

procedure TFormStatus.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
     FormMain.CancelCurrentOperation:= True;
end;

end.
