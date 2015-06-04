//···········································································
// Fast CRC32 calculator
// (c) Aleksandr Sharahov 2009
// Free for any use
//···········································································
// Using:
// function GetZipCRC(BufPtr: pointer; BufLen: integer): cardinal;
// begin;
//   Result:=not ShaCrcRefresh($FFFFFFFF, BufPtr, BufLen);
//   end;
//···········································································

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit ShaCrcUnit;

interface

//For reference only
function ReferenceCrcRefresh(OldCRC: cardinal; BufPtr: pointer; BufLen: integer): cardinal;
//Use this function
function ShaCrcRefresh(OldCRC: cardinal; BufPtr: pointer; BufLen: integer): cardinal;

//···········································································
implementation

var
  tbl: array[0..7] of array[0..255] of cardinal;

//···········································································
function ReferenceCrcRefresh(OldCRC: cardinal; BufPtr: pointer; BufLen: integer): cardinal;
asm
  test edx, edx
  jz @ret
  neg ecx
  jz @ret
  sub edx,ecx
  push ebx

@next:
  movzx ebx, byte [edx + ecx]
  xor bl, al
  shr eax, 8
  xor eax, [ebx*4 + tbl]
  add ecx, 1
  jnz @next

  pop ebx
@ret:
  end;

//···········································································
function ShaCrcRefresh(OldCRC: cardinal; BufPtr: pointer; BufLen: integer): cardinal;
asm
  test edx, edx
  jz   @ret
  neg  ecx
  jz   @ret
  push ebx
@head:
  test dl, 3
  jz   @bodyinit
  movzx ebx, byte [edx]
  inc  edx
  xor  bl, al
  shr  eax, 8
  xor  eax, [ebx*4 + tbl]
  inc  ecx
  jnz  @head
  pop  ebx
@ret:
  ret
@bodyinit:
  sub  edx, ecx
  add  ecx, 8
  jg   @bodydone
  push esi
  push edi
  mov  edi, edx
  mov  edx, eax
@bodyloop:
  mov ebx, [edi + ecx - 4]
  xor edx, [edi + ecx - 8]
  movzx esi, bl
  mov eax, [esi*4 + tbl + 1024*3]
  movzx esi, bh
  xor eax, [esi*4 + tbl + 1024*2]
  shr ebx, 16
  movzx esi, bl
  xor eax, [esi*4 + tbl + 1024*1]
  movzx esi, bh
  xor eax, [esi*4 + tbl + 1024*0]

  movzx esi, dl
  xor eax, [esi*4 + tbl + 1024*7]
  movzx esi, dh
  xor eax, [esi*4 + tbl + 1024*6]
  shr edx, 16
  movzx esi, dl
  xor eax, [esi*4 + tbl + 1024*5]
  movzx esi, dh
  xor eax, [esi*4 + tbl + 1024*4]

  add ecx, 8
  jg  @done 

  mov ebx, [edi + ecx - 4]
  xor eax, [edi + ecx - 8]
  movzx esi, bl
  mov edx, [esi*4 + tbl + 1024*3]
  movzx esi, bh
  xor edx, [esi*4 + tbl + 1024*2]
  shr ebx, 16
  movzx esi, bl
  xor edx, [esi*4 + tbl + 1024*1]
  movzx esi, bh
  xor edx, [esi*4 + tbl + 1024*0]

  movzx esi, al
  xor edx, [esi*4 + tbl + 1024*7]
  movzx esi, ah
  xor edx, [esi*4 + tbl + 1024*6]
  shr eax, 16
  movzx esi, al
  xor edx, [esi*4 + tbl + 1024*5]
  movzx esi, ah
  xor edx, [esi*4 + tbl + 1024*4]

  add ecx, 8
  jle @bodyloop
  mov eax, edx
@done:
  mov edx, edi
  pop edi
  pop esi
@bodydone:
  sub ecx, 8
  jl @tail
  pop ebx
  ret
@tail:
  movzx ebx, byte [edx + ecx];
  xor bl,al;
  shr eax,8;
  xor eax, [ebx*4 + tbl];
  inc ecx;
  jnz @tail;
  pop ebx
  ret
  end;

//···········································································
function CRCInit: boolean;
var
  c: cardinal;
  i, j: integer;
begin;
  for i:=0 to 255 do begin;
    c:=i;
    for j:=1 to 8 do if odd(c)
                     then c:=(c shr 1) xor $EDB88320
                     else c:=(c shr 1);
    tbl[0][i]:=c;
    end;

  for i:=0 to 255 do begin;
    c:=tbl[0][i];
    for j:=1 to 7 do begin;
      c:=(c shr 8) xor tbl[0][byte(c)];
      tbl[j][i]:=c;
      end;
    end;

  Result:= (not ReferenceCrcRefresh($FFFFFFFF, @tbl[0,0], SizeOf(tbl)) = $1A76768F)
             and (not ShaCrcRefresh($FFFFFFFF, @tbl[0,0], SizeOf(tbl)) = $1A76768F);
  end;

//···········································································
initialization
  CRCinit;
  end.

