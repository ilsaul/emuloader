//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZipForge"
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::Button3Click(TObject *Sender)
{
  if (OpenDialog1->Execute())
    eSrcDir->Text = OpenDialog1->FileName;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::Button4Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
    eDstDir->Text = SaveDialog1->FileName;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::Button5Click(TObject *Sender)
{
  if (OpenDialog1->Execute())
    eArcName->Text = OpenDialog1->FileName;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::Button6Click(TObject *Sender)
{
 AnsiString Dir = "";
 if (SelectDirectory(Dir, TSelectDirOpts() << sdAllowCreate << sdPerformCreate << sdPrompt,0))
    eUnpackDir->Text = Dir;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::btnSpanningClick(TObject *Sender)
{
  switch (cbVolumeSize->ItemIndex) {
     case 0:  Archiver->SpanningOptions->VolumeSize = vsAutoDetect;
              break;
     case 1:  Archiver->SpanningOptions->VolumeSize = vs1_44MB;
              break;
     case 2:  Archiver->SpanningOptions->VolumeSize = vs100MB;
              break;
     case 3:  Archiver->SpanningOptions->VolumeSize = vs200MB;
              break;
     case 4:  Archiver->SpanningOptions->VolumeSize = vs600MB;
              break;
     case 5:  Archiver->SpanningOptions->VolumeSize = vs650MB;
              break;
     case 6:  Archiver->SpanningOptions->VolumeSize = vs700MB;
              break;
     default:
           Archiver->SpanningOptions->VolumeSize = vsCustom;
           Archiver->SpanningOptions->CustomVolumeSize = StrToInt(cbVolumeSize->Text);
  }
  if ( TButton(Sender).Tag == 1)
    Archiver->SpanningMode = smSpanning;
  else
    Archiver->SpanningMode = smSplitting;

  Archiver->FileName = eDstDir->Text;
  Archiver->OpenArchive(fmCreate);
  Archiver->AddFiles(eSrcDir->Text);
  Archiver->CloseArchive();
  ShowMessage("Archive Creating completed");
  ProgressBar1->Position = 0;
}
//---------------------------------------------------------------------------


void __fastcall TfrmMain::btnUnpackClick(TObject *Sender)
{
  Archiver->FileName = eArcName->Text;
  Archiver->OpenArchive(fmOpenRead + fmShareDenyWrite);
  Archiver->BaseDir = eUnpackDir->Text;
  Archiver->ExtractFiles("*.*");
  Archiver->CloseArchive();
  ShowMessage("Files extracted successfully");
  ProgressBar1->Position = 0;
}
//---------------------------------------------------------------------------



void __fastcall TfrmMain::ArchiverFileProgress(TObject *Sender,
      AnsiString FileName, double Progress, TZFProcessOperation Operation,
      TZFProgressPhase ProgressPhase, bool &Cancel)
{
  ProgressBar1->Position = (int)Progress;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::FormCreate(TObject *Sender)
{
  cbVolumeSize->ItemIndex = 0;      
}
//---------------------------------------------------------------------------





