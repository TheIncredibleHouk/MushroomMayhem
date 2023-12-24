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
OBJ_SEASONSLOT			= $95
OBJ_ICESPAWN			= $96
OBJ_MUNCHER			    = $97
OBJ_ITEMSHOP			= $98
OBJ_BADGESHOP			= $99
OBJ_LEVELUPMUSHROOM		= $9B
OBJ_GAMESCRIPT			= $9F

    .word ObjInit_HammerBro ; Object $8C
    .word ObjInit_NinjaBro ; Object $8D
    .word ObjInit_FireBro ; Object $8E
    .word ObjInit_IceBro ; Object $8F
    .word ObjInit_PirateBro ; Object $90
    .word ObjInit_Spintula ; Object $91
    .word ObjInit_Pyrantula ; Object $92
    .word ObjInit_BarrelBro ; Object $93
    .word ObjInit_PlungerPaul ; Object $94
    .word ObjInit_SeasonSlot ; Object $95
    .word ObjInit_IceSpawn ; Object $96
    .word ObjInit_Muncher ; Object $97
    .word ObjInit_ItemShop ; Object $98
    .word ObjInit_BadgeShop ; Object $99
    .word ObjInit_DoNothing ; Object $9A
    .word ObjInit_GoldMushroom ; Object $9B
    .word ObjInit_DoNothing ; Object $9C
    .word ObjInit_DoNothing ; Object $9D
    .word ObjInit_DoNothing ; Object $9E
    .word ObjInit_GameScript ; Object $9F

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
    .word ObjNorm_SeasonSlot ; Object $95
    .word ObjNorm_IceSpawn ; Object $96
    .word ObjNorm_Muncher ; Object $97
    .word ObjNorm_ItemShop ; Object $98
    .word ObjNorm_BadgeShop ; Object $99
    .word ObjInit_DoNothing ; Object $9A
    .word ObjNorm_GoldMushoom ; Object $9B
    .word ObjNorm_DoNothing ; Object $9C
    .word ObjNorm_DoNothing ; Object $9D
    .word ObjNorm_DoNothing ; Object $9E
    .word ObjNorm_GameScript ; Object $9F

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
    .word Player_GetHurt ; Object $97
    .word ObjHit_DoNothing ; Object $98
    .word ObjHit_DoNothing ; Object $99
    .word ObjHit_DoNothing ; Object $9A
    .word GoldMushroom_Collect ; Object $9B
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
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH64 ; Object $94
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $95
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $96
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $97
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $98
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $99
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9A
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $9B
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
    .byte OPTS_SETPT6 | $58 ; Object $95
    .byte OPTS_NOCHANGE ; Object $96
    .byte OPTS_NOCHANGE ; Object $97
    .byte OPTS_SETPT5 | $23 ; Object $98
    .byte OPTS_SETPT5 | $23 ; Object $99
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
	.byte $EB, $ED
	.byte $EF, $F1
	.byte $F3, $F5
	.byte $D1, $D3

ObjP96:
ObjP97:
	.byte $D5, $D7
	.byte $FD, $FF

ObjP98:
ObjP99:
	.byte $A5, $A7
	.byte $A9, $AB

ObjP9A:
	.byte $51, $53

ObjP9B:
	.byte $51, $53

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
	
		
	LDA HammerBro_FallThrough, X
	BEQ HammerBro_DetFloor

	DEC HammerBro_FallThrough, X
	JMP HammerBro_SkipTiles

HammerBro_DetFloor:
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

Hammer_XVel:	.byte -$16, $16

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
	BCC HammerBro_DrawLeft

	CMP #$F8
	BCS Hammer_DrawLeftRTS

	CMP #$08
	BCS HammerBro_DrawLeft

Hammer_DrawLeftRTS:
	RTS

HammerBro_DrawLeft:
	STA Sprite_RAMX - 8, Y
	ADD #$08
	BCC HammerBro_SetRight

	CMP #$F8
	BCS HammerBro_SetRightRTS

	CMP #$08
	BCS HammerBro_SetRight

HammerBro_SetRightRTS:	
	RTS

HammerBro_SetRight:	
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


NinjaBro_JumpYVel:	.byte -$60, -$30, -$60, -$30
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
	LDA Objects_BoundBottom, X
	ADD #$18
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile

	CMP #TILE_PROP_SOLID_ALL
	BCC Ninja_NotTop

	LDY #$00
	BEQ Ninja_SetYVel

Ninja_NotTop:	
	LDA RandomN + 2, X
	AND #$01
	TAY
	
Ninja_SetYVel:	
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
	BNE FireICePriateBro_NoShoot

	LDA Objects_SpritesVerticallyOffScreen,X
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
	CMP #$30
	
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

	LDA Objects_SpritesHorizontallyOffScreen, X
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

SeasonSlot_StartingOffset:
	.byte $00, $10, $20, $30

SeasonSlot_EndingOffset:
	.byte $D0, $E0, $F0, $00

ObjInit_SeasonSlot:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA Objects_Property, X
	AND #$03
	STA Objects_Property, X

	LDY Objects_Property, X
	LDA SeasonSlot_StartingOffset, Y
	STA SeasonSlot_Ticker, X

	LDA SeasonSlot_EndingOffset, Y
	STA SeasonSlot_Stop, X

	LDA #$40
	STA Objects_Timer, X
	JMP ObjNorm_SeasonSlot


SeasonSlot_SpriteX = Temp_Var2
SeasonSlot_SpriteY = Temp_Var1
SeasonSlot_SpriteOffset = Temp_Var7
SeasonSlot_TilesRemaining = Temp_Var4
SeasonSlot_TileOffset = Temp_Var3
SeasonSlot_Ticker = Objects_Data1
SeasonSlot_Pause = Objects_Data2
SeasonSlot_Stop = Objects_Data3

SeasonSlot_SpritePals:
	.byte SPR_PAL1, SPR_PAL3
	.byte SPR_PAL2, SPR_PAL2
	.byte SPR_PAL2, SPR_PAL2
	.byte SPR_PAL3, SPR_PAL3

ObjNorm_SeasonSlot:
; Temp_Var1 = Object sprite Y
; Temp_Var2 = Object sprite X
; Temp_Var3 = Object's LR flag
; Temp_Var4 = Object's attributes
; Temp_Var5 = Objects_SpritesVerticallyOffScreen
; Temp_Var6 = Object's starting tiles index (and -> 'X')
; Temp_Var7 = Object's Sprite_RAM offset (and -> 'Y')
; Temp_Var8 = Objects_SpritesHorizontallyOffScreen
	LDA <Player_HaltGameZ
	BNE SeasonSlot_Draw

	LDA Objects_Timer, X
	ORA SeasonSlot_Pause, X
	BNE SeasonSlot_Draw

	INC SeasonSlot_Ticker, X
	LDA SeasonSlot_Ticker, X
	CMP SeasonSlot_Stop, X
	BNE SeasonSlot_Draw

	LDA #$01
	STA SeasonSlot_Pause, X
	STA EventSwitch

	JSR SeasonSlot_UpdateWeather

SeasonSlot_Draw:
	JSR Object_ShakeAndCalcSprite

	DEC <SeasonSlot_SpriteY
	LDX <CurrentObjectIndexZ
	
	LDA SeasonSlot_Ticker, X
	AND #$0F
	STA <Temp_Var3

	LDA <SeasonSlot_SpriteX
	SUB <Temp_Var3
	STA <SeasonSlot_SpriteX

	LDA SeasonSlot_Ticker, X
	AND #$30
	LSR A
	LSR A
	LSR A
	LSR A
	STA <SeasonSlot_TileOffset

	LDA #$01
	STA <SeasonSlot_TilesRemaining

