    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	; 

OBJ_WATERSPLASH     = $14    
OBJ_EVENTFILLER		= $15
OBJ_TIMER           = $16
OBJ_CLOCK           = $17
OBJ_DIMMER          = $18
OBJ_JUMPCONTROL     = $19
OBJ_WEATHER         = $1A
OBJ_KEYPIECECOLLECTION       = $1B
OBJ_KEYPIECES       = $1C
OBJ_LIGHTNINGBOLT   = $1D
OBJ_ICESPIKE        = $1E
OBJ_STARS           = $1F
OBJ_EXPLOSION      = $20
OBJ_MARIO_BLACK	   = $21
OBJ_BLOCKFLIP	   = $22
OBJ_BRIDGEBUILD    = $23
OBJ_BLOCKSWITCHER  = $24
OBJ_MUSHROOMBLOCK	= $25
OBJ_MAGNET			= $26
OBJ_EVENTSETTER		= $27

    .word ObjInit_WaterSplash   ; Object $14
	.word ObjInit_EventFill	; Object $15
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
    .word ObjInit_MarioBlack ; Object $21
    .word ObjInit_BlockFlip ; Object $22
    .word ObjInit_BridgeBuild ; Object $23
    .word ObjInit_BlockSwitcher ; Object $24
    .word ObjInit_MushroomBlock ; Object $25
    .word ObjInit_Magnet ; Object $26
    .word ObjInit_EventSetter ; Object $27
	
	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_WaterSplash   ; Object $14
	.word ObjNorm_EventFill	    ; Object $15
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
    .word ObjNorm_MarioBlack     ; Object $21
    .word ObjNorm_BlockFlip     ; Object $22
    .word ObjNorm_BridgeBuild     ; Object $23
    .word ObjNorm_BlockSwitcher     ; Object $24
    .word ObjNorm_MushroomBlock     ; Object $25
    .word ObjNorm_Magnet     ; Object $26
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
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $15
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $16
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $17
    .byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $18
    .byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $19
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1A
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1B
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $1C
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH8  ; Object $1D
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $1E
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	 ; Object $1F
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $20
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $21
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $22
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $23
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $24
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $25
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $26
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $27

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE         ; Object $14
	.byte OPTS_SETPT6 | $23		; Object $15
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
    .byte OPTS_SETPT6 | $4F	        ; Object $25
    .byte OPTS_SETPT5 | $36	        ; Object $26
    .byte OPTS_NOCHANGE	        ; Object $27
	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STARDEATH		; Object $14
    .byte KILLACT_STARDEATH		; Object $15
    .byte KILLACT_STARDEATH     ; Object $16
    .byte KILLACT_STARDEATH     ; Object $17
    .byte KILLACT_STARDEATH     ; Object $18
    .byte KILLACT_STARDEATH     ; Object $19
    .byte KILLACT_NORMALSTATE     ; Object $1A
    .byte KILLACT_NORMALSTATE     ; Object $1B
    .byte KILLACT_NORMALSTATE     ; Object $1C
    .byte KILLACT_STARDEATH     ; Object $1D
    .byte KILLACT_NORMALSTATE   ; Object $1E
    .byte KILLACT_NORMALSTATE   ; Object $1F
    .byte KILLACT_NORMALSTATE   ; Object $20
    .byte KILLACT_NORMALSTATE   ; Object $21
    .byte KILLACT_NORMALSTATE   ; Object $22
    .byte KILLACT_NORMALSTATE   ; Object $23
    .byte KILLACT_NORMALSTATE   ; Object $24
    .byte KILLACT_STARDEATH   ; Object $25
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
	.byte $47, $47
    .byte $15, $15
	.byte $13, $13
	.byte $11, $11
	.byte $85, $85
	.byte $83, $83
	.byte $81, $81
    
ObjP15:
	; water
    .byte $E1, $E3, $00, $00

	; lava
	.byte $C1, $C3, $FF, $FF
	.byte $C5, $C7, $FF, $FF
	.byte $C9, $CB, $FF, $FF
	.byte $CD, $CF, $FF, $FF
	.byte $D1, $D3, $FF, $FF
	.byte $D5, $D7, $FF, $FF
	.byte $D9, $DB, $FF, $FF
	.byte $DD, $DF, $FF, $FF

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
	.byte $EB, $EB
	
