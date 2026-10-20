unit EasyListviewReg;

interface

procedure Register;

implementation

uses
  System.Classes,
  DesignIntf,
  EasyListview;

procedure Register;
begin
  RegisterComponents('MustangPeak', [TEasyListview]);
end;

end.
