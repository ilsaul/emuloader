//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ZipForge.hpp"
#include <Buttons.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TEdit *ArcName;
	TButton *bnChooseArchive;
	TEdit *StubName;
	TButton *bnChooseStub;
	TBitBtn *bnMakeSFX;
	TBitBtn *bnExit;
	TZipForge *Archiver;
	TSaveDialog *SaveDialog1;
	TOpenDialog *OpenDialog1;
	TOpenDialog *OpenDialog;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall bnChooseArchiveClick(TObject *Sender);
	void __fastcall bnChooseStubClick(TObject *Sender);
	void __fastcall bnMakeSFXClick(TObject *Sender);
	void __fastcall bnExitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
