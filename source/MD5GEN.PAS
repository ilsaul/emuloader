unit md5gen;

interface

uses Windows, SysUtils, Classes, FileCtrl;

type
  Tmd5Proc = procedure (StreamPos, StreamSize: Integer) of object;

function  MD5sum(Stream: TStream; Proc: Tmd5Proc): String;
function  SecToString(const Duration: Integer): String;

implementation

function MD5sum(Stream: TStream; Proc: Tmd5Proc): String;
const
  S11 = 7; S12 = 12; S13 = 17; S14 = 22;
  S21 = 5; S22 = 9;  S23 = 14; S24 = 20;
  S31 = 4; S32 = 11; S33 = 16; S34 = 23;
  S41 = 6; S42 = 10; S43 = 15; S44 = 21;
  CodeSaver1: array[0..3] of dword = ($FFFFFF00, $FFFF00FF, $FF00FFFF, $00FFFFFF);
  CodeSaver2: array[0..3] of dword = (0, 8, 16, 24);
var
  Int, loop, loop2, loop3: Integer;
  Times_to_loop: Integer;
  Padding: String;
  High, Low: dword;
  A, B, C, D, AA, BB, CC, DD: dword;
  X: array[0..15] of dword;
  MyBuffer: String;
  Start: Integer;

  function MyStreamRead(S: TStream; var buffer; bytestoread: Integer): Integer;
  const
    buffersize = 128 * 1024;
  var
    Data_End: LongInt;
  begin
    if Length(MyBuffer) - Start < BytesToRead then
       begin
         Delete(MyBuffer, 1, Start);
         Start:= 0;
         Data_End:= Length(MyBuffer);
         SetLength(MyBuffer, Data_End + buffersize + 1);
         Data_End:= Data_End + S.Read(MyBuffer[Data_End + 1], buffersize);
         SetLength(MyBuffer, Data_End);
       end;
    if Length(MyBuffer) + Start < bytestoread then
       bytestoread:= length(MyBuffer) - Start;
    Move(MyBuffer[Start + 1], Buffer, bytestoread);
    Start:= Start + bytestoread;
    Result:= bytestoread;
  end; //function MyStreamRead

  function REORDER(w: dword): dword;
  begin
    Result:= w and $000000FF;
    Result:= Result shl 8;
    w:= w shr 8;
    Result:= Result or (w and $000000FF);
    Result:= Result shl 8;
    w:= w shr 8;
    Result:= Result or (w and $000000FF);
    Result:= Result shl 8;
    w:= w shr 8;
    Result:= Result or (w and $000000FF);
  end;

  function ROTATE_LEFT(x, n: dword): dword;
  begin
    Result:= (x shl n) or (x shr (32 - n));
  end;

  procedure FF(var a: dword; const b, c, d, x, s, ac: dword);
  begin
    a:= ROTATE_LEFT(a + ((b and c) or ((not b) and d)) + x + ac, S) + b;
  end;

  procedure GG(var a: dword; const b, c, d, x, s, ac: dword);
  begin
    a:= ROTATE_LEFT(a + (((b and d)or (c and (not d))) + x + ac), s) + b;
  end;

  procedure HH(var a: dword; const b, c, d, x, s, ac: dword);
  begin
    a:= ROTATE_LEFT(a + ((b xor c xor d) + x + ac), s) + b;
  end;

  procedure II(var a: dword; const b, c, d, x, s, ac: dword);
  begin
    a:= ROTATE_LEFT(a + ((c xor (b or (not d))) + x + ac), s) + b;
  end;