SeasonSlot_Loop:
	LDY <SeasonSlot_SpriteOffset
	
	LDA <SeasonSlot_TileOffset
	AND #$03
	ASL A
	TAX
	
	LDA ObjP95, X
	STA Sprite_RAMTile, Y

	LDA ObjP95 + 1, X
	STA Sprite_RAMTile + 4, Y

	LDA <SeasonSlot_SpriteY
	STA Sprite_RAMY, Y
	STA Sprite_RAMY + 4, Y

	LDA <SeasonSlot_SpriteX
	STA Sprite_RAMX, Y
	ADD #$08
	STA Sprite_RAMX + 4, Y

	LDA SeasonSlot_SpritePals, X
	ORA #SPR_BEHINDBG
	STA Sprite_RAMAttr, Y

	LDA SeasonSlot_SpritePals + 1, X
	ORA #SPR_BEHINDBG
	STA Sprite_RAMAttr + 4, Y

	LDA <SeasonSlot_SpriteOffset
	ADD #$08
	STA <SeasonSlot_SpriteOffset

	LDA <SeasonSlot_SpriteX
	ADD #$10
	STA <SeasonSlot_SpriteX

	INC <SeasonSlot_TileOffset

	DEC <SeasonSlot_TilesRemaining
	BPL SeasonSlot_Loop
	RTS

Weather_UpdateProperty:
	.byte WEATHER_SNOW
	.byte WEATHER_RAIN
	.byte WEATHER_NONE
	.byte WEATHER_LEAF

SeasonSlot_UpdateWeather:
	JSR SeasonSlot_FindWeather
	BCC SeasonSlot_UpdateWeatherRTS

	LDA Objects_Property, X
	TAX
	
	LDA Weather_UpdateProperty, X
	STA Objects_Property, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA #$0E
	STA PatTable_BankSel + 4

	LDX <CurrentObjectIndexZ

SeasonSlot_UpdateWeatherRTS:
	RTS
SeasonSlot_FindWeather:
	LDY #$04

SeasonSlot_UpdateWeather1:
	CPY CurrentObjectIndexZ
	BEQ SeasonSlot_UpdateWeather2
	
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE SeasonSlot_UpdateWeather2

	LDA Objects_ID, Y
	CMP #OBJ_WEATHER
	BNE SeasonSlot_UpdateWeather2

	SEC
	RTS

SeasonSlot_UpdateWeather2:
	DEY
	BPL SeasonSlot_UpdateWeather1
	CLC
	RTS

IceSpawn_Timers:
	.byte $40, $80

IceSpawn_XOffset:
	.byte $00, $08

IceSpawn_XVel:
	.byte $10, $F0

ObjInit_IceSpawn:
	LDY Objects_Property, X

	LDA IceSpawn_Timers, Y
	STA Objects_Timer, X

	JMP Object_NoInteractions

ObjNorm_IceSpawn:
	LDA Objects_Timer, X
	BNE IceSpawnRTS

	LDY Objects_Property, X
	LDA IceSpawn_XOffset, Y
	STA Proj_XOff

	LDA #$00
	STA Proj_YOff

	JSR Object_PrepProjectile
	BCC IceSpawnRTS

	LDA #$C0
	STA Objects_Timer, X

	LDA Objects_Property, X
	TAX

	LDA #SOBJ_ICEBALL
	STA SpecialObj_ID, Y

	LDA IceSpawn_XVel, X
	STA SpecialObj_XVel, Y

IceSpawnRTS:	
	RTS

Muncher_StartY = Objects_Data1
Muncher_StartYHi = Objects_Data2
Muncher_Jumping = Objects_Data5

ObjInit_Muncher:
	LDA #$02
	STA Objects_SpritesRequested, X

	LDA <Objects_YZ, X
	STA Muncher_StartY, X

	LDA <Objects_YHiZ, X
	STA Muncher_StartYHi, X

	LDA #$20
	STA Objects_Timer, X
	
	JMP Object_NoInteractions

ObjNorm_Muncher:
	LDA <Player_HaltGameZ
	BNE Muncher_Draw

	LDA Muncher_Jumping, X
	
	JSR DynJump

	.word Muncher_Waiting
	.word Muncher_Jump

Muncher_Waiting:
	LDA Objects_Timer, X
	BNE Muncher_Waiting1

	LDA Block_NeedsUpdate
	BNE Muncher_Waiting1

	LDA #$01
	STA Muncher_Jumping, X

	LDA #$C0
	STA <Objects_YVelZ, X

	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter
	TYA
	EOR #$01

	JSR Object_ChangeBlock

Muncher_Waiting1:
	JMP Muncher_Draw

Muncher_Jump:
	JSR Object_ApplyY_With_Gravity
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	
	LDA Muncher_StartY, X
	SUB <Objects_YZ, X

	LDA Muncher_StartYHi, X
	SBC <Objects_YHiZ, X

	BCS Muncher_Draw

	LDA #$00
	STA <Objects_YVelZ, X

	LDA Block_NeedsUpdate
	BNE Muncher_Draw

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	TYA
	EOR #$01

	JSR Object_ChangeBlock

	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	STA Muncher_Jumping, X

Muncher_Draw:
	LDA Muncher_Jumping, X
	BEQ Muncher_DrawRTS

	LDY #$00
	LDA <Objects_YVelZ, X
	BMI Muncher_DrawFrame

	INY

Muncher_DrawFrame:	
	TYA
	STA Objects_Frame, X
	JSR Object_Draw

Muncher_DrawRTS:
	RTS

Half_OffMsg:
	.db "HALF OFF!"

DrawHalf_OffMsg:
	LDY Graphics_BufCnt

	LDA #$28
	STA Graphics_Buffer, Y

	LDA #$6C
	STA Graphics_Buffer + 1, Y

	LDA #$09
	STA Graphics_Buffer + 2, Y

	LDX #$00

DrawHalf_OffMsgLoop:	
	LDA Half_OffMsg, X
	STA Graphics_Buffer + 3, Y
	INY
	INX
	CPX #$09
	BNE DrawHalf_OffMsgLoop

	LDA #$00
	STA Graphics_Buffer + 3, Y

	STY Graphics_BufCnt

	LDX <CurrentObjectIndexZ	
	RTS

ObjInit_ItemShop:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA CurrentDay
	SUB #$06
	CMP #$01
	BCS ItemShop_InitRTS

	INC ItemShop_HalfOff, X
	JSR DrawHalf_OffMsg

ItemShop_InitRTS:
	JMP Object_NoInteractions

ObjNorm_ItemShop:
	LDA ItemShop_Drawn, X
	BNE ItemShop_TryInstructions

	INC ItemShop_Drawn, X
	JMP ItemShop_UpdateWindow

ItemShop_TryInstructions:
	LDA ItemShop_InstructionsDrawn, X
	BNE ItemShop_Norm

	JSR ItemShop_WriteInstructions
	JMP ItemShop_Draw

ItemShop_Norm:
	LDA #$10
	STA Player_HaltTick

	LDA Pad_Input
	AND #PAD_B
	BEQ ItemShop_TryBuy

	LDA #$01
	STA <Level_ExitToMap
	STA Map_ReturnStatus

	LDA #MUS1_STOPMUSIC
	STA Sound_QMusic1
	JMP ItemShop_Draw

