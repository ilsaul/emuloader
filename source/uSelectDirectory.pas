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
    BottomBar: TPanelEx;
    AddSubFolders: TAdvOfficeCheckBoxEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    LabelSelectedPath: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ShellTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure ShellTreeGetImageIndex(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectDirectory: TFormSelectDirectory;

implementation

uses uCommon, uMain;

{$R *.dfm}

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
  //ShellTree.Selected.MakeVisible;
  if Screen.Cursor <> crDefault then
     Screen.Cursor:= crDefault;
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
  if IsNightMode then
     begin
       SetFormColors(FormSelectDirectory, TopBar, BottomBar, LabelTitle, nil, nil, -1, IsNightMode);
       SetLabelColors(LabelSelectedPath, clSilver, item_caption_active_shadow_color[1]);
       SetCheckBoxColors(AddSubFolders, item_caption_active_color[1], item_caption_active_shadow_color[1]);
       FormMain.SetCheckBoxExCustomIcon(AddSubFolders);
       ShellTree.Color:= FormSelectDirectory.Color;
       ShellTree.Font.Color:= clCream;

       FormMain.SetWin10DarkScrollBar(ShellTree);
     end;
end;

procedure TFormSelectDirectory.ShellTreeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.Selected then
     FormSelectDirectory.Caption:= 'image index: '+IntToStr(Node.ImageIndex);
end;

end.