ObjP26:
	.byte $87, $89

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
	LDA #BOUND16x16
	STA Objects_BoundBox, X
	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTilesForced

	JMP Object_NoInteractions
	
WaterSplash_Frame = Objects_Data1
WaterSplash_IsOil = Objects_Data2

ObjNorm_WaterSplash:
	LDA <Player_HaltGameZ
	BEQ WaterSplash_Norm

	JMP WaterSplash_Draw

WaterSplash_Norm:
	LDA #$02
	STA Objects_SpritesRequested, X
	STA <Objects_YVelZ, X

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDA Objects_Timer, X
	CMP #$09
	BCC WaterSplash_KeepSplashing

	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_SOLID_ALL)
	BCC WaterSplash_KeepSplashing

	JMP Object_Delete

WaterSplash_KeepSplashing:

	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_LAVA)
	BNE WaterSplash_KeepSplashing1

	LDA <Objects_YZ, X
	ORA #$04
	STA <Objects_YZ, X

WaterSplash_KeepSplashing1:
	LDA Objects_Timer, X
	BNE WaterSplash_Animate

	JMP Object_Delete
	
WaterSplash_Animate:
	LDA Objects_Timer, X
	LSR A
	LSR A

	AND #$03
	STA Objects_Frame, X

	LDA WaterSplash_IsOil, X
	BEQ WaterSplash_Draw

	LDA Objects_Frame, X
	ADD #$03
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

ObjInit_EventFill:
	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JMP Object_NoInteractions

WaterFill_Ticks = Objects_Data1

WaterFill_Flip:
	.byte $00, SPR_VFLIP

ObjNorm_EventFill:
	LDA Objects_Property, X
	JSR DynJump

	.word WaterFill_Norm
	.word LavaFallFill_Norm
	.word LavaPoolFill_Norm
	.word LavaDrain_Norm

WaterFill_Norm:
	LDA #$40
	STA Objects_XVelZ, X

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
	
	LDA #$C2
	JSR Object_ChangeBlock

	JMP FillWater_Animate

FillWater_DrawWater:
	LDA <Objects_XZ, X
	AND #$0F
	BNE FillWater_Animate

	LDA #$C2
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

LavaFill_FrameTicker = Objects_Data2
LavaFill_BlockUpdated = Objects_Data3

LavaFallFill_Norm:

	LDA #$08
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity
	LDA <Objects_YZ, X
	AND #$0F
	BEQ Lava_ResetBlockDraw

	CMP #$0F
	BNE Lava_FallDraw

	LDA LavaFill_BlockUpdated, X
	BNE Lava_FallDraw

	LDA Block_NeedsUpdate
	BNE Lava_FallDraw

	INC LavaFill_BlockUpdated, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	CMP #TILE_PROP_SOLID_ALL
	BCC Lava_DrawBlock

	JMP Object_Delete

Lava_DrawBlock:	
	LDA #$C6
	JSR Object_ChangeBlock
	JMP Lava_FallDraw

Lava_ResetBlockDraw:	
	LDA #$00
	STA LavaFill_BlockUpdated, X

Lava_FallDraw:
	LDA #(SPR_VFLIP)
	STA Objects_Orientation, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X

	INC LavaFill_FrameTicker, X
	
	LDA LavaFill_FrameTicker, X
	LSR A
	LSR A
	LSR A
	AND #$07
	ADD #$01
	STA Objects_Frame, X

	JMP Object_Draw16x32


LavaPool_XOffset:
	.byte $08, $18


LavaPoolFill_Norm:
	LDA #$FC
	STA <Objects_YVelZ, X
	
	LDA <Objects_YZ, X
	CMP #$7E
	BCS LavaPool_Rise

	JMP Lava_PoolDraw

