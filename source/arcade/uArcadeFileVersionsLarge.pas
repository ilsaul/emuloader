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
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormArcadeFileVersionsLarge: TFormArcadeFileVersionsLarge;

implementation

uses uMain, uCommon;

{$R *.dfm}

procedure TFormArcadeFileVersionsLarge.Resize4K;

  procedure MoveControls(iPanel: TPanelEx; iLeft, iTop: Integer; iSystemIcon: TImage;
                         iLabelSystemTitle, iLabelEmuFileName, iLabelVersionInfo: TShadowLabel);
  begin
    FormMain.Set4KPanelSpecs(iPanel, iLeft, iTop, 750, 144);
    FormMain.Set4KImageIconSpecs(iSystemIcon, -1, 8, 8);
    FormMain.Set4KLabelSpecs(iLabelSystemTitle, 144,  5, 595, 30, 18);
    FormMain.Set4KLabelSpecs(iLabelEmuFileName, 144, 35, 595, 55, 16);
    FormMain.Set4KLabelFontNameSpecs(iLabelEmuFileName, FormMain.Get4KSystemFont);
    FormMain.Set4KLabelSpecs(iLabelVersionInfo, 144, 90, 595, 47, 14);
  end;

begin
  if not Is4KMode then
     Exit;
  with FormArcadeFileVersionsLarge do
  begin
    MoveControls(Panel1, 8, 8,                          Image1, LabelSystemTitle1, LabelEmuFileName1, LabelVersionInfo1);
    MoveControls(Panel2, 8, Panel1.Top+Panel1.Height+4, Image2, LabelSystemTitle2, LabelEmuFileName2, LabelVersionInfo2);
    MoveControls(Panel3, 8, Panel2.Top+Panel2.Height+4, Image3, LabelSystemTitle3, LabelEmuFileName3, LabelVersionInfo3);
    MoveControls(Panel4, 8, Panel3.Top+Panel3.Height+4, Image4, LabelSystemTitle4, LabelEmuFileName4, LabelVersionInfo4);

    MoveControls(Panel5, Panel1.Left+Panel1.Width, 8,   Image5, LabelSystemTitle5, LabelEmuFileName5, LabelVersionInfo5);
    MoveControls(Panel6, Panel5.Left, Panel2.Top,       Image6, LabelSystemTitle6, LabelEmuFileName6, LabelVersionInfo6);
    MoveControls(Panel7, Panel5.Left, Panel3.Top,       Image7, LabelSystemTitle7, LabelEmuFileName7, LabelVersionInfo7);
    MoveControls(Panel8, Panel5.Left, Panel4.Top,       Image8, LabelSystemTitle8, LabelEmuFileName8, LabelVersionInfo8);

    ClientWidth:=  (Panel1.Width *2)+   16;
    ClientHeight:= (Panel1.Height*4)+12+16;
  end;
end;

procedure TFormArcadeFileVersionsLarge.AddSystems;
var
  VersionStringEmu, VersionStringGames, cName, IndexStr: String;
  Loop, iPos, PanelIndex, sysCount: Integer;
  iControl: TComponent;

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
  if IsNightMode then
     FormArcadeFileVersionsLarge.Color:= menu_background_color[1];

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
      iControl:= FindComponent(cName);
      TPanelEx(iControl as TPanelEx).Visible:= True;
      if IsNightMode then
         TPanelEx(iControl as TPanelEx).Color1:= menu_background_color[1];

      //cName:= 'Image'+IndexStr;
      FormMain.LoadSystemIcon(Loop, FindComponent('Image'+IndexStr{cName}) as TImage, False);

      cName:= 'LabelSystemTitle'+IndexStr;
      iControl:= FindComponent(cName);
      TShadowLabel(iControl as TShadowLabel).Caption:= FormMain.GetArcadeEmulatorDescription(Loop);
      if IsNightMode then
         SetLabelColors(TShadowLabel(iControl as TShadowLabel), clrOrangeBarTop, clrMedDarkGray);

      cName:= 'LabelEmuFileName'+IndexStr;
      iControl:= FindComponent(cName);
      TShadowLabel(iControl as TShadowLabel).Caption:= FormMain.EmulatorFile[Loop];
      if IsNightMode then
         SetLabelColors(TShadowLabel(iControl as TShadowLabel), clGray, clrMedDarkGray);

      cName:= 'LabelVersionInfo'+IndexStr;
      iControl:= FindComponent(cName);
      TShadowLabel(iControl as TShadowLabel).Caption:= 'Emulator   : '+VersionStringEmu+#13#10+
                                                       'Games List: '+VersionStringGames;
      if IsNightMode then
         SetLabelColors(TShadowLabel(iControl as TShadowLabel), item_caption_active_color[1], item_caption_active_shadow_color[1]);

      Inc(PanelIndex);
      Inc(sysCount);
    end;
  end;
  if Is4KMode then
     iPos:= 16
  else
     iPos:= 0;
  case sysCount of
    1: FormArcadeFileVersionsLarge.ClientHeight:= Panel1.Height+iPos;
    2: FormArcadeFileVersionsLarge.ClientHeight:= (Panel1.Height*2)+4+iPos;
    3: FormArcadeFileVersionsLarge.ClientHeight:= (Panel1.Height*3)+8+iPos;
  end;
  if sysCount < 5 then
     FormArcadeFileVersionsLarge.ClientWidth:= Panel1.Width+iPos;
end;

procedure TFormArcadeFileVersionsLarge.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13, #27] then
     Close;
end;

procedure TFormArcadeFileVersionsLarge.FormShow(Sender: TObject);
begin
  Resize4K;
  AddSystems;
end;


end.
