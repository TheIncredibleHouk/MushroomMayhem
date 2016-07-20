; Super Mario Bros. 3 Full Disassembly by Southbird 2012
; For more info, see http://www.sonicepoch.com/sm3mix/
;
; PLEASE INCLUDE A CREDIT TO THE SOUTHBIRD DISASSEMBLY
; AND THE ABOVE LINK SOMEWHERE IN YOUR WORKS :)
;
; Original disassembler source generated by DCC6502 version v1.4
; (With labels, comments, and some syntax corrections for nesasm by Southbird)
; For more info about DCC6502, e-mail veilleux@ameth.org
;
; This source file last updated: 2011-11-18 21:50:34.000000000 -0600
; Distribution package date: Fri Apr  6 23:46:16 UTC 2012
;---------------------------------------------------------------------------
Tile_Layout_TS0:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; RegEx S&R to replace addresses with tile counts (works from $A000-$A...)
	; \$A.(.)(.) - \$A..(.)
	; Tiles $\1\2 - $\1\3

	; Upper left 8x8 pattern per tile
	.byte $88, $DC, $FF, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C ; Tiles $00 - $0F
	.byte $8C, $8C, $8C, $8C, $8C, $8C, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $88, $DC, $FE, $CF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $5C, $FC, $FD, $FF, $FE ; Tiles $40 - $4F
	.byte $90, $0C, $0C, $0C, $B6, $58, $B6, $4B, $4A, $4A, $4B, $FE, $4A, $4A, $4A, $60 ; Tiles $50 - $5F
	.byte $68, $50, $54, $FE, $56, $FF, $FE, $C4, $04, $2E, $64, $FF, $FF, $FF, $FF, $FF ; Tiles $60 - $6F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $88, $DC, $9F, $9E, $AC, $9E, $9E, $10, $10, $10, $9B, $9F, $9B, $10, $10, $10 ; Tiles $80 - $8F
	.byte $9F, $9F, $10, $9F, $9B, $10, $10, $9B, $10, $AC, $9D, $9E, $9E, $9B, $9F, $10 ; Tiles $90 - $9F
	.byte $9F, $AC, $9E, $9E, $9B, $9F, $99, $9F, $10, $9F, $9E, $10, $10, $94, $10, $10 ; Tiles $A0 - $AF
	.byte $10, $32, $36, $D4, $00, $10, $10, $9B, $10, $9B, $9E, $08, $E0, $2A, $16, $AC ; Tiles $B0 - $BF
	.byte $88, $DC, $BE, $BE, $BE, $BE, $FE, $47, $FE, $B1, $70, $72, $78, $7A, $BE, $21 ; Tiles $C0 - $CF
	.byte $BE, $3A, $BE, $47, $3F, $FC, $BE, $FE, $FF, $FE, $FE, $FE, $FE, $FE, $FE, $60 ; Tiles $D0 - $DF
	.byte $90, $21, $6C, $68, $B6, $D0, $26, $FE, $A8, $58, $12, $C4, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $89, $DD, $FF, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $BE, $BE, $BE ; Tiles $00 - $0F
	.byte $BE, $BE, $BE, $BE, $BE, $BE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $89, $DD, $FE, $CF, $FE, $E1, $FE, $E1, $FE, $E1, $E1, $5D, $FC, $FD, $CE, $CE ; Tiles $40 - $4F
	.byte $91, $0D, $0D, $0D, $B7, $59, $B7, $48, $4A, $49, $4D, $4C, $49, $4A, $4A, $61 ; Tiles $50 - $5F
	.byte $BB, $51, $55, $42, $56, $42, $E1, $C5, $05, $2F, $65, $FF, $FF, $FF, $FF, $FF ; Tiles $60 - $6F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $89, $DD, $96, $97, $99, $1E, $10, $1E, $97, $97, $99, $97, $99, $1E, $1E, $1E ; Tiles $80 - $8F
	.byte $1E, $1E, $1E, $97, $AE, $96, $96, $99, $97, $9B, $97, $1E, $97, $99, $1E, $97 ; Tiles $90 - $9F
	.byte $97, $AE, $96, $96, $99, $1E, $AE, $95, $96, $96, $1E, $95, $C2, $9C, $C2, $C2 ; Tiles $A0 - $AF
	.byte $1E, $33, $37, $D5, $01, $1E, $1E, $84, $C2, $84, $95, $09, $E2, $2B, $17, $AE ; Tiles $B0 - $BF
	.byte $89, $DD, $BE, $1A, $45, $20, $3E, $BE, $B0, $B2, $74, $76, $7C, $7E, $BE, $FE ; Tiles $C0 - $CF
	.byte $45, $3B, $BE, $BE, $BE, $FC, $BE, $FE, $FF, $FE, $E1, $FE, $E1, $FE, $E1, $61 ; Tiles $D0 - $DF
	.byte $91, $23, $6D, $BB, $B7, $D1, $27, $CE, $A9, $59, $13, $C5, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $8A, $DE, $FF, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D ; Tiles $00 - $0F
	.byte $8D, $8D, $8D, $8D, $8D, $8D, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $8A, $DE, $FE, $CF, $FE, $FE, $C0, $FE, $C0, $FE, $C0, $5E, $FC, $FD, $FF, $FE ; Tiles $40 - $4F
	.byte $92, $0E, $0E, $0E, $B8, $5A, $B8, $4A, $4B, $4A, $4A, $FE, $4B, $4A, $4A, $62 ; Tiles $50 - $5F
	.byte $69, $52, $54, $FE, $57, $FF, $FE, $C6, $06, $30, $66, $FF, $FF, $FF, $FF, $FF ; Tiles $60 - $6F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $8A, $DE, $9C, $9D, $9D, $9D, $AD, $11, $11, $11, $9C, $9A, $11, $11, $9A, $9C ; Tiles $80 - $8F
	.byte $11, $9C, $9C, $11, $11, $11, $9A, $11, $9A, $9E, $AD, $9D, $9D, $9A, $11, $9C ; Tiles $90 - $9F
	.byte $9C, $9D, $9D, $AD, $9C, $9A, $9C, $98, $9C, $11, $86, $C1, $11, $97, $11, $C1 ; Tiles $A0 - $AF
	.byte $C1, $34, $38, $D6, $02, $C1, $11, $11, $9A, $9A, $86, $0A, $EF, $2C, $1C, $AD ; Tiles $B0 - $BF
	.byte $8A, $DE, $BE, $BE, $BE, $BE, $46, $FE, $FE, $B4, $71, $73, $79, $7B, $19, $BE ; Tiles $C0 - $CF
	.byte $41, $3C, $41, $25, $BE, $FC, $BE, $FE, $FF, $FE, $FE, $C0, $FE, $C0, $C0, $62 ; Tiles $D0 - $DF
	.byte $92, $24, $6E, $69, $B8, $D2, $28, $FE, $AA, $5A, $14, $C6, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $8B, $DF, $FF, $8F, $A4, $A5, $A6, $A7, $C8, $C9, $CA, $CB, $BF, $8F, $A4, $A5 ; Tiles $00 - $0F
	.byte $A6, $A7, $C8, $C9, $CA, $CB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $8B, $DF, $FE, $CF, $CD, $E1, $C0, $CD, $CD, $E1, $CD, $5F, $FC, $FD, $CE, $CE ; Tiles $40 - $4F
	.byte $93, $0F, $0F, $0F, $B9, $5B, $B9, $FE, $4F, $49, $4A, $49, $48, $4A, $4A, $63 ; Tiles $50 - $5F
	.byte $BD, $53, $55, $43, $57, $43, $CD, $C7, $07, $31, $67, $FF, $FF, $FF, $FF, $FF ; Tiles $60 - $6F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $8B, $DF, $95, $94, $1F, $1F, $98, $94, $1F, $94, $94, $98, $1F, $1F, $98, $1F ; Tiles $80 - $8F
	.byte $1F, $1F, $94, $1F, $95, $95, $AF, $94, $98, $94, $9A, $94, $1F, $98, $94, $1F ; Tiles $90 - $9F
	.byte $94, $95, $95, $AF, $1F, $98, $96, $AF, $95, $95, $C1, $87, $C2, $9F, $C3, $C3 ; Tiles $A0 - $AF
	.byte $C1, $35, $39, $D7, $03, $C3, $C3, $C2, $85, $85, $87, $0B, $FA, $2D, $1D, $AF ; Tiles $B0 - $BF
	.byte $8B, $DF, $18, $1B, $44, $BE, $BE, $22, $B3, $B5, $75, $77, $7D, $7F, $40, $44 ; Tiles $C0 - $CF
	.byte $FE, $3D, $22, $BE, $BE, $FC, $BE, $FE, $FF, $CD, $E1, $C0, $CD, $CD, $CD, $63 ; Tiles $D0 - $DF
	.byte $93, $46, $6F, $BD, $B9, $D3, $29, $CE, $AB, $5B, $15, $C7, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS0:
	; These are defining base ranges to check if a tile is "enterable" on the map
	; Essentially, for a given "range" of tile on the map ($00, $40, $80, $C0),
	; the corresponding value is indexed (take the previous value >> 6) and returns
	; a "quick failure", i.e. "You're standing on a tile in [that range] and it
	; has a value less than [retrieved from below]; you can't possibly enter it!"

	; NOTE: The pool and star are both "enterable"...
	.byte TILE_PANEL1, TILE_FORT, $FF, $FF; TILE_POOL, TILE_WORLD5STAR

	; These values (equivalent to above) also pulled in via Level_Tileset_LUT??
	.byte TILE_PANEL1, TILE_FORT, $FF, $FF; TILE_POOL, TILE_WORLD5STAR

	.byte $20, $0E, $A4, $4C, $B7, $97