LavaPool_Rise:
	JSR Object_ApplyYVel_NoGravity
	LDA <Objects_YZ, X
	AND #$0F
	BEQ LavaPool_ResetBlockDraw

	CMP #$0F
	BNE Lava_PoolDraw

	LDA LavaFill_BlockUpdated, X
	CMP #$02
	BCS Lava_PoolDraw

	LDA Block_NeedsUpdate
	BNE Lava_PoolDraw

	LDY LavaFill_BlockUpdated, X
	INC LavaFill_BlockUpdated, X
	
	LDA <Objects_XZ, X
	ADD LavaPool_XOffset, Y
	STA Block_DetectX

	LDA <Objects_YZ, X
	ADD #$18
	STA Block_DetectY

	LDA #$00
	STA Block_DetectXHi
	STA Block_DetectYHi

	LDA #$D8
	JSR Object_ChangeBlock
	JMP Lava_PoolDraw

LavaPool_ResetBlockDraw:	
	LDA #$00
	STA LavaFill_BlockUpdated, X

Lava_PoolDraw:
	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X

	INC LavaFill_FrameTicker, X
	
	LDA LavaFill_FrameTicker, X
	LSR A
	LSR A
	LSR A
	AND #$07
	ADD #$01
	STA Objects_Frame, X
	
	JSR Object_Draw16x32
	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y
	
	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 20, Y
	
	LDA #$FF
	STA Sprite_RAMTile + 24, Y
	STA Sprite_RAMTile + 28, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y
	STA Sprite_RAMAttr + 20, Y
	STA Sprite_RAMAttr + 24, Y
	STA Sprite_RAMAttr + 28, Y

	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 16, Y
	STA Sprite_RAMY + 20, Y
	ADD #$10
	STA Sprite_RAMY + 24, Y
	STA Sprite_RAMY + 28, Y	

	LDA Sprite_RAMX, Y
	ADD #$10
	STA Sprite_RAMX + 16, Y
	STA Sprite_RAMX + 24, Y
	ADD #$08
	STA Sprite_RAMX + 20, Y
	STA Sprite_RAMX + 28, Y
	RTS
		

LavaDrain_XOffset:
	.byte $08, $18


LavaDrain_Norm:
	LDA #$02
	STA <Objects_YVelZ, X
	
	LDA <Objects_YZ, X
	CMP #$8F
	BCC LavaDrain_Fall

	JMP Lava_DrainDraw

LavaDrain_Fall:
	JSR Object_ApplyYVel_NoGravity
	LDA <Objects_YZ, X
	CMP #$70
	BCS LavaDrain_ResetBlockDraw

	AND #$0F
	BEQ LavaDrain_ResetBlockDraw

	CMP #$0F
	BNE Lava_DrainDraw

	LDA LavaFill_BlockUpdated, X
	CMP #$02
	BCS Lava_DrainDraw

	LDA Block_NeedsUpdate
	BNE Lava_DrainDraw

	LDY LavaFill_BlockUpdated, X
	INC LavaFill_BlockUpdated, X
	
	LDA <Objects_XZ, X
	ADD LavaDrain_XOffset, Y
	STA Block_DetectX

	LDA <Objects_YZ, X
	ADD #$18
	STA Block_DetectY

	LDA #$00
	STA Block_DetectXHi
	STA Block_DetectYHi

	LDA #$C1
	JSR Object_ChangeBlock
	JMP Lava_DrainDraw

LavaDrain_ResetBlockDraw:	
	LDA #$00
	STA LavaFill_BlockUpdated, X

Lava_DrainDraw:
	LDA #(SPR_PAL3 | SPR_BEHINDBG)
	STA Objects_SpriteAttributes, X

	INC LavaFill_FrameTicker, X
	
	LDA LavaFill_FrameTicker, X
	LSR A
	LSR A
	LSR A
	AND #$07
	ADD #$01
	STA Objects_Frame, X
	
	JSR Object_Draw16x32
	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y
	
	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 20, Y
	
	LDA #$FF
	STA Sprite_RAMTile + 24, Y
	STA Sprite_RAMTile + 28, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y
	STA Sprite_RAMAttr + 20, Y
	STA Sprite_RAMAttr + 24, Y
	STA Sprite_RAMAttr + 28, Y

	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 16, Y
	STA Sprite_RAMY + 20, Y
	ADD #$10
	STA Sprite_RAMY + 24, Y
	STA Sprite_RAMY + 28, Y	

	LDA Sprite_RAMX, Y
	ADD #$10
	STA Sprite_RAMX + 16, Y
	STA Sprite_RAMX + 24, Y
	ADD #$08
	STA Sprite_RAMX + 20, Y
	STA Sprite_RAMX + 28, Y

	LDA <Objects_YZ, X	
	CMP #$80
	BCC Lava_DrainDrawRTS

	LDA #$F8
	STA Sprite_RAMY + 8, Y
	STA Sprite_RAMY + 12, Y
	STA Sprite_RAMY + 24, Y
	STA Sprite_RAMY + 28, Y

