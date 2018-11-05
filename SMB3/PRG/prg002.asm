    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	; 

OBJ_WATERSPLASH     = $14    
OBJ_WATERFILLER		= $15
OBJ_TIMER           = $16
OBJ_CLOCK           = $17
OBJ_DIMMER          = $18
OBJ_JUMPCONTROL     = $19
OBJ_WEATHER         = $1A
OBJ_KEYPIECECOLLECTION       = $1B
OBJ_KEYPIECES       = $1C
OBJ_LIGHTNINGBOLT       = $1D
OBJ_ICESPIKE        = $1E
OBJ_STARS           = $1F
OBJ_EXPLOSION      = $20

    .word ObjInit_WaterSplash   ; Object $14
	.word ObjInit_Waterfill	; Object $15
    .word ObjInit_Timer     ; Object $16
    .word ObjInit_Clock     ; Object $17
    .word ObjInit_Dimmer    ; Object $18
    .word ObjInit_JumpControl ; Object $19
    .word ObjInit_Weather   ; Object $1A
    .word ObjInit_KeyPieceCollection ; Object $1B
    .word ObjInit_KeyPiece     ; Object $1C
    .word ObjInit_Lightning     ; Object $1D
    .word ObjInit_IceSpike  ; Object $1E
    .word ObjInit_Stars     ; Object $1F
    .word ObjInit_Explosion ; Object $20
    .word ObjInit_DoNothing ; Object $21
    .word ObjInit_DoNothing ; Object $22
    .word ObjInit_DoNothing ; Object $23
    .word ObjInit_DoNothing ; Object $24
    .word ObjInit_DoNothing ; Object $25
    .word ObjInit_DoNothing ; Object $26
    .word ObjInit_DoNothing ; Object $27
	
	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_WaterSplash   ; Object $14
	.word ObjNorm_Waterfill	    ; Object $15
    .word ObjNorm_Timer         ; Object $16
    .word ObjNorm_Clock         ; Object $17
    .word ObjNorm_Dimmer        ; Object $18
    .word ObjNorm_JumpControl   ; Object $19
    .word ObjNorm_Weather       ; Object $1A
    .word ObjNorm_KeyPieceCollection ; Object $1B
    .word ObjNormal_KeyPiece    ; Object $1C
    .word ObjNorm_Lightning     ; Object $1D
    .word ObjNorm_IceSpike      ; Object $1E
    .word ObjNorm_Stars         ; Object $1F
    .word ObjNorm_Explosion     ; Object $20
    .word ObjNorm_DoNothing     ; Object $21
    .word ObjNorm_DoNothing     ; Object $22
    .word ObjNorm_DoNothing     ; Object $23
    .word ObjNorm_DoNothing     ; Object $24
    .word ObjNorm_DoNothing     ; Object $25
    .word ObjNorm_DoNothing     ; Object $26
    .word ObjNorm_DoNothing     ; Object $27


	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word ObjHit_DoNothing	    ; Object $14
	.word ObjHit_DoNothing	    ; Object $15
    .word ObjHit_DoNothing      ; Object $16
    .word ObjHit_Clock          ; Object $17
    .word ObjHit_DoNothing      ; Object $18
    .word ObjHit_DoNothing      ; Object $19
    .word ObjHit_DoNothing      ; Object $1A
    .word ObjHit_DoNothing      ; Object $1B
    .word ObjHit_KeyPiece       ; Object $1C
    .word Player_GetHurt        ; Object $1D
    .word Player_GetHurt        ; Object $1E
    .word ObjHit_DoNothing      ; Object $1F
    .word Player_GetHurt        ; Object $20
    .word ObjHit_DoNothing      ; Object $21
    .word ObjHit_DoNothing      ; Object $22
    .word ObjHit_DoNothing      ; Object $23
    .word ObjHit_DoNothing      ; Object $24
    .word ObjHit_DoNothing      ; Object $25
    .word ObjHit_DoNothing      ; Object $26
    .word ObjHit_DoNothing      ; Object $27

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $14
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $15
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $16
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $17
    .byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $18
    .byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $19
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1A
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1B
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $1C
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH8  ; Object $1D
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $1E
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	 ; Object $1F
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $20
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $21
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $22
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $23
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $24
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $25
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $26
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $27

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE         ; Object $14
	.byte OPTS_SETPT5 | $12		; Object $15
    .byte OPTS_NOCHANGE         ; Object $16
    .byte OPTS_NOCHANGE         ; Object $17
    .byte OPTS_NOCHANGE         ; Object $18
    .byte OPTS_NOCHANGE         ; Object $19
    .byte OPTS_NOCHANGE         ; Object $1A
    .byte OPTS_NOCHANGE         ; Object $1B
    .byte OPTS_NOCHANGE	        ; Object $1C
    .byte OPTS_SETPT5 | $1A	    ; Object $1D
    .byte OPTS_SETPT5 | $12     ; Object $1E
    .byte OPTS_NOCHANGE         ; Object $1F
    .byte OPTS_NOCHANGE	        ; Object $20
    .byte OPTS_NOCHANGE	        ; Object $21
    .byte OPTS_NOCHANGE	        ; Object $22
    .byte OPTS_NOCHANGE	        ; Object $23
    .byte OPTS_NOCHANGE	        ; Object $24
    .byte OPTS_NOCHANGE	        ; Object $25
    .byte OPTS_NOCHANGE	        ; Object $26
    .byte OPTS_NOCHANGE	        ; Object $27
	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH		; Object $14
    .byte KILLACT_POOFDEATH		; Object $15
    .byte KILLACT_POOFDEATH     ; Object $16
    .byte KILLACT_POOFDEATH     ; Object $17
    .byte KILLACT_POOFDEATH     ; Object $18
    .byte KILLACT_POOFDEATH     ; Object $19
    .byte KILLACT_NORMALANDKILLED     ; Object $1A
    .byte KILLACT_NORMALANDKILLED     ; Object $1B
    .byte KILLACT_NORMALANDKILLED     ; Object $1C
    .byte KILLACT_POOFDEATH     ; Object $1D
    .byte KILLACT_NORMALSTATE   ; Object $1E
    .byte KILLACT_NORMALSTATE   ; Object $1F
    .byte KILLACT_NORMALSTATE   ; Object $20
    .byte KILLACT_NORMALSTATE   ; Object $21
    .byte KILLACT_NORMALSTATE   ; Object $22
    .byte KILLACT_NORMALSTATE   ; Object $23
    .byte KILLACT_NORMALSTATE   ; Object $24
    .byte KILLACT_NORMALSTATE   ; Object $25
    .byte KILLACT_NORMALSTATE   ; Object $26
    .byte KILLACT_NORMALSTATE   ; Object $27