begin
  MyBuffer:= '';
  Start:= 0;
  Result:= '';

  High:= Stream.Size shr 29;
  Low:= Stream.Size shl 3;

  (* Step 1 - Append Padding Bits *)

  // Figure out how many bits need to be added
  // (Stream.Size * 8) = number of bits.
  Int:= ((((Stream.Size * 8) div 512) + 1) * 512) - (Stream.Size * 8);
  if Int < 65 then
    Int:= Int + (512);
  // Subtract space for Size
  Int:= Int - 64;
  // Check that everything's OK
  if (Int + 64) mod 8 <> 0 then
     begin
       Result:= 'Error #1 - Couldn''t calculate padding';
       Exit;
     end;
  // Translate from Bits to Bytes/Chars
  Int:= Int div 8;

  SetLength(Padding, Int);
  Padding[1]:= char(128);
  for loop:= 2 to Int do
    Padding[loop]:= char(0);

  // Check that it's still ok.
  Int:= (Stream.Size * 8) + (Length(Padding) * 8);
  Int:= (Int + 64) mod 512;
  if Int <> 0 then
     begin
       Result:= 'Error #2 - Padding Failed';
       Exit;
     end;

  (* Step 2 - Append Length *)

  Padding:= Padding +
   Char(Low) +
   Char(Low Shr 8) +
   Char(Low Shr 16) +
   Char(Low Shr 24);
  Padding:= Padding +
   Char(High) +
   Char(High Shr 8) +
   Char(High Shr 16) +
   Char(High Shr 24);

  // Check again
  Int:= Stream.Size + Length(Padding);
  if Int mod 64 <> 0 then
     begin
       Result:= 'Error #3 - Append length failed';
       Exit;
     end;

  (* Step 3 - Initialize MD Buffer *)

  A:= $67452301;
  B:= $efcdab89;
  C:= $98badcfe;
  D:= $10325476;

  (* Step 4 - Process Message in 16-Word Blocks *)

  Stream.Seek(0, soFromBeginning);

  Times_to_loop:= ((Int div 4) div 16) - 1;
  for loop:= 0 to Times_to_loop do
  begin
    if Assigned(Proc) and (loop mod 200 = 0) then
       Proc(Stream.Position, Stream.Size);

    AA:= A;
    BB:= B;
    CC:= C;
    DD:= D;

// Function MyStreamRead (Var S:TStream; var buffer; const bytestoread:Integer):Integer;
    for loop2:= 0 to 15 do
    begin
