    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_HAMMERBRO    		= $8C
OBJ_NINJABRO            = $8D
OBJ_FIREBRO             = $8E
OBJ_ICEBRO              = $8F
OBJ_PIRATEBRO           = $90
OBJ_SPINTULA            = $91
OBJ_PYRANTULA           = $92
OBJ_BARRELBRO			= $93
OBJ_PLUMBERPAUL			= $94

    .word ObjInit_HammerBro ; Object $8C
    .word ObjInit_NinjaBro ; Object $8D
    .word ObjInit_FireBro ; Object $8E
    .word ObjInit_IceBro ; Object $8F
    .word ObjInit_PirateBro ; Object $90
    .word ObjInit_Spintula ; Object $91
    .word ObjInit_Pyrantula ; Object $92
    .word ObjInit_BarrelBro ; Object $93
    .word ObjInit_PlungerPaul ; Object $94
    .word ObjInit_DoNothing ; Object $95
    .word ObjInit_DoNothing ; Object $96
    .word ObjInit_DoNothing ; Object $97
    .word ObjInit_DoNothing ; Object $98
    .word ObjInit_DoNothing ; Object $99
    .word ObjInit_DoNothing ; Object $9A
    .word ObjInit_DoNothing ; Object $9B
    .word ObjInit_DoNothing ; Object $9C
    .word ObjInit_DoNothing ; Object $9D
    .word ObjInit_DoNothing ; Object $9E
    .word ObjInit_DoNothing ; Object $9F

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_HammerBro ; Object $8C
    .word ObjNorm_NinjaBro ; Object $8D
    .word ObjNorm_FireIcePirateBro ; Object $8E
    .word ObjNorm_FireIcePirateBro ; Object $8F
    .word ObjNorm_FireIcePirateBro ; Object $90
    .word ObjNorm_Spintula ; Object $91
    .word ObjNorm_Pyrantula ; Object $92
    .word ObjNorm_BarrelBro ; Object $93
    .word ObjNorm_PlungerPaul ; Object $94
    .word ObjNorm_DoNothing ; Object $95
    .word ObjNorm_DoNothing ; Object $96
    .word ObjNorm_DoNothing ; Object $97
    .word ObjNorm_DoNothing ; Object $98
    .word ObjNorm_DoNothing ; Object $99
    .word ObjNorm_DoNothing ; Object $9A
    .word ObjNorm_DoNothing ; Object $9B
    .word ObjNorm_DoNothing ; Object $9C
    .word ObjNorm_DoNothing ; Object $9D
    .word ObjNorm_DoNothing ; Object $9E
    .word ObjNorm_DoNothing ; Object $9F

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word Player_GetHurt ; Object $8C
    .word Player_GetHurt ; Object $8D
    .word Player_GetHurt ; Object $8E
    .word Player_GetHurt ; Object $8F
    .word Player_GetHurt ; Object $90
    .word Player_GetHurt ; Object $91
    .word Player_GetHurt ; Object $92
    .word Player_GetHurt ; Object $93
    .word Player_GetHurt ; Object $94
    .word ObjHit_DoNothing ; Object $95
    .word ObjHit_DoNothing ; Object $96
    .word ObjHit_DoNothing ; Object $97
    .word ObjHit_DoNothing ; Object $98
    .word ObjHit_DoNothing ; Object $99
    .word ObjHit_DoNothing ; Object $9A
    .word ObjHit_DoNothing ; Object $9B
    .word ObjHit_DoNothing ; Object $9C
    .word ObjHit_DoNothing ; Object $9D
    .word ObjHit_DoNothing ; Object $9E
    .word ObjHit_DoNothing ; Object $9F

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8C
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8D
    .byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8E
    .byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8F
    .byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $90
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $91
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $92
    .byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $93
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $94
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $95
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $96
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $97
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $98
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $99
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9A
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9B
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9C
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9D
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9E
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9F

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT5 | $4E ; Object $8C
    .byte OPTS_SETPT5 | $4E ; Object $8D
    .byte OPTS_SETPT5 | $4E ; Object $8E
    .byte OPTS_SETPT5 | $4E ; Object $8F
    .byte OPTS_SETPT5 | $4E ; Object $90
    .byte OPTS_SETPT5 | $0A ; Object $91
    .byte OPTS_SETPT5 | $0A ; Object $92
    .byte OPTS_SETPT5 | $4E ; Object $93
    .byte OPTS_SETPT5 | $36 ; Object $94
    .byte OPTS_NOCHANGE ; Object $95
    .byte OPTS_NOCHANGE ; Object $96
    .byte OPTS_NOCHANGE ; Object $97
    .byte OPTS_NOCHANGE ; Object $98
    .byte OPTS_NOCHANGE ; Object $99
    .byte OPTS_NOCHANGE ; Object $9A
    .byte OPTS_NOCHANGE ; Object $9B
    .byte OPTS_NOCHANGE ; Object $9C
    .byte OPTS_NOCHANGE ; Object $9D
    .byte OPTS_NOCHANGE ; Object $9E
    .byte OPTS_NOCHANGE ; Object $9F

	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STARDEATH ; Object $8C
    .byte KILLACT_STARDEATH ; Object $8D
    .byte KILLACT_STARDEATH ; Object $8E
    .byte KILLACT_STARDEATH ; Object $8F
    .byte KILLACT_STARDEATH ; Object $90
    .byte KILLACT_STARDEATH ; Object $91
    .byte KILLACT_STARDEATH ; Object $92
    .byte KILLACT_STARDEATH ; Object $93
    .byte KILLACT_NORMALSTATE ; Object $94
    .byte KILLACT_STARDEATH ; Object $95
    .byte KILLACT_STARDEATH ; Object $96
    .byte KILLACT_STARDEATH ; Object $97
    .byte KILLACT_STARDEATH ; Object $98
    .byte KILLACT_STARDEATH ; Object $99
    .byte KILLACT_STARDEATH ; Object $9A
    .byte KILLACT_STARDEATH ; Object $9B
    .byte KILLACT_STARDEATH ; Object $9C
    .byte KILLACT_STARDEATH ; Object $9D
    .byte KILLACT_STARDEATH ; Object $9E
    .byte KILLACT_STARDEATH ; Object $9F

