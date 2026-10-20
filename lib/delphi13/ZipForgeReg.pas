unit ZipForgeReg;

interface

procedure Register;

implementation

uses
  System.Classes,
  DesignIntf,
  ZipForge;

procedure Register;
begin
  RegisterComponents('Components', [TZipForge]);
end;

end.
