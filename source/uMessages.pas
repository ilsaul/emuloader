unit uMessages;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  GR32_Image, GR32_Layers, StdCtrls, ComCtrls;

type
  TFormMessages = class(TForm)
    ImageBackground: TImage32;
    LabelMessageTitle: TLabel;
    ButtonYes: TButton;
    ButtonNoOk: TButton;
    ButtonCancel: TButton;
    LabelMessage: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure LabelMessageTitleChanged(Sender: TObject);
    procedure ButtonYesClick(Sender: TObject);
    procedure ButtonNoOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ImageBackgroundMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure ImageBackgroundMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure ImageBackgroundMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    OldX,
    OldY,
    OldLeft,
    OldTop,
    ScreenDC           : HDC;
    MoveRect           : TRect;
    Moving             : Boolean;
    
    { Private declarations }
  public
    MsgResult: Integer;

    function GetButtonCaption: String;
    { Public declarations }
  end;

var
  FormMessages: TFormMessages;

implementation

uses uMain, uPreferences;

{$R *.DFM}

function TFormMessages.GetButtonCaption: String;
begin
  Result:= FormMain.GetLanguageText('Resource', 'ButtonOk', '&Ok');
end;

procedure TFormMessages.FormCreate(Sender: TObject);
begin
  ImageBackground.SetupBitmap;
  with ImageBackground.Bitmap.Font do
  begin
    Color:= clWhite;
    Name := 'Tahoma';
    Size := 10;
    Style:= [fsBold];
  end;
  case FileExists(FormMain.FrontendPath+'resources\images\MessageBackground.jpg') of
    True : ImageBackground.Bitmap.LoadFromFile(FormMain.FrontendPath+'resources\images\MessageBackground.jpg');
    False: ImageBackground.Bitmap.RenderText(10, 10, 'File "resources\images\MessageBackground.jpg" not found', 4, $FFFFFFFF);
  end;
end;

procedure TFormMessages.LabelMessageTitleChanged(Sender: TObject);
begin
  LabelMessageTitle.Width:= 370;
end;

procedure TFormMessages.ButtonYesClick(Sender: TObject);
begin
  MsgResult:= ButtonYes.ModalResult;
  Close;
end;

procedure TFormMessages.ButtonNoOkClick(Sender: TObject);
begin
  MsgResult:= ButtonNoOk.ModalResult;
  Close;
end;

procedure TFormMessages.ButtonCancelClick(Sender: TObject);
begin
  MsgResult:= ButtonCancel.ModalResult;
  Close;
end;

procedure TFormMessages.ImageBackgroundMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if Moving then
     begin
       DrawFocusRect(ScreenDC,MoveRect);
       OldX:= X;
       OldY:= Y;
       MoveRect:= Rect(Left+OldX-OldLeft,Top+OldY-OldTop,
                       Left+Width+OldX-OldLeft,Top+Height+OldY-OldTop);
       DrawFocusRect(ScreenDC,MoveRect);
     end;
end;

procedure TFormMessages.ImageBackgroundMouseUp(Sender: TObject;
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

procedure TFormMessages.ImageBackgroundMouseDown(Sender: TObject;
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

procedure TFormMessages.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case FormPreferences.HotRod.Checked of
    True:
      begin
        if (Key = 'Z') or (Key = 'z') then
           begin
             case ButtonYes.Visible of
               True : ButtonYes.OnClick(Self);
               False: ButtonNoOk.OnClick(Self);
             end;
           end
        else
        if (Key = 'X') or (Key = 'x') then
           ButtonNoOk.OnClick(Self)
      end;
    False:
      begin
        if Key = #27 then
           ButtonNoOk.OnClick(Self)
        else
        if Key = #13 then
           begin
             case ButtonYes.Visible of
               True : ButtonYes.OnClick(Self);
               False: ButtonNoOk.OnClick(Self);
             end;
           end;
      end;
  end;
end;

procedure TFormMessages.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormMessages);
  FormMain.SetMessagesLanguage;
end;

end.