ItemShop_TryBuy:
	LDA Pad_Input
	AND #PAD_A
	BEQ ItemShop_Prev

	JSR ItemShop_BuyItem
	JMP ItemShop_Draw

ItemShop_Prev:	
	LDA Pad_Input
	AND #PAD_LEFT
	BEQ ItemShop_Next

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	DEC ItemShop_Window, X
	BPL ItemShop_Update

	LDA #$0D
	STA ItemShop_Window, X

	JMP ItemShop_Update

ItemShop_Next:
	LDA Pad_Input
	AND #PAD_RIGHT
	BEQ ItemShop_Draw

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	INC ItemShop_Window, X
	LDA ItemShop_Window, X
	CMP #$0E
	BCC ItemShop_Update

	LDA #$00
	STA ItemShop_Window, X

ItemShop_Update:
	JSR ItemShop_UpdateWindow

ItemShop_Draw:
	LDA #$00
	STA Objects_Frame, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	JSR Object_Draw

	INC Objects_Frame, X

	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X
	JSR Object_Draw	
	RTS

ItemShop_List:
	.byte $10, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0F, $10, $01

ItemShop_Tiles:
	.byte $FF, $FF, $FF, $FF ; $00
	.byte $00, $01, $10, $11 ; $01
	.byte $02, $03, $12, $13 ; $02
	.byte $04, $05, $14, $15 ; $03
	.byte $06, $07, $16, $17 ; $04
	.byte $08, $09, $18, $19 ; $05
	.byte $0A, $0B, $1A, $1B ; $06
	.byte $0C, $0D, $1C, $1D ; $07
	.byte $0E, $0F, $1E, $1F ; $08
	.byte $68, $69, $78, $79 ; $09
	.byte $6A, $6B, $7A, $7B ; $0A
	.byte $9C, $9D, $AC, $AD ; $0B
	.byte $9E, $9F, $AE, $AF ; $0C
	.byte $FF, $FF, $FF, $FF ; $0D
	.byte $FF, $FF, $FF, $FF ; $0E
	.byte $6C, $6D, $7C, $7C ; $10
	.byte $6A, $6B, $7E, $7F ; $11

ItemShop_Cost:
	.word 0		; $00
	.word 50	; $01
	.word 100	; $02
	.word 100	; $03
	.word 150	; $04
	.word 150	; $05
	.word 200	; $06
	.word 100	; $07
	.word 150	; $08
	.word 200	; $09
	.word 200	; $0A
	.word 300	; $0B
	.word 100	; $0C
	.word 500	; $0D
	.word 300	; $0E
	.word 500	; $0F
	.word 350	; $10

ItemShop_Palette:
	.byte 0		; $00
	.byte $06	; $01
	.byte $1A	; $02
	.byte $06	; $03
	.byte $28	; $04
	.byte $1A	; $05
	.byte $27	; $06
	.byte $1A	; $07
	.byte $27	; $08
	.byte $17	; $09
	.byte $00	; $0A
	.byte $17	; $0B
	.byte $00	; $0C
	.byte $00	; $0D
	.byte $00	; $0E
	.byte $06	; $0F
	.byte $00	; $10

Item_Description_Addresses:
	.word Item_Descriptions, Item_Descriptions2

Item_Descriptions:
	.db "     INVALID    "
	.db " SUPER MUSHROOM "
	.db "  FIRE  FLOWER  "
	.db "  RACCOON LEAF  "
	.db "POISON FROG SUIT"
	.db "   KOOPA SHELL  "
	.db "SLEDGE BROS SUIT"
	.db "   ICE FLOWER   "
	.db "    FOX LEAF    "
	.db " NINJA MUSHROOM "
	.db "    STAR MAN    "
	.db "   STOP WATCH   "
	.db "  SAVING WINGS  "
	.db "                "
	.db "                "
	.db " 3 HEART HEALTH "

Item_Descriptions2:	
	.db "    MEGA STAR   "

ItemShop_Window = Objects_Data1
ItemShop_Item1 = Temp_Var1
ItemShop_Item2 = Temp_Var2
ItemShop_Item3 = Temp_Var3
ItemShop_Descripts = Temp_Var5
ItemShop_Drawn = Objects_Data2
ItemShop_InstructionsDrawn = Objects_Data3
ItemShop_HalfOff = Objects_Data4
ItemShop_FreeDay = Objects_Data5

ItemShop_UpdateWindow:
	LDA ItemShop_Window, X
	TAY

	LDA ItemShop_List, Y
	STA ItemShop_Item1

	LDA ItemShop_List + 1, Y
	STA ItemShop_Item2

	LDA ItemShop_List + 2, Y
	STA ItemShop_Item3

	LDY Graphics_BufCnt

	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$EC
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA ItemShop_Item1
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA ItemShop_Item2
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA ItemShop_Item3
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$0C
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA ItemShop_Item1
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA ItemShop_Item2
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA ItemShop_Item3
	ASL A
	ASL A
	TAX

	LDA ItemShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA ItemShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY


	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$A8
	STA Graphics_Buffer, Y
	INY

	LDA #$10
	STA Graphics_Buffer, Y
	INY

	LDX #$00
	LDA ItemShop_Item2
	CMP #$10
	BCC ItemShop_DescriptOffset

	INX
	INX

ItemShop_DescriptOffset:
	LDA Item_Description_Addresses, X
	STA ItemShop_Descripts

	LDA Item_Description_Addresses + 1, X
	STA ItemShop_Descripts + 1
	
	LDA #$00
	LDX ItemShop_Item2
	
ItemShop_Loop:	
	ADD #$10
	DEX
	BNE ItemShop_Loop

	TAX

	LDA #$0F
	STA <Temp_Var4

	TXA
	PHA

	TYA
	TAX

	PLA
	TAY

ItemShop_Name:
	LDA [ItemShop_Descripts], Y
	STA Graphics_Buffer, X
	INY
	INX

	DEC <Temp_Var4
	BPL ItemShop_Name

	TXA
	TAY

	LDA #$3F
	STA Graphics_Buffer, Y
	INY

	LDA #$0E
	STA Graphics_Buffer, Y
	INY	

	LDA #$01
	STA Graphics_Buffer, Y
	INY


	LDX ItemShop_Item2
	LDA ItemShop_Palette, X
	STA Graphics_Buffer, Y
	STA Pal_Data + $0E
	STA Palette_Buffer + $0E
	INY	
	

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$4E
	STA Graphics_Buffer, Y
	INY

	LDA #$04
	STA Graphics_Buffer, Y
	INY	

	LDA #$D0
	STA Graphics_Buffer, Y
	INY	

	LDA ItemShop_Item2
	ASL A
	TAX

	LDA ItemShop_Cost, X
	STA <DigitsParam

	LDA ItemShop_Cost + 1, X
	STA DigitsParam + 1

	LDX <CurrentObjectIndexZ

	LDA ItemShop_HalfOff, X
	BEQ ItemShop_PriceDigits

	CLC
	ROR DigitsParam + 1
	ROR DigitsParam

ItemShop_PriceDigits:	
	
	JSR BytesTo3Digits

	LDA <DigitsResult + 2
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA <DigitsResult + 1
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA <DigitsResult 
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA #$00
	STA Graphics_Buffer, Y
	INY
	
ItemShop_Finish:
	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	RTS	

ItemShop_BuyItem:
	LDA Player_Coins
	STA CalcParam1

	LDA Player_Coins + 1
	STA CalcParam1 + 1

	LDY ItemShop_Window, X
	LDA ItemShop_List + 1, Y
	ASL A
	TAX

	LDA ItemShop_Cost, X
	STA CalcParam2

	LDA ItemShop_Cost + 1, X
	STA CalcParam2 + 1

	LDX <CurrentObjectIndexZ
	LDA ItemShop_HalfOff, X
	BEQ ItemShop_Subtract

	CLC
	ROR CalcParam2 + 1
	ROR CalcParam2	

