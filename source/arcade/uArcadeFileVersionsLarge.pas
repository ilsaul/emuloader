unit uArcadeFileVersionsLarge;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, StdCtrls, ExtCtrls, ImgList, ShadowLabel, PanelEx;

type
  TFormArcadeFileVersionsLarge = class(TForm)
    Panel1: TPanelEx;
    Image1: TImage;
    LabelSystemTitle1: TShadowLabel;
    LabelEmuFileName1: TShadowLabel;
    LabelVersionInfo1: TShadowLabel;
    Panel2: TPanelEx;
    Image2: TImage;
    LabelSystemTitle2: TShadowLabel;
    LabelEmuFileName2: TShadowLabel;
    LabelVersionInfo2: TShadowLabel;
    Panel3: TPanelEx;
    Image3: TImage;
    LabelSystemTitle3: TShadowLabel;
    LabelEmuFileName3: TShadowLabel;
    LabelVersionInfo3: TShadowLabel;
    Panel4: TPanelEx;
    Image4: TImage;
    LabelSystemTitle4: TShadowLabel;
    LabelEmuFileName4: TShadowLabel;
    LabelVersionInfo4: TShadowLabel;
    Panel6: TPanelEx;
    Image6: TImage;
    LabelSystemTitle6: TShadowLabel;
    LabelEmuFileName6: TShadowLabel;
    LabelVersionInfo6: TShadowLabel;
    Panel5: TPanelEx;
    Image5: TImage;
    LabelSystemTitle5: TShadowLabel;
    LabelEmuFileName5: TShadowLabel;
    LabelVersionInfo5: TShadowLabel;
    Panel8: TPanelEx;
    Image8: TImage;
    LabelSystemTitle8: TShadowLabel;
    LabelEmuFileName8: TShadowLabel;
    LabelVersionInfo8: TShadowLabel;
    Panel7: TPanelEx;
    Image7: TImage;
    LabelSystemTitle7: TShadowLabel;
    LabelEmuFileName7: TShadowLabel;
    LabelVersionInfo7: TShadowLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AddSystems;
  public
    { Public declarations }
  end;
  
var
  FormArcadeFileVersionsLarge: TFormArcadeFileVersionsLarge;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormArcadeFileVersionsLarge.AddSystems;
var
  VersionStringEmu, VersionStringGames, cName, IndexStr: String;
  Loop, iPos, PanelIndex, sysCount: Integer;

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
  PanelIndex:= 1;
  sysCount:= 0;
  for Loop:=1 to MaxArcadeSystems do
  begin
    if FormMain.ValidateArcadeEmulatorFile(Loop) and FormMain.IsSystemAvailable(Loop) then
    begin
      IndexStr:= IntToStr(PanelIndex);
      VersionStringEmu:= FormMain.EmulatorVersion[Loop];
      iPos:= PosEx(' v', VersionStringEmu);
      if iPos <> 0 then
         Delete(VersionStringEmu, 1, iPos);

      VersionStringGames:= GetGamesListVersion(Loop);
      iPos:= PosEx(' v', VersionStringGames);
      if iPos <> 0 then
         Delete(VersionStringGames, 1, iPos);
      
      cName:= 'Panel'+IndexStr;
      TPanelEx(FindComponent(cName) as TPanelEx).Visible:= True;

      cName:= 'Image'+IndexStr;
      FormMain.LoadIconIntoImage(FormMain.GetArcadeSystemIconFileName(Loop), FindComponent(cName) as TImage);

      cName:= 'LabelSystemTitle'+IndexStr;
      TShadowLabel(FindComponent(cName) as TShadowLabel).Caption:= FormMain.GetArcadeEmulatorDescription(Loop);

      cName:= 'LabelEmuFileName'+IndexStr;
      TShadowLabel(FindComponent(cName) as TShadowLabel).Caption:= FormMain.EmulatorFile[Loop];

      cName:= 'LabelVersionInfo'+IndexStr;
      TShadowLabel(FindComponent(cName) as TShadowLabel).Caption:= 'Emulator   : '+VersionStringEmu+#13#10+
                                    'Games List: '+VersionStringGames;

      Inc(PanelIndex);
      Inc(sysCount);
    end;
  end;
  case sysCount of
    1: FormArcadeFileVersionsLarge.ClientHeight:= Panel1.Height;
    2: FormArcadeFileVersionsLarge.ClientHeight:= Panel1.Height*2;
    3: FormArcadeFileVersionsLarge.ClientHeight:= Panel1.Height*3;
  end;
  if sysCount < 5 then
     FormArcadeFileVersionsLarge.ClientWidth:= Panel1.Width;
end;

procedure TFormArcadeFileVersionsLarge.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormArcadeFileVersionsLarge.FormShow(Sender: TObject);
begin
  AddSystems;
end;

end.
