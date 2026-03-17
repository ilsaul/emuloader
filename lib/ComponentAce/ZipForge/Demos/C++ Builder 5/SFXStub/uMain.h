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
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TBitBtn *bnExtract;
	TBitBtn *bnExit;
	TEdit *edPath;
	TButton *bnSelectDestPath;
	TCheckBox *cboverwrite;
	TZipForge *Archiver;
	void __fastcall bnExtractClick(TObject *Sender);
	void __fastcall bnExitClick(TObject *Sender);
	void __fastcall bnSelectDestPathClick(TObject *Sender);
	void __fastcall ArchiverConfirmOverwrite(TObject *Sender,
          AnsiString SourceFileName, AnsiString &DestFileName,
          bool &Confirm);
	void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
  BOOL bAll;
public:		// User declarations
	__fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