ItemShop_Subtract:
	JSR Subtract2ByteValue
	
	LDA CalcResult + 1
	BMI ItemShop_CannotBuy

	LDA Sound_QLevel1
	ORA #SND_LEVELCOIN
	STA Sound_QLevel1

	LDA CalcResult
	STA Player_Coins

	LDA CalcResult + 1
	STA Player_Coins + 1

	INC Force_Coin_Update
	LDX <CurrentObjectIndexZ

	LDY ItemShop_Window, X
	LDA ItemShop_List + 1, Y
	STA PowerUp_Reserve
	RTS

ItemShop_CannotBuy:
	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

	LDX <CurrentObjectIndexZ
	RTS

ItemShop_Instructions:
	.byte $29, $A9, 14
	.db ": AND ; SELECT"

	.byte $29, $C9, 10
	.db "A BUY ITEM"

	.byte $29, $E9, 6
	.db "B EXIT"

	.byte $00

ItemShop_WriteInstructions:
	LDY Graphics_BufCnt
	BNE ItemShop_WriteInstructionsRTS
	
	LDX #$00

ItemShop_InstructionLoop:	
	LDA ItemShop_Instructions, X
	STA Graphics_Buffer, Y
	INY 
	INX

	CPX #40
	BCC  ItemShop_InstructionLoop

	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	INC ItemShop_InstructionsDrawn, X

ItemShop_WriteInstructionsRTS:
	RTS

ObjInit_BadgeShop:
	LDA #$04
	STA Objects_SpritesRequested, X
	
	LDA CurrentDay
	SUB #12
	CMP #$02
	BCS BadgeShop_InitRTS

	INC BadgeShop_HalfOff, X

	JSR DrawHalf_OffMsg

BadgeShop_InitRTS:
	JMP Object_NoInteractions

ObjNorm_BadgeShop:
	LDA BadgeShop_Drawn, X
	BNE BadgeShop_TryInstructions

	INC BadgeShop_Drawn, X
	JMP BadgeShop_UpdateWindow

BadgeShop_TryInstructions:
	LDA BadgeShop_InstructionsDrawn, X
	BNE BadgeShop_Norm

	JSR BadgeShop_WriteInstructions
	JMP BadgeShop_Draw

BadgeShop_Norm:		
	LDA #$10
	STA Player_HaltTick

	LDA Pad_Input
	AND #PAD_UP
	BEQ BadgeShop_TryExit

	JSR BadgeShop_Explanation
	JMP BadgeShop_Draw

BadgeShop_TryExit:	
	LDA Pad_Input
	AND #PAD_B
	BEQ BadgeShop_TryBuy

	LDA #$01
	STA <Level_ExitToMap
	STA Map_ReturnStatus

	LDA #MUS1_STOPMUSIC
	STA Sound_QMusic1

	CLR_MSG
	JMP BadgeShop_Draw

BadgeShop_TryBuy:	
	LDA Pad_Input
	AND #PAD_A
	BEQ BadgeShop_Prev

	LDA #$00
	STA Message_Id

	JSR BadgeShop_BuyBadge
	JMP BadgeShop_Draw

BadgeShop_Prev:	
	LDA Pad_Input
	AND #PAD_LEFT
	BEQ BadgeShop_Next

	LDA #$00
	STA Message_Id

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	DEC BadgeShop_Window, X
	BPL BadgeShop_Update

	LDA #$05
	STA BadgeShop_Window, X

	JMP BadgeShop_Update

BadgeShop_Next:
	LDA Pad_Input
	AND #PAD_RIGHT
	BEQ BadgeShop_Draw

	LDA #$00
	STA Message_Id

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	INC BadgeShop_Window, X
	LDA BadgeShop_Window, X
	CMP #$06
	BCC BadgeShop_Update

	LDA #$00
	STA BadgeShop_Window, X

BadgeShop_Update:
	JSR BadgeShop_UpdateWindow

BadgeShop_Draw:
	LDA #$00
	STA Objects_Frame, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	JSR Object_Draw

	INC Objects_Frame, X

	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X
	JSR Object_Draw
	RTS

BadgeShop_List:
	.byte BADGE_RADAR
	.byte BADGE_AIR
	.byte BADGE_XP
	.byte BADGE_PMETER 
	.byte BADGE_COIN
	.byte BADGE_ITEMRESERVE
	.byte BADGE_RADAR 		
	.byte BADGE_AIR

BadgeShop_Tiles:
	.byte $FF, $FF, $FF, $FF ; $00
	.byte $B2, $B3, $C2, $C3 ; $01
	.byte $B6, $B7, $C2, $C3 ; $02
	.byte $C6, $C7, $C2, $C3 ; $03
	.byte $BA, $BB, $CA, $CB ; $04
	.byte $B0, $B1, $C0, $C1 ; $05
	.byte $FF, $FF, $FF, $FF ; $06
	.byte $FF, $FF, $FF, $FF ; $07
	.byte $FF, $FF, $FF, $FF ; $08
	.byte $B4, $B5, $C4, $C5 ; $09
	

BadgeShop_Cost:
	.byte 0		; $00
	.byte 6	 	; $01
	.byte 8		; $02
	.byte 10	; $03
	.byte 4		; $04
	.byte 10	; $05
	.byte 00
	.byte 00
	.byte 00
	.byte 10	; $06

Badge_Descriptions:
	.db "     INVALID    "; 00
	.db "    DOUBLE XP   "; 01
	.db " DOUBLE P METER "; 02
	.db "  DOUBLE COINS  "; 03
	.db "  INCREASED AIR "; 04
	.db "  ITEM RESERVE  "; 05
	.db "                "; 06
	.db "                "; 07
	.db "                "; 08
	.db "   STAR RADAR   "; 09

BadgeShop_Window = Objects_Data1
BadgeShop_Badge1 = Temp_Var1
BadgeShop_Badge2 = Temp_Var2
BadgeShop_Badge3 = Temp_Var3
BadgeShop_Drawn = Objects_Data2
BadgeShop_InstructionsDrawn = Objects_Data3
BadgeShop_HalfOff = Objects_Data4
BadgeShop_Free = Objects_Data5

BadgeShop_UpdateWindow:
	LDA BadgeShop_Window, X
	TAY

	LDA BadgeShop_List, Y
	STA BadgeShop_Badge1

	LDA BadgeShop_List + 1, Y
	STA BadgeShop_Badge2

	LDA BadgeShop_List + 2, Y
	STA BadgeShop_Badge3

	LDY Graphics_BufCnt

	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$EC
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA BadgeShop_Badge1
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge3
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$0C
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA BadgeShop_Badge1
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge3
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY

	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$A8
	STA Graphics_Buffer, Y
	INY

	LDA #$10
	STA Graphics_Buffer, Y
	INY

	LDA #$00

	LDX BadgeShop_Badge2

BadgeShop_Loop:	
	ADD #$10
	DEX
	BNE BadgeShop_Loop

	TAX

	LDA #$0F
	STA <Temp_Var4

