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

 // Create a new archive file
 Archiver->OpenArchive(fmCreate);

 // Start a transaction
 Archiver->BeginUpdate();

 // Set path to folder with some HTML files to BaseDir
 Archiver->BaseDir = "Source";

 // Add all files from Source folder to the archive
 try
 {
  Archiver->AddFiles("*.*");
 }
 catch(...)
 {
  // If errors occurs rollback transaction. All modifications will be cancelled.
  Archiver->CancelUpdate();

  // Close archive and exit current procedure
  Archiver->CloseArchive();
  ShowMessage("Error adding all files");
  return;
 }

 // Set path to folder with some HTML files to BaseDir
 Archiver->BaseDir = "Source1\\";

 // Add all HTML files from Source1 folder to the archive
 try
 {
  Archiver->AddFiles("*.htm*");
 }
 catch(...)
 {
   // If errors occurs rollback transaction. All modifications will be cancelled.
   Archiver->CancelUpdate();

   // Close archive and exit current procedure
   Archiver->CloseArchive();
   ShowMessage("Error adding html files");
   return;
 }

 // Commit a transaction. All modifications will be saved.
 Archiver->EndUpdate();

 // Set path to destination folder
 Archiver->BaseDir = "Dest";

 // Extract all files
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
