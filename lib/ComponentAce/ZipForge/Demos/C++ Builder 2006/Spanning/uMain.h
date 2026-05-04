//---------------------------------------------------------------------------
#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include "ZipForge.hpp"
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *eSrcDir;
        TButton *Button3;
        TEdit *eDstDir;
        TButton *Button4;
        TButton *btnSpanning;
        TButton *btnSplitting;
        TTabSheet *TabSheet2;
        TLabel *Label3;
        TLabel *Label4;
        TEdit *eUnpackDir;
        TButton *btnUnpack;
        TEdit *eArcName;
        TButton *Button5;
        TButton *Button6;
        TProgressBar *ProgressBar1;
        TZipForge *Archiver;
        TOpenDialog *OpenDialog1;
        TSaveDialog *SaveDialog1;
        TLabel *Label5;
        TComboBox *cbVolumeSize;
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
        void __fastcall Button6Click(TObject *Sender);
        void __fastcall btnSpanningClick(TObject *Sender);
        void __fastcall btnUnpackClick(TObject *Sender);
        void __fastcall ArchiverFileProgress(TObject *Sender,
          AnsiString FileName, double Progress,
          TZFProcessOperation Operation, TZFProgressPhase ProgressPhase,
          bool &Cancel);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
