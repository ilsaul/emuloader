unit uControllerKeysLayout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ShadowLabel;

type
  TFormControllerKeysLayout = class(TForm)
    ControllerImage: TImage;
    FrameBottom: TBevel;
    LabelWarning: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ControllerImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure LoadCtrlImg;
    procedure SelectPrevLayout;
    procedure SelectNextLayout;
  public
    { Public declarations }
  end;

var
  FormControllerKeysLayout: TFormControllerKeysLayout;

implementation

uses uMain;

{$R *.dfm}

procedure TFormControllerKeysLayout.LoadCtrlImg;
var
  ImageFile: String;
begin
  FormControllerKeysLayout.Caption:= 'Keys Layout';
  case FormControllerKeysLayout.Tag of
    0:
      begin
        ImageFile:= 'DevastatorII.jpg';
        FormControllerKeysLayout.Caption:= FormControllerKeysLayout.Caption+' [Devastator II]';
      end;
    1:
      begin
        ImageFile:= 'HotRodSE.jpg';
        FormControllerKeysLayout.Caption:= FormControllerKeysLayout.Caption+' [Hot Rod SE]';
      end;
    2:
      begin
        ImageFile:= 'SlikStik.jpg';
        FormControllerKeysLayout.Caption:= FormControllerKeysLayout.Caption+' [SlikStik]';
      end;
    3:
      begin
        ImageFile:= 'X-Arcade.jpg';
        FormControllerKeysLayout.Caption:= FormControllerKeysLayout.Caption+' [X-Arcade]';
      end;
    else
      begin
        ImageFile:= 'X-Arcade.jpg';
        FormControllerKeysLayout.Caption:= FormControllerKeysLayout.Caption+' [X-Arcade]';
      end;
  end;
  case FileExists(FormMain.GetFolderFull(35)+ImageFile) of
    True : ControllerImage.Picture.LoadFromFile(FormMain.GetFolderFull(35)+ImageFile);
    False: ControllerImage.Picture:= nil;
  end;
end;

procedure TFormControllerKeysLayout.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['S', 's', 'Q', 'q', #27, #13] then
     Close;
end;

procedure TFormControllerKeysLayout.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     ControllerImage.Picture:= nil;
end;

procedure TFormControllerKeysLayout.FormShow(Sender: TObject);
begin
  LoadCtrlImg;
  SetFocus;
end;

procedure TFormControllerKeysLayout.SelectPrevLayout;
begin
  FormControllerKeysLayout.Tag:= FormControllerKeysLayout.Tag-1;
  if FormControllerKeysLayout.Tag = -1 then
     FormControllerKeysLayout.Tag:= 3;
  LoadCtrlImg;
end;

procedure TFormControllerKeysLayout.SelectNextLayout;
begin
  FormControllerKeysLayout.Tag:= FormControllerKeysLayout.Tag+1;
  if FormControllerKeysLayout.Tag = 4 then
     FormControllerKeysLayout.Tag:= 0;
  LoadCtrlImg;
end;

procedure TFormControllerKeysLayout.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_LEFT: SelectPrevLayout;
    VK_RIGHT: SelectNextLayout;
  end;
end;

procedure TFormControllerKeysLayout.ControllerImageMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  case Button of
    mbLeft : SelectNextLayout;
    mbRight: SelectPrevLayout;
  end;
end;

end.
