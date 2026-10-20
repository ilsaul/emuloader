unit Graphics32Reg;

interface

procedure Register;

implementation

uses
  System.Classes,
  DesignIntf,
  GR32_Image,
  GR32_RangeBars;

procedure Register;
begin
  RegisterComponents('Graphics32', [TImage32, TGaugeBar]);
end;

end.
