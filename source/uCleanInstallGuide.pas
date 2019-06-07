unit uCleanInstallGuide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ShadowLabel, PanelEx, Buttons, AdvOfficeButtons, ShellAPI, uCommon,
  ButtonsEx, ExtCtrls, GraphicEx, GifImage, Dialogs;

type
  TFormCleanInstallGuide = class(TForm)
    ImageAnimatedGIF: TImage;
    LabelQuickSetupGuide: TShadowLabel;
    NightMode: TAdvOfficeCheckBoxEx;
    UseAlternateFrontendIcons: TAdvOfficeCheckBoxEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelOption_SelectArcadeEmulators_FileStatus: TShadowLabel;
    ShadowLabel5: TShadowLabel;
    LabelOption_SelectConsoleComputerGamesFolders_FileStatus: TShadowLabel;
    ShadowLabel6: TShadowLabel;
    Option_SelectArcadeEmulators: TAdvOfficeCheckBoxEx;
    Option_CreateArcadeGamesList: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerEmulators: TAdvOfficeCheckBoxEx;
    Option_SelectConsoleComputerGamesFolders: TAdvOfficeCheckBoxEx;
    Option_CreateConsoleComputerGamesList: TAdvOfficeCheckBoxEx;
    procedure LabelQuickSetupGuideMouseEnter(Sender: TObject);
    procedure LabelQuickSetupGuideMouseLeave(Sender: TObject);
    procedure LabelQuickSetupGuideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NightModeClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IsNightMode_Restore: Boolean;
    gImage: TGIFImage;
    procedure OnWarning(Sender: TObject; Severity: TGIFSeverity; Message: string);
    procedure UpdateOptions;
    procedure LoadAnimGIF;
  public
    { Public declarations }
  end;

var
  FormCleanInstallGuide: TFormCleanInstallGuide;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCleanInstallGuide.OnWarning(Sender: TObject; Severity: TGIFSeverity; Message: string);
const
  SevStr: array[TGIFSeverity] of String = ('Info', 'Warning', 'Error');
var
  Action : Word;
begin
  Action:= MessageDlg(
    'GIF Warning:'+#13+
    'Source:   '+Sender.ClassName+#13+
    'Severity: '+SevStr[Severity]+#13+
    'Message:  '+Message, mtWarning, [mbAbort, mbIgnore, mbAll], 0);
  //if (Action = mrAll) then
  //  // Ignore all further warnings
  //  MenuViewWarnings.Checked := False
  //else
    if (Action <> mrIgnore) then
      // mrAbort (and unknowns) raise exception to abort whatever we where doing
      raise Exception.Create('GIF Aborted');
end;

procedure TFormCleanInstallGuide.UpdateOptions;
var
  DrawOptions: TGIFDrawOptions;
begin
  // Zap old painter
  gImage.StopDraw;

  // Default paint options
  DrawOptions:= [goLoop, goAnimate, goTransparent, goLoopContinously, goAsync]; // Loop animations

  gImage.DrawOptions:= DrawOptions; // Set new options
  ImageAnimatedGIF.Invalidate; // Force redraw
end;

procedure TFormCleanInstallGuide.LoadAnimGIF;
var
  iFile: String;
begin
  iFile:= FormMain.GetFolderFull(35)+'clean_install.gif';
  if not FileExists(iFile) then
     Exit;

  gImage.LoadFromFile(iFile);
  UpdateOptions;
end;

procedure TFormCleanInstallGuide.FormCreate(Sender: TObject);
begin
  IsNightMode_Restore:= IsNightMode;
  NightMode.Checked:= IsNightMode;
  UseAlternateFrontendIcons.Checked:= FormMain.MenuUseAlternateFrontendIcons.Checked;
  FormMain.SetButtonExColors(ButtonOk);
  FormMain.SetButtonExColors(ButtonCancel);

  Include(GIFImageDefaultDrawOptions, goDirectDraw);
  gImage:= TGIFImage.Create;
  try
    // Make the preview TImage contain a TGIFImage
    ImageAnimatedGIF.Picture.Graphic:= gImage;
  finally
    gImage.Free;
  end;

  gImage:= (ImageAnimatedGIF.Picture.Graphic as TGIFImage); // (ImagePreviewAnimate.Picture.Graphic as TGIFImage);

  // Set event handlers
  //gImage.OnPaint := OnAnimate;
  //gImage.OnEndPaint := OnAnimate;
  //gImage.OnProgress := OnProgress;
  gImage.OnWarning:= OnWarning;
  gImage.DrawBackgroundColor:= clFuchsia;

  // Open file specified on command line if any
  //if (ParamCount > 0) then
  //  DoOpenFile(ParamStr(1))
  //else
  //  DoCloseFile;
end;

procedure TFormCleanInstallGuide.FormShow(Sender: TObject);
begin
  //FormCleanInstallGuide.DoubleBuffered:= True;
  LoadAnimGIF;
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseEnter(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= clLime;
  TShadowLabel(Sender).ShadowColor:= clGreen;
  TShadowLabel(Sender).Font.Style:= [fsUnderline];
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideMouseLeave(Sender: TObject);
begin
  TShadowLabel(Sender).Font.Color:= $00c2ffc2;
  TShadowLabel(Sender).ShadowColor:= $00003d00;
  TShadowLabel(Sender).Font.Style:= [];
end;

procedure TFormCleanInstallGuide.LabelQuickSetupGuideClick(Sender: TObject);
begin
  case FileExists(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt') of
    True : CallShellExecute(nil, FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'); // ShellExecute(Handle, 'open', PChar(FormMain.FrontendPath+'docs\el-quick-setup-quide.txt'), nil, nil, SW_SHOWNORMAL);
    False: GenerateMessage('Error', 'File access error.',
                                    'File "'+FormMain.FrontendPath+'docs\el-quick-setup-quide.txt " was not found. ', 2, False, 1);
  end;
end;

procedure TFormCleanInstallGuide.NightModeClick(Sender: TObject);
begin
  IsNightMode:= NightMode.Checked;
  FormMain.SetButtonExColors(ButtonOk);
  FormMain.SetButtonExColors(ButtonCancel);
end;

procedure TFormCleanInstallGuide.ButtonCancelClick(Sender: TObject);
begin
  IsNightMode:= IsNightMode_Restore;
end;

procedure TFormCleanInstallGuide.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     begin
       gImage.StopDraw;
       gImage:= nil;
     end;
end;


end.
