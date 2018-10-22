    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    .word ObjInit_DoNothing	; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.word ObjInit_DoNothing		; Object $3D - OBJ_NIPPERFIREBREATHER
	.word ObjInit_DoNothing	; Object $3E - OBJ_PLATFORMFLOATS
	.word ObjInit_DryBones	; Object $3F - OBJ_DRYBONES
	.word ObjInit_PipeBlock	; Object $40 - OBJ_PIPEBLOCK
	.word ObjInit_PiranhaGrower		; Object $41 - OBJ_PIRANHAGROWER
	.word ObjInit_DryCheep	; Object $42 - OBJ_FLAMINGCHEEP
	.word ObjInit_BeachedCheep	; Object $43 - OBJ_BEACHEDCHEEP
	.word ObjInit_PlatformUnstable	; Object $44 - OBJ_PLATFORMUNSTABLE
	.word ObjInit_DoNothing		; Object $45 - OBJ_PWING
	.word ObjInit_Snifit	; Object $46 - OBJ_SNIFIT
	.word ObjInit_Birdo		; Object $47 - OBJ_BIRDO
	.word ObjInit_Ninji	; Object $48 - OBJ_NINJI
	.word ObjInit_DoNothing	; Object $49 - OBJ_FLOATINGBGCLOUD
	.word ObjInit_MagicStar1	; Object $4A - OBJ_MAGICSTAR
	.word ObjInit_MagicStar2	; Object $4B - OBJ_MAGICSTAR
	.word ObjInit_MagicStar3	; Object $4C - OBJ_MAGICSTAR
	.word ObjInit_JumpControl	; Object $4D
	.word ObjInit_DoNothing		; Object $4E
	.word ObjInit_DoNothing		; Object $4F - OBJ_CHAINCHOMPFREE

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_PlatformUnstable	; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.word ObjNorm_DoNothing	; Object $3D - OBJ_NIPPERFIREBREATHER
	.word ObjNorm_DoNothing	; Object $3E - OBJ_PLATFORMFLOATS
	.word ObjNorm_DryBones		; Object $3F - OBJ_DRYBONES
	.word ObjNorm_PipeBlock	; Object $40 - OBJ_PIPEBLOCK
	.word ObjNorm_PiranhaGrower	; Object $41 - OBJ_PIRANHAGROWER
	.word ObjNorm_DryCheep	; Object $42 - OBJ_FLAMINGCHEEP
	.word ObjNorm_BeachedCheep	; Object $43 - OBJ_BEACHEDCHEEP
	.word ObjNorm_PlatformUnstable	; Object $44 - OBJ_PLATFORMUNSTABLE
	.word ObjNorm_DoNothing		; Object $45 - OBJ_PWING
	.word ObjNorm_Snifit	; Object $46 - OBJ_SNIFIT
	.word ObjNorm_Birdo	; Object $47 - OBJ_BIRDO
	.word ObjNorm_Ninji	; Object $48 - OBJ_NINJI
	.word ObjNorm_DoNothing	; Object $49 - OBJ_FLOATINGBGCLOUD
	.word ObjNorm_MagicStar	; Object $4A - OBJ_MAGICSTAR
	.word ObjNorm_MagicStar		; Object $4B - OBJ_MAGICSTAR
	.word ObjNorm_MagicStar		; Object $4C - OBJ_MAGICSTAR
	.word ObjNorm_JumpControl	; Object $4D
	.word RhythmPlatforms		; Object $4E
	.word DPad_ControlTiles	; Object $4F - OBJ_CHAINCHOMPFREE

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word Platform_PlayerStandCopy		; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.word Player_GetHurt		; Object $3D - OBJ_NIPPERFIREBREATHER
	.word Platform_PlayerStandCopy		; Object $3E - OBJ_PLATFORMFLOATS
	.word Player_GetHurt		; Object $3F - OBJ_DRYBONES
	.word ObjHit_SolidBlock		; Object $40 - OBJ_PIPEBLOCK
	.word Player_GetHurt	; Object $41 - OBJ_PIRANHAGROWER
	.word Player_GetHurt		; Object $42 - OBJ_FLAMINGCHEEP
	.word ObjHit_DoNothing		; Object $43 - OBJ_BEACHEDCHEEP
	.word Platform_PlayerStandCopy		; Object $44 - OBJ_PLATFORMUNSTABLE
	.word ObjHit_DoNothing		; Object $45 - OBJ_PWING
	.word ObjHit_DoNothing		; Object $46 - OBJ_SNIFIT
	.word Birdo_HurtOrStand		; Object $47 - OBJ_BIRDO
	.word ObjHit_DoNothing	; Object $48 - OBJ_NINJI
	.word ObjHit_DoNothing	; Object $49 - OBJ_FLOATINGBGCLOUD
	.word Magic_StarCollect	; Object $4A - OBJ_MAGICSTAR
	.word Magic_StarCollect	; Object $4A - OBJ_MAGICSTAR
	.word Magic_StarCollect	; Object $4A - OBJ_MAGICSTAR
	.word ObjHit_DoNothing; Object $4D
	.word ObjHit_DoNothing	; Object $4E
	.word ObjHit_DoNothing	; Object $4F - OBJ_CHAINCHOMPFREE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $3D - OBJ_NIPPERFIREBREATHER
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $3E - OBJ_PLATFORMFLOATS
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $3F - OBJ_DRYBONES
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH32	; Object $40 - OBJ_PIPEBLOCK
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $41 - OBJ_PIRANHAGROWER
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $42 - OBJ_FLAMINGCHEEP
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $43 - OBJ_BEACHEDCHEEP
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $44 - OBJ_PLATFORMUNSTABLE
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $45 - OBJ_PWING
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $46 - OBJ_SNIFIT
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $47 - OBJ_BIRDO
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $48 - OBJ_NINJI
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $49 - OBJ_FLOATINGBGCLOUD
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $4A - OBJ_MAGICSTAR
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $4B - OBJ_MAGICSTAR
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $4C - OBJ_MAGICSTAR
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $4D
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $4E
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $4F - OBJ_CHAINCHOMPFREE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_NOCHANGE	; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.byte OPTS_SETPT5 | $0A	; Object $3D - OBJ_NIPPERFIREBREATHER
	.byte OPTS_NOCHANGE; Object $3E - OBJ_PLATFORMFLOATS
	.byte OPTS_SETPT6 | $13	; Object $3F - OBJ_DRYBONES
	.byte OPTS_SETPT5 | $0B	; Object $40 - OBJ_PIPEBLOCK
	.byte OPTS_SETPT5 | $0B	; Object $41 - OBJ_PIRANHAGROWER
	.byte OPTS_SETPT5 | $0A	; Object $42 - OBJ_FLAMINGCHEEP
	.byte OPTS_SETPT6 | $4F	; Object $43 - OBJ_BEACHEDCHEEP
	.byte OPTS_NOCHANGE ; Object $44 - OBJ_PLATFORMUNSTABLE
	.byte OPTS_SETPT5 | $4D	; Object $45 - OBJ_PWING
	.byte OPTS_SETPT5 | $0F	; Object $46 - OBJ_SNIFIT
	.byte OPTS_SETPT5 | $4C		; Object $47 - OBJ_BIRDO
    .byte OPTS_SETPT5 | $0F	; Object $48 - OBJ_NINJI
	.byte OPTS_NOCHANGE	; Object $49 - OBJ_FLOATINGBGCLOUD
	.byte OPTS_NOCHANGE	; Object $4A - OBJ_MAGICSTAR
	.byte OPTS_NOCHANGE	; Object $4B - OBJ_MAGICSTAR
	.byte OPTS_NOCHANGE	; Object $4C - OBJ_MAGICSTAR
	.byte OPTS_NOCHANGE	; Object $4D
	.byte OPTS_NOCHANGE	; Object $4E
	.byte OPTS_SETPT5 | $0E	; Object $4F - OBJ_CHAINCHOMPFREE

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STANDARD	; Object $3C - OBJ_PLATFORM_PATHFOLLOW
	.byte KILLACT_STANDARD	; Object $3D - OBJ_NIPPERFIREBREATHER
	.byte KILLACT_STANDARD	; Object $3E - OBJ_PLATFORMFLOATS
	.byte KILLACT_POOFDEATH	; Object $3F - OBJ_DRYBONES
	.byte KILLACT_NORMALANDKILLED	; Object $40 - OBJ_PIPEBLOCK
	.byte KILLACT_NORMALANDKILLED	; Object $41 - OBJ_PIRANHAGROWER
	.byte KILLACT_POOFDEATH	; Object $42 - OBJ_FLAMINGCHEEP
	.byte KILLACT_POOFDEATH	; Object $43 - OBJ_BEACHEDCHEEP
	.byte KILLACT_STANDARD	; Object $44 - OBJ_PLATFORMUNSTABLE
	.byte KILLACT_POOFDEATH	; Object $45 - OBJ_PWING
	.byte KILLACT_POOFDEATH	; Object $46 - OBJ_SNIFIT
	.byte KILLACT_POOFDEATH	; Object $47 - OBJ_BIRDO
    .byte KILLACT_POOFDEATH	; Object $48 - OBJ_NINJI
	.byte KILLACT_STANDARD	; Object $49 - OBJ_FLOATINGBGCLOUD
	.byte KILLACT_STANDARD	; Object $4A - OBJ_MAGICSTAR
	.byte KILLACT_STANDARD	; Object $4B - OBJ_MAGICSTAR
	.byte KILLACT_STANDARD	; Object $4C - OBJ_MAGICSTAR
	.byte KILLACT_STANDARD	; Object $4D
	.byte KILLACT_STANDARD	; Object $4E
	.byte KILLACT_POOFDEATH	; Object $4F - OBJ_CHAINCHOMPFREE