Tile_Mem_Clear:	; A40E
	; The following loop clears all of the tile memory space to $02 (an all-black tile)
	LDY #$00	
PRG012_A410:
	LDA #$00	
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0	 
	BNE PRG012_A410	 ; If Y <> $F0, loop! (increments happen in ClearA)

	RTS		 ; Return

Map_Tile_ColorSets:
	.byte $00, $01, $00, $03, $04, $05, $06, $07, $02

Map_Object_ColorSets:
	.byte $08, $08, $08, $08, $08, $08, $08, $09, $08


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_Reload_with_Completions
;
; This very important subroutine actually loads in the map layout
; data and sets level panels which have been previously completed
; to their proper state (e.g. M/L for level panels, crumbled fort)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			; I placed this here to insure maps don't move. Critical #DAHRKDAIZ
	.org $A598
Map_Tile_Layouts:
	; This points to the layout data for each world's map tile layout
	.word W1_Map_Layout, W2_Map_Layout, W3_Map_Layout, W4_Map_Layout, W5_Map_Layout
	.word W6_Map_Layout, W7_Map_Layout, W8_Map_Layout, W9_Map_Layout


	; Each world's layout; very simple data, specifies a linear list of tile bytes.
	; Every 144 bytes form a 16x9 single screen of world map.
	; The stream is terminated by $FF
