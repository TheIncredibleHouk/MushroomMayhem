Map_PrepareLevel:
	LDA World_Map_X
	ORA World_Map_XHi
	STA DAIZ_TEMP1

	LDA World_Map_Y
	LSR A
	LSR A
	LSR A
	LSR A
	STA DAIZ_TEMP2

	LDX #$00

NextPointerSearch:
	LDA DAIZ_TEMP1
	CMP MapPointers+1, X
	BNE PointerNotFound

	LDA DAIZ_TEMP2
	CMP MapPointers+2,X
	BEQ PointerFound
	
	ORA #$80
	CMP MapPointers+2,X
	BNE PointerNotFound

PointerFound:
	LDA MapPointers, X
	; CMP CheckPoint_Flag
	; BEQ Skip_CheckPoint_Clear

	; LDA #$00
	; STA CheckPoint_Flag

	; LDA MapPointers, X

Skip_CheckPoint_Clear:	
	STA LevelLoadPointer
	STA LevelNumber
	STA Entering_From_Map

	LDA #$01
	STA Level_Redraw

	LDA #$00
	STA Level_KeepObjects
	RTS

PointerNotFound:
	INX
	INX
	INX
	JMP NextPointerSearch
	RTS		 ; Return


Tile_Mem_Clear:	; A40E
	; The following loop clears all of the tile memory space to $02 (an all-black tile)
	LDY #$F0

PRG012_A410:
	LDA #$00
	DEY	
	
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	
	CPY #$00
	BNE PRG012_A410	 ; If Y <> $F0, loop! (increments happen in ClearA)

	RTS		 ; Return