OG8_POff .func (\1 - ObjectGroup08_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
	
	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG8_POff(ObjP8C), OG8_POff(ObjP8D), OG8_POff(ObjP8E), OG8_POff(ObjP8F)
    .byte OG8_POff(ObjP90), OG8_POff(ObjP91), OG8_POff(ObjP92), OG8_POff(ObjP93)
    .byte OG8_POff(ObjP94), OG8_POff(ObjP95), OG8_POff(ObjP96), OG8_POff(ObjP97)
    .byte OG8_POff(ObjP98), OG8_POff(ObjP99), OG8_POff(ObjP9A), OG8_POff(ObjP9B)
    .byte OG8_POff(ObjP9C), OG8_POff(ObjP9D), OG8_POff(ObjP9E), OG8_POff(ObjP9F)

	.org ObjectGroup_PatternSets

ObjectGroup08_PatternSets:

ObjP8C:
ObjP93:
    .byte $B1, $B3, $B5, $B7, $B1, $B3, $A5, $A7
	.byte $AD, $AF, $B5, $B7, $AD, $AF, $A5, $A7

ObjP8D:
    .byte $95, $97, $A1, $A3, $95, $97, $B9, $BB
	.byte $99, $9B, $A1, $A3, $99, $9B, $B9, $BB

ObjP8E:
ObjP8F:
    .byte $81, $83, $B5, $B7, $81, $83, $A5, $A7
	.byte $85, $87, $B5, $B7, $85, $87, $A5, $A7

ObjP90:
    .byte $8D, $8F, $B5, $B7, $8D, $8F, $A5, $A7
	.byte $91, $93, $B5, $B7, $91, $93, $A5, $A7

ObjP91:
ObjP92:
    .byte $A1, $A1, $A3, $A3, $A5, $A5
    

ObjP94:
	.byte $BB, $BD, $9B, $9D

ObjP95:
ObjP96:
ObjP97:
ObjP98:
ObjP99:
ObjP9A:
ObjP9B:
ObjP9C:
ObjP9D:
ObjP9E:
ObjP9F:



HammerBro_JumpYVel:	.byte -$60, -$30
HammerBro_JumpWait: .byte $C0, $FF
HammerBro_WaitTimers: .byte $18, $18, $60, $18
HammerBro_CanFallThrough: .byte $00, $30

HammerBro_Frame = Objects_Data1
HammerBro_Action = Objects_Data2
HammerBro_RangeLeft = Objects_Data3
HammerBro_RangeRight = Objects_Data4
HammerBro_ThrowHammerTimer = Objects_Data5
HammerBro_HoldHammerTimer = Objects_Data6
HammerBro_WalkDirection = Objects_Data7
HammerBro_FallThrough = Objects_Data8

ObjInit_HammerBro:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA HammerBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA HammerBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10
	STA HammerBro_RangeRight, X

	LDA #$02
	STA Objects_Health, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return
	
ObjNorm_HammerBro:
	LDA <Player_HaltGameZ
	BEQ HammerBro_Norm

	JMP HammerBros_Draw

HammerBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA HammerBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA <Objects_TilesDetectZ, X
	AND #~HIT_CEILING
	STA <Objects_TilesDetectZ, X

	JSR Object_InteractWithTiles

HammerBro_SkipTiles:
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBro_HotHolding

	DEC HammerBro_HoldHammerTimer, X
	BNE HammerBro_CheckJump

	LDA RandomN + 1, X
	AND #$03
	TAY 
	LDA HammerBro_WaitTimers, Y
	STA HammerBro_ThrowHammerTimer, X
	JSR HammerBro_ThrowHammer
	
HammerBro_HotHolding:
	LDA HammerBro_ThrowHammerTimer, X
	BNE HammerBro_DecHamTimer

	LDA #$18
	STA HammerBro_HoldHammerTimer, X
	BNE HammerBro_CheckJump

HammerBro_DecHamTimer:
	DEC HammerBro_ThrowHammerTimer, X

HammerBro_CheckJump:
	LDA Objects_Timer, X
	BNE HammerBro_NoJump

	JSR Bro_CheckTop

HammerBro_DoJump:
	LDA HammerBro_JumpYVel, Y
	STA <Objects_YVelZ, X

	LDA HammerBro_CanFallThrough, Y
	STA HammerBro_FallThrough, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA HammerBro_JumpWait, Y
	STA Objects_Timer, X


HammerBro_NoJump:

	LDA <Objects_XZ, X
	CMP HammerBro_RangeLeft, X
	BEQ HammerBro_TurnAround

	CMP HammerBro_RangeRight, X
	BNE HammerBro_Animate

HammerBro_TurnAround:
	LDA HammerBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA HammerBro_WalkDirection, X

HammerBro_Animate:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ HammerBros_NoAnimate

	INC HammerBro_Frame, X

HammerBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA HammerBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

HammerBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

HammerBros_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	JSR Object_Draw16x32

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBros_Done

	JSR HammerBro_DrawHammer

	LDA Object_SpriteRAMOffset, X
	SUB #$08
	STA Object_SpriteRAMOffset, X

HammerBros_Done:
	RTS

Hammer_XVel:	.byte -$12, $12

HammerXOffset:
	.byte $08, $F8
	.byte $00, $FF

HammerTiles:
	.byte $89, $8B, $8B, $89

HammerFlip:
	.byte SPR_PAL3 | $00, SPR_PAL3 | SPR_HFLIP

HammerBro_DrawHammer:

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ HammerBro_LeftSide

	INY

HammerBro_LeftSide:
	LDA HammerXOffset, Y
	STA <Temp_Var1

	LDA HammerTiles, Y
	STA <Temp_Var2

	LDA HammerTiles + 2, Y
	STA <Temp_Var3

	LDA HammerFlip, Y
	STA <Temp_Var4

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX - 8, Y
	ADD #$08
	STA Sprite_RAMX - 4, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 8, Y
	STA Sprite_RAMY - 4, Y

	LDA <Temp_Var2
	STA Sprite_RAMTile - 8, Y

	LDA <Temp_Var3
	STA Sprite_RAMTile - 4, Y

	LDA <Temp_Var4
	STA Sprite_RAMAttr - 8, Y
	STA Sprite_RAMAttr - 4, Y

	RTS		 ; Return

HammerBro_ThrowHammer:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE HammerBro_ThrowDone

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ HammerBro_ThrowToRight

	INY

HammerBro_ThrowToRight:
	
	LDA HammerXOffset, Y
	ADD <Objects_XZ, X
	STA <Temp_Var14

	LDA <Objects_XHiZ, X
	ADC HammerXOffset + 2, Y
	STA <Temp_Var15
	
	LDA Hammer_XVel, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	BCC HammerBro_ThrowDone

	LDA #SOBJ_HAMMER
	STA SpecialObj_ID, Y

	LDA <Temp_Var16
	STA SpecialObj_XVel, Y

	LDA #$C0
	STA SpecialObj_YVel, Y

	LDA <Temp_Var14
	STA SpecialObj_X, Y

	LDA <Temp_Var15
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

HammerBro_ThrowDone:
	RTS    


NinjaBro_JumpYVel:	.byte -$60, -$30
NinjaBro_JumpWait: .byte $C0, $FF
NinjaBro_WaitTimers: .byte $30, $48, $18, $60
NinjaBro_CanFallThrough: .byte $00, $30

NinjaBro_Frame = Objects_Data1
NinjaBro_Action = Objects_Data2
NinjaBro_RangeLeft = Objects_Data3
NinjaBro_RangeRight = Objects_Data4
NinjaBro_ThrowStarTimer = Objects_Data5
NinjaBro_HoldStarTimer = Objects_Data6
NinjaBro_WalkDirection = Objects_Data7
NinjaBro_FallThrough = Objects_Data8
NinjaBro_WalkDirectionBackup = Objects_Data9


ObjInit_NinjaBro:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #$02
	STA Objects_Health, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA NinjaBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA NinjaBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10 
	STA NinjaBro_RangeRight, X

	LDA #$20
	STA NinjaBro_ThrowStarTimer, X

	LDA #$40
	STA Objects_Timer, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return
	
ObjNorm_NinjaBro:
	LDA <Player_HaltGameZ
	BEQ NinjaBro_Norm

	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BCS NinjaBros_HaltDraw

	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BEQ NinjaBro_HaltNoDraw

NinjaBros_HaltDraw:
	JMP NinjaBros_Draw

NinjaBro_HaltNoDraw:
	RTS

NinjaBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA NinjaBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA NinjaBro_FallThrough, X
	BEQ NinjaBro_DetectTiles

	DEC NinjaBro_FallThrough, X
	JMP NinjaBro_Done

NinjaBro_DetectTiles:
	LDA <Objects_TilesDetectZ, X
	AND #~HIT_CEILING
	STA <Objects_TilesDetectZ, X

	JSR Object_InteractWithTiles

NinjaBro_SkipTiles:
	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BNE NinjaBro_OnGround

NinjaBro_Done:
	RTS

NinjaBro_OnGround:
	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE NinjaBro_BeenOnGround

	LDA <Objects_YVelZ, X
	BNE NinjaBro_BeenOnGround

	JSR NinjaBro_MakePoof

	LDA NinjaBro_WalkDirectionBackup, X
	BEQ NinjaBro_BeenOnGround

	STA NinjaBro_WalkDirection, X

NinjaBro_BeenOnGround:
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBro_HotHolding

	DEC NinjaBro_HoldStarTimer, X
	BNE NinjaBro_CheckJump

	LDA RandomN + 1, X
	AND #$03
	TAY 
	
	LDA Objects_Property, X
	BEQ NinjaBrow_StarWait

	LDA #$10
	BEQ NinjaBrow_StarWait1

NinjaBrow_StarWait:
	LDA NinjaBro_WaitTimers, Y

NinjaBrow_StarWait1:
	STA NinjaBro_ThrowStarTimer, X
	JSR NinjaBro_ThrowStar
	
NinjaBro_HotHolding:
	LDA NinjaBro_ThrowStarTimer, X
	BNE NinjaBro_DecHamTimer

	LDA #$18
	STA NinjaBro_HoldStarTimer, X
	BNE NinjaBro_CheckJump

NinjaBro_DecHamTimer:
	DEC NinjaBro_ThrowStarTimer, X

NinjaBro_CheckJump:
	LDA Objects_Timer, X
	BNE NinjaBro_NoJump
	LDA Objects_Property, X
	BNE NinjaBro_NoJump

	JSR Bro_CheckTop

NinjaBro_DoJump:
	LDA NinjaBro_JumpYVel, Y
	STA <Objects_YVelZ, X

	LDA NinjaBro_CanFallThrough, Y
	STA NinjaBro_FallThrough, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA NinjaBro_JumpWait, Y
	STA Objects_Timer, X

	JSR NinjaBro_MakePoof

	LDA NinjaBro_WalkDirection, X
	STA NinjaBro_WalkDirectionBackup, X

	LDA #$00
	STA NinjaBro_WalkDirection, X

NinjaBro_NoJump:
	LDA <Objects_XZ, X
	CMP NinjaBro_RangeLeft, X
	BEQ NinjaBro_TurnAround

	CMP NinjaBro_RangeRight, X
	BNE NinjaBro_Animate

NinjaBro_TurnAround:
	LDA NinjaBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA NinjaBro_WalkDirection, X

NinjaBro_Animate:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ NinjaBros_NoAnimate

	INC NinjaBro_Frame, X

NinjaBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA NinjaBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

NinjaBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

NinjaBros_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	JSR Object_Draw16x32

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBros_DrawDone

	JSR NinjaBro_DrawStar

NinjaBros_DrawDone:
	LDA Object_SpriteRAMOffset, X
	SUB #$08
	STA Object_SpriteRAMOffset, X

NinjaBros_Done:
	RTS

NinjaBro_MakePoof:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE NinjaBro_PoofDone

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi

	JSR Common_MakePoof

NinjaBro_PoofDone:
	RTS
Ninja_XVel:	.byte -$12, $12

NinjaXOffset:
	.byte $08, $F8
	.byte $00, $FF

NinjaTiles:
	.byte $89, $8B, $8B, $89

NinjaFlip:
	.byte SPR_PAL3 | $00, SPR_PAL3 | SPR_HFLIP

NinjaBro_DrawStar:

	LDY #$00
	LDA Objects_Orientation, X
	AND #(SPR_HFLIP)
	BEQ NinjaBro_LeftSide

	INY

NinjaBro_LeftSide:
	LDA NinjaXOffset, Y
	STA <Temp_Var1

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX - 8, Y

	ADD #$08
	STA Sprite_RAMX - 4, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 8, Y

	LDA Sprite_RAMY + 4, Y
	SUB #$06
	STA Sprite_RAMY - 4, Y

	LDA #$A9
	STA Sprite_RAMTile - 8, Y
	STA Sprite_RAMTile - 4, Y

	LDA Sprite_RAMAttr, Y
	AND #SPR_BEHINDBG
	ORA #SPR_PAL3
	STA Sprite_RAMAttr - 8, Y

	EOR #(SPR_VFLIP | SPR_HFLIP)
	STA Sprite_RAMAttr - 4, Y

	RTS		 ; Return

NinjaBro_ThrowStar:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BEQ NinjaBro_ThrowStarDo
	RTS

NinjaBro_ThrowStarDo:
	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ NinjaBro_ThrowLeft

	INY

NinjaBro_ThrowLeft:
	LDA NinjaXOffset, Y
	STA <Temp_Var1

	LDA NinjaXOffset + 2, Y
	STA <Temp_Var2

	JSR Object_PrepProjectile	

	LDA #SOBJ_NINJASTAR
	STA SpecialObj_ID,Y

	LDA <Objects_XZ, X
	ADD <Temp_Var1
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var2
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

	JSR Object_AimProjectile

	LDA SpecialObj_XVel, Y
	JSR Double_Value
	STA SpecialObj_XVel, Y

	LDA SpecialObj_YVel, Y
	JSR Double_Value
	STA SpecialObj_YVel, Y
	
NinjaBro_ThrowDone:
	RTS

Bro_CheckTop:
	LDA Objects_BoundBottom, X
	ADD #$14
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$07
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	
	LDY #$00
	CMP #TILE_PROP_SOLID_ALL
	BCS Bro_NotTop

	LDA Objects_SpriteY, X

	CMP #$30
	BCS Bro_NotTop
 
	INY
	BNE Bro_RTS

Bro_NotTop:
	CMP #$70
	BCS Bro_RTS

	LDA RandomN, X
	AND #$08
	LSR A
	LSR A
	LSR A
	TAY
Bro_RTS:
	RTS    



ObjInit_FireBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA FireIcePirateBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA FireIcePirateBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10
	STA FireIcePirateBro_RangeRight, X

	LDA #SOBJ_FIREBALL
	STA FireIcePirateBro_Projectile, X

	LDA #$02
	STA Objects_Health, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return
    


ObjInit_IceBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR ObjInit_FireBro

	LDA #SOBJ_ICEBALL
	STA FireIcePirateBro_Projectile, X

	LDA #$02
	STA Objects_Health, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return        


ObjInit_PirateBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR ObjInit_FireBro

	LDA #SOBJ_CANNONBALL
	STA FireIcePirateBro_Projectile, X
	
	LDA #$02
	STA Objects_Health, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return        


FireIcePirateBro_JumpWait: .byte $C0, $FF
FireIcePirateBro_WaitTimers: .byte $60, $40, $40, $40

FireIcePirateBro_Frame = Objects_Data1
FireIcePirateBro_Action = Objects_Data2
FireIcePirateBro_RangeLeft = Objects_Data3
FireIcePirateBro_RangeRight = Objects_Data4
FireIcePirateBro_SpitTimer = Objects_Data5
FireIcePirateBro_OpenMouthTimer = Objects_Data6
FireIcePirateBro_WalkDirection = Objects_Data7
FireIcePirateBro_FireIcePirateCount = Objects_Data8
FireIcePirateBro_WalkDirectionBackup = Objects_Data9
FireIcePirateBro_Projectile = Objects_Data10







ObjNorm_FireIcePirateBro:
	LDA <Player_HaltGameZ
	BEQ FireIcePirateBro_Norm

	JMP Object_Draw16x32

FireIcePirateBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA FireIcePirateBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA FireIcePirateBro_OpenMouthTimer, X
	BEQ FireIcePirateBro_NotOpen

	DEC FireIcePirateBro_OpenMouthTimer, X
	BNE FireIcePirateBro_CheckJump

	LDA FireIcePirateBro_FireIcePirateCount, X
	BEQ FireIcePirateBro_Reset

	DEC FireIcePirateBro_FireIcePirateCount, X

	JSR FireIcePirateBro_Shoot

	LDA #$18
	STA FireIcePirateBro_OpenMouthTimer, X
	BNE FireIcePirateBro_CheckJump

FireIcePirateBro_Reset:
	LDA RandomN + 1, X
	AND #$03
	TAY 
	LDA FireIcePirateBro_WaitTimers, Y
	STA FireIcePirateBro_SpitTimer, X

	LDA FireIcePirateBro_WalkDirectionBackup, X
	STA FireIcePirateBro_WalkDirection, X
	
FireIcePirateBro_NotOpen:
	LDA FireIcePirateBro_SpitTimer, X
	BNE FireIcePirateBro_DecFireIcePirateTimer

	LDA #$18
	STA FireIcePirateBro_OpenMouthTimer, X

	LDA RandomN, X
	AND #$01
	ADD #$01
	STA FireIcePirateBro_FireIcePirateCount, X

	LDA FireIcePirateBro_WalkDirection, X
	STA FireIcePirateBro_WalkDirectionBackup, X

	LDA #$00
	STA FireIcePirateBro_WalkDirection, X
	BEQ FireIcePirateBro_CheckJump

FireIcePirateBro_DecFireIcePirateTimer:
	DEC FireIcePirateBro_SpitTimer, X

FireIcePirateBro_CheckJump:
	LDA Objects_Timer, X
	BNE FireIcePirateBro_NoJump

	LDA #$C0
	STA <Objects_YVelZ, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA FireIcePirateBro_JumpWait, Y
	STA Objects_Timer, X


FireIcePirateBro_NoJump:

	LDA <Objects_XZ, X
	CMP FireIcePirateBro_RangeLeft, X
	BEQ FireIcePirateBro_TurnAround

	CMP FireIcePirateBro_RangeRight, X
	BNE FireIcePirateBro_Animate

FireIcePirateBro_TurnAround:
	LDA FireIcePirateBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA FireIcePirateBro_WalkDirection, X

FireIcePirateBro_Animate:
	LDA FireIcePirateBro_WalkDirection, X
	BEQ FireIcePirateBros_NoAnimate

	INC FireIcePirateBro_Frame, X

FireIcePirateBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA FireIcePirateBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA FireIcePirateBro_OpenMouthTimer, X
	BEQ FireIcePirateBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

FireIcePirateBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

FireIcePirateBros_Draw:
	JMP Object_Draw16x32


FireIcePirate_XVel:
	.byte $E0, $20
	
FireIcePirate_XOffset:
	.byte $FE, $08
	.byte $FF, $00

FireIcePirateBro_Shoot:

	LDA Objects_SpritesHorizontallyOffScreen,X
	CMP #(SPRITE_0_INVISIBLE | SPRITE_1_INVISIBLE)
	BCS FireICePriateBro_NoShoot

	LDA Objects_SpritesHorizontallyOffScreen,X
	BEQ FireIcePirateBro_DoShoot

FireICePriateBro_NoShoot:
	RTS

FireIcePirateBro_DoShoot:
	LDY #$00

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ FireIcePirateBro_SpitRight

	INY

FireIcePirateBro_SpitRight:
	
	LDA FireIcePirate_XOffset, Y
	STA <Temp_Var14

	LDA FireIcePirate_XOffset + 2, Y
	STA <Temp_Var15

	LDA FireIcePirate_XVel, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	BCC FireIcePirateBro_ShootDone

	LDA FireIcePirateBro_Projectile, X
	STA SpecialObj_ID, Y

	CMP #SOBJ_ICEBALL
	BNE FireIcePirateBro_SpitNorm

	LDA <Temp_Var16
	JSR Half_Value
	STA SpecialObj_XVel, Y
	BNE FireIcePirateBro_SetYVel
	
FireIcePirateBro_SpitNorm:
	LDA <Temp_Var16
	STA SpecialObj_XVel, Y

FireIcePirateBro_SetYVel:
	LDA #$FE
	STA SpecialObj_YVel, Y

	LDA <Objects_XZ, X
	ADD <Temp_Var14
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var15
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	ADD #$04
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA FireIcePirateBro_Projectile, X
	CMP #SOBJ_CANNONBALL
	BNE FireIcePirateBro_ShootDone

	LDA #SND_LEVELBABOOM
	ORA Sound_QLevel1
	STA Sound_QLevel1

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA #$01
	STA SpecialObj_Stompable, Y
	
	LDA SpecialObj_Y, Y
	SUB #$02
	STA SpecialObj_Y, Y

	LDA SpecialObj_YHi, Y
	SBC #$00
	STA SpecialObj_YHi, Y
	RTS

FireIcePirateBro_ShootDone:
	LDA #SND_PLAYERFIRE
	ORA Sound_QPlayer
	STA Sound_QPlayer
	RTS     


ObjInit_Spintula:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA Object_BodyTileValue, X
	STA Spintula_DetectTile, X

	EOR #$01
	STA Spintula_DetectTile2, X
	RTS		 ; Return

Spintula_DetectTile = Objects_Data3
Spintula_DetectTile2 = Objects_Data4
Spintula_Action = Objects_Data5
Spintula_Frame = Objects_Data6
Spintula_Pause = Objects_Data7

ObjNorm_Spintula:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Spintula1
	
	JMP Object_DrawMirrored	

ObjNorm_Spintula1:
	JSR Object_DeleteOffScreen
	LDA Spintula_Pause, X
	BNE ObjNorm_Spintula2

	JSR Object_ApplyYVel_NoGravity

ObjNorm_Spintula2:
	LDA #$00
	STA Spintula_Pause, X
	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA Spintula_Action, X
	JSR DynJump
	
	.word Spintula_Wait
	.word Spintula_SpinDown
	.word Spintula_Wait2
	.word Spintula_SpinUp

Spintula_Wait:
	LDA Objects_Timer,X
	BNE Spintula_WaitRTS
	
	JSR Object_XDistanceFromPlayer
	CMP #$28
	
	BCS Spintula_WaitRTS
	INC Spintula_Action, X
	
	LDA #$20
	STA <Objects_YVelZ, X
	STA Spintula_Pause, X

Spintula_WaitRTS:
	JMP Object_DrawMirrored

Spintula_SpinDown:
	LDA <Objects_YHiZ, X
	BEQ Spintula_GoDown

	LDA <Objects_YZ, X
	CMP #$A0
	BCS Spintula_SpinDownStop

Spintula_GoDown:
	LDA Object_VertTileValue, X
	CMP Spintula_DetectTile, X
	BEQ Spintula_DrawWeb

	CMP Spintula_DetectTile2, X
	BNE Spintula_SpinDownStop

Spintula_DrawWeb:
	LDA <Objects_YZ, X
	AND #$0F
	BNE Spintual_DownDraw

	LDA Block_NeedsUpdate
	BEQ Spintual_DoDrawWeb
	
	INC Spintula_Pause, X
	BNE Spintula_SpinDownRTS

Spintual_DoDrawWeb:
	LDA Object_BodyTileValue, X
	ORA #$01
	JSR Object_ChangeBlock
	
Spintual_DownDraw:
	INC Spintula_Frame, X
	LDA Spintula_Frame, X
	LSR A
	AND #$01
	STA Objects_Frame, X
	
Spintula_SpinDownRTS:
	JMP Object_DrawMirrored

Spintula_SpinDownStop:
	INC Spintula_Action, X

	LDA #$20
	STA Objects_Timer,X

	LDA #$00
	STA <Objects_YVelZ, X
	JMP Object_DrawMirrored

Spintula_Wait2:
	LDA Objects_Timer, X
	BNE Spintula_Wait2Draw

	INC Spintula_Action, X
	LDA #$F0
	STA <Objects_YVelZ, X

Spintula_Wait2Draw:
	JMP Object_DrawMirrored

Spintula_SpinUp:

	LDA Object_VertTileValue, X
	CMP Spintula_DetectTile, X
	BEQ Spintula_DeleteWeb

	CMP Spintula_DetectTile2, X
	BNE Spintula_SpinUpStop

Spintula_DeleteWeb:
	LDA <Objects_YZ, X
	AND #$0F
	BNE Spintual_UpDraw

	LDA Block_NeedsUpdate
	BEQ Spintula_DoDeleteWeb

	INC Spintula_Pause, X
	BNE Spintula_SpinUpRTS

Spintula_DoDeleteWeb:
	LDA Object_BodyTileValue, X
	AND #$FE

	JSR Object_ChangeBlock
	
Spintual_UpDraw:
	INC Spintula_Frame, X
	LDA Spintula_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	
Spintula_SpinUpRTS:
	JMP Object_DrawMirrored

Spintula_SpinUpStop:
	LDA #$00
	STA Spintula_Action, X

	LDA #$20
	STA Objects_Timer,X

	LDA #$00
	STA <Objects_YVelZ, X
	JMP Object_DrawMirrored    


ObjInit_Pyrantula:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #$08
	STA ChaseVel_LimitHi, X

	LDA #$F8
	STA ChaseVel_LimitLo, X

	LDA #$40
	STA Objects_Timer, X
	RTS

Pyrantula_Frame = Objects_Data1
Pyrantula_FireTimer = Objects_Data2

ObjNorm_Pyrantula:
	LDA <Player_HaltGameZ
	BEQ Pyrantula_Normal
	JMP Pyrantula_Draw	 

Pyrantula_Normal:
	JSR Object_DeleteOffScreen
	
	LDA Pyrantula_FireTimer, X
	BNE Pyrantula_Shoot

	LDA Objects_Timer, X
	BNE Pyrantula_Move

	LDA #$20
	STA Pyrantula_FireTimer, X

Pyrantula_Move:
	JSR Object_CalcBoundBox
	JSR Object_ChasePlayer
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops
	
	LDA Object_VertTileProp, X
	CMP #TILE_PROP_CLIMBABLE
	BEQ Pyrantula_VGo

	LDA <Objects_YVelZ, X
	BPL Pyrantula_VStop

	JSR Object_HitCeiling
	JMP Pyrantula_VGo

Pyrantula_VStop:
	JSR Object_HitGround


Pyrantula_VGo:

	LDA Object_HorzTileProp, X
	CMP #TILE_PROP_CLIMBABLE
	BEQ Pyrantula_Animate

	JSR Object_WallStop
	JMP Pyrantula_Animate

Pyrantula_Shoot:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Pyrantula_FireTimer, X
	CMP #$10
	BNE Pyrantula_ShootDraw

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Pyrantula_ShootDraw

	LDA #$06
	STA <Proj_XOff 

	LDA #$0C
	STA <Proj_YOff

	JSR Object_ShootFireBallStraight
	JSR Object_AimProjectile

	LDA SpecialObj_XVel, Y
	JSR Double_Value
	STA SpecialObj_XVel, Y

	LDA SpecialObj_YVel, Y
	JSR Double_Value
	STA SpecialObj_YVel, Y

Pyrantula_ShootDraw:
	DEC Pyrantula_FireTimer, X
	BEQ Pyrantual_Reset

	LDA #$02
	STA Objects_Frame, X
	BNE Pyrantula_Draw

Pyrantual_Reset:
	LDA #$40
	STA Objects_Timer, X
	BNE Pyrantula_Draw

Pyrantula_Animate:
	INC Pyrantula_Frame, X

	LDA Pyrantula_Frame, X
	LSR A
	LSR A
	AND #$01

	STA Objects_Frame, X

Pyrantula_Draw:
	JMP Object_DrawMirrored	 ; Jump (indirectly) to PRG003_BB17 (draws enemy) and don't come back!    

BarrelBro_JumpYVel:	.byte -$30, -$30
BarrelBro_JumpWait: .byte $C0, $FF
BarrelBro_WaitTimers: .byte $30, $30, $A0, $30

BarrelBro_Frame = Objects_Data1
BarrelBro_Action = Objects_Data2
BarrelBro_RangeLeft = Objects_Data3
BarrelBro_RangeRight = Objects_Data4
BarrelBro_ThrowBarrelTimer = Objects_Data5
BarrelBro_HoldBarrelTimer = Objects_Data6
BarrelBro_WalkDirection = Objects_Data7


ObjInit_BarrelBro:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA BarrelBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA BarrelBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10
	STA BarrelBro_RangeRight, X

	LDA #$02
	STA Objects_Health, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	RTS		 ; Return
	
ObjNorm_BarrelBro:
	LDA <Player_HaltGameZ
	BEQ BarrelBro_Norm

	JMP BarrelBros_Draw

BarrelBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA BarrelBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA <Objects_TilesDetectZ, X
	AND #~HIT_CEILING
	STA <Objects_TilesDetectZ, X

	JSR Object_InteractWithTiles

BarrelBro_SkipTiles:
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA BarrelBro_HoldBarrelTimer, X
	BEQ BarrelBro_HotHolding

	DEC BarrelBro_HoldBarrelTimer, X
	BNE BarrelBro_CheckJump

	LDA RandomN + 1, X
	AND #$03
	TAY 
	LDA BarrelBro_WaitTimers, Y
	STA BarrelBro_ThrowBarrelTimer, X
	JSR BarrelBro_ThrowBarrel
	
BarrelBro_HotHolding:
	LDA BarrelBro_ThrowBarrelTimer, X
	BNE BarrelBro_DecHamTimer

	LDA #$18
	STA BarrelBro_HoldBarrelTimer, X
	BNE BarrelBro_CheckJump

BarrelBro_DecHamTimer:
	DEC BarrelBro_ThrowBarrelTimer, X

BarrelBro_CheckJump:
	LDA Objects_Timer, X
	BNE BarrelBro_NoJump

	JSR Bro_CheckTop

BarrelBro_DoJump:
	LDA BarrelBro_JumpYVel, Y
	STA <Objects_YVelZ, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA BarrelBro_JumpWait, Y
	STA Objects_Timer, X


BarrelBro_NoJump:

	LDA <Objects_XZ, X
	CMP BarrelBro_RangeLeft, X
	BEQ BarrelBro_TurnAround

	CMP BarrelBro_RangeRight, X
	BNE BarrelBro_Animate

BarrelBro_TurnAround:
	LDA BarrelBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA BarrelBro_WalkDirection, X

BarrelBro_Animate:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ BarrelBros_NoAnimate

	INC BarrelBro_Frame, X

BarrelBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA BarrelBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA BarrelBro_HoldBarrelTimer, X
	BEQ BarrelBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

BarrelBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

BarrelBros_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	JSR Object_Draw16x32

	LDA BarrelBro_HoldBarrelTimer, X
	BEQ BarrelBros_Done

	JSR BarrelBro_DrawBarrel

	LDA Object_SpriteRAMOffset, X
	SUB #$08
	STA Object_SpriteRAMOffset, X

BarrelBros_Done:
	RTS

Barrel_XVel:
	.byte -$18, $18

BarrelXOffset:
	.byte $08, $F8
	.byte $00, $FF

BarrelTiles:
	.byte $BD, $BF, $BF, $BD

BarrelFlip:
	.byte SPR_PAL3 | $00, SPR_PAL3 | SPR_HFLIP

BarrelBro_DrawBarrel:

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ BarrelBro_LeftSide

	INY

BarrelBro_LeftSide:
	LDA BarrelXOffset, Y
	STA <Temp_Var1

	LDA BarrelTiles, Y
	STA <Temp_Var2

	LDA BarrelTiles + 2, Y
	STA <Temp_Var3

	LDA BarrelFlip, Y
	STA <Temp_Var4

	LDY Object_SpriteRAMOffset, X

	LDA Object_DetermineHorizontallyOffScreen, X
	BNE BarrelBro_DrawBarrelRTS
	
	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	BCS BarrelBro_NoLeft

	STA Sprite_RAMX - 8, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 8, Y

BarrelBro_NoLeft:
	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	ADD #$08
	BCS BarrelBro_NoRight

	STA Sprite_RAMX - 4, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 4, Y

BarrelBro_NoRight:
	LDA <Temp_Var2
	STA Sprite_RAMTile - 8, Y

	LDA <Temp_Var3
	STA Sprite_RAMTile - 4, Y

	LDA <Temp_Var4
	STA Sprite_RAMAttr - 8, Y
	STA Sprite_RAMAttr - 4, Y

BarrelBro_DrawBarrelRTS:
	RTS		 ; Return

BarrelBro_ThrowBarrel:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE BarrelBro_ThrowDone

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ BarrelBro_ThrowToRight

	INY

BarrelBro_ThrowToRight:
	
	LDA BarrelXOffset, Y
	ADD <Objects_XZ, X
	STA <Temp_Var14

	LDA <Objects_XHiZ, X
	ADC BarrelXOffset + 2, Y
	STA <Temp_Var15
	
	LDA Barrel_XVel, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	BCC BarrelBro_ThrowDone

	LDA #SOBJ_BARREL
	STA SpecialObj_ID, Y

	LDA <Temp_Var16
	STA SpecialObj_XVel, Y

	LDA #$C0
	STA SpecialObj_YVel, Y

	LDA <Temp_Var14
	STA SpecialObj_X, Y

	LDA <Temp_Var15
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

BarrelBro_ThrowDone:
	RTS    	

ObjInit_PlungerPaul:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #(ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA #$40
	STA Objects_Timer, X

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

	LDA #$04
	STA Objects_SpritesRequested, X

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Objects_XHiZ, X

	LDA <Objects_YZ, X
	ADD #$02
	STA <Objects_YZ, X
	STA PlungerPaul_InitialY, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X
	STA PlungerPaul_InitialYHi, X
	RTS

PlungerPaul_State = Objects_Data1
PlungerPaul_InitialY = Objects_Data2
PlungerPaul_InitialYHi = Objects_Data3

ObjNorm_PlungerPaul:
	LDA <Player_HaltGameZ
	BEQ PlungerPaul_Norm

	JMP PlungerPaul_Draw

PlungerPaul_Norm:
	JSR Object_CalcBoundBox
	JSR Object_FacePlayer

	LDA PlungerPaul_State, X
	BEQ PlungerPaul_DoState

	JSR Object_AttackOrDefeat

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE PlungerPaul_DoState

	LDA Objects_PlayerProjHit, X
	AND #HIT_STOMPED
	BNE PlungerPaul_Stand

	JSR Object_PoofDie

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$00
	STA PlungerPaul_State, X

	LDA #$60
	STA Objects_Timer, X

	LDA PlungerPaul_InitialY, X
	STA <Objects_YZ, X

	LDA PlungerPaul_InitialYHi, X
	STA <Objects_YHiZ, X
	RTS

PlungerPaul_Stand:
	LDA Sound_QPlayer
	AND #~SND_PLAYERKICK
	STA Sound_QPlayer

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA Player_Jumped
	BNE PlungerPaul_DoState

	LDA #$00
	STA Player_YVelZ

	JSR ObjHit_SolidStand

PlungerPaul_DoState:	
	LDA PlungerPaul_State, X
	JSR DynJump

	.word PlungerPaul_Wait
	.word PlungerPaul_Raise
	.word PlungerPaul_Throw
	.word PlungerPaul_Descend

PlungerPaul_Wait:
	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Timer, X
	BEQ PlungerPaul_Wait1
	JMP PlungerPaul_Draw

PlungerPaul_Wait1:
	INC PlungerPaul_State, X
	LDA #$24
	STA Objects_Timer, X
	JMP PlungerPaul_Draw

PlungerPaul_Raise:
	LDA #$F8
	STA Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity

	LDA Objects_Timer, X
	BEQ Plunger_RaiseNextState
	JMP PlungerPaul_Draw

Plunger_RaiseNextState:
	INC PlungerPaul_State, X
	LDA #$30
	STA Objects_Timer, X
	JMP PlungerPaul_Draw
	
PlungerPaul_Throw:
	LDA #$00
	STA <Objects_YVelZ, X

	LDA Objects_Timer, X
	CMP #$18
	BNE PlungerPaul_Throw1

	LDA #$01
	STA Objects_Frame, X
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE PlungerPaul_Throw1

	JSR Object_PrepProjectile
	BCC PlungerPaul_Throw1

	LDA #SOBJ_PLUNGER
	STA SpecialObj_ID,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$02
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA #$28
	STA SpecialObj_XVel, Y

	LDA Objects_Orientation, X
	BNE PlungerPaul_Throw1
	
	LDA #$D8
	STA SpecialObj_XVel, Y
	

PlungerPaul_Throw1:
	LDA Objects_Timer, X
	BNE PlungerPaul_Draw

	INC PlungerPaul_State, X
	LDA #$24
	STA Objects_Timer, X
	JMP PlungerPaul_Draw

PlungerPaul_Descend:
	LDA #$08
	STA Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity

	LDA Objects_Timer, X
	BNE PlungerPaul_Draw

	LDA #$00
	STA PlungerPaul_State, X
	
	LDA #$40
	STA Objects_Timer, X

PlungerPaul_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X
	JSR Object_Draw

	LDA Objects_Frame, X
	BNE PlungerPaul_RTS
	
	LDA Object_SpriteRAMOffset, X
	SUB #$08
	TAY

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE PlungerPaul_DrawFlipped

	LDA #$A9
	STA Sprite_RAMTile, Y

	LDA #$BF
	STA Sprite_RAMTile + 4, Y
	BNE PlungerPaul_DrawPlunger

PlungerPaul_DrawFlipped:	
	LDA #$A9
	STA Sprite_RAMTile + 4, Y

	LDA #$BF
	STA Sprite_RAMTile, Y

PlungerPaul_DrawPlunger:
	LDA Sprite_RAMY + 8, Y
	SUB #$04
	STA Sprite_RAMY, Y

	LDA Sprite_RAMY + 12, Y
	SUB #$04
	STA Sprite_RAMY + 4, Y

	LDA Sprite_RAMX + 8, Y
	STA Sprite_RAMX, Y
	
	LDA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 4, Y

	LDA Sprite_RAMAttr + 8, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr , Y
	STA Sprite_RAMAttr + 4, Y

PlungerPaul_RTS:	
	RTS