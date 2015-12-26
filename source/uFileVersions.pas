unit uFileVersions;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, StdCtrls, ExtCtrls, MPCommonObjects, EasyListview;

type
  TFormFileVersions = class(TForm)
    Systems: TEasyListview;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SystemsItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
  private
    { Private declarations }
    procedure AddSystems;
  public
    { Public declarations }
  end;
  
var
  FormFileVersions: TFormFileVersions;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormFileVersions.AddSystems;
var
  Item: TEasyItem;

  function GetGamesListVersion(sysID: Byte): String;
  var
    tmpFile: TMemIniFile;
  begin
    Result:= '';
    if not FileExists(FormMain.GetGamesFolderEL+GetSystemFileName(sysID)) then
       Exit;

    tmpFile:= TMemIniFile.Create(FormMain.GetGamesFolderEL+GetSystemFileName(sysID));
    Result:= tmpFile.ReadString('info_file', 'version', '');
    FreeAndNil(tmpFile);
  end;

begin
  FormMain.ELV_PopulateSystems(Systems, False, False, 1);
  Systems.BeginUpdate;
  Item:= Systems.Groups.FirstItem;
  repeat
    Item.Captions[1]:= ' '+FormMain.EmulatorFile[Item.ImageIndex];
    Item.Captions[2]:= 'Emulator    : '+FormMain.EmulatorVersion[Item.ImageIndex];
    Item.Captions[3]:= 'Games List: '+GetGamesListVersion(Item.ImageIndex);
    Item.Details[1]:= 1;
    Item.Details[2]:= 2;
    Item.Details[3]:= 3;
    Item:= Systems.Groups.NextItem(Item);
  until Item = nil;
  Systems.EndUpdate(False);
end;

procedure TFormFileVersions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormFileVersions.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(Systems);  
  AddSystems;
  if Screen.Height = 480 then
     begin
       FormFileVersions.ClientHeight:= 396;
       FormFileVersions.ClientWidth:= FormFileVersions.ClientWidth+GetSystemMetrics(SM_CXVSCROLL);//17;
     end;
end;

procedure TFormFileVersions.SystemsItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  case Position of
    0:
      begin
        ACanvas.Font.Name:= 'Trebuchet MS';
        ACanvas.Font.Size:= 10;
        ACanvas.Font.Color:= clMaroon;
        ACanvas.Font.Style:= [fsBold, fsItalic];
      end;
    1:
      begin
        ACanvas.Font.Name:= 'Segoe UI';
        ACanvas.Font.Size:= 8;
        ACanvas.Font.Color:= clGray;
      end;
  end;
end;

end.