W1_Map_Layout:	.include "PRG/maps/World1L"
W2_Map_Layout:	.include "PRG/maps/World2L"
W3_Map_Layout:	.include "PRG/maps/World3L"
W4_Map_Layout:	.include "PRG/maps/World4L"
W5_Map_Layout:	.include "PRG/maps/World5L"
W6_Map_Layout:	.include "PRG/maps/World6L"
W7_Map_Layout:	.include "PRG/maps/World7L"
W8_Map_Layout:	.include "PRG/maps/World8L"
W9_Map_Layout:	.include "PRG/maps/World9L"

; FIXME: Anybody want to claim this? Is this part of the above?
; $B0F3
	.byte $4A, $44, $47, $48, $AE, $AF, $B5, $B6, $DE, $D9, $DC, $DD
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_PrepareLevel
;
; Based on what spot of the map you entered, figure out which "level"
; you're entering ("level" means any enterable spot on the map including
; bonus games, etc.)
;
; The ultimate output is properly configured
; Level_ObjPtr_AddrL/H and Level_ObjPtrOrig_AddrL/H (object list pointer)
; Level_LayPtr_AddrL/H and Level_LayPtrOrig_AddrL/H (tile layout pointer)
; Level_Tileset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DO MAP POINTERS
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
	STA LevelLoadPointer
	STA LevelNumber

	LDA #$01
	STA Level_Redraw

	LDA #$00
	STA Level_KeepObjects

	LDA MapPointers+2,X
	AND #$80
	STA UseAltEntrance
	RTS

