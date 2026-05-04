unit uFavoritesManagerCleanseProfile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, MPCommonObjects, MPCommonUtilities,
  EasyListview, ImgList, PanelEx, ShadowLabel, ButtonsEx;

type
  TFormFavoritesManagerCleanseProfile = class(TForm)
    FavoritesCleanseList: TEasyListview;
    PanelBottom: TPanelEx;
    ButtonAbort: TBitBtnEx;
    ButtonConfirm: TBitBtnEx;
    ButtonRemoveSelected: TBitBtnEx;
    LabelTopMessage: TShadowLabel;
    LabelTotal: TShadowLabel;
    function FavoritesCleanseListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure FavoritesCleanseListKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FavoritesCleanseListColumnClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; ShiftState: TShiftState;
      const Column: TEasyColumn);
    procedure ButtonRemoveSelectedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateTotalLabel;
  public
    { Public declarations }
  end;

var
  FormFavoritesManagerCleanseProfile: TFormFavoritesManagerCleanseProfile;

implementation

uses uFavoritesManager, uMain;

{$R *.dfm}

procedure TFormFavoritesManagerCleanseProfile.UpdateTotalLabel;
begin
  LabelTotal.Caption:= 'Total: '+IntToStr(FavoritesCleanseList.Groups.ItemCount)+' of '+IntToStr(LabelTotal.Tag);
end;

function TFormFavoritesManagerCleanseProfile.FavoritesCleanseListItemCompare(
  Sender: TCustomEasyListview; Column: TEasyColumn; Group: TEasyGroup;
  Item1, Item2: TEasyItem; var DoDefault: Boolean): Integer;
var
  gItem1, gItem2: TEasyItem;
begin
  DoDefault:= False;
  FormMain.ELV_GetSortDirection(Column, Item1, Item2, gItem1, gItem2);
  case Column.Index of
    0: Result:= FormMain.iCompare(uFavoritesManager.TFavCleanseInfo(gItem1).eName, uFavoritesManager.TFavCleanseInfo(gItem2).eName);
    1: Result:= FormMain.iCompare(uFavoritesManager.TFavCleanseInfo(gItem1).eSystemTitle, uFavoritesManager.TFavCleanseInfo(gItem2).eSystemTitle);
  end;
end;

procedure TFormFavoritesManagerCleanseProfile.FavoritesCleanseListKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonRemoveSelected.Click;
    VK_ESCAPE: ButtonAbort.Click;
  end;
end;

procedure TFormFavoritesManagerCleanseProfile.FavoritesCleanseListColumnClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  ShiftState: TShiftState; const Column: TEasyColumn);
begin
  if Button = cmbLeft then
     begin
       FavoritesCleanseList.BeginUpdate;
       FavoritesCleanseList.Sort.SortAll;
       FavoritesCleanseList.EndUpdate(False);
       FormMain.ELV_MakeVisible(FavoritesCleanseList, FavoritesCleanseList.Selection.First);
     end;
end;

procedure TFormFavoritesManagerCleanseProfile.ButtonRemoveSelectedClick(
  Sender: TObject);
begin
  if FormMain.CheckTotal(FavoritesCleanseList) then
     begin
       FavoritesCleanseList.BeginUpdate;
       FavoritesCleanseList.Selection.DeleteSelected(True);
       FavoritesCleanseList.EndUpdate;
       UpdateTotalLabel;
     end;
end;

procedure TFormFavoritesManagerCleanseProfile.FormShow(Sender: TObject);
begin
  UpdateTotalLabel;
end;

end.