OG2_POff .func (\1 - ObjectGroup02_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG2_POff(ObjP14), OG2_POff(ObjP15), OG2_POff(ObjP16), OG2_POff(ObjP17)
    .byte OG2_POff(ObjP18), OG2_POff(ObjP19), OG2_POff(ObjP1A), OG2_POff(ObjP1B)
    .byte OG2_POff(ObjP1C), OG2_POff(ObjP1D), OG2_POff(ObjP1E), OG2_POff(ObjP1F)
    .byte OG2_POff(ObjP20), OG2_POff(ObjP21), OG2_POff(ObjP22), OG2_POff(ObjP23)
    .byte OG2_POff(ObjP24), OG2_POff(ObjP25), OG2_POff(ObjP26), OG2_POff(ObjP27)

	.org ObjectGroup_PatternSets
	
ObjectGroup02_PatternSets:

ObjP16:
ObjP18:
ObjP19:
ObjP1A:
ObjP1B:
ObjP1F:
ObjP20:

ObjP14:
    .byte $15, $15
	.byte $13, $13
	.byte $11, $11
    
ObjP15:
    .byte $81, $83


ObjP17:
    .byte $97, $99
    .byte $9B, $9D
	.byte $A1, $AB
	.byte $A3, $A1
	.byte $A3, $AB
	.byte $A5, $A1
	.byte $A5, $AB
	.byte $A7, $A1
	.byte $D7, $D9
	.byte $DB, $DD
	.byte $E1, $EB
	.byte $E3, $E1
	.byte $E3, $EB
	.byte $E5, $E1
	.byte $E5, $EB
	.byte $E7, $E1
    
ObjP1C:
    .byte $81, $83, $85, $87, $89, $89, $87, $85, $C1, $C3, $C5, $C7, $C9, $C9, $C7, $C5

ObjP1D:
	.byte $99, $9B
	.byte $95, $97, $AD, $AF, $95, $97

ObjP1E:
    .byte $AF, $AF

ObjP21:
ObjP22:
ObjP23:
ObjP24:
ObjP25:
ObjP26:
ObjP27:

;***********************************************************************************
; Water Splash
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	An oject that just represents the splash animation when an object goes in and out of water
;***********************************************************************************	
ObjInit_WaterSplash:
	JMP Object_NoInteractions
	
WaterSplash_Frame = Objects_Data1

ObjNorm_WaterSplash:
	LDA <Player_HaltGameZ
	BEQ WaterSplash_Norm

	JMP WaterSplash_Draw

WaterSplash_Norm:
	LDA <Objects_YZ, X
	AND #$F0
	STA <Objects_YZ, X

	LDA Objects_Timer, X
	BNE WaterSplash_Animate

	JMP Object_Delete
	
WaterSplash_Animate:
	LDA Objects_Timer, X
	LSR A
	LSR A

	AND #$03
	STA Objects_Frame, X

WaterSplash_Draw:
	JMP Object_DrawMirrored



;***********************************************************************************
; Water Filler
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
;	This object moves quickly to the right, toggling the tile it's currently on every 16 pixels.
;***********************************************************************************	

ObjInit_Waterfill:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$40
	STA Objects_XVelZ, X
	
	JMP Object_NoInteractions

WaterFill_Ticks = Objects_Data1

WaterFill_Flip:
	.byte $00, SPR_VFLIP

ObjNorm_Waterfill:
	LDA <Player_HaltGameZ
	BNE FillWater_Draw

WaterFill_Norm:
	
	JSR Object_DeleteOffScreen
	JSR Object_FaceDirectionMoving
	JSR Object_ApplyXVel
	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	STY <Temp_Var1

	CMP #TILE_PROP_SOLID_ALL
	BCC FillWater_DrawWater

	LDA <Objects_XZ, X
	AND #$0F
	BNE FillWater_Animate

	LDA Objects_XZ, X
	AND #$F0
	STA Debris_X

	LDA Objects_YZ, X
	AND #$F0
	STA Debris_Y

	JSR Common_MakeBricks

	LDA #SPR_PAL2
	STA BrickBust_Pal, Y
	
	LDA <Temp_Var1
	SUB #$01

	JSR Object_ChangeBlock

	JMP FillWater_Animate

FillWater_DrawWater:
	LDA <Objects_XZ, X
	AND #$0F
	BNE FillWater_Animate

	LDA <Temp_Var1
	EOR #$01

	JSR Object_ChangeBlock

FillWater_Animate:
	INC WaterFill_Ticks, X
	
	LDA WaterFill_Ticks, X
	AND #$03
	
	LSR A

	TAY
	
	LDA Objects_Orientation, X
	ORA WaterFill_Flip, Y
	STA Objects_Orientation, X

FillWater_Draw:
	JMP Object_Draw



;***********************************************************************************
; Timer
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	0 - 30 Seconds
; 	1 - 100 Seconds
;***********************************************************************************
; 	This object kills the player once the count down reaches 0. The time left displays
;	in the upper left hand corner.
;***********************************************************************************	
TimerStartTimes:
	.byte 30, 100

Timer_Remaining = Objects_Data1
Timer_WarningPlayed = Objects_Data2
Timer_Delayed = Objects_Data3

ObjInit_Timer:
	LDA #$03
	STA Objects_SpritesRequested, X

	LDA Objects_Property, X
	TAY

	LDA TimerStartTimes, Y
	STA Timer_Remaining, X

	LDA #$B0
	STA Timer_Delayed, X

	INC Objects_Global, X
	
	JMP Object_NoInteractions

ObjNorm_Timer:
	LDA Timer_WarningPlayed, X
	BNE ObjNorm_Timer0

	LDA #MUS1_TIMEWARNING	 
	STA Sound_QMusic1
	INC Timer_WarningPlayed, X

ObjNorm_Timer0:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Timer1

	LDA Timer_Remaining, X
	BEQ ObjNorm_Timer2

	DEC Timer_Delayed, X
	BNE ObjNorm_Timer1

	DEC Timer_Remaining, X

	LDA #$2D
	STA Timer_Delayed, X

ObjNorm_Timer1:
	JSR DrawTimer
	RTS

ObjNorm_Timer2:
	JSR Player_Die
	RTS

Timer_XOffset:
	.byte $20, $18, $10

Timer_NumOffset:
	.byte $00, $40		

DrawTimer:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	LDA Timer_Remaining, X
	STA DigitsParam

	LDA #$00
	STA DigitsParam + 1

	JSR BytesTo3Digits

	LDA LastPatTab_Sel
	EOR #$01
	TAX

	LDA Timer_NumOffset, X
	STA <Temp_Var1

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	LDX #$02

DrawTimer1:
	LDA #$10
	STA Sprite_RAMY, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y

	LDA Timer_XOffset, X
	STA Sprite_RAMX, Y

	LDA <DigitsResult, X
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile, Y

	INY
	INY
	INY
	INY

	DEX
	BPL DrawTimer1

	LDX <CurrentObjectIndexZ
	RTS

;***********************************************************************************
; Clock
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	0 - Adds 5 seconds
; 	1 - Adds 10 seconds
; 	2 - Adds 15 seconds
; 	3 - Adds 20 seconds
; 	4 - Adds 25 seconds
; 	5 - Adds 30 seconds
;***********************************************************************************
; 	Once Mario touches this object, a number of seconds are added to the timer object.
;***********************************************************************************	

Clock_Collected = Objects_Data3
Clock_Frame = Objects_Data4

Clock_FrameOffsets:
	.byte $00, $08

ObjInit_Clock:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JMP Object_NoInteractions

ObjNorm_Clock:
	JSR Object_DeleteOffScreen
	
	LDA #$00
	STA <Temp_Var10

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

ObjNorm_Clock0:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Clock1

	LDA Clock_Collected, X
	BNE ObjNorm_Clock2

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	INC Clock_Frame, X
	LDA Clock_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	ADD Clock_FrameOffsets, Y
	STA Objects_Frame, X
	
ObjNorm_Clock1:
	JMP Object_Draw

ObjNorm_Clock2:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Clock3

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA Objects_Property, X
	ADD #$02
	ADD <Temp_Var10
	ADD Clock_FrameOffsets, Y
	STA Objects_Frame, X

	JSR Object_ApplyYVel_NoGravity

	LDA Objects_Timer, X
	BEQ ObjNorm_Clock4

ObjNorm_Clock3:
	JMP Object_Draw

ObjNorm_Clock4:
	JMP Object_Delete

ClockTimes:
	.byte 5, 10, 15, 20, 25, 30

ObjHit_Clock:

	LDY #$04

ObjHit_Clock1:
	LDA Objects_ID, Y
	CMP #OBJ_TIMER
	BEQ ObjHit_Clock2

	DEY
	BPL ObjHit_Clock1
	RTS

ObjHit_Clock2:
	LDA Objects_Property, X
	TAX
	LDA ClockTimes, X
	ADD Timer_Remaining, Y
	STA Timer_Remaining, Y

	LDX <CurrentObjectIndexZ

	INC Clock_Collected, X

	LDA #$20
	STA Objects_Timer, X

	LDA #$F8
	STA Objects_YVelZ, X

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDA Sound_QLevel1
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	RTS


ObjInit_Dimmer:
	LDA #$00
	STA Objects_Data4, X

	JMP Object_NoInteractions

ObjNorm_Dimmer:
	LDA <Counter_1
	AND #$03
	BNE FadeOutDone
	LDY #$07

DimmerFindBlocks:
	LDA SpinnerBlocksActive, Y
	BNE Dimmer_FadeIn
	DEY
	BPL DimmerFindBlocks
	JMP Dimmer_FadeOut

Dimmer_FadeOut:
	LDA Objects_Data4, X
	CMP #$04
	BEQ FadeOutDone
	INC Objects_Data4, X

	JMP Dimmer_Fade
FadeOutDone:
	RTS

Dimmer_FadeIn:
	LDA Objects_Data4, X
	BEQ FadeInDone
	DEC Objects_Data4, X
	JMP Dimmer_Fade

FadeInDone:
	RTS

Dimmer_Fade:
	LDA Objects_Data4, X
	ASL A
	ASL A
	ASL A
	ASL A
	STA TempA
	LDY #$0F

Dimmer_Fade2:
	LDA MasterPal_Data,Y	; Get this color
	SUB TempA	 	; Subtract 16 from it
	BPL Dimmer_Fade3	 	; If we didn't go below zero, jump to PRG026_AC55

	LDA #$0f	 	; Otherwise, set it to safe minimum

Dimmer_Fade3:
	STA Palette_Buffer,Y	; Update palette color
	DEY		 	; Y--
	BPL Dimmer_Fade2	 	; While Y >= 0, loop!

	STA Palette_Buffer + 16
	STA Palette_Buffer + 20
	STA Palette_Buffer + 24
	STA Palette_Buffer + 28
	; Commit palette fade
	LDA #$06
	STA <Graphics_Queue
	
	RTS    


JumpControl_Allowed:
	.byte $03, $02, $01

JumpControl_TilesProps:
	.byte $00, TILE_PROP_SOLID_ALL, TILE_PROP_SOLID_ALL, TILE_PROP_SOLID_ALL

JumpControl_SwitchProps:
	.byte (TILE_PROP_SOLID_TOP | TILE_PROP_ESWITCH), $00, $00, $00

JumpControl_PatternTables:
	.byte $66, $64, $62, $60

JumpControl_Remaining = Objects_Data1

ObjInit_JumpControl:
	LDY Objects_Property, X

	LDA JumpControl_Allowed, Y
	STA JumpControl_Remaining, X

	LDY JumpControl_Remaining, X
	
	LDA JumpControl_PatternTables, Y
	STA PatTable_BankSel

	LDA JumpControl_TilesProps, Y
	STA TileProperties + $70

	LDA #$00
	STA EventSwitch
	STA TileProperties + $E2
	STA TileProperties + $E3
	JMP Object_NoInteractions


ObjNorm_JumpControl:
	LDA JumpControl_Remaining, X
	BNE JumpControl_CheckJump
	
	LDA EventSwitch
	BEQ JumpControl_RTS

	LDY Objects_Property, X

	LDA JumpControl_Allowed, Y
	STA JumpControl_Remaining, X

	LDY JumpControl_Remaining, X
	
	LDA JumpControl_PatternTables, Y
	STA PatTable_BankSel

	LDA JumpControl_TilesProps, Y
	STA TileProperties + $70

	LDA #$00
	STA EventSwitch
	STA TileProperties + $E2
	STA TileProperties + $E3
	RTS

JumpControl_CheckJump:
	LDA <Player_Jumped
	BEQ JumpControl_RTS

	DEC JumpControl_Remaining, X
	
	LDY JumpControl_Remaining, X
	
	LDA JumpControl_PatternTables, Y
	STA PatTable_BankSel

	LDA JumpControl_TilesProps, Y
	STA TileProperties + $70

	LDA JumpControl_SwitchProps, Y
	STA TileProperties + $E2
	STA TileProperties + $E3

JumpControl_RTS:
	RTS		

;***********************************************************************************
; WEATHER
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; PROPERTIES
;	0 - Rain
;	1 - Snow
;	2 - Sand
;***********************************************************************************
; 	This produces weather effects for the stage. The Y position of the object determines how
;   strong the wind effect is (0 is no wind). An even X position causes the wind to blow left.
;	An odd X position causes the wind to blow right.
;***********************************************************************************

Weather_Patterns: .byte $7B, $7B, $55, $5F, $5D, $5D 
Rain_XVel: .byte $04, $05, $06, $07, $04, $05, $06, $06
Snow_XVel: .byte $01, $01, $01, $01, $01, $01, $01, $01
Sand_XVel: .byte $06, $07, $0A, $09, $06, $08, $08, $08
Rain_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04
Snow_YVel: .byte $01, $01, $01, $01, $02, $02, $02, $02
Sand_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04

Weather_Type = Objects_Data4
Weather_Ticker = Objects_Data5

DeleteWeather:
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE ObjInit_Weather2

	JMP Object_SetDeadAndNotSpawned

ObjInit_Weather:
	LDA #$06
	STA Objects_SpritesRequested, X

	JSR Object_NoInteractions

	LDA Objects_Property, X
	STA Weather_Type, X
	LDY #$04

ObjInit_Weather1:
	CPY <CurrentObjectIndexZ
	BEQ ObjInit_Weather2

	LDA Objects_ID, Y
	CMP #$0F
	BEQ DeleteWeather

ObjInit_Weather2:
	DEY
	BPL ObjInit_Weather1

	LDY #$05

	LDA Objects_YZ, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var2

	LDA Objects_XZ, X
	AND #$10
	BNE DontReverseWind

	LDA <Temp_Var2
	EOR #$FF
	ADD #$01
	STA <Temp_Var2
	
DontReverseWind:
	LDA <Temp_Var2
	STA Wind_Speed, X
	
	JSR Half_Value
	JSR Half_Value
	
	STA Wind_ExtraVel, X

	LDA #$01
	STA WeatherActive

KeepRandomizing:
	JSR Randomize_Weather

	LDA RandomN
	STA Weather_YPos, Y
	DEY
	BPL KeepRandomizing

DontReverseWind1:
	RTS

Wind_Speed = Objects_Data1
Wind_ExtraVel = Objects_Data10
Wind_ExtraVelCarry = Objects_Data11

ObjNorm_Weather:
	LDA Weather_Disabled
	BNE DontReverseWind1

	LDA #$00
	STA Wind

	LDA Player_IsClimbing
	BNE No_Wind

	LDA Wind_Speed, X
	STA Wind

No_Wind:
	LDA <Vert_Scroll
	STA <Temp_Var7

	LDA <Horz_Scroll
	STA <Temp_Var8

	LDA Objects_Property, X 
	CMP #$02
	BNE DoNextParticle0

	INC Weather_Ticker, X

	LDA Weather_Ticker, X
	AND #$01
	BNE DoNextParticle0

	LDA <Temp_Var7
	ADD #$80
	STA <Temp_Var7

	LDA <Temp_Var8
	ADD #$80
	STA <Temp_Var8


DoNextParticle0:
	LDA Object_SpriteRAMOffset, X
	STA TempX
	LDY #$05

DoNextParticle:
	LDX <CurrentObjectIndexZ
	JSR MoveSingleParticle

	LDX TempX

	JSR DrawSingleParticle
	LDA TempX
	ADD #$04
	STA TempX
	DEY
	BPL DoNextParticle
	RTS

MoveSingleParticle:	

	LDA Weather_XPos, Y
	ADD Weather_XVel, Y
	ADD Wind_ExtraVel, X
	STA Weather_XPos, Y

	LDA Weather_YPos, Y
	ADD Weather_YVel, Y
	STA Weather_YPos, Y

	CMP #$F8
	BCC MoveSingleParticle1

	JSR Randomize_Weather

MoveSingleParticle1:
	RTS

Randomize_Weather:
	STY TempY
	JSR Randomize

	LDY TempY
	LDX <CurrentObjectIndexZ
	LDA RandomN
	STA Weather_XPos, Y

	LDA #$00
	STA Weather_YPos, Y

	LDA RandomN + 1
	AND #$07
	STA TempA

	LDA Weather_Type, X
	ASL A
	ASL A
	ASL A
	ORA TempA
	TAY

	LDY TempY

	LDA Rain_XVel, Y
	STA Weather_XVel, Y

	LDA RandomN + 2
	AND #$07
	STA TempA

	LDA Weather_Type, X
	ASL A
	ASL A
	ASL A
	ORA TempA

	TAY

	LDA Rain_YVel, Y
	LDY TempY
	STA Weather_YVel, Y

	LDA Objects_XZ, X
	AND #$10
	BNE DoNotReverse

	LDA Weather_XVel, Y
	EOR #$FF
	ADD #$01
	STA Weather_XVel, Y

DoNotReverse: 

	LDA RandomN + 3
	AND #$01
	STA TempA

	LDA Weather_Type, X
	ASL A
	ORA TempA

RainPattern:
	TAY
	LDA Weather_Patterns, Y
	LDY TempY
	STA Weather_Pattern, Y
	RTS

DrawSingleParticle:

	LDA Weather_YPos, Y
	STA Sprite_RAM, X

	LDA Weather_XPos, Y
	SUB <Temp_Var8
	STA Sprite_RAM + 3, X

	LDA Weather_Pattern, Y
	STA Sprite_RAM + 1, X

	LDA #$02
	STA TempA

	LDA Weather_XVel, Y
	BMI DontFlipParticle

	LDA #SPR_HFLIP
	ORA TempA
	STA TempA

DontFlipParticle:
	LDA TempA
	STA Sprite_RAM + 2, X
	RTS
    


;***********************************************************************************
; Key Piece Collection
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; PROPERTIES
;	0 - 1 piece needed
;	1 - 2 pieces needed
;	2 - 3 pieces needed
;	3 - 4 pieces needed
;	4 - 5 pieces needed
;***********************************************************************************
;	This is an indicator for a number of key coins to collect. Once you've collected the
;	indicated number, a key is produced. The indicator fo number of pieces needed is displayed
;	in the upper left hand corner.
;***********************************************************************************
KeyPieceGet:
	.byte $01, $02, $04, $08, $10

KeyPieceXOffset:
	.byte $10, $18, $20, $28, $30

ObjInit_KeyPieceCollection:
	LDA #$05
	STA Objects_SpritesRequested,X

	LDA #$FF
	STA Objects_YHiZ, X
	INC Objects_Global, X
	RTS

ObjNorm_KeyPieceCollection:
	LDA #$93
	STA <Temp_Var1

	LDA #$95
	STA <Temp_Var2

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y
	CPY #$00
	BEQ ObjNorm_KeyPieceCollection1

	LDA <Temp_Var1
	ADD #$40
	STA <Temp_Var1

	LDA <Temp_Var2
	ADD #$40
	STA <Temp_Var2

ObjNorm_KeyPieceCollection1:
	LDY Object_SpriteRAMOffset, X
	LDA Objects_Data4, X
	STA <Temp_Var5

	LDA Objects_Property, X
	STA <Temp_Var6
	TAX

CheckNextPiece:
	
	LDA #$08
	STA Sprite_RAM, Y
	LDA #SPR_PAL3
	STA Sprite_RAM + 2, Y
	LDA <Temp_Var5
	AND KeyPieceGet, X
	BNE UseFilledKey

	LDA <Temp_Var2
	BNE DrawKeyPiece

UseFilledKey:
	DEC <Temp_Var6

UseFilledKey1:
	LDA <Temp_Var1

DrawKeyPiece:
	STA Sprite_RAM + 1, Y
	LDA KeyPieceXOffset, X

	STA Sprite_RAM + 3, Y
	INY
	INY
	INY
	INY

NextCheck:
	DEX
	BPL CheckNextPiece

	LDA <Temp_Var6
	BPL KeyPieceRTS

	LDX <CurrentObjectIndexZ

	LDA #OBJ_KEY
	STA Objects_ID, X
	INC Objects_Global, X

	LDA #$00
	STA Objects_Property, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_EXPLOSIONPROOF | ATTR_BUMPNOKILL | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	LDA <Player_X
	STA <Objects_XZ, X
	STA Key_ReappearX, X
	STA <Poof_X

	LDA <Player_XHi
	STA <Objects_XHiZ, X
	STA Key_ReappearXHi, X

	LDA <Player_Y
	ADD #$10
	STA <Objects_YZ, X
	STA Key_ReappearY, X
	STA <Poof_Y

	LDA <Player_YHi
	ADC #$00
	STA <Objects_YHiZ, X
	STA Key_ReappearYHi, X

	LDA #$01
	STA Key_Reappear, X

	LDA #$FF
	STA Key_AdjacentChecks, X

	JMP Common_MakePoof

KeyPieceRTS:
	RTS

KPFrames:
	.byte $00, $04

KPFlips1:
	.byte $00, $00, $00, SPR_HFLIP

KPFlips2:
	.byte $00, $00, SPR_HFLIP, SPR_HFLIP    


;***********************************************************************************
; Key Piece
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; PROPERTIES:
; 	0 - Fills key piece collection slot #1
; 	1 - Fills key piece collection slot #2
; 	2 - Fills key piece collection slot #3
; 	3 - Fills key piece collection slot #4
; 	4 - Fills key piece collection slot #5
; 	5 - Fills key piece collection slot #6
; 	6 - Fills key piece collection slot #7
;***********************************************************************************
; 	This object remains stationary and watch for contact with Mario. Once touched,
;	this object searches for the key collection object and fills in it's inidcated slot
; 	in the collection.
;***********************************************************************************	

ObjInit_KeyPiece:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions
	RTS

ObjNormal_KeyPiece:
	LDA <Player_HaltGameZ
	BNE KeyPiece_Draw

	LDY LastPatTab_Sel
	LDA PatTable_BankSel + 4, Y
	CMP #$4D
	BEQ KeyPiece_PTableFine

	TYA
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

KeyPiece_PTableFine:
	LDA KPFrames, Y
	STA Objects_Frame, X

	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

KeyPiece_Animate:
	INC Objects_Data2, X

	LDA Objects_Data2, X
	LSR A
	LSR A 
	LSR A
	AND #$03
	ORA Objects_Frame, X
	STA Objects_Frame, X

KeyPiece_Draw:
	JSR Object_Draw

	LDA Objects_Frame, X
	AND #$03
	TAX

	LDA KPFlips1, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y

	LDA KPFlips2, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

ObjHit_KeyPiece:
	LDY #$04

FindKeyTracker:
	LDA Objects_ID,Y
	CMP #OBJ_KEYPIECECOLLECTION
	BEQ SetKeyField

	DEY
	BPL FindKeyTracker
	RTS

SetKeyField:
	LDA Objects_Property, X
	TAX

	LDA Objects_Data4, Y
	ORA KeyPieceGet, X
	STA Objects_Data4, Y

	LDA #SND_MAPINVENTORYFLIP	 
	STA Sound_QMap	

	LDX <CurrentObjectIndexZ
	JMP Object_SetDeadEmpty    



Lightning_Action = Objects_Data1
Lightning_WaterColor = Objects_Data2


ObjInit_Lightning:
	JSR Object_NoInteractions
	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_Lightning;
	LDA Lightning_Action, X
	JSR DynJump

	.word Lightning_Fall
	.word Lightning_Electricuting
	
Lightning_Fall:
	LDA <Player_HaltGameZ
	BEQ Lightning_Normal
	JMP Lightning_Draw

Lightning_Normal:
	JSR Object_DeleteOffScreen

	LDA #$00
	STA <Objects_XVelZ, X

	LDA #$30
	STA <Objects_YVelZ, X

	JSR Object_CalcBoundBox
	JSR Object_Move
	JSR Object_DetectTiles
	JSR Object_InteractWithPlayer

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Lightning_GroundCheck

	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BNE Lightning_GroundCheck

	LDA Objects_BoundBottom, X
	STA Block_DetectY
	AND #$F0
	STA Debris_Y

	LDA Objects_BoundBottomHi, X
	STA Block_DetectYHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX
	AND #$F0
	STA Debris_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA Object_VertTileValue, X
	ADD #$01
	JSR Object_ChangeBlock

	JSR Common_MakeBricks
	JMP Lightning_Draw

Lightning_GroundCheck:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Lightning_CheckWater

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Lightning_Poof

	LDA <Objects_YZ, X
	AND #$F0
	ORA #$06
	STA <Objects_YZ, X

	JSR Object_PrepProjectile
	
	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y

	LDA #$C0
	STA SpecialObj_XVel,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	STA SpecialObj_YHi,Y

	JSR Object_PrepProjectile
	
	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y

	LDA #$30
	STA SpecialObj_XVel,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	STA SpecialObj_YHi,Y

	LDA #$02
	STA SpecialObj_Data1, Y

Lightning_Poof:
	JMP Object_PoofDie

Lightning_CheckWater:
	LDA Object_VertTileProp, X
	CMP #TILE_PROP_WATER
	BEQ Lightning_Electricute

	CMP #(TILE_PROP_WATER | TILE_PROP_FOREGROUND)
	BNE Lightning_Draw

Lightning_Electricute:
	LDA #$01
	STA Lightning_Action, X
	
	LDA #$20
	STA Objects_Timer, X

	LDA Palette_Buffer + $0F
	STA Lightning_WaterColor, X
	
Lightning_Draw:
	JSR Object_Draw

Lightning_RTS:
	RTS

Lightning_Electricuting:
	LDA Objects_Timer, X
	BNE Lightning_Flash

	JMP Object_Delete

Lightning_Flash:
	AND #$02
	BNE Lightning_FlashWhite

	LDA Lightning_WaterColor, X
	STA Palette_Buffer + $0F
	BNE Lightning_PlayerHurt

Lightning_FlashWhite:
	LDA #$30
	STA Palette_Buffer + $0F

Lightning_PlayerHurt:
	LDA Player_InWater
	BEQ Lightning_RTS

	JSR Player_GetHurt
	RTS     


;***********************************************************************************
; Spike
;***********************************************************************************
; IMMUNITIES:
;		Iceballs
;		Tail attacks
;		Stomping
;		Shell attacks
;***********************************************************************************
; 	Waits for Mario to get within 49 pixels, then shakes and falls. Once it hits the ground, it
;	shatters.
;***********************************************************************************	
ObjInit_IceSpike:
	LDA #(ATTR_ICEPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_SHELLPROOF
	STA Objects_BehaviorAttr, X

	LDA #BOUND8x16
	STA Objects_BoundBox, X
	RTS

IceSpike_Action = Objects_Data1

ObjNorm_IceSpike:
	
	LDA <Player_HaltGameZ
	BEQ IceSpike_Normal

	JMP Object_DrawAligned
	
IceSpike_Normal:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE IceSpike_NotDead

	JMP Object_BurstIce

IceSpike_NotDead:
	JSR Object_DeleteOffScreen

	LDA IceSpike_Action, X
	JSR DynJump

	.word IceSpike_Wait
	.word IceSpike_Shake
	.word IceSpike_Fall

IceSpike_Wait:
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$31
	BCS IceSpike_NoShake

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BEQ IceSpike_NoShake

	INC IceSpike_Action, X

	LDA #$20
	STA Objects_Timer, X

IceSpike_NoShake:
	JSR Object_InteractWithPlayer
	JMP Object_DrawAligned

IceSpike_Shake:
	LDA Objects_Timer, X
	BNE IceSpike_KeepShaking

	INC IceSpike_Action, X

IceSpike_KeepShaking:
	AND #$01
	STA <Temp_Var1

	LDA <Objects_XZ, X
	AND #$FE
	ORA <Temp_Var1
	STA <Objects_XZ, X
	STA <Objects_XZ, X

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JMP Object_DrawAligned

IceSpike_Fall:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ IceSpike_NoBurst

	JSR Object_BurstIce

IceSpike_NoBurst:
	JMP Object_DrawAligned    


ObjInit_Stars:
	JSR Object_NoInteractions
	
	LDA #$04
	STA Objects_SpritesRequested,X

	LDA #BOUND8x16
	STA Objects_BoundBox, X

	LDA #$10
	STA Objects_Timer2,X
	RTS		 ; Return

Stars_Timer = Objects_Data1

ObjNorm_Stars:
	LDA <Player_HaltGameZ
	BNE  StarsDraw

StarsAnimate:
	INC Stars_Timer, X

StarsDraw:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BEQ StarsDraw1

	RTS

StarsDraw1:
	JSR Object_ShakeAndCalcSprite
	
	LDX <CurrentObjectIndexZ
	LDA Stars_Timer, X
	CMP #$10
	BCC Stars_KeepDrawing

	JMP Object_Delete

Stars_KeepDrawing:
	STA <Temp_Var1
	


	LDA #$17
	STA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y

	LDA Objects_SpriteAttributes, X
	AND #SPR_PAL3
	STA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	
	LDA Objects_SpriteX, X
	SUB <Temp_Var1
	BCC Stars_Star2
	
	STA Sprite_RAMX, Y 

	LDA Objects_SpriteY, X
	SUB <Temp_Var1
	BCC Stars_Star2

	STA Sprite_RAMY, Y

Stars_Star2:
	LDA Objects_SpriteX, X
	ADD <Temp_Var1
	BCS Stars_Star3
	
	STA Sprite_RAMX + 4, Y

	LDA Objects_SpriteY, X
	SUB <Temp_Var1
	BCC Stars_Star3

	STA Sprite_RAMY + 4, Y

Stars_Star3:
	LDA Objects_SpriteX, X
	SUB <Temp_Var1
	BCC Stars_Star4
	
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	ADD <Temp_Var1
	BCS Stars_Star4

	STA Sprite_RAMY + 8, Y

Stars_Star4:
	LDA Objects_SpriteX, X
	ADD <Temp_Var1
	BCS StarsDrawRTS
	
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X
	ADD <Temp_Var1
	BCS StarsDrawRTS

	STA Sprite_RAMY + 12, Y

StarsDrawRTS:
	RTS		    


	; X and Y offsets for the exploding Bob-omb stars
BombStars_XOff:	.byte -$04, $04, $08, $04, -$04, -$08, $00, $08, $08, $00, -$08, -$08
BombStars_YOff:	.byte -$08, -$08, $00, $08, $08, $00, $08, $04, -$04, -$08, -$04, $04

Explosion_Offset = Objects_Data1

ObjInit_Explosion:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND48x48
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA RotatingColor_Cnt
	RTS		 ; Return

ObjNorm_Explosion:
	
	LDA <Player_HaltGameZ
	BNE DrawEx	 ; If gameplay is halted, jump to PRG003_A82E

	INC Explosion_Offset,X	 ; Otherwise, Var4++

DrawEx:
	LDA Objects_Timer,X
	BNE PRG003_A836	 ; If timer has not expired, jump to PRG003_A836

	JMP Object_SetDeadEmpty	 ; Otherwise, mark Bob-omb as Dead/Empty and don't come back!

PRG003_A836:

	JSR Explosion_CalcBoundBox
	JSR Explosion_KillOthers
	JSR Object_InteractWithPlayer

Explosion_NoKill:
	JSR Object_CalcSpriteXY_NoHi

	; Temp_Var16 = 5
	LDA #$05
	STA <Temp_Var16

PRG003_A83D:
	; Temp_Var1 = Bob-omb's sprite Y
	LDA <Objects_SpriteY,X
	STA <Temp_Var1	

	; Temp_Var2 = Bob-omb's sprite X + 4
	LDA <Objects_SpriteX,X
	ADD #$04
	STA <Temp_Var2

	LDA Objects_Data1,X
	LSR A		 ; Var4 / 2
	PHA		 ; Save value

	; Temp_Var3 = 0 to 3, depending on Var4 / 2
	AND #$03
	STA <Temp_Var3

	LDX <Temp_Var16	 ; X = Temp_Var16

	PLA		 ; Restore Var4 / 2

	AND #$04	 ; Mask 0-3
	BEQ PRG003_A85C	 ; If result is zero, jump to PRG003_A85C

	; Otherwise, X += 6
	TXA
	ADD #$06
	TAX

PRG003_A85C:
	LDA <Temp_Var1
	ADD BombStars_YOff,X
	STA <Temp_Var1

	LDA <Temp_Var2
	ADD BombStars_XOff,X
	STA <Temp_Var2

	DEC <Temp_Var3	 ; Temp_Var3--
	BPL PRG003_A85C	 ; While Temp_Var3 >= 0, loop!

	LDX <CurrentObjectIndexZ		 ; X = object slot index

	JSR Sprite_NoCarryIfVisible
	BCS PRG003_A89D	 ; If this star is not visible, jump to PRG003_A89D

	LDA <Temp_Var16
	ASL A
	ASL A		; A = Temp_Var16 * 4 (one sprite per star)
	ADC Object_SpriteRAMOffset,X	 ; Add the base Sprite_RAM offset
	TAY		 ; -> 'Y'

	; Star Y
	LDA <Temp_Var1
	STA Sprite_RAM+$00,Y

	; Star X
	LDA <Temp_Var2
	STA Sprite_RAM+$03,Y

	; Star pattern
	LDA #$17
	STA Sprite_RAM+$01,Y

	LDA <Counter_1
	LSR A	
	LSR A	
	ADD <CurrentObjectIndexZ
	AND #$03	 ; Palette select 0 to 3
	STA Sprite_RAM+$02,Y	 ; Set attributes

PRG003_A89D:
	DEC <Temp_Var16	 ; Temp_Var16--
	BPL PRG003_A83D	 ; While Temp_Var16 >= 0, loop!

Explosion_BumpBlocks:
	LDA Objects_Timer,X
	AND #$07
	TAY

	LDA <Objects_XZ, X
	ADD ExplodeXOffsets + 8, Y
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC ExplodeXOffsets, Y
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	ADD ExplodeYOffsets + 8, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC ExplodeYOffsets, Y
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_STONE)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_STONE)
	BEQ Explosion_Bust 

	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_ITEM)
	BCS Explosion_Bump

