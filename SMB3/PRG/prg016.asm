    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_HAMMERBRO    		= $8C
OBJ_NINJABRO            = $8D
OBJ_FIREBRO             = $8E
OBJ_ICEBRO              = $8F
OBJ_PIRATEBRO           = $90
OBJ_SPINTULA            = $91
OBJ_PYRANTULA           = $92

    .word ObjInit_HammerBro ; Object $8C
    .word ObjInit_NinjaBro ; Object $8D
    .word ObjInit_FireBro ; Object $8E
    .word ObjInit_IceBro ; Object $8F
    .word ObjInit_PirateBro ; Object $90
    .word ObjInit_Spintula ; Object $91
    .word ObjInit_Pyrantula ; Object $92
    .word  ; Object $93
    .word  ; Object $94
    .word  ; Object $95
    .word  ; Object $96
    .word  ; Object $97
    .word  ; Object $98
    .word  ; Object $99
    .word  ; Object $9A
    .word  ; Object $9B
    .word  ; Object $9C
    .word  ; Object $9D
    .word  ; Object $9E
    .word  ; Object $9F

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_HammerBro ; Object $8C
    .word ObjNorm_NinjaBro ; Object $8D
    .word ObjNorm_FireIcePirateBro ; Object $8E
    .word ObjNorm_FireIcePirateBro ; Object $8F
    .word ObjNorm_FireIcePirateBro ; Object $90
    .word ObjNorm_Spintula ; Object $91
    .word ObjNorm_Pyrantula ; Object $92
    .word  ; Object $93
    .word  ; Object $94
    .word  ; Object $95
    .word  ; Object $96
    .word  ; Object $97
    .word  ; Object $98
    .word  ; Object $99
    .word  ; Object $9A
    .word  ; Object $9B
    .word  ; Object $9C
    .word  ; Object $9D
    .word  ; Object $9E
    .word  ; Object $9F

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
    .word  ; Object $94
    .word  ; Object $95
    .word  ; Object $96
    .word  ; Object $97
    .word  ; Object $98
    .word  ; Object $99
    .word  ; Object $9A
    .word  ; Object $9B
    .word  ; Object $9C
    .word  ; Object $9D
    .word  ; Object $9E
    .word  ; Object $9F

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8C
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8D
    .byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8E
    .byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $8F
    .byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $90
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $91
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $92
    .byte  ; Object $93
    .byte  ; Object $94
    .byte  ; Object $95
    .byte  ; Object $96
    .byte  ; Object $97
    .byte  ; Object $98
    .byte  ; Object $99
    .byte  ; Object $9A
    .byte  ; Object $9B
    .byte  ; Object $9C
    .byte  ; Object $9D
    .byte  ; Object $9E
    .byte  ; Object $9F

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT5 | $4E ; Object $8C
    .byte OPTS_SETPT5 | $4E ; Object $8D
    .byte OPTS_SETPT5 | $4E ; Object $8E
    .byte OPTS_SETPT5 | $4E ; Object $8F
    .byte OPTS_SETPT5 | $4E ; Object $90
    .byte OPTS_SETPT5 | $0A ; Object $91
    .byte OPTS_SETPT5 | $0A ; Object $92
    .byte  ; Object $93
    .byte  ; Object $94
    .byte  ; Object $95
    .byte  ; Object $96
    .byte  ; Object $97
    .byte  ; Object $98
    .byte  ; Object $99
    .byte  ; Object $9A
    .byte  ; Object $9B
    .byte  ; Object $9C
    .byte  ; Object $9D
    .byte  ; Object $9E
    .byte  ; Object $9F

	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH ; Object $8C
    .byte KILLACT_POOFDEATH ; Object $8D
    .byte KILLACT_POOFDEATH ; Object $8E
    .byte KILLACT_POOFDEATH ; Object $8F
    .byte KILLACT_POOFDEATH ; Object $90
    .byte KILLACT_POOFDEATH ; Object $91
    .byte KILLACT_POOFDEATH ; Object $92
    .byte KILLACT_POOFDEATH ; Object $93
    .byte KILLACT_POOFDEATH ; Object $94
    .byte KILLACT_POOFDEATH ; Object $95
    .byte KILLACT_POOFDEATH ; Object $96
    .byte KILLACT_POOFDEATH ; Object $97
    .byte KILLACT_POOFDEATH ; Object $98
    .byte KILLACT_POOFDEATH ; Object $99
    .byte KILLACT_POOFDEATH ; Object $9A
    .byte KILLACT_POOFDEATH ; Object $9B
    .byte KILLACT_POOFDEATH ; Object $9C
    .byte KILLACT_POOFDEATH ; Object $9D
    .byte KILLACT_POOFDEATH ; Object $9E
    .byte KILLACT_POOFDEATH ; Object $9F

OG8_POff .func (\1 - ObjectGroup08_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG8_POff(ObjP8C), OG8_POff(ObjP8D), OG8_POff(ObjP8E), OG8_POff(Obj8F)
    .byte OG8_POff(ObjP90), OG8_POff(ObjP91), OG8_POff(ObjP92), OG8_POff(Obj93)
    .byte OG8_POff(ObjP94), OG8_POff(ObjP95), OG8_POff(ObjP96), OG8_POff(Obj97)
    .byte OG8_POff(ObjP98), OG8_POff(ObjP99), OG8_POff(ObjP9A), OG8_POff(Obj9B)
    .byte OG8_POff(ObjP9C), OG8_POff(ObjP9D), OG8_POff(ObjP9E), OG8_POff(Obj9F)

ObjectGroup08_PatternSets:

ObjP8C:
    .byte $B1, $B3, $B5, $B7, $B1, $B3, $A5, $A7
	.byte $AD, $AF, $B5, $B7, $AD, $AF, $A5, $A7

ObjP8D:
    .byte $95, $97, $A1, $A3, $95, $97, $B9, $BB
	.byte $99, $9B, $A1, $A3, $99, $9B, $B9, $BB

ObjP8E:
    .byte $81, $83, $B5, $B7, $81, $83, $A5, $A7
	.byte $85, $87, $B5, $B7, $85, $87, $A5, $A7

ObjP8F:
    .byte $8D, $8F, $B5, $B7, $8D, $8F, $A5, $A7
	.byte $91, $93, $B5, $B7, $91, $93, $A5, $A7

ObjP90:
    .byte $8D, $8D, $8F, $8F, $95, $95

ObjP91:
    .byte $A1, $A1, $A3, $A3, $A5, $A5
    
ObjP92:
ObjP93:
ObjP94:
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


HammerBro_ThrowTimes:
	.byte $18, $18, $18, $30

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
	
	LDA HammerBro_FallThrough, X
	BEQ HammerBro_DetectTiles

	DEC HammerBro_FallThrough, X
	JMP HammerBro_SkipTiles

HammerBro_DetectTiles:
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
	RTS		 ; Return
	
ObjNorm_NinjaBro:
	LDA <Player_HaltGameZ
	BEQ NinjaBro_Norm

	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BEQ NinjaBros_HaltDraw

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