BadgeShop_Name:
	LDA Badge_Descriptions, X
	STA Graphics_Buffer, Y
	INY
	INX

	DEC <Temp_Var4
	BPL BadgeShop_Name

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$4E
	STA Graphics_Buffer, Y
	INY

	LDA #$03
	STA Graphics_Buffer, Y
	INY	

	LDA #$D5
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	TAX

	LDA BadgeShop_Cost, X
	STA <DigitsParam

	LDA BadgeShop_HalfOff, X
	BEQ BadgeShop_Digits

	LSR <DigitsParam

BadgeShop_Digits:	
	JSR BytesTo2Digits

	LDA <DigitsResult + 1
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA <DigitsResult 
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA #$00
	STA Graphics_Buffer, Y
	INY
	
BadgeShop_Finish:
	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	RTS	

BadgeShop_BuyBadge:
	LDY BadgeShop_Window, X
	LDA BadgeShop_List + 1, Y
	TAY

	LDA BadgeShop_Cost, Y
	LDY BadgeShop_HalfOff, X
	BEQ BadgeShop_Subtract

	LSR A

BadgeShop_Subtract:
	STA <Temp_Var4

	LDA Player_Cherries
	SUB <Temp_Var4
	BCC BadgeShop_CannotBuy
	
	STA Player_Cherries
	LDX <CurrentObjectIndexZ
	LDY BadgeShop_Window, X

	LDA BadgeShop_List + 1, Y
	STA Player_Badge

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	RTS

BadgeShop_CannotBuy:
	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

	LDX <CurrentObjectIndexZ
	RTS

BadgeShop_Instructions:
	.byte $29, $A9, 14
	.db ": AND ; SELECT"

	.byte $29, $C9, 11
	.db "A BUY BADGE"

	.byte $29, $E9, 6
	.db "B EXIT"

	.byte $2A, $09, 14
	.db "< EXPLANATION "

	.byte $00

BadgeShop_WriteInstructions:
	LDY Graphics_BufCnt
	BNE BadgeShop_WriteInstructionsRTS
	
	LDX #$00

BadgeShop_InstructionLoop:	
	LDA BadgeShop_Instructions, X
	STA Graphics_Buffer, Y
	INY 
	INX

	CPX #58
	BCC  BadgeShop_InstructionLoop

	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	INC BadgeShop_InstructionsDrawn, X

BadgeShop_WriteInstructionsRTS:
	RTS

Badge_Explanations:
	.byte $00
	 MSG_ID Badge_A_Explanation
	 MSG_ID Badge_B_Explanation
	 MSG_ID Badge_C_Explanation
	 MSG_ID Badge_D_Explanation
	 MSG_ID Badge_E_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation

BadgeShop_Explanation:
	LDY BadgeShop_Window, X
	LDA BadgeShop_List + 1, Y
	TAY

	LDA Badge_Explanations, Y
	STA Message_Id
	RTS


ObjInit_GameScript:
	LDA #$07
	STA Objects_SpritesRequested, X

	JMP Object_NoInteractions

GameScript_Init = Objects_Data1
GameScript_Finished = Objects_Data2
GameScript_Timer = Objects_Data3
GameScript_TimerFrac = Objects_Data4

Handle_GameScript_Timer:
	LDA GameScript_Timer, X
	BEQ GameScript_TimerRTS

	LDA GameScript_TimerFrac, X
	BNE GameScript_TimerDec

	LDA #60
	STA GameScript_TimerFrac, X

GameScript_TimerDec:	
	DEC GameScript_TimerFrac, X
	BNE GameScript_TimerRTS

	DEC GameScript_Timer, X

GameScript_TimerRTS:
	RTS

GameScript_CheckLoses:
	LDA GameScript_Losses
	BEQ GameScript_CheckLosesRTS

	CMP GameScript_LossLimit
    BNE GameScript_CheckLosesRTS

	JSR Player_Die

GameScript_CheckLosesRTS:
	RTS

GameScript_XOffset:
	.byte $20, $18

GameScript_NumOffset:
	.byte $00, $40				

GameScript_Draw:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	LDA GameScript_Timer, X
	STA DigitsParam

	LDA #$00
	STA DigitsParam + 1

	JSR BytesTo2Digits

	LDA LastPatTab_Sel
	EOR #$01
	TAX

	LDA GameScript_NumOffset, X
	STA <Temp_Var1

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	LDA #$10
	STA Sprite_RAMX, Y
	STA Sprite_RAMX + 4, Y
	STA Sprite_RAMX + 8, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y
	
	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 4 , Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr + 8 , Y

	LDA #$10
	STA Sprite_RAMY, Y

	LDA #$18
	STA Sprite_RAMY + 4, Y

	LDA #$20
	STA Sprite_RAMY + 8, Y

	LDA #$9F
	ADD <Temp_Var1
	STA Sprite_RAMTile, Y

	LDA #$BD
	ADD <Temp_Var1
	STA Sprite_RAMTile, Y

	LDA #$9F
	ADD <Temp_Var1
	STA Sprite_RAMTile + 4, Y

	LDA #$BF
	ADD <Temp_Var1
	STA Sprite_RAMTile + 8, Y

	LDX #$01

GameScript_DrawLoop:
	LDA #$10
	STA Sprite_RAMY+12, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr+12, Y

	LDA GameScript_XOffset, X
	STA Sprite_RAMX+ 12, Y

	LDA <DigitsResult, X
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile+12, Y

	INY
	INY
	INY
	INY

	DEX
	BPL GameScript_DrawLoop

	LDA #$18
	STA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 16, Y

	LDA #$18
	STA Sprite_RAMY + 12, Y

	LDA #$20
	STA Sprite_RAMY + 16, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 16, Y

	LDA GameScript_Losses
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile + 12, Y

	LDA GameScript_Wins
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile + 16, Y

	LDX <CurrentObjectIndexZ
	RTS

GameScript_MakeKey:
	JSR GameScript_Cleanup
	JSR Object_FindEmptyX
	
	LDA #OBJ_KEY
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA #$00
	STA Objects_Property, X

	LDA <Player_XHi
	STA <Objects_XHiZ, X

	LDA #$80
	STA <Objects_XZ, X
	STA <Poof_X

	LDA #$70
	STA <Objects_YZ, X
	STA <Poof_Y

	LDA #$01
	STA <Objects_YHiZ, X

	JSR Common_MakePoof

GameScript_MakeKeyRTS:
	LDX <CurrentObjectIndexZ
	RTS

ObjNorm_GameScript:
	LDA GameScript_Init, X
	BNE GameScript_Norm

	INC GameScript_Init, X

	LDA <Objects_YZ, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var1

	LDA <Objects_YHiZ, X
	ASL A
	ASL A
	ASL A
	ASL A
	ORA <Temp_Var1

	JSR DynJump

	.word Stage_1_Notify_Init
	.word Stage_1_1_Init
	.word Stage_1_2_Init
	.word Stage_1_3_Init
	.word Stage_1_4_Init
	.word Stage_1_5_Init
	.word Stage_2_Notify_Init
	.word Stage_2_1_Init
	.word Stage_2_2_Init
	.word Stage_2_3_Init
	.word Stage_2_4_Init
	.word Stage_2_5_Init
	.word Stage_2_6_Init
	.word Stage_2_7_Init
	.word Stage_3_Notify_Init
	.word Stage_3_1_Init
	.word Stage_3_2_Init
	.word Stage_3_3_Init
	.word Stage_3_4_Init
	.word Stage_3_5_Init
	.word Stage_3_6_Init
	.word Stage_3_7_Init
	.word Stage_3_8_Init
	.word Stage_3_9_Init

GameScript_Norm:
	LDA <Player_HaltGameZ
	BEQ GameScript_DoNorm
	
	JMP GameScript_Draw

