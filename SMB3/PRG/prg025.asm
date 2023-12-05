
Video_Upd_Table2:
	.word Graphics_Buffer		; $00 - Graphics buffer for dynamically generated content
	.word Title_Clear
	.word Title_Attributes	; $01 - Loads palette for title screen (and falls into Title_Checkerboard_Floor)
	.word Title_Subtitle
	.word Title_FadeIn_1		; $03 - Title screen colors fade in part 1
	.word Title_FadeIn_2		; $04 - Title screen colors fade in part 2
	.word Title_FadeIn_3		; $05 - Title screen colors fade in part 3
	.word Title_FadeIn_4		; $06 - Title screen colors fade in part 4
	.word Title_FadeIn_5		; $07 - Loads the 1P/2P select menu
	.word Title_NewGameOnly
	.word Title_Continue
	.word Title_NewGame
	.word Title_ConfirmNo
	.word Title_ConfirmYes
	.word Title_WorldSelect

	
	; Falls into...
Title_Clear:
	vaddr $2300
	.byte $40
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte 00
	
Title_Attributes:
	vaddr $23C0
	.byte 32
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %11111111, %00000000, %01100110, %01110111, %11111111, %00000000
	.byte %01000100, %10011001, %00000000, %01110111, %10011001, %11001100, %01110111, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

	vaddr $23E0
	.byte 32
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte 00

Title_Subtitle:
	vaddr $21AC
	.byte $06
	.byte $D4, $D5, $D6, $D7, $D8, $D9

	vaddr $21CC
	.byte $06
	.byte $FE, $DA, $DB, $DC, $DD, $FE

	vaddr $21EC
	.byte $06
	.byte $FE, $DA, $DB, $DC, $DD, $FE

	vaddr $220C
	.byte $06
	.byte $FE, $FA, $FB, $FC, $FD, $FE

	vaddr $222C
	.byte $06
	.byte $F4, $F5, $F6, $F7, $F8, $F9
	.byte $00
	
Title_FadeIn_1:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_2:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $00, $0F, $00, $01, $00, $0F, $00, $0A, $00, $0F, $00, $08, $00, $0F, $00, $06
	.byte $00, $0F, $00, $01, $00, $0F, $00, $0A, $00, $0F, $00, $08, $00, $0F, $00, $06
	.byte $00	; Terminator

Title_FadeIn_3:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $10, $11, $10, $0F, $10, $1A, $10, $0F, $10, $18, $10, $0F, $10, $16
	.byte $10, $0F, $10, $11, $10, $0F, $10, $1A, $10, $0F, $10, $18, $10, $0F, $10, $16
	.byte $00	; Terminator

Title_FadeIn_4:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $20, $21, $10, $0F, $20, $1A, $10, $0F, $20, $28, $10, $0F, $20, $16
	.byte $10, $0F, $20, $21, $10, $0F, $20, $1A, $10, $0F, $20, $28, $10, $0F, $20, $16
	.byte $00	; Terminator

Title_FadeIn_5:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $30, $21, $10, $0F, $30, $1A, $10, $0F, $30, $28, $10, $0F, $30, $16
	.byte $10, $0F, $30, $21, $10, $0F, $30, $1A, $10, $0F, $30, $28, $10, $0F, $30, $16
	.byte $00	; Terminator

Title_Continue:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $6C, $6D, $6B, $6E, $7A
	
	vaddr $22EB
	.byte 08
	.byte $99, $9A, $9B, $FE, $9C, $9D, $9E, $9A
	.byte 00

Title_NewGame:
	vaddr $22AB
	.byte 08
	.byte $89, $8A, $8B, $8C, $8D, $8B, $8E, $9A
	
	vaddr $22EB
	.byte 08
	.byte $79, $7A, $7B, $FE, $7C, $7D, $7E, $7A
	.byte 00


Title_NewGameOnly:
	vaddr $22AB
	.byte 08
	.byte $79, $7A, $7B, $FE, $7C, $7D, $7E, $7A

	vaddr $22EB
	.byte 08
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte 00	

Title_ConfirmNo:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $1F, $6D, $7F, $0E, $1E

	vaddr $22EB
	.byte 08
	.byte $FE, $2E, $9A, $2F, $FE, $79, $6A, $FE
	.byte 00	

Title_ConfirmYes:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $1F, $6D, $7F, $0E, $1E

	vaddr $22EB
	.byte 08
	.byte $FE, $8F, $7A, $6F, $FE, $8B, $8A, $FE
	.byte 00	

Title_WorldSelect:
	vaddr $232B
	.byte 08
	.byte $7B, $6A, $7F, $BE, $BF, $FE, $FE, $FE
	.byte $00
