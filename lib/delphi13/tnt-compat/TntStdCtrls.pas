unit TntStdCtrls;

// Delphi 13 compatibility shim for the TntWare Unicode Controls.
// The modern VCL is natively Unicode, so the Tnt controls used by EmuLoader
// are mapped directly onto the standard VCL classes.

interface

uses
  System.Classes, Vcl.StdCtrls;

type
  TTntCustomEdit = class(TCustomEdit);
  TTntEdit = class(TEdit);
  TTntMemo = class(TMemo);
  TTntLabel = class(TLabel);
  TTntButton = class(TButton);
  TTntCheckBox = class(TCheckBox);
  TTntRadioButton = class(TRadioButton);
  TTntComboBox = class(TComboBox);
  TTntListBox = class(TListBox);
  TTntGroupBox = class(TGroupBox);

implementation

initialization
  RegisterClasses([TTntEdit, TTntMemo, TTntLabel, TTntButton, TTntCheckBox,
    TTntRadioButton, TTntComboBox, TTntListBox, TTntGroupBox]);

end.
