unit uCleanInstallGuide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, Buttons, AdvOfficeButtons, ShellAPI, uCommon,
  ButtonsEx, ExtCtrls, GraphicEx, GR32_Image, GR32_Layers;

type
  TFormCleanInstallGuide = class(TForm)
    ImageCleanInstall: TImage32;
    LabelQuickSetupGuide: TShadowLabel;
    LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel;
    LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel;
    Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx;
    Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx;
    Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx;
    NightMode: TAdvOfficeCheckBoxEx;
    UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx;
    ButtonSkip: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    UltraHD_4KModeDisable: TAdvOfficeCheckBoxEx;
    procedure LabelQuickSetupGuideMouseEnter(Sender: TObject);
    procedure LabelQuickSetupGuideMouseLeave(Sender: TObject);
    procedure LabelQuickSetupGuideClick(Sender: TObject);
    procedure NightModeClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure UltraHD_4KModeDisableClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImageCleanInstallMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);//;
      //Layer: TCustomLayer);
  private
    { Private declarations }
    IsNightMode_Restore, Is4KMode_Restore: Boolean;
    procedure SetNightMode;
    procedure Resize4K;
  protected
    procedure CreateParams(var Params: TCreateParams);
  public
    { Public declarations }
  end;

var
  FormCleanInstallGuide: TFormCleanInstallGuide;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCleanInstallGuide.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style:= Params.Style or WS_POPUP; // to prevent FormStatus on top of other applications
  //Params.WndParent:= Application.MainForm.Handle;
  //Params.ExStyle:= Params.ExStyle or WS_EX_APPWINDOW;

  ////Params.WndParent := 0; // what is this ?
end;

procedure TFormCleanInstallGuide.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormCleanInstallGuide do
  begin
    ClientWidth:=  1265;
    ClientHeight:= 1000;
    Font.Size:= 16;
    ImageCleanInstall.Width:=  ClientWidth;
    ImageCleanInstall.Height:= ClientHeight;
    FormMain.Set4KLabelSpecs(LabelOption_SelectArcadeEmulators_FileStatus,             690, 386, -1, -1, 18);
    FormMain.Set4KLabelSpecs(LabelOption_SelectConsoleComputerGamesFolders_FileStatus, 690, 559, -1, -1, 18);
    LabelQuickSetupGuide.Hint:= LabelQuickSetupGuide.Caption;
    LabelQuickSetupGuide.Caption:= '';
    LabelQuickSetupGuide.Font.Color:= clLime;
    FormMain.Set4KLabelSpecs(LabelQuickSetupGuide, 315, 755, 640, 25, 18);

    FormMain.Set4KCheckBoxSpecs(Option_SelectArcadeEmulators,             18, 379, 655,  36, 18);
    FormMain.Set4KCheckBoxSpecs(Option_CreateArcadeGamesList,             18, 437, 530,  36, 18);
    FormMain.Set4KCheckBoxSpecs(Option_SelectConsoleComputerEmulators,    18, 495, 1190, 36, 18);
    FormMain.Set4KCheckBoxSpecs(Option_SelectConsoleComputerGamesFolders, 18, 552, 640,  36, 18);
    FormMain.Set4KCheckBoxSpecs(Option_CreateConsoleComputerGamesList,    18, 610, 610,  36, 18);

    FormMain.Set4KCheckBoxSpecs(NightMode,      18, 859, 215, 36, 18);
    FormMain.Set4KCheckBoxSpecs(UseAlternateFrontendIcons, 18, 907, 440, 36, 18);
    FormMain.Set4KCheckBoxSpecs(UltraHD_4KModeDisable, 18, 955, 295, 36, 18);
    //UltraHD_4KModeDisable.Visible:= True;

    FormMain.Set4KButtonSpecs(ButtonCancel, ImageCleanInstall.Width-168-17, 941, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonOk,     ButtonCancel.Left-168-18,       941, 168, 45, 16);
    FormMain.Set4KButtonSpecs(ButtonSkip,   ButtonOk.Left-168-18,           941, 168, 45, 16);
  end;
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseEnter(Sender: TObject);
begin
  if Is4KMode then
     TShadowLabel(Sender).Caption:= TShadowLabel(Sender).Hint
  else
     begin
       TShadowLabel(Sender).Font.Color:= clLime;
       TShadowLabel(Sender).ShadowColor:= clGreen;
       TShadowLabel(Sender).Font.Style:= [fsUnderline];
     end;
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseLeave(Sender: TObject);
begin
  if Is4KMode then
     TShadowLabel(Sender).Caption:= ''
  else
     begin
       TShadowLabel(Sender).Font.Color:= $00c2ffc2;
       TShadowLabel(Sender).ShadowColor:= $00003d00;
       TShadowLabel(Sender).Font.Style:= [];
     end;
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideClick(Sender: TObject);
var
  iFile: WideString;
