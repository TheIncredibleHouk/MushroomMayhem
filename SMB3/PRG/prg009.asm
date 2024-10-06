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
; This source file last updated: 2011-11-18 21:50:36.000000000 -0600
; Distribution package date: Fri Apr  6 23:46:16 UTC 2012
;---------------------------------------------------------------------------

	; Number of lives per card combination; mainly to give the 2, 3, 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AutoScroll_Do
;
; Performs all "auto scroll" movements.  This is the
; most obvious effect of levels like 1-4, but more subtle
; as the effect in floating water levels levels like 3-8.
; Any time parts of the playfield are moving and you're
; not doing it, likely it's here...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AutoScroll_Do:
	LDA <Horz_Scroll_Hi
	CMP <Level_Width
	BCS PRG009_B916

	LDA Player_SuitLost	; If Player is NOT losing their power up ...
	ORA Player_Grow		; ... and Player is NOT growing from a mushroom ...
	ORA <Player_HaltGameZ	; ... and the gameplay is NOT halted ...
	BEQ PRG009_B917	 ; ... then jump to PRG009_B917

	; Gameplay is stopped for some reason

	LDA Level_AScrlLimitSel
	CMP #$13
	BLT PRG009_B916	 ; If Level_AScrlLimitSel < $13, jump to PRG009_B916 (RTS)

	; Otherwise, halt timer
	LDA #$80

PRG009_B916:
	RTS		 ; Return

PRG009_B917:

	; Ensure clock is not stopped (?)

	LDA Level_AScrlTimer
	BEQ PRG009_B922	 ; If Level_AScrlTimer = 0, jump to PRG009_B922

	DEC Level_AScrlTimer	 ; Level_AScrlTimer--

PRG009_B922:
	LDA Level_AScrlSelect
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word AutoScroll_Horizontal	; 0 Generally for non-stop horizontal levels, uses movement commands; most complex type
	.word AutoScroll_HorizontalFast	; 1 Same as type zero, except accesses $1x Level_AScrlVar
	.word AutoScroll_LeftFast	; 2 Up-right diagonal used in 5-9
	.word AutoScroll_SpikeCeiling	; 3 Falling spiked ceilings (e.g. World 1 and 2 Mini Fortresses)
	.word AutoScroll_BooRoom	; 4 Used in the last World 6 Fortress, a room of Boos, scrolls up to meet a door
	.word AutoScroll_Floating	; 5 Sinking/rising over water world (e.g. in 3-8)

	; This table is what value (if any) will go into Level_AScrlLoopSel
	; when horizontal auto scroll reaches the end.  A value of $00
	; indicates that no movement loop is desired.  The common use of this
	; value is when you come to the end of an Airship/Battleship/Coin Ship
	; and the screen continues to bob.
AScroll_MoveEndLoopSelect:
	.byte $00	;  0 World 3-6 / 1-4
	.byte $04	;  1 World 3 Airship
	.byte $00	;  2 World 6-2
	.byte $04	;  3 World 5 Airship
	.byte $04	;  4 World 2 Airship
	.byte $04	;  5 World 4 Airship
	.byte $04	;  6 World 6 Airship
	.byte $00	;  7 World 5-6
	.byte $00	;  8
	.byte $00	;  9 
	.byte $00	;  A World 6-7
	.byte $04	;  B World 1 Airship
	.byte $04	;  C World 7 Airship
	.byte $04	;  D World 8 Airship
	.byte $03	;  E World 8 Battleship
	.byte $00	;  F World 7-4
	.byte $00	; 10 World 1 Coin Heaven
	.byte $04	; 11 Coin Ship
	.byte $00	; 12
	.byte $00	; 13 World 8 Tank 1
	.byte $00	; 14 World 8 Tank 2

	; Movement command selected by "Level_AScrlVar" 
	; Bits 0-1: (0 to 3) Acceleration selection (from AScroll_VelAccel) for vertical auto scroll velocity
	; Bits 2-3: (0 to 3) Acceleration selection (from AScroll_VelAccel) for horizontal auto scroll velocity
	; Bits 4-7: -> Level_AScrlLoopSel