GameScript_DoNorm:
	JSR Handle_GameScript_Timer
	JSR GameScript_Draw
	JSR GameScript_CheckLoses

	LDA <Objects_YZ, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var1

	LDA <Objects_YHiZ, X
	ASL A
	ASL A
	ASL A
	ASL A
	ORA <Temp_Var1

	JSR DynJump

	.word Stage_1_Notify
	.word Stage_1_1
	.word Stage_1_2
	.word Stage_1_3
	.word Stage_1_4
	.word Stage_1_5
	.word Stage_2_Notify
	.word Stage_2_1
	.word Stage_2_2
	.word Stage_2_3
	.word Stage_2_4
	.word Stage_2_5
	.word Stage_2_6
	.word Stage_2_7
	.word Stage_3_Notify
	.word Stage_3_1
	.word Stage_3_2
	.word Stage_3_3
	.word Stage_3_4
	.word Stage_3_5
	.word Stage_3_6
	.word Stage_3_7
	.word Stage_3_8
	.word Stage_3_9


GameScript_CoinsRemaining = Objects_Data5
GameScript_EnemiesRemaining = Objects_Data5
GameScript_BricksRemaining = Objects_Data5
GameScript_BlocksRemaining = Objects_Data5
GameScript_SwitchesRemaining = Objects_Data5
GameScript_PowerupPlacement = Objects_Data5

GameScript_CoinChallenge:
	LDA GameScript_Finished, X
	BEQ GameScript_CoinChallengeDo
	CLR_MSG
	RTS

GameScript_CoinChallengeDo:
	LDA Coins_Earned
	BEQ GameScript_CoinChallengeTimer

	LDA GameScript_CoinsRemaining, X
	SUB Coins_Earned
	STA GameScript_CoinsRemaining, X

	LDA #$00
	STA Coins_Earned

	LDA GameScript_CoinsRemaining, X
	BNE GameScript_CoinChallengeTimer

	INC GameScript_Wins
	INC GameScript_Finished, X

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	
	JSR GameScript_MakeKey

	LDA #$00
	STA GameScript_Timer, X
	RTS

GameScript_CoinChallengeTimer:
	LDA GameScript_Timer, X
	BNE GameScript_CoinChallengeTimerRTS

	INC GameScript_Losses
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

GameScript_CoinChallengeTimerRTS:	
	RTS

GameScript_EnemyChallenge:
	LDA GameScript_Finished, X
	BEQ GameScript_EnemyChallengeDo
	CLR_MSG
	RTS

GameScript_EnemyChallengeDo:
	LDA Kill_Count
	BEQ GameScript_EnemyChallengeTimer

	LDA GameScript_EnemiesRemaining, X
	SUB Kill_Count
	STA GameScript_EnemiesRemaining, X

	LDA #$00
	STA Kill_Count
	STA Exp_Earned

	LDA GameScript_EnemiesRemaining, X
	BNE GameScript_EnemyChallengeTimer

	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	
	LDA #$00
	STA GameScript_Timer, X
	RTS

GameScript_EnemyChallengeTimer:
	LDA GameScript_Timer, X
	BNE GameScript_EnemyChallengeRTS

	INC GameScript_Losses
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

GameScript_EnemyChallengeRTS:	
	RTS

GameScript_GfxBanks:
	.byte $60, $62, $64, $66

GameScript_BlockReplaces:
	.byte $16, $17, $18, $19

GameScript_BlockToggles:
	LDA GameScript_Finished, X
	BNE GameScript_BlockTogglesRTS

	LDA GameScript_Timer, X
	BNE GameScript_BlockToggleGfx

	INC GameScript_Finished, X
	INC GameScript_Losses
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap	
	RTS

GameScript_BlockToggleGfx:
	LDA Game_Counter
	AND #$30
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA GameScript_GfxBanks, Y
	STA PatTable_BankSel

	LDA EventSwitch
	BEQ GameScript_BlockTogglesRTS

	LDX #$02

GS_FindBlock:
	LDA Objects_ID + 5, X
	CMP #OBJ_ITEMBLOCK
	BEQ GS_BlockToggle_Replace

	DEX
	BPL GS_FindBlock
	RTS

GS_BlockToggle_Replace:
	LDA Game_Counter
	SUB #$01
	AND #$30
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA ItemBlock_ReplaceTile + 5, X
	AND #$F0
	CMP #$10
	BNE GS_BlockToggle_Exchange

	LDA #$26
	BNE GS_BlockToggle_Set

GS_BlockToggle_Exchange:
	LDA GameScript_BlockReplaces, Y

GS_BlockToggle_Set:	
	STA ItemBlock_ReplaceTile + 5, X
	PHA

	LDA <Objects_XZ + 5, X
	AND #$F0
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	PLA
	STA GameScript_Data, Y

	LDA #$00
	STA EventSwitch

GameScript_BlockTogglesRTS:
	LDX <CurrentObjectIndexZ
	RTS	

GameScript_BrickChallenge:
	LDA GameScript_Finished, X
	BEQ GameScript_BrickChallengeDo
	CLR_MSG
	RTS

GameScript_BrickChallengeDo:
	LDA Block_WasUpdated
	BEQ GameScript_BrickChallengeTimer

	DEC GameScript_BricksRemaining, X

	LDA GameScript_BricksRemaining, X
	BNE GameScript_BrickChallengeTimer

	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS

GameScript_BrickChallengeTimer:
	LDA GameScript_Timer, X
	BNE GameScript_BrickChallengeTimerRTS

	INC GameScript_Losses
	INC GameScript_Finished, X

	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap	

GameScript_BrickChallengeTimerRTS:	
	RTS


GameScript_MBlockChallenge:
	LDA GameScript_Finished, X
	BEQ GameScript_MBlockChallengeDo
	CLR_MSG
	RTS

GameScript_MBlockChallengeDo:
	LDA Block_WasUpdated
	BEQ GameScript_BrickChallengeTimer

	LDA Block_UpdateValue
	CMP #$1A
	BNE GameScript_MBlockChallengeTimer

	DEC GameScript_BlocksRemaining, X

	LDA GameScript_BlocksRemaining, X
	BNE GameScript_MBlockChallengeTimer

	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS

GameScript_MBlockChallengeTimer:
	LDA GameScript_Timer, X
	BNE GameScript_MBlockChallengeRTS

	INC GameScript_Losses
	INC GameScript_Finished, X

	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap	

GameScript_MBlockChallengeRTS:	
	RTS


GameScript_SwitchChallenge:
	LDA GameScript_Finished, X
	BEQ GameScript_SwitchChallengeDo
	CLR_MSG
	RTS

GameScript_SwitchChallengeDo:
	LDA Block_WasUpdated
	BEQ GameScript_SwitchChallengeTimer

	DEC GameScript_SwitchesRemaining, X
	BNE GameScript_SwitchChallengeTimer

	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS

GameScript_SwitchChallengeTimer:
	LDA GameScript_Timer, X
	BNE GameScript_SwitchChallengeRTS

	INC GameScript_Losses
	INC GameScript_Finished, X

	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap	

GameScript_SwitchChallengeRTS:	
	RTS	

GameScript_Cleanup:
	LDX #$04

GameScript_CleanupLoop:	
	CPX <CurrentObjectIndexZ
	BEQ GameScript_CleanupNext

	LDA Objects_State, X
	CMP #OBJSTATE_DEADEMPTY
	BEQ GameScript_CleanupNext

	JSR Object_PoofDie

GameScript_CleanupNext:
	DEX
	BPL GameScript_CleanupLoop

	LDY #$07
	LDA #$00