PointerNotFound:
	INX
	INX
	INX
	JMP NextPointerSearch
	RTS		 ; Return

KingsRoomLayout_ByWorld:
	.word KNG1L	; World 1
	.word KNG2L	; World 2
	.word KNG3L	; World 3
	.word KNG4L	; World 4
	.word KNG5L	; World 5
	.word KNG6L	; World 6
	.word KNG7L	; World 7
	.word KNG1L	; World 8 (??)

KingsRoomObjLayout:
	.word Empty_ObjLayout


PRG012_B262:

	; Falling into King's room...

	LDA World_Num
	ASL A		
	TAX		 ; X = World_Num * 2 (2 byte index)

	LDA KingsRoomLayout_ByWorld,X
	STA <Level_LayPtr_AddrL
	LDA KingsRoomLayout_ByWorld+1,X
	STA <Level_LayPtr_AddrH

	LDA KingsRoomObjLayout
	STA <Level_ObjPtr_AddrL
	LDA KingsRoomObjLayout+1
	STA <Level_ObjPtr_AddrH

	; King's room tile set
	LDA #$02
	STA Level_Tileset

	RTS		 ; Return

	; Airship jump addresses for the map object version
Airship_Layouts:
	.word W1AirshipL
	.word W2AirshipL
	.word W3AirshipL
	.word W4AirshipL
	.word W5AirshipL
	.word W6AirshipL
	.word W7AirshipL
	.word W8AirshipL

Airship_Objects:
	.word W1AirshipO
	.word W2AirshipO
	.word W3AirshipO
	.word W4AirshipO
	.word W5AirshipO
	.word W6AirshipO
	.word W7AirshipO
	.word W8AirshipO


MO_Airship:
	LDA World_Num	; Get world number
	ASL A		 ; Turn into 2-byte index
	TAY		 ; -> 'Y'

	; Get proper airship layout
	LDA Airship_Layouts,Y
	STA <Level_LayPtr_AddrL
	LDA Airship_Layouts+1,Y
	STA <Level_LayPtr_AddrH

	; Get proper airship object set pointer
	LDA Airship_Objects,Y
	STA <Level_ObjPtr_AddrL
	LDA Airship_Objects+1,Y
	STA <Level_ObjPtr_AddrH

	; Force Level_Tileset = 10 (Airship)
	LDA #10
	STA Level_Tileset

	RTS		 ; Return

MO_Unused:
	; Tries to queue Hammer Bro battle music, but doesn't
	; really work, winds up being like no override at all

	; NOTE: The only difference is World_EnterState will
	; fail to be set to 3, which causes no discernable 
	; effect in SMB3-US, but probably would break the 
	; world entry "outro" in the original SMB3-J

	RTS		 ; Return