AScroll_Movement:
ASM_World_36_14:	.byte $04, $1F, $1F, $00
ASM_W3_Airship:		.byte $04, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00, $00, $02, $00, $01, $00
ASM_World_62:		.byte $70
ASM_W5_Airship:		.byte $04, $00, $01, $00, $02, $00, $01, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00
ASM_UNK4:		.byte $04, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00
ASM_W4Airship:		.byte $05, $04, $00, $02, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01, $00, $00, $02, $00, $01
ASM_W6Airship:		.byte $04, $00, $01, $00, $02, $00, $01, $00, $02, $00, $0A, $02, $00, $05, $01, $00, $02, $00, $01
ASM_World_56:		.byte $04, $10
ASM_UNK8:		.byte $04, $00, $01, $00, $02, $00, $00, $02, $00, $01, $00, $01, $00, $02, $00
ASM_UNK9:		.byte $01, $00, $06, $00, $01, $00, $02, $00, $02, $00, $01, $00, $02, $00, $01, $00, $01, $00, $02, $00
ASM_World_67:		.byte $04, $00, $01, $00, $02, $00, $00, $02, $00, $01, $00
ASM_W1Airship:		.byte $04, $00, $00, $01, $00, $02, $00, $01, $00, $02, $00, $02, $00, $01, $00, $02, $00, $02, $00, $01, $00
ASM_W7Airship:		.byte $05, $00, $20, $00, $02, $30, $00, $30, $02, $00, $01, $00, $30, $00, $02, $00, $01, $00, $20, $02, $00, $01, $00, $02, $00, $01, $00, $30, $02, $00, $01, $00, $01
ASM_W8Airship:		.byte $04, $10, $00
ASM_W8Battleship:	.byte $06, $04, $00, $01, $00, $30
ASM_World_74:		.byte $04, $00, $00, $0A, $00, $04, $00, $01, $00, $02, $00, $01, $50, $01, $00, $08, $00, $06, $02, $00, $00
ASM_W1CoinHeaven:	.byte $60
ASM_CoinShip:		.byte $80
ASM_UNK12:		.byte $04, $00
ASM_World8Tank1:	.byte $04, $10, $00
ASM_World8Tank2:	.byte $04, $10
ASM_Terminator


	; How many times to repeat the above command
AScroll_MovementRepeat:
ASMR_World_36_14:	.byte $08, $03, $80
ASMR_W3_Airship:	.byte $08, $40, $08, $3C, $10, $1E, $08, $87, $08, $19, $08, $FF, $88, $08, $45, $08, $35
ASMR_World_62:		.byte $01
ASMR_W5_Airship:	.byte $08, $62, $06, $6E, $10, $62, $0A, $60, $06, $4C, $08, $6C, $06, $2C, $08, $31, $04, $93
ASMR_UNK4:		.byte $08, $FF, $08, $2E, $0E, $68, $10, $6A, $16, $56, $0C, $DF
ASMR_W4Airship:		.byte $01, $03, $60, $03, $80, $04, $80, $04, $80, $04, $80, $04, $80, $04, $80, $04, $80, $06, $32, $08, $32, $06, $77, $FF, $05, $FF, $03
ASMR_W6Airship:		.byte $08, $67, $01, $80, $03, $82, $0A, $87, $08, $9F, $08, $08, $63, $08, $0C, $40, $06, $78
ASMR_World_56:		.byte $02, $08
ASMR_UNK8:		.byte $03, $08, $EE, $10, $67, $10, $FF, $48, $10, $67, $10, $34, $10, $67, $10
ASMR_UNK9:		.byte $78, $08, $48, $08, $38, $10, $26, $10, $1C, $08, $36, $08, $90, $0A, $68, $0A, $BF, $0D, $60, $0D
ASMR_World_67:		.byte $56, $08, $7A, $11, $5F, $11, $FF, $94, $15, $45, $15
ASMR_W1Airship:		.byte $80, $08, $71, $47, $06, $20, $0E, $18, $0E, $23, $06, $31, $06, $25, $14, $27, $0E, $35, $0A, $2C, $0A
ASMR_W7Airship:		.byte $27, $08, $20, $02, $0E, $03, $01, $18, $02, $0C, $28, $0C, $20, $01, $2C, $0D, $10, $10, $20, $02, $10, $20, $12, $18, $17, $16, $12, $20, $03, $0C, $28, $06, $42
ASMR_W8Airship:		.byte $01, $0F, $02
ASMR_W8Battleship:	.byte $E6, $05, $03, $27, $0A, $27
ASMR_World_74:		.byte $0B, $08, $FF, $79, $08, $48, $08, $0E, $0C, $0E, $10, $0E, $04, $04, $18, $10, $08, $18, $08, $08, $FF
ASMR_W1CoinHeaven:	.byte $8A
ASMR_CoinShip:		.byte $01
ASMR_UNK12:		.byte $01, $08
ASMR_World8Tank1:	.byte $F9, $08, $05
ASMR_World8Tank2:	.byte $E8, $08
ASMR_Terminator:	.byte $04

	; Accelerates horizontal or vertical velocity
