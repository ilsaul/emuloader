unit uTextFilesViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ImgList, ComCtrls;

type
  TFormTextViewer = class(TForm)
    FilesImageList: TImageList;
    TopImage: TImage;
    TextHolder: TRichEdit;
    TextOptions: TComboBoxEx;
    ButtonClose: TButton;
    ButtonTextFilesFont: TButton;
    ButtonTextFilesDefaultFont: TButton;
    LabelCaption: TLabel;
    BottomLine: TBevel;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TextOptionsSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonTextFilesFontClick(Sender: TObject);
    procedure ButtonTextFilesDefaultFontClick(Sender: TObject);
  private
    { Private declarations }
    TextFileName: String;
    function  LoadToolbarIcons: Boolean;
  public
    { Public declarations }
    EmulatorPath: String;
  end;

var
  FormTextViewer: TFormTextViewer;

implementation

uses uMain;

{$R *.DFM}

function TFormTextViewer.LoadToolbarIcons: Boolean;
begin
  Result:= ((FileExists(FormMain.FrontendPath+'resources\images\toolbars\TextViewer\0.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\TextViewer\1.ico')) and
            (FileExists(FormMain.FrontendPath+'resources\images\toolbars\TextViewer\2.ico')));

  if Result then
     begin
       FormMain.AddDefaultIcons('TextViewer\0.ico', FilesImageList, 1, False);
       FormMain.AddDefaultIcons('TextViewer\1.ico', FilesImageList, 1, False);
       FormMain.AddDefaultIcons('TextViewer\2.ico', FilesImageList, 1, False);
     end;
end;

procedure TFormTextViewer.ButtonCloseClick(Sender: TObject);
begin
  FormMain.UpdateTextViewerFont(1);
  Close;
end;

procedure TFormTextViewer.FormCreate(Sender: TObject);
begin
  TextOptions.ItemIndex:= 0;
  TextHolder.Color:= FormMain.MAMEInfoTextHolder.Color;
  if FileExists(FormMain.FrontendPath+'resources\images\topwindow\FileViewer.png') then
     TopImage.Picture.LoadFromFile(FormMain.FrontendPath+'resources\images\topwindow\FileViewer.png');

  LoadToolbarIcons;
end;

procedure TFormTextViewer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #27) or (Key = #13)) then
     ButtonClose.OnClick(Self);
end;

procedure TFormTextViewer.TextOptionsSelect(Sender: TObject);
begin
  case TextOptions.ItemIndex of
    0:
      begin
        TextFileName:= '';
        TextHolder.Lines.BeginUpdate;
        if TextHolder.Lines.Count > 0 then
           TextHolder.Lines.Clear;
        TextHolder.Lines.EndUpdate;
      end;
    1: TextFileName:= FormMain.FrontendPath+'docs\el-readme.rtf';
    2: TextFileName:= FormMain.FrontendPath+'docs\el-whatsnew.rtf';
    3: TextFileName:= FormMain.FrontendPath+'docs\el-bugs.rtf';
    4: TextFileName:= FormMain.FrontendPath+'docs\el-todo.rtf';
    5: TextFileName:= FormMain.FrontendPath+'docs\el-listformat.rtf';
    6: TextFileName:= FormMain.FrontendPath+'docs\el-defaulticons.rtf';
    7: TextFileName:= FormMain.FrontendPath+'docs\el-history.rtf';
    8: TextFileName:= FormMain.FrontendPath+'docs\el-customgamestutorial.rtf';
    9: TextFileName:= FormMain.FrontendPath+'docs\el-guide.rtf';
   10: TextFileName:= FormMain.FrontendPath+'docs\el-parentallocktutorial.rtf';
   11: TextFileName:= FormMain.FrontendPath+'docs\el-userprofiletutorial.rtf';
   12: TextFileName:= FormMain.FrontendPath+'docs\el-customcmd.rtf';
   13: TextFileName:= FormMain.FrontendPath+'docs\el-tips-tricks.rtf';
   14: TextFileName:= EmulatorPath+'mame.txt';
   15: TextFileName:= EmulatorPath+'windows.txt';
   16: TextFileName:= EmulatorPath+'msdos.txt';
   17: TextFileName:= EmulatorPath+'whatsnew.txt';
   18: TextFileName:= EmulatorPath+'gamelist.txt';
   19: TextFileName:= EmulatorPath+'ctrlr.txt';
  end;

  if TextFileName <> '' then
  begin
    case FileExists(TextFileName) of
      True:
        begin
          TextHolder.Lines.BeginUpdate;
          TextHolder.Lines.Clear;
          TextHolder.Lines.LoadFromFile(TextFileName);
          TextHolder.Lines.EndUpdate;
        end;
      False:
        begin
          case FileExists(ExtractFilePath(FormMain.EmulatorExecutable[1])+ExtractFileName(TextFileName)) of
            True:
              begin
                TextHolder.Lines.BeginUpdate;
                TextHolder.Lines.Clear;
                TextHolder.Lines.LoadFromFile(ExtractFilePath(FormMain.EmulatorExecutable[1])+ExtractFileName(TextFileName));
                TextHolder.Lines.EndUpdate;
              end;
            False:
              begin
                TextOptions.ItemIndex:= 0;
                TextOptions.OnSelect(Self);
              end;
          end;
        end;
    end;
  end;
  ButtonClose.SetFocus;
end;

procedure TFormTextViewer.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormTextViewer);
  FormMain.SetTextViewerLanguage;
  FormMain.ReadTextViewerFont(1);
end;

procedure TFormTextViewer.ButtonTextFilesFontClick(Sender: TObject);
begin
  FormMain.FontDialog.Font:= TextHolder.Font;
  if FormMain.FontDialog.Execute then
     TextHolder.Font:= FormMain.FontDialog.Font;
end;

procedure TFormTextViewer.ButtonTextFilesDefaultFontClick(Sender: TObject);
begin
  TextHolder.Font.Color:= 0;
  TextHolder.Font.Name:= 'Courier New';
  TextHolder.Font.Size:= 8;
  TextHolder.Font.Style:= [];
end;

end.