MO_NSpade:
	; Level_Tileset = 15 (Bonus game intro)
	LDA #15
	STA Level_Tileset

	; Bonus_GameType = 2 (N-Spade)
	LDA #$02
	STA Bonus_GameType

	LDY #$00
	STY Bonus_KTPrize	; !!
	STY Bonus_GameHost	; Standard Toad Host


	; NOTE: This was probably going to vary by game type, 
	; but in final version, Y = 0 (see PRG022 for more)

	; Bonus game layout
	LDA Bonus_LayoutData,Y
	STA <Level_LayPtr_AddrL
	LDA Bonus_LayoutData+1,Y
	STA <Level_LayPtr_AddrH	

	; World_EnterState = 3
	LDA #$03
	STA World_EnterState

	RTS		 ; Return

	; White Toad House layouts
ToadShop_Layouts:
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL
	.word TOAD_SpecL

	; White Toad House configuration
	; NOTE: This is NOT actually an object layout pointer (which is always fixed in Toad Houses), 
	; this just defines what is in the lone chest in white Toad Houses (P-Wing / Anchor)
ToadShop_Objects:
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00

MO_Shop:
	LDA World_Num	; Get world number
	ASL A		 ; Turn into 2-byte index
	TAY		 ; -> 'Y'

	; Load proper Toad Shop layout
	LDA ToadShop_Layouts,Y
	STA <Level_LayPtr_AddrL
	LDA ToadShop_Layouts+1,Y
	STA <Level_LayPtr_AddrH	

	; Load proper Toad Shop object set
	LDA ToadShop_Objects,Y
	STA <Level_ObjPtr_AddrL
	LDA ToadShop_Objects+1,Y
	STA <Level_ObjPtr_AddrH	

	; Level_Tileset = 7 (Toad House)
	LDA #$07
	STA Level_Tileset

	RTS		 ; Return

	; Possibly thinking of having per-world coin ships?
CoinShip_Layouts:
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL

CoinShip_Objects:
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO

MO_CoinShip:
	LDA World_Num	; Get world number
	ASL A		 ; Turn into 2-byte index
	TAY		 ; -> 'Y'

	; Get coin ship layout
	LDA CoinShip_Layouts,Y
	STA <Level_LayPtr_AddrL
	LDA CoinShip_Layouts+1,Y
	STA <Level_LayPtr_AddrH	

	; Get coin ship objects
	LDA CoinShip_Objects,Y
	STA <Level_ObjPtr_AddrL
	LDA CoinShip_Objects+1,Y
	STA <Level_ObjPtr_AddrH	

	; Set Level_Tileset = 10 (Airship)
	LDA #10
	STA Level_Tileset

	RTS		 ; Return


	; Wonder what this might have been?
	; Just goes to World 7-5 underground now...
UnusedMapObj_Layout:	.word W705_UnderL
UnusedMapObj_Objects:	.word W705_UnderO

MO_UnusedMapObj:

	; Set the layout
	LDA UnusedMapObj_Layout
	STA <Level_LayPtr_AddrL
	LDA UnusedMapObj_Layout+1
	STA <Level_LayPtr_AddrH

	; Set the objects
	LDA UnusedMapObj_Objects
	STA <Level_ObjPtr_AddrL
	LDA UnusedMapObj_Objects+1
	STA <Level_ObjPtr_AddrH

	; Level_Tileset = 1 (Plains style)
	LDA #$01
	STA Level_Tileset

	RTS		 ; Return


