unit PanelLabelEx;

// PanelEx by Ciro Alfredo Consentino
// © 2012 by Ciro Alfredo Consentino. All rights reserved
//
// This file is not distributable without permission by Ciro Alfredo Consentino
// website: http://emuloader.mameworld.info
// e-mail: emuloader@gmail.com
//
// version 1.0, April 08, 2012
// version 1.1, January 10, 2018 -> added "Windows Theme" paint style
// version 1.2, May 09, 2018 -> added "InnerColorBorder" (TColor) and "EnableInnerBorder" (Boolean) options
// version 1.3, May 23, 2018 -> added "EnableCustomBorder" option to paint a border outside the client area (child controls are adjusted after on/off)
//                              - gradient painting adjusts to the new custom border! :)
//                              - this approach is much better than the frame + inner frame that paints over the client area
// version 1.4, June 27, 2018 -> inner border was not paiting the very end-corners like the outer frame
// version 1.5, July 11, 2018 -> replaced "EnableCustomBorder" TRUE/FALSE value by "ecbNone", "ecbSingle", "ecbDouble"
//                               - make sure to copy the code from "TBorderStyle" so all 3 options are available in design time
//                               - style "ecbSingle" uses the outer frame color (FColorBorder)
// version 1.6, June 03, 2019 -> fixed bad Windows theme drawing that messes up panel's child components
// version 1.7, June 24, 2019 -> removed BitBlt() function and restored "DrawParentImage() function to copy bk image because BitBlt() was causing severe painting problems

interface

uses
  Windows, SysUtils, Classes, Controls, ExtCtrls, Graphics, Forms, Messages, Themes, PanelEx, ShadowLabel;

type
  TPanelLabelEx = class(TPanelEx)
  private
    FLabel: TShadowLabel;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   SetupInternalLabel;
  published
    property LabelPanel: TShadowLabel read FLabel;
  end;

procedure Register;

implementation

constructor TPanelLabelEx.Create(AOwner: TComponent);
begin
  inherited;
  Self.EnableCustomBorder := ecbSingle;
  Self.Style:= vgSolid;
  Self.Color1:= $00f1f1f1;
  Self.ColorFrame := clSilver;
  SetupInternalLabel;
end;

destructor TPanelLabelEx.Destroy;
begin
  FLabel.Destroy;
  inherited Destroy;
end;

procedure TPanelLabelEx.SetupInternalLabel;
begin
  FLabel := TShadowLabel.Create(Self);
  FLabel.Parent:= Self;
  FLabel.AutoSize := False;
  FLabel.Color := $00f5f5f5;
  FLabel.ColorFrame := $00dcdcdc;
  FLabel.Height := 18;
  FLabel.Frames := [lfrLeft, lfrRight, lfrBottom];
  FLabel.CaptionIndent := 3;
  FLabel.Caption:= 'tes';
  FLabel.ShadowEnabled := False;
  FLabel.Visible := True;
  FLabel.Align := alTop;
end;

procedure Register;
begin
  RegisterComponents('Components', [TPanelLabelEx]);
end;


end.
 