Lava_DrainDrawRTS:
	RTS

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
	LDA #$04
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

	LDA #$BD
	ADD <Temp_Var1
	STA Sprite_RAMTile, Y

	LDA #$18
	STA Sprite_RAMY, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y

	LDA #$08
	STA Sprite_RAMX, Y

	LDX #$02

DrawTimer1:
	LDA #$18
	STA Sprite_RAMY+4, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr+4, Y

	LDA Timer_XOffset, X
	STA Sprite_RAMX+4, Y

	LDA <DigitsResult, X
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile+4, Y

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

Weather_Patterns: .byte $7B, $5F, $5D, $9B
Weather_VelOffsets: .byte $00, $08, $10, $18
Rain_XVel: .byte $04, $05, $06, $07, $04, $05, $06, $06
Snow_XVel: .byte $00, $00, $00, $00, $00, $00, $00, $00
Sand_XVel: .byte $06, $07, $0A, $09, $06, $08, $08, $08
Leaf_XVel: .byte $01, $02, $02, $01, $01, $01, $01, $02
Rain_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04
Snow_YVel: .byte $02, $03, $02, $02, $03, $02, $02, $01
Sand_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04
Leaf_YVel: .byte $01, $02, $01, $01, $02, $01, $01, $03
Weather_PalOffsets: .byte $00, $02, $04, $06
Rain_Pals: .byte SPR_PAL2, SPR_PAL2
Snow_Pals: .byte SPR_PAL2, SPR_PAL2
Sand_Pals: .byte SPR_PAL3, SPR_PAL3
Leaf_Pals: .byte SPR_PAL1, SPR_PAL3
Weather_StartX: .byte $08, $7E, $2A, $A8, $54, $D2, $3A, $C0
Weather_StartY: .byte $93, $15, $63, $BD, $E7, $39, $C0, $7E

WEATHER_RAIN = 0
WEATHER_SNOW = 1
WEATHER_SAND = 2
WEATHER_LEAF = 3

Weather_InitX = Temp_Var6
Weather_InitY = Temp_Var7

ObjInit_Weather:
	LDA #OBJ_WEATHER
	STA WeatherActive
	STA <Object_Check

	JSR CheckObjectsOfType3

	LDA <Num_Objects
	CMP #$01
	BEQ Weather_NotDupe

	JMP Object_Delete

Weather_NotDupe:
	LDX <CurrentObjectIndexZ
	LDA #$08
	STA Objects_SpritesRequested, X

	JSR Object_NoInteractions

	LDA Objects_Property, X
	STA Weather_Type

	LDA RandomN
	STA <Weather_InitX

	LDA RandomN + 1
	STA <Weather_InitY

	LDY #$07

Weather_InitXY:		
	LDA <Weather_InitX
	ADD Weather_StartX, Y
	STA Weather_XPos, Y

	LDA <Weather_InitY
	ADD Weather_StartY, Y
	STA Weather_YPos, Y

	LDX <Weather_Type

	TYA
	ADD Weather_VelOffsets, X
	TAX

	LDA Wind
	JSR Half_Value
	JSR Half_Value
	ADD Rain_XVel, X
	STA Weather_XVel, Y

	LDA Rain_YVel, X
	STA Weather_YVel, Y

	LDA Wind
	BMI Weather_DoLoop

	LDA Weather_XVel, Y
	JSR Negate
	STA Weather_XVel, Y

Weather_DoLoop:	

	DEY
	BPL Weather_InitXY
	RTS

ObjNorm_Weather:
	LDA <Player_HaltGameZ
	BEQ Weather_Norm
	JMP Weather_Draw

Weather_Norm:
	JSR Weather_Move
	JMP Weather_Draw

Weather_Move:
	LDY #$07

Weather_MoveLoop:
	LDA Weather_XPos, Y
	ADD Weather_XVel, Y
	STA Weather_XPos, Y

	LDA Weather_YPos, Y
	ADD Weather_YVel, Y
	STA Weather_YPos, Y
	DEY
	BPL Weather_MoveLoop
	RTS

