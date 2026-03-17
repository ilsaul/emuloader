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
void __fastcall TfmMain::bnExtractClick(TObject *Sender)
{
 // overwrite all
 bAll = false;
 Archiver->Options->OverwriteMode = omPrompt;
 if (cboverwrite->Checked) 
  Archiver->Options->OverwriteMode = omAlways;
 Archiver->FileName = Application->ExeName;
 Archiver->BaseDir = edPath->Text;
 Archiver->OpenArchive(fmOpenRead+fmShareDenyNone);
 Archiver->ExtractFiles("*.*");
 Archiver->CloseArchive();
 Close();
 Application->Terminate();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnExitClick(TObject *Sender)
{
 Close();	
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnSelectDestPathClick(TObject *Sender)
{
 AnsiString s;
 if (SelectDirectory("Select destination folder ...","",s))
  edPath->Text = s;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::ArchiverConfirmOverwrite(TObject *Sender,
      AnsiString SourceFileName, AnsiString &DestFileName, bool &Confirm)
{
 int res;
 if (bAll)
  {
   Confirm = true;
   return;
  }
 res = MessageDlg("Overwrite "+DestFileName+"\r\nWith file "+SourceFileName,
    mtConfirmation,TMsgDlgButtons()>>mbYes>>mbNo>>mbAll,0);
 if (res == mrAll)
  bAll = true;
 if ((res == mrYes) || (bAll))
  Confirm = true;
 else
  Confirm = false;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::FormCreate(TObject *Sender)
{
 edPath->Text = ExtractFilePath(Application->ExeName);
}
//---------------------------------------------------------------------------