AScroll_VelAccel:	.byte $00, $01, -$01, -$01

	; "Movement Loops" are perpetual auto scroll movements e.g. for the Airship scroll termination
	; It just continually feeds movement commands on loop forever (see AScroll_MovementLoop and AScroll_MovementLoopTicks)

	; This points to the starting offset into AScroll_MovementLoop
	; Indexed by (Level_AScrlLoopSel - 2), next value up is terminating value
ASML	.func \1 - AScroll_MovementLoop
AScroll_MovementLoopStart:
	.byte ASML(ASML_0)		; 0 (Level_AScrlLoopSel = 2)
	.byte ASML(ASML_Battleship)	; 1 (Level_AScrlLoopSel = 3) Battleship uses as the "idle" at the end of its scrolling
	.byte ASML(ASML_Airship)	; 2 (Level_AScrlLoopSel = 4) Airship/Coin Ship uses this as the "idle" at the end of its scrolling
	.byte ASML(ASML_3)		; 3 (Level_AScrlLoopSel = 5)
	.byte ASML(ASML_4)		; 4 (Level_AScrlLoopSel = 6)
	.byte ASML(ASML_5)		; 5 (Level_AScrlLoopSel = 7)
	.byte ASML(ASML_6)		; 6 (Level_AScrlLoopSel = 8)
	.byte ASML(ASML_Terminator)	; Terminator

	.byte $00

	; Supplies a AScroll_Movement value, unless negative (but that never happens here apparently)
AScroll_MovementLoop:
ASML_0:		.byte $02, $00, $01, $00
ASML_Battleship:.byte $02, $00, $01, $00	; Battleship
ASML_Airship:	.byte $02, $00, $01, $00, $02	; Airship/Coin Ship
ASML_3:		.byte $01, $00, $02, $00
ASML_4:		.byte $04, $00, $00
ASML_5:		.byte $04, $00, $00, $02, $00, $01, $00, $01, $00, $02, $00
ASML_6:		.byte $05, $04, $00, $02, $00, $01, $00, $02, $00, $01, $00, $02, $00, $01
ASML_Terminator

	.byte $FF

	; Supplies a AScroll_MovementLoopTicks value (ticks to perform current looping command)
AScroll_MovementLoopTicks:
ASMLT_0:	.byte $10, $20, $10, $20
ASMLT_Battleship:.byte $0A, $26, $0A, $26
ASMLT_Airship:	.byte $04, $08, $08, $08, $04
ASMLT_3:	.byte $10, $0E, $10, $0E
ASMLT_4:	.byte $08, $FF, $68
ASMLT_5:	.byte $08, $F0, $F4, $10, $66, $10, $76, $10, $66, $10, $95
ASMLT_6:	.byte $02, $02, $90, $04, $78, $04, $78, $04, $78, $04, $78, $04, $78, $02
ASMLT_Terminator

	; Glowing coin palette colors
AScroll_CoinShipCoinGlowPal:
	.byte $27, $27, $27, $17, $07, $17

CoinShip_CoinGlow:
	BPL PRG009_BBB3	 ; If CoinShip_CoinGlowCnt >= 0, jump to PRG009_BBB3

	; Reload CoinShip_CoinGlowCnt = 5
	LDA #$05


	CMP #(CoinShip_CoinGlow - AScroll_CoinShipCoinGlowPal)
	BLT PRG009_BBAC	 ; If we haven't hit the end of the palette array yet, jump to PRG009_BBAC

PRG009_BBAC:
	TAY		 ; -> 'Y'

	; Get color index, pump into palette buffer
	LDA AScroll_CoinShipCoinGlowPal,Y
	STA Palette_Buffer+7

PRG009_BBB3:
	RTS		 ; Return

AScroll_HorizontalInitMove:
	.byte ASHIM(ASM_World_36_14)	;  0 World 3-6 / 1-4
	.byte ASHIM(ASM_W3_Airship)	;  1 World 3 Airship
	.byte ASHIM(ASM_World_62)	;  2 World 6-2
	.byte ASHIM(ASM_W5_Airship)	;  3 World 5 Airship
	.byte ASHIM(ASM_UNK4)		;  4
	.byte ASHIM(ASM_W4Airship)	;  5 World 4 Airship
	.byte ASHIM(ASM_W6Airship)	;  6 World 6 Airship
	.byte ASHIM(ASM_World_56)	;  7 World 5-6
	.byte ASHIM(ASM_UNK8)		;  8
	.byte ASHIM(ASM_UNK9)		;  9 
	.byte ASHIM(ASM_World_67)	;  A World 6-7
	.byte ASHIM(ASM_W1Airship)	;  B World 1 Airship
	.byte ASHIM(ASM_W7Airship)	;  C World 7 Airship
	.byte ASHIM(ASM_W8Airship)	;  D World 8 Airship
	.byte ASHIM(ASM_W8Battleship)	;  E World 8 Battleship
	.byte ASHIM(ASM_World_74)	;  F World 7-4
	.byte ASHIM(ASM_W1CoinHeaven)		; 10
	.byte ASHIM(ASM_CoinShip)	; 11 Coin Ship
	.byte ASHIM(ASM_UNK12)		; 12 
	.byte ASHIM(ASM_World8Tank1)	; 13 World 8 Tank 1
	.byte ASHIM(ASM_World8Tank2)	; 14 World 8 Tank 2
	.byte ASHIM(ASM_Terminator)	; 15 ** Terminator Only (because it seeks ahead to see the terminating movement index)

