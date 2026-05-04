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

 // Set path to folder with some text files to BaseDir
 Archiver->BaseDir = "Source";

 // Add all files and directories from "C:\SOURCE_FOLDER" to the archive
 Archiver->AddFiles("*.*");

 // Set path to destination folder
 Archiver->BaseDir = "Dest";

 // Extract all files and directories from the archive to "C:\DESTINATION_FOLDER"
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
