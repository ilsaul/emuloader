//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZipForge"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnStartClick(TObject *Sender)
{
 Archiver->FileName = "Archive\\test.zip";
 CopyFile("Source\\1.txt","Source1\\2.txt",false);
 CopyFile("Source\\uMain.pas","Source1\\2.pas",false);
 CopyFile("Source\\dummy.mp3","Source1\\dummy2.mp3",false);
 CreateDir("Source1\\33.txt");

 // Create a new archive file
 Archiver->OpenArchive(fmCreate);

 // Let"s encrypt all files
 Archiver->Password = "The password";

 // Set path to folder with some text files to BaseDir
 Archiver->BaseDir = "Source";

 // Do not compress MPEG3 files
 Archiver->NoCompressionMasks->Text = "*.mp3";

 // Add all files and directories from Source excluding text files to the archive
 Archiver->AddFiles("*.*",faAnyFile,"*.txt");

 // Set path to destination folder
 Archiver->BaseDir = "Dest";

 // Extract all files and directories from the archive to BaseDir
 // After extracting directory Dest should contain all files from folder
 // Source excluding *.mp3 and *.txt files
 Archiver->ExtractFiles("*.*");

 // Use full path
 Archiver->Options->StorePath = spFullPath;

 // Set path to destination folder
 Archiver->BaseDir = "Source1";

 // Move all text files from Source1 to the archive
 // After moving directory Source1 should not contain any text files
 Archiver->MoveFiles("*.txt",faAnyFile-faDirectory);

 // Set path to current drive
 Archiver->BaseDir = ExtractFileDrive(Application->ExeName);

 // Overwrite all files
 Archiver->Options->OverwriteMode = omAlways;

 // Update all files excluding 1???.t* from Source1
 Archiver->UpdateFiles(ExtractFilePath(Application->ExeName)+"\\Source1\\*.*",faAnyFile-faDirectory,"2???.t*");
 // Set temporary directory
 Archiver->TempDir = "Temp";

 // Test all files and directories in the archive
 try
 {
  Archiver->TestFiles("*.*");
 }
 catch(...)
 {
  MessageDlg("Errors occurred in the archive file",mtError,TMsgDlgButtons()>>mbOK,0);
 }

 // Use full path
 Archiver->Options->StorePath = spRelativePath;
 Archiver->BaseDir = "Dest1";

 // Extract all files to Dest1
 Archiver->ExtractFiles("*.*");

 // Close the archive
 Archiver->CloseArchive();
 ShowMessage("All files were added and extracted successfully.");
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BitBtn2Click(TObject *Sender)
{
 Close();
}
//---------------------------------------------------------------------------
