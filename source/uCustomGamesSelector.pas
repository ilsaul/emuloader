unit uCustomGamesSelector;

interface

uses
  Windows, Classes, Controls, Forms, ComCtrls;

type
  TFormCustomGameSelector = class(TForm)
    CustomList: TListView;
    procedure CustomListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CustomListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCustomGameSelector: TFormCustomGameSelector;

implementation

uses uCustomGames;

{$R *.dfm}

procedure TFormCustomGameSelector.CustomListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: CustomList.OnDblClick(Self);
    VK_ESCAPE: FormCustomGames.CopyGameIndex:= -1;
  end;
end;

procedure TFormCustomGameSelector.CustomListDblClick(Sender: TObject);
begin
  FormCustomGames.CopyGameIndex:= CustomList.Selected.Index;
  Close;
end;

procedure TFormCustomGameSelector.FormShow(Sender: TObject);
var
  Loop: Integer;
begin
  Screen.Cursor:= crHourGlass;
  Font:= FormCustomGames.Font;
  CustomList.Column[0].Caption:= FormCustomGames.ListCustomGames.Columns[0].Caption;
  CustomList.Column[1].Caption:= FormCustomGames.ListCustomGames.Columns[13].Caption;
  CustomList.Items.BeginUpdate;
  for Loop:=0 to FormCustomGames.ListCustomGames.Items.Count-1 do
  begin
    with CustomList.Items.Add do
    begin
      Caption:= FormCustomGames.ListCustomGames.Items[Loop].Caption;
      SubItems.Add(FormCustomGames.ListCustomGames.Items[Loop].SubItems[0]);
    end;
  end;
  CustomList.Items.EndUpdate;
  Screen.Cursor:= crDefault;
end;

procedure TFormCustomGameSelector.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CustomList.Items.BeginUpdate;
  CustomList.Items.Clear;
  CustomList.Items.EndUpdate;
end;

end.
