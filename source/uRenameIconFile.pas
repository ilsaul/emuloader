unit uRenameIconFile;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, PanelEx, Buttons;

type
  TFormRenameIconFile = class(TForm)
    PanelEx3: TPanelEx;
    Icon: TImage;
    NewFilename: TEdit;
    ButtonOk: TBitBtn;
    ButtonAbort: TBitBtn;
    procedure NewFilenameKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonAbortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mmResult: Integer;
    OldFileName: String;
  end;

var
  FormRenameIconFile: TFormRenameIconFile;

implementation

{$R *.dfm}

procedure TFormRenameIconFile.NewFilenameKeyPress(Sender: TObject;
  var Key: Char);
var
  NewValue: String;
begin
  if Key in ['/', '*', '?', '<', '>', '|', ':', ';'] then
     begin
       Key:= Char(0);
       Exit;
     end;
  case Key of
    #13: ButtonOk.Click;
    #27: ButtonAbort.Click;
  end;
end;

procedure TFormRenameIconFile.ButtonOkClick(Sender: TObject);
var
  NewValue: String;
begin
  NewValue:= Trim(NewFileName.Text);
  if (NewValue <> '') and
     (not SameText(NewValue, OldFileName)) and
     (NewValue <> '.') then
     begin
       mmResult:= mrOk;
       Close;
     end;
end;

procedure TFormRenameIconFile.ButtonAbortClick(Sender: TObject);
begin
  mmResult:= mrCancel;
  Close;
end;

end.
