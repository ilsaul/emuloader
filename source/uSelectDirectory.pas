unit uSelectDirectory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ShellCtrls, ExtCtrls, uxTheme,
  ShadowLabel, Buttons, AdvOfficeButtons, PanelEx, ButtonsEx;

type
  TFormSelectDirectory = class(TForm)
    ShellTree: TShellTreeView;
    TopBar: TPanelEx;
    LabelTitle: TShadowLabel;
    MessageIcon: TImage;
    PanelBottom: TPanelEx;
    AddSubFolders: TAdvOfficeCheckBoxEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSelectedPath: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ShellTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Resize4K;
  public
    { Public declarations }
  end;

var
  FormSelectDirectory: TFormSelectDirectory;

implementation

uses uCommon, uMain;

{$R *.dfm}

procedure TFormSelectDirectory.Resize4K;
begin
  if not Is4KMode then
     Exit;

  with FormSelectDirectory do
  begin
    ClientWidth:= 1200;
    ClientHeight:= 900;
    Font.Size:= 16;
    Color:= clWhite;
    PanelBottom.Height:= 100;
    FormMain.Set4KCheckBoxSpecs(AddSubFolders, 10, 52, 220, 36, 16);
    FormMain.Set4KButtonsOkCancelPanel(PanelBottom, ButtonOk, ButtonCancel, False);
    ButtonOk.Top:= 45;
    ButtonCancel.Top:= 45;
    FormMain.Set4KLabelSpecs(LabelSelectedPath, 10, 5, 1175, 25, 16);

    TopBar.Height:= 90;
    FormMain.Set4KImageIconSpecs(MessageIcon, 68, 10, 10);
    FormMain.Set4KLabelSpecs(LabelTitle, 86, 15, 1100, 59, 16);

    ShellTree.Align:= alNone;
    ShellTree.Left:= 10;
    ShellTree.Top:=  90;
    ShellTree.Width:= 1180;
    ShellTree.Height:= 700;
  end;
end;

procedure TFormSelectDirectory.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     MessageIcon.Picture:= nil;
end;

procedure TFormSelectDirectory.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;
  FormMain.IL_MiscToolBarPopup.GetIcon(7, MessageIcon.Picture.Icon);
  ShellTree.Items.BeginUpdate;
  SetWindowTheme(ShellTree.Handle, 'explorer', nil);
  ShellTree.ShowRoot:= True;
  //ShellTree.Path:= 'd:\EmuLoader\snap';
  ShellTree.Items.EndUpdate;
  if IsNightMode then
     FormMain.SetWin10DarkScrollBar(ShellTree); // must be here to fix selection colors and scroll bar (September 25, 2020)
  //ShellTree.Selected.MakeVisible;
  if Screen.Cursor <> crDefault then
     Screen.Cursor:=  crDefault;
  Tag:= 1;
end;

procedure TFormSelectDirectory.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13:
      begin
        Key:= #0;
        ButtonOk.Click;
      end;
    #27:
      begin
        Key:= #0;
        ButtonCancel.Click;
      end;
  end;
end;

procedure TFormSelectDirectory.ShellTreeChange(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.Selected then
     LabelSelectedPath.Caption:= ShellTree.SelectedFolder.PathName
  else
     LabelSelectedPath.Caption:= '';
end;

procedure TFormSelectDirectory.FormShow(Sender: TObject);
begin
  Resize4K;
  if IsNightMode then
     begin
       SetFormColors(FormSelectDirectory, TopBar, PanelBottom, LabelTitle, nil, nil, -1, IsNightMode);
       SetLabelColors(LabelSelectedPath, clSilver, item_caption_active_shadow_color[1]);
       SetCheckBoxColors(AddSubFolders, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(AddSubFolders);
       ShellTree.Color:= FormSelectDirectory.Color;
       ShellTree.Font.Color:= clCream;
       FormMain.SetButtonExColors(ButtonOk);
       FormMain.SetButtonExColors(ButtonCancel);
     end;
end;

end.