PRG012_B384:
	; Level_Tileset = 15 (Bonus Game intro!)

	; Copy Player map data into "Entered" vars
	LDY Player_Current
	LDA World_Map_Y,Y
	STA Map_Entered_Y,Y
	LDA World_Map_XHi,Y
	STA Map_Entered_XHi,Y
	LDA World_Map_X,Y	
	STA Map_Entered_X,Y	
	LDA Map_UnusedPlayerVal2,Y	
	STA Map_Previous_UnusedPVal2,Y	

	LDA #15
	STA Level_Tileset	 ; Re-affirming Level_Tileset = 15?

	LDY <Temp_Var16		 ; Index of level entered

	; Set Bonus_GameType (always 1 in actual game)
	LDA [Temp_Var5],Y
	STA Bonus_GameType

	; Set Bonus_KTPrize (always irrelevant in actual game)
	LDA [Temp_Var7],Y
	STA Bonus_KTPrize

	INY		 ; Y++

	; Set Bonus_GameHost (always 0 in actual game)
	LDA [Temp_Var5],Y
	STA Bonus_GameHost

	LDA [Temp_Var7],Y
	ASL A
	TAY		 ; -> 'Y'

	LDA Bonus_LayoutData,Y
	STA <Level_LayPtr_AddrL
	LDA Bonus_LayoutData+1,Y
	STA <Level_LayPtr_AddrH

	; World_EnterState = 3
	LDA #$03
	STA World_EnterState

	RTS		 ; Return



	; Each of these has an entry PER WORLD (0-8, Worlds 1-9)

	; This table specifies a lookup for the world that supplies an initial
	; offset value for the following table based on the "XHi" position the
	; Player was on the map.  Obviously for many worlds there is no valid
	; offset value on some of the higher map screens...

Map_ByXHi_InitIndex:
	.word W1_InitIndex, W2_InitIndex, W3_InitIndex, W4_InitIndex, W5_InitIndex, W6_InitIndex, W7_InitIndex, W8_InitIndex, W9_InitIndex

	; This table is initially indexed by the initial offset supplied by Map_ByXHi_InitIndex 
	; and provides a series of map row locations (upper 4 bits) and level tileset (lower 4 bits)
Map_ByRowType:
	.word W1_ByRowType, W2_ByRowType, W3_ByRowType, W4_ByRowType, W5_ByRowType, W6_ByRowType, W7_ByRowType, W8_ByRowType, W9_ByRowType

	; This table just maps the column positions of enterable level tiles
Map_ByScrCol:
	.word W1_ByScrCol, W2_ByScrCol, W3_ByScrCol, W4_ByScrCol, W5_ByScrCol, W6_ByScrCol, W7_ByScrCol, W8_ByScrCol, W9_ByScrCol

	; This table maps the relevant object layout pointers for the levels
Map_ObjSets:
	.word W1_ObjSets, W2_ObjSets, W3_ObjSets, W4_ObjSets, W5_ObjSets, W6_ObjSets, W7_ObjSets, W8_ObjSets, W9_ObjSets

	; This tbale maps the relevant level layout pointers for the levels
Map_LevelLayouts:
	.word W1_LevelLayout, W2_LevelLayout, W3_LevelLayout, W4_LevelLayout, W5_LevelLayout, W6_LevelLayout, W7_LevelLayout, W8_LevelLayout, W9_LevelLayout

	; "Structure" data files -- contains data that links levels to
	; their layout and objects by the rows and columns 
	.include "PRG/maps/World1S"
	.include "PRG/maps/World2S"
	.include "PRG/maps/World3S"
	.include "PRG/maps/World4S"
	.include "PRG/maps/World5S"
	.include "PRG/maps/World6S"
	.include "PRG/maps/World7S"
	.include "PRG/maps/World8S"
	.include "PRG/maps/World9S"