Weather_Type = Temp_Var8
Weather_Tile = Temp_Var2
Weather_Palette1 = Temp_Var3
Weather_Palette2 = Temp_Var4
Weather_Orientation = Temp_Var5

Weather_PaletteUse:
	.byte $00, $01, $00, $01, $00, $01
	
Weather_Draw:
	LDA Objects_Property, X
	STA <Weather_Type
	TAY

	LDA Weather_Patterns, Y
	STA <Weather_Tile

	LDA Weather_PalOffsets, Y
	TAY

	LDA Rain_Pals, Y
	STA <Weather_Palette1

	LDA Rain_Pals + 1, Y
	STA <Weather_Palette2

	LDY #$00
	LDA Wind
	BPL Weather_SetOrientation

	LDY #SPR_HFLIP

Weather_SetOrientation:	
	STY <Weather_Orientation

	LDY Object_SpriteRAMOffset, X
	LDX #$07
 
 Weather_DrawLoop:
	LDA Weather_XPos, X
	SUB <Horz_Scroll
	STA Sprite_RAMX, Y

	LDA Weather_YPos, X
	SUB <Vert_Scroll
	STA Sprite_RAMY, Y

	LDA Weather_PaletteUse, X
	BNE Weather_UsePal2

	LDA Weather_Palette1
	BNE Weather_SetSpriteAttr

Weather_UsePal2:
	LDA Weather_Palette2

Weather_SetSpriteAttr:	
	ORA <Weather_Orientation
	STA Sprite_RAMAttr, Y

	LDA Weather_Tile
	STA Sprite_RAMTile, Y

	INY
	INY
	INY
	INY
	DEX
	BPL Weather_DrawLoop
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
	STA Objects_Global, X

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

	LDA <Player_YZ
	ADD #$10
	STA <Objects_YZ, X
	STA Key_ReappearY, X
	STA <Poof_Y

	LDA <Player_YHiZ
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
	JSR Object_DetectTiles
	JSR Object_CheckForeground
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
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
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

	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SOLID_OBJECTINTERACT)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
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

ObjInit_MarioBlack:
	STX <Temp_Var1
	
	LDY #$04

BlockFlip_CheckNext:	
	CPY <Temp_Var1
	BEQ BlockFlip_NextCheck

	LDA Objects_ID, Y
	CMP #OBJ_MARIO_BLACK
	BNE BlockFlip_NextCheck

	JSR Object_Delete

ObjNorm_MarioBlack:
	LDA #$0F
	STA Palette_Buffer + 17
	STA Palette_Buffer + 18
	STA Palette_Buffer + 19
	RTS

	
Block_CheckIndex = Objects_Data1
Block_XDistances:
	.byte $08, $18, $28, $08

ObjInit_BlockFlip:
	RTS

BlockFlip_NextCheck:
	DEY
	BPL BlockFlip_CheckNext

	LDA #BOUND16x48
	STA Objects_BoundBox, X
	RTS

ObjNorm_BlockFlip:
	JSR Object_CalcBoundBox
	JSR Object_DeleteOffScreen

	LDA Block_NeedsUpdate
	BNE BlockFlip_RTS

	LDA Block_CheckIndex, X
	AND #$03
	TAY

	LDA <Objects_XZ, X
	ADD Block_XDistances, Y
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$08
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi
	
	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #(TILE_PROP_STONE | TILE_PROP_SOLID_ALL)
	BNE BlockFlip_Next

	LDA <Objects_YZ, X
	SUB #$10
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Block_DetectYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #$00
	BNE BlockFlip_Next

	LDA Block_DetectY
	ADD #$10
	STA Block_DetectY

	LDA Block_DetectYHi
	ADC #$00
	STA Block_DetectYHi

	JSR Object_DetectTile

	LDA Tile_LastValue
	AND #$C0
	ORA #$01
	STA Tile_LastValue

	JSR Object_ChangeBlock

	LDA Block_DetectX
	STA Debris_X

	LDA Block_DetectY
	STA Debris_Y
	
	JSR Common_MakeBricks

BlockFlip_Next:
	INC Block_CheckIndex, X
	
