unit MessageAuthenticationCodes;

interface

uses SysUtils, Classes, MessageDigests;

{
  Copyright (c) 1998-1999 Dave Shapiro, Professional Software, Inc.
  Use and modify freely.
}

type
  THMAC = class(TObject)
  protected
    MD: TMessageDigest;
    FKey: Pointer;
    FNumOutputBytes: Integer;
    FIncompleteBytesDigested: Longint;
    procedure TransformPad(const Mask: Byte);
  public
    constructor Create(const MessageDigestClass: TMessageDigestClass;
                       const Key; const KeyLength: Integer;
                       const NumOutputBits: Integer);
    destructor Destroy; override;
    procedure Transform(const M; NumBytes: Longint);
    procedure TransformStream(const Stream: TStream);
    procedure TransformString(const S: string);
    procedure Complete;
    function AsString: string;
    function Completed: Boolean;
    function HashValue: string;
    function HashValueBytes: Pointer;
    function NumBytesDigested: Longint;
    function NumOutputBits: Integer;
    function HashValueSize: Integer;
  end;

implementation

constructor THMAC.Create(const MessageDigestClass: TMessageDigestClass;
                         const Key; const KeyLength: Integer;
                         const NumOutputBits: Integer);
begin
  inherited Create;
  { Round number of output bits to nearest byte. }
  FNumOutputBytes := NumOutputBits div BitsPerByte;
  FIncompleteBytesDigested := 0;
  MD := MessageDigestClass.Create;
  GetMem(FKey, MD.BlockSize);
  FillChar(FKey^, MD.BlockSize, $00);
  if KeyLength <= MD.BlockSize then
    Move(Key, FKey^, KeyLength)
  else begin
    MD.Transform(Key, KeyLength);
    MD.Complete;
    Move(MD.HashValueBytes^, FKey^, MD.DigestSize);
    MD.Clear;
  end;
  TransformPad($36);
end;

destructor THMAC.Destroy;
begin
  FreeMem(FKey);
  MD.Free;
  inherited;
end;

procedure THMAC.TransformPad(const Mask: Byte);
var
  I: Integer;
  Pad: Pointer;
  PKey, PPad: ^Byte;
begin
  GetMem(Pad, MD.BlockSize);
  PPad := Pad;
  PKey := FKey;
  for I := 1 to MD.BlockSize do begin
    PPad^ := PKey^ xor Mask;
    Inc(PPad);
    Inc(PKey);
  end;
  MD.Transform(Pad^, MD.BlockSize);
  FreeMem(Pad);
end;

procedure THMAC.Transform(const M; NumBytes: Longint);
begin
  MD.Transform(M, NumBytes);
end;

procedure THMAC.TransformStream(const Stream: TStream);
begin
  MD.TransformStream(Stream);
end;

procedure THMAC.TransformString(const S: string);
begin
  MD.TransformString(S);
end;

procedure THMAC.Complete;
var
  H: Pointer;
begin
  MD.Complete;
  FIncompleteBytesDigested := MD.NumBytesDigested;
  GetMem(H, MD.DigestSize);
  Move(MD.HashValueBytes^, H^, MD.DigestSize);
  MD.Clear;
  TransformPad($5c);
  MD.Transform(H^, MD.DigestSize);
  FreeMem(H);
  MD.Complete;
  Inc(FIncompleteBytesDigested, MD.NumBytesDigested);
end;

function THMAC.HashValue: string;
begin
  if (FNumOutputBytes > 0) and MD.Completed then
    Result := Copy(MD.HashValue, 1, FNumOutputBytes * 2)
  else begin
    Result := MD.HashValue;
  end;
end;

function THMAC.HashValueBytes: Pointer;
begin
  Result := MD.HashValueBytes;
end;

function THMAC.AsString: string;
begin
  Result := 'HMAC-' + MD.AsString;
  if FNumOutputBytes > 0 then Result := Result + '-' + IntToStr(NumOutputBits);
end;

function THMAC.Completed: Boolean;
begin
  Result := MD.Completed;
end;

function THMAC.NumBytesDigested: Longint;
begin
  if MD.Completed then
    Result := FIncompleteBytesDigested
  else begin
    Result := MD.NumBytesDigested;
  end;
end;

function THMAC.NumOutputBits: Integer;
begin
  Result := FNumOutputBytes * BitsPerByte;
end;

function THMAC.HashValueSize: Integer;
begin
  Result := MD.DigestSize;
end;

end.