begin
  iFile:= FrontendPath+'docs\el-quick-setup-quide.txt';
  case FileExists2(iFile) of
    True : CallShellExecute(nil, iFile);
    False: FormMain.ShowMessageBox('Error', 'File access error.',
                                   'File "'+FrontendPath+'docs\el-quick-setup-quide.txt" was not found. ', 2, False, 1);
  end;
end;

procedure TFormCleanInstallGuide.SetNightMode;
begin
  UseAlternateFrontendIcons.Checked:= FormMain.MenuUseAlternateFrontendIcons.Checked;
  FormMain.SetButtonExColors(ButtonOk);
  FormMain.SetButtonExColors(ButtonCancel);
  FormMain.SetButtonExColors(ButtonSkip);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectArcadeEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateArcadeGamesList);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerEmulators);
  FormMain.SetCheckBoxExCustomIcon(Option_SelectConsoleComputerGamesFolders);
  FormMain.SetCheckBoxExCustomIcon(Option_CreateConsoleComputerGamesList);
  FormMain.SetCheckBoxExCustomIcon(NightMode);
  FormMain.SetCheckBoxExCustomIcon(UltraHD_4KModeDisable);
  FormMain.SetCheckBoxExCustomIcon(UseAlternateFrontendIcons);
end;

procedure TFormCleanInstallGuide.NightModeClick(Sender: TObject);
begin
  if NightMode.Tag = 1 then
     Exit;

  IsNightMode:= NightMode.Checked;
  SetNightMode;
end;

procedure TFormCleanInstallGuide.ButtonCancelClick(Sender: TObject);
begin
  IsNightMode:= IsNightMode_Restore;
  Is4KMode:= Is4KMode_Restore;
end;

procedure TFormCleanInstallGuide.UltraHD_4KModeDisableClick(Sender: TObject);
begin
  if UltraHD_4KModeDisable.Tag = 0 then
     Is4KMode:= not UltraHD_4KModeDisable.Checked;
end;

procedure TFormCleanInstallGuide.FormShow(Sender: TObject);
var
  iFile: String;
begin
  Resize4K;
  if Is4KMode then
     iFile:= 'clean_install-4K.png'
  else
     iFile:= 'clean_install.png';

  if FileExists(FormMain.GetFolderFull(35)+iFile) then
     ImageCleanInstall.Bitmap.LoadFromFile(FormMain.GetFolderFull(35)+iFile);

  IsNightMode_Restore:= IsNightMode; // used to restore last state on Cancel button click
  Is4KMode_Restore:= Is4KMode;
  if IsNightMode then
     SetNightMode
  else
     begin
       NightMode.Tag:= 1;
       if NightMode.Checked <> IsNightMode then
          NightMode.Checked:= IsNightMode;
       NightMode.Tag:= 0;
     end;

  UltraHD_4KModeDisable.Tag:= 1;
  if UltraHD_4KModeDisable.Checked <> (not Is4KMode) then
     UltraHD_4KModeDisable.Checked:=  not Is4KMode;
  UltraHD_4KModeDisable.Tag:= 0;
end;


procedure TFormCleanInstallGuide.ImageCleanInstallMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  FormCleanInstallGuide.Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
