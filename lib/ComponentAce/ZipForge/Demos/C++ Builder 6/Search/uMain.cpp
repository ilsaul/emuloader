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
 TZFArchiveItem ArchiveItem;
 TListItem *ListItem;
 int FileDate;

 Archiver->FileName = "Archive\\test.zip";

 // Open existing archive file
 Archiver->OpenArchive(fmOpenRead);

 // Search text files stored inside the archive
 if (Archiver->FindFirst("*.*",ArchiveItem,faAnyFile-faDirectory))
  do
  {
    // Add file name
    ListItem = ListView->Items->Add();
    ListItem->Caption = ArchiveItem.FileName;

    // Add modification date
    FileDate = (ArchiveItem.LastModFileDate << 16) +
							 ArchiveItem.LastModFileTime;
    ListItem->SubItems->Add(DateToStr(
 	   	 				 FileDateToDateTime(FileDate)));

    // Add file size
    ListItem->SubItems->Add(IntToStr(ArchiveItem.UncompressedSize));

    // Add compression rate
    TVarRec v[] = {ArchiveItem.CompressionRate};
    ListItem->SubItems->Add(Format("%f",v,ARRAYSIZE(v)-1)+" %");

    // Add compressed file size
    ListItem->SubItems->Add(IntToStr(ArchiveItem.CompressedSize));

    // Add file path
    ListItem->SubItems->Add(ArchiveItem.StoredPath);
 }
 while (Archiver->FindNext(ArchiveItem));

 // Close the archive
 Archiver->CloseArchive();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BitBtn2Click(TObject *Sender)
{
 Close();	
}
//---------------------------------------------------------------------------