GameScript_ClearGens:	
	STA ObjectGenerator_ID, Y
	STA SpecialObj_ID, Y

	DEY
	BPL GameScript_ClearGens

	LDX <CurrentObjectIndexZ
	RTS

Stage_1_Notify_Init:
Stage_1_Notify:
	LDA #$00
	STA GameScript_Wins
	STA GameScript_Losses

	LDA #$03
	STA GameScript_LossLimit

	SET_MSG Game_Script_1_A
	RTS

Stage_1_1_Init:
	LDA #30
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #28
	STA GameScript_CoinsRemaining, X

	SET_MSG Game_Script_1_1
	RTS

Stage_1_1:	
	JSR GameScript_CoinChallenge
	RTS

Stage_1_2_Init:
	LDA #30
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #08
	STA GameScript_EnemiesRemaining, X

	SET_MSG Game_Script_1_2
	RTS

Stage_1_2:
	JSR GameScript_EnemyChallenge 
	RTS

Stage_1_3_Init:
	LDA #30
	STA GameScript_Timer, X

	SET_MSG Game_Script_1_3

	LDY #$0F
	LDA #$00

Stage_1_3_InitLoop:	
	STA GameScript_Data, Y
	DEY
	BPL Stage_1_3_InitLoop
	RTS

Stage_1_3_Pattern:
	.byte $00, $00, $00, $00, $18, $00, $17, $17, $17, $17, $00, $18, $00, $00, $00, $00

Stage_1_3:
	JSR GameScript_BlockToggles

	LDA GameScript_Finished, X
	BNE Stage_1_3RTS

	LDY #$0F

Stage_1_3_Loop:	
	LDA GameScript_Data, Y
	CMP Stage_1_3_Pattern, Y
	BNE Stage_1_3RTS

	DEY
	BPL Stage_1_3_Loop

	INC GameScript_Finished, X
	INC GameScript_Wins

	LDA #$00
	STA GameScript_Timer, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

Stage_1_3RTS:	
	RTS

Stage_1_4_Init:
	LDA #45
	STA GameScript_Timer, X

	SET_MSG Game_Script_1_4

	LDA #22
	STA GameScript_BricksRemaining, X
	RTS

Stage_1_4:
	JSR GameScript_BrickChallenge
	RTS

Stage_1_5_Init:
	LDA #45
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #10
	STA GameScript_BlocksRemaining, X

	SET_MSG Game_Script_1_5
	RTS

Stage_1_5:
	JSR GameScript_MBlockChallenge
	RTS

Stage_2_Notify_Init:
Stage_2_Notify:
	LDA #$00
	STA GameScript_Wins
	STA GameScript_Losses

	LDA #$04
	STA GameScript_LossLimit

	SET_MSG Game_Script_2_A
	RTS


Stage_2_1_Init:
	LDA #30
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #20
	STA GameScript_CoinsRemaining, X

	SET_MSG Game_Script_2_1
	RTS

Stage_2_1:	
	JSR GameScript_CoinChallenge
	RTS


Stage_2_2_Init:
	LDA #45
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #14
	STA GameScript_EnemiesRemaining, X

	SET_MSG Game_Script_2_2
	RTS

Stage_2_2:	
	JSR GameScript_EnemyChallenge
	RTS	


Stage_2_3_Init:
	LDA #60
	STA GameScript_Timer, X

	SET_MSG Game_Script_2_3

	LDY #$0F
	LDA #$00

Stage_2_3_InitLoop:	
	STA GameScript_Data, Y
	DEY
	BPL Stage_2_3_InitLoop
	RTS

Stage_2_3_Pattern:
	.byte $00, $00, $17, $00, $00, $19, $18, $17, $17, $00, $19, $18, $00, $00, $17, $00

Stage_2_3:
	JSR GameScript_BlockToggles
	LDA GameScript_Finished, X
	BNE Stage_2_3RTS

	LDY #$0F

Stage_2_3_Loop:	
	LDA GameScript_Data, Y
	CMP Stage_2_3_Pattern, Y
	BNE Stage_2_3RTS

	DEY
	BPL Stage_2_3_Loop

	INC GameScript_Finished, X
	INC GameScript_Wins

	LDA #$00
	STA GameScript_Timer, X

	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

Stage_2_3RTS:	
	RTS	

Stage_2_4_Init:
	LDA #35
	STA GameScript_Timer, X

	SET_MSG Game_Script_2_4

	LDA #18
	STA GameScript_BricksRemaining, X
	RTS

Stage_2_4:	
	JSR GameScript_BrickChallenge
	RTS


Stage_2_5_Init:
	LDA #35
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #10
	STA GameScript_BlocksRemaining, X

	SET_MSG Game_Script_2_5
	RTS

Stage_2_5:
	JSR GameScript_MBlockChallenge
	RTS	


Stage_2_6_Init:
	LDA #20
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #20
	STA GameScript_SwitchesRemaining, X

	SET_MSG Game_Script_2_6
	RTS

Stage_2_6:
	JSR GameScript_SwitchChallenge
	RTS		


Stage_2_7_Init:
	LDA #08
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	SET_MSG Game_Script_2_7

Stage_2_7RTS:
	RTS

Stage_2_7:
	LDA GameScript_Finished, X
	BNE Stage_2_7RTS

	LDA GameScript_Timer, X
	CMP #$04
	BCC Stage_2_7_Check

	LDA Game_Counter
	AND #$07
	BNE Stage_2_7_Wait

Stage_2_7_Shuffle:
	LDY #$04

Stage_2_7_Loop:
	LDA Objects_ID, Y
	CMP #OBJ_POWERUP
	BEQ Stage_2_7_Placement

	DEY
	BPL Stage_2_7_Loop

Stage_2_7_Placement:
	LDA RandomN
	AND #$70
	ADD #$40

	STA Objects_XZ, Y
	STA GameScript_PowerupPlacement, X

	LDA #$40
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XVelZ, Y
	STA Objects_YVelZ, Y

Stage_2_7_Wait:
	LDA #$08
	STA Player_HaltTick
	RTS

Stage_2_7_Check:
	LDA GameScript_PowerupPlacement, X
	BEQ Stage_2_7_Find

	LDY #$04

Stage_2_7_CheckLoop:
	LDA Objects_ID, Y
	CMP #OBJ_POWERUP
	BEQ Stage_2_7_Remove

	DEY
	BPL Stage_2_7_CheckLoop
	RTS

Stage_2_7_Remove:

	LDA #$00
	STA Objects_ID, Y

	LDA GameScript_PowerupPlacement, X
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA #$5B
	STA $6D20, Y

	LDA #$00
	STA GameScript_PowerupPlacement, X
	RTS

Stage_2_7_Find:
	LDY #$02

Stage_2_7_FindLoop:
	LDA Objects_ID + 5, Y
	CMP #OBJ_POWERUP
	BEQ Stage_2_7_Found

	DEY
	BPL Stage_2_7_FindLoop

	LDA GameScript_Timer, X
	BNE Stage_2_7_FindRTS

	INC GameScript_Losses
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

Stage_2_7_FindRTS:	
	RTS

Stage_2_7_Found:
	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS


Stage_3_Notify_Init:
Stage_3_Notify:
	LDA #$00
	STA GameScript_Wins
	STA GameScript_Losses

	LDA #$03
	STA GameScript_LossLimit

	SET_MSG Game_Script_3_A
	RTS	


Stage_3_1_Init:
	LDA #5
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #64
	STA GameScript_CoinsRemaining, X

	SET_MSG Game_Script_1_1
	RTS