BlockFlip_RTS:
	RTS

BridgeBuild_Activated = Objects_Data1
BridgeBuild_CheckOffset = Objects_Data2
BridgeBuild_BlockCheck = Objects_Data3

BridgeBuild_DirectionX:
	.byte $10, $F0, $00, $00

BridgeBuild_DirectionY:	
	.byte $00, $00, $10, $F0

	
ObjInit_BridgeBuild:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter
	
	TYA
	STA BridgeBuild_BlockCheck, X
	
	JMP Object_NoInteractions

ObjNorm_BridgeBuild:
	LDA BridgeBuild_Activated, X
	BEQ BridgeBuild_Wait

	JMP BridgeBuild_Build

BridgeBuild_Wait:
	JSR Object_DeleteOffScreen

	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	TYA
	CMP BridgeBuild_BlockCheck, X
	BEQ BridgeBuild_RTS

	INC BridgeBuild_Activated, X

BridgeBuild_RTS:
	RTS	

BridgeBuild_XOffsets:
	.byte $10, $00, $F0, $00
	.byte $00, $00, $FF, $00

BridgeBuild_YOffsets:
	.byte $00, $10, $00, $F0
	.byte $00, $00, $00, $FF

BridgeBuild_Build:
	LDA Objects_Timer, X
	BNE BridgeBuild_RTS

	LDA Block_NeedsUpdate
	BNE BridgeBuild_RTS

	LDA #$03
	STA BridgeBuild_CheckOffset, X

BridgeBuild_Next:
	LDY BridgeBuild_CheckOffset, X
	LDA <Objects_XZ, X
	ADD BridgeBuild_XOffsets, Y
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC BridgeBuild_XOffsets + 4, Y
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	ADD BridgeBuild_YOffsets, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC BridgeBuild_YOffsets + 4, Y
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	TYA
	CMP BridgeBuild_BlockCheck, X
	BEQ BridgeBuild_Change

	DEC BridgeBuild_CheckOffset, X
	BPL BridgeBuild_Next

	JMP Object_Delete
	RTS

BridgeBuild_Change:
	EOR #$01

	JSR Object_ChangeBlock

	LDA Tile_DetectionX
	STA <Objects_XZ, X

	LDA Tile_DetectionXHi
	STA <Objects_XHiZ, X

	LDA Tile_DetectionY
	STA <Objects_YZ, X

	LDA Tile_DetectionYHi
	STA <Objects_YHiZ, X

	LDA #$08
	STA Objects_Timer, X

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE BridgeBuild_ChangeRTS	

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof

BridgeBuild_ChangeRTS:
	RTS

BlockSwitch_TilePropsB:
	.byte $00, TILE_PROP_SOLID_ALL,  TILE_PROP_SOLID_ALL,  TILE_PROP_SOLID_ALL
	.byte TILE_PROP_SOLID_ALL, $00,  TILE_PROP_SOLID_ALL,  TILE_PROP_SOLID_ALL
	.byte TILE_PROP_SOLID_ALL, TILE_PROP_SOLID_ALL, $00, TILE_PROP_SOLID_ALL
	.byte TILE_PROP_SOLID_ALL, TILE_PROP_SOLID_ALL, TILE_PROP_SOLID_ALL, $00

BlockSwitch_TilePropsA:
	.byte TILE_PROP_SOLID_ALL, $00, $00, $00
	.byte $00, TILE_PROP_SOLID_ALL, $00, $00
	.byte $00, $00, TILE_PROP_SOLID_ALL, $00
	.byte $00, $00, $00, TILE_PROP_SOLID_ALL

BlockSwitch_Tiles:
	.byte $60, $62, $64, $66

BlockSwitch_Timers:
	.byte $80, $60, $30

BlockSwitch_Timer = Objects_Data1
BlockSwitch_Index = Objects_Data2

ObjInit_BlockSwitcher:
	RTS

ObjNorm_BlockSwitcher:
	LDA <Player_HaltGameZ
	BEQ BlockSwitcher_Norm

	RTS

