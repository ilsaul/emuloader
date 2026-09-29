unit ZipForge;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Zip;

type
  TZFArchiveItem = record
    FileName: string;
    StoredPath: string;
    CRC: Cardinal;
    UncompressedSize: Int64;
    ExternalFileAttributes: Cardinal;
  end;

  TZFProcessOperation = (poExtract);
  TZFAction = (fxaAbort);
  TZFProcessFileFailure = procedure(Sender: TObject; FileName: string;
    Operation: TZFProcessOperation; NativeError, ErrorCode: Integer;
    ErrorMessage: string; var Action: TZFAction) of object;

  TZipForge = class(TComponent)
  private
    FArchive: TZipFile;
    FFileName: string;
    FSearchIndex: Integer;
    FSearchAttributes: Integer;
    FOnProcessFileFailure: TZFProcessFileFailure;
    function GetActive: Boolean;
    function GetFileCount: Integer;
    procedure SetActive(Value: Boolean);
    function NextItem(var Item: TZFArchiveItem): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OpenArchive(Mode: Integer);
    procedure CloseArchive;
    procedure ExtractToStream(const EntryName: string; Destination: TStream);
    function FindFirst(const Mask: string; var Item: TZFArchiveItem;
      Attributes: Integer = faAnyFile): Boolean;
    function FindNext(var Item: TZFArchiveItem): Boolean;
    property Active: Boolean read GetActive write SetActive;
    property FileCount: Integer read GetFileCount;
  published
    property FileName: string read FFileName write FFileName;
    property OnProcessFileFailure: TZFProcessFileFailure
      read FOnProcessFileFailure write FOnProcessFileFailure;
  end;

implementation

constructor TZipForge.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FArchive := TZipFile.Create;
end;

destructor TZipForge.Destroy;
begin
  FArchive.Free;
  inherited Destroy;
end;

function TZipForge.GetActive: Boolean;
begin
  Result := FArchive.Mode <> zmClosed;
end;

procedure TZipForge.SetActive(Value: Boolean);
begin
  if Value then
  begin
    if not Active then
      OpenArchive(fmOpenRead or fmShareDenyNone);
  end
  else
    CloseArchive;
end;

function TZipForge.GetFileCount: Integer;
begin
  Result := FArchive.FileCount;
end;

procedure TZipForge.OpenArchive(Mode: Integer);
begin
  if Active then
    CloseArchive;
  if (Mode and $0003) <> fmOpenRead then
    raise EZipException.Create('Only read-only ZIP archives are supported');
  FArchive.Open(FFileName, zmRead);
  FSearchIndex := 0;
end;

procedure TZipForge.CloseArchive;
begin
  if Active then
    FArchive.Close;
end;

function TZipForge.FindFirst(const Mask: string; var Item: TZFArchiveItem;
  Attributes: Integer): Boolean;
begin
  if not Active then
    raise EZipException.Create('ZIP archive is not open');
  FSearchIndex := 0;
  FSearchAttributes := Attributes;
  // The application uses '*' and '*.*' to enumerate every archive entry.
  if (Mask <> '*') and (Mask <> '*.*') then
    raise EZipException.CreateFmt('Unsupported ZIP search mask: %s', [Mask]);
  Result := NextItem(Item);
end;

function TZipForge.FindNext(var Item: TZFArchiveItem): Boolean;
begin
  if not Active then
    raise EZipException.Create('ZIP archive is not open');
  Result := NextItem(Item);
end;

function TZipForge.NextItem(var Item: TZFArchiveItem): Boolean;
var
  EntryName: string;
  Header: TZipHeader;
  Separator: Integer;
  IsDirectory: Boolean;
begin
  while FSearchIndex < FArchive.FileCount do
  begin
    EntryName := StringReplace(FArchive.FileName[FSearchIndex], '/', '\',
      [rfReplaceAll]);
    Header := FArchive.FileInfo[FSearchIndex];
    Inc(FSearchIndex);
    IsDirectory := (EntryName <> '') and
      (EntryName[Length(EntryName)] = '\');
    if IsDirectory and ((FSearchAttributes and faDirectory) = 0) then
      Continue;
    Separator := LastDelimiter('\', EntryName);
    Item.StoredPath := Copy(EntryName, 1, Separator);
    Item.FileName := Copy(EntryName, Separator + 1, MaxInt);
    Item.CRC := Header.CRC32;
    Item.UncompressedSize := Header.UncompressedSize;
    // ZIP stores DOS file attributes in the upper word of the external attributes.
    Item.ExternalFileAttributes := (Header.ExternalAttributes shr 16) and $FF;
    if IsDirectory then
      Item.ExternalFileAttributes := Item.ExternalFileAttributes or faDirectory;
    Result := True;
    Exit;
  end;
  Result := False;
end;

procedure TZipForge.ExtractToStream(const EntryName: string; Destination: TStream);
var
  Index: Integer;
  Name: string;
  Data: TBytes;
  Action: TZFAction;
  I: Integer;
begin
  if not Active then
    raise EZipException.Create('ZIP archive is not open');
  Index := -1;
  for I := 0 to FArchive.FileCount - 1 do
  begin
    Name := StringReplace(FArchive.FileName[I], '/', '\', [rfReplaceAll]);
    if SameText(Name, EntryName) or
      ((Pos('\', EntryName) = 0) and SameText(ExtractFileName(Name), EntryName)) then
    begin
      Index := I;
      Break;
    end;
  end;
  if Index < 0 then
    raise EZipException.CreateFmt('ZIP entry not found: %s', [EntryName]);
  try
    FArchive.Read(Index, Data);
    if Length(Data) > 0 then
      Destination.WriteBuffer(Data[0], Length(Data));
  except
    on E: EZipException do
    begin
      if Assigned(FOnProcessFileFailure) then
      begin
        Action := fxaAbort;
        FOnProcessFileFailure(Self, EntryName, poExtract, 0, 0, E.Message, Action);
      end;
      raise;
    end;
  end;
end;

end.
