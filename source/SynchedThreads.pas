unit SynchedThreads;

// Copyright © 1998 by Jon Shemitz, all rights reserved.
// Permission is hereby granted to freely use, modify, and
// distribute this source code PROVIDED that all six lines of
// this copyright and contact notice are included without any
// changes. Questions? Comments? Offers of work?
// mailto:jon@midnightbeach.com - http://www.midnightbeach.com

{$T+} {$hints on} {$warnings on}

interface

uses Windows, Classes, SysUtils, Forms;

// Simple threads

type
  TThreadMethod = procedure (Data: pointer) of object;
  TSimpleThread =
    class (TThread)
      public
        constructor CreateSimple( CreateSuspended: boolean;
                                  _Action:         TThreadMethod;
                                  _Data:           pointer );
        procedure AbortThread;
      protected
        ThreadMethod: TThreadMethod;
        Data:         pointer;

      private
        procedure  Execute; override;
    end;

function RunInThread( Handler: TThreadMethod;
                      Data:    pointer ): TSimpleThread;

// Wait threads (basic synchronization)

procedure MsgWaitForSingleObject(Handle: THandle);
function SpawnProcess(const Command: string): TProcessInformation;

type
  TWaitThread = class (TSimpleThread)
                  public
                    constructor CreateWait( _Action: TThreadMethod;
                                            _Data:   pointer );
                    procedure WaitFor;
                    procedure MsgWaitFor;
                    procedure AbortThread;
                  private
                    AbortFlag: ^boolean;
                    procedure Run(MsgWait: boolean);
                end;

procedure WaitForThread(    Handler:    TThreadMethod;
                            Data:       pointer );
procedure MsgWaitForThread( var Thread: TWaitThread;
                            Handler:    TThreadMethod;
                            Data:       pointer );

// Stop/start threads

type
  EAbortedThread = class (Exception) end;
  EThreadInUse   = class (Exception) end;

  TStopStartThread =
    class (TSimpleThread)
      public
        Waiting: boolean;
        constructor Create;
        procedure WaitFor(    _Action: TThreadMethod;
                             _Data:    pointer );
        procedure MsgWaitFor( _Action: TThreadMethod;
                             _Data:    pointer );
        procedure AbortThread;
      private
        Event:   THandle;
        Aborted: boolean;
        destructor Destroy; override;
        procedure  Execute; override;
        procedure Run( _Action: TThreadMethod;
                       _Data:   pointer;
                       MsgWait: boolean );
    end;

implementation

// TSimpleThread, RunInThread

constructor TSimpleThread.CreateSimple( CreateSuspended: boolean;
                                        _Action:         TThreadMethod;
                                        _Data:           pointer );
begin
  ThreadMethod    := _Action; // Set these BEFORE calling
  Data            := _Data;   // inherited Create()!
  FreeOnTerminate := True;
  inherited Create(CreateSuspended);
end; // TSimpleThread.Create

procedure  TSimpleThread.Execute;
begin
  ThreadMethod(Data);
end; // TSimpleThread.Execute

procedure TSimpleThread.AbortThread;
begin
  Suspend; // // Can't kill a running thread by Freeing it
  Free;    // Kills thread
end; // TSimpleThread.AbortThread

function RunInThread( Handler: TThreadMethod;
                      Data:    pointer ): TSimpleThread;
begin
  Result := TSimpleThread.CreateSimple(False, Handler, Data);
end; // RunInThread

// Basic synchronization

procedure MsgWaitForSingleObject(Handle: THandle);
begin
  repeat
    if MsgWaitForMultipleObjects( 1, Handle, False,
                                  INFINITE, QS_ALLINPUT)
       = WAIT_OBJECT_0 + 1
      then Application.ProcessMessages
      else BREAK;
  until True = False;
end; // MsgWaitForSingleObject

function SpawnProcess(const Command: string): TProcessInformation;
var
  StartupInfo: TStartupInfo;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), 0); // use defaults
  StartupInfo.cb := SizeOf(StartupInfo);
  CreateProcess( Nil, PChar(Command), Nil, Nil, False, 0, Nil,
                 Nil, StartupInfo, Result );
end; // SpawnProcess

constructor TWaitThread.CreateWait( _Action: TThreadMethod;
                                    _Data:   pointer );
begin
  CreateSimple(True, _Action, _Data); // CreateSuspended
  AbortFlag := Nil;
end; // TWaitThread.CreateWait

procedure TWaitThread.WaitFor;
begin
  Run(False);
end; // TWaitThread.WaitFor

procedure TWaitThread.MsgWaitFor;
begin
  Run(True);
end; // TWaitThread.MsgWaitFor

procedure TWaitThread.Run(MsgWait: boolean);
var
  Aborted: boolean;
begin
  AbortFlag := @ Aborted;
  Aborted   := False;
  Resume;
  if MsgWait
    then MsgWaitForSingleObject(Handle)
    else inherited WaitFor;
  if Aborted then Abort;
end; // TWaitThread.Run

procedure TWaitThread.AbortThread;
begin
  Assert(Assigned(AbortFlag));
  AbortFlag^ := True;
  inherited;
end; // TWaitThread.CreateWait

procedure WaitForThread(    Handler:    TThreadMethod;
                            Data:       pointer );
begin
  TWaitThread.CreateWait(Handler, Data).WaitFor;
end; // WaitForThread

procedure MsgWaitForThread( var Thread: TWaitThread;
                            Handler:    TThreadMethod;
                            Data:       pointer );
begin
  Thread := TWaitThread.CreateWait(Handler, Data);
  Thread.MsgWaitFor;
  Thread := Nil;
end; // MsgWaitForThread

// Stop/start threads

constructor TStopStartThread.Create;
begin
  Event := CreateEvent(Nil, True, False, Nil);
           // API call is smaller and simpler than Delphi wrapper
  Assert(Event <> 0);
  Waiting := False;
  Aborted := False;
  inherited Create(True); // Create a suspended thread
end; // TStopStartThread.Create

destructor TStopStartThread.Destroy;
begin
  CloseHandle(Event);
  inherited;
end; // TStopStartThread.Destroy

procedure  TStopStartThread.Execute;
begin
  while not Terminated do
    begin
    Assert(Assigned(ThreadMethod));
    ThreadMethod(Data);
    SetEvent(Event);
    Suspend;
    end;
end; // TStopStartThread.Execute

procedure TStopStartThread.Run( _Action: TThreadMethod;
                                _Data:   pointer;
                                MsgWait: boolean );
begin
  if Waiting then raise EThreadInUse.Create('Thread in use');
  if Aborted then raise EAbortedThread.Create('Aborted thread');

  ThreadMethod := _Action;
  Data         := _Data;
  Waiting      := True;
  ResetEvent(Event);
  Resume;
  if MsgWait
    then MsgWaitForSingleObject(Event)
    else WaitForSingleObject(Event, INFINITE);
  Waiting := False;
  if Aborted then Abort; // Raise an EAbort exception
end; // TStopStartThread.InternalRun

procedure TStopStartThread.MsgWaitFor( _Action: TThreadMethod;
                                       _Data:   pointer );
begin
  Run(_Action, _Data, True);
end; // TStopStartThread.Run

procedure TStopStartThread.WaitFor( _Action: TThreadMethod;
                                    _Data:   pointer );
begin
  Run(_Action, _Data, False);
end; // TStopStartThread.RunBlocking

procedure TStopStartThread.AbortThread;
begin
  Suspend; // // Can't kill a running thread by Freeing it
  Aborted := True;
  SetEvent(Event);
end; // TStopStartThread.AbortThread

end.