Explosion_BumpRTS:
	RTS

Explosion_Bust:
	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp

Explosion_Bump:
	JSR Object_DirectBumpBlocks
	RTS

Explosion_CalcBoundBox:
	LDA <Objects_XZ, X
	SUB #$18
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA Objects_BoundLeftHi, X

	LDA Objects_BoundLeft, X
	ADD #$30
	STA Objects_BoundRight, X

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Objects_BoundRightHi, X
	
	LDA <Objects_YZ, X
	SUB #$18
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Objects_BoundTopHi, X

	LDA Objects_BoundTop, X
	ADD #$30
	STA Objects_BoundBottom, X

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS

ExplodeXOffsets:
	.byte $FF, $00, $00, $FF, $00, $FF, $00, $00
	.byte $F8, $08, $18, $F8, $18, $F8, $08, $18

ExplodeYOffsets
	.byte $FF, $FF, $FF, $00, $00, $00, $00, $00
	.byte $F8, $F8, $F8, $08, $08, $18, $18, $18

Sprite_NoCarryIfVisible:
	LDA Objects_SpritesVerticallyOffScreen,X	 
	BNE PRG003_B8E7	 ; If any of the sprites are vertically off-screen, jump to PRG003_B8E7

	LDA <Objects_SpriteY,X
	CMP #208
	BGE PRG003_B8E7	 ; If sprite Y >= 208, jump to PRG003_B8E7

	LDY #$40	 ; Y = $40

	LDA <Objects_SpriteX,X
	BMI PRG003_B8DA	 ; If sprite X >= $80, jump to PRG003_B8DA

	LDY #$C0	 ; Y = $C0

PRG003_B8DA:
	CPY <Temp_Var2	 ; Compare $40 or $C0 to input X value

	EOR Objects_SpritesVerticallyOffScreen,X

	BMI PRG003_B8E5	 ; If there are inappropriate horizontally off-screen sprites (??) jump to PRG003_B8E5

	BLT PRG003_B8E7	 ; If input X value < 'Y', jump to PRG003_B8E7 (carry clear, but will set carry)
	BGE PRG003_B8E9	 ; If input X value >= 'Y', jump to PRG003_B8E9 (carry set, but will be clear)

PRG003_B8E5:
	BLT PRG003_B8E9	 ; If input X value < 'Y', jump to PRG003_B8E9 (carry clear)

PRG003_B8E7:
	SEC		 ; Set carry
	RTS		 ; Return

PRG003_B8E9:
	CLC		 ; Clear carry
	RTS		 ; Return
    