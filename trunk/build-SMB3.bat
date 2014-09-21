@echo off
cd "F:\ROM Hacking\Mario Adventure 3\SMB3"
..\nesasm.exe smb3.asm
cd ..
RomMerger.exe "SMB3\smb3.nes" "MarioAdventure3.nes"
pause