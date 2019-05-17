@echo off
cd "F:\ROM Hacking\Mario Adventure 3\SMB3"
..\nesasm.exe smb3.asm
cd ..
RomMerger.exe
pause