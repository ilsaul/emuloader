unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EasyListview, ImgList, StdCtrls, ExtCtrls, MPCommonUtilities,
  MPCommonObjects, uxTheme;

type
  TForm1 = class(TForm)
    ELV: TEasyListview;
    ImageList1: TImageList;
    ImageList2: TImageList;
    procedure ELVItemCustomView(Sender: TCustomEasyListview;
      Item: TEasyItem; ViewStyle: TEasyListStyle;
      var View: TEasyViewItemClass);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // There are lots of helpful methods in the descendents of TEasyViewReportItem for default drawing
  TCustomViewReportItem = class(TEasyViewReportItem)
  public
    procedure PaintBefore(Item: TEasyItem; Column: TEasyColumn; const Caption: WideString; ACanvas: TCanvas; RectArray: TEasyRectArrayObject; var Handled: Boolean); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



{ TCustomViewColumn }
{procedure TCustomViewColumn.Paint(Column: TEasyColumn; ACanvas: TCanvas; HeaderType: TEasyHeaderType);
var
  R: TRect;
  RectArray: TEasyRectArrayObject;
  Width, i: Integer;
  DrawTextFlags: TCommonDrawTextWFlags;
begin
  ItemRectArray(Column, RectArray);
  Width := RectWidth(RectArray.BoundsRect) div (High(COLUMNNAMES) + 1);
  R := RectArray.BoundsRect;
  R.Right := R.Left + Width;
  for i := 0 to High(COLUMNNAMES) do
  begin
    ACanvas.Brush.Color := clLtGray;
    ACanvas.FrameRect(R);
    LoadTextFont(Column, ACanvas);
    ACanvas.Brush.Color := clWhite;
    DrawTextFlags := [dtEndEllipsis, dtCenter, dtVCenter];
    DrawTextWEx(ACanvas.Handle, COLUMNNAMES[i], R, DrawTextFlags, 1);
    R.Left := R.Right - 1;
    R.Right := R.Right + Width;
  end
end;}

{ TCustomViewReportItem }
procedure TCustomViewReportItem.PaintBefore(Item: TEasyItem; Column: TEasyColumn; const Caption: WideString; ACanvas: TCanvas; RectArray: TEasyRectArrayObject; var Handled: Boolean);
var
  R, IconR: TRect;
begin
  inherited;
  if Column.Index = 0 then
  begin
    //R := RectArray.BoundsRect;
    //R.Right := R.Left + TEasyListview( Item.OwnerListview).ClientWidth;
    //R.Left := 0;

    //if Item.Index in [0, 2, 4] then
    if (Item.Captions[1] = 'isparent') and (Item.Index > 0) then
       begin
         //RectArray.StateRect.Left:= 2;
         RectArray.BoundsRect.Left:= 0;
         //RectArray.IconRect.Right:= 2;
         //Item.ImageIndent:= 2;
         //Item.PaintInfo.CaptionIndent:= 2;
       end
    else
       begin
         //RectArray.StateRect.Left:= 12;
         RectArray.BoundsRect.Left:= 16;
         //Item.ImageIndent:= 12;
         //Item.PaintInfo.CaptionIndent:= 12;
       end;
  end;
end;

procedure TForm1.ELVItemCustomView(Sender: TCustomEasyListview;
  Item: TEasyItem; ViewStyle: TEasyListStyle;
  var View: TEasyViewItemClass);
begin
  if ViewStyle = elsReport then
     View := TCustomViewReportItem
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Loop: Integer;
  Item: TEasyItem;
begin
   ELV.BeginUpdate;
   for Loop:= 1 to 5 do
   begin
     Item:= ELV.Items.Add;
     Item.ImageIndex:= 0;
     Item.StateImageIndex:= 0;
     Item.Caption:= 'Caption '+IntToStr(Loop);
     if Item.Index mod 2 = 0 then
        Item.Captions[1]:= 'isparent'
     else
        Item.Captions[1]:= 'isclone';
     Item.Captions[2]:= 'my 2nd caption';
     Item.Captions[3]:= '3rd caption';
   end;
   ELV.EndUpdate;
end;

end.