AutoScroll_LeftFast:
	LDA #$F4
	STA Level_AScrlHVel
	BNE AutoScroll_HorizontalNorm

AutoScroll_HorizontalFast:
	LDA #$0C
	STA Level_AScrlHVel	
	BNE AutoScroll_HorizontalNorm

AutoScroll_Horizontal:
	LDA #$06
	STA Level_AScrlHVel

AutoScroll_HorizontalNorm:
	LDX #$00	; X = 0 
	JSR AutoScroll_ApplyHVel	 ; Apply auto scroll horizontal velocity

PRG009_BBC5:
	CMP #$0e	 
	BNE PRG009_BBCC	 ; If Level_AScrlLimitSel <> $0E (World 8 Battleship), jump to PRG009_BBCC


PRG009_BBCC:
	JSR AScroll_MovePlayer	 ; Moves Player as necessary with auto scroll

	LDA Level_AScrlTimer
	LSR A		 
	BCS PRG009_BC0B	 ; Every other tick, jump to PRG009_BC0B (RTS)

	PHA		 ; Save timer / 2 value

	JSR AutoScroll_ApplyVVel	 ; Apply auto scroll vertical velocity

	PLA		 ; Restore timer / 2 value

	BNE PRG009_BC0B	 ; If timer > 1, jump to PRG009_BC0B

	LDA Level_AScrlMoveTicks
	BEQ PRG009_BBE4	 ; If Level_AScrlMoveTicks = 0, jump to PRG009_BBE4

	JMP PRG009_BC66	 ; Otherwise, jump to PRG009_BC66

PRG009_BBE4:
	LDA Level_AScrlMoveRepeat
	BNE PRG009_BC3A	 ; If move is to be repeated, jump to PRG009_BC3A

PRG009_BBE9:
	LDY Level_AScrlLimitSel	 ; Y = Level_AScrlLimitSel

	LDA Level_AScrlVar
	CMP AScroll_HorizontalInitMove+1,Y
	BNE PRG009_BC16	 ; If we're not yet at the last command index, jump to PRG009_BC16

	CPY #$13
	BLT PRG009_BBFB	 ; If Level_AScrlLimitSel < $13 (i.e. NOT a World 8 Tank level), jump to PRG009_BBFB

	; (Carry is set by the CPY)
	; Set bit 7 on Level_TimerEn, which disables level animations (specifically, the tank treads)

PRG009_BBFB:

	; Halt the horizontal auto scroll velocity
	LDA #$00
	STA Level_AScrlHVel

	LDA AScroll_MoveEndLoopSelect,Y
	BNE PRG009_BC0C		; If there's a loop select value to load, jump to PRG009_BC0C

	; Otherwise, also halt vertical auto scroll velocity and clear the horizontal fractional accumulator (just in case)
	STA Level_AScrlVVel
	STA Level_AScrlHVelFrac

PRG009_BC0B:
	RTS		 ; Return

PRG009_BC0C:

	; Load the loop select value!
	STA Level_AScrlLoopSel

	; Level_AScrlMoveRepeat = $FF (do movement loop)
	LDA #$ff
	STA Level_AScrlMoveRepeat

	BNE PRG009_BC31	 ; Jump (technically always) to PRG009_BC60

PRG009_BC16:
	INC Level_AScrlVar	 ; Level_AScrlVar++

	LDY Level_AScrlVar	 ; Y = Level_AScrlVar

	LDA AScroll_Movement,Y	 ; Select next movement command

	LSR A
	LSR A
	LSR A
	LSR A		 ; Shift upper 4 bits to the right; sets Level_AScrlLoopSel (if not zero)
	BEQ PRG009_BC60	 ; If it is zero, jump to PRG009_BC60

	STA Level_AScrlLoopSel	 ; -> Level_AScrlLoopSel

	LDY Level_AScrlVar	 ; Y = Level_AScrlVar

	; Set repeat count
	LDA AScroll_MovementRepeat,Y
	STA Level_AScrlMoveRepeat