//      Int := Stream.Read(X[loop2], 4);
      Int:= MyStreamRead(Stream, X[loop2], 4);
      if Int < 4 then
         for loop3:= Int to (4 - 1) do
         begin
           X[loop2]:= (X[loop2] and CodeSaver1[loop3]) or (ord(Padding[1]) shl CodeSaver2[loop3]);
           Delete(Padding, 1, 1);
         end; // for loop3
    end;

    // Round 1
    FF (a, b, c, d, x[ 0], S11, $d76aa478); // 1
    FF (d, a, b, c, x[ 1], S12, $e8c7b756); // 2
    FF (c, d, a, b, x[ 2], S13, $242070db); // 3
    FF (b, c, d, a, x[ 3], S14, $c1bdceee); // 4
    FF (a, b, c, d, x[ 4], S11, $f57c0faf); // 5
    FF (d, a, b, c, x[ 5], S12, $4787c62a); // 6
    FF (c, d, a, b, x[ 6], S13, $a8304613); // 7
    FF (b, c, d, a, x[ 7], S14, $fd469501); // 8
    FF (a, b, c, d, x[ 8], S11, $698098d8); // 9
    FF (d, a, b, c, x[ 9], S12, $8b44f7af); // 10
    FF (c, d, a, b, x[10], S13, $ffff5bb1); // 11
    FF (b, c, d, a, x[11], S14, $895cd7be); // 12
    FF (a, b, c, d, x[12], S11, $6b901122); // 13
    FF (d, a, b, c, x[13], S12, $fd987193); // 14
    FF (c, d, a, b, x[14], S13, $a679438e); // 15
    FF (b, c, d, a, x[15], S14, $49b40821); // 16

    // Round 2
    GG (a, b, c, d, x[ 1], S21, $f61e2562); // 17
    GG (d, a, b, c, x[ 6], S22, $c040b340); // 18
    GG (c, d, a, b, x[11], S23, $265e5a51); // 19
    GG (b, c, d, a, x[ 0], S24, $e9b6c7aa); // 20
    GG (a, b, c, d, x[ 5], S21, $d62f105d); // 21
    GG (d, a, b, c, x[10], S22, $2441453);  // 22
    GG (c, d, a, b, x[15], S23, $d8a1e681); // 23
    GG (b, c, d, a, x[ 4], S24, $e7d3fbc8); // 24
    GG (a, b, c, d, x[ 9], S21, $21e1cde6); // 25
    GG (d, a, b, c, x[14], S22, $c33707d6); // 26
    GG (c, d, a, b, x[ 3], S23, $f4d50d87); // 27
    GG (b, c, d, a, x[ 8], S24, $455a14ed); // 28
    GG (a, b, c, d, x[13], S21, $a9e3e905); // 29
    GG (d, a, b, c, x[ 2], S22, $fcefa3f8); // 30
    GG (c, d, a, b, x[ 7], S23, $676f02d9); // 31
    GG (b, c, d, a, x[12], S24, $8d2a4c8a); // 32

    // Round 3
    HH (a, b, c, d, x[ 5], S31, $fffa3942); // 33
    HH (d, a, b, c, x[ 8], S32, $8771f681); // 34
    HH (c, d, a, b, x[11], S33, $6d9d6122); // 35
    HH (b, c, d, a, x[14], S34, $fde5380c); // 36
    HH (a, b, c, d, x[ 1], S31, $a4beea44); // 37
    HH (d, a, b, c, x[ 4], S32, $4bdecfa9); // 38
    HH (c, d, a, b, x[ 7], S33, $f6bb4b60); // 39
    HH (b, c, d, a, x[10], S34, $bebfbc70); // 40
    HH (a, b, c, d, x[13], S31, $289b7ec6); // 41
    HH (d, a, b, c, x[ 0], S32, $eaa127fa); // 42
    HH (c, d, a, b, x[ 3], S33, $d4ef3085); // 43
    HH (b, c, d, a, x[ 6], S34, $4881d05);  // 44
    HH (a, b, c, d, x[ 9], S31, $d9d4d039); // 45
    HH (d, a, b, c, x[12], S32, $e6db99e5); // 46
    HH (c, d, a, b, x[15], S33, $1fa27cf8); // 47
    HH (b, c, d, a, x[ 2], S34, $c4ac5665); // 48

    // Round 4
    II (a, b, c, d, x[ 0], S41, $f4292244); // 49
    II (d, a, b, c, x[ 7], S42, $432aff97); // 50
    II (c, d, a, b, x[14], S43, $ab9423a7); // 51
    II (b, c, d, a, x[ 5], S44, $fc93a039); // 52
    II (a, b, c, d, x[12], S41, $655b59c3); // 53
    II (d, a, b, c, x[ 3], S42, $8f0ccc92); // 54
    II (c, d, a, b, x[10], S43, $ffeff47d); // 55
    II (b, c, d, a, x[ 1], S44, $85845dd1); // 56
    II (a, b, c, d, x[ 8], S41, $6fa87e4f); // 57
    II (d, a, b, c, x[15], S42, $fe2ce6e0); // 58
    II (c, d, a, b, x[ 6], S43, $a3014314); // 59
    II (b, c, d, a, x[13], S44, $4e0811a1); // 60
    II (a, b, c, d, x[ 4], S41, $f7537e82); // 61
    II (d, a, b, c, x[11], S42, $bd3af235); // 62
    II (c, d, a, b, x[ 2], S43, $2ad7d2bb); // 63
    II (b, c, d, a, x[ 9], S44, $eb86d391); // 64

    A:= A + AA;
    B:= B + BB;
    C:= C + CC;
    D:= D + DD;

  end; // For loop := 0 to (Int...

  // Re-order ABCD
  A:= REORDER(A);
  B:= REORDER(B);
  C:= REORDER(C);
  D:= REORDER(D);

  Result:= Result
  + inttohex(A, 8)
  + inttohex(B, 8)
  + inttohex(C, 8)
  + inttohex(D, 8);

  MyBuffer:= '';
end;

function SecToString(const Duration: Integer): String;
{ Takes an integer number of seconds and returns a nice }
{ string of days, hours, mins and secs.                 }
var
  Min, Hour, Day, TempDuration: Integer;
  Word, Temp: String;
begin
  TempDuration:= Duration;
  if TempDuration >= 86400 then
     begin
       Day:= TempDuration div 86400;
       TempDuration:= TempDuration - (86400 * Day);
       if Day = 1 then
          Word:= ' Day, '
       else
          Word:= ' Days, ';
       Temp:= IntToStr(Day) + Word;
     end;
  if TempDuration >= 3600 then
     begin
       Hour:= TempDuration div 3600;
       TempDuration:= TempDuration - (3600 * Hour);
       if Hour = 1 then
          Word:= ' Hour, '
       else
          Word:= ' Hours, ';
       Temp:= Temp + IntToStr(Hour) + Word;
     end;
  if TempDuration >= 60 then
     begin
       Min:= TempDuration div 60;
       TempDuration:= TempDuration - (60 * Min);
       if Min = 1 then
          Word:= ' Min, '
       else
          Word:= ' Mins, ';
       Temp:= Temp + IntToStr(Min) + Word;
     end;
  Temp:= Temp + IntToStr(TempDuration) + ' Sec';

  Result:= Temp;
end;

end.
