# Remote build workflow for Delphi 13 / Windows VM

This file documents the exact workflow to use from a Mac host to connect to the Windows VM, pull the project, compile it by command line, and then fix compiler errors remotely.

## 1) Prepare the Windows VM

Start the VM and log in to Windows. Open an elevated PowerShell prompt.

### 1.1 Install and start OpenSSH Server

```powershell
Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
New-NetFirewallRule -DisplayName 'OpenSSH' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 22
```

### 1.2 Create the Windows user used for remote access

```powershell
net user emuloader StrongPassword123! /add
net localgroup Administrators emuloader /add
```

If you will use the current Windows user instead, keep the same user already logged in and use that name.

### 1.3 Configure the SSH public key

On the Mac host, generate the key:

```bash
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "emuloader-vm" -f ~/.ssh/emuloader_vm -N ""
cat ~/.ssh/emuloader_vm.pub
```

Copy the printed public key and then in Windows, as Administrator, create the file:

```powershell
@'
<paste the public key here>
'@ | Set-Content C:\\ProgramData\\ssh\\administrators_authorized_keys
```

Then repair the permissions:

```powershell
icacls C:\ProgramData\ssh\administrators_authorized_keys /inheritance:r
icacls C:\ProgramData\ssh\administrators_authorized_keys /grant:r "Administrators:F"
icacls C:\ProgramData\ssh\administrators_authorized_keys /grant:r "SYSTEM:F"
Restart-Service sshd
```

Important: Windows OpenSSH may use `C:\ProgramData\ssh\administrators_authorized_keys` instead of `%USERPROFILE%\.ssh\authorized_keys` when connected as an administrator user. This is the correct file to use in this environment.

## 2) Check the VM IP address

From the VM command prompt, run:

```cmd
ipconfig
```

Look at the IPv4 address, for example:

```text
10.211.55.16
```

## 3) Connect from the Mac host

### 3.1 Direct connection

```bash
ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16
```

Use the correct Windows username instead of `moreno` if needed.

### 3.2 Optional SSH alias

Edit `~/.ssh/config`:

```sshconfig
Host emuloader-vm
  HostName 10.211.55.16
  User moreno
  IdentityFile ~/.ssh/emuloader_vm
```

Then use:

```bash
ssh emuloader-vm
```

## 4) Clone or update the repository in the VM

Once connected via SSH, enter the Windows session and clone the repo.

If the repository is not present yet:

```bat
git clone <repo-ssh-url> Emuloader
```

If the repository already exists:

```bat
cd %USERPROFILE%\Emuloader
git pull
```

## 5) Build the Delphi 12/13 project without opening the IDE

From the repo folder, run:

```bat
cd %USERPROFILE%\Emuloader\emuloader12
build.bat
```

The script automatically looks for the newest Delphi install in the standard Embarcadero directories and invokes `msbuild`.

If you want a raw command instead of the helper script:

```bat
call "C:\Program Files\Embarcadero\Studio\<version>\bin\rsvars.bat"
cd %USERPROFILE%\Emuloader\emuloader12
msbuild source\EmuLoader.dproj /t:Build /p:Config=Debug /p:Platform=Win32 /v:minimal
```

## 6) Collect the compiler output

The build should run in console mode and produce the list of errors. Save the output in a log file if needed:

```bat
build.bat > build.log 2>&1
```

Then read the log:

```bat
type build.log
```

## 7) Fix the project from the remote session

The build will fail on the first compiler/build error. The flow is:

1. inspect the failing unit or form
2. fix the compatibility issue in the source tree
3. commit the change locally in the VM
4. rerun `build.bat`
5. continue until the project builds cleanly

This is the recommended cycle for Delphi legacy projects that rely on custom VCL components and older packages.

## 8) Typical command sequence

This is the shortest reusable sequence for the remote workflow:

```bat
ipconfig
ssh -i ~/.ssh/emuloader_vm moreno@10.211.55.16
cd %USERPROFILE%
if exist Emuloader (cd Emuloader & git pull) else (git clone <repo-ssh-url> Emuloader)
cd %USERPROFILE%\