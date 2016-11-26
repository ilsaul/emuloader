unit uSelectDirectory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ShellCtrls, ExtCtrls, uxTheme,
  ShadowLabel, Buttons, AdvOfficeButtons, PanelEx;//, ShellAPI, ShlObj;

type
  TFormSelectDirectory = class(TForm)
    ShellTree: TShellTreeView;
    PanelTop: TPanelEx;
    LabelTitle: TShadowLabel;
    MessageIcon: TImage;
    PanelButtons: TPanelEx;
    AddSubFolders: TAdvOfficeCheckBox;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    LabelSelectedPath: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ShellTreeChange(Sender: TObject; Node: TTreeNode);
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

end.