OG4_POff .func (\1 - ObjectGroup04_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
	.byte OG1_POff(ObjP3C), OG1_POff(ObjP3D), OG1_POff(ObjP3E), OG1_POff(ObjP3F)
	.byte OG1_POff(ObjP40), OG1_POff(ObjP41), OG1_POff(ObjP42), OG1_POff(ObjP43)
	.byte OG1_POff(ObjP44), OG1_POff(ObjP45), OG1_POff(ObjP46), OG1_POff(ObjP47)
	.byte OG4_POff(ObjP48), OG4_POff(ObjP49), OG4_POff(ObjP4A), OG4_POff(ObjP4B)
	.byte OG4_POff(ObjP4C), OG4_POff(ObjP4D), OG4_POff(ObjP4E), OG4_POff(ObjP4F)


    .org ObjectGroup_PatternSets	; <-- help enforce this table *here*

ObjectGroup04_PatternSets:

ObjP3C:
ObjP3D:
	.byte $A1, $A3, $A5, $A7, $A9, $AB

ObjP3E:
ObjP3F:
	.byte $C1, $C3, $C5, $C7
	.byte $C9, $CB, $CD, $CF
	.byte $71, $D1, $D3, $D5
	.byte $71, $71, $DD, $DF

ObjP40:
	.byte $AF, $B1, $B3, $B5    

ObjP41:
	.byte $E1, $E1, $E5, $E5, $B9, $B7, $BF, $BB, $B3, $B3, $B5, $B5, $B7, $B9, $BB, $BF    

ObjP42:
	.byte $91, $93, $91, $9B, $91, $9B    

ObjP43:
	.byte $E7, $E9, $E7, $EF, $E7, $EF

ObjP44:
	.byte $77, $77, $77, $77, $77, $77

ObjP45:
	.byte $BD, $BF

ObjP46:
	.byte $A9, $AB
	.byte $AD, $AF  

ObjP47:
	.byte $81, $83, $89, $8B
	.byte $81, $83, $93, $95
	.byte $85, $87, $89, $8B
	.byte $85, $87, $93, $95
	.byte $9D, $9F, $89, $8B
	.byte $9D, $9F, $93, $95      

ObjP48:
	.byte $A1, $A3, $A5, $A7, $A5, $A7

ObjP49:
ObjP4A:
ObjP4B:
ObjP4C:
	.byte $7F, $7F
	
ObjP4D:
ObjP4E:
ObjP4F:


ObjInit_DryBones:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA #$08
	STA Objects_Timer, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA #(ATTR_BUMPNOKILL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA #(ATTR_FIREPROOF | ATTR_TAILPROOF)
	STA Objects_WeaponAttr, X

	LDA #$04
	STA Objects_SpritesRequested, X
	RTS

DryBones_Frames = Objects_Data1

DryBones_CrumbleFrames:
	.byte $02, $03, $03, $03, $03, $03, $03, $03
	.byte $03, $03, $03, $03, $03, $03, $03, $02

DryBones_PoofX:
	.byte $F8, $10

ObjNorm_DryBones:
	LDA <Player_HaltGameZ
	BEQ DryBones_Norm

	JMP DryBones_Draw

DryBones_Norm:	
	JSR Object_DeleteOffScreen

	LDA Objects_Timer2, X
	CMP #$0F
	BNE DryBones_NoPoof

	LDY #$00

	LDA Objects_Orientation, X
	BEQ DryBones_MakePoof

	INY

DryBones_MakePoof:
	LDA <Objects_XZ, X
	ADD DryBones_PoofX, Y
	STA <Poof_X

	LDA <Objects_YZ, X
	STA Poof_Y
	JSR Common_MakePoof

DryBones_NoPoof:
	LDA Objects_Timer2, X
	CMP #$01
	BNE DryBones_DoMove

	JSR Object_MoveTowardsPlayer

	LDA #(ATTR_BUMPNOKILL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

DryBones_DoMove:	
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_InteractWithObjects
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE DryBones_Animate

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE DryBones_CheckStomped

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE DryBones_Fall

DryBones_CheckStomped:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE DryBones_Animate

DryBones_Fall:
	JSR DryBones_Crumble
	
DryBones_Animate:
	LDA Objects_Timer2, X
	BEQ DryBones_AnimateWalk

	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA DryBones_CrumbleFrames, Y
	STA Objects_Frame,X

	BNE DryBones_Draw

DryBones_AnimateWalk:
	INC DryBones_Frames,X
	LDA DryBones_Frames,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X
	JMP DryBones_Draw

DryBones_Draw:
	LDA Objects_Frame, X
	CMP #$02
	BCC DryBones_DrawStanding

	LDA #$00
	STA <Temp_Var9
	
	LDA Objects_Timer2, X
	CMP #$30
	BCS DryBones_CheckDirection

	CMP #$10
	BCC DryBones_CheckDirection

	LSR A
	AND #$01
	STA <Temp_Var9

DryBones_CheckDirection:
	LDA Objects_Orientation, X
	BNE DryBones_LyingRight
	
	LDA #$10
	ORA <Temp_Var9
	STA <Temp_Var9
	
DryBones_LyingRight:
	LDA <Objects_XZ, X
	SUB <Temp_Var9
	STA <Objects_XZ, X

	JSR Object_Draw32x16

	LDA <Objects_XZ, X
	ADD <Temp_Var9
	STA <Objects_XZ, X
	RTS

DryBones_DrawStanding:
	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X
	
	JSR Object_Draw16x32
	
	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X
	RTS

DryBones_SkullOff:
	.byte $F4, $0C
	.byte $FF, $00

DryBones_SkullXVel:
	.byte $F0, $10

DryBones_Crumble:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_Timer2, X
	BNE DryBones_CrumbleRTS

	LDA #$F2
	STA Objects_Timer2, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$00
	STA <Objects_XVelZ, X

	LDA #ATTR_BUMPNOKILL
	STA Objects_BehaviorAttr, X

	LDY #$00

	LDA Objects_Orientation, X
	BEQ DryBones_SkullPrep

	INY

DryBones_SkullPrep:
	LDA DryBones_SkullXVel, Y
	STA <Temp_Var14

	LDA DryBones_SkullOff, Y
	STA <Temp_Var15

	LDA DryBones_SkullOff + 2, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	
	LDA #SOBJ_SKULL
	STA SpecialObj_ID, Y

	LDA <Objects_XZ, X
	ADD <Temp_Var15
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var16
	STA SpecialObj_XHi, Y

	LDA <Temp_Var14
	STA SpecialObj_XVel, Y

	LDA <Objects_YZ, X
	ADD #$04
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA #$E2
	STA SpecialObj_Timer, Y

	LDA #$00
	STA SpecialObj_YVel, Y

DryBones_CrumbleRTS:
	RTS


ObjInit_PipeBlock:
	LDA #BOUND32x16BLOCK
	STA Objects_BoundBox, X
	
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA <Objects_YZ, X
	SUB #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$10
	STA Objects_Timer, X

	LDA Objects_Property, X
	STA PipeBlock_State, X
	TAY

	LDA PipeBlock_YVelFrac, Y
	STA Objects_YVelFrac, X

	LDA <Objects_YZ, X
	STA PipeBlock_StartY, X

	LDA <Objects_YHiZ, X
	STA PipeBlock_StartYHi, X
	
	JMP Object_NoInteractions

PipeBlock_State = Objects_Data1
PipeBlock_ChangeRightQueue = Objects_Data2
PipeBlock_DisableMove = Objects_Data3
PipeBlock_StartY = Objects_Data4
PipeBlock_StartYHi = Objects_Data5

PipeBlock_YVel:
	.byte $08, $F8, $08, $F8

ObjNorm_PipeBlock:
	LDA <Player_HaltGameZ
	BEQ PipeBlock_Norm

	JMP PipeBlock_Draw

PipeBlock_Norm:

	LDA <Objects_YZ, X
	CMP PipeBlock_StartY, X
	BNE PipeBlock_NoDelete

	LDA <Objects_YHiZ, X
	CMP PipeBlock_StartYHi, X
	BNE PipeBlock_NoDelete

	JSR Object_DeleteOffScreen	

PipeBlock_NoDelete:
	JSR PipeBlock_MatchPalette
	JSR Object_CalcBoundBox
	JSR Object_KillOthers
	JSR Object_InteractWithPlayer

	LDA Objects_Timer, X
	ORA PipeBlock_DisableMove, X
	BNE PipeBlock_Stall

	LDY PipeBlock_State, X

	LDA PipeBlock_YVel, Y
	STA Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity

PipeBlock_Stall:	
	LDA PipeBlock_ChangeRightQueue, X
	BNE PipeBlock_CheckByPass

	LDA Objects_Timer, X
	BNE PipeBlock_DoDraw
	
PipeBlock_CheckByPass:	
	JSR PipeBlock_CheckBlocks

PipeBlock_DoDraw:
	JMP PipeBlock_Draw

PipeBlock_YCheck:
	.byte $18, $F8, $18, $F8
	.byte $00, $FF, $00, $FF

PipeBlock_YVelFrac:
	.byte $00, $80, $00, $80

PipeBlock_PropCheck:
	.byte TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID
	.byte TILE_PROP_ENEMY
	.byte TILE_PROP_ENEMY
	.byte TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID

PipeBlock_CheckBlocks:
	LDA Block_NeedsUpdate
	BEQ PipeBlock_DoCheck

	LDA #$01
	STA PipeBlock_DisableMove, X

	LDA #$00
	STA <Objects_YVelZ, X
	RTS

PipeBlock_DoCheck:
	STA PipeBlock_DisableMove, X

	LDA PipeBlock_ChangeRightQueue, X
	BEQ PipeBlock_NotQueued
	JMP PipeBlock_ChangeBlockRight

PipeBlock_NotQueued:
	LDY PipeBlock_State, X
	
	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0F
	BNE PipeBlock_CheckBlocksRTS

	LDA <Objects_YZ, X
	ADD PipeBlock_YCheck, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC PipeBlock_YCheck + 4, Y
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi	

	JSR Object_DetectTile
	LDY PipeBlock_State, X
	CMP PipeBlock_PropCheck, Y
	BNE PipeBlock_ChangeDirection

	JSR PipeBlock_ChangeBlockLeft
	INC PipeBlock_ChangeRightQueue, X
	JMP PipeBlock_CheckBlocksRTS

PipeBlock_ChangeDirection:
	LDA PipeBlock_State, X
	EOR #$01
	STA PipeBlock_State, X

	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_YVelZ, X

	JSR PipeBlock_ChangeBlockLeft
	INC PipeBlock_ChangeRightQueue, X

	LDY PipeBlock_State, X
	LDA PipeBlock_YVelFrac, Y
	STA Objects_YVelFrac, X 

PipeBlock_CheckBlocksRTS:
	RTS

PipeBlock_ChangeBlockLeft:
	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

PipeBlock_ChangeBlock:
	LDA <Objects_YZ, X
	ADD #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	TYA
	EOR #$01
	JSR Object_ChangeBlock
	
	RTS

PipeBlock_ChangeBlockRight:
	LDA #$00
	STA PipeBlock_ChangeRightQueue, X

	LDA <Objects_XZ, X
	ADD #$10
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JMP PipeBlock_ChangeBlock


PipeBlock_Draw:
	JSR Object_Draw

	LDA ObjP40 + 2
	STA Sprite_RAMTile + 8, Y

	LDA ObjP40 + 3
	STA Sprite_RAMTile + 12, Y

	LDA Sprite_RAMAttr , Y
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_2_HINVISIBLE
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE PipeBlock_Draw1

	LDA Objects_SpriteX , X
	ADD #$10
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	STA Sprite_RAMY + 8, Y
	

PipeBlock_Draw1:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_3_HINVISIBLE
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE PipeBlock_DrawRTS
	
	LDA Objects_SpriteX , X
	ADD #$18
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X 
	STA Sprite_RAMY + 12, Y

PipeBlock_DrawRTS:	
	RTS

PipeBlock_MatchPalette:
	LDA Pal_Data + 10
	STA Pal_Data + 26
	STA Palette_Buffer + 26

	LDA Pal_Data + 11
	STA Pal_Data + 27
	STA Palette_Buffer + 27
	RTS


Grower_DrawAttributes:
	.byte $00, SPR_HFLIP, SPR_HFLIP, SPR_HFLIP, SPR_VFLIP, SPR_HFLIP | SPR_VFLIP, $00, $00


Grower_DrawFlip:
	.byte $02, $03, $00, $01

Grower_XVel:
	.byte $00, $20, $00, $E0

Grower_YVel:
	.byte $E0, $00, $20, $00


Grower_Frame = Objects_Data1
Grower_Direction = Objects_Data2
Grower_StartX = Objects_Data3
Grower_StartXHi = Objects_Data4
Grower_StartY = Objects_Data5
Grower_StartYHi = Objects_Data6
Grower_TilePropDetect = Objects_Data7
Grower_ReverseDraw = Objects_Data8

Grower_WeaponAttributes:
	.byte ATTR_STOMPPROOF, ATTR_ALLWEAPONPROOF

Grower_BehaviorAttributes:
	.byte 0, ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF

ObjInit_PiranhaGrower:
	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

ObjInit_PiranhaGrowerCommon:	
	; which direction to start in 0 = up, 1 = right, 2 = down, 3 = left

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Objects_Property, X
	STA Grower_Direction, X

	 ; Grower_StartYHi = current tile to check for (Toggle sbeten #TILE_PROP_ENEMY and #TILE_PROP_HARMFUL)
	LDA #TILE_PROP_ENEMY
	STA Grower_TilePropDetect, X

	; back up original position
	LDA Objects_XZ, X
	STA Grower_StartX, X
	
	LDA Objects_XHiZ, X
	STA Grower_StartXHi, X
	
	LDA Objects_YZ, X
	STA Grower_StartY, X
	
	LDA Objects_YHiZ, X
	STA Grower_StartYHi, X
	RTS

ObjNorm_PiranhaGrower:
	LDA <Player_HaltGameZ
	BEQ Grower_Norm
	
	JMP Grower_Draw

Grower_Norm:
	LDA Objects_PlayerProjHit, X
	BEQ Grower_NotHit

	LDA #$00
	STA Objects_Timer2, X
	STA Objects_PlayerProjHit, X

Grower_NotHit:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Grower_Normal

	JMP Grower_Retract
	
Grower_Normal:
	LDA Objects_Timer, X
	BEQ Grower_Move
	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Grower_Animate
	JSR Grower_TimerToggle
	RTS

Grower_Move:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel
	JSR Object_CalcBoundBox
	
	LDA <Objects_XZ, X
	ORA <Objects_YZ, X
	AND #$0F
	BNE Grower_Animate
	
	JSR Grower_AtStart
	BCC Grower_NoDelete

	JSR Grower_CheckOffScreen
	
Grower_NoDelete:

	JSR Object_DetectTiles	
	JSR Grower_InteractWithTiles
	JSR Object_AttackOrDefeat

Grower_Animate:
	INC Grower_Frame, X
	
	LDA Grower_Frame, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA <Temp_Var1
	LDA Grower_Direction, X
	EOR Grower_ReverseDraw, X
	ASL A
	STA <Temp_Var2
	ORA <Temp_Var1
	STA Objects_Frame, X

Grower_Draw:
	JSR Object_DrawAligned

	LDA Grower_Direction, X
	EOR Grower_ReverseDraw, X
	ASL A
	TAX
	LDA Grower_DrawAttributes, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y
	
	LDA Grower_DrawAttributes + 1, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

Grower_AtStart:
	LDA Grower_StartX, X
	CMP Objects_XZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartXHi, X
	CMP Objects_XHiZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartY, X
	CMP Objects_YZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartYHi, X
	CMP Objects_YHiZ, X
	BNE Grower_NotBeginning
	SEC
	RTS
	
Grower_NotBeginning:
	CLC
	RTS

Grower_CheckOffScreen:
	LDA #$01
	STA TempA
	
	JSR Grower_DeleteOffScreen

	LDA TempA
	BEQ Grower_CheckOffScreen1
	JSR Object_DetectTileCenter

	LDA Block_NeedsUpdate
	BNE Grower_CheckOffScreen1
	
	LDA Tile_LastValue
	EOR #$01

	JSR Object_ChangeBlock
	PLA
	PLA

Grower_CheckOffScreen1:
	RTS

Grower_DeleteOffScreen:
	JSR Object_DeleteOffScreen
	LDA #$00
	STA TempA
	RTS

Grower_TimerToggle:
	LDX <CurrentObjectIndexZ

	LDA Objects_Timer, X
	BEQ Grower_TimerToggle1

	LDA Objects_Timer, X
	CMP #$01
	BNE Grower_TimerToggle1

	LDA Grower_ReverseDraw, X
	EOR #$02
	STA Grower_ReverseDraw, X

	LDA Grower_TilePropDetect, X
	CMP #TILE_PROP_ENEMY
	BEQ Grower_TimerToggle0

	LDA #TILE_PROP_ENEMY
	STA Grower_TilePropDetect, X
	RTS

Grower_TimerToggle0:
	LDA #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	STA Grower_TilePropDetect, X

Grower_TimerToggle1:
	RTS

Grower_InteractWithTiles:
	LDA Block_NeedsUpdate
	BEQ Grower_InteractWithTiles2

Grower_InteractWithTiles1:
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X
	RTS

Grower_InteractWithTiles2:
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock

	LDA #$00
	STA <Temp_Var13
	JSR Grower_DetectBlockAbove
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity

	INC <Temp_Var13
	JSR Grower_DetectBlockRight
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity

	INC <Temp_Var13
	JSR Grower_DetectBlockBelow
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity
	
	INC <Temp_Var13
	JSR Grower_DetectBlockLeft
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity
	
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	LDA #$80
	STA Objects_Timer, X

	RTS

Grower_SetVelocity:
	LDY <Temp_Var13
	LDA Grower_XVel, Y
	STA <Objects_XVelZ, X
	
	LDA Grower_YVel, Y
	STA <Objects_YVelZ, X
	
	TYA
	STA Grower_Direction, X
	LDY Grower_StartYHi, X
	CPY #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BNE DrawPiranhaGrow1

	TAY
	LDA Grower_DrawFlip, Y 
	STA Grower_Direction, X

DrawPiranhaGrow1:
	LDA #$00
	RTS

Grower_DetectBlockAbove:
	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	RTS

Grower_DetectBlockBelow:
	LDA <Objects_YZ, X
	ADD #$18
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_DetectBlockRight:
	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$18
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_DetectBlockLeft:
	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	SUB #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	SBC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_Retract:

	JSR Object_CalcBoundBox

Grower_KeepRetracting:
	LDA Block_NeedsUpdate
	BNE Grower_RetractRTS

	LDA Objects_Timer2, X
	BNE Grower_RetractRTS
	
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	AND #$FE
	JSR Object_ChangeBlock
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Grower_NoPoof

	LDA <Objects_XZ, X
	AND #$F0
	STA <Poof_X

	LDA <Objects_YZ, X
	AND #$F0
	STA <Poof_Y
	JSR Common_MakePoof

Grower_NoPoof:	
	JSR Grower_DetectBlockAbove
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockRight
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockBelow
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockLeft
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JMP Object_Delete

Grower_SetPosition:	
	LDA Tile_DetectionX
	STA <Objects_XZ, X

	LDA Tile_DetectionXHi
	STA <Objects_XHiZ, X

	LDA Tile_DetectionY
	STA <Objects_YZ, X

	LDA Tile_DetectionYHi
	STA <Objects_YHiZ, X

	LDA #$08
	STA Objects_Timer2, X
	
Grower_RetractRTS:
	RTS	


ObjInit_DryCheep:
	LDA #$04
	STA Objects_SpritesRequested,X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayerFast
	
	LDA <Objects_XZ, X
	STA DryCheep_PoofX, X

	LDA <Objects_YZ, X
	STA DryCheep_PoofY, X

	LDA <Objects_YHiZ, X
	STA DryCheep_PoofYHi, X

	LDA Objects_Property, X
	STA DryCheep_Burning, X

	LDA #$01
	STA Objects_Health, X
	RTS

DryCheep_Burning = Objects_Data2
DryCheep_PoofX = Objects_Data3
DryCheep_PoofY = Objects_Data4
DryCheep_PoofYHi = Objects_Data5
DryCheep_FlameFrame = Objects_Data6
DryCheep_PoofTimer = Objects_Data7

DryCheep_PoofTime:
	.byte $13

Flame_Frames:
	.byte $81, $83, $85, $87	

ObjNorm_DryCheep:
	LDA <Player_HaltGameZ
	BNE Dry_DrawNoAnimate

ObjNorm_DryCheep0:
	JSR Object_DeleteOffScreen
	
	LDA DryCheep_Burning, X
	BNE Dry_WeaponAttr

	LDA #(ATTR_FIREPROOF)
	STA Objects_WeaponAttr, X
	BEQ Dry_CheckIce

Dry_WeaponAttr:
	LDA #(ATTR_FIREPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF | ATTR_NOICE)
	STA Objects_WeaponAttr, X

Dry_CheckIce:
	LDA Objects_PlayerProjHit, X
	BEQ Dry_NotHit

	CMP #HIT_ICEBALL
	BNE Dry_NotHit

	LDA DryCheep_Burning, X
	BEQ Dry_NotHit

Dry_RemoveBurn:
	LDA #$00
	STA DryCheep_Burning, X
	STA Objects_PlayerProjHit, X
	
	INC Objects_Health, X

Dry_NotHit:
	LDA Objects_Timer, X
	BNE Dry_InWater
	
	LDA Objects_InWater, X
	BEQ Dry_Move

	JSR Object_MoveTowardsPlayerFast

	LDA BeachedCheep_YVel
	STA <Objects_YVelZ, X

Dry_Move:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

Dry_Normal:
	JSR Object_DetectTiles

	LDA Objects_Property, X
	CMP #$03
	BNE DryCheep_Tiles

	LDA <Objects_TilesDetectZ,X
	AND #~HIT_GROUND
	STA <Objects_TilesDetectZ,X

DryCheep_Tiles:	
	JSR Object_InteractWithTiles
	JSR Dry_DoBounce
	LDA Objects_InWater, X
	BEQ Dry_Draw
	
Dry_SetTimer:
	LDA #$20
	STA Objects_Timer, X
	JSR Dry_CheckLava
	JSR Object_FacePlayer

Dry_Draw:
	INC BeachedCheep_CurrentFrame,X
	LDA BeachedCheep_CurrentFrame,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Dry_DrawNoAnimate:
	JMP DryCheep_DrawFlamesAndSmoke

Dry_InWater:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP DryCheep_DrawFlamesAndSmoke

Dry_DoBounce:
	LDA <Objects_TilesDetectZ, X
	AND #$04
	BEQ Dry_DoBounce1

	LDA BeachedCheep_GroundBounce
	STA <Objects_YVelZ, X

Dry_DoBounce1:
	RTS

Dry_CheckLava:
	LDA Object_BodyTileProp, X
	AND #$0F
	CMP #(TILE_PROP_HARMFUL)
	BEQ Dry_MakeBurn

	LDA #$00
	STA DryCheep_Burning, X
	RTS

Dry_MakeBurn:
	LDA #$01
	STA DryCheep_Burning, X

	LDA DryCheep_PoofTime
	STA DryCheep_PoofTimer, X
	RTS

DryCheep_DrawFlamesAndSmoke:
	JSR Object_Draw
	
	LDA DryCheep_Burning, X
	BNE DryCheep_MakeFlamePoof
	RTS

DryCheep_MakeFlamePoof:
	LDA Sprite_RAM,Y
	SUB #$08
	STA Sprite_RAM+8,Y

	LDA Sprite_RAM + 4,Y
	SUB #$08
	STA Sprite_RAM+12,Y

	LDA Sprite_RAM+3,Y
	STA Sprite_RAM+11,Y

	LDA Sprite_RAM+7,Y
	STA Sprite_RAM+15,Y

	LDA Sprite_RAM+2,Y
	AND #$BF
	STA Sprite_RAM+10,Y
	STA Sprite_RAM+14,Y

	INC DryCheep_FlameFrame, X
	LDA DryCheep_FlameFrame, X
	LSR A
	LSR A
	AND #$02
	TAX 
	LDA Flame_Frames, X
	STA Sprite_RAM+9,Y

	LDA Flame_Frames + 1, X
	STA Sprite_RAM+13,Y

	LDA <Player_HaltGameZ
	BNE DryCheep_DrawFlamesAndSmoke2

	LDX <CurrentObjectIndexZ


	LDA Objects_XVelZ, X
	ORA Objects_YVelZ, X
	BEQ DryCheep_DrawFlamesAndSmoke2

	LDA DryCheep_PoofTimer, X
	BNE DryCheep_DrawFlamesAndSmoke1

	LDA Objects_InWater, X
	BNE DryCheep_DrawFlamesAndSmoke2

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE DryCheep_SkipPoof

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi

	JSR Common_MakePoof

DryCheep_SkipPoof:
	LDA DryCheep_PoofTime
	STA DryCheep_PoofTimer, X

	LDA <Objects_XZ, X
	STA DryCheep_PoofX, X

	LDA <Objects_YZ, X
	STA DryCheep_PoofY, X

	LDA <Objects_YHiZ, X
	STA DryCheep_PoofYHi, X
	
DryCheep_DrawFlamesAndSmoke1:
	DEC DryCheep_PoofTimer, X

DryCheep_DrawFlamesAndSmoke2:
	RTS



ObjInit_BusterBeatle:
ObjNorm_BusterBeatle:
	RTS		 ; Return

ObjInit_BeachedCheep:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA <Objects_YVelZ, X
	BNE BeachedCheep_Prop

	LDA #(ATTR_CARRYANDBUMP | ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayerFast

BeachedCheep_Prop:
	LDY Objects_Property, X
	CPY #$02
	BNE ObjInit_BeachedCheep1

	LDA #$10
	STA <Objects_YVelZ, X

ObjInit_BeachedCheep1:
	LDA BeachedCheep_VFlip, Y
	ORA Objects_Orientation, X
	STA Objects_Orientation, X
	RTS
	
BeachedCheep_XVel: .byte $10, $F0
BeachedCheep_YVel: .byte $A0, $60
BeachedCheep_VFlip: .byte $00, SPR_VFLIP, $00, $00

BeachedCheep_IsWaiting = Objects_Data3
BeachedCheep_CurrentFrame = Objects_Data4
BeachedCheep_NoWaterTimer = Objects_Data5

BeachedCheep_GroundBounce: 
	.byte $D0, $F8, $D0

BeachedCheep_CeilingBounce: 
	.byte $08, $30, $30

ObjNorm_BeachedCheep:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_BeachedCheep0
	JMP Beached_DrawNoAnimate

ObjNorm_BeachedCheep0:
	JSR Object_DeleteOffScreen
	
	LDA Objects_Timer, X
	BEQ Beached_NoTimer
	JMP Beached_InWater
	
Beached_NoTimer:
	LDA Objects_InWater, X
	BEQ Beached_Move

	JSR Object_MoveTowardsPlayerFast
	
	LDY Objects_Property, X

	LDA BeachedCheep_YVel, Y
	STA <Objects_YVelZ, X

	LDA #$10
	STA BeachedCheep_NoWaterTimer, X

Beached_Move:
	
	LDY Objects_Property, X
	BEQ Beached_Move1

	CPY #$03
	BEQ Beached_Move1

	CPY #$01
	BEQ Beached_ReveseGravity

	INC NoGravity
	BNE Beached_Move1

Beached_ReveseGravity:
	INC Reverse_Gravity

Beached_Move1:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA Objects_Property, X
	CMP #$03
	BNE Beached_InteractTiles

	LDA <Objects_YVelZ, X
	BMI Beached_NoDetect

	LDA #$00
	STA Objects_Property, X

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCC Beached_InteractTiles

	JMP Object_PoofDie

Beached_InteractTiles:
	JSR Object_InteractWithTiles
	JSR Beached_DoBounce

Beached_NoDetect:
	LDA BeachedCheep_NoWaterTimer, X
	BEQ Beached_WaterOk

	DEC BeachedCheep_NoWaterTimer, X
	JMP Beached_Draw

Beached_WaterOk:
	LDA Objects_InWater, X
	BEQ Beached_Draw
	
Beached_SetTimer:
	LDA #$20
	STA Objects_Timer, X
	JSR Object_FacePlayer

Beached_Draw:
	INC BeachedCheep_CurrentFrame,X
	LDA BeachedCheep_CurrentFrame,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Beached_DrawNoAnimate:
	JMP Object_Draw

Beached_InWater:
	JSR Object_FacePlayer
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP Object_Draw

Beached_DoBounce:
	LDY Objects_Property, X
	LDA <Objects_TilesDetectZ, X
	AND #$04
	BEQ Beached_DoBounce1

	LDA BeachedCheep_GroundBounce, Y
	STA <Objects_YVelZ, X

Beached_DoBounce1:
	LDA  <Objects_TilesDetectZ, X
	AND #$08
	BEQ Beached_DoBounce2

	LDA BeachedCheep_CeilingBounce, Y
	STA <Objects_YVelZ, X

Beached_DoBounce2:
	RTS


Platform_Index = Objects_Data1
Platform_Ticker = Objects_Data2
Platform_Regen = Objects_Data6
Platform_NotBehind = Objects_Data7
Platform_MaxFall = Objects_Data8
Platform_StartY = Objects_Data9
Platform_StartYHi = Objects_Data10
PlatformUnstable_MoveTimer = Objects_Data11
PlatformUnstable_NoRegen = Objects_Data12

ObjInit_PlatformUnstable:
	LDA #BOUND48x16
	STA Objects_BoundBox, X

	LDA #$06
	STA Objects_SpritesRequested, X

	JSR Object_NoInteractions

	LDA #$20
	STA Platform_MaxFall, X
	STA Platform_Regen, X
	STA Platform_NotBehind, X

	LDA <Objects_YZ, X
	STA Platform_StartY, X

	LDA <Objects_YHiZ, X
	STA Platform_StartYHi, X
	RTS

ObjNorm_PlatformUnstable:
	LDA <Player_HaltGameZ
	BNE Unstable_Draw

	JSR Object_DeleteOffScreen
	JSR Unstable_CheckRegen
	JSR Object_CalcBoundBox
	
	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR Unstable_Move
	JSR Platform_ContactCheck

Unstable_Draw:
	LDA Objects_Timer, X  
	BEQ Unstable_DrawNorm
	RTS

Unstable_DrawNorm:
	LDA Platform_NotBehind, X
	BNE Unstable_Draw1

Unstable_Draw1:
	JMP Platform_DrawCopy

Unstable_Move:
	LDA PlatformUnstable_MoveTimer, X
	BEQ Unstable_MoveNormal

	DEC PlatformUnstable_MoveTimer, X
	BNE Unstable_MoveContant

	INC Platform_SteppedOn, X
	
	LDA Objects_SpriteAttributes, X
	AND #~SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	
	JSR Object_ApplyYVel_NoGravity
	RTS

Unstable_MoveContant:
	JSR Object_ApplyYVel_NoGravity

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	RTS

Unstable_MoveNormal:

	LDA Platform_SteppedOn, X
	BEQ Unstable_MoveRTS

	JSR Object_Move

	LDA <Objects_YVelZ,X
	BMI Unstable_MoveRTS
	CMP #$20
	BCC Unstable_MoveRTS

	LDA #$20
	STA <Objects_YVelZ,X

Unstable_MoveRTS:
	RTS

Unstable_CheckSteppedOn:
	LDA Platform_SteppedOn, X
	BEQ Unstable_CheckSteppedOnRTS

	INC Platform_Ticker, X
	LDA Platform_Ticker, X
	AND #$01
	BEQ Unstable_CheckSteppedOnRTS

	JSR Object_Move

Unstable_CheckSteppedOnRTS:
	RTS

Unstable_CheckRegen:
	LDA Objects_Timer, X  
	BEQ Unstable_CheckFallTooFar

	LDA #$00
	STA Platform_SteppedOn, X
	STA <Objects_YVelZ, X
	
	LDA Platform_StartY, X
	STA <Objects_YZ, X

	LDA Platform_StartYHi, X
	STA <Objects_YHiZ, X
	PLA
	PLA
	RTS

Unstable_CheckFallTooFar:
	LDA PlatformUnstable_NoRegen, X
	BNE Unstable_CheckFallTooFarRTS

	LDA <Objects_YHiZ, X
	BEQ Unstable_CheckFallTooFarRTS
	BMI Unstable_CheckFallTooFarRTS

	LDA <Objects_YZ, X
	CMP #$B0
	BCC Unstable_CheckFallTooFarRTS

	LDA #$60
	STA Objects_Timer, X

Unstable_CheckFallTooFarRTS:
	RTS

Unstable_CheckContact:
	LDA Platform_MadeContact, X
	BEQ Unstable_CheckContactRTS

Unstable_CheckContactRTS:
	RTS
  


Platform_DrawCopy:
	LDA #$00
	STA Objects_Orientation, X
	
	LDA Objects_SpritesVerticallyOffScreen,X
	BEQ Platform_DoDrawCopy

	RTS

Platform_DoDrawCopy:
	INC <Objects_YZ, X
	JSR Object_DrawMirrored

	DEC <Objects_YZ, X

	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_2_HINVISIBLE
	BNE Platform_DrawCopy1

	LDA <Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 8, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 8, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 8, Y

Platform_DrawCopy1:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_3_HINVISIBLE
	BNE Platform_DrawCopy2

	LDA <Objects_SpriteX, X
	ADD #$18
	STA Sprite_RAMX + 12, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 12, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 12, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 12, Y

Platform_DrawCopy2:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_4_HINVISIBLE
	BNE Platform_DrawCopy3

	LDA <Objects_SpriteX, X
	ADD #$20
	STA Sprite_RAMX + 16, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

Platform_DrawCopy3:
	
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_5_HINVISIBLE
	BNE Platform_DrawCopy4

	LDA <Objects_SpriteX, X
	ADD #$28
	STA Sprite_RAMX + 20, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 20, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 20, Y

Platform_DrawCopy4:
	RTS		 ; Return

Platform_PlayerStandCopy:
	LDA <Player_YVel
	BMI Platform_PlayerStandCopy1

	LDA HitTest_Result
	AND #HITTEST_BOTTOM
	BEQ Platform_PlayerStandCopy1

	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$04
	BCS Platform_PlayerStandCopy1

	LDA #$01
	STA Platform_SteppedOn, X
	STA Platform_MadeContact, X

Platform_PlayerStandCopy1:	
	RTS

Platform_PlayerOffsetCopy:
	.byte $01, $00
	.byte $00, $00

Platform_ContactCheckCopy:
	LDA Platform_MadeContact, X
	BEQ Platform_CheckCopyRTS
	
	LDA <Objects_YZ,X	 
	SUB #30
	STA <Player_Y

	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Player_YHi

	LDA #$00
	STA <Player_YVel
	STA Player_InAir

	LDA <Objects_XVelZ, X
	STA Player_CarryXVel
	
Platform_CheckCopyRTS:
	RTS



ObjInit_Snifit:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$02
	STA Objects_Health, X

	LDA #$40
	STA Objects_Timer, X

	JSR Object_CalcBoundBox
	JSR Object_FacePlayer

	LDA Objects_Property, X
	BNE Snifit_InitRTS

	JSR Object_MoveTowardsPlayer

Snifit_InitRTS:
	RTS

Snifit_Frame = Objects_Data1
Snifit_Action = Objects_Data2
Snifit_ShotsLeft = Objects_Data3
Snifit_ShootTimer = Objects_Data4

Snifit_Shots:
	.byte $03, $02, $01, $04, $02, $01, $02, $03

ObjNorm_Snifit:
	LDA <Player_HaltGameZ
	BEQ Snifit_Norm
	JMP Snifit_Draw

Snifit_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat

	LDA Snifit_Action, X
	JSR DynJump

	.word Snifit_March
	.word Snifit_Shoot

Snifit_March:
	LDA Objects_Timer, X
	BNE Snifit_MarchDone

	LDA #$10
	STA Snifit_ShootTimer, X
	INC Snifit_Action, X

	LDA #$00
	STA Objects_XVelZ, X

	LDA RandomN
	AND #$07
	TAY

	LDA Snifit_Shots, Y
	STA Snifit_ShotsLeft, X

Snifit_MarchDone:
	JMP Snifit_Animate

Snifit_ShootXVel:
	.byte $18, $E8

Snifit_WalkTimer:
	.byte $40, $60, $50, $40

Snifit_Draw2:
	JMP Snifit_Draw
	
Snifit_Shoot:
	LDA Snifit_ShootTimer, X
	BEQ Snifit_DoShot

	DEC Snifit_ShootTimer, X
 	BNE Snifit_Draw2

	LDA Snifit_ShotsLeft, X
	BEQ Snifit_Draw2

	LDA RandomN
	AND #$01
	BNE Snifit_Draw2
	

	LDA #$C0
	STA <Objects_YVelZ, X
	BNE Snifit_Draw2

Snifit_DoShot:
	JSR Object_FacePlayer
	LDA Snifit_ShotsLeft, X
	BNE Snifit_CheckYVel

	LDA #$00
	STA Snifit_Action, X

	LDA RandomN
	AND #$03
	TAY 
	
	LDA Snifit_WalkTimer, Y
	STA Objects_Timer, X

	LDA Objects_Property, X
	BEQ Snifit_ShootFacePlayer
	JMP Snifit_Draw

Snifit_ShootFacePlayer:
	JSR Object_MoveTowardsPlayer
	JMP Snifit_Draw

Snifit_CheckYVel:
	LDA <Objects_YVelZ, X
	BMI Snifit_ShootDone

	LDA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BNE Snifit_FireballNoFlip

	JSR Object_PrepProjectile
	BCC Snifit_ShootDone

	LDA #SOBJ_FIREBALL
	STA SpecialObj_ID, Y

	LDA #$01
	STA SpecialObj_Data1, Y
	STA SpecialObj_Data3, Y

	LDA #$E8
	STA SpecialObj_XVel, Y

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA <Objects_XZ, X
	ADD #$04
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	STA SpecialObj_YHi, Y

	LDA Objects_Orientation, X
	BEQ Snifit_FireballNoFlip

	LDA #$18
	STA SpecialObj_XVel, Y

Snifit_FireballNoFlip:
	DEC Snifit_ShotsLeft, X

	LDA #$30
	STA Snifit_ShootTimer, X

Snifit_ShootDone:
	JMP Snifit_Draw

Snifit_Animate:
	LDA Objects_Property, X
	BNE Snifit_AnimateAnyway

	LDA <Objects_XVelZ, X
	BEQ Snifit_Draw

Snifit_AnimateAnyway:
	INC Snifit_Frame, X

	LDA Snifit_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Snifit_Draw:
	JMP Object_Draw



Birdo_WalkTicker = Objects_Data1
Birdo_Pause = Objects_Data2
Birdo_HurtTimer = Objects_Data3
Birdo_PrevHealth = Objects_Data4
Birdo_PalState = Objects_Data5
Birdo_TickIndex = Objects_Data6

Birdo_FireBallYVel:
	.byte $00, $03, $06, $09
	.byte $00, $FD, $FA, $F7

Birdo_Pal:
	.byte SPR_PAL1, SPR_PAL2

ObjInit_Birdo:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x32TALL
	STA Objects_BoundBox, X

	LDA #(ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_NOICE | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA RandomN
	AND #$03
	TAY

	LDA Birdo_ShootTimers, Y
	STA Objects_Timer, X

	LDA #$08
	STA Objects_ExpPoints, X

	LDA #$04
	STA Objects_Health, X
	STA Birdo_PrevHealth, X

	LDY Objects_Property, X

	LDA Birdo_Pal, Y
	STA Objects_SpriteAttributes, X
	STA Birdo_PalState, X
	RTS

Birdo_Walk:
	.byte $00, $0C, $00, $F4
	.byte $01, $01, $FF, $FF

Birdo_EggShoot:
	.byte $E0, $20

Birdo_ShootTimers:
	.byte $80, $C0, $A0, $E0

ObjNorm_Birdo:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Birdo1
	JMP Birdo_Draw

ObjNorm_Birdo1:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ObjNorm_Birdo2
	
	JMP Object_Draw16x32

ObjNorm_Birdo2:
	JSR Object_DeleteOffScreen

	LDA Objects_Health, X
	CMP Birdo_PrevHealth, X
	BEQ Birdo_NotHit

	LDA Birdo_HurtTimer, X
	BEQ Birdo_Hit
	
	LDA Birdo_PrevHealth, X
	STA Objects_Health, X
	JMP Birdo_NotHit

Birdo_Hit:
	LDA Objects_Health, X
	STA Birdo_PrevHealth, X
	
	LDA #$1F
	STA Birdo_HurtTimer, X
	STA Objects_Timer2, X

Birdo_NotHit:
	LDA Birdo_HurtTimer, X
	BEQ Birdo_CheckPause

	DEC Birdo_HurtTimer, X
	JMP ObjNorm_BirdoDraw

Birdo_CheckPause:
	LDA Birdo_Pause, X
	BNE Birdo_PauseShoot

Birdo_Waltz:
	INC Birdo_WalkTicker, X
	LDA Birdo_WalkTicker, X
	AND #$C0
	CLC
	ROL A
	ROL A
	ROL A
	TAY

	STA Birdo_TickIndex, X

	LDA Birdo_Walk, Y
	STA Objects_XVelZ, X 

	LDA Objects_Timer, X
	BEQ Birdo_ResetTimer
	
	JMP Birdo_Norm
	
Birdo_ResetTimer:
	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA Objects_XVelZ, X

	LDA #$02
	STA Birdo_Pause, X
	JMP Birdo_Norm

Birdo_PauseShoot:
	LDA Objects_Timer, X
	BNE Birdo_TryShoot

	LDA RandomN
	AND #$03
	TAY

	LDA Birdo_ShootTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA Birdo_Pause, X

Birdo_TryShoot:
	CMP #$08
	BNE Birdo_Norm

	LDA Objects_SpritesVerticallyOffScreen,X
	ORA Objects_SpritesHorizontallyOffScreen,X
	BNE Birdo_Norm

	LDY #$00
	LDA Objects_Orientation, X
	BEQ Birdo_EggNoFlip
	
	INY

Birdo_EggNoFlip:
	LDA Birdo_EggShoot, Y
	STA <Temp_Var16

	JSR SpecialObject_FindEmpty
	CPY #$FF
	BEQ Birdo_Norm

	LDA #$00
	STA SpecialObj_YVel,Y

	LDA Objects_Property, X
	BEQ Birdo_ShootEgg
	 
	LDA RandomN
	AND #$07
	TAX

	LDA Birdo_FireBallYVel, X
	STA SpecialObj_YVel,Y

	LDX <CurrentObjectIndexZ

	LDA #SOBJ_BIGFIREBALL
	BNE Birdo_Shoot

Birdo_ShootEgg:
	LDA #SOBJ_EGG

Birdo_Shoot:
	STA SpecialObj_ID,Y

	LDA #$10
	STA SpecialObj_Timer,Y

	LDA #$00
	STA SpecialObj_HurtEnemies, Y
	
	STA Egg_HitWall, Y

	LDA <Objects_XZ,X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ,X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ,X
	ADD #$00
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y

	LDA <Temp_Var16
	STA SpecialObj_XVel,Y

	LDA RandomN
	AND #$01
	BNE Birdo_Norm

	LDA #$28
	STA Objects_Timer, X

Birdo_Norm:
	JSR Object_Move
	JSR Object_CalcBoundBoxForced

	
	LDY Birdo_TickIndex, X
	LDA Birdo_Walk + 4,Y
	STA Objects_EffectiveXVel, X

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ Birdo_InteractPlayer

	LDA Birdo_WalkTicker, X
	ADD #$40
	AND #$C0
	STA Birdo_WalkTicker, X

Birdo_InteractPlayer:
	JSR Object_FacePlayer
	JSR Object_InteractWithPlayer

ObjNorm_BirdoDraw:
	LDA <Objects_XZ, X
	LSR A
	LSR A
	AND #$01
	ORA Birdo_Pause, X
	STA Objects_Frame, X

	LDA Birdo_HurtTimer, X
	BEQ Birdo_Draw

	EOR #$02
	AND #$02
	BEQ Birdo_Flash

	LDA Birdo_PalState, X

Birdo_Flash:
	STA Objects_SpriteAttributes, X

	LDA Objects_Frame, X
	AND #$01
	ORA #$04
	STA Objects_Frame, X
	JMP Object_Draw16x32

Birdo_Draw:
	JMP Object_Draw16x32

Birdo_HurtOrStand:
	LDA HitTest_Result
	AND #HITTEST_BOTTOM
	BEQ Birdo_Hurt

	LDA <Player_YVel
	BMI Birdo_StandRTS

	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$04
	BCS Birdo_Hurt
	
	LDA <Objects_YZ,X	 
	SUB #$1D
	STA <Player_Y

	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Player_YHi

	LDA #$00
	STA Player_InAir
	STA PlayerProj_YVelFrac
	STA <Player_YVel

	LDA <Objects_XVelZ, X
	STA Player_CarryXVel
	
Birdo_StandRTS:
	RTS

Birdo_Hurt:	
	JMP Player_GetHurt

ObjInit_Ninji:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA Objects_State, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #$20
	STA Objects_Timer, X
	RTS

Ninji_Frame = Objects_Data1
Ninji_Action = Objects_Data2
Ninji_HoldStar = Objects_Data3

ObjNorm_Ninji:
	LDA <Player_HaltGameZ
	BEQ Ninji_Norm

	JMP Ninji_Draw

Ninji_Norm:
	JSR Object_DeleteOffScreen 
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat
	
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Ninji_Grounded

	JSR Object_FacePlayer

Ninji_Grounded:
	JSR Ninji_DoAction

Ninji_Animate:
	LDA Ninji_Action, X
	BNE Ninji_Draw

	INC Ninji_Frame, X
	LDA Ninji_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Ninji_Draw:
	JSR Object_Draw

	LDA Ninji_HoldStar, X
	BEQ Ninji_DrawStar2

	LDA Objects_SpritesVerticallyOffScreen,X
	AND #SPRITE_0_VINVISIBLE
	BNE Ninji_DrawStar2

	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_0_HINVISIBLE
	BNE Ninji_DrawStar1

	LDA Objects_SpriteX, X
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	SUB #$0C
	STA Sprite_RAMY  + 8, Y

	LDA #$B9
	STA Sprite_RAMTile + 8, Y

	LDA #SPR_PAL3
	STA Sprite_RAMAttr + 8, Y

Ninji_DrawStar1:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_1_INVISIBLE
	BNE Ninji_DrawStar2
	
	LDA Objects_SpriteX, X
	ADD #$08
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X
	SUB #$0C
	STA Sprite_RAMY  + 12, Y

	LDA #$B9
	STA Sprite_RAMTile + 12, Y

	LDA #(SPR_PAL3 | SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAMAttr + 12, Y

Ninji_DrawStar2:
	RTS

Ninji_DoAction:
	LDA Ninji_Action, X
	JSR DynJump

	.word Ninji_Idle
	.word Ninji_Jump
	.word Ninji_Hover
	.word Ninji_ThrowStar
	.word Ninji_Fall

Ninji_Jumps: .byte $B0, $BC, $C8, $D4

Ninji_Idle:
	LDA Objects_Timer, X
	BNE Ninji_IdleDone

	INC Ninji_Action, X
	
	LDA RandomN, X
	AND #$03
	TAY

	LDA Ninji_Jumps, Y
	STA <Objects_YVelZ, X

	LDA #$01
	STA Objects_Frame, X
	STA Ninji_HoldStar, X

Ninji_IdleDone:
	RTS

Ninji_Jump:
	LDA <Objects_YVelZ, X
	BMI Ninji_JumpDone

	INC Ninji_Action, X

	LDA #$08
	STA Objects_Timer, X

Ninji_JumpDone:
	RTS

Ninji_Hover:
	LDA #$00
	STA <Objects_YVelZ, X

	LDA Objects_Timer, X
	BNE Ninji_HoverDone

	INC Ninji_Action, X

Ninji_HoverDone:
	RTS

Ninji_ThrowStar:
	LDA #$00
	STA Objects_Frame, X
	STA <Objects_YVelZ, X
	STA Ninji_HoldStar, X

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Ninji_ThrowDone

	JSR Object_PrepProjectile	

	LDA #SOBJ_NINJASTAR
	STA SpecialObj_ID,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$0C
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

Ninji_ThrowDone:
	INC Ninji_Action, X
	LDA #$00
	STA Objects_Frame, X
	RTS		 ; Return

Ninji_Fall:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Ninji_FallDone

	LDA #$60
	STA Objects_Timer, X
	
	LDA #$00
	STA Ninji_Action, X
	STA Objects_Frame, X

Ninji_FallDone:
	RTS

NinjiIdleTimes:
	.byte $30, $40, $38, $48
	


Magic_StarIndicator = Objects_Data4

ObjInit_MagicStar1:
	LDA #$00
	STA Magic_StarIndicator, X
	JMP ObjInit_MagicStar

ObjInit_MagicStar2:
	LDA #$01
	STA Magic_StarIndicator, X
	JMP ObjInit_MagicStar

ObjInit_MagicStar3:
	LDA #$02
	STA Magic_StarIndicator, X

ObjInit_MagicStar:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions
	JSR GetLevelBit

	STA <Temp_Var1
	STY <Temp_Var2
	
	LDA Magic_StarIndicator, X
	TAY

	LDA <Temp_Var2
	ADD MagicStarOffset, Y
	TAY

	LDA <Temp_Var1
	AND Magic_Stars_Collected1, Y
	BEQ Dont_Kill_Star

Kill_Star:
	JSR Object_Delete

Dont_Kill_Star:
	RTS		 ; Return	


MagicStarOffset:
	.byte $00, $10, $20

ObjNorm_MagicStar:
	LDA Objects_Property, X
	CMP #$07
	BEQ MagicStar_NoDelete

	JSR Object_DeleteOffScreen	

MagicStar_NoDelete:

	JSR Object_CalcBoundBox
	JSR Magic_Star_Action
	JSR Object_InteractWithPlayer

	JSR Object_DetectTiles
	JSR Object_CheckForeground

	JMP Object_DrawMirrored

Magic_StarCollect:
	LDA Sound_QLevel1
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	INC Magic_Stars

	JSR GetLevelBit

	STA <Temp_Var1
	STY <Temp_Var2

	LDA Magic_StarIndicator, X
	TAY

	LDA <Temp_Var2
	ADD MagicStarOffset, Y
	TAY

	LDA <Temp_Var1
	ORA Magic_Stars_Collected1, Y
	STA Magic_Stars_Collected1, Y

	JMP Object_SetDeadEmpty

Magic_Star_Action:
	LDA Objects_Property, X
	JSR DynJump

	.word ObjNorm_DoNothing
	.word MagicStar_NoFloat
	.word MagicStar_CheckEnemies
	.word MagicStar_CheckPSwitch
	.word MagicStar_CheckItemBlock
	.word MagicStar_CheckClearedBlock
	.word MagicStar_SpinnersActive
	.word MagicStar_NoFloat

MagicStar_CheckEnemies:
	LDY #$04

CheckEnemies:
	CPY <CurrentObjectIndexZ
	BEQ NoCheck

	LDA Objects_State, Y
	CMP #OBJSTATE_KILLED
	BCS NoCheck

	CMP #OBJSTATE_DEADEMPTY
	BNE Check_Done

NoCheck:
	DEY
	BPL CheckEnemies

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y
	JSR Common_MakePoof

	LDA #$01
	STA Objects_Property, X
	JMP MagicStar_NoFloat

Check_Done:
	PLA
	PLA
	RTS

MagicStar_CheckPSwitch:
	LDA Level_PSwitchCnt
	BNE MagicStar_CheckPSwitch1
	PLA
	PLA
	RTS

MagicStar_CheckPSwitch1:
	JMP Object_InteractWithTiles

MagicStar_NoFloat:
	LDA <Player_HaltGameZ
	BNE MagicStar_NoMove

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

MagicStar_NoMove:
	JMP Object_InteractWithTiles

MagicStar_CheckItemBlock:
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	AND #$3F
	BNE MagicStar_CheckItemBlock1

	LDA #$01
	STA Objects_Property, X

	LDA #$D0
	STA Objects_YVelZ, X

	LDA Objects_YZ, X
	SUB #$12
	STA Objects_YZ, X

	LDA Objects_YHiZ, X
	SBC #$00
	STA Objects_YHiZ, X
	RTS

MagicStar_CheckItemBlock1:
	PLA
	PLA
	RTS

MagicStar_CheckClearedBlock:
	JSR Object_DetectTileCenter
	
	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCS MagicStar_CheckItemBlock1

	LDA #$01
	STA Objects_Property, X
	RTS

MagicStar_SpinnersActive:
	LDY #$02
	LDX #$07

NextSpinnerCheck:
	LDA SpinnerBlocksActive, X
	BEQ NextSpinnerCheck1

	DEY
	BPL NextSpinnerCheck1

	LDX <CurrentObjectIndexZ

	LDA #$01
	STA Objects_Property, X

	LDA #SND_LEVELUNK
	STA Sound_QLevel1
	RTS

NextSpinnerCheck1:
	DEX
	BPL NextSpinnerCheck
	PLA
	PLA
	RTS

MagicStar_Radar:
	LDA Player_Equip
	SUB #ITEM_RADARNE
	BMI MagicStar_RadarRTS

	CMP #$09
	BCS MagicStar_RadarRTS
	LDA #$00
	STA <Temp_Var1
	JSR Object_XDistanceFromPlayer

	CMP #$00
	BEQ MagicStar_Radar1

	LDA EWBitMap, Y
	STA <Temp_Var1
	
MagicStar_Radar1:
	JSR Object_YDistanceFromPlayer
	CMP #$00
	BEQ MagicStar_Radar2

	LDA NSBitMap, Y
	ORA <Temp_Var1
	STA <Temp_Var1

MagicStar_Radar2:
	LDY <Temp_Var1
	LDA RadarMap, Y
	STA Player_Equip
	RTS

MagicStar_RadarRTS:
	RTS
EWBitMap:
	.byte $02, $01

NSBitMap:
	.byte $04, $08

RadarMap:
	.byte ITEM_RADAR, ITEM_RADARE, ITEM_RADARW, ITEM_RADAR
	.byte ITEM_RADARN, ITEM_RADARNE, ITEM_RADARNW, ITEM_RADAR
	.byte ITEM_RADARS, ITEM_RADARSE, ITEM_RADARSW	


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