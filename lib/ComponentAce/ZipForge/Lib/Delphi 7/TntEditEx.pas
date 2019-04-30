{-----------------------------------------------------------------------------
 Unit Name: TntEditEx
 Author:    Moreno Cattaneo
 Date:      13-dic-2025
 Purpose: Replace Missing Component from Ciro Cosentino
 History:
 New "TNT Unicode" component "TntEditEx", based on "TntEdit" but with custom frame drawing, just like my "EditEx" component
- an edit box that can display Unicode texts, used in "Rename Game Image" feature, for console/computer games
- new "TntEditEx.pas" file added to the TNT's "runtime" package (same package as "TntStdCtrls.pas", easier to compile and cleaner code)
- this component was made for the "Night Mode"
- better to create a new component and leave the original "TntEdit" unmodified
Several edit boxes replaced by TTntEditEx component in the project to accept Unicode texts (Engligh / Non-Engligh mixed)

-----------------------------------------------------------------------------}
unit TntEditEx;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, TntStdCtrls, Graphics;
  //Windows, Messages, Forms, Dialogs;

type
  TTntEditEx = class(TTntEdit)
  private
    { Private declarations }
    FColorFrame: TColor;
    FColorFrameFocused: TColor;

    FColorDisabled: TColor;
    FColorFrameDisabled: TColor;

    FUseCustomBorder: Boolean;

    // Variabili di stato interne
    FFocused: Boolean;
    FMouseInControl: Boolean;

    // Metodi per l'aggiornamento grafico al cambio proprietà
    procedure SetColorFrame(const Value: TColor);
    procedure SetColorFrameFocused(const Value: TColor);
    procedure SetUseCustomBorder(const Value: Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property ColorFrame: TColor read FColorFrame write SetColorFrame default clWindowFrame;
    property ColorFrameFocused: TColor read FColorFrameFocused write SetColorFrameFocused default clHighlight;
    property ColorDisabled: TColor read FColorDisabled write FColorDisabled default clBtnFace;
    property ColorFrameDisabled: TColor read FColorFrameDisabled write FColorFrameDisabled default clInactiveBorder;
    property UseCustomBorder: Boolean read FUseCustomBorder write SetUseCustomBorder default False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Tnt Standard', [TTntEditEx]);
end;

constructor TTntEditEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Inizializzazione valori di default
  FColorFrame := clWindowFrame;
  FColorFrameFocused := clHighlight;
  FColorDisabled := clBtnFace;
  FColorFrameDisabled := clInactiveBorder;
  FUseCustomBorder := False;
end;

procedure TTntEditEx.SetColorFrame(const Value: TColor);
begin
  if FColorFrame <> Value then
  begin
    FColorFrame := Value;
    Invalidate; // Forza il ridisegno del componente
  end;
end;

procedure TTntEditEx.SetColorFrameFocused(const Value: TColor);
begin
  if FColorFrameFocused <> Value then
  begin
    FColorFrameFocused := Value;
    Invalidate;
  end;
end;

procedure TTntEditEx.SetUseCustomBorder(const Value: Boolean);
begin
  if FUseCustomBorder <> Value then
  begin
    FUseCustomBorder := Value;
    RecreateWnd; // Ricrea la finestra se il cambio bordo è strutturale
  end;
end;

end.