BlockSwitcher_Norm:	
	
	INC BlockSwitch_Timer, X
	
	LDY Objects_Property, X
	LDA BlockSwitch_Timer, X
	CMP BlockSwitch_Timers, Y
	BCC BlockSwitcher_RTS

	LDA #$00
	STA BlockSwitch_Timer, X

	INC BlockSwitch_Index, X

	LDA BlockSwitch_Index, X
	AND #$03
	TAY

	LDA BlockSwitch_Tiles, Y
	STA PatTable_BankSel

	LDA BlockSwitch_TilePropsA, Y
	STA TileProperties + $88

	LDA BlockSwitch_TilePropsA + 4, Y
	STA TileProperties + $89

	LDA BlockSwitch_TilePropsA + 8, Y
	STA TileProperties + $8A

	LDA BlockSwitch_TilePropsA + 12, Y
	STA TileProperties + $8B

	LDA BlockSwitch_TilePropsB, Y
	STA TileProperties + $C8

	LDA BlockSwitch_TilePropsB + 4, Y
	STA TileProperties + $C9

	LDA BlockSwitch_TilePropsB + 8, Y
	STA TileProperties + $CA

	LDA BlockSwitch_TilePropsB + 12, Y
	STA TileProperties + $CB	

BlockSwitcher_RTS:
	RTS		

MushroomBlock_CanSolidify = Objects_Data1

MushroomBlock_SkipXVel:
	.byte $FE, $02

MushroomBlock_Flip:
	.byte $00, SPR_HFLIP

ObjInit_MushroomBlock:
	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_MushroomBlock:
	LDA <Player_HaltGameZ
	BEQ MushroomBlock_Normal

	JMP MushroomBlock_Draw

MushroomBlock_Normal:
	LDA #$01
	STA MushroomBlock_CanSolidify, X

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	
	JSR Shell_KillOthers
	JSR Object_DetectPlayer
	BCC MushroomBlock_DetectTiles

	LDA Objects_BeingHeld, X
	BNE MushroomBlock_Carry

	JSR ObjHit_SolidStand
 	BCC MushroomBlock_Carry

	LDA Objects_XVelZ, X
	STA Player_CarryXVel
	JMP MushroomBlock_DetectTiles

MushroomBlock_Carry:
	LDA #$00
	STA MushroomBlock_CanSolidify, X

	LDA Objects_Timer2, X
	BNE MushroomBlock_DetectTiles

	JSR Object_Hold	
	BCC MushroomBlock_Kicked

	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JMP MushroomBlock_Draw

MushroomBlock_Kicked:	
	LDA #$10
	STA Objects_Timer2, X

MushroomBlock_DetectTiles
	JSR Object_DetectTiles
	JSR Object_DampenVelocity
	JSR Object_InteractWithTilesWallStops

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ MushroomBlock_Draw

	LDA <Objects_YVelZ, X
	BNE MushroomBlock_Draw

MushroomBlock_Snap:
	LDA MushroomBlock_CanSolidify, X
	BEQ MushroomBlock_Draw

	LDA Block_NeedsUpdate
	BNE MushroomBlock_Draw

	LDA <Objects_XZ, X
	ADD #$07
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	ADD #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_OBJECTINTERACT
	BNE MushroomBlock_Draw

	LDA Object_BodyTileValue, X
	EOR #$01
	JSR Object_ChangeBlock
	JMP Object_Delete

MushroomBlock_Draw:
	JMP Object_DrawMirrored

Magnet_Stuck = Objects_Data1
Magnet_InsideBlock = Objects_Data2

Magnet_OrigX	= Objects_Data3
Magnet_OrigXHi  = Objects_Data4
Magnet_OrigY	= Objects_Data5
Magnet_OrigYHi	= Objects_Data6
Magnet_Timer	= Objects_SlowTimer

ObjInit_Magnet:
	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	LDA Tile_LastProp
	CMP #TILE_PROP_ITEM
	BCC Magnet_InBlock

	INC Magnet_InsideBlock, X
	BNE ObjInit_MagnetRTS

Magnet_InBlock:	
	CMP #TILE_PROP_SOLID_ALL
	BCC ObjInit_MagnetRTS

	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

ObjInit_MagnetRTS:
	LDA <Objects_XZ, X
	STA Magnet_OrigX, X

	LDA <Objects_XHiZ, X
	STA Magnet_OrigXHi, X

	LDA <Objects_YZ, X
	STA Magnet_OrigY, X

	LDA <Objects_YHiZ, X
	STA Magnet_OrigYHi, X
	RTS