PRG009_BC31:
	LDY Level_AScrlLoopSel	 ; Y = Level_AScrlLoopSel (current looping movement index)

	; Set Level_AScrlLoopCurMove
	LDA AScroll_MovementLoopStart-2,Y
	STA Level_AScrlLoopCurMove

PRG009_BC3A:
	LDY Level_AScrlLoopSel	 ; Y = Level_AScrlLoopSel

	LDA Level_AScrlLoopCurMove	 
	CMP AScroll_MovementLoopStart-1,Y
	BNE PRG009_BC55	 ; If Level_AScrlLoopCurMove <> terminating index, jump to PRG009_BC55

	; End index for the looping movement

	; Restart at the beginning of the looping movement!
	LDA AScroll_MovementLoopStart-2,Y
	STA Level_AScrlLoopCurMove

	LDA Level_AScrlMoveRepeat
	BMI PRG009_BC55	 ; If bit 7 is set on Level_AScrlMoveRepeat, jump to PRG009_BC55

	DEC Level_AScrlMoveRepeat	 ; Level_AScrlMoveRepeat-- (one less repeat)
	BEQ PRG009_BBE9	 ; If Level_AScrlMoveRepeat = 0, jump to PRG009_BBE9

PRG009_BC55:
	INC Level_AScrlLoopCurMove	 ; Level_AScrlLoopCurMove++

	LDY Level_AScrlLoopCurMove	 ; Y = Level_AScrlLoopCurMove

	LDA AScroll_MovementLoopTicks-1,Y
	BNE PRG009_BC63	 ; If loop tick value is non-zero, jump to PRG009_BC63

PRG009_BC60:
	LDA AScroll_MovementRepeat,Y	 ; Get movement repeat value

PRG009_BC63:
	STA Level_AScrlMoveTicks	 ; Update ticks value

PRG009_BC66:
	DEC Level_AScrlMoveTicks	 ; Level_AScrlMoveTicks--

	LDA Level_AScrlMoveRepeat
	BEQ PRG009_BC76	 ; If Level_AScrlMoveRepeat = 0, jump to PRG009_BC76

	LDY Level_AScrlLoopCurMove	 ; Y = Level_AScrlLoopCurMove

	LDA AScroll_MovementLoop-1,Y
	BPL PRG009_BC7C	 ; If value not negative, jump to PRG009_BC7C

PRG009_BC76:
	LDY Level_AScrlVar ; Y = Level_AScrlVar

	LDA AScroll_Movement,Y

PRG009_BC7C:
	PHA		 ; Save AScroll_Movement[Y]

	LSR A		 
	LSR A		 ; Get bits 3,2 -> 1,0
	AND #$03
	TAY		 ; Y = 0 to 3

	; Accelerate horizontal auto scroll velocity
	LDA AScroll_VelAccel,Y
	ADD Level_AScrlHVel
	STA Level_AScrlHVel

	PLA		 ; Restore movement

	AND #$03	 
	TAY		 ; Y = 0 to 3

	; Accelerate vertical auto scroll velocity
	LDA AScroll_VelAccel,Y
	ADD Level_AScrlVVel
	STA Level_AScrlVVel

	; Level_AScrlTimer = 4
	LDA #$0C
	STA Level_AScrlTimer

	RTS		 ; Return


	; Player movements based on auto scroll
AScroll_MovePlayer:
	; Enable auto scroll effects (vertical and horizontal)
	LDA #ASCONFIG_ENABLE
	STA Level_AScrlConfig

	LDY <Player_InAir
	BNE PRG009_BCC0	 ; If Player is mid air, jump to PRG009_BCC0

	LDA Level_AScrlLimitSel
	CMP #$13
	BLT PRG009_BCBC	 ; If Level_AScrlLimitSel < $13 (Not a World 8 Tank), jump to PRG009_BCBC

	; World 8 tanks only...

	LDA <Player_YHiZ
	CMP #$01
	BNE PRG009_BCBC	 ; If Player is not low, jump to PRG009_BCBC

	LDA <Player_YZ
	CMP #112
	BGE PRG009_BCBD	 ; If Player Y >= 112, jump to PRG009_BCBD

PRG009_BCBC:
	INY		 ; Y = 1 (World 8 Tank with low Player Y < 112)

PRG009_BCBD:

PRG009_BCC0:
	LDA Level_Tile_Prop_Body
	CMP #(TILE_PROP_SOLID_ALL)
	BCS Scroll_LeftEdgeDeath

	LDA <Player_SpriteX
	BMI Scroll_RightEdge

	CMP #16
	BCS Player_NoEdgeScroll

	CMP #$08
	BCS Scroll_LeftEdgeNoDeath

Scroll_LeftEdgeDeath:
	JSR Player_Die
	RTS

