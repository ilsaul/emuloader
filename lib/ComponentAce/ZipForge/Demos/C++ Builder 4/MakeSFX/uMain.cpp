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
void __fastcall TfmMain::FormCreate(TObject *Sender)
{
 ArcName->Text = "test.zip";
 OpenDialog1->FileName = "..\\..\\..\\SFXStub\\SFXStub.exe";
 StubName->Text = OpenDialog1->FileName;
 SaveDialog1->InitialDir = ExtractFilePath(Application->ExeName);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnChooseArchiveClick(TObject *Sender)
{
 OpenDialog->InitialDir = ExtractFilePath(ArcName->Text);
 if (OpenDialog->InitialDir == "")
  OpenDialog->InitialDir = ExtractFilePath(Application->ExeName);
 if (OpenDialog->Execute())
  ArcName->Text = OpenDialog->FileName;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnChooseStubClick(TObject *Sender)
{
 OpenDialog1->InitialDir = ExtractFilePath(StubName->Text);
 if (OpenDialog1->InitialDir == "")
  OpenDialog1->InitialDir = ExtractFilePath(Application->ExeName);
 if (OpenDialog1->Execute())
  StubName->Text = OpenDialog1->FileName;	
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnMakeSFXClick(TObject *Sender)
{
 Archiver->FileName = ArcName->Text;
 Archiver->SFXStub = StubName->Text;
 if (SaveDialog1->Execute())
 {
   Archiver->MakeSFX(SaveDialog1->FileName);
   ShowMessage("SFX archive "+ExtractFileName(SaveDialog1->FileName)+" created successfully.");
 }
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::bnExitClick(TObject *Sender)
{
 Close();	
}
//---------------------------------------------------------------------------