; FIXME: Anybody want to claim this??
; $BC54
	.byte $55, $15, $F5, $56, $25, $D4 ; $BC4A - $BC59
	.byte $F2, $07, $86, $E3, $2B, $F0, $FF, $3F, $00, $80, $FF, $7F, $00, $C0, $FF, $03 ; $BC5A - $BC69
	.byte $00, $F0, $FF, $03, $80, $FF, $62, $81, $FF, $22, $78, $BD, $24, $09, $BD, $DD ; $BC6A - $BC79
	.byte $4A, $08, $FA, $3F, $80, $D5, $4B, $B6, $2A, $2B, $4D, $24, $3F, $E8, $EF, $00 ; $BC7A - $BC89
	.byte $7C, $FF, $05, $00, $FF, $0F, $00, $C0, $FF, $1F, $00, $F0, $FF, $07, $F0, $1F ; $BC8A - $BC99
	.byte $28, $7E, $FE, $07, $00, $E0, $3F, $7E, $E0, $00, $8E, $FF, $00, $FE, $1F, $80 ; $BC9A - $BCA9
	.byte $2E, $FE, $E7, $07, $00, $FF, $8F, $1E, $00, $7E, $A0, $F8, $FF, $03, $00, $FE ; $BCAA - $BCB9
	.byte $A3, $00, $FF, $02, $EF, $7F, $01, $00, $F0, $FF, $07, $80, $FF, $27, $80, $EB ; $BCBA - $BCC9
	.byte $FF, $01, $00, $FD, $7F, $00, $F8, $7F, $02, $2C, $CE, $1F, $04, $46, $FE, $3F ; $BCCA - $BCD9
	.byte $00, $F0, $3F, $70, $BE, $07, $F8, $0B, $44, $8F, $FF, $C0, $7A, $00, $07, $FA ; $BCDA - $BCE9
	.byte $FF, $07, $00, $FC, $3F, $40, $FE, $40, $FF, $1F, $00, $80, $FF, $27, $00, $EC ; $BCEA - $BCF9
	.byte $BF, $7A, $80, $FF, $0B, $00, $FF, $81, $BF, $00, $A7, $42, $FF, $0B, $A0, $EA ; $BCFA - $BD09
	.byte $3F, $E0, $C4, $D1, $ED, $20, $F4, $9F, $00, $F7, $03, $FB, $0B, $E0, $D3, $07 ; $BD0A - $BD19
	.byte $E8, $EA, $57, $00, $7F, $C1, $AF, $78, $01, $A0, $FF, $2F, $E8, $00, $FE, $42 ; $BD1A - $BD29
	.byte $57, $B7, $49, $44, $55, $6D, $AF, $58, $01, $DA, $FF, $15, $80, $AA, $FD, $07 ; $BD2A - $BD39
	.byte $40, $FE, $52, $4B, $75, $2A, $B4, $55, $AB, $26, $A9, $BA, $58, $4A, $DB, $56 ; $BD3A - $BD49
	.byte $95, $D0, $A6, $17, $2B, $D9, $B2, $52, $D5, $92, $DA, $D1, $96, $98, $B4, $4A ; $BD4A - $BD59
	.byte $7B, $27, $89, $6C, $29, $EA, $FD, $0A, $01, $DA, $FE, $17, $00, $F5, $BD, $44 ; $BD5A - $BD69
	.byte $49, $ED, $AD, $04, $69, $FB, $04, $EA, $BD, $54, $92, $D0, $BE, $4B, $92, $DA ; $BD6A - $BD79
	.byte $92, $DA, $A4, $B6, $95, $A4, $AA, $DA, $5A, $12, $D5, $AA, $B7, $24, $29, $B5 ; $BD7A - $BD89
	.byte $AD, $26, $B1, $2D, $A5, $55, $2B, $25, $B5, $DD, $44, $AA, $6A, $2B, $69, $A5 ; $BD8A - $BD99
	.byte $DA, $B6, $24, $A8, $BD, $25, $A9, $B2, $DD, $48, $52, $6D, $AB, $52, $55, $25 ; $BD9A - $BDA9
	.byte $6D, $5B, $49, $AA, $AD, $2A, $49, $6D, $AB, $52, $53, $A5, $B2, $AD, $2A, $55 ; $BDAA - $BDB9
	.byte $55, $49, $6D, $57, $21, $B6  ; $BDBA - $BDBF



; Rest of ROM bank was empty