Stage_3_1:	
	JSR GameScript_CoinChallenge
	RTS	


Stage_3_2_Init:
	LDA #5
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #3
	STA GameScript_EnemiesRemaining, X

	SET_MSG Game_Script_3_2
	RTS

Stage_3_2:	
	JSR GameScript_EnemyChallenge
	RTS		


Stage_3_3_Init:
	LDA #5
	STA GameScript_Timer, X

	SET_MSG Game_Script_3_4

	LDY #$0F
	LDA #$00

Stage_3_3_InitLoop:	
	STA GameScript_Data, Y
	DEY
	BPL Stage_3_3_InitLoop
	RTS

Stage_3_3_Pattern:
	.byte $00, $00, $00, $00, $00, $00, $00, $00, $18, $00, $00, $00, $00, $00, $00, $00

Stage_3_3:
	JSR GameScript_BlockToggles
	LDA GameScript_Finished, X
	BNE Stage_3_3RTS

	LDY #$0F

Stage_3_3_Loop:
	LDA GameScript_Data, Y
	CMP Stage_3_3_Pattern, Y
	BNE Stage_3_3RTS

	DEY
	BPL Stage_3_3_Loop

	INC GameScript_Finished, X
	INC GameScript_Wins

	LDA #$00
	STA GameScript_Timer, X

	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

Stage_3_3RTS:	
	RTS		


Stage_3_4_Init:
	LDA #5
	STA GameScript_Timer, X

	SET_MSG Game_Script_3_4

	LDA #4
	STA GameScript_BricksRemaining, X
	RTS

Stage_3_4:	
	JSR GameScript_BrickChallenge
	RTS

Stage_3_5_Init:
	LDA #7
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #2
	STA GameScript_BlocksRemaining, X

	SET_MSG Game_Script_3_5
	RTS

Stage_3_5:
	JSR GameScript_MBlockChallenge
	RTS	

Stage_3_6_Init:
	LDA #5
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	LDA #4
	STA GameScript_SwitchesRemaining, X

	SET_MSG Game_Script_3_6
	RTS

Stage_3_6:
	JSR GameScript_SwitchChallenge
	RTS	

Stage_3_7_Init:
	LDA #08
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	SET_MSG Game_Script_3_7

Stage_3_7RTS:
	RTS

Stage_3_7:
	LDA GameScript_Finished, X
	BNE Stage_3_7RTS

	LDA GameScript_Timer, X
	CMP #$04
	BCC Stage_3_7_Check

	LDA Game_Counter
	AND #$07
	BNE Stage_3_7_Wait

Stage_3_7_Shuffle:
	LDY #$04

Stage_3_7_Loop:
	LDA Objects_ID, Y
	CMP #OBJ_POWERUP
	BEQ Stage_3_7_Placement

	DEY
	BPL Stage_3_7_Loop

Stage_3_7_Placement:
	LDA RandomN
	AND #$70
	ADD #$40

	STA Objects_XZ, Y
	STA GameScript_PowerupPlacement, X

	LDA #$10
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XVelZ, Y
	STA Objects_YVelZ, Y

Stage_3_7_Wait:
	LDA #$08
	STA Player_HaltTick
	RTS

Stage_3_7_Check:
	LDA GameScript_PowerupPlacement, X
	BEQ Stage_3_7_Find

	LDY #$04

Stage_3_7_CheckLoop:
	LDA Objects_ID, Y
	CMP #OBJ_POWERUP
	BEQ Stage_3_7_Remove

	DEY
	BPL Stage_3_7_CheckLoop
	RTS

Stage_3_7_Remove:

	LDA #$00
	STA Objects_ID, Y

	LDA GameScript_PowerupPlacement, X
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA #$5B
	STA $6B70, Y

	LDA #$00
	STA GameScript_PowerupPlacement, X
	RTS

Stage_3_7_Find:
	LDY #$02

Stage_3_7_FindLoop:
	LDA Objects_ID + 5, Y
	CMP #OBJ_POWERUP
	BEQ Stage_3_7_Found

	DEY
	BPL Stage_3_7_FindLoop

	LDA GameScript_Timer, X
	BNE Stage_3_7_FindRTS

	INC GameScript_Losses
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

Stage_3_7_FindRTS:	
	RTS

Stage_3_7_Found:
	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS

Stage_3_8_Init:
	LDA #30
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	SET_MSG Game_Script_3_8
	RTS

Stage_3_8:
	LDA GameScript_Finished, X
	BNE Stage_3_8RTS

	LDA GameScript_Timer, X
	BNE Stage_3_8_Attack

	INC GameScript_Wins
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap

	LDA #$00
	STA GameScript_Timer, X
	RTS

Stage_3_8_Attack:
	LDY #$05
	LDA #$20

Stage_3_8_Loop:	
	STA Objects_Timer2, Y

	DEY
	BPL Stage_3_8_Loop

	LDA Player_FlashInv
	BEQ Stage_3_8RTS

	INC GameScript_Losses
	INC GameScript_Finished, X
	JSR GameScript_MakeKey

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

Stage_3_8RTS:
	RTS

Stage_3_9_Init:
	LDA #10
	STA GameScript_Timer, X

	LDA #60
	STA GameScript_TimerFrac, X

	SET_MSG Game_Script_3_9
	RTS

Stage_3_9:
	LDA GameScript_Finished, X
	BNE Stage_3_9RTS

	LDA GameScript_Timer, X
	BNE Stage_3_9_Check

	INC GameScript_Losses
	INC GameScript_Finished, X

	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap


Stage_3_9_Check:	
	CMP #8
	BNE Stage_3_9RTS

	LDA GameScript_TimerFrac, X
	CMP #$01
	BNE Stage_3_9RTS

	LDY #$04

Stage_3_9_Loop:	
	LDA Objects_State, Y
	BEQ Stage_3_9_Dim

	DEY
	BPL Stage_3_9_Loop

Stage_3_9_Dim:	
	LDA #OBJ_DIMMER
	STA Objects_ID, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA <Objects_XZ, X
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA <Objects_YZ, X
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	STA Objects_YHiZ, Y

Stage_3_9RTS:
	RTS
	

LevelUp_Messages:
	.byte $00
	 MSG_ID Level_Up1
	 MSG_ID Level_Up2
	 MSG_ID Level_Up3
	 MSG_ID Level_Up4
	 MSG_ID Level_Up5

ObjInit_GoldMushroom
	JSR Object_CalcBoundBoxForced
	JSR Object_MoveAwayFromPlayer
	JMP Object_NoInteractions

ObjNorm_GoldMushoom:
	LDA <Player_HaltGameZ
	BEQ GoldMushroom_Do

	JMP Object_Draw

GoldMushroom_Do:
	LDA #$00
	STA SprAnimOffset

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_DetectPlayer
	JSR Object_InteractWithPlayer

	JMP Object_Draw

GoldMushroom_Collect:
	LDY #$04

GoldMushroom_Loop:	
	CPY <CurrentObjectIndexZ
	BEQ GoldMushroom_NoDelete

	LDA #$00
	STA Objects_ID, Y

GoldMushroom_NoDelete:	
	DEY
	BPL GoldMushroom_Loop

	LDA Sound_QLevel1
	ORA #SND_LEVEL1UP
	STA Sound_QLevel1

	INC Player_Level
	LDY Player_Level
	
	LDA LevelUp_Messages, Y
	STA Message_Id

	LDA #$80
	STA CompleteLevelTimer
	JMP Object_Delete