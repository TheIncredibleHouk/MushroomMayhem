@echo off
cd SMB3
..\nesasm.exe smb3.asm
cd ..
RomMerger.exe "SMB3\smb3.nes" "MarioAdventure3.nes"
pause