Scroll_LeftEdgeNoDeath:
	LDA <Horz_Scroll
	ADD #16
	STA <Player_X

	LDA <Horz_Scroll_Hi
	ADC #$00
	STA Player_XHi

	LDA #$00
	STA Player_XVelZFrac
	JMP Player_NoEdgeScroll

Scroll_RightEdge:
	CMP #224
	BCC Player_NoEdgeScroll

	CMP #240
	BCC Scroll_RightEdgeNoDeath

	JSR Player_Die
	RTS

Scroll_RightEdgeNoDeath:	
	LDA <Horz_Scroll
	ADD #224
	STA <Player_X

	LDA <Horz_Scroll_Hi
	ADC #$00
	STA Player_XHi
	
	LDA #$00
	STA Player_XVelZFrac

Player_NoEdgeScroll:

	; Set Level_AScrlSclLastDir based on sign of Level_AScrlHVel
	LDA Level_AScrlHVel
	ASL A		; Bit 7 -> carry
	ROL A		; Carry -> Bit 0
	AND #$01	; Masks 0/1
	STA Level_AScrlSclLastDir	; -> Level_AScrlSclLastDir

	LDA <Player_XVelZ
	BEQ PRG009_BD1D	 ; If Player is not moving horizontally, jump to PRG009_BD1D (RTS)

	EOR Level_AScrlHVel
	BMI PRG009_BD1D	 ; If Player's X velocity is the moving the opposite way than auto scroll, jump to PRG009_BD1D (RTS)

	LDY #$00	 ; Y = $00 (16-bit sign extension)

	LDA Level_AScrlHVelCarry
	BEQ PRG009_BD1D	 ; If auto scroll has not carried, jump to PRG009_BD1D (RTS)
	BPL PRG009_BD0E	 ; If positive, jump to PRG009_BD0E

	DEY		 ; Y = $FF (16-bit sign extension)

PRG009_BD0E:

	; Apply carry to Player's X
	ADD <Player_X
	STA <Player_X
	TYA	
	ADC <Player_XHi
	STA <Player_XHi

	; Player_XVelZFrac = 0
	LDA #$00
	STA Player_XVelZFrac

PRG009_BD1D:
	RTS		 ; Return

	; In levels that "float" on water, this determines the lowest
	; point of the water along the bottom for small/ducking or big
Float_WaterBottomLimitY:	.byte 140, 144

AutoScroll_BooRoom:
	LDA Level_AScrlLoopSel
	BNE PRG009_BD37	 ; If Level_AScrlLoopSel <> 0, jump to PRG009_BD37

	LDA <Vert_Scroll
	CMP #$ef
	BNE PRG009_BD1D	 ; If vertical scroll <> $EF (bottom), jump to PRG009_BD1D (RTS)

	; Auto scroll and vertical scroll set together
	LDA <Vert_Scroll
	STA Level_AScrlPosV

	INC Level_AScrlLoopSel	 ; Level_AScrlLoopSel++

	LDA #$20
	BNE PRG009_BD54	 ; Jump (technically always) to PRG009_BD54

PRG009_BD37:
	LDA Level_AScrlTimer
	BEQ PRG009_BD3F	 ; If timer expired, jump to PRG009_BD3F
	JMP PRG009_BDC1	 ; Jump to PRG009_BDC1

PRG009_BD3F:
	LDA Level_AScrlPosV
	CMP #$0d
	BEQ PRG009_BD6A	 ; If vertical scroll position = $0D, jump to PRG009_BD6A

	CMP #$0f
	BNE PRG009_BD57	 ; If vertical scroll position <> $0F, jump to PRG009_BD57

	; Play Ba-boom sound!
	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$20	 ; A = $20

PRG009_BD54:
	STA Level_AScrlTimer	 ; Set the scroll timer

PRG009_BD57:
	JSR AutoScroll_ApplyVVel	 ; Apply auto scroll vertical velocity

	LDA <Counter_1
	AND #$07
	BNE PRG009_BD6A	 ; 1:8 ticks proceed, otherwise jump to PRG009_BD6A

	LDA Level_AScrlVVel
	CMP #-$08
	BEQ PRG009_BD6A	 ; If vertical scroll velocity = -$08, jump to PRG009_BD6A

	DEC Level_AScrlVVel	 ; Otherwise, accelerate upwards...

PRG009_BD6A:
	JMP PRG009_BDC9	 ; Jump to PRG009_BDC9


ASFloat_VelAccel:	.byte -$01, $01

AScroll_SpikeCeilVVelLimit:	.byte -$08, $08

AScroll_SpikeCeilVLimits:
	.byte $7C, $EF	; Spike Ceiling 0 Upper/Lower limit
	.byte $CF, $EF	; Spike Ceiling 1 Upper/Lower limit


