unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  ZipForge;

type
  TfmMain = class(TForm)
    bnStart: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Archiver: TZipForge;
    procedure bnStartClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ArchiverFileProgress(Sender: TObject; FileName: String;
      Progress: Double; Operation: TZFProcessOperation;
      ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
    procedure ArchiverOverallProgress(Sender: TObject; Progress: Double;
      Operation: TZFProcessOperation; ProgressPhase: TZFProgressPhase;
      var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses uProgress;

{$R *.DFM}

procedure TfmMain.bnStartClick(Sender: TObject);
begin
 with Archiver do
    begin
        FileName := 'Archive\test.zip';

        // Create a new archive file
        OpenArchive(fmCreate);

        // Set path to folder with some text files to BaseDir
        BaseDir := 'Source';

        // Add all files and directories from 'C:\SOURCE_FOLDER' to the archive
        AddFiles('*.*');

        // Set path to destination folder
        BaseDir := 'Dest';

        // Extract all files and directories from the archive to 'C:\DESTINATION_FOLDER'
        ExtractFiles('*.*');

        // Close the archive
        CloseArchive;
    end;
    ShowMessage('All files were added and extracted successfully.');
end;

procedure TfmMain.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfmMain.ArchiverFileProgress(Sender: TObject; FileName: String;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
 frmProgress.gFile.Progress := Round(Progress);
 frmProgress.lbFile.Caption := FileName;
 Cancel := frmProgress.bCancel;
 Application.ProcessMessages;
end;

procedure TfmMain.ArchiverOverallProgress(Sender: TObject;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
 if (ProgressPhase = ppStart) then
  frmProgress.Show
 else
 if (ProgressPhase = ppEnd) then
  frmProgress.Hide;

 frmProgress.gOverall.Progress := Round(Progress);
 Cancel := frmProgress.bCancel;
 Application.ProcessMessages;
end;

end.