ObjNorm_Magnet:
	LDA <Player_HaltGameZ
	BEQ Magnet_Normal

	JMP Magnet_Draw

Magnet_Normal:
	LDA #$40
	JSR Object_DeleteOffScreenRange

	LDA Magnet_InsideBlock, X
	BEQ Magnet_DoNorm

	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	LDA <Objects_YZ, X
	LDA <Objects_YHiZ, X

	LDA Tile_LastProp
	CMP #TILE_PROP_ITEM
	BCC Magnet_PopUp
	
	JMP Magnet_Draw

Magnet_PopUp:
	LDA #$C0
	STA <Objects_YVelZ, X

	LDA #$00
	STA Magnet_InsideBlock, X

	LDA Magnet_OrigY, X
	SUB #$10
	STA Magnet_OrigY, X

	LDA Magnet_OrigYHi, X
	SBC #$10
	STA Magnet_OrigYHi, X

	JSR Object_Move
	RTS

Magnet_DoNorm:	
	LDA Magnet_Stuck, X
	BNE Magnet_NoMove

	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox

Magnet_NoMove:
	LDA Objects_Timer2, X
	BNE Magnet_DetectTiles

	JSR Object_DetectPlayer
	BCC Magnet_DetectTiles

	LDA Objects_BeingHeld, X
	BNE Magnet_Carry

	JSR ObjHit_SolidStand
 	BCC Magnet_Carry

	LDA #$FF
	STA Objects_SlowTimer, X

	LDA Objects_XVelZ, X
	STA Player_CarryXVel
	JMP Magnet_DetectTiles

Magnet_Carry:
	LDA #$00
	STA Magnet_Stuck, X

	LDA #$00
	STA Objects_SlowTimer, X

	JSR Object_Hold	
	BCS Magnet_Draw

	JSR Object_GetKicked

	LDA #$FF
	STA Objects_SlowTimer, X

	LDA #$10
	STA Objects_Timer2, X

Magnet_DetectTiles:
	LDA Magnet_Stuck, X
	BNE Magnet_Draw

	JSR Object_DetectTiles
	JSR Object_DampenVelocity
	
	LDA Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ Magnet_TileInteract

	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_SOLID_OBJECTINTERACT | TILE_PROP_SOLID_ALL)
	BNE Magnet_TileInteract

	INC Magnet_Stuck, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	LDA <Objects_XZ, X
	ADD #$08
	AND #$F0
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Objects_XHiZ, X

	JMP Magnet_Draw
	
Magnet_TileInteract:
	JSR Object_InteractWithTilesWallStops

Magnet_Draw:
	LDA Magnet_InsideBlock, X
	BNE Magnet_RTS

	LDA Magnet_Timer, X
	BEQ Magnet_NormalDraw

	CMP #$20
	BCS Magnet_NormalDraw

	CMP #$01
	BNE Magnet_Flash

	JSR Magnet_Reset
	RTS

Magnet_Flash:	
	AND #$01
	BNE Magnet_RTS

Magnet_NormalDraw:
	JMP Object_Draw

Magnet_RTS:	
	RTS	

Magnet_Reset:
	LDA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BNE Magnet_SetPosition

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_XZ, X
	STA <Poof_X

	JSR Common_MakePoof

Magnet_SetPosition:
	LDA Magnet_OrigX, X
	STA <Objects_XZ, X	

	LDA Magnet_OrigXHi, X
	STA <Objects_XHiZ, X

	LDA Magnet_OrigY, X
	STA <Objects_YZ, X

	LDA Magnet_OrigYHi, X
	STA <Objects_YHiZ, X

	LDA #$00
	STA Magnet_Stuck, X
	RTS

ObjInit_EventSetter:
	LDA #$01
	STA EventSwitch
	RTS	

CheckObjectsOfType3:
	LDA #$00
	STA <Num_Objects

	LDY #$04

CheckNextObject3:
	LDA Objects_State, Y
	BEQ NotObject_Checking3

	LDA Objects_ID, Y
	CMP <Object_Check
	BNE NotObject_Checking3

	INC <Num_Objects

NotObject_Checking3:
	DEY
	BPL CheckNextObject3
	RTS	