AutoScroll_SpikeCeiling:
	LDA Level_AScrlTimer
	BNE PRG009_BDC1	 ; If timer not expired, jump to PRG009_BDC1

	JSR AutoScroll_ApplyVVel	 ; Apply auto scroll vertical velocity

	LDA <Counter_1
	AND #$07
	BNE PRG009_BD95	 ; 1:8 ticks proceed, otherwise jump to PRG009_BD95

	LDY Level_AScrlVar	 ; Y = Level_AScrlVar (0/1, direction of movement in spiked ceiling)

	LDA Level_AScrlVVel
	CMP AScroll_SpikeCeilVVelLimit,Y
	BEQ PRG009_BD95	 ; If auto scroll vertical velocity is at its limit, jump to PRG009_BD95

	; Accelerate spiked ceiling!
	ADD ASFloat_VelAccel,Y
	STA Level_AScrlVVel

PRG009_BD95:
	LDA Level_AScrlLimitSel
	ASL A		 	; Level_AScrlLimitSel * 2
	ORA Level_AScrlVar	; OR'd with Level_AScrlVar (0/1)
	TAY		 	; -> 'Y'

	LDA Level_AScrlPosV
	CMP AScroll_SpikeCeilVLimits,Y
	BNE PRG009_BDC9	 ; If Spiked ceiling is not at its upper/lower limit, jump to PRG009_BDC9

	; Halt ceiling!
	LDA #$00
	STA Level_AScrlVVel

	; Change direction!
	LDA Level_AScrlVar
	EOR #$01
	STA Level_AScrlVar

	BEQ PRG009_BDBC	 ; If spikes just went to the top, jump to PRG009_BDBC (no sound)

	; Spike limit hit sound
	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

PRG009_BDBC:
	; Reset timer
	LDA #$20
	STA Level_AScrlTimer

PRG009_BDC1:

	; Spike ceiling at its high/low limit; "shake"

	; Invert bit 0 on Level_AScrlPosV, giving a +/-1 pixel shake
	AND #$01
	EOR Level_AScrlPosV
	STA Level_AScrlPosV

PRG009_BDC9:


	; Enable display of 32 pixel partition and show sprites beneath the partition
	LDA #(UPDATERASTER_32PIXPART | UPDATERASTER_32PIXSHOWSPR)


PRG009_BDD0:
	STA Update_Request	; Set Update_Request

	LDA #6	 ; A = 6

	LDY <Player_Suit
	BNE PRG009_BDDB	 ; If Player is not small, jump to PRG009_BDDB

	LDA #18	 ; A = 18

PRG009_BDDB:
	ADC <Player_YZ	; Offset to Player's feet
	AND #$f0	; Align to tile grid
	STA <Temp_Var9  ; -> Temp_Var9

	LDA <Player_YHiZ
	ADC #$00	; Apply carry
	AND #$01	; 0/1 only valid values in non-vertical level
	STA <Temp_Var3	; -> Temp_Var3

	; Temp_Var10 = Player X + 8
	LDA <Player_X
	ADD #$08
	STA <Temp_Var10

	LDA <Player_XHi
	ADC #$00	 ; Apply carry
	ASL A		 ; Multiply by 2 for Tile_Mem_Addr index
	TAY		 ; -> 'Y'

	; Set Temp_Var1/2 to point to tile
	LDA Tile_Mem_Addr,Y
	STA <Temp_Var1
	LDA Tile_Mem_Addr+1,Y
	ADD <Temp_Var3	
	STA <Temp_Var2	

	; Compute row/column offset
	LDA <Temp_Var10
	LSR A
	LSR A
	LSR A
	LSR A
	ORA <Temp_Var9
	TAY	; -> 'Y'

	LDA [Temp_Var1],Y	; Get tile
	STA <Temp_Var1		; -> Temp_Var1

PRG009_BE2B: 

	; Auto scroll effects enabled, but no horizontal auto scroll
	LDA #(ASCONFIG_ENABLE | ASCONFIG_HDISABLE)
	STA Level_AScrlConfig

	RTS		 ; Return

ASFloat_VVelLimit:	.byte -$04, $04


	; Based on value in Level_AScrlLimitSel (Level_AScrlVar = 0 for left value, 1 for right)
ASFloat_VertLimit:
	.byte $C4, $EA	; 0 -- Until 4, sprites will NOT be shown beneath the 32 pixel partition
	.byte $94, $EA	; 1
	.byte $C4, $EA	; 2
	.byte $D4, $EA	; 3
	.byte $90, $EA	; 4 -- NOTE, starting here, sprites WILL be shown beneath the 32 pixel partition
	.byte $B4, $EA	; 5
	.byte $CF, $EA	; 6

AutoScroll_Floating:
	JSR AutoScroll_ApplyVVel	 ; Apply auto scroll vertical velocity

	LDA <Counter_1
	AND #$07
	BNE PRG009_BE5C	 ; 1:8 ticks proceed, otherwise jump to  PRG009_BE5C

	LDY Level_AScrlVar	 ; Y = Level_AScrlVar

	LDA Level_AScrlVVel
	CMP ASFloat_VVelLimit,Y
	BEQ PRG009_BE5C	 ; If auto scroll vertical velocity is at its limit, jump to PRG009_BE5C

	ADD ASFloat_VelAccel,Y	 ; Add to vertical velocity
	STA Level_AScrlVVel	 ; Update vertical velocity

PRG009_BE5C:
	LDA Level_AScrlLimitSel
	ASL A		 	; A = Level_AScrlLimitSel * 2
	ORA Level_AScrlVar	; OR the direction flag
	TAY		 	; -> 'Y'

	LDA Level_AScrlPosV
	CMP ASFloat_VertLimit,Y
	BNE PRG009_BE74	 ; If vertical position is not at vertical limit, jump to PRG009_BE74

	; Reverse direction
	LDA Level_AScrlVar
	EOR #$01
	STA Level_AScrlVar

PRG009_BE74:
	LDA Level_AScrlLimitSel
	CMP #$04
	BLT Setup32PixPartWater	 ; If the limit select < 4, jump to Setup32PixPartWater

	JMP PRG009_BDC9	 ; Otherwise, jump to PRG009_BDC9

Setup32PixPartWater:
	LDA #UPDATERASTER_32PIXPART	; For Update_Select; use the "32 pixel partition" style (water along the bottom)
	JSR PRG009_BDD0	  

	LDA Player_AboveTop
	BNE PRG009_BEA0	 ; If Player is above the top of screen, jump to PRG009_BEA0 (RTS)

	TAY		 ; Y = 0

	LDA Player_IsDucking
	BNE PRG009_BE93	 ; If Player is ducking, jump to PRG009_BE93

	LDA <Player_Suit
	BEQ PRG009_BE93	 ; If Player is small, jump to PRG009_BE93

	INY		 ; Y = 1

PRG009_BE93:
	LDA <Player_SpriteY
	CMP Float_WaterBottomLimitY,Y	; Sets carry if greater-equal
	TAY			; Y = Player_SpriteY
	ROR A			; Will rotate carry bit into bit 7
	CPY #128		; Carry set if Player_SpriteY >= 128
	ROR A			; Will rotate carry bit into bit 7

	; FloatLevel_PlayerWaterStat:
	;	Bit 6: Set if Player_SpriteY >= Float_WaterBottomLimitY[Y] (player is beneath bottom of water)
	;	Bit 7: Set if Player_SpriteY >= 128 (i.e. Player is beneath top of water)
	STA FloatLevel_PlayerWaterStat

PRG009_BEA0:
	RTS		 ; Return

AutoScroll_ApplyVVel:
	LDX #$01	; X = 1	; Vertical instead of horizontal

AutoScroll_ApplyHVel:
	LDA Level_AScrlHVel,X	; Get auto scroll velocity
	ASL A
	ASL A
	ASL A
	ASL A		 	; Fractional part shifted up
	ADD Level_AScrlHVelFrac,X
	STA Level_AScrlHVelFrac,X	; Add to auto scroll's velocity fractional accumulator

	PHP		 ; Save CPU state
	PHP		 ; Save CPU state

	LDY #$00	 ; Y = 0 (positive high part)

	LDA Level_AScrlHVel,X	; Get auto scroll Velocity
	LSR A
	LSR A
	LSR A
	LSR A		 ; Whole part shifted down (integer)
	CMP #%00001000	 ; Check the sign bit
	BLT PRG009_BF42	 ; If the value was not negatively signed, jump to PRG009_BF42
	ORA #%11110000	 ; Otherwise, apply a sign extension
	DEY		 ; Y = $FF (negative high part)
PRG009_BF42:
	PLP		 ; Restore CPU state


	PHA		 ; Save integer of velocity

	ADC Level_AScrlPosH,X 
	STA Level_AScrlPosH,X ; Add with carry

	TYA		 ; A = $00 or $FF as appropriate

	ADC Level_AScrlPosHHi,X
	STA Level_AScrlPosHHi,X ; Add to the high part

	PLA		 ; Restore integer of X Velocity

	PLP		 ; Restore CPU state

	ADC #$00
	STA Level_AScrlHVelCarry	 ; Set to '1' if fractional part rolled over

	RTS		 ; Return

; Rest of ROM bank